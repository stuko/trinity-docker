<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"schedule");
out.println(bc.toXString());
%>
