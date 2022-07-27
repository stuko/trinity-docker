<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.util.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.business.BusinessCollection"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%
	String IS_ACCEPTER = session.getAttribute("ACCEPTER") == null ? "true" : (String)session.getAttribute("ACCEPTER");
	String strText = request.getParameter("inputText") == null ? "" : request.getParameter("inputText").trim();	
	String strParam = request.getParameter("srh_param") == null ? "" : request.getParameter("srh_param").trim();
	String strWAC = null;
	String strSessionValue = "";
	RequestHelper helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
	DefaultAuth auth = (DefaultAuth)helper.getSessionObject();
	if(auth != null)
	{
		strSessionValue = auth.getAuthItem(("MEMBER_NAME"));	
	}

	if(!BusinessHelper.checkBusinessNull(request.getParameter("inputText")))
	{
		if(!"NONE".equals(request.getParameter("inputText")))
		{
			helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
			String cookieWac = (String)helper.getSession("BC");
			if(BusinessHelper.checkBusinessNull(cookieWac))
			{
				//out.println("cookie exist"); 
				strWAC = cookieWac;
			}
			else
			{
				//out.println("cookie does not exist");
				strWAC = "ALL";
			}
		}
	}
	else
	{
		strWAC = request.getParameter("inputText").trim();
		helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
		helper.setSession("BC",strWAC);
		//out.println("cookie write = " + strWAC);
	}
%>
<script language="javascript">
<!--
function fn_RegBiz() 
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_107211261401287822755707";
}

function fn_BizCollection(args) 
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_107211261401287822755707&BizColName="+args;
}

function fn_BizSearch(args)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_103615773161287821449749&srh_param=COLLECTION_NAME&inputText="+args;
}

function fn_BizMod(args, args1) 
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_103913152981287845327671&BizName="+args+"&colbizname="+args1;	
}

function fn_Clear()
{
	document.frm.inputText.value = "";
}

function fn_BizDel(args)
{	
	var bAnswer = confirm("("+args+") can not be recoverd.\nReally delete?")
	
	if (bAnswer == true) 
	{
		document.frm.action="/Anaconda.do?CMD=CMD_SEQ_104481054411287892854784&bizCol="+args;
		AnacondaSubmit(document.frm);		
	} else {
		alert("Cancelled");
		return;
	}
}
function fnShowOrHideServiceGroup(strAnchor, strDiv)
{
	var objAnChor = _(strAnchor);
	if(objAnChor.getAttribute('value') == 'Show all')objAnChor.setAttribute('value','Hide all');
	else objAnChor.setAttribute('value','Show all');
	fnShowOrHide(strDiv);
}


function fnAllChangeUser()
{
	if(!confirm("Will you change the owner to current user?.")) return;
	with(frm)
	{
		// var change_user = owner.value;
		action = "/Anaconda.do?CMD=CMD_SEQ_105864769331287842547280";
		code.value = "change_all_user";
		AnacondaSubmit(document.frm);
	}
}

function fn_SelectServiceGroup(select)
{
	fn_BizSearch(select.options[select.selectedIndex].value);
}
//-->
</script>
<form name="frm" method="POST" action="/Anaconda.do?CMD=CMD_SEQ_103615773161287821449749">
<input type="hidden" name="code" value="">
<input type="hidden" name="owner" value="<%=strSessionValue %>"></input>


<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">서비스 관리</h3>
					<span class="fr">
							<select id="service_list_select" class="styled"   name="service_list_select" onChange="javascript:fn_SelectServiceGroup(this);">
							<option value="">선택</option>

							<%
							try
							{
							BizLogicXmlResource biz = BizLogicXmlResource.getInstance();
							Iterator it = biz.getBusinessCollection();
							BusinessCollection businessCollection = null;
							int iTr = 0;
							int iTab = 0;
							boolean isClosed = false;
							int iRow = 0;
							
							for(int ii = 1 ;it.hasNext();ii++)
							{
								businessCollection = (BusinessCollection)it.next();
								if(!businessCollection.hasOwner(strSessionValue)) continue;
								String strWACName = businessCollection.getBusinessName();
								String strWACKName = businessCollection.getBIZ_COLLECTION_KOR_NAME();
							%>
							  <option value="<%=strWACName%>"><%=strWACKName %></option>
							<%
							}
							}catch(Exception ex)
							{
								ex.printStackTrace();
							}
						   %>
						  </select>
					</span>
					<span class="fr"><button type="button" class="btn btn-primary" name="Register" value="Create" onClick="javascript:fn_RegBiz();">추가</button></span>

					<span class="fr"><button type="button"  id="serviceGroupShow" class="btn btn-secondary" name="Register" value="Show all" onClick="javascript:fnShowOrHideServiceGroup('serviceGroupShow','divContext');">모두보기</button></span>

			</div>
		</div>
	</div>
