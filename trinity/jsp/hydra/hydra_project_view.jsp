<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.XmlConfig.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script language="javascript">
function fnModify(seq)
{
	document.location.href="/Anaconda.do?CMD=CMD_SEQ_100667472731332068401101&seq="+seq;
}
function fnApply()
{
	with(frmApply)
	{
		if(confirm("정말로 신청 하시겠습니까"))
		{
			submit();
		}
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
	String yyyymmdd = bd.getFieldValue("PROJECT_START_DATE");
	yyyymmdd = yyyymmdd.substring(0,4) +"-"+yyyymmdd.substring(4,6)+"-"+yyyymmdd.substring(6,8);
	String yyyymmdd1 = bd.getFieldValue("PROJECT_END_DATE");
	yyyymmdd1 = yyyymmdd1.substring(0,4) +"-"+yyyymmdd1.substring(4,6)+"-"+yyyymmdd1.substring(6,8);
	String status = "시작전";
	if("0".equals(bd.getFieldValue("PROJECT_STATUS"))) status = "시작전";
	else if("1".equals(bd.getFieldValue("PROJECT_STATUS"))) status = "진행중";
	else if("2".equals(bd.getFieldValue("PROJECT_STATUS"))) status = "종료";
%>

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Project Info.</h3>
			<form id="team" name="team" action="/Anaconda.do" method="POST">
			<span class="fr"><input type="button" class="button white" name="Register" value="수정" onClick="javascript:fnModify(<%=bd.getFieldValue("SEQ")%>);"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="목록" onClick="javascript:fnProjectList();"></span>
			</div>
			</form>
		</div>
	</div>
</div>


 <table class="table-neo">
   <thead class="th-neo">
   <td>이름</td>
   <td>값</td>
   </thead>
   <tbody>
		<tr>
				<td class="td-neo"><b>프로젝트 이름</b> </td><td class="td-neo"><%=bd.getFieldValue("PROJECT_TITLE") %></td>
				</tr>
		<tr>
				<td class="td-neo"><b>프로젝트 목표</b></td><td class="td-neo"><%=bd.getFieldValue("PROJECT_OBJECTIVE") %></td>
				</tr>
		<tr>
				<td class="td-neo"><b>프로젝트 기회</b></td><td class="td-neo"><%=bd.getFieldValue("PROJECT_OPPORTUNITY") %></td>
				</tr>
		<tr>
				<td class="td-neo"><b>프로젝트 시작일</b></td><td class="td-neo"> <%=yyyymmdd %></td>
				</tr>
		<tr>
				<td class="td-neo"><b>프로젝트 종료일</b></td><td class="td-neo"> <%=yyyymmdd1 %></td>
				</tr>
		<tr>
				<td class="td-neo"><b>프로젝트 관리자</b></td><td class="td-neo">  <%=bd.getFieldValue("PROJECT_PM") %></td>
				</tr>
		<tr>
				<td class="td-neo"><b>상태</b></td><td class="td-neo"> <%=status %></td>
				</tr>
	</tbody>
	<tfoot>
		<td colspan="2" class="tfoot-neo">
		<form name="frmApply" action="/Anaconda.do" method="POST">
		<input type="hidden" name="CMD" value="CMD_SEQ_107923071711332071012653">
		<input type="hidden" name="project_seq" value="<%=bd.getFieldValue("SEQ")%>">
		<%
			BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"getMyTeam");
			if(bc1.size() > 0)
			{
		%>
		<select name="team_seq" class="styled">
		<%
			Iterator it = bc1.iterator();
			for(;it.hasNext();)
			{
				BusinessData bd1 = (BusinessData)it.next();
		%>
				<option value="<%=bd1.getFieldValue("SEQ")%>"><%=bd1.getFieldValue("TEAM_NAME")%></option>
		<%
			}
		%>
		</select>&nbsp;에서 <b style="color:blue;font-size:16px;">"<%=bd.getFieldValue("PROJECT_TITLE") %>"</b>에 
		<input type="button" class="button white" value="참여" onClick="javascript:fnApply();">&nbsp; 하고자 합니다.
		<%
			}
		%>
		</form>
		</td>
	</tfoot>
</table>
