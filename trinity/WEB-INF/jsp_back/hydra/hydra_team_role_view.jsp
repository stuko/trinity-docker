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
	document.location.href="/Anaconda.do?CMD=CMD_SEQ_107496774281332064472125&seq="+seq;
}
function fnRoleList()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_105936135081332062289413";
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
			<span class="fr"><input type="button" class="button white" name="Register" value="수정" onClick="javascript:fnModify(<%=bd.getFieldValue("SEQ")%>);"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="목록" onClick="javascript:fnRoleList();"></span>
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
				<td class="td-neo"><b>역할 이름</b></td><td class="td-neo"><%=bd.getFieldValue("ROLE_NAME") %></td>
		</tr>
		<tr>
				<td class="td-neo"><b>목표</b></td><td class="td-neo">  <%=bd.getFieldValue("ROLE_OBJECTIVE") %></td>
		</tr>
	</tbody>
	</table>

