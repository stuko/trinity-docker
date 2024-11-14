<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.XmlConfig.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script language="javascript">
function fnRoleList()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_105936135081332062289413";
}
function fnUpdate(seq)
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
<%
	BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getRole");
	BusinessData bd = bc.getBusinessData(0);
%>
<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Role Info.</h3>
			<form id="team" name="team" action="/Anaconda.do" method="POST">
			<span class="fr"><input type="button" class="button white" name="Register" value="수정" onClick="javascript:fnUpdate(<%=bd.getFieldValue("SEQ")%>);"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="목록" onClick="javascript:fnRoleList();"></span>
			</div>
			</form>
		</div>
	</div>
</div>

<form id="frmRole" name="frmRole" action="/Anaconda.do" method="POST">
<input type="hidden" name="CMD" value="CMD_SEQ_108564965261332061660629">
<input type="hidden" name="code" value="update">
<input type="hidden" name="seq" value="<%=bd.getFieldValue("SEQ")%>">

  <table class="table-neo">
   <thead class="th-neo">
   <td>이름</td>
   <td>값</td>
   </thead>
   <tbody>
		<tr>
				<td class="td-neo"><b>역할 이름</b></td><td class="td-neo"><input type="text" class="styled" name="role_name" value="<%=bd.getFieldValue("ROLE_NAME") %>" size="50"></td>
		</tr>
		<tr>
			<td class="td-neo"><b>목표</b></td><td class="td-neo">  <input type="text" class="styled" name="role_objective" value="<%=bd.getFieldValue("ROLE_OBJECTIVE") %>" size="70"></td>
		</tr>
	</tbody>
	</table>
</form>



