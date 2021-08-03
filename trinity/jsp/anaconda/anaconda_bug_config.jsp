<%@ page contentType="text/xml; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%
String session_name = "session.MEMBER_NAME";
String strCheckDebug = "false";
String strPeriod = "";
String strTime = "";
BusinessData businessData = (BusinessData)request.getAttribute(InitClass.getBusinessDataValue());
String strUserName = businessData.getFieldValue(session_name);
DefaultXmlResource res = DefaultXmlResource.getInstance();
DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(BlankField.ANACONDA_DEBUG);
if(col != null)
{
	DefaultXmlData dxd = col.getDefaultXmlData(strUserName);
	if(dxd != null)
	{
		strCheckDebug = dxd.getData("debug");
		strPeriod = dxd.getData("period");
		strTime = dxd.getData("time");
	}
}
%>
<p><h1>버그 관리 설정</h1></p>
<ul>
	<li>디버깅 여부를 설정하고, 아나콘다로 작업시 오류가 발생하면, 사용자 화면에 Alert 창이 보여집니다.</li>
</ul>
<form name="frmBug" method="post">
<input type="hidden" name="debug" value=""></input>
<input type="hidden" name="code" value=""></input>
<input type="hidden" name="session_name" value="<%=session_name%>"></input>
<table class="table_hydra">
<caption></caption>
<colgroup>
<col width="30%"></col>
<col></col>
</colgroup>
<thead>
<tr>
<th scope="col">이름</th>
<th scope="col">값</th>
</tr>
</thead>
<tbody>
<tr>
<td>&nbsp;사용자 이름</td>
<td><%=strUserName%></td>
</tr>
<tr>
<td>&nbsp;디버깅 여부 설정</td>
<td><input id="is_debug" type="checkbox" name="is_debug" class="styled"></input></td>
</tr>
<tr>
<td>&nbsp;자동 디버깅 주기</td>
<td><input type="text" name="debug_period" class="styled" size="10" value="<%=strPeriod%>"></input>&nbsp;초&nbsp;&nbsp;(예: 10 , 5 )</td>
</tr>
<tr>
<td>&nbsp;로깅 시간</td>
<td><input type="text" name="debug_time" class="styled" size="10" value="<%=strTime%>"></input>&nbsp;분&nbsp;&nbsp;(예: 1 , 5 )</td>
</tr>
<tr>
<td colspan="2"><input type="button" class="button white" value="저장" onClick="javascript:fnSubmit();"></input><input type="button" class="button white" value="돌아가기" onClick="javascript:history.back();"></input></td>
</tr>
</tbody>
</table>
</form>
<script language="javascript">
function fnSubmit()
{
	with(frmBug)
	{
		action = "/Anaconda.do?CMD=CMD_SEQ_108918997191289350682865";
		code.value = "save";
		if(is_debug.checked == true) debug.value = "true";
		else debug.value = "false";
		callAjaxByForm("save", "frmBug");
	}
}
function doRuning(callerName)
{
showRunning(callerName);
}
function doRun(callerName,REQ)
{
	if(callerName == 'save')
	{
		alert("정상적으로 반영 되었습니다.");
		document.location.reload();
	}
}
setCheckBox('is_debug','<%=strCheckDebug%>');
</script>