<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.*"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.openapi.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%
String subject = "";
if(BusinessHelper.checkBusinessNull(request.getParameter("gubun")))
{
	if(request.getParameter("gubun").equals("3"))subject = "Project Issue Management";
	else if(request.getParameter("gubun").equals("4"))subject = "Manual";
	else if(request.getParameter("gubun").equals("2"))subject = "Project Community";
	else if(request.getParameter("gubun").equals("1"))subject = "Project Board";
	else if(request.getParameter("gubun").equals("5"))subject = "Solution Version";
	else if(request.getParameter("gubun").equals("6"))subject = "Q&A for Anaconda";
	else if(request.getParameter("gubun").equals("7"))subject = "Q&A for SmartSDLC";
	else if(request.getParameter("gubun").equals("8"))subject = "Q&A form Trinity";
	else if(request.getParameter("gubun").equals("9"))subject = "Request for consulting";
	else if(request.getParameter("gubun").equals("10"))subject = "FAQ";
}
%>

<div>
 <div class="content-module-heading cf">
  <h3 class="fl">
  <%=subject %>
  </h3>	
  <span class="fr">
   <input type="button" class="button white" value="Save" onClick="javascript:goNext();">
   <input type="button" class="button white" value="Back" onClick="javascript:history.back();">
  </span>
 </div>
</div>

<form name="frmColumn" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_103279184271319961882532"></input>
<input type="hidden" name="gubun" value="<%=request.getParameter("gubun") %>"></input>
<div class="left_box" style="background:#FFFFFF">
<p height="10px">&nbsp;</p>
<table>
<tr><td><b>Title or Subject:</b> </td><td><input type="text" class="styled" name="title" size="200" style="width:600px;"></input></td></tr>
<tr><td><b>Contents:</b> </td><td><textarea class="styled" name="contents" style="width:600px;height:350px;"  wordWrap="true"></textarea></td></tr>
</table>
</div>
<p height="10px">&nbsp;</p>
<%
boolean isAdmin = false;
if(session.getAttribute(InitClass.getSESSION_DOMAIN()) != null)
{
	Object object = session.getAttribute(InitClass.getSESSION_DOMAIN());
	IAuth auth = (IAuth)object;
	String score = auth.getAuthItem("MEMBER_SCORE");
	int iscore = -1;
	try
	{
		iscore = score != null ? Integer.parseInt(score) : 0;
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	if(iscore >= 1000)isAdmin = true;
}
%>
</form>
<script language="javascript">
function goNext()
{

	with(frmColumn)
	{
		if(title.value == '')
		{
			alert("Please enter a title");
			return;
		}
		if(contents.value == '')
		{
			alert("Please enter a contents");
			return;
		}
		callAjaxByForm("createColumn","frmColumn");				
	}
}
function doRuning(callerName)
{
showRunning(callerName);
}

function doRun(callerName , REQ)
{
	alert("Applied successfully.");
	document.location.href="/Anaconda.do?CMD=CMD_SEQ_104757947291319959645242&gubun=<%=request.getParameter("gubun") %>";
}

</script>
