<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.XmlConfig.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<link type="text/css" rel="stylesheet" href="/jsp/hydra/calendar/dhtmlgoodies_calendar/dhtmlgoodies_calendar.css?random=20051112" media="screen"></LINK>
<SCRIPT type="text/javascript" src="/jsp/hydra/calendar/dhtmlgoodies_calendar/dhtmlgoodies_calendar.js?random=20060118"></script>


<script language="javascript">
function fnRoleList()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_105936135081332062289413";
}
function fnRegister()
{
	with(frmRole)
	{
		if(role_name.value == '') 
		{
			alert("역할 이름을 입력해주세요");
			return;
		}
		if(role_objective.value == '') 
		{
			alert("역할의 목표를 입력해 주세요");
			return;
		}
		submit();
	}
}
</script>

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Role Register</h3>
			<form id="team" name="team" action="/Anaconda.do" method="POST">
			<span class="fr"><input type="button" class="button white" name="Register" value="등록" onClick="javascript:fnRegister();"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="목록" onClick="javascript:fnRoleList();"></span>
			</div>
			</form>
		</div>
	</div>
</div>

<form id="frmRole" name="frmRole" action="/Anaconda.do" method="POST">
<input type="hidden" name="CMD" value="CMD_SEQ_108564965261332061660629">
<input type="hidden" name="code" value="create">

 <table class="table-neo">
   <thead class="th-neo">
   <td>이름</td>
   <td>값</td>
   </thead>
   <tbody>
	<tr>
		<td class="td-neo">역할 이름</td><td class="td-neo"><input type="text" name="role_name" size="50" maxlength="50" class="styled"></td>
	</tr>
	<tr>
			<td class="td-neo">목표</td><td class="td-neo"> <input type="text" name="role_objective" size="50" maxlength="50" class="styled"></td>
	</tr>
	</tbody>
</table>
</form>


