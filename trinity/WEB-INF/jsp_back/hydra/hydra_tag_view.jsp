
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
	document.location.href="/Anaconda.do?CMD=CMD_SEQ_108744630981332595691168&tag_key="+seq;
}
function fnTagList()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_101028711941332595665858";
}
function fnSetTag(tag_key)
{
	with(tag_action_frm)
	{
		if(command.value == '')
		{
			alert('액션을 선택해 주세요');
			return;
		}
		submit();
	}
}
</script>
<%
	BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getTag");
	BusinessData bd = bc.getBusinessData(0);
%>

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Tagging Info</h3>
			<span class="fr"><input type="button" class="button white" name="Register" value="수정" onClick="javascript:fnModify(<%=bd.getFieldValue("TAG_KEY")%>);"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="목록" onClick="javascript:fnTagList();"></span>
		</div>
	</div>
</div>
<div>
 <table class="table-neo">
   <thead class="th-neo">
   <td>항목</td>
   <td>값</td>
   </thead>
	<tr><td  style="text-align:left;">태그</td><td  style="text-align:left;">  <%=bd.getFieldValue("TAG_NAME").trim() %></td></tr>
	<tr><td  style="text-align:left;">태그 이름</td><td  style="text-align:left;"><%=bd.getFieldValue("TAG_VALUE").trim() %></td></tr>
</table>
<form name="tag_action_frm" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_101885741241332631248919">
<input type="hidden" name="code" value="create">
</form>
