<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"selectUserList");
BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"selectTotalCount");
String strCount = bc1.getBusinessData(0).getFieldValue("cnt");
%>
<script language="javascript">
function fnRegisterUser()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_100302139341289866742976";
}
function fnPage(seq)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_106992440181289030150305&seq=" + seq;
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
<p><div class="post"><div class="title-right"><h2><font><b>사용자 리스트<font color="#FFFFFF">총(<%=strCount %>)<a href="#" style="color:#5700DB;text-decoration: underline;" onClick="javascript:fnRegisterUser();">사용자 등록</a></font></b></font></h2></div></div></p>
		<div class="post">
<div class="entry" style="padding: 5px 5px 0px 5px;">
			<div id="serverlist" >
			<table width="700px" height="300px">
			<tr>
			<td valign="top">
<%
if(bc.size() > 0)
{
	Iterator it = bc.iterator();
	for(int i= 0;it.hasNext();i++)
	{
		BusinessData bd = (BusinessData)it.next();
		String userid = bd.getFieldValue(("MEMBER_NAME"));
%>
		<a href="#" onclick="javascript:fnShowOrHideMenu('div_menu_<%=i %>');">
		<div style="float:left;padding:5px 20px 5px 20px" align="center"><div>
		<img src="/jsp/hydra/img/user.png" width=40 height=40 border=0 align="absmiddle">
		</div><div><b style="color:black;"><%=userid %></b></div></div>
		<div id="div_menu_<%=i %>" style="width:120px; height:40px; display:none;position:absolute;background-color:white;border: 1px double #BF95FF;padding: 1px 1px;">
		<ul><li><a href='javascript:fnNull();' onClick='javascript:fnShowOrHideMenu("div_menu_<%=i %>");'>
		<img src='/jsp/anaconda/img/close.png' width='10px' height='10px' border='0' align='absmiddle' />close</a></li>
		<li><a href="javascript:fnRemove('<%=userid %>');">유저 삭제</a></li>
		</ul></div>		
<%
	}
}
%>
</td>
</tr>
<tr>
<td align=center>
<%

int cnt = Integer.parseInt(strCount);
int page_count = cnt/10;
int page_mod = cnt%10;
// if(page_mod > 0) page_count++;
String seq = request.getParameter("seq");
if(!BusinessHelper.checkBusinessNull(seq))seq = "0";
int iseq = Integer.parseInt(seq);
for(int i = 0; i <= page_count;i++)
{
	if(iseq == i*10)
	{
	%>
		<%=i+1 %>
	<%
		
	}
	else
	{
	%>
		<a href="#" onclick="javascript:fnPage('<%=i*10 %>');"><%=i+1 %></a>
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
