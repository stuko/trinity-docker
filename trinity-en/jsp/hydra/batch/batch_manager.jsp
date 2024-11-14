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
DefaultXmlDataCollection col = dxr.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_SCHEDULE_BATCH);
%>
<script language="javascript">
function fn_SubmitScheduleBatch()
{
	with(frm_threadbatch)
	{
		code.value ="create";
		if(Sunday.checked == true)Sunday.value = 'Y'; 
		else Sunday.value = 'N';
		if(Monday.checked == true)Monday.value = 'Y'; 
		else Monday.value = 'N';
		if(Tuesday.checked == true)Tuesday.value = 'Y'; 
		else Tuesday.value = 'N';
		if(Wednesday.checked == true)Wednesday.value = 'Y'; 
		else Wednesday.value = 'N';
		if(Thursday.checked == true)Thursday.value = 'Y'; 
		else Thursday.value = 'N';
		if(Friday.checked == true)Friday.value = 'Y'; 
		else Friday.value = 'N';
		if(Saturaday.checked == true)Saturaday.value = 'Y'; 
		else Saturaday.value = 'N';
		callAjaxByForm("create", "frm_threadbatch");
	}
}
function fn_UpdateScheduleBatch()
{
	with(frm_threadbatch)
	{
		if(key.value  == '')
		{
			alert('After select a resource in list, modify it.');
			return;
		}
		code.value ="update";
		if(Sunday.checked == true)Sunday.value = 'Y'; 
		else Sunday.value = 'N';
		if(Monday.checked == true)Monday.value = 'Y'; 
		else Monday.value = 'N';
		if(Tuesday.checked == true)Tuesday.value = 'Y'; 
		else Tuesday.value = 'N';
		if(Wednesday.checked == true)Wednesday.value = 'Y'; 
		else Wednesday.value = 'N';
		if(Thursday.checked == true)Thursday.value = 'Y'; 
		else Thursday.value = 'N';
		if(Friday.checked == true)Friday.value = 'Y'; 
		else Friday.value = 'N';
		if(Saturaday.checked == true)Saturaday.value = 'Y'; 
		else Saturaday.value = 'N';
		callAjaxByForm("update", "frm_threadbatch");
	}
}
function fn_DeleteScheduleBatch()
{
	with(frm_threadbatch)
	{
		if(key.value  == '')
		{
			alert('After select a resource in list, delete it.');
			return;
		}		
		code.value ="delete";
		callAjaxByForm("delete", "frm_threadbatch");
	}
}
function fnSetScheduleBatchData(p_key,p_name,p_interval_type
		                       ,p_serviceName
		                       ,p_year
		                       ,p_month
		                       ,p_day
		                       ,p_hour
		                       ,p_minute
		                       ,p_sunday
		                       ,p_monday
		                       ,p_tuesday
		                       ,p_wednesday
		                       ,p_thursday
		                       ,p_friday
		                       ,p_saturaday)
{
	with(frm_threadbatch)
	{
		key.value = p_key; 
		o_name.value = p_name;
		o_interval_type.value = p_interval_type;
		o_serviceName.value = p_serviceName;
		o_year.value = p_year;
		o_month.value = p_month;
		o_day.value = p_day;
		o_hour.value = p_hour;
		o_minute.value = p_minute;
		if(p_sunday == 'Y') Sunday.checked = true;
		else Sunday.checked = false;
		if(p_monday == 'Y') Monday.checked = true;
		else Monday.checked = false;
		if(p_tuesday == 'Y') Tuesday.checked = true;
		else Tuesday.checked = false;
		if(p_wednesday == 'Y') Wednesday.checked = true;
		else Wednesday.checked = false;
		if(p_thursday == 'Y') Thursday.checked = true;
		else Thursday.checked = false;
		if(p_friday == 'Y') Friday.checked = true;
		else Friday.checked = false;
		if(p_saturaday == 'Y') Saturaday.checked = true;
		else Saturaday.checked = false;
		
	}
}

function doRuning(action)
{
}

function doRun(action,REQ)
{
	alert("Saved successfully.");
	document.location.reload();
}

function fn_FindBiz()
{
	window.open("/Anaconda.do?CMD=CMD_SEQ_109678783811287278764362&Object=opener.document.frm_threadbatch.o_serviceName&title=Search","FindBiz","height=400,width=560,left=200,top=20,status=no, location=no, toolbar=no, resizable=yes, scrollbars=yes");
}

function fn_create_service()
{
	document.location.href="/Anaconda.do?CMD=CMD_SEQ_107211261401287822755707";
}

