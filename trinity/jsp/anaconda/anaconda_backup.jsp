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
/**
// ---------------------------------------------------------------------------------------
// JSP 코딩 규칙
// ---------------------------------------------------------------------------------------

out.println((프로세스결과타입)RequestHelper.getReturnValue(request,"프로세스 이름"));
Object object = request.getAttribute(InitClass.getReturnValue());
Object session_object = request.getAttribute(InitClass.getSessionValue());
Object businss_object = request.getAttribute(InitClass.getBusinessDataValue());

out.println((프로세스결과타입)RequestHelper.getReturnValue(request,"프로세스 이름");
BusinessCollection bc = RequestHelper. getBusinessCollection(request,"프로세스 이름");
BusinessCollection bc = RequestHelper. getBusinessCollection(request,"프로세스 이름");
BusinessHelper helper = new BusinessHelper();
helper.convertToTableRow(bc);

for(int i = 0; i < bc.size(); i++)
{
     BusinessData bd = bc.getBusinessData(i);
}

**/
%>

<script language="javascript">

function search()
{
	with(frmAJAX)
	{
		code.value="search";
		callAjaxByForm("search","frmAJAX");				
	}
}
function recover(arg1)
{
	if(confirm('Do you really recover?'))
	{
		with(frmAJAX)
		{
			file_name.value = arg1;
			code.value="recover";
			callAjaxByForm("recover","frmAJAX");				
		}
	}
}
function view(arg1)
{
	with(frmAJAX)
	{
		target = '_new_source';
		file_name.value = arg1;
		code.value="view";
		callAjaxByForm("view","frmAJAX");				
	}
}
function doRuning(callerName)
{
	showRunning(callerName);
}

function doRun(callerName , REQ)
{
	if(callerName == "search")
	{
		var object = REQ.responseXML.getElementsByTagName("Response").item(0);
                //alert(object.nodeName);
                // alert(object.firstChild.nodeValue);
		if(object == null)
		{
			var resource_list = _("ResourceList");
			resource_list.innerHTML = "No Data";
		}
		else
		{
			var list = object.firstChild.nodeValue.split(',');
			var resource_list = _("ResourceList");
			resource_list.innerHTML = "";
			// var table = document.createElement("table");
			var table = document.createElement("div");
			for(var i = 0; i < list.length && i < 21 ; i++)
			{
			
				// var tr = document.createElement("tr");
				// var td = document.createElement("td");
				var td = document.createElement("div");
				var idx = list[i].indexOf(".xml");
				var yyyyMMdd = "";
				if(idx > 0)
				{
					yyyyMMdd = list[i].substring(idx+4+1,idx+19);
				}

				yyyyMMdd = yyyyMMdd.substring(0,4) + '년'
						+  yyyyMMdd.substring(4,6) + '월'
						+  yyyyMMdd.substring(6,8) + '일 '
						+  yyyyMMdd.substring(8,10) + '시'
						+  yyyyMMdd.substring(10,12) + '분'
						+  yyyyMMdd.substring(12,14) + '초'

				td.innerHTML = '<div class="content-module-heading cf"><a target="_new" href="/Anaconda.do?CMD=CMD_SEQ_106594560501498179923551&path=/back/'+list[i]+'">' 
					+ '<h4 class="fl">' + list[i] +'</h4></a><span class="fr"><input type=\'button\' value=\'Recover\' class=\'button red\' onclick="javascript:recover(\''+list[i]+'\');"></span></div>';
				// tr.appendChild(td);
				table.appendChild(td);
				//alert(table.innerHTML);
			}
			
			resource_list.appendChild(table);
			// alert(resource_list.innerHTML);
			// resource_list.style.height = list.length * 50 + 'px';
			// alert(list.length);
		} 

	}
	else if(callerName == "search")
	{
		alert("Recovered.");
	}
	else if(callerName == 'view')
	{
		var object = getAJAXResponse(REQ.responseXML);
		alert(object);
	}
}

</script>
<form name="frmAJAX" id="frmAJAX" method="POST" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_101012495151361075445670">
<input type="hidden" name="code" value="">
<input type="hidden" name="key" value="">
<input type="hidden" name="file_name" value="">

<div class="post">
<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Recovery</h3>
		</div>
	</div>
</div>

<div>
<table class="table_hydra" cellspacing="1" cellpadding="1">
		<caption></caption>
		<colgroup>
		<col width="20%">
		<col>
		</colgroup>
		<thead >
		<tr>
		<th scope="col">Name</th>
		<th scope="col">Value</th>
		</tr>
		</thead>
		<tbody id="tBodyRES">
		<tr>
		<td>Datetime</td>
		<td><input type="text" class="styled" name="yyyyMMdd">(yyyyMMddHHmmss or file name)</td>
		</tr>
		<tr>
		<tr>
		<td>Type</td>
		<td>
		<SELECT NAME='tail'>
			  <OPTION value=''>ALL</OPTION>
			  <OPTION value='WEB'>Web Action</OPTION>
			  <OPTION value='BIZ'>Service</OPTION>
			  <OPTION value='VIEW'>View files</OPTION>
		</SELECT>
		</tr>
		<tr>
		<td colspan="2"><input <input type="button" class="button white"  value="Search"  onClick="javascript:search();"></td>
		</tr>
		</tbody>
</table>
</div>

<div>
<p></p> 
<p style="color:black;">Resources list</p>
<div id="ResourceList" style="width:700px; margin-bottom:40px; margin-left:5px; margin-right:60px; margin-top:5px;font:bold 12px 돋움체 ;color:blue;">

</div>
</div>
</form>
</div>

<script language="javascript">
// getRuleList();
</script>
