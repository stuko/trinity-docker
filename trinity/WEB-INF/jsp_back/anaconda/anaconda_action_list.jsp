<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.xtreme.site.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String strText = request.getParameter("inputText") == null ? "" : request.getParameter("inputText").trim();
	//strText = (new String(strText.getBytes("8859_1"),"euc-kr"));
	
	String strParam = request.getParameter("srh_param") == null ? "" : request.getParameter("srh_param").trim();
	
	String strWAC = null;
	
	RequestHelper helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
	DefaultAuth auth = (DefaultAuth)helper.getSessionObject();
	String strSessionValue = "";
	
	if(auth != null)
	{
		strSessionValue = auth.getAuthItem(("MEMBER_NAME"));	
	}
	
		
	if(!BusinessHelper.checkBusinessNull(request.getParameter("WAC")))
	{
		// RequestHelper helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
		String cookieWac = (String)helper.getSession("WAC");
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
	else
	{
		strWAC = request.getParameter("WAC").trim();
		// RequestHelper helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
		helper.setSession("WAC",strWAC);
		//out.println("cookie write = " + strWAC);
	}
	
	int MAX_COL = 2000;
	int MAX_PRC = 2000;
%>
<script language="javascript">
<!--
function fn_ActReg()
{
	document.location.href = '/Anaconda.do?CMD=CMD_SEQ_106123592361287269752055';
	//window.open("/Anaconda.do?CMD=CMD_SEQ_106123592361287269752055","ActReg","height=400,width=670,left=200,top=20,status=no, location=no, toolbar=no, resizable=yes, scrollbars=yes");
}

function fn_ActCollection(args)
{
	document.location.href = '/Anaconda.do?CMD=CMD_SEQ_104447509961287275593540&ActColName='+args;
	// window.open("/jsp/WebAction/Action_Reg.jsp?ActColName="+args,"ActCollection","height=400,width=670,left=200,top=20,status=no, location=no, toolbar=no, resizable=yes, scrollbars=yes ");
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

	// document.location.href = "/Anaconda.do?CMD=CMD_SEQ_109283388491287276486644&ActColName="+args1+"&ActKorColName="+args2+"&ActName="+args3+"&ActKorName="+args4;
	//window.open("/jsp/WebAction/Action_mod.jsp?ActColName="+args1+"&ActKorColName="+args2+"&ActName="+args3+"&ActKorName="+args4,"","height=800,width=730,left=200,top=20,status=no, location=no, toolbar=no, resizable=yes, scrollbars=yes");
}

function fn_ActDefaultMod(args1, args2, args3, args4, args5)
{
	with(frmActionMod)
	{
		CMD.value = "CMD_SEQ_101546663451287795733194";
		default_act_col_name.value = args1;
		default_act_name.value = args3;
		code.value = args5;
	}
	callAjaxByForm(args5, "frmActionMod");	
}

function doRuning(callerName)
{
showRunning(callerName);
	
}

function doRun(callerName , REQ)
{
	alert("Applied successfully.");
	document.location.reload();
}
function fn_BizCollection(args)
{
	window.open("/Anaconda.do?CMD=CMD_SEQ_107211261401287822755707&BizColName="+args,"","height=400,width=670,left=200,top=20,status=no, location=no, toolbar=no, scrollbars=yes");
}

function fnViewView(strCollectionName,strViewName)
{
	//window.open("/Anaconda.do?CMD=CMD_SEQ_105760595001287408553144&title=화면정보&View=" + strViewName,"","height=450,width=800,left=200,top=20,status=no, location=no, toolbar=no,resizable=yes, scrollbars=yes");
	document.location.href ="/Anaconda.do?CMD=CMD_SEQ_105760595001287408553144&title=화면정보&View=" + strViewName;
}

function fn_ActDel(args)
{
	var bAnswer = confirm("Really delete?");

	if (bAnswer == true)
	{      
            if(confirm("Really???????????????")){
		document.frm.action="/Anaconda.do?CMD=CMD_SEQ_101470995971287801036583&actCol="+args;
		AnacondaSubmit(document.frm);
            }else{
          	alert("Cancelled");
		return;
            }
            
	} else {
		alert("Cancelled");
		return;
	}
}
function fnRoleView(strCollectionName,strViewName)
{
	if(strViewName == null || strViewName == '')
	{
		alert("There is no role info.");
		return;
	}
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_108710360611288228206258&Col=" + strCollectionName + "&Role=" + strViewName;
}
function fnSearchWACList(strWAC)
{
	document.location.href="/Anaconda.do?CMD=CMD_SEQ_108164918711286971872119&WAC="+strWAC;
}
function fnShowOrHideActionGroup(strAnchor, strDiv)
{
	var objAnChor = _(strAnchor);
	if(objAnChor.getAttribute('value') == 'Show all')objAnChor.setAttribute('value','Hide all');
	else objAnChor.setAttribute('value','Show all');
	fnShowOrHide(strDiv);
}
function fn_SelectActionGroup(select)
{
	fnSearchWACList(select.options[select.selectedIndex].value);
}
//-->
</script>

<form name="frmGoActionInfo" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD"></input>
<input type="hidden" name="ActColName"></input>
<input type="hidden" name="ActKorColName"></input>
<input type="hidden" name="ActName"></input>
<input type="hidden" name="ActKorName"></input>
</form>


<form name="frmActionMod" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD"></input>
<input type="hidden" name="default_act_col_name"></input>
<input type="hidden" name="default_act_name"></input>
<input type="hidden" name="code"></input>
</form>
<form name="frm" method="post" action="">
</form>


<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Action group info(Include REST)</h3>
			<span class="fr">
					<select id="wac_list_select" name="wac_list_select" onChange="javascript:fn_SelectActionGroup(this);">
					<option value="">Select action group</option>
					<%
					try{
						WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();
						WebActionCollection webActionCollection = null;
						Iterator it = xmlResource.getWebActionCollection();
						for(int cnt = 1 ;it.hasNext();cnt++)
						{
							
							webActionCollection = (WebActionCollection)it.next();
							if(!webActionCollection.hasOwner(strSessionValue)) continue;
							String strWACName = webActionCollection.getWEBACTION_NAME();
							String strWACKName = webActionCollection.getWEBACTION_KOR_NAME();
					%>
							<option value="<%=strWACName%>"><%=strWACKName %></option>
					<%
						}
					}catch(Exception e){
						
					}
					%>
					</select>
			</span>
                        <span class="fr"><button type="button" class="btn btn-primary" name="Register" value="Create action group" onClick="javascript:fn_ActReg();">Create a action group</button></span>
			<span class="fr"><button type="button"  id="actionGroupShow" class="btn btn-secondary" name="Register" value="Show all" onClick="javascript:fnShowOrHideActionGroup('actionGroupShow','divContext');fnNull();">Show all</button></span>
			</div>
		</div>
	</div>
</div>


<div style="width:100%;display:none;margin-left:10px;position:relative;background-color:white;border: 1px double #666;padding: 1px 1px;" id="divContext">
<table cellspacing=0 cellpadding=5 border=0 style="padding: 5px 5px">
<caption style="padding: 10px 10px"><b>Action groups list</b></caption>
<tbody>
<tr>
<td>
<div id='tab1' style='display:block;'>
<%
	try
	{
		WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();
		WebActionCollection webActionCollection = null;

		Iterator it = xmlResource.getWebActionCollection();
		for(int cnt = 1 ;it.hasNext();cnt++)
		{
			webActionCollection = (WebActionCollection)it.next();
			if(!webActionCollection.hasOwner(strSessionValue)) continue;
			String strWACName = webActionCollection.getWEBACTION_NAME();
			String strWACKName = webActionCollection.getWEBACTION_KOR_NAME();
			strWACKName = strWACKName.length() > 23 ? strWACKName.substring(0,23)+"..." : strWACKName;
%>
         <div style="width:120px;float:right;margin:10px;" align="center">	
            <img src="/jsp/anaconda/img/box.png" width="30px" border=0 align="absmiddle"></img>
             <br>&nbsp;&nbsp;<a href="javascript:fnSearchWACList('<%=strWACName %>');"><%=strWACKName %></a>
             <br>&nbsp;&nbsp;<a href="javascript:fn_ActCollection('<%=strWACName %>');"><img src="/jsp/anaconda/img/menu.png" width="10px" height="10px" border="0" align="absmiddle"></img>Modify</a>
             &nbsp;&nbsp;<a href="javascript:fn_ActDel('<%=webActionCollection.getWEBACTION_NAME()%>')"><img src="/jsp/anaconda/img/trinity_icon.gif" width="10px" height="10px" border="0" align="absmiddle"></img>Delete</a>
	      </div>
<%
           }
	}catch(Exception ex)
	{
		ex.printStackTrace();
	}
%>
</td>
</tr>
</tbody>
</table>
</td>
<td>

</div>
<p>
<script language="javascript">
function check(chk){
  if(chk.checked == true) All('wa');
  else NotAll('wa');
}

function All(id){
   fnSelectAllOrDeselectAll(id,true);
}

function NotAll(id){
   fnSelectAllOrDeselectAll(id,false);
}
function fnSelectAllOrDeselectAll(id , check){
  var object = _(id);
  if(object == null){
    alert("No exist.");
    return;
  }

  var nodes = object.getElementsByTagName("input");
  for(var i = 0; i < nodes.length; i++){
    var item = nodes.item(i);
    if(item.getAttribute("type") == "checkbox"){
      item.checked = check;
    }
  }
}

function fnMoveAction(){
    
   var wac = _('wac_move_select').value;
   
   if(wac == '') {
     alert('Please select target WebActionCollection');
     return;
   }

   if(wac == '<%=strWAC%>'){
     alert('Please select another WebActionCollection. source == target');
     return;
   }
   var wa = '';
   var object = _('wa');
   var nodes = object.getElementsByTagName("input");
   for(var i = 0; i < nodes.length; i++){
   var item = nodes.item(i);
   if(item.getAttribute("type") == "checkbox"){
      if(item.checked == true){
         wa = wa + item.value + ',';
      }
    }
  }
  if(wa.endsWith(',')) wa = wa.substring(0, wa.length -1);
  if(confirm('Really move these actions?')){
    var p = {select_wa : wa , select_wac : wac};
    $.ajax({ type: "POST", url: "/Anaconda.do?CMD=CMD_SEQ_107546574051581323015100", data: p, success: (data)=>{
       alert("success !!!!, your request was applied");
       location.reload();
    }, error : function(request, status, error ) {  
       alert("error !!!!! " + error  + " ["+request.responseText+"]");
       location.reload();
    },dataType: 'text'});
  }
}
</script>
</p>
		<table class="table_hydra" cellspacing="0" cellpadding="0">
		<colgroup>
		<col width="20%">
		<col width="8%">
                <col width="60%">
		<col width="12%">
		</colgroup>
		<thead >
		<tr>
		<th scope="col">Action group</th>
		<th scope="col">
                   <input type="checkbox" id="checkAll" name="checkAll" onClick="check(this)">
                </th>
                <th scope="col">
                 Action name
                  <button type="button" style="margin-left:10px;" class="btn btn-warning" name="Move" value="Move to action group >>" onClick="javascript:fnMoveAction();">Move to action group >></button>
                  <select id="wac_move_select" name="wac_move_select">
		     <option value="">Move action group</option>
    		<%
		  try{
		    WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();
		    WebActionCollection webActionCollection = null;
		    Iterator it = xmlResource.getWebActionCollection();
		    for(int cnt = 1 ;it.hasNext();cnt++){
      		      webActionCollection = (WebActionCollection)it.next();
		      if(!webActionCollection.hasOwner(strSessionValue)) continue;
		      String strWACName = webActionCollection.getWEBACTION_NAME();
		      String strWACKName = webActionCollection.getWEBACTION_KOR_NAME();
		%>
		      <option value="<%=strWACName%>"><%=strWACKName %></option>
		<%
		   }
		}catch(Exception e){
                %>
                   <%=e.toString()%>
                <%  
		}
		%>
		  </select>

                </th>
		<th scope="col">Menu</th>
                <th scope="col">Function</th>
		</tr>
		</thead>
		<tbody id="wa">
		<%
			try
			{
				WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();
				Iterator it = xmlResource.getWebActionCollection();
				WebActionCollection webActionCollection = null;
				WebAction action = null;
 
				if (!strText.equals("") && strText!= null && strParam.equals("COMMAND_NAME")) {
					it = xmlResource.searchWebActionLikeCommand(strText);
				} else if (!strText.equals("") && strText!= null && strParam.equals("ACTION_ISAUTH")) {
					it = xmlResource.searchWebActionLikeIsAuth(strText);
				} else if (!strText.equals("") && strText!= null && strParam.equals("ACTION_NAME")) {
					it = xmlResource.searchWebActionLikeActionName(strText);
				} else if (!strText.equals("") && strText!= null && strParam.equals("ACTION_KORNAME")) {
					it = xmlResource.searchWebActionLikeActionKorName(strText);
				}

				for (int ii = 0 ;it.hasNext() && ii <= MAX_COL+1 ; ii++)
				{
				    if(strWAC.equals("ALL") && ii == 1) break;
					String strRowClass = "left";
					if(ii == MAX_COL+1)
					{
                                 %>
		 		<tr>
				<td colspan="5" class="left"><FONT SIZE="2" COLOR="#CC6600">Action limit - <%=MAX_COL%> Please use search.</FONT></td>
                                </tr>
                                 <%
					  break;
					}
				    webActionCollection = (WebActionCollection)it.next();
				    Iterator iterator = webActionCollection.iterator();
				    int iSize = (webActionCollection.size() >= MAX_PRC) ? MAX_PRC+1 : webActionCollection.size();
				    
				    if(strWAC.equals("ALL") || strWAC.equals(webActionCollection.getWEBACTION_NAME()))
				    {
				    	int i = 0;
					    for(int j =0 ;iterator.hasNext() && j <  MAX_PRC ;j++)
					    {
							action = (WebAction)iterator.next();
                                                        String ajax_tag = "<span style='color:blue'>PAGE</span>";
                                                        if("".equals(action.getFORWARD()) || "NONE".equals(action.getFORWARD())){
                                                            ajax_tag = "<span style='color:red'>AJAX</span>";
                                                        }

                                                        if(BusinessHelper.checkNull(action.getBIZ_SERVICE())){
                                                            ajax_tag += "+<span style='color:red'>SERVICE</span>";
                                                        }


							if(!action.hasOwner(strSessionValue)) continue; 
                                       %>
					<tr>
                                       <%
							if(i == 0){
								String strSubstrColName = webActionCollection.getWEBACTION_KOR_NAME().length() > 23 ? webActionCollection.getWEBACTION_KOR_NAME().substring(0,23)+"..." : webActionCollection.getWEBACTION_KOR_NAME();
                                        %>
					  <td rowspan="<%=iSize%>" class="left" >
                                              <a href="javascript:fn_ActCollection('<%=webActionCollection.getWEBACTION_NAME()%>')" style='font-size:16px;'>
                                                  <%=strSubstrColName%>(<%=webActionCollection.size()%>)
                                               </a><br><br>
					  </td>
                                        <%
							}
			
							String strImg = "trinity_icon.gif";
							String strSize = "";
							if(!BusinessHelper.checkBusinessNull(action.getCOMMAND())){
								strImg = "no.png";
								strSize = "width=9px";
							}
                                         %>
                                         <td  class="<%=strRowClass%>">
                                            <input type="checkbox" name="<%=action.getNAME()%>" id="<%=action.getNAME()%>" value="<%=action.getNAME()%>">
					  </td>
					  <td  class="<%=strRowClass%>">
                                            <a  title="<%=action.getKOR_NAME()%>" href="javascript:fn_ActMod('<%=webActionCollection.getWEBACTION_NAME()%>','<%=webActionCollection.getWEBACTION_KOR_NAME()%>','<%=action.getNAME()%>','<%=action.getKOR_NAME()%>')" style='font-size:13px;color:#000000'><img src="/jsp/anaconda/img/<%=strImg%>" border=0 <%=strSize%> align='absmiddle'>&nbsp;[<%=ajax_tag%>]<%=BusinessHelper.getSubString(action.getKOR_NAME(),50,"...")%></a>
                                           </td>
                                           <td>
					    <button type="button" class="btn btn-info btn-sm" onClick="javascript:fnShowOrHideMenu('div_menu_<%=action.getNAME() %>');">MENU</button>
					  </td>
					  <div id="div_menu_<%=action.getNAME() %>" style="border:1px solid black;padding: 10px 30px;box-shadow: 5px 5px 5px;background:white;z-index:10000;position:absolute;display:none">
					   <img src='/jsp/anaconda/img/close.png' width='20px' height='20px' border='0' align='absmiddle' />&nbsp;&nbsp;
                                           <a href='javascript:fnShowOrHide("div_menu_<%=action.getNAME() %>");' style="font-size:12px;"><b>close</b></a>
					   <br/> 
					   <ul>
						<li><a href="/Anaconda.do?CMD=<%=action.getCOMMAND() %>" target='_trinity_new'>Show page</a></li>
						<li><a href="/Anaconda.do?CMD=CMD_SEQ_106266215691299298120448&command=<%=action.getCOMMAND() %>">Graphic designer</a></li>
						<li><a href="javascript:fn_ActDefaultMod('<%=webActionCollection.getWEBACTION_NAME()%>','<%=webActionCollection.getWEBACTION_KOR_NAME()%>','<%=action.getNAME()%>','<%=action.getKOR_NAME()%>','all')">Create Action+Service+View</a>&nbsp;</li>
						<li><a href="javascript:fn_ActDefaultMod('<%=webActionCollection.getWEBACTION_NAME()%>','<%=webActionCollection.getWEBACTION_KOR_NAME()%>','<%=action.getNAME()%>','<%=action.getKOR_NAME()%>','action_service')">Create Action+Service</a>&nbsp;</li>
						<li><a href="javascript:fn_ActDefaultMod('<%=webActionCollection.getWEBACTION_NAME()%>','<%=webActionCollection.getWEBACTION_KOR_NAME()%>','<%=action.getNAME()%>','<%=action.getKOR_NAME()%>','action_page')">Create Action+View</a>&nbsp;</li>
						<li><a href="javascript:fn_ActMod('<%=webActionCollection.getWEBACTION_NAME()%>','<%=webActionCollection.getWEBACTION_KOR_NAME()%>','<%=action.getNAME()%>','<%=action.getKOR_NAME()%>')">Modify action</a></li>
						<li><a href="/Anaconda.do?CMD=CMD_SEQ_103615773161287821449749&srh_param=COLLECTION_NAME&inputText=<%=action.getBIZ_SERVICE() %>">Modify service</a></li>
				<% if (BusinessHelper.checkBusinessNull(action.getFORWARD())){ %>
 					       <li><a href="javascript:fnViewView('<%=webActionCollection.getWEBACTION_NAME()%>','<%=action.getFORWARD()%>')">Modify view</a></li>
				<%} %>
					       <li><a href="javascript:fnRoleView('Default','<%=action.getISAUTH() %>')">Modify access role</a></li>
					     </ul>
					</div>
				<%
				if(i == 0){
                                %>    
				 <td rowspan=<%=iSize%> align="center" class="<%=strRowClass%>" >
                                    <button type="button" style="margin-left:10px;" class="btn btn-danger" name="Move" value="Delete WebActionCollection" onClick="javascript:fn_ActDel('<%=webActionCollection.getWEBACTION_NAME()%>')">Delete WebActionCollection</button>
                                 </td>
                                <%
				}
                                %>
				</tr>
                                <%
				i++;
					}
				}
				if(webActionCollection.size() > MAX_PRC){
                                %>
		 		  <tr>
				    <td colspan="4" class="<%=strRowClass%>" ><B><FONT SIZE="2" COLOR="#CC6600">Action limit - <%=MAX_PRC%> Please use search.</FONT></B>
                                    </td>
				  </tr>
                                 <%
					}
				}
			} catch (Exception e) {
				ExceptionCenter.catchException(e);
			}
		%>
		</tbody>
		</table>
<!----------------------------------------- 리스트 보여주는 테이블 끝----------------------------------------->

<p></p>
