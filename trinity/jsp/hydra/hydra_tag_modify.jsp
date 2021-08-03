<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.XmlConfig.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script language="javascript">
function fnTagList()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_101028711941332595665858";
}
function fnUpdate(seq)
{
	with(frmTag)
	{
		if(tag_name.value == '') 
		{
			alert("태그 이름을 입력해주세요");
			return;
		}
		if(tag_value.value == '') 
		{
			alert("태그의 값를 입력해 주세요");
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
<form id="frmTag" name="frmTag" action="/Anaconda.do" method="POST">
<input type="hidden" name="CMD" value="CMD_SEQ_108560494831332595710173">
<input type="hidden" name="code" value="update">
<input type="hidden" name="tag_key" value="<%=bd.getFieldValue("TAG_KEY")%>">
<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Tagging Info</h3>
			<span class="fr"><input type="button" class="button white" name="Register" value="수정" onClick="javascript:fnUpdate(<%=bd.getFieldValue("TAG_KEY")%>);"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="목록" onClick="javascript:fnTagList();"></span>
		</div>
	</div>
</div>

 <table class="table-neo">
   <thead class="th-neo">
   <td>항목</td>
   <td>값</td>
   </thead>
	<tr><td  style="text-align:left;">태그</td><td  style="text-align:left;"> <input type="text" class="styled" name="tag_name" value="<%=bd.getFieldValue("TAG_NAME") %>" size="20"></td></tr>
	<tr><td  style="text-align:left;">태그 이름</td><td  style="text-align:left;"> <input type="text" class="styled" name="tag_value" value="<%=bd.getFieldValue("TAG_VALUE") %>" size="30"></td></tr>
</table>
</form>



