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
	if("sq".equals(member_id))
		isAdmin = true;
//	int iscore = -1;
//	try
//	{
//		iscore = Integer.parseInt(score);
//	}catch(Exception e)
//	{
//		e.printStackTrace();
//	}
//	if(iscore >= 1000)isAdmin = true;
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
   <input type="button" class="button white" value="Delete" onClick="javascript:fnDelete();">
   <input type="button" class="button white" value="Modify" onClick="javascript:fnUpdate();">
  </span>
 </div>
</div>

<div class="left_box" style="background:#FFFFFF">
<table class="table-neo" cellspacing="0" cellpadding="0">
		<colgroup>
		<col width="15%">
		<col width="85%">
		</colgroup>
		<tbody >
<tr>
<td><b>Writing date time</b></td><td><%=strDate%></td>
</tr>
<tr>
<td><b>View count</b></td><td><%=bd.getFieldValue("CNT") %></td>
</tr>
<tr>
<td><b>Title or subject</b></td><td><%=bd.getFieldValue("TITLE") %></td>
</tr>
<tr>
<td><b>Contents</b></td>
<td valign="top">
<pre style="background:white;word-break: keep-all;word-wrap: break-word;color:#000000;">
<%=BusinessHelper.convert(bd.getFieldValue("CONTENTS")) %>
</pre>
</td>
</tr>
</tbody>
</table>

<p height="10px"><img src="/jsp/anaconda/img/no.png" align="absmiddle" width="10px" height="10px" border="0">&nbsp;Please write down anything about project.&nbsp;&nbsp;<% if(!member_id.equals("")){ %><input type="button" class="button white" value="Comment" onClick="javascript:fnShowOrHide('div_comment');"><%} %></p>

<div id="div_comment" style="position:absolute;display:none;background-color:white;border: 1px double #CCCCCC;padding: 10px 10px;">
<form name="frmComment" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_100825678391319968834400"></input>
<input type="hidden" name="seq" value=""></input>
<input type="hidden" name="parent_seq" value="<%=bd.getFieldValue("SEQ") %>"></input>
<input type="hidden" name="code" value="insert_comment"></input>
<table class="table-neo" width="500px" height="60px">
<caption><b>Write your comment.</b></caption>
<colgroup>
<col></col>
</colgroup>
<tbody>
<tr>
<td>
<textarea class="styled" name="contents" style="width:650px;height:150px;"  wordWrap="true"></textarea>
</td>
</tr>
<tr>
<td>
<input type="button" class="button white" style="font: bold 13px 돋움체;margin-left: 5px;margin-top: 5px;" value="Save" onClick="javascript:save();"></input>
<input type="button" class="button white" style="font: bold 13px 돋움체;margin-left: 5px;margin-top: 5px;" value="Close" onClick="javascript:fnShowOrHide('div_comment');"></input>
</td>
</tr>
</tbody>
</table>
</form>
</div>

<div style="margin-left:100px;">
<table class="table_hydra">
		<colgroup>
		<col>
		</colgroup>
		<tbody >
<%

BusinessCollection bc2 = RequestHelper.getBusinessCollection(request,"read_comment");
if(bc2.size() > 0)
{
	Iterator it = bc2.iterator();
	for(int i = 0;it.hasNext();i++)
	{
                  String strICon = "bird";
                  if( (i%2) == 0 ) strICon = "bear";
		BusinessData bd2 = (BusinessData)it.next();		
		strDate = bd2.getFieldValue("REGDATE");
		strDate =strDate.substring(0,4) + "." + strDate.substring(4,6) +"." + strDate.substring(6,8) +" " + strDate.substring(8,10) +":" + strDate.substring(10,12) +":" + strDate.substring(12,14);
                String name = bd2.getFieldValue("MEMBER_NAME") ;
                if(name == null || name.equals("null"))name = "John doe";
%>
                  <tr><td>
<img src="/jsp/SDLC/img/<%=strICon%>.png" width="30px" height="30px" border="0" align="absmiddle"></img>&nbsp;<%=name%>&nbsp;&nbsp;<%=strDate %>&nbsp;&nbsp;<%if(member_id.equals(bd2.getFieldValue("MEMBER_NAME"))){%><a href="javascript:fnDeleteComment('<%=bd2.getFieldValue("SEQ")%>');">Delete</a><%} %></td></tr>
                 <tr><td valign="top" style="word-break:keep-all;word-wrap:break-word; ">
<pre style="background:white;color:#000000;overflow:scroll"><%=BusinessHelper.convert(bd2.getFieldValue("CONTENTS")) %></pre>
                  </td></tr>
<%
	}
}
%>
	</tbody>
	</table>	
</div>
</div>
<form name="frmColum" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_104191772941319961768821"></input>
<input type="hidden" name="seq" value="<%=bd.getFieldValue("SEQ") %>"></input>
</form>
<script language="javascript">
function fnDelete()
{
	with(frmColum)
	{
		if(confirm("Really delete?"))
		{
			callAjaxByForm("deleteColumn","frmColum");
		}				
	}
}
function fnDeleteComment(arg)
{
	with(frmComment)
	{
		if(confirm("Really delete?"))
		{
			CMD.value= "CMD_SEQ_104191772941319961768821";
			seq.value = arg;
			code.value = "delete_comment";
			callAjaxByForm("delete_comment","frmComment");
		}				
	}
}
function fnUpdate()
{
	document.location.href = '/Anaconda.do?CMD=CMD_SEQ_104432715441319961643338&gubun=<%=request.getParameter("gubun")%>&seq=<%=bd.getFieldValue("SEQ")%>';
}
function doRuning(callerName)
{
showRunning(callerName);
}

function doRun(callerName , REQ)
{
	alert("Applied successfully.");
	document.location.href = '/Anaconda.do?CMD=CMD_SEQ_104757947291319959645242&gubun=<%=request.getParameter("gubun")%>&pos=0';
}

function save()
{
	with(frmComment)
	{
		callAjaxByForm("insert_comment","frmComment");
	}
}
</script>
