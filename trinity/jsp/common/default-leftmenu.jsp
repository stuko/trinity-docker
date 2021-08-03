<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.XmlConfig.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
	String title = request.getParameter("title");
	String[] column = request.getParameter("column").split(",");
	String[] link = request.getParameter("link").split(",");
%>

<div class="side-menu">
	<h3><%=title%></h3>
	<ul>
		<% for(int i=0; i < column.length; i++) {%>
		<li><a href="<%=link[i]%>"><%=column[i]%></a></li>
		<% }%>
	</ul>
</div> <!-- end side-menu -->
