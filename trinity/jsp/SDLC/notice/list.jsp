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
<%@ page import="com.stuko.anaconda.util.*"%>

<%
String member_id = "";
if(session.getAttribute(InitClass.getSESSION_DOMAIN()) != null)
{
	Object object = session.getAttribute(InitClass.getSESSION_DOMAIN());
	IAuth auth = (IAuth)object;
	member_id = auth.getAuthItem(("MEMBER_NAME"));
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
<script language="javascript">
function goWrite()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_108646211081319962550466&gubun=<%=request.getParameter("gubun") %>";
}
</script>
<div class="wrapper wrapper-content">

<div>
 <div class="content-module-heading cf">
  <h3 class="fl">
  <%=subject %>
  </h3>	
  <span class="fr">
   <button type="button" class="button white" onClick="javascript: goWrite();">
    Write a issue or opinion
   </button>
  </span>
 </div>
</div>


<table class="table-neo">
   <thead class="th-neo">
   <td>Date Time</td>
   <td>Title or Subject</td>
   <td>View count</td>
   </thead>
   <tbody>
<% 
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getList");
if(bc != null && bc.size() > 0)
{
	Iterator it = bc.iterator();
	for(int i = 1;it.hasNext();i++)
	{
		BusinessData bd = (BusinessData)it.next();
		
		String strDate = bd.getFieldValue("REGDATE");
		strDate =strDate.substring(0,4) + "." + strDate.substring(4,6) +"." + strDate.substring(6,8) +" " + strDate.substring(8,10) +":" + strDate.substring(10,12) +":" + strDate.substring(12,14);
		String strTitle = BusinessHelper.getSubString(bd.getFieldValue("TITLE"),50,"...");
		String strSeq = bd.getFieldValue("SEQ");
		String search_cnt = bd.getFieldValue("CNT");
		if(!BusinessHelper.checkBusinessNull(bd.getFieldValue("CNT")))
		{
			search_cnt = "0";
		}
	%>
	<tr>
	<td><font style="color:black">&nbsp;&nbsp;<%=strDate %></font></td>
	<td>&nbsp;&nbsp;<a href="/Anaconda.do?CMD=CMD_SEQ_103484457701319969535679&gubun=<%=request.getParameter("gubun") %>&seq=<%=strSeq %>"><%=strTitle %></a></td>
	<td><%= search_cnt%></td>
	</tr>
	<%
	}
}
%>
	</tbody>
	</table>


<p height="20px">&nbsp;</p>
<p align="center">
<%
BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"selectTotalCount");
String strCount = bc1.getBusinessData(0).getFieldValue("CNT");
%>
<script language="javascript">
function fnPage(seq)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_104757947291319959645242&gubun=<%=request.getParameter("gubun") %>&pos=" + seq;
}
</script>
<%

int cnt = Integer.parseInt(strCount);
int page_count = cnt/20;
int page_mod = cnt%20;
// if(page_mod > 0) page_count++;
String seq = request.getParameter("pos");
if(!BusinessHelper.checkBusinessNull(seq))seq = "0";
int iseq = Integer.parseInt(seq);
for(int i = 0; i <= page_count;i++)
{
	if(iseq == i*20)
	{
	%>
		<%=i+1 %>
	<%
		
	}
	else
	{
	%>
		<a href="javascript:fnPage('<%=i*20 %>');"><%=i+1 %></a>
	<%
		
	}
}
%>
</div>
