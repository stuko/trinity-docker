<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.XmlConfig.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String code = request.getParameter("code");
	String message = request.getParameter("message");
	String title = request.getParameter("title");
	String return_link = request.getParameter("return_link");
	String return_message = request.getParameter("return_message");
	String alert_message = request.getParameter("alert_message");
	String redirect_link = request.getParameter("redirect_link");
%>
<% if(BusinessHelper.checkBusinessNull(alert_message)) {%>
<script language="javascript">
	alert("<%=alert_message%>");
</script>
<%}%>

<% if(!BusinessHelper.checkBusinessNull(redirect_link)) {%>
<script language="javascript">
function fnGoReturnLink()
{
	document.location.href="<%=return_link%>";
}
</script>
<div id="table-content">
	<div class="side-content">
	<div class="content-module">
		<div class="content-module-heading cf">
			<h3 class="fl"><%=title%></h3>
			<% if(BusinessHelper.checkBusinessNull(return_message)) {%>
			<span class="fr"><input type="button" class="button white" name="Register" value="<%=return_message%>" onClick="javascript:fnGoReturnLink();"></span>
			<%}%>
		</div> <!-- end content-module-heading -->
		<div class="content-module-main">
			<div class="information-box round">
			<% if(BusinessHelper.checkBusinessNull(message)) {%>
			<%=message%>
			<%}%>
			</div>
			<!--
			<div class="confirmation-box round">This is a confirmation box. It will resize based on 
			it’s contents.</div>
			
			<div class="error-box round">This is an error box. It will also resize based on it’s 
			contents.</div>
			
			<div class="warning-box round">This is a warning box. It will also resize based on 
			it’s contents.</div>
			-->	
		</div> <!-- end content-module-main -->
	</div> <!-- end content-module -->
	</div>
</div>
<%}else{%>
<script language="javascript">
	document.location.href="<%=redirect_link%>";
</script>
<%}%>
		
		
	