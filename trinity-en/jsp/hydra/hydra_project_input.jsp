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
function fnProjectList()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_104651175361332065328722";
}
function fnRegister()
{
	with(frmProject)
	{
		if(project_title.value == '') 
		{
			alert("프로젝트 이름을 입력해주세요");
			return;
		}
		if(project_objective.value == '') 
		{
			alert("프로젝트의 목표를 입력해 주세요");
			return;
		}
		if(project_opportunity.value == '') 
		{
			alert("프로젝트의 기회를 입력해 주세요");
			return;
		}
		if(project_start_date.value == '') 
		{
			alert("프로젝트의 시작일을 입력해 주세요");
			return;
		}
		if(project_end_date.value == '') 
		{
			alert("프로젝트의 종료일을 입력해 주세요");
			return;
		}
		
		/*if(project_pm.value == '') 
		{
			alert("프로젝트 관리자 정보를 입력해 주세요");
			return;
		}*/
		submit();
	}
}
</script>
<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Project Register</h3>
			<form id="team" name="team" action="/Anaconda.do" method="POST">
			<span class="fr"><input type="button" class="button white" name="Register" value="등록" onClick="javascript:fnRegister();"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="목록" onClick="javascript:fnProjectList();"></span>
			</div>
			</form>
		</div>
	</div>
</div>


<form id="frmProject" name="frmProject" action="/Anaconda.do" method="POST">
<input type="hidden" name="CMD" value="CMD_SEQ_109031910291332066986730">
<input type="hidden" name="code" value="create">

  <table class="table-neo">
   <thead class="th-neo">
   <td>이름</td>
   <td>값</td>
   </thead>
   <tbody>
		<tr>
				<td class="td-neo"><b>프로젝트 이름</b> </td><td class="td-neo">
		<input type="text" name="project_title" size="50" maxlength="50" class="styled"></td>
				</tr>
		<tr>
				<td class="td-neo"><b>프로젝트 목표</b></td><td class="td-neo"> <input type="text" name="project_objective" size="50" maxlength="50" class="styled"></td>
				</tr>
		<tr>
				<td class="td-neo"><b>프로젝트 기회</b></td><td class="td-neo"> <input type="text" name="project_opportunity" size="50" maxlength="50" class="styled"></td>
				</tr>
		<tr>
				<td class="td-neo"><b>프로젝트 시작일</b></td><td class="td-neo"> <input type="text" name="project_start_date" size="8" maxlength="8" class="styled" readonly><input type="button" value="날짜선택" class="button gray" onclick="javascript:displayCalendar(document.frmProject.project_start_date,'yyyymmdd',this);"></td>
		</tr>
		<tr>
				<td class="td-neo"><b>프로젝트 종료일</b></td><td class="td-neo"> <input type="text" name="project_end_date" size="8" maxlength="8" class="styled" readonly>
		<input type="button" value="날짜선택" class="button gray" onclick="javascript:displayCalendar(document.frmProject.project_end_date,'yyyymmdd',this);">
		</td>
		</tr>
		<tr>
			<td class="td-neo"><b>상태</b></td><td class="td-neo">  <select name="project_status" class="styled">
					<option value="0">시작전</option>
					<option value="1">진행중</option>
					<option value="2">종료</option>
			</select>
			</td>
		</tr>
	</tbody>
  </table>

</form>
