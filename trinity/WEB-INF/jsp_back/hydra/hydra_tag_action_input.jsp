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
function fnActionTagList()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_108051816571332631235045";
}
function fnRegister()
{
	with(frmActionTag)
	{
		if(tag_key.value == '') 
		{
			alert("태그 이름을 선택해주세요");
			return;
		}
		if(command.value == '') 
		{
			alert("화면 이름을 입력해 주세요");
			return;
		}
		submit();
	}
}
</script>
<form id="frmActionTag" name="frmActionTag" action="/Anaconda.do" method="POST">
<input type="hidden" name="CMD" value="CMD_SEQ_101885741241332631248919">
<input type="hidden" name="code" value="create">
<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Action(Command) Tagging Register</h3>
			<span class="fr"><input type="button" class="button white" name="Register" value="등록" onClick="javascript:fnRegister();"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="목록" onClick="javascript:fnActionTagList();"></span>
		</div>
	</div>
</div>


 <table class="table-neo">
   <thead class="th-neo">
   <td>항목</td>
   <td>값</td>
   </thead>
	<tr><td  style="text-align:left;">태깅 설명</td><td  style="text-align:left;"> <input type="text" name="description" class="styled" value="" size="50">
	</td></tr>
	<tr><td  style="text-align:left;">태그 리스트</td><td  style="text-align:left;">
<select name="tag_key" class="styled" >
<%
	BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getTagList");
							
	Iterator it = bc.iterator();
	for(int i = 0;it.hasNext();i++)
	{
		BusinessData bd = (BusinessData)it.next();
%>
<option value="<%=bd.getFieldValue("TAG_KEY")%>"><%=bd.getFieldValue("TAG_NAME")%></option>
<%
	}
%>
</select>
</td></tr>
	<tr><td  style="text-align:left;">커멘드 리스트</td><td  style="text-align:left;">
<select name="command" class="styled" >
<%
try
{
	WebActionXmlResource res = WebActionXmlResource.getInstance();
							
	Object[] cmdlist = res.getCommandList();
	for(int i = 0;i < cmdlist.length;i++)
	{
		String cmd = (String)cmdlist[i];
%>
<option value="<%=cmd%>"><%=BusinessHelper.getSubString(res.getCache(cmd).getKOR_NAME(),30,"...")%></option>
<%
	}
}
catch(Exception e)
{
	out.println(e.toString());
}
%>
</select>
</td></tr>
</table>

</form>




