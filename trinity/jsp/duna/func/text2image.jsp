<%@page language="java" trimDirectiveWhitespaces="true"%>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.openapi.*"%>
<%@ page import="com.stuko.anaconda.util.*"%>
<%@page contentType="image/png" %>
<%
  OutputStream o = null;
  InputStream is = null;
  URLConnection urlcon = null;
  try{
    ReturnValue rv = (ReturnValue)request.getAttribute(InitClass.getReturnValue());
    String path = (String)rv.getReturnObject("textImage");
    o = response.getOutputStream();
    String text = request.getParameter("text");
    File f = new File(path);
    is = new FileInputStream(f);
    byte[] buf = new byte[32 * 1024]; // 32k buffer
    int nRead = 0;
    while( (nRead=is.read(buf)) != -1 ) {
      o.write(buf, 0, nRead);
    }
    o.flush();
    o.close();// *important* to ensure no more jsp output
    o = null;
  }catch(Exception e){
    try{if( is != null ) is.close(); } catch(Exception ee) {}   
    try{if( o != null ) o.close(); } catch(Exception ee) {}
    // try{if( urlcon != null ) urlcon.close(); } catch(Exception ee) {}
  }
  
%>
