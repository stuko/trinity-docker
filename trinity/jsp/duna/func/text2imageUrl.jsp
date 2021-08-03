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
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  try{
    ReturnValue rv = (ReturnValue)request.getAttribute(InitClass.getReturnValue());
    String path = (String)rv.getReturnObject("textImage");
    String base = InitClass.getInstance().getPath(InitClass.ROOT);
    String relative = new File(base).toURI().relativize(new File(path).toURI()).getPath();    
    // out.println("http://app.socialproject.net/"+relative);
    out.println(path);
  }catch(Exception e){
  }
  
%>
