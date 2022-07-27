<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.xtreme.site.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.action.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%
BusinessHelper helper = new BusinessHelper();
String application_domain = helper.nullToString(request.getParameter("application_domain"));
String application_context = helper.nullToString(request.getParameter("application_context"));
XtremeSiteManager xsm = XtremeSiteManager.getInstance();
XtremeSite xs = null;

String application_key = helper.nullToString(request.getParameter("application_key"));
String application_name = "";
String application_code = "";
// String application_domain = "";
// String application_context  = "";
String application_vision = "";
String application_service = "";
String application_auth = "";
String application_session  = "";
String application_crypt = "";
String application_crypt_level = "";
String application_notfound = "";
String application_error = "";
String application_http = "";
String application_https = "";
String application_image = "";
String application_role = "";
String application_image_path = "";
String application_index_page = "";
//out.println(application_key);
if(helper.checkBusinessNull(application_key))
{
	xs = xsm.getXtremeSite(application_key);
	if(xs != null)
	{
		application_key = xs.getSiteId();
		application_name = xs.getSiteName();
		application_code = xs.getSiteCode();
		application_domain = xs.getDomain();
		application_context  = xs.getContext();
		application_auth = xs.getAuthClass();
		application_session  = xs.getSessionClass();
		application_crypt = xs.getSecurityClass();
		application_crypt_level = xs.getSecurityLevel();
		application_notfound = xs.getPagenotfoundPage();
		application_error = xs.getErrorPage();
		application_http = xs.getSiteWWW();
		application_https = xs.getSiteWWWS();
		application_image = xs.getImageServer();
		application_image_path = xs.getImagePath();
		application_index_page = xs.getIndexPage();
		application_role = xs.getRole();
	}
}
%>
<script language="javascript">
function fnSave()
{
	with(frmApplication)
	{
		if(application_name.value == '')
		{
			alert('Please input a site name.');
			application_name.focus();
			return;
		}	
		if(application_domain.value == '')
		{
			alert('Please input a site domain.');
			application_domain.focus();
			return;
		}
		
		code.value= "save";
		callAjaxByForm("fnSave", "frmApplication");	
	}
}
function fnUpdate()
{
	with(frmApplication)
	{
		if(application_name.value == '')
		{
			alert('Please input a site name.');
			application_name.focus();
			return;
		}	
		if(application_domain.value == '')
		{
			alert('Please input a site domain.');
			application_domain.focus();
			return;
		}
	
		code.value= "update";
		callAjaxByForm("fnUpdate", "frmApplication");			
	}
}
function fnRemove()
{
	with(frmApplication)
	{
		if(confirm('Really delete?'))
		{
			code.value= "remove";
			callAjaxByForm("fnRemove", "frmApplication");
		}			
	}
}