</script>
<div class="post">

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Thread Batch</h3>
			
			</div>
		</div>
	</div>
</div>

<div>
<form name="frm_threadbatch" id="frm_threadbatch" method="post" action="/Anaconda.do?CMD=CMD_SEQ_109909577511345347283001">
<input type="hidden" name="code" value="">
<input type="hidden" name="key" value="">
<table class="table_hydra">
<tr>
   <td>Batch name</td><td><input type="text" class="styled" name="o_name" size="20"></td>
   <td>Period</td><td><select class="styled" name="o_interval_type" >
   <option value="1">Minute</option>
   <option value="2">Hour</option>
   <option value="3">Day</option>
   <option value="4">Month</option>
   <option value="5">Year</option>
   </select></td>
</tr>
<tr>
   <td>Execute time</td><td colspan="2"><input type="text" class="w20 styled" name="o_year" size="4" maxlength="4">Year
   <input type="text" class="styled" name="o_month" size="2" width="30%" maxlength="2">Month
   <input type="text" class="styled" name="o_day" size="2" width="30%"  maxlength="2">Day
   &nbsp;
   <input type="text" class="styled" name="o_hour" size="2"  width="30%" maxlength="2">Hour
   <input type="text" class="styled" name="o_minute" size="2"  width="30%" maxlength="2">Minute
   </td>
   <td colspan="3"></td>
</tr>
   <td>Select a day</td><td colspan="5">
   <input type="checkbox"  name="Sunday" value="Y">&nbsp;Sunday&nbsp;&nbsp;
   <input type="checkbox"  name="Monday" value="Y">&nbsp;Monday &nbsp;&nbsp;
   <input type="checkbox"  name="Tuesday" value="Y">&nbsp;Tuesday &nbsp;&nbsp;
   <input type="checkbox"  name="Wednesday" value="Y">&nbsp;Wednesday &nbsp;&nbsp;
   <input type="checkbox"  name="Thursday" value="Y">&nbsp;Thursday &nbsp;&nbsp;
   <input type="checkbox"  name="Friday" value="Y">&nbsp;Friday &nbsp;&nbsp;
   <input type="checkbox"  name="Saturaday" value="Y">&nbsp;Saturaday &nbsp;&nbsp;
   </td>
</tr>
<tr>
   <td>Batch service</td>
   <td colspan="5">
   <input type="text" class="styled" size="20" name="o_serviceName">&nbsp;<button type="button" class="btn btn-primary" value="Search business process" onclick="javascript:fn_FindBiz()">Search business process</button>
   &nbsp;
  <button type="button" class="btn btn-secondary" value="Create batch service" onclick="javascript:fn_create_service();">Create batch service</button>
   </td>
</tr>
</table>

<div style="margin:10px;">
<button type="button" class="btn btn-primary" value="Create a batch" name="" onclick="javascript:fn_SubmitScheduleBatch();">Create a batch</button>&nbsp;
<button type="button" class="btn btn-secondary" value="Modify a batch" name="" onclick="javascript:fn_UpdateScheduleBatch();">Modify a batch</button>&nbsp;
<button type="button" class="btn btn-danger" value="Delete a batch" name="" onclick="javascript:fn_DeleteScheduleBatch();">Delete a batch</button>&nbsp;</div>
</div>
</form>

<div style="margin:10px">
<table class="table_hydra">
<colgroup>
  <col width="30%">
  <col width="10%">
  <col width="60%">
</colgroup>
<thead>
<th scope="col">Batch name</th>
<th scope="col">Period</th>
<th scope="col">Service name</th>
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
	      <td><a href="javascript:fnSetScheduleBatchData('<%=dxd.getNAME()%>','<%=dxd.get("name")%>','<%=dxd.get("interval_type")%>','<%=dxd.get("serviceName") %>','<%=dxd.get("yyyy") %>','<%=dxd.get("MM") %>','<%=dxd.get("dd") %>','<%=dxd.get("HH") %>','<%=dxd.get("mm") %>','<%=dxd.get("Sunday") %>','<%=dxd.get("Monday") %>','<%=dxd.get("Tuesday") %>','<%=dxd.get("Wednesday") %>','<%=dxd.get("Thursday") %>','<%=dxd.get("Friday") %>','<%=dxd.get("Saturaday") %>');">
	          <%=dxd.get("name") %></a></td>
	      <td><%=dxd.get("interval_type") %></td>
	      <td><%=dxd.get("serviceName") %></td>
	   </tr>
	<%
	}
}
%>
</tbody>
</table>
</div>

</div>