</div>

<div  style="width:100%;display:none;position:relative;background-color:white;border: 1px double #666;padding: 1px 1px;" id="divContext">
<table cellspacing=0 cellpadding=0 border=0>
<%if (strSessionValue.equals(InitClass.getInstance().getData(InitClass.SA_ID))) {%>&nbsp;<button type="button" class="btn btn-info" value="Change owner to current user" onClick="javascript:fnAllChangeUser();">Change owner to current user</button><%} %>
</caption>
<tbody>
<tr>
<td>
<div id='tab1' style='display:block;'>

<%
	try
	{
		BizLogicXmlResource biz = BizLogicXmlResource.getInstance();
		Iterator it = biz.getBusinessCollection();
		BusinessCollection businessCollection = null;
		for(int ii = 1 ;it.hasNext();ii++)
		{
			businessCollection = (BusinessCollection)it.next();
			if(!businessCollection.hasOwner(strSessionValue)) continue;
			String strWACName = businessCollection.getBusinessName();
			String strWACKName = businessCollection.getBIZ_COLLECTION_KOR_NAME();
			strWACKName = strWACKName.length() > 13 ? strWACKName.substring(0,13)+"..." : strWACKName;
%>
         <div style="width:150px;float:left;margin:10px;" align="center">	
            <img src="/jsp/anaconda/img/box.png" width="30px" border=0 align="absmiddle">
             <br>&nbsp;&nbsp;<a href="javascript:fn_BizSearch('<%=strWACName %>');"><%=strWACKName %></a>
             <br>&nbsp;&nbsp;<a href="javascript:fn_BizCollection('<%=strWACName %>');">Modify</a>
             &nbsp;&nbsp;<a href="javascript:fn_BizDel('<%=businessCollection.getBusinessName()%>')">Delete</a>
      	</div>
<%
    }
	}catch(Exception ex)
	{
		ex.printStackTrace();
	}
%>
</div>
</td>
</tr>
</table>
</td>
<td>

