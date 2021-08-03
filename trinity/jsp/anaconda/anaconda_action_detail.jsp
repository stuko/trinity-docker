<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.util.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.business.BusinessHelper"%>

<%
	// request.setCharacterEncoding("EUC-KR");
	String 	strActColName		= request.getParameter("ActColName");
	// String 	strActColKorName	= (new String(request.getParameter("ActKorColName").getBytes("8859_1"),"euc-kr"));
	String 	strActColKorName	= request.getParameter("ActKorColName");
	String 	name 				= request.getParameter("ActName");
	// String 	korname				= (new String(request.getParameter("ActKorName").getBytes(),"euc-kr"));
	String 	korname				= request.getParameter("ActKorName");
//	String	korname 			= request.getParameter("ActKorName");
	String	command				= null;
	String	isauth				= null;
	String	default_parameter	= null;
	String	validation_class	= null;
	String	forward				= null;
	String	action_class		= null;
	String	type				= null;
	String	desc				= null;
	String	nextaction			= null;
	String	bizservice			= null;
	String	aop_intercepter		= null;
	String	aop_pointclass		= null;
	String	aop_pointmethod		= null;
	String  filter_ignore       = null;
	String  action_forward_type = null;
	String  error_page          = null;
	String  strSearchActionButtonDisplay = "none";
	String  strSessionValue = "";
	try
	{
		WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();
		strActColKorName = xmlResource.getWebActionCollection(strActColName).getWEBACTION_KOR_NAME();
		WebAction action = xmlResource.searchWebActionEqualsName(strActColName, name);
		
		name = action.getNAME();
		command = action.getCOMMAND();
		isauth = action.getISAUTH();
		default_parameter = action.getDEFAULT_PARAMETER();
		validation_class = action.getVALIDATION_CLASS();
		forward = action.getFORWARD();
		action_class = action.getACTION_CLASS();
		type = action.getTYPE();
		desc = action.getDESC();
		filter_ignore = action.getFILTER_IGNORE();
		nextaction = action.getNEXT_ACTION();
		bizservice = action.getBIZ_SERVICE();
		aop_intercepter = action.getAOP_INTERCEPTER();
		aop_pointclass = BusinessHelper.convert(action.getAOP_POINT_CLASS());
		aop_pointmethod = BusinessHelper.convert(action.getAOP_POINT_METHOD());
		action_forward_type = action.getFORWARD_TYPE();
		error_page = action.getERROR_PAGE();
		korname = action.getKOR_NAME();
		strSessionValue = action.getOWNER();
		if(!BusinessHelper.checkBusinessNull(strSessionValue))
		{
			RequestHelper helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
			DefaultAuth auth = (DefaultAuth)helper.getSessionObject();
			if(auth != null)
			{
				strSessionValue = auth.getAuthItem(("MEMBER_NAME"));	
			}
		}

	} catch (Exception e) {
		ExceptionCenter.catchException(e);
	}
%>
<script language="javascript">
<!--
function fn_ChkInput_1()
{
	with(frm)
	{
		if(chkForward.checked == true)
		{
			forward.value = "<%=forward%>";
			forward.disabled = true;
		} else {
			forward.value = "NONE";
	    	forward.disabled = false;
	    }
	}
}

function fn_ChkInput_2()
{
	with(frm)
	{
		if(chkView.checked == true)
		{
			bizservice.value = "<%=bizservice%>";
			bizservice.disabled = true;
		} else {
			bizservice.value = "NONE";
	    	bizservice.disabled = false;
	    }
	}
}

function submitForm()
{
	if(!confirm("If you didn't change owner info, Service will be created by current login user.")) return;
	with(frm)
	{
		if(bizservice.disabled == true)
		{
			bizservice.disabled = false;
		}

		if(forward.disabled == true)
		{
			forward.disabled = false;
		}
		AnacondaSubmit(document.frm);
	}
}


