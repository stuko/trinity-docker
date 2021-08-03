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
	window.open("/Anaconda.do?CMD=CMD_SEQ_105760595001287408553144&Col=" + strCollectionName + "&View=" + strViewName,"","height=450,width=800,left=200,top=20,status=no, location=no, toolbar=no,resizable=yes,scrollbars=yes");
}
</script>
<p>
<h1><img src="/jsp/anaconda/img/matrix.png" width="20" height="20" align="absmiddle"></img> &nbsp;&nbsp;&nbsp;화면 & 화면 매트릭스</h1>
</p>

<%
	HashMap biz = new HashMap();
	WebActionXmlResource wxr = WebActionXmlResource.getInstance();
	ViewXmlResource vxr = ViewXmlResource.getInstance();		
	Iterator it = wxr.getWebActionCollection();
	int idxAction = 0;
	for(;it.hasNext();)
	{
		WebActionCollection wac = (WebActionCollection)it.next();
		Iterator subIt = wac.iterator();
		for(;subIt.hasNext();)
		{
			idxAction++;
			WebAction action = (WebAction)subIt.next();
			if(BusinessHelper.checkBusinessNull(action.getFORWARD()) && !action.getFORWARD().equals("NONE"))
			{
				if(vxr.searchViewCollectionByForwardName(action.getFORWARD()) != null)
				{
					biz.put(action.getFORWARD(),vxr.searchViewCollectionByForwardName(action.getFORWARD()).getVIEWCOLLECTION_NAME());
				}
			}
		}
	}
%>
<div id="div_matrix" style="overflow-x:scroll">
<table cellspacing="0" cellpadding="0" border=0 bgcolor="#CCCCFF">
<tr>
<td>
<table cellspacing="1" cellpadding="50" border=0>
<tr>
	<td bgcolor="white" rowspan="2" colspan="2" align="center"><b>매트릭스</b></td><td  bgcolor="white"  colspan="<%=biz.size()%>" align="center"><h1><b>화면</b></h1></td>
</tr>
<tr>
<%
	it = biz.keySet().iterator();
	for(int i = 0; it.hasNext(); i++)
	{
		String strKey = (String)it.next();
		//out.println(strKey);
		try{
			ViewCollection bc = vxr.searchViewCollectionByForwardName(strKey);
			if(bc != null)
			{
%>
				<td  bgcolor="white"  valign="top" style="width:30px;height:250px;font-family:돋움체 normal;font-size:12px;writing-mode:tb-lr;padding-right=0px;padding-top:0px;padding-bottom:0px;padding-left:0px;">&nbsp;&nbsp;<a href="javascript:fnViewView('<%=bc.getVIEWCOLLECTION_NAME() %>','<%=strKey %>')"><img src="/jsp/anaconda/img/link.png" border=0 width=10 height=10 align="bottom"></img></a><%=vxr.searchView(strKey).getFORWARD_KOR_NAME() %></td>
<%
			}
			else
			{
%>
				<td  bgcolor="white"  valign="top" style="width:30px;height:250px;writing-mode:tb-lr;padding-right=0px;padding-top:0px;padding-bottom:0px;padding-left:0px;">&nbsp;&nbsp;화면 없음</td>
<%
			}
		}catch(Exception e)
		{
			// out.println("#############################################3("+strKey+")");
			e.printStackTrace();
		}
	}
%>
</tr>
<%
	int actionRowSpan = idxAction;
	idxAction = 0;
	it = wxr.getWebActionCollection();
	for(int i = 0;it.hasNext();i++)
	{
		WebActionCollection wac = (WebActionCollection)it.next();
		Iterator subIt = wac.iterator();
		for(int j = 0; subIt.hasNext(); j++)
		{
			WebAction action = (WebAction)subIt.next();
%>
<%
		if(idxAction == 0)
		{
%>
			<tr>
			<td  bgcolor="white" width="50px" rowspan="<%=actionRowSpan %>" align="center">&nbsp;<h1><b>화면</b></h1>&nbsp;</td>
<%
		}
		else
		{
%>
			<tr>
<%
		}
%>
			<td  bgcolor="white" height="30px" >&nbsp;&nbsp;<a href="/Anaconda.do?CMD=CMD_SEQ_109283388491287276486644&ActColName=<%=wac.getWEBACTION_NAME()%>&ActKorColName=<%=wac.getWEBACTION_KOR_NAME() %>&ActName=<%=action.getNAME() %>&ActKorName=<%=action.getKOR_NAME() %>"><img src="/jsp/anaconda/img/link.png" border=0 width=10 height=10 align="absmiddle"></img></a>&nbsp;&nbsp;<%=action.getKOR_NAME() %></td>
			<%
			
			Iterator bizIt = biz.keySet().iterator();
			for(int ii = 0; bizIt.hasNext(); i++)
			{
				String strKey = (String)bizIt.next();
				if(action.getFORWARD().equals(strKey))
				{
			%>
				<td  bgcolor="white" valign="middle" align="center" ><a href="/Anaconda.do?CMD=CMD_SEQ_109283388491287276486644&ActColName=<%=wac.getWEBACTION_NAME()%>&ActKorColName=<%=wac.getWEBACTION_KOR_NAME() %>&ActName=<%=action.getNAME() %>&ActKorName=<%=action.getKOR_NAME() %>"><img src="/jsp/anaconda/img/check.png" border=0 width=15 height=15 align="absmiddle"></img></a></td>
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
	}
%>
</table>
</td>
</tr>
</table>
</div>
<p></p>