</div>
<p></p>

		<table class="table_hydra" cellspacing="0" cellpadding="0">
		<colgroup>
		<col width="20%">
		<col width="70%">
		<col width="10%">
		<col width="10%">
		</colgroup>
		<thead >
		<tr>
		<th scope="col">서비스 이름</th>
		<th scope="col">하위 프로세스 이름</th>
		<th scope="col">프로세스 유형</th>
		<th scope="col">기능</th>
		</tr>
		</thead>
		<tbody >
		 
		<%
			try
			{
				BizLogicXmlResource xmlResource = BizLogicXmlResource.getInstance();	
				xmlResource.release();
				xmlResource = BizLogicXmlResource.getInstance();							
				Iterator it = xmlResource.getBusinessCollection();
				BusinessCollection businessCollection = null;
				BusinessData bizdata = null;   
				
				if (BusinessHelper.checkBusinessNull(strText) && !strText.equals("") && strText!= null && strParam.equals("BUSINESS_NAME")) {
					it = xmlResource.searchBusinessDataLikeName(strText);
				} else if (BusinessHelper.checkBusinessNull(strText) && !strText.equals("") && strText!= null && strParam.equals("COLLECTION_NAME")) {
					it = xmlResource.searchBusinessCollectionLikeName(strText);
				} 	

//				} else if (!strText.equals("") && strText!= null && strParam.equals("ACTION_ISAUTH")) {
//					it = xmlResource.searchWebActionLikeIsAuth(strText);
//				} else if (!strText.equals("") && strText!= null && strParam.equals("COLLECTION_NAME")) {
//					businessCollection = xmlResource.getBusinessCollection(strText);
//					it = businessCollection.iterator();
//				} 			

				String strTmpService = "";

				for (int k= 0 ;it.hasNext(); k++)
				{   
				
    				if(strWAC != null && strWAC.equals("ALL") && k == 1) break; 		
    				
    						
				    businessCollection = (BusinessCollection)it.next();		
				    Iterator iterator = businessCollection.iterator();
				    
				    if(BusinessHelper.checkBusinessNull(strWAC) && (strWAC.equals("ALL") || strWAC.equals(businessCollection.getBusinessName())))
				    {
					    int iSize = businessCollection.size();
					    int i = 0;
					    for(int j =0 ;iterator.hasNext();j++)
					    {
							Object object = iterator.next();
							if(!(object instanceof BusinessData)) continue;
							bizdata = (BusinessData)object;
							
							if(!bizdata.hasOwner(strSessionValue)) continue; 
							
							out.println("<tr align=\"left\">");
							
							strTmpService = businessCollection.getBIZ_COLLECTION_KOR_NAME();
							strTmpService = (strTmpService.length() > 15) ? strTmpService.substring(0,15) + "..." : strTmpService;
							
							if(i == 0)
							{
								out.println("<td rowspan=" + iSize +" width=\"20%\" height=\"20\"  bgcolor=\"#FFFFFF\" style=\"left\"><a href=\"javascript:fn_BizCollection('"+businessCollection.getBusinessName()+"')\"><img src=\"/jsp/anaconda/img/trinity_icon.gif\" border=0>&nbsp&nbsp;"+strTmpService+""+ "</a></td>");
							}
	
			 				
							
							out.println("<td width=\"20%\" height=\"20\"  bgcolor=\"#FFFFFF\" style=\"left\">&nbsp;<a href=\"javascript:fnNull();\" onClick=\"javascript:fn_BizMod('"+bizdata.getBusinessName()+ "','"+businessCollection.getBusinessName()+"')\"><img src=\"/jsp/anaconda/img/trinity_icon.gif\" border=0>&nbsp;[" + (i+1) + "]&nbsp; &nbsp;"+bizdata.getBusinessName()+"</a></td>");					
							out.println("<td width=\"5%\"  height=\"20\" bgcolor=\"#FFFFFF\" style=\"left\">&nbsp;"+bizdata.getTYPE()+"</td>");
							//out.println("<td width=\"100\">&nbsp;"+bizdata.getDATA_DATASOURCE()+"</td>");
							//out.println("<td width=\"100\">&nbsp;"+bizdata.getFACTORY()+"</td>");
							//out.println("<td width=\"100\">&nbsp;"+bizdata.getJNDINAME()+"</td>");
							
							//out.println("<td height=\"20\"  bgcolor=\"#FFFFFF\" style=\"left\">&nbsp;"+strTmpService+"</td>");
							//out.println("<td height=\"20\"  bgcolor=\"#FFFFFF\" style=\"left\">&nbsp;"+bizdata.getDESC()+"</td>");						
							if(i == 0)
							{
								if(IS_ACCEPTER.equals("true"))
								{
									out.println("<td rowspan=" + iSize +" align=\"left\" height=\"20\" bgcolor=\"#FFFFFF\" style=\"left\">&nbsp;<a href=\"javascript:fn_BizDel('"+businessCollection.getBusinessName()+ "')\"><img src=\"/jsp/anaconda/img/trinity_icon.gif\" border=0>&nbsp;Delete</a></td>");
								} else {
									out.println("<td rowspan=" + iSize +" align=\"left\" height=\"20\" bgcolor=\"#FFFFFF\" style=\"left\">&nbsp;권한없음</td>");
								}
							}
							out.println("</tr>");
	//						out.println("<tr>");
	//						out.println("<td class=\"list_body txt_11\" colspan=\"6\"><b>[SQL]&nbsp;</b>"+bizdata.getSERVICE_NAME()+"</td>");
	//						out.println("</tr>");
							i++;
						}
				    }
				
				}	
				xmlResource.release();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
		</tbody>
		</table>
<p></p>
</form>
