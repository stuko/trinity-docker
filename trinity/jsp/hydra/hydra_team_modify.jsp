
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
	with(frmTeam)
	{
		if(team_name.value == '') 
		{
			alert("팀 이름을 입력해주세요");
			return;
		}
		if(team_objective.value == '') 
		{
			alert("팀의 목표를 입력해 주세요");
			return;
		}
		if(apply_end_date.value == '') 
		{
			alert("팀에 신청이 가능한 마감일을 입력해주세요");
			return;
		}
		if(max_member_count.value == '') 
		{
			alert("팀에 신청이 가능한 회원수를 입력해주세요");
			return;
		}
		submit();
	}

}
function fnTeamList()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_105010315761332038107557";
}
</script>
<%
	BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getTeam");
	BusinessData bd = bc.getBusinessData(0);
%>
<form id="frmTeam" name="frmTeam" action="/Anaconda.do" method="POST">
<input type="hidden" name="CMD" value="CMD_SEQ_100581803801332043824291">
<input type="hidden" name="code" value="update">
<input type="hidden" name="seq" value="<%=bd.getFieldValue("SEQ")%>">

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Team Modify</h3>
			<%
				String strUser = BusinessHelper.getBusinessDataValue(request,"session.MEMBER_NAME");

				if(bd.getFieldValue("LEADER").trim().equals(strUser.trim()))
				{
			%>
			<span class="fr"><input type="button" class="button white" name="Register" value="등록" onClick="javascript:fnModify(<%=bd.getFieldValue("SEQ")%>);"></span>
			<%}%>
			<span class="fr"><input type="button" class="button white" name="Register" value="목록" onClick="javascript:fnTeamList();"></span>
			</div>
		</div>
	</div>
</div>


 <table class="table-neo">
   <thead class="th-neo">
   <td>이름</td>
   <td>값</td>
   </thead>
   <tbody>
     <tr><td  class="td-neo"><b>팀 이름</b></td><td  class="td-neo"> <input type="text" name="team_name" value="<%=bd.getFieldValue("TEAM_NAME") %>" class="styled"></td></tr>
	
	<tr><td  class="td-neo"><b>팀 목표</b></td><td  class="td-neo"> <input type="text" name="team_objective" value="<%=bd.getFieldValue("TEAM_OBJECTIVE") %>" class="styled"></td></tr>
	
	<tr><td  class="td-neo"><b>팀 지원 마감일</b></td><td  class="td-neo"> <input type="text" name="apply_end_date" value="<%=bd.getFieldValue("APPLY_END_DATE") %>" class="styled" size="8" maxlength="8">
	<input type="button" value="날짜선택" class="button gray" onclick="javascript:displayCalendar(document.frmTeam.apply_end_date,'yyyymmdd',this);"></td></tr>
	
	<tr><td  class="td-neo"><b>팀 최대 지원가능 수</b></td><td  class="td-neo"><input type="text" name="max_member_count" value="<%=bd.getFieldValue("MAX_MEMBER_COUNT") %>" size="5" class="styled"></td></tr>
	
	<tr><td  class="td-neo"><b>팀 현재 지원자 수</b></td><td  class="td-neo"> <%=bd.getFieldValue("CUR_MEMBER_COUNT") %></td></tr>
	<tr><td>팀 리더 </td><td> <%=bd.getFieldValue("TEAM_LEADER") %></td></tr>
	
	</tbody>
</table>
</div>
</form>