/*
function fnAddMenu(application_domain,application_context)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_104121137231289721497807&application_domain=" + application_domain + "&application_context=" + application_context;
}
*/
function fnAddLayout(application_domain,application_context)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_102708870041289785941917&application_domain=" + application_domain + "&application_context=" + application_context;
}
function fnAddRole(application_domain,application_context)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_101919339001289785954296&application_domain=" + application_domain + "&application_context=" + application_context;
}
function fnSaveMenu()
{
	if( frmWebApplication.wac_checked == null ) 
	{
		alert("There is no action to save or update.");
		return;
	}
	frmWebApplication.code.value= "save_wac";
	var node = document.createElement("div");
	for(var i = 0; i < frmWebApplication.wac_checked.length; i++)
	{
		if(frmWebApplication.wac_checked[i].checked == true)
		{
			// alert(frmWebApplication.wac_checked[i].getAttribute("kor_value"));
			var hidden = document.createElement("input");
			hidden.setAttribute("type","checkbox");
			hidden.setAttribute("name","wac_checked_values");
			hidden.value = frmWebApplication.wac_checked[i].value;
			node.appendChild(hidden);
		}
	}
	_('wac_check_div').appendChild(node);
	callAjaxByForm("fnSave", "frmWebApplication");	
}
function fnAddMenu(frm)
{
	var obj = _('application_menu_item');
	if(obj.value == '')
	{
		alert("Please input a action of site");
		return;
	}
	with(application_menu)
	{
		if(confirm('Really add?'))
		{
			// code.value= "ins";
            ActColKorName.value = obj.value;
			callAjaxByForm("fnAddMenu",'application_menu');
		}			
	}
}
function fnRemoveMenu(data)
{
	var obj = _('application_menu_item');
	with(application_menu)
	{
		action = "/Anaconda.do?CMD=CMD_SEQ_101470995971287801036583&actCol="+data;
		if(confirm('Really delete?'))
		{
			code.value= "remove";
            //ActColKorName.value = obj.value;
			ActColName.value = data;
			callAjaxByForm("fnRemoveMenu",'application_menu');
		}			
	}
}
function fnAddPage(wac, data)
{	
	var obj = _(data);
	if(obj.value == '')
	{
		alert("Please input a name of action");
		return;
	}
	with(application_menu)
	{
		if(confirm('Really add?'))
		{
			code.value= "addpage";
            //ActColKorName.value = obj.value;
			ActColName.value = wac;
			ActKorName.value = obj.value;
			callAjaxByForm("fnAddPage",'application_menu');
		}			
	}
}
function fnRemovePage(wac,wa)
{
	with(application_menu)
	{
		if(confirm('Really delete?'))
		{
			code.value= "removepage";
            //ActColKorName.value = obj.value;
			ActColName.value = wac;
			ActName.value = wa;
			callAjaxByForm("fnRemovePage",'application_menu');
		}			
	}
}
function fnModifyMenu(arg)
{
    document.location.href="/Anaconda.do?CMD=CMD_SEQ_104447509961287275593540&ActColName=" + arg;
}
function doRuning(callerName)
{
   showRunning(callerName);
}

function doRun(callerName , REQ)
{
	alert('Applied successfully.');
	//if(callerName == 'fnSave' || callerName == 'fnUpdate')
	//{
	//}
	//else
	//{
		document.location.reload();
	//}
}

function fnAllCheck()
{
	with(frmWebApplication)
	{
		for(var i = 0; i < wac_checked.length; i++)
		{
			if(wac_all_checked.checked == true)
				wac_checked[i].checked = true;
			else
				wac_checked[i].checked = false;
		}		
	}
}
function fnShowOrHideAction(btn,div_action)
{
  fnShowOrHide(div_action);
}
function closeAction(d){
  fnShowOrHide(d);
}
</script>

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Web site info.</h3>
			<span class="fr"><button type="button" class="btn btn-primary" name="Register" value="Create" onClick="javascript:fnSave();">Create</button></span>
			<span class="fr"><button type="button" class="btn btn-secondary" name="Register" value="Modify" onClick="javascript:fnUpdate();">Modify</button></span>
			<span class="fr"><button type="button" class="btn btn-danger" name="Register" value="Delete" onClick="javascript:fnRemove();">Delete</button></span>
			<% if(helper.checkBusinessNull(application_key)){ %>
			<span class="fr"><button type="button" class="btn btn-info" name="Register" value="Change layout" onClick="fnAddLayout('<%=application_domain %>','<%=application_context %>');">Change a Layout</button></span>
			<%} %>
			<span class="fr"><button type="button" class="btn btn-secondary" name="Register" value="Back" onClick="javascript:history.back();">Back</button></span>
			</div>
		</div>
	</div>
</div>	
<div style="width:85%">
<fieldset>
<legend>Web site basic info.</legend>
<form method="post" name="frmApplication" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_101695493021289640195440"></input>
<input type="hidden" name="code" value=""></input>
<input type="hidden" name="application_key" value="<%=application_key %>"></input>
<table class="table_hydra">
       <thead>
         <th width="30%">Attribute</th>
         <th>Value</th>
       </thead>
       <tbody>
