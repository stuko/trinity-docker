<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script language="javascript">
function fnCMServerManage()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_103105634661289983608812";
}
function fnCMRegister()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_107335537401289969322212";
}
function fnCMDepoyManage()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_101304559451289996453898";
}
function fnCMList()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_100333381081289029921460";
}


function goTest(num)
{
	if(num == '1')
		document.location.href = '/Anaconda.do?CMD=CMD_SEQ_105441898731290999091414';
	else if(num == '2')
		document.location.href = '/Anaconda.do?CMD=CMD_SEQ_109616405671292830123563';
	else if(num == '3')
		document.location.href = '/Anaconda.do?CMD=CMD_SEQ_105836770501290999075239';
	else if(num == '4')
		document.location.href = '/Anaconda.do?CMD=CMD_SEQ_107730116601290999098215';
}
</script>
<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Change Management List</h3>
			<span class="fr"><input type="button" class="button white" name="Register" value="서버 등록" onClick="javascript:fnCMServerManage();"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="서버그룹 등록" onClick="javascript:fnCMDepoyManage();"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="변경요청서 등록" onClick="javascript:fnCMRegister();"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="변경요청 리스트" onClick="javascript:fnCMList();"></span>
			</div>
		</div>
	</div>
</div>