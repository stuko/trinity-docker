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
function getRuleList()
{
	with(frmAJAX)
	{
		code.value="list";
		callAjaxByForm("list","frmAJAX");				
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
			var tbody = _("rule_list");
			var tr = document.createElement("tr");
			var td = document.createElement("td");
			td.innerHTML = "데이터가 존재 하지 않습니다";
			tr.appendChild(td);
			tbody.appendChild(tr);
		}
		else
		{
			var len = parseInt(object.length);
			if(len > 0)
			{
				bindData(object.response,"rule_list");
			}
			else
			{
				alert("에러 발생");
			}
		}
	}
	else 
	{
		alert("보여줄 화면이 없습니다.");
	}
}

</script>
<form name="frmAJAX" id="frmAJAX" method="POST" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_109860947731350086364953">
<input type="hidden" name="code" value="">
</form>


<div class="post">

<div class="title-right">
<h2><font><b>Rule Management</b></font>
</div>
<br>
<div id="create" style="display:block;">
<form name="frmAJAXCreate" id="frmAJAXCreate" method="POST" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_109860947731350086364953">
<input type="hidden" name="code" value="create">




<div id="condition" style="display:block">
<table width="100%" border="1px">
	<tr>
	<td>조건
	<br>
	<input type="radio" name="condition"> AND <input type="radio" name="condition"> OR
	
	</td>
    <td>
	<table width="100%" border="1px">	
		<tr>
			<td>누가</td>
			<td> 
			<select class="styled" id="c_who" name="c_who">
				<option value="">회원</option>
				<option value="">회원</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>언제</td>
			<td>
			<input type="text"  class="styled" name="start_dt"> ~ <input type="text" class="styled" name="end_dt"> &nbsp(yyyymmddhhmmss) <br>
			<select class="styled" id="c_who" name="c_who">
				<option value="">요청전</option>
				<option value="">요청후</option>
				<option value="">응답전</option>
				<option value="">응답후</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>어디서(the point of rule) </td>
			<td>
				사이트 : 
			<select class="styled" id="c_who" name="c_who">
				<option value="">www.bestmember.net</option>
				<option value="">요청후</option>
				<option value="">응답전</option>
				<option value="">응답후</option>
			</select>
			<br>
				요청전 화면 : 
			<select class="styled" id="c_who" name="c_who">
				<option value="">메인화면</option>
				<option value="">요청후</option>
				<option value="">응답전</option>
				<option value="">응답후</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>무엇을</td>
			<td> 
				요청 화면 : 
			<select class="styled" id="c_who" name="c_who">
				<option value="">메인화면</option>
				<option value="">요청후</option>
				<option value="">응답전</option>
				<option value="">응답후</option>
			</select>
			
			</td>
		</tr>
	</table>
	</td>
	</tr>
</table>

</div>
<br>



<div>
<input type="button" class="button gray" value="조건 추가">
</div>
<br>

<div id="condition" style="display:block">
<table width="100%" border="1px">
	<tr>
	<td>결과
	</td>
    <td>
	<table width="100%" border="1px">	
		<tr>
			<td>프로세스</td>
			<td> 
			<select class="styled" id="c_who" name="c_who">
				<option value="">회원가입 프로세스</option>
				<option value="">회원</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>화면 이동</td>
			<td>
			<select class="styled" id="c_who" name="c_who">
				<option value="">이벤트 화면</option>
				<option value="">요청후</option>
				<option value="">응답전</option>
				<option value="">응답후</option>
			</select>
			</td>
		</tr>
	</table>
	</td>
	</tr>
</table>

</div>

<br>


<table class="table_hydra" cellspacing="1" cellpadding="3">
<caption></caption>
<colgroup>
<col width="10%">
<col width="30%">
<col width="10%">
<col width="10%">
<col width="10%">
<col width="15%">
<col width="15%">
<col width="10%">
</colgroup>
<thead >
</thead>
<tBody>
<tr>
<td>Rule Name</td><td><input type="text" class="styled" size="10" name="RULE_NAME" value=""></td><td>Rule Desc.</td><td><input type="text" class="styled" size="10" name="RULE_DESC" value=""></td><td></td><td></td>
<td>Rule Behavior Type</td>
<td>
<select name="R_WHAT_TYPE"  class="styled" id="R_WHAT_TYPE">
<option name="" value="1">Execute</option>
<option name="" value="2">Move</option>
<option name="" value="3">Decide</option>
</select>
</td>
</tr>
<tr>
<td>WHO</td><td>
TYPE :&nbsp; 
<select name="R_WHO_TYPE" id="R_WHO_TYPE" class="styled" >
<option name="" value="1">Session</option>
<option name="" value="2">Cookie</option>
<option name="" value="3">Request</option>
<option name="" value="4">Reserved Function</option>
</select>
<br>
VALUE :
<input type="text" name="R_WHO" class="styled" size="20">
</td>
<td>WHEN</td><td>
<select name="R_WHEN" id="R_WHEN">
<option name="" value="1">Execute</option>
<option name="" value="2">Move</option>
<option name="" value="3">Decide</option>
</select>
</td>
<td>WHERE</td><td>
<select name="R_WHERE" id="R_WHERE">
<option name="" value="1">Execute</option>
<option name="" value="2">Move</option>
<option name="" value="3">Decide</option>
</select>
</td>
<td>WHAT</td><td>
<select name="R_WHAT" id="R_WHAT">
<option name="" value="1">Execute</option>
<option name="" value="2">Move</option>
<option name="" value="3">Decide</option>
</select>
</td>
</tr>
</tBody>
</table>
</form>
</div>

<br>

<div>
<table class="table_hydra" cellspacing="0" cellpadding="0">
<tBody id="rule_list">
</tBody>
</table>
</div>

</div>
<script language="javascript">
getRuleList();
</script>
