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
boolean isAdmin = false;
String member_id = "";
if(session.getAttribute(InitClass.getSESSION_DOMAIN()) != null)
{
	Object object = session.getAttribute(InitClass.getSESSION_DOMAIN());
	IAuth auth = (IAuth)object;
	String score = auth.getAuthItem("MEMBER_SCORE");
	member_id = auth.getAuthItem("MEMBER_NAME");
	int iscore = -1;
	try
	{
		iscore = Integer.parseInt(score);
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	if(iscore >= 1000)isAdmin = true;
}
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
<%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"read");
BusinessData bd = bc.getBusinessData(0);
String strDate = bd.getFieldValue("REGDATE");
strDate =strDate.substring(0,4) + "." + strDate.substring(4,6) +"." + strDate.substring(6,8) +" " + strDate.substring(8,10) +":" + strDate.substring(10,12) +":" + strDate.substring(12,14);
%>


<div>
 <div class="content-module-heading cf">
  <h3 class="fl">
  <%=subject %>
  </h3>	
  <span class="fr">
<input type="button" class="button white" value="Back" onClick="javascript:history.back();">
<input type="button" class="button white" value="Save" onClick="javascript:fnUpdate();">
  </span>
 </div>
</div>

<form name="frmColum" method="post" action="/Anaconda.do">
<div class="left_box" style="background:#FFFFFF">
<table>
<tr><td><b> Title or Subject :</b> </td><td><input type="text" class="styled" name="title" size="80" value="<%=bd.getFieldValue("TITLE") %>"></input></td></tr>
<tr><td><b> Contents :</b> </td><td><textarea class="styled" name="contents" style="width:600px;height:350px;"  wordWrap="true"><%=BusinessHelper.revert(bd.getFieldValue("CONTENTS")).replace("<BR>","/r/n") %></textarea></td></tr>
</table>
</div>
<input type="hidden" name="CMD" value="CMD_SEQ_107721366991319962098405"></input>
<input type="hidden" name="seq" value="<%=bd.getFieldValue("SEQ") %>"></input>
</form>
<script language="javascript">

function fnUpdate()
{
	with(frmColum)
	{
		if(confirm("Really modify?"))
		{
			callAjaxByForm("updateColumn","frmColum");
		}				
	}
}
function doRuning(callerName)
{
showRunning(callerName);
}

function doRun(callerName , REQ)
{
	alert("Applied successfully");
	document.location.href = '/Anaconda.do?CMD=CMD_SEQ_104757947291319959645242&gubun=<%=request.getParameter("gubun")%>&pos=0';
}

</script>
