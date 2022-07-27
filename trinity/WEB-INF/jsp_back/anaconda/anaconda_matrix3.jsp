<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.filter.*"%>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script language="javascript">
function fnViewView(strCollectionName,strViewName)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_105760595001287408553144&Col=" + strCollectionName + "&View=" + strViewName;
	// window.open("/Anaconda.do?CMD=CMD_SEQ_105760595001287408553144&Col=" + strCollectionName + "&View=" + strViewName,"","height=450,width=800,left=200,top=20,status=no, location=no, toolbar=no,resizable=yes,scrollbars=yes");
}
</script>
<p>
<h1><img src="/jsp/anaconda/img/matrix.png" width="20" height="20" align="absmiddle"></img> &nbsp;&nbsp;&nbsp;서비스 & 화면 매트릭스</h1>
</p>

<%
	HashMap hm = new HashMap();
	WebActionXmlResource wxr = WebActionXmlResource.getInstance();
	BizLogicXmlResource bxr = BizLogicXmlResource.getInstance();	
	int iRowSpan = 0;
	String[] arrData = null;
	Iterator it = bxr.getBusinessCollection();
	for(;it.hasNext();)
	{
		BusinessCollection bc = (BusinessCollection)it.next();
		iRowSpan++;
		Iterator wIt = wxr.getWebActionCollection();
		for(;wIt.hasNext();)
		{
			WebActionCollection wac = (WebActionCollection)wIt.next();
			Iterator subIt = wac.iterator();
			for(;subIt.hasNext();)
			{
				WebAction wa = (WebAction)subIt.next();
				if(bc.getBusinessName().equals(wa.getBIZ_SERVICE()))
				{
					arrData = new String[4];
					arrData[0] = wa.getNAME();
					arrData[1] = wa.getKOR_NAME();
					arrData[2] = wac.getWEBACTION_KOR_NAME();
					arrData[3] = wac.getWEBACTION_NAME();
					hm.put(bc.getBusinessName(),arrData);
				}
			}
		}
		
	}

%>

<table cellspacing="0" cellpadding="0" border=0 bgcolor="#CCCCFF">
<tr>
<td>
<table cellspacing="1" cellpadding="50" border=0>
<tr>
	<td bgcolor="white" rowspan="2" colspan="2" align="center" ><b>매트릭스</b></td><td  bgcolor="white"  colspan="<%=hm.size()%>" align="center"><h1><b>화면</b></h1></td>
</tr>
<tr>
<%
	Set keySet = hm.keySet();
	Iterator keyIterator = keySet.iterator();
	for(int i = 0; keyIterator.hasNext(); i++)
	{
		String[] aData = (String[])hm.get((String)keyIterator.next());
		
%>
				<td  bgcolor="white"  valign="top" style="width:30px;height:250px;writing-mode:tb-lr;padding-right=0px;padding-top:0px;padding-bottom:0px;padding-left:0px;">&nbsp;&nbsp;<a href="/Anaconda.do?CMD=CMD_SEQ_109283388491287276486644&ActColName=<%=aData[3]%>&ActKorColName=<%=aData[2] %>&ActName=<%=aData[0] %>&ActKorName=<%=aData[1] %>%>"><img src="/jsp/anaconda/img/link.png" border=0 width=10 height=10 align="absmiddle"></img></a><%=aData[2] %></td>
<%
	}
%>
</tr>
<%
	Iterator itBc = bxr.getBusinessCollection();
	int idxAction  = 0;
	for(int i = 0;itBc.hasNext();i++)
	{
		BusinessCollection bc = (BusinessCollection)itBc.next();
%>
<%
		if(idxAction == 0)
		{
%>
			<tr>
			<td  bgcolor="white" width="50px" rowspan="<%=iRowSpan %>" align="center">&nbsp;<h1><b>서비스</b></h1>&nbsp;</td>
<%
		}
		else
		{
%>
			<tr>
<%
		}
%>
		<td  bgcolor="white" valign="middle" align="left" ><a href="/Anaconda.do?CMD=CMD_SEQ_107211261401287822755707&BizColName=<%=bc.getBusinessName() %>"><img src="/jsp/anaconda/img/link.png" border=0 width=10 height=10 align="absmiddle"></img></a><%=bc.getBIZ_COLLECTION_KOR_NAME() %></td>
<%
		Iterator bizIt = hm.keySet().iterator();
		for(int ii = 0; bizIt.hasNext(); i++)
		{
			String strKey = (String)bizIt.next();
			if(bc.getBusinessName().equals(strKey))
			{
		%>
			<td  bgcolor="white" valign="middle" align="center" ><a href="/Anaconda.do?CMD=CMD_SEQ_107211261401287822755707&BizColName=<%=bc.getBusinessName() %>"><img src="/jsp/anaconda/img/check.png" border=0 width=15 height=15 align="absmiddle"></img></a></td>
		<%
			}
			else
			{
		%>
			<td  bgcolor="white" >&nbsp;</td>
		<%		
			}
		}
		%>
		</tr>
<%
			idxAction++;
	}
%>
</table>
</td>
</tr>
</table>

<p></p>

