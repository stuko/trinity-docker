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
function fn_FindBiz()
{
	window.open("/Anaconda.do?CMD=CMD_SEQ_109678783811287278764362&title=Search&Object=opener.document.frmAJAX.rule_execute","FindBiz","height=400,width=560,left=200,top=20,status=no, location=no, toolbar=no, resizable=yes, scrollbars=yes");
}
function getRuleList()
{
	with(frmAJAX)
	{
		code.value="list";
		callAjaxByForm("list","frmAJAX");				
	}
}
function read(arg1)
{
	with(frmAJAX)
	{
		key.value = arg1;
		code.value="read";
		callAjaxByForm("read","frmAJAX");				
	}
}
function remove()
{
	if(confirm('Really delete?'))
	{
		with(frmAJAX)
		{
			code.value="delete";
			callAjaxByForm("delete","frmAJAX");				
		}
	}
}
function create()
{
	if(confirm('Really create?'))
	{

		with(frmAJAX)
		{
			if(from.value == ''){alert('Enter a rule info');return;}
			if(to.value == ''){alert('Enter a rule info');return;}
			if(factor_name.value == ''){alert('Enter a rule info');return;}
			if(alias.value == ''){alert('Enter a rule info');return;}
			if(rule_desc.value == ''){alert('Enter a rule info');return;}
			if(rule_target.value == ''){alert('Enter a rule info');return;}
			if(rule_express.value == ''){alert('Enter a rule info');return;}
			if(rule_execute.value == ''){alert('Enter a rule info');return;}
			if(rule_class.value == ''){alert('Enter a rule info');return;}

			code.value="create";
			callAjaxByForm("create","frmAJAX");				
		}
	}
}
function update()
{
	if(confirm('Really modify?'))
	{

		with(frmAJAX)
		{
			if(from.value == ''){alert('Enter a rule info');return;}
			if(to.value == ''){alert('Enter a rule info');return;}
			if(factor_name.value == ''){alert('Enter a rule info');return;}
			if(alias.value == ''){alert('Enter a rule info');return;}
			if(rule_desc.value == ''){alert('Enter a rule info요');return;}
			if(rule_target.value == ''){alert('Enter a rule info');return;}
			if(rule_express.value == ''){alert('Enter a rule info');return;}
			if(rule_execute.value == ''){alert('Enter a rule info');return;}
			if(rule_class.value == ''){alert('Enter a rule info');return;}

			code.value="update";
			callAjaxByForm("update","frmAJAX");				
		}
	}
}
function doRuning(callerName)
{
	showRunning(callerName);
}

function doRun(callerName , REQ)
{
	if(callerName == "list")
	{
		var object = parseAnacondaAJAX(REQ.responseXML);
		if(object.length == "0")
		{
			var rule_list = _("RuleList");
			rule_list.innerHTML = "No data";
		}
		else
		{
			var len = parseInt(object.length);
			var list = document.createElement("div");
			var ul = document.createElement("ul");
			list.appendChild(ul);
			var rule_list = _("RuleList");
			rule_list.innerHTML = "";
			for(var i = 0; i < len; i++)
			{
				var li = document.createElement("div");
				li.innerHTML = '<li>&nbsp;&nbsp;<a href="javascript:read(\''+object.response[i].nodeName+'\');">' + object.response[i].RuleAlias +'</a>';
				ul.appendChild(li);
			}
			rule_list.appendChild(list);
		}
	}
	else if(callerName == "create")
	{
		getRuleList();
	}
	else if(callerName == "read")
	{
		var object = parseAnacondaAJAX(REQ.responseXML);
		if(object.length == "0")
		{
			alert('No data.');
		}
		else
		{
			with(frmAJAX)
			{
				key.value = object.response[0].nodeName;
				from.value = object.response[0].from;
				to.value = object.response[0].to;
				factor_name.value = object.response[0].RuleName;
				alias.value = object.response[0].RuleAlias;
				rule_desc.value = object.response[0].RuleDesc;
				rule_target.value = object.response[0].RuleTarget;
				for(var i = 0 ; i < rule_express.options.length ; i++)
				{
					if(rule_express.options[i].value == object.response[0].express)
						rule_express.options[i].selected = true;
				}
				rule_execute.value = object.response[0].execute;
				rule_class.value = object.response[0].RuleClass;
			}
		}
	}
	else if(callerName == "update")
	{
		alert("Updated successfully.");
	}
	else if(callerName == "delete")
	{
		alert("Deleted successfully.");
		getRuleList();
	}
}

</script>
<form name="frmAJAX" id="frmAJAX" method="POST" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_103800779351360588180219">
<input type="hidden" name="code" value="">
<input type="hidden" name="key" value="">

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Rule</h3>
			
			</div>
		</div>
	</div>
</div>

<div>
<table class="table_hydra" cellspacing="1" cellpadding="1">
		<caption></caption>
		<colgroup>
		<col width="30%">
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
		<td>When?</td>
		<td><input type="text" class="styled" size="15" name="from">&nbsp;(yyyyMMddHHmmss) ~ <input type="text"  size="15" class="styled" name="to">&nbsp;(yyyyMMddHHmmss)</td>
		</tr>
		<tr>
		<td>Rule name</td>
		<td><input type="text" class="styled" name="alias" size="50"></td>
		</tr>
		<tr>
		<td>Rule description</td>
		<td><input type="text" class="styled" name="rule_desc" size="50"></td>
		</tr>
		<tr>
		<td>Rule factor name</td>
		<td><input type="text" class="styled" name="factor_name" size="50"></td>
		</tr>
		<tr>
		<td>Rule compare value</td>
		<td><input type="text" class="styled" name="rule_target" size="50"></td>
		</tr>
		<tr>
		<td>Rule condition</td>
		<td>
		<SELECT NAME='rule_express'>
			  <OPTION value='='>=</OPTION>
			  <OPTION value='>'>></OPTION>
			  <OPTION value='<'><</OPTION>
			  <OPTION value='>='>=</OPTION>   
 			  <OPTION value='<='><=</OPTION>
			  <OPTION value='!='>!=</OPTION>
			  <OPTION value='reg'>reg</OPTION>
		</SELECT>(ex:=,<,>,!=,reg)
		</tr>
		<tr>
		<td>Rule factor name(service.XXXX)<br> Executable service</td>
		<td><input type="text" class="styled" name="rule_execute" size="50"><button type="button" class="btn btn-primary" value="Search a service"  style="width:200px" onClick="javascript:fn_FindBiz();">Search a service</button></td>
		</tr>
		<tr>
		<td>Rule factor name(service.XXXX)<br>POJO class</td>
		<td><input type="text" class="styled" name="rule_class" size="50">(ex:com.stuko.anaconda.prms.util.SimpleServiceRuler)</td>
		</tr>
		<tr>
		<td colspan="2"><button type="button" class="btn btn-primary" value="Create a rule"  style="width:200px" onClick="javascript:create();">Search a service</button>&nbsp;<button type="button" class="btn btn-secondary" value="Modify a rule"  style="width:200px" onClick="javascript:update();">Modify a rule</button>&nbsp;<button type="button" class="btn btn-danger" value="Delete a rule"  style="width:200px" onClick="javascript:remove();">Delete a rule</button></td>
		</tr>
		</tbody>
</table>
</div>
<p></p>
<h1>Rule List</h1>
<div id="RuleList" style="margin-left:5px;margin-top:5px;font:bold 12px 돋움체 ;color:blue;">

</div>
</form>
<script language="javascript">
getRuleList();
</script>
