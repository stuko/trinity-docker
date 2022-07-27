<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.XmlConfig.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
	String title = request.getParameter("title");
	String action = request.getParameter("action");
	String form = request.getParameter("form");
	String footer = request.getParameter("footer");
	String[] header = request.getParameter("header").split(",");

	String[] check = request.getParameter("check").split(",");
	String[] check_message = request.getParameter("check_message").split(",");
	String[] column = request.getParameter("column").split(",");
	String[] type = request.getParameter("type").split(",");
	String[] css = request.getParameter("css").split(",");
	String[] name = request.getParameter("name").split(",");
	String[] size = request.getParameter("size").split(",");
	String[] value = request.getParameter("value").split(",");
	String[] hidden_name = request.getParameter("hidden_name").split(",");
	String[] hidden_value = request.getParameter("hidden_value").split(",");

%>
<script language="javascript">
function fnRegister_<%=form%>(){
	<% for (int i = 0 ; i < check.length ; i++ ) {%>
		if(!<%=check[i]%>){
			alert('<%=check_message[i]%>');
			return;
		}
	<% } %>
	

	with(<%=form%>){
		<% for (int i = 0 ; i < column.length ; i++ ) {%>
		if(<%=name[i]%>.value == '' ){alert('Please enter a <%=column[i]%>.');return;}
		<% } %>
		submit();
	}
}
function fnReset_<%=form%>(){
	<%=form%>.reset();
}
</script>
<form id="<%=form%>" name="<%=form%>" action="<%=action%>" method="POST">
 <% for(int i=0; i < hidden_name.length; i++) {%><jsp:include page="/jsp/common/default-element.jsp" flush="false">
		<jsp:param value="hidden" name="type" />
		<jsp:param value="<%=hidden_name[i]%>" name="name" /> 
		<jsp:param value="<%=hidden_value[i]%>" name="value" />
	</jsp:include>
	<% }%>


<div>
 <div class="content-module-heading cf">
  <h3 class="fl">
  <%=title%>
  </h3>	
  <span class="fr">
   <input type="button" class="button white" name="Register" value="Save" onClick="javascript:fnRegister_<%=form%>();">
   <input type="button" class="button white" name="Reset" value="Cancel" onClick="javascript:fnReset_<%=form%>();">
  </span>
 </div>
</div>


<table class="table-neo">
   <thead>
   <% for(int i = 0; i < header.length ; i++) {%>
   <th><%=header[i]%></th>
	<% }%>
   </thead>
   <tbody>
   <% for(int i=0; i < column.length; i++) {%>
   <tr>
   <td><%=column[i]%></td>
   <td><jsp:include page="/jsp/common/default-element.jsp" flush="false">
		<jsp:param value="<%=type[i]%>" name="type" />
		<jsp:param value="<%=css[i]%>" name="css" />
		<jsp:param value="<%=name[i]%>" name="name" />
		<jsp:param value="<%=size[i]%>" name="size" />
		<jsp:param value="<%=value[i]%>" name="value" />
	</jsp:include></td>
   </tr>
	<% }%>
   </tbody>
   <tfoot>
   <td colspan="<%=header.length%>" class="tfoot-neo"><%=footer%></td>
   </tfoot>
 </table>
</form>
