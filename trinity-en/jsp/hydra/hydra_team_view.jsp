<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.XmlConfig.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script language="javascript">
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

function fnModify(seq)
{
	document.location.href="/Anaconda.do?CMD=CMD_SEQ_105523364151332057974490&seq="+seq;
}
function fnTeamList()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_105010315761332038107557";
}
</script>
<%
	BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getTeam");
	BusinessData bd = bc.getBusinessData(0);
	String yyyymmdd = bd.getFieldValue("APPLY_END_DATE");
    yyyymmdd = yyyymmdd.substring(0,4) +"-"+yyyymmdd.substring(4,6)+"-"+yyyymmdd.substring(6,8);
%>

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Team Info.</h3>
			<!--
			<%
				String strUser = BusinessHelper.getBusinessDataValue(request,"session.MEMBER_NAME");

				if(bd.getFieldValue("LEADER").trim().equals(strUser.trim()))
				{
			%>
			<span class="fr"><input type="button" class="button white" name="Register" value="등록" onClick="javascript:fnModify(<%=bd.getFieldValue("SEQ")%>);"></span>
			<%}%>
			-->
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
	
	<tr><td  class="td-neo"><b>팀 이름</b></td><td  class="td-neo"> <%=bd.getFieldValue("TEAM_NAME") %></td></tr>
	
	<tr><td  class="td-neo"><b>팀 목표</b></td><td  class="td-neo"> <%=bd.getFieldValue("TEAM_OBJECTIVE") %></td></tr>
	
	<tr><td  class="td-neo"><b>팀 지원 마감일</b></td><td  class="td-neo"> <%=yyyymmdd %></td></tr>
	
	<tr><td  class="td-neo"><b>팀 최대 지원가능 수</b></td><td  class="td-neo"> <%=bd.getFieldValue("MAX_MEMBER_COUNT") %>&nbsp;명</td></tr>
	
	<tr><td  class="td-neo"><b>팀 현재 지원자 수</b></td><td  class="td-neo"> <%=bd.getFieldValue("CUR_MEMBER_COUNT") %>&nbsp;명</td></tr>
	
	<tr><td  class="td-neo"><b>팀 리더</b> </td><td  class="td-neo"><%=bd.getFieldValue("LEADER") %></td></tr>
	
	</tbody>
	<tfoot class="tfoot-neo">
	<form name="frmApply" action="/Anaconda.do" method="POST">
		<input type="hidden" name="CMD" value="CMD_SEQ_108737907701332073745943">
		<input type="hidden" name="team_seq" value="<%=bd.getFieldValue("SEQ")%>">
			<%
			   BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"checkMe");
			   String cnt = bc1.getBusinessData(0).getFieldValue("CNT");

			  if("0".equals(cnt))
			  {
			%>
			<tr>
			<td colspan="2">
			<b style="color:blue;font-size:18px;font-family:dotum;">"<%=bd.getFieldValue("TEAM_NAME")%>"</b> 팀에 &nbsp;<select name="role_seq" class="styled">
			<%
				bc1 = RequestHelper.getBusinessCollection(request,"getRoleList");
				Iterator it = bc1.iterator();
				for(;it.hasNext();)
				{
					BusinessData bd1 = (BusinessData)it.next();
			%>
					<option value="<%=bd1.getFieldValue("SEQ")%>"><%=bd1.getFieldValue("ROLE_NAME")%></option>
			<%
				}
			%>
			</select>&nbsp;로 &nbsp; 
			<input type="button" class="button white" value="참여" onClick="javascript:fnApply();"> &nbsp;하고 싶습니다.
			</td>
			</tr>
			<%
			  }
			  else
			  {
			%>
			<tr>
			   <td colspan="2">
			   이미 팀에 가입 하셔서, 신청 하실 수 없습니다.
			   </td>
			</tr>
			<%
			  }
			%>
		</form>
	</tfoot>
</table>