function copyAction()
{
	var isViewCopy = confirm("Really copy?");
	if(isViewCopy)
	{
		with(frm)
		{
			if(bizservice.disabled == true)
			{
				bizservice.disabled = false;
			}

			if(forward.disabled == true)
			{
				forward.disabled = false;
			}

			if(isViewCopy  == true)
			{
				viewCopy.value = "Y";
			}
			else
			{
				viewCopy.value = "N";
			}
			
			code.value="copy";
			AnacondaSubmit(document.frm);
		}
	}
	return false;
}
function createInterceptor()
{
	with(frm)
	{
		if(aop_point_method.value == null && aop_point_class.value == null)
		{
			alert("If you want to make interceptor class, You have to write before or after interceptor source");
			return;
		}
		
	}
	var bAnswer = confirm("Really create interceptor class?");
	if (bAnswer == true) 
	{
		var action = null;
		if(action == null || action == '') action = 'CMD_SEQ_108926607101288444373042';
		callAjax(action, "/Anaconda.do?CMD=CMD_SEQ_108926607101288444373042&BizCol=<%=strActColName%>&BizProc=<%=name%>");
	} else {
		alert("cancelled.");
		return;
	}
}
function doRun(action, REQ)
{
    alert(REQ.responseText);
	alert("Congratulation. Your request was applied successfully");
}

function selectForwardType(selectBox)
{
	if(selectBox.selectedIndex == 1)
	{
		viewSearchActionButton();
	}
	else
	{
		closeSearchActionButton();
	}
}

function viewSearchActionButton()
{
	var objButton = document.getElementById('searchActionButton');
	objButton.style.display = "block";
}

function closeSearchActionButton()
{
	var objButton = document.getElementById('searchActionButton');
	objButton.style.display = "none";
}


function fnSearchAction()
{
	window.open("/Anaconda.do?CMD=CMD_SEQ_109181124291288240727842&title=Search&Object=opener.document.frm.forward","","height=500,width=650,left=200,top=20,status=no, location=no, toolbar=no,resizable=yes,scrollbars=yes");	
}

function fn_FindView(args)
{
	window.open("/Anaconda.do?CMD=CMD_SEQ_107594712551287278742442&col_name="+args+"&title=Search","ViewBiz","height=400,width=640,left=200,top=20,status=no, location=no, toolbar=no, resizable=yes, scrollbars=yes");
}


function fn_FindBiz()
{
	window.open("/Anaconda.do?CMD=CMD_SEQ_109678783811287278764362&title=Search","FindBiz","height=400,width=560,left=200,top=20,status=no, location=no, toolbar=no, resizable=yes, scrollbars=yes");
}
function showAction(div_object)
{
	var obj = _(div_object);
	if(obj.style.display == 'none') obj.style.display = 'block';
	else  obj.style.display = 'none';
}
//-->
</script>


<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Modify Action Info</h3>
					<span class="fr"><button  type="button" class="btn btn-primary" name="Register" value="Copy" onClick="javascript:copyAction();return false;">Copy</button></span>
					<span class="fr"><button  type="button"  id="actionGroupShow" class="btn btn-secondary" name="Register" value="Modify" onClick="javascript:submitForm();return false;">Modify</button></span>
					<span class="fr"><button  type="button"  id="actionGroupShow" class="btn btn-info" name="Register" value="Back" onClick="javascript:history.back();">Back</button></span>
			</div>
		</div>
	</div>
</div>



<form name="frm" method="post" action="/Anaconda.do?CMD=CMD_SEQ_101546663451287795733194" onSubmit="return false;">
<input type="hidden" name="code" value="mod">
<input type="hidden" name="ActColName" value="<%=strActColName%>">
<input type="hidden" name="name" value="<%=name%>">
<input type="hidden" name="viewCopy" value="">
<input type="hidden" name="command" value=<%=command%>>
<input type="hidden" name="ActColKorName" value="<%=strActColKorName%>">

