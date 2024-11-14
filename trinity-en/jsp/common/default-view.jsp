<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.XmlConfig.*" %>
<%@ page import="com.stuko.anaconda.service.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %><%

	BusinessCollection bc = null;
	String jsp_path = request.getParameter("jsp_path");

	if(BusinessHelper.checkBusinessNull(jsp_path))
	{
%>
<jsp:include page="<%=jsp_path%>">
	<jsp:param name="title" value='<%=request.getParameter("title")%>' />
	<jsp:param name="view_col_name" value='<%=request.getParameter("view_col_name")%>' />
	<jsp:param name="view_proc_name" value='<%=request.getParameter("view_proc_name")%>' />
        <jsp:param name="header" value='<%=request.getParameter("header")%>' />	
        <jsp:param name="column" value='<%=request.getParameter("column")%>' />
	<jsp:param name="view_parameter_name" value='<%=request.getParameter("view_parameter_name")%>' />
	<jsp:param name="view_parameter_value" value='<%=request.getParameter("view_parameter_value")%>' />
	<jsp:param name="view_parameter_type" value='<%=request.getParameter("view_parameter_type")%>' />
	<jsp:param name="view_direction" value='<%=request.getParameter("view_direction")%>' />
	<jsp:param name="show_bit" value='<%=request.getParameter("show_bit")%>' />
	<jsp:param name="link_bit" value='<%=request.getParameter("link_bit")%>' />
	<jsp:param name="link" value='<%=request.getParameter("link")%>' />
</jsp:include>
<%
	}
	else
	{
			String view_col_name = request.getParameter("view_col_name");
			String view_proc_name = request.getParameter("view_proc_name");
			String[] header = request.getParameter("header").split(",");
                        String[] column = request.getParameter("column").split(",");
			String[] view_parameter_name = request.getParameter("view_parameter_name").split(",");
			String[] view_parameter_value = request.getParameter("view_parameter_value").split(",");
			String[] view_parameter_type = request.getParameter("view_parameter_type").split(",");
			String[] show_bit = request.getParameter("show_bit").split(",");
			String[] link_bit = request.getParameter("link_bit").split(",");
			String title = request.getParameter("title");
			String direction = request.getParameter("view_direction");
			String link = request.getParameter("link");

			BusinessData param = new BusinessData();
			for(int i = 0; i < view_parameter_name.length; i++){
				param.setFieldValue(view_parameter_name[i],view_parameter_type[i],view_parameter_value[i]);
			}
			BizLogicXmlResource biz = BizLogicXmlResource.getInstance();
			BusinessData process = biz.searchBusinessDataEqualsServiceName(view_col_name,view_proc_name);
			TrinityService service = new TrinityService();
			ReturnValue rv = service.invokeDirectly(process,param);
			if(rv.mBRtn){
				bc = (BusinessCollection)rv.mORtn;
			}
			if(bc != null){

				String param_connect = link.indexOf("?") >= 0 ? "&" : "?";
		%>
		<div id="table-content">
			<div class="side-content">
				<div class="content-module">
					<div class="content-module-heading cf">
					<h3 class="fl"><%=title%></h3>
					</div>
				</div>
			</div>
		</div>

		<table>
		   <thead>
			<% for(int i = 0; i < header.length ; i++) {%>
				 <% if("1".equals(show_bit[i])){%><th><%=header[i]%></th><%}%>
			<% }%>
		   </thead>
		   <tbody>
		   <% for(int i=0; i < bc.size(); i++) {%>
		   <% if("h".equals(direction)){%><tr><%}%>
		   <%
					BusinessData bd = bc.getBusinessData(i);
					 link = request.getParameter("link");
					for(int j = 0; j < bd.size(); j++){
			%>
				   <% if("v".equals(direction)){%><tr><%}%>
		   		   <% if("1".equals(show_bit[j])){%><td><% if("1".equals(link_bit[j])){%>
				   <%
				   {
						link = link + param_connect + column[j] + "=" + bd.getFieldValue(j);
				   }
				   %>
				   <a href="<%=link%>"><%}%><%=bd.getFieldValue(j)%><% if("1".equals(link_bit[j])){%></a><%}%></td><%}%>
				   <% if("v".equals(direction)){%></tr><%}%>
				<% } %>
			 <% if("h".equals(direction)){%></tr><%}%>
			<% }%>
		   </tbody>
		 </table>
		<%}%>
	<%}%>
