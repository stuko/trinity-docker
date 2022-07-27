<%--
  Created by IntelliJ IDEA.
  User: 1004lucifer
  Date: 2015. 3. 5.
  Time: 오후 9:51
--%>
<%@ page import="java.io.RandomAccessFile" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%

    String logPath = "/home/java/trinity/wayd-install/logs/MYLOG_IS_UNDEFINED/";
    logPath =  request.getParameter("log_path") == null ? logPath : request.getParameter("log_path");

    String fileName = request.getParameter("log_filename") == null ? "" : request.getParameter("log_filename");
 
    if ("".equals(fileName.trim()) == false) {
 
        fileName = logPath + fileName.trim().replaceAll("\\.\\.", "");
 
        long preEndPoint = request.getParameter("preEndPoint") == null ? 0 : Long.parseLong(request.getParameter("preEndPoint") + "");
 
        StringBuilder log = new StringBuilder();
        long startPoint = 0;
        long endPoint = 0;
 
        RandomAccessFile file = null;
        try {
            file = new RandomAccessFile(fileName, "r");
            endPoint = file.length();
 
            startPoint = preEndPoint > 0 ?
                    preEndPoint : endPoint < 2000 ?
                    0 : endPoint - 2000;
 
            file.seek(startPoint);
 
            String str;
            while ((str = file.readLine()) != null) {
                log.append(str);
                log.append("\n");
                endPoint = file.getFilePointer();
                file.seek(endPoint);
            }
 
        } catch (FileNotFoundException fnfe) {
            log.append("["+fileName +"] : File does not exist." + fnfe.toString());
            fnfe.printStackTrace();
        } catch (Exception e) {
            log.append("Sorry. An error has occurred. " + e.toString());
            e.printStackTrace();
        } finally {
            try {file.close();} catch (Exception e) {}
        }
 
        out.print("{\"endPoint\":\"" + endPoint + "\", \"log\":\"" + URLEncoder.encode(new String(log.toString().getBytes("ISO-8859-1"),"UTF-8"), "UTF-8").replaceAll("\\+", "%20") + "\"}");

    }
%>
