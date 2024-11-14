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
function fnTagList()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_101028711941332595665858";
}
function fnRegister()
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
			alert("태그 값을 입력해 주세요");
			return;
		}
		submit();
	}
}
</script>
<form id="frmTag" name="frmTag" action="/Anaconda.do" method="POST">
<input type="hidden" name="CMD" value="CMD_SEQ_108560494831332595710173">
<input type="hidden" name="code" value="create">
<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Tagging Register</h3>
			<span class="fr"><input type="button" class="button white" name="Register" value="등록" onClick="javascript:fnRegister();"></span>
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
	<tr><td  style="text-align:left;">태그</td><td  style="text-align:left;"> <input type="text" name="tag_name" size="50" maxlength="50" class="styled"></td></tr>
	<tr><td  style="text-align:left;">태그 이름</td><td  style="text-align:left;"> <input type="text" name="tag_value" size="50" maxlength="50" class="styled"></td></tr>
</table>
</form>