<table class="table_hydra" cellspacing="1" cellpadding="1">
		<colgroup>
		<col width="30%">
		<col>
		</colgroup>
		<thead>
		<tr>
		<th scope="col">Action attribute</th>
		<th scope="col">Value</th>
		</tr>
		</thead>
		<tbody>
	  	<tr>
		  <td>Action Group</td>
		  <td>&nbsp;<b><%=strActColKorName%></b></td>
  		</tr>
  		<tr>
		  <td>Action Name</td>
		  <td>&nbsp;<b><input type="text" class="styled" name="korname" value="<%=korname%>" size="50"></b></td>
  		</tr>
  		<tr>
		  <td>Action Role</td>
		  <td>&nbsp;<SELECT NAME='isauth'>
		  <OPTION value='N' <%=isauth.equals("N")?"selected":""%>>N/A</OPTION>
		 <%
		 	XtremeRoleManager res = XtremeRoleManager.getInstance();
		 	XtremeRoleCollection col = res.getRoleCollection("Default");
		 	if(col != null)
		 	{
			 	for(int i = 0;i < col.size(); i++)
			 	{
			 			XtremeRole role = (XtremeRole)col.get(i);
			 %>	  
				  <OPTION value='<%=role.getRole_name() %>' <%=isauth.equals(role.getRole_name())?"selected":""%>><%=role.getRole_kor_name() %></OPTION>
		  	<%
			 	}
		 	}
	  	%>	
	  		</SELECT>
	  	</td>
  		</tr>
		</tbody>
		</table>
	<br>
	<p>
    	<a href="javascript:showAction('div_action');">
		<img src="/jsp/anaconda/img/plus.png" width="15px"  border="0" align="absmiddle"></img>&nbsp;More
		</a>
		  &nbsp;&nbsp;
    	<a href="javascript:showAction('div_interceptor');">
		<img src="/jsp/anaconda/img/plus.png" width="15px" border="0" align="absmiddle"></img>&nbsp;Interceptor
		</a>
		  &nbsp;&nbsp;
	     <a href="/Anaconda.do?CMD=CMD_SEQ_105760595001287408553144&View=<%=forward %>">
		  <img src="/jsp/anaconda/img/go.png" width="15px" border="0" align="absmiddle"></img>&nbsp;Go to view detail</a>
		  &nbsp;&nbsp;
		 <a href="/Anaconda.do?CMD=CMD_SEQ_103615773161287821449749&srh_param=COLLECTION_NAME&inputText=<%=bizservice %>">
		  <img src="/jsp/anaconda/img/go.png" width="15px" border="0" align="absmiddle"></img>&nbsp;Go to service detail</a>
   </p>
   <p></p>
		<div id="div_action" style="display:block;margin-top:10px;">
		<table class="table_hydra" cellspacing="1" cellpadding="1">
		<colgroup>
		<col width="30%">
		<col>
		</colgroup>
		<tbody>
  		<tr>
		  <td>Action Group Code</td>
		  <td>&nbsp;<%=strActColName%></td>
  		</tr>
  		<tr>
		  <td>Action Code/Name</td>
		  <td>&nbsp;<%=name%></td>
  		</tr>
  		<tr>
		  <td>Command</td>
		  <td>&nbsp;<%=command%></td>
  		</tr>
  		<tr>
		  <td>Default argument</td>
		  <td>
               &nbsp;<input type="text" class="styled" name="default_parameter"  id="default_parameter" size="55" value="<%=default_parameter%>">
               <select name="ref_default" id="ref_default" class="styld">
                   <option value="NA">Select below process type</option>
                   <option value="code=create">Register process</option>
                   <option value="code=list">List process</option>
                   <option value="code=read">Read process</option>
                   <option value="code=update">Update process</option>
                   <option value="code=delete">Delete process</option>
               </select> 
                  </td>
  		</tr>
  		<tr>
		  <td>Validation Class</td>
		  <td>&nbsp;<input type="text" class="styled" name="validation_class" size="55" value="<%=validation_class%>"></td>
  		</tr>
  		<tr>
		  <td>Forward Type</td>
		  <td>&nbsp;<SELECT NAME='forward_type' onChange="javascript:selectForwardType(this)">
			  <OPTION value='VIEW' <%=action_forward_type.equals("VIEW")?"selected":""%>>Normal view</OPTION>
			  <OPTION value='ACTION' <%=action_forward_type.equals("ACTION")?"selected":""%>>Another action</OPTION>
	  		</SELECT>
		  </td>	
  		</tr> 	
  		<tr>
		  <td>Have a view?</td>
		  <td>&nbsp;&nbsp;<input type="checkbox" name="chkForward" checked onClick="javascript:fn_ChkInput_1();">&nbsp;&nbsp;(Checked: Have view, Not checked: Does not have view)</td>	
  		</tr> 	
  		
  			
  		<tr>
		  <td>View</td>
		  <td>
		  &nbsp;<input type="text" class="styled" name="forward" size="40" value="<%=forward%>" disabled>&nbsp;&nbsp;
		  &nbsp;&nbsp;<button type="button" class="btn btn-primary" value="Select view" checked onClick="javascript:fn_FindView('<%=strActColName%>');">Select a View</button>
		  <% if(action_forward_type.equals("ACTION")){ strSearchActionButtonDisplay = "block"; } %>
		  <div id="searchActionButton" style="display:<%=strSearchActionButtonDisplay %>">
		  &nbsp;&nbsp;<button type="button" class="btn btn-secondary" name="" value="Search action" onClick="javascript:fnSearchAction();">Search a action</button>
		  </div>
		  
		  </td>
  		</tr>
  		<tr>
		  <td>Action Class</td>
		  <td>&nbsp;<input type="text" class="styled" name="action_class" size="55" value="<%=((action_class == null || action_class.equals("null") || action_class.equals("")) ? "com.stuko.anaconda.action.XCAction" : action_class) %>"></td>
  		</tr>
  		<tr>
		  <td>Action Type</td>
		  <td>&nbsp;<input type="text" class="styled" name="type" size="55" value="<%=((type == null || type.equals("null") || type.equals("")) ? "ACTION" : type)%>"></td>
  		</tr>
  		<tr>
		  <td class="list_top" width="200">Description</td>
		  <td>&nbsp;<input type="text" class="styled" name="desc" size="55" value="<%=desc%>"></td>
  		</tr>
  		<tr>
		  <td class="list_top" width="200">Next Action</td>
		  <td>&nbsp;<input type="text" class="styled" name="nextaction" size="55" value="<%=nextaction%>"></td>
  		</tr>
  		<tr>
		  <td class="list_top" width="200">Business Service</td>
		  <td>&nbsp;<input type="text" class="styled" name="bizservice" size="40" value="<%=bizservice%>" disabled>&nbsp;&nbsp;
		  &nbsp;&nbsp;<input type="checkbox" name="chkView" checked onClick="javascript:fn_ChkInput_2();">&nbsp;&nbsp;<button type="button" class="btn btn-info" value="Search service" checked onClick="javascript:fn_FindBiz();">Search a service</button>
		  </td>
  		</tr>
 		<tr>
		  <td class="list_top" width="200">Use filter?</td>
		  <td>&nbsp;<SELECT NAME='filter_ignore'>
		  <%
		  if(!BusinessHelper.checkBusinessNull(filter_ignore))
			  filter_ignore  = "N";
		  %>
		  <OPTION value='N' <%=filter_ignore.equals("N")?"selected":""%>>Use</OPTION>
		  <OPTION value='Y' <%=filter_ignore.equals("Y")?"selected":""%>>Not Use</OPTION></SELECT></td>
  		</tr>
 		<tr>
		  <td class="list_top" width="200">When error? What page?</td>
		  <td>&nbsp;<input type="text" class="styled" name="error_page" size="55" value="<%=error_page%>"></td>
  		</tr> 		
		<tr>
		  <td class="list_top" width="200">Owner</td>
		  <td>&nbsp;<input type="text" class="styled" name="owner" size="20" value="<%=strSessionValue%>"></td>
  		</tr> 		
  		<!--tr>
		  <td class="list_top" width="200">aop_intercepter</td>
		  <td>&nbsp;<input type="text" class="styled" name="aop_intercepter" size="55" value="<%=aop_intercepter%>"></td>
  		</tr>
  		<tr>
		  <td class="list_top" width="200">aop_pointclass</td>
		  <td>&nbsp;<input type="text" class="styled" name="aop_pointclass" size="55" value="<%=aop_pointclass%>"></td>
  		</tr>
  		<tr>
		  <td class="list_bottom" width="200">aop_pointmethod</td>
		  <td>&nbsp;<input type="text" class="styled" name="aop_pointmethod" size="55" value="<%=aop_pointmethod%>"></td>
  		</tr-->
		</tbody>
		</table>
		</div>

		</p>
	<p>
		
   </p>
   <br>
		<div id="div_interceptor" style="display:block">

		<div id="table-content">
			<div class="side-content">
				<div class="content-module">
					<div class="content-module-heading cf">
					<h3 class="fl">Action Interceptor</h3>
							<span class="fr"><button type="button" class="btn btn-info" name="Register" value="+ Create Interceptor class" onClick="javascript:createInterceptor();">+ Create Interceptor class</button></span>
					</div>
				</div>
			</div>
		</div>		

        <p>Reserved Word</p>
		<ul>
			<li>BusinessDataParameter (Parameter Object)
			<li>MasterReturnValue (Return Object)
			<li>Req,Res (HttpRequest, HttpResponse Object)</li>
		</ul>
		<table class="table_hydra" cellspacing="0" cellpadding="0">
		<colgroup>
		<col width="15%">
		<col width="85%">
		</colgroup>
		<tbody>
  		<tr>
		  <td class="left">Class</td>
		  <td>&nbsp;<input type="text" class="styled" name="aop_intercepter" size="50" value="<%=aop_intercepter%>">
		  &nbsp;<SELECT NAME='intercepter_type' onChange="javascript:selectIntercepterType(this.selectedIndex);">
			    <OPTION value='' selected>write directly</OPTION>
			    <OPTION value='com.stuko.anaconda.intercepter.ConditionalActionIntercepter'>Conditional</OPTION>
			    <OPTION value='com.stuko.anaconda.intercepter.SimpleActionIntercepter'>Simple</OPTION>
	  		   </SELECT>
		  </td>
  		</tr>
  		<tr>
		  <td class="left">Before</td>
		  <td>&nbsp;<textarea class="styled code" name="aop_point_method" style="width:90%;height:100px;" wordWrap="true"></textarea></td>
  		</tr>
  		<tr>
    	  <td class="left">After</td>
    	  <td>&nbsp;<textarea class="styled code" name="aop_point_class" style="width:90%;height:100px;"  wordWrap="true"></textarea></td>
  		</tr>
		</tbody>
	  </table>
	  </div>
	  <p>
	  </p>
