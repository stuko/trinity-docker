<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.XmlConfig.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script language="javascript">
function fnSelectTag(seq)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_105261055681332595700206&tag_key="+seq;
}
function fnRegisterTag()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_104396011971332595681993";
}
</script>
<form id="tag" name="tag" action="/Anaconda.do" method="POST">
</form>
<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Tagging List</h3>
			<span class="fr"><input type="button" class="button white" name="Register" value="Register" onClick="javascript:fnRegisterTag();"></span>
		</div>
	</div>
</div>

<div>
 <table class="table-neo">
   <thead class="th-neo">
   <td>태그</td><td>태그 이름</td>
  </thead>
  <tbody>
   
	<%
		BusinessCollection bc = RequestHelper.getBusinessCollection(request,"selectTagList");
							
		Iterator it = bc.iterator();
		for(int i = 0;it.hasNext();i++)
		{
			BusinessData bd = (BusinessData)it.next();
	%>
	<tr>
		<td ><a href="javascript:fnSelectTag('<%=bd.getFieldValue("TAG_KEY") %>');"><%=bd.getFieldValue("TAG_NAME") %></a></td>
		<td ><%=bd.getFieldValue("TAG_VALUE")%></td>
	</tr>
	<%
	}			 
	%>
	</tbody>
</table>
</div>