<tr>
<td>Site name(*)</td>
<td><input type="text" name="application_name" class="styled" size="40" value="<%=application_name %>"></input>
(ex: Naver, daum, kakao....)</td>
</tr>
<tr>
<td>Domain name(*)</td>
<td><input type="text" name="application_domain" class="styled" size="40" value="<%=application_domain %>" ></input>
(ex: www.naver.com, host)
Please Enter the domain</td>
</tr>
</tbody>
</table>
<div id="div_application_detail" style="display:block;">
<table>
       <thead>
         <th width="30%">Attribute</th>
         <th>Value</th>
       </thead>
       <tbody>
<tr>
<td>Web site code(If you need)</td>
<td><input type="text" name="application_code" class="styled" size="40" value="<%=application_code %>" ></input></td>
</tr>
<tr>
<td>Welcomd page</td>
<td><input type="text" name="application_index_page" class="styled" size="40" value="<%=application_index_page %>" readonly></input></td>
</tr>
<tr>
<td>Context(If you need)</td>
<td><input type="text" name="application_context" class="styled" size="40" value="<%=application_context %>" ></input></td>
</tr>
<tr>
<td>Session management class</td>
<td><input type="text" name="application_session" class="styled" size="40" value="<%=application_session %>" ></input></td>
</tr>
<tr>
<td>Authentication class</td>
<td><input type="text" name="application_auth" class="styled" size="40" value="<%=application_auth %>" ></input></td>
</tr>
<tr>
<td>Security class</td>
<td><input type="text" name="application_crypt" class="styled" size="40" value="<%=application_crypt %>" ></input></td>
</tr>
<tr>
<td>En/Decrypt level</td>
<td><input type="text" name="application_crypt_level" class="styled" size="5" value="<%=application_crypt_level %>" ></input>(예:1,2,3)</td>
</tr>
<tr>
<td>Not found url</td>
<td><input type="text" name="application_notfound" class="styled" size="40" value="<%=application_notfound %>" ></input></td>
</tr>
<tr>
<td>When error occured</td>
<td><input type="text" name="application_error" class="styled" size="40" value="<%=application_error %>" ></input></td>
</tr>
<tr>
<td>http link</td>
<td><input type="text" name="application_http" class="styled" size="20" value="<%=application_http %>" ></input></td>
</tr>
<tr>
<td>https link</td>
<td><input type="text" name="application_https" class="styled" size="20" value="<%=application_https %>" ></input></td>
</tr>
<tr>
<td>Image server(if use)</td>
<td><input type="text" name="application_image" class="styled" size="40" value="<%=application_image %>" ></input></td>
</tr>
<tr>
<td>image path</td>
<td><input type="text" name="application_image_path" class="styled" size="40" value="<%=application_image_path %>" ></input></td>
</tr>
<tr>
<td>Role</td>
<td><input type="text" name="application_role" class="styled" size="40" value="<%=application_role %>" ></input></td>
</tr>
</tbody>
</table>
</div>
</form>
<p>&nbsp;</p>
</fieldset>
<fieldset>
<legend>Actions list</legend>
<form name="application_menu" id="application_menu" method="post" action="/Anaconda.do?CMD=CMD_SEQ_100257337341335010102129">
	<input type="hidden" name="application_key" value="<%=application_key %>"></input>
	<input type="hidden" name="ActColKorName" value=""/>
	<input type="hidden" name="ActColName" value=""/>
	<input type="hidden" name="ActKorName" value=""/>
	<input type="hidden" name="ActName" value=""/>
	<input type="hidden" name="code" value="ins" />
</form>
<form method="post" id='frmWebApplication' name="frmWebApplication" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_101695493021289640195440"></input>
<input type="hidden" name="code" value=""></input>
<input type="hidden" name="application_key" value="<%=application_key %>"></input>
<input type="hidden" name="application_domain" value="<%=application_domain %>"></input>
<input type="hidden" name="application_context" value="<%=application_context %>"></input>
<div id='wac_check_div' style="display:none;"></div>
<!--table>
<tr>
<td>
<input type="button" class="button white" value="Add or Modify actions list" onClick="javascript:fnSaveMenu();"></input>
<input type="button" class="button white" value="Back" onClick="javascript:history.back();"></input>
</td>
</tr>
</table-->
<table class="table_hydra">
<colgroup>
<col width="65%"></col>
<col></col>
</colgroup>
<thead>
<th scope="col">Action name</th>
<th scope="col">Function</th>
</thead>
<tbody>
   <tr>
    <td>
	<input type="text" name="application_menu_item" id="application_menu_item" value="" class="styled" size="60" />
	</td>
	<td><button type="button" class="btn btn-info" value="Add a action" onClick="javascript:fnAddMenu('application_menu');">Add a action</button>
	</td>
   </tr>
