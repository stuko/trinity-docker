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
<%@ page import="com.stuko.anaconda.business.BusinessData"%>
<%@ page import="com.stuko.anaconda.business.BusinessCollection"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script language="javascript">
function fnViewView(strCollectionName,strViewName)
{
	//window.open("/Anaconda.do?CMD=CMD_SEQ_105760595001287408553144&Col=" + strCollectionName + "&View=" + strViewName,"","height=450,width=800,left=200,top=20,status=no, location=no, toolbar=no,resizable=yes,scrollbars=yes");
	if(strCollectionName == null || strCollectionName == '') 
	{
		alert("No Action!!!.");
		return;
	}
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_105760595001287408553144&Col=" + strCollectionName + "&View=" + strViewName;
}
function fn_ActMod(args1, args2, args3, args4)
{

    with(frmGoActionInfo){
        CMD.value = 'CMD_SEQ_109283388491287276486644';
        ActColName.value = args1;
        ActKorColName.value = args2;
        ActName.value = args3;
        ActKorName.value = args4;
        submit();
    }
}

</script>
<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Smart Search Result</h3>
			</div>
		</div>
	</div>
</div>

<div style="font-family:돋움체;font-size:12px;">
<img src="/jsp/anaconda/img/result.png" width="10" height="10" absmiddle></img>&nbsp;&nbsp;&nbsp;<b>Search Action result</b>
</div>
<table class="table_hydra" cellspacing="0" cellpadding="0">
		<colgroup>
		<col width="10%">
		<col>
		<col width="10%">
		</colgroup>
		<thead >
		<tr>
		<th scope="col">Num</th>
		<th scope="col">Action group</th>
		<th scope="col">JSP</th>
		</tr>
		</thead>
		<tbody>
		<%
		String search = request.getParameter("search");
		ViewXmlResource v = ViewXmlResource.getInstance();
		WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();
		Iterator it = xmlResource.getWebActionCollection();
		int idxAction = 0;
		for(int i = 0; it.hasNext();i++)
		{
			WebActionCollection wac = (WebActionCollection)it.next();
			Iterator subIt = wac.iterator();
			for(int j = 0; subIt.hasNext(); j++)
			{
				WebAction action = (WebAction)subIt.next();
				if(action.toString().indexOf(search) > 0)
				//if(wac.getWEBACTION_KOR_NAME().indexOf(search) >= 0
				//		|| wac.getWEBACTION_NAME().indexOf(search) >= 0
				//		|| action.getNAME().indexOf(search) >= 0
				//		|| action.getKOR_NAME().indexOf(search) >= 0
				//		|| action.getCOMMAND().indexOf(search) >= 0
				//		)
				{
					String vCol = "";
					if(v.searchViewCollectionByForwardName(action.getFORWARD()) != null)
						vCol = v.searchViewCollectionByForwardName(action.getFORWARD()).getVIEWCOLLECTION_NAME();
				%>
				<tr>
					<td><%=++idxAction%></td>				
					<td><a href="/Anaconda.do?CMD=CMD_SEQ_104447509961287275593540&ActColName=<%=wac.getWEBACTION_NAME()%>"><img src="/jsp/anaconda/img/go.png" width="15" height="15" align="absmiddle" border="0"/>&nbsp;<%=wac.getWEBACTION_KOR_NAME()%></a>&nbsp;
					<br>&nbsp;&nbsp;&nbsp;<a href="javascript:fn_ActMod('<%=wac.getWEBACTION_NAME()%>','<%=wac.getWEBACTION_KOR_NAME() %>','<%=action.getNAME() %>','<%=action.getKOR_NAME() %>')"><img src="/jsp/anaconda/img/nav_li.gif" align="absmiddle" border="0"/>&nbsp;<%=action.getKOR_NAME()%></a></td>
					<td><a href="javascript:fnViewView('<%=vCol %>','<%=action.getFORWARD() %>');"><img src="/jsp/anaconda/img/view.png" align="absmiddle" width=15 height=15 border="0"/></a>&nbsp;</td>
				</tr>				
				<%
				}
						
			}
		}
		%>
		</tbody>
