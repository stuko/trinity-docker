<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.filter.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.action.*"%>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
DefaultXmlResource dxr = DefaultXmlResource.getInstance();
DefaultXmlDataCollection col = dxr.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_ONLINE_BATCH);
%>
<script language="javascript">
function fn_SubmitOnlineBatch()
{
	with(frm_onlinebatch)
	{
		code.value ="create";
		callAjaxByForm("create", "frm_onlinebatch");
	}
}
function fn_UpdateOnlineBatch()
{
	with(frm_onlinebatch)
	{
		if(key.value  == '')
		{
			alert('You have to choice a resource.');
			return;
		}
		code.value ="update";
		callAjaxByForm("update", "frm_onlinebatch");
	}
}
function fn_DeleteOnlineBatch()
{
	with(frm_onlinebatch)
	{
		if(key.value  == '')
		{
			alert('Please delete after select a resource in list.');
			return;
		}		
		code.value ="delete";
		callAjaxByForm("delete", "frm_onlinebatch");
	}
}
function fnSetOnlineBatchData(p_key,p_name,p_interval,p_jndi,div_name)
{
	with(frm_onlinebatch)
	{
		key.value = p_key; 
		o_name.value = p_name;
		o_interval.value = p_interval;
		o_jndi.value = p_jndi;
		o_sql.value = _(div_name).innerHTML;
	}
}

function doRuning(action)
{
}

function doRun(action,REQ)
{
	alert("Applied successfully.");
	document.location.reload();
}
</script>
<div class="post">
<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">SQL Cache</h3>
			</div>
		</div>
	</div>
</div>



<div>
<form name="frm_onlinebatch" id="frm_onlinebatch" method="post" action="/Anaconda.do?CMD=CMD_SEQ_105554100871345260590128">
<input type="hidden" name="code" value="">
<input type="hidden" name="key" value="">
<table class="table_hydra">
<tr>
   <td>Cache name</td><td><input type="text" class="styled" name="o_name" size="20"></td>
   <td>Execution period</td><td><input type="text" class="styled" name="o_interval" size="10"> (millisec)</td>
   <td>JNDI name</td><td><input type="text" class="styled" name="o_jndi" size="10"></td>
</tr>
<tr>
   <td>SQL</td><td  colspan="5">
   <textarea class="styled" style="height:100px;" name="o_sql" id="o_sql" cols="100" rows="5"></textarea> 
  </td>
</tr>
</table>
<div style="margin:10px;">
<button type="button" class="btn btn-primary" value="Create a cache" name="" onclick="javascript:fn_SubmitOnlineBatch();">Create a cache</button>&nbsp;
<button type="button" class="btn btn-secondary" value="Modify a cache" name="" onclick="javascript:fn_UpdateOnlineBatch();">Modify a cache</button>&nbsp;
<button type="button" class="btn btn-danger" value="Delete a cache" name="" onclick="javascript:fn_DeleteOnlineBatch();">Delete a cache</button></div>
</div>
</form>

<div style="margin:10px">
<table class="table_hydra">
<colgroup>
  <col width="20%">
  <col width="20%">
  <col width="20%">
  <col width="40%">
</colgroup>
<thead>
<th scope="col">Name</th>
<th scope="col">Period</th>
<th scope="col">JNDI</th>
<th scope="col">SQL</th>
</thead>
<tbody>
<%
if(col != null && col.size() > 0)
{
	Iterator it = col.iterator();
	for(int i = 0;it.hasNext();i++)
	{
		DefaultXmlData dxd = (DefaultXmlData)it.next();
		String strDivName = "div_sql_" + i;
	%>
	   <tr>
	      <td><a href="javascript:fnSetOnlineBatchData('<%=dxd.getNAME()%>','<%=dxd.get("name")%>','<%=dxd.get("interval")%>','<%=dxd.get("jndi") %>','<%=strDivName%>');"><%=dxd.get("name") %></a></td>
	      <td><%=dxd.get("interval") %></td>
	      <td><%=dxd.get("jndi") %></td>
	      <td><div id='<%=strDivName%>'><%=dxd.getFieldValue("SQL") %></div></td>
	   </tr>
	<%
	}
}
%>
</tbody>
</table>
</div>

</div>
