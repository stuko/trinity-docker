<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.*"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.openapi.*"%>
<%@ page import="com.stuko.anaconda.util.*"%>
<%
//BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getList");
//if ("POST".equalsIgnoreCase(request.getMethod())){
   System.out.println("###################");
   System.out.println("RECEIVED");
   System.out.println("###################");
   String test = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
   out.println(test);
   System.out.println("###################");
   System.out.println(test);
   System.out.println("###################");
//}
out.println("SUCCESS2");
%>
