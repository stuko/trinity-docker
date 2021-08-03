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
String member_id = "";
if(session.getAttribute(InitClass.getSESSION_DOMAIN()) != null)
{
	Object object = session.getAttribute(InitClass.getSESSION_DOMAIN());
	IAuth auth = (IAuth)object;
	member_id = auth.getAuthItem(("MEMBER_NAME"));
}

String subject = "License info List";
%>
<div class="wrapper wrapper-content">
<div>
 <div class="content-module-heading cf">
  <h3 class="fl">
  <%=subject %>
  </h3>	
 </div>
</div>


<table class="table-neo">
   <thead class="th-neo">
   <td>Date Time</td>
   <td>Title or Subject</td>
   </thead>
   <tbody>
<% 
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getLicList");
if(bc != null && bc.size() > 0)
{
	Iterator it = bc.iterator();
	for(int i = 1;it.hasNext();i++)
	{
		BusinessData bd = (BusinessData)it.next();
		
		String strDate = bd.getFieldValue("REG_DT");
		strDate =strDate.substring(0,4) + "." + strDate.substring(4,6) +"." + strDate.substring(6,8) +" " + strDate.substring(8,10) +":" + strDate.substring(10,12) +":" + strDate.substring(12,14);
		String strTitle = BusinessHelper.getSubString(bd.getFieldValue("XT_KEY"),50,"...");
	%>
	<tr>
	<td><font style="color:black">&nbsp;&nbsp;<%=strDate %></font></td>
	<td><%=strTitle %></td>
	</tr>
	<%
	}
}
%>
	</tbody>
</table>
