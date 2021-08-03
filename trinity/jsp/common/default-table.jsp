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
	String[] header = request.getParameter("header").split(",");
	String[] value = request.getParameter("value").split(",");
	String[] link = request.getParameter("link").split(",");
%>


<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl"><%=title%></h3>
			</div>
			<div class="content-module-main">
				<table class="table-neo">
				   <thead class="th-neo">
				   <% for(int i = 0; i < header.length ; i++) {%>
				   <td><%=header[i]%></td>
					<% }%>
				   </thead>
				   <tbody>
				   <% for(int i=0; i < column.length; i++) {%>
				   <tr>
				   <td class="td-neo"><%=column[i]%></td>
				   <td class="td-neo">
					<a href="<%=link[i]%>"><%=value[i]%></a>
				   </td>
				   </tr>
					<% }%>
				   </tbody>
				 </table>
			</div>
		</div>
	</div>
</div>