<%
	xs = xsm.getSite(application_domain,application_context);
	if(xs != null)
	{
		WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();
		Iterator it = xmlResource.getWebActionCollection();
		WebActionCollection webActionCollection = null;
		
		for(int ii = 1 ;it.hasNext();ii++)
		{
			String checked = "";
			webActionCollection = (WebActionCollection)it.next();
			if(xs != null)
			{
				String obj = xs.getWacLayoutName(webActionCollection.getWEBACTION_NAME());
				if(obj != null)
					checked = "checked";
			}
%>
<%
			if(checked.equals("checked"))
			{
%>
<tr>
<!--td><%=ii %></td-->
<td>
<div style="font-size:13px;color:blue;"><a href="/Anaconda.do?CMD=CMD_SEQ_108164918711286971872119&WAC=<%=webActionCollection.getWEBACTION_NAME()%>"><%=webActionCollection.getWEBACTION_KOR_NAME() %></a></div>
<div id="div_wa_<%=ii%>" style="position:absolute;display:none;background-color:white;border: 1px double #ccc;padding: 3px ;width:600px;height:400px;overflow:scroll;overflow-x:hidden;padding:3px;">
<table width="450px" class="table_hydra">
<colgroup>
<col></col>
<col width="35%"></col>
</colgroup>
<thead>
<th scope="col" style="width:70%;">Action name &nbsp;<button type="button" class="btn btn-secondary" onClick="javascript:closeAction('div_wa_<%=ii%>')">Close</button></th>
<th scope="col" style="width:30%;">Function</th>
</thead>
<tbody>
   <tr>
   <td>
            <input type="text" name="WAC_<%=webActionCollection.getWEBACTION_NAME()%>" id="WAC_<%=webActionCollection.getWEBACTION_NAME()%>" class="styled" size="30"></input>
	</td>
	<td><button type="button" class="btn btn-warning" value="Add" onClick="javascript:fnAddPage('<%=webActionCollection.getWEBACTION_NAME()%>','WAC_<%=webActionCollection.getWEBACTION_NAME()%>');">Add</button></td>
   </tr>

   <%
     Iterator wa_it =  webActionCollection.iterator();
	 for(;wa_it.hasNext();)
	 {
	       WebAction action = (WebAction)wa_it.next();
    %>
   <tr>
   <td>
           <%=action.getKOR_NAME()%>
	</td>
	<td><button type="button" class="btn btn-danger" value="Delete" onClick="javascript:fnRemovePage('<%=webActionCollection.getWEBACTION_NAME()%>','<%=action.getNAME()%>');">Delete</button></td>
   </tr>
    <%
	 }
	%>
</tbody>
</table>
</div>
</td>
<td>
<button id="btn_<%=ii%>" type="button" class="btn btn-secondary" value="Show action list" onClick="javascript:fnShowOrHideAction('btn_<%=ii%>','div_wa_<%=ii%>');">Show all</button>
<button id="btn_remove_<%=ii%>" type="button" class="btn btn-danger" value="Delete" onClick="javascript:fnRemoveMenu('<%=webActionCollection.getWEBACTION_NAME()%>');">Delete</button>
<button type="button" class="btn btn-info" value="Modify" onClick="javascript:fnModifyMenu('<%=webActionCollection.getWEBACTION_NAME()%>');">Modify</button>
<!--input type="checkbox" name="wac_checked" value="<%=webActionCollection.getWEBACTION_NAME() %>" kor_value='<%=webActionCollection.getWEBACTION_KOR_NAME() %>' <%=checked %>></input--></td>
</tr>
<%
			}
		}
	}
%>
</tbody>
</table>
</form>
</fieldset>
</div>
