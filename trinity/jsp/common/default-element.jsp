<%@ page import="com.stuko.anaconda.business.*" %><%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %><%
	String type = request.getParameter("type");
	String css = request.getParameter("css");
	String name = request.getParameter("name");
	String size = request.getParameter("size");
	String value = request.getParameter("value");
	css = "hidden".equals(type) ? "" : css;
	size = "hidden".equals(type) ? "" : size;
	value = BusinessHelper.checkBusinessNull(value) ? value : "";
%><input type="<%=type%>" class="<%=css%>" name="<%=name%>" size="<%=size%>" value="<%=value%>" />