</table>
<p></p>
<br>
<div style="font-family:돋움체;font-size:12px;">
<img src="/jsp/anaconda/img/result.png" width="15" height="15" align="absmiddle"></img>&nbsp;&nbsp;&nbsp;<b>Search service result</b>
</div>
<table class="table_hydra" cellspacing="0" cellpadding="0">
		<colgroup>
		<col width="10%">
		<col>
		<col width="50%">
		</colgroup>
		<thead >
		<tr>
		<th scope="col">Num</th>
		<th scope="col">Service name</th>
		<th scope="col">Process name</th>
		</tr>
		</thead>
		<tbody>
		
		<%
		BizLogicXmlResource biz = BizLogicXmlResource.getInstance();	
		it = biz.getBusinessCollection();
		idxAction = 0;
		for(int i = 0; it.hasNext();i++)
		{
			BusinessCollection bc = (BusinessCollection)it.next();
			Iterator subIt = bc.iterator();
			for(int j = 0; subIt.hasNext(); j++)
			{
				BusinessData businessData = (BusinessData)subIt.next();
				if(businessData.toXString().indexOf(search) > 0)
				//if(bc.getBIZ_COLLECTION_KOR_NAME().indexOf(search) >= 0
				//		|| bc.getBusinessName().indexOf(search) >= 0
				//		|| businessData.getBusinessName().indexOf(search) >= 0
				//		|| businessData.getSERVICE_KOR_NAME().indexOf(search) >= 0
				//		|| businessData.getSERVICE_NAME().indexOf(search) >= 0
				//		)
				{
				%>
				<tr>
					<td><%=++idxAction%></td>				
					<td><a href="/Anaconda.do?CMD=CMD_SEQ_107211261401287822755707&BizColName=<%=bc.getBusinessName()%>"><img src="/jsp/anaconda/img/go.png" width="15" height="15" align="absmiddle" border="0"/>&nbsp;<%=bc.getBIZ_COLLECTION_KOR_NAME()%></a></td>
					<td><a href="/Anaconda.do?CMD=CMD_SEQ_103913152981287845327671&BizName=<%=businessData.getBusinessName()%>&colbizname=<%=bc.getBusinessName() %>"><img src="/jsp/anaconda/img/nav_li.gif" align="absmiddle" border="0"/>&nbsp;<%=businessData.getDESC()%></a></td>
				</tr>				
				<%
				}
						
			}
		}
		%>		
		</tbody>
</table>

<form name="frmGoActionInfo" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD"></input>
<input type="hidden" name="ActColName"></input>
<input type="hidden" name="ActKorColName"></input>
<input type="hidden" name="ActName"></input>
<input type="hidden" name="ActKorName"></input>
</form>

<p></p>
<br>
<div style="font-family:돋움체;font-size:12px;">
<img src="/jsp/anaconda/img/result.png" width="15" height="15" align="absmiddle"></img>&nbsp;&nbsp;&nbsp;<b>Search view result</b>
</div>
<table class="table_hydra" cellspacing="0" cellpadding="0">
		<colgroup>
		<col width="10%">
		<col>
		<col width="50%">
		</colgroup>
		<thead >
		<tr>
		<th scope="col">Num</th>
		<th scope="col">View name</th>
		<th scope="col">Desc.</th>
		</tr>
		</thead>
		<tbody>
		
		<%
		
		it = v.getViewCollection();
		idxAction = 0;
		for(int i = 0; it.hasNext();i++)
		{
			ViewCollection vc = (ViewCollection)it.next();
			Iterator subIt = vc.iterator();
			for(int j = 0; subIt.hasNext(); j++)
			{
				View view = (View)subIt.next();
				if(view.toString().indexOf(search) > 0)
				//if(vc.getVIEWCOLLECTION_KOR_NAME().indexOf(search) >= 0
				//		|| vc.getVIEWCOLLECTION_NAME().indexOf(search) >= 0
				//		|| view.getFORWARD_KOR_NAME().indexOf(search) >= 0
				//		|| view.getFORWARD_NAME().indexOf(search) >= 0
				//		)
				{
				%>
				<tr>
					<td><%=++idxAction%></td>				
					<td><a href="javascript:fnViewView('<%=vc.getVIEWCOLLECTION_NAME() %>','<%=view.getFORWARD_NAME() %>');"><img src="/jsp/anaconda/img/go.png" width="15" height="15" align="absmiddle" border="0"/>&nbsp;<%=vc.getVIEWCOLLECTION_KOR_NAME()%></a></td>
					<td><a href="javascript:fnViewView('<%=vc.getVIEWCOLLECTION_NAME() %>','<%=view.getFORWARD_NAME() %>');"><img src="/jsp/anaconda/img/nav_li.gif" align="absmiddle" border="0"/>&nbsp;<%=view.getFORWARD_KOR_NAME()%></a></td>
				</tr>				
				<%
				}
						
			}
		}
		%>		
		</tbody>
