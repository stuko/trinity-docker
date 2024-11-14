<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.XmlConfig.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
DefaultXmlResource res = DefaultXmlResource.getInstance();
DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_ACCESS);
int isize = 0;
if(col != null) isize = col.size();
%>
<script language="javascript">
function fnRegisterAccess()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_100302139341289866742976";
}
function fnPage(seq)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_106992440181289030150305&seq=" + seq;
}
function fnModify(user)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_108725440141297497295420&user_id=" + user;
}
function fnRemove(user)
{
	with(frmUser)
	{
		code.value = "remove_user";
		CMD.value = "CMD_SEQ_109292481821289890031666";
		user_id.value = user;
		callAjaxByForm("remove_user", "frmUser");
	}
}
function doRuning(callerName)
{
showRunning(callerName);

}

function doRun(callerName,REQ)
{
	alert("정상적으로 반영되었습니다.");
	document.location.reload();
}
</script>
<form name="frmUser" action="/Anaconda.do" method="post">
<input type="hidden" name="code" value=""></input>
<input type="hidden" name="CMD" value=""></input>
<input type="hidden" name="user_id" value=""></input>
</form>
		<div class="post">
				<div class="title-right">
				<h2><font><b>접근  관리</b></font>
				&nbsp;<font color="#FFFFFF">총(<%=isize %>)</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;
				<a href="#" style="color:#5700DB;text-decoration: underline;" onClick="javascript:fnRegisterAccess();">접근권한 등록</a>
				</h2>
				</div>
<div class="entry" style="padding: 5px 5px 0px 5px;">
			<div id="serverlist" >
			<table width="700px" height="300px">
			<tr>
			<td valign="top">
<%
if(col != null && col.size() > 0)
{
	Iterator it = col.iterator();
	for(int i= 0;it.hasNext();i++)
	{
		DefaultXmlData bd = (DefaultXmlData)it.next();
		String userid = bd.getNAME();
%>
		<a href="#" onclick="javascript:fnShowOrHideMenu('div_menu_<%=i %>');">
		<div style="float:left;padding:5px 20px 5px 20px" align="center"><div>
		<img src="/jsp/hydra/img/user.png" width=40 height=40 border=0 align="absmiddle">
		</div><div><b style="color:black;"><%=userid %></b></div></div>
		<div id="div_menu_<%=i %>" style="width:220px; height:80px; display:none;position:absolute;background-color:white;border: 1px double #BF95FF;padding: 1px 1px;">
		<ul><li><a href='javascript:fnNull();' onClick='javascript:fnShowOrHideMenu("div_menu_<%=i %>");'>
		<img src='/jsp/anaconda/img/close.png' width='10px' height='10px' border='0' align='absmiddle' />close</a></li>
		<li><a href="javascript:fnModify('<%=userid %>');">리소스 접근 권한 수정</a></li>
		<li><a href="javascript:fnRemove('<%=userid %>');">리소스 접근 권한 삭제</a></li>
		</ul></div>		
<%
	}
}
%>
</td>
</tr>
</table>
</div>
</div>
</div>