<!--table>
  <tr>
  	<td align="right"><input type="button" class="button white" name="" value="Copy" onclick="javascript:copyAction();"/></td>
    <td align="right"><input type="button" class="button white" name="" value="Modify" onclick="javascript:submitForm();"/></td>
    <td align="left"><input type="button" class="button white" name="" value="Back" onClick="javascript:history.back();"/></td>
  </tr>
</table-->
</form>
<br>

<DIV id="AOPBEFORE" style="visibility:hidden"><%=aop_pointmethod%></DIV>
<DIV id="AOPAFTER" style="visibility:hidden"><%=aop_pointclass%></DIV>
<SCRIPT LANGUAGE="JavaScript">

$(function(){
    $('#ref_default').change(function(){
        $('#default_parameter').val($(this).val());    
    });
});

<!--
function selectIntercepterType(idx)
{
	if(idx != 0) frm.aop_intercepter.value = frm.intercepter_type[idx].value;
}

var strData = AOPBEFORE.innerHTML;
// alert(strData.replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/\<BR\>/g,"\n"));
frm.aop_point_method.value = strData.replace(/&#47;/g,"/").replace(/&gt;/g,">").replace(/&lt;/g,"<").replace(/&quot;/g,"\"").replace(/<BR>/g,"\r\n").replace(/&#39;/g,"\'").replace(/&amp;/g,"&");
// frm.aop_point_method.innerHTML = strData;
// alert(frm.aop_point_method.value);
strData = AOPAFTER.innerHTML;
frm.aop_point_class.value = strData.replace(/&#47;/g,"/").replace(/&gt;/g,">").replace(/&lt;/g,"<").replace(/&quot;/g,"\"").replace(/<BR>/g,"\r\n").replace(/&#39;/g,"\'").replace(/&amp;/g,"&");
// frm.aop_point_class.innerHTML = strData;
// alert(strData);
// alert(frm.aop_point_class.value);
//-->
</SCRIPT>