</table>
<p></p>
<br>
<div style="font-family:돋움체;font-size:12px;">
<img src="/jsp/anaconda/img/result.png" width="15" height="15" align="absmiddle"></img>&nbsp;&nbsp;&nbsp;<b>Search role result</b>
</div>
<table class="table_hydra" cellspacing="0" cellpadding="0">
		<colgroup>
		<col width="10%">
		<col>
		</colgroup>
		<thead >
		<tr>
		<th scope="col">Num</th>
		<th scope="col">Role name</th>
		</tr>
		</thead>
		<tbody>
		
		<%
		XtremeRoleManager res = XtremeRoleManager.getInstance();
		XtremeRoleCollection col = res.getRoleCollection("Default");
		if(col != null)
	 	{
			idxAction = 0;
		 	for(int i = 0;i < col.size(); i++)
		 	{
	 			XtremeRole role = (XtremeRole)col.get(i);
	 			if(role.toString().indexOf(search) > 0)
	 			//if(col.getROLECOLLECTION_KOR_NAME().indexOf(search) >= 0
				//		|| role.getRole_kor_name().indexOf(search) >= 0
				//		|| role.getRole_name().indexOf(search) >= 0
				//		|| role.getRole_field_name().indexOf(search) >= 0
				//		)
				{
				%>
				<tr>
					<td><%=++idxAction%></td>				
					<td><a href="Anaconda.do?CMD=CMD_SEQ_108710360611288228206258&Col=<%=col.getROLLECTION_NAMESPACE()%>&Role=<%=role.getRole_name() %>"><img src="/jsp/anaconda/img/go.png" width="15" height="15" align="absmiddle" border="0"/></a>&nbsp;<%=role.getRole_kor_name()%></td>
				</tr>				
				<%
				}
						
			}
		}
		%>		
		</tbody>
</table>
<p></p>
<br>
<div style="font-family:돋움체;font-size:12px;">
<img src="/jsp/anaconda/img/result.png" width="15" height="15" align="absmiddle"></img>&nbsp;&nbsp;&nbsp;<b>Search filter result</b>
</div>
<table class="table_hydra" cellspacing="0" cellpadding="0">
		<colgroup>
		<col width="10%">
		<col>
		</colgroup>
		<thead >
		<tr>
		<th scope="col">Num</th>
		<th scope="col">Filter name</th>
		</tr>
		</thead>
		<tbody>
		<%
			WebActionFilterXmlResource f = WebActionFilterXmlResource.getInstance();
			it = f.getWebActionFilterCollection();
			WebActionFilterCollection webActionFilterCollection = null;
			WebActionFilter webFilter = null;
			idxAction = 0;
			for (;it.hasNext();)
			{
			    webActionFilterCollection = (WebActionFilterCollection)it.next();
			    Iterator subIt = webActionFilterCollection.iterator();
			    int iSize = webActionFilterCollection.size();
			    for(int i =0 ;subIt.hasNext(); i++)
			    {
						webFilter = (WebActionFilter)subIt.next();
						if(webFilter.toString().indexOf(search) > 0)
						//if(webActionFilterCollection.getFILTERCOLLECTION_KOR_NAME().indexOf(search) >= 0
						//		||webActionFilterCollection.getFILTERCOLLECTION_NAME().indexOf(search) >= 0
						//		|| webFilter.getFileter_kor_name().indexOf(search) >= 0
						//		|| webFilter.getFilter_name().indexOf(search) >= 0
						//		)
						{
						%>
				<tr>
					<td><%=++idxAction%></td>				
					<td><a href="/Anaconda.do?CMD=CMD_SEQ_106855886431288257600525&ActColName=<%=webActionFilterCollection.getFILTERCOLLECTION_NAME()%>"><img src="/jsp/anaconda/img/go.png" width="15" height="15" align="absmiddle" border="0"/></a>&nbsp;<%=webFilter.getFileter_kor_name()%></td>
				</tr>				
				<%
						}
						
				}
			}
		%>		
		</tbody>
</table>
<p></p>
<br>
<br>
