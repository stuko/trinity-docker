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
function fnModify(seq)
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
		/*
		if(project_pm.value == '') 
		{
			alert("프로젝트 관리자 정보를 입력해 주세요");
			return;
		}
		*/
		submit();
	}
}
function fnProjectList()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_104651175361332065328722";
}
</script>
<%
	BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getProject");
	BusinessData bd = bc.getBusinessData(0);
%>

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Project Info.</h3>
			<span class="fr">
			<input type="button" class="button white" name="Register" value="프로젝트 정보 수정" onClick="javascript:fnModify(<%=bd.getFieldValue("SEQ")%>);">
			<input type="button" class="button white" name="cancel" value="목록"  onClick="javascript:fnProjectList();">
			</span>
			</div>
		</div>
	</div>
</div>

<form id="frmProject" name="frmProject" action="/Anaconda.do" method="POST">
<input type="hidden" name="CMD" value="CMD_SEQ_109031910291332066986730">
<input type="hidden" name="code" value="update">
<input type="hidden" name="seq" value="<%=bd.getFieldValue("SEQ")%>">

 <table class="table-neo">
   <thead class="th-neo">
   <td>항목</td>
   <td>값</td>
   </thead>
   <tbody>


<tr>
		<td style="text-align:left;"><b>프로젝트 이름</b> </td><td style="text-align:left;"><input type="text" name="project_title" class="styled" value="<%=bd.getFieldValue("PROJECT_TITLE") %>"></td>
		</tr>
<tr>
		<td style="text-align:left;"><b>프로젝트 목표</b></td><td style="text-align:left;"><input type="text" name="project_objective" class="styled" value="<%=bd.getFieldValue("PROJECT_OBJECTIVE") %>"></td>
		</tr>
<tr>
		<td style="text-align:left;"><b>프로젝트 기회</b></td><td style="text-align:left;"><input type="text" name="project_opportunity" class="styled" value="<%=bd.getFieldValue("PROJECT_OPPORTUNITY") %>"></td>
		</tr>
<tr>
		<td style="text-align:left;"><b>프로젝트 시작일</b></td><td style="text-align:left;"> <input type="text" name="project_start_date" class="styled" value="<%=bd.getFieldValue("PROJECT_START_DATE") %>">
	<input type="button" value="날짜선택" class="button gray" onclick="javascript:displayCalendar(document.frmProject.project_start_date,'yyyymmdd',this);">
</td>
		</tr>
<tr>
		<td style="text-align:left;"><b>프로젝트 종료일</b></td><td style="text-align:left;"><input type="text" name="project_end_date" class="styled" value="<%=bd.getFieldValue("PROJECT_END_DATE") %>">
	<input type="button" value="날짜선택" class="button gray" onclick="javascript:displayCalendar(document.frmProject.project_end_date,'yyyymmdd',this);">
</td>
		</tr>
<!--tr><td colspan="2"><img src="/jsp/hydra/img/analysis_pageview_line3.png" width="600px"></td></tr>
<tr>
		<td style="text-align:left;"><b>프로젝트 관리자</b></td><td style="text-align:left;">  <%=bd.getFieldValue("PROJECT_PM") %></td>
		</tr-->
<tr>
		<td style="text-align:left;"><b>상태</b></td><td style="text-align:left;"><select class="styled" name="project_status">
	<option value="0">시작전</option>
	<option value="1">진행중</option>
	<option value="2">종료</option>
	</select></td>
		</tr>
</tbody>
</table>
</form>


