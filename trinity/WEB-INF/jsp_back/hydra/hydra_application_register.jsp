<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.xtreme.site.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
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

if(helper.checkBusinessNull(application_key))
{
	xs = xsm.getXtremeSite(application_key);
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
%>


<script language="javascript">
function fnSave()
{
	with(frmApplication)
	{
		if(application_name.value == '')
		{
			alert('Please input site name.');
			application_name.focus();
			return;
		}	
		if(application_domain.value == '')
		{
			alert('Please input site domain.');
			application_domain.focus();
			return;
		}
		/**	if(application_index_page.value == '')
		{
			alert('Please input index page of site');
			application_index_page.focus();
			return;
		} **/
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
			alert('Please input site name.');
			application_name.focus();
			return;
		}	
		if(application_domain.value == '')
		{
			alert('Please input domain name');
			application_domain.focus();
			return;
		}
	/**	if(application_index_page.value == '')
		{
			alert('Please input index page of site');
			application_index_page.focus();
			return;
		} **/
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

function doRuning(callerName)
{
showRunning(callerName);

}

function doRun(callerName , REQ)
{
	alert('Applied successfully.');
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_108173637391288444301255";
}

function fnAddMenu(application_domain,application_context)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_104121137231289721497807&application_domain=" + application_domain + "&application_context=" + application_context;
}
function fnAddLayout(application_domain,application_context)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_102708870041289785941917&application_domain=" + application_domain + "&application_context=" + application_context;
}
function fnAddRole(application_domain,application_context)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_101919339001289785954296&application_domain=" + application_domain + "&application_context=" + application_context;
}

function fnSearchAction()
{
	window.open("/Anaconda.do?CMD=CMD_SEQ_109181124291288240727842&title=View&Object=opener.document.frmApplication.application_index_page","","height=500,width=800,left=200,top=20,status=no, location=no, toolbar=no,resizable=yes,scrollbars=yes");	
}


function fnOpenFile(path){

    document.location.href = '/Anaconda.do?CMD=CMD_SEQ_106594560501498179923551&path=' + path;
}

function fnGoList(){
   document.location.href = 'Anaconda.do?CMD=CMD_SEQ_108173637391288444301255';

}
</script>




<%@include file="/jsp/API/sub_top_common.jsp"%>

<div class="container">
     <div class="row">

               <div class="col">
                     <div class="content-module-heading cf">
<% if (xs == null) { %>
			<h3 class="fl">Create web site info</h3>
<% }else { %>
			<h3 class="fl">Modify web site info</h3>
<% } %>	
			<span class="fr">
<% if (xs == null) { %>
              <button class="btn btn-primary"  type="button" value="등록" onClick="javascript:fnSave();" >Create</button>
<% }else { %>
	      <button class="btn btn-secondary"  type="button" value="수정" onClick="javascript:fnUpdate();" >Modify</button>
	      <button class="btn btn-danger"  type="button" value="삭제" onClick="javascript:fnRemove();" >Delete</button>
<% } %>	
	      <button class="btn btn-info"  type="button" value="돌아가기" onClick="javascript:fnGoList();" >Go to List</button>
              <% if(helper.checkBusinessNull(application_key)){ %>
		<button class="btn btn-warning"  type="button" 
                       value="Add action group" onClick="javascript:fnAddMenu('<%=application_domain %>','<%=application_context %>');">+ Add action group</button>
		<button class="btn btn-info"  type="button" 
                       value="Modify layout of site" onClick="fnAddLayout('<%=application_domain %>','<%=application_context %>');">Modify layout of site</button>
    	      <%} %>
                           </span>
                      </div>

               </div>
       </div>
     <div class="row">
               <div class="col">

<form class="form-horizontal" method="post" name="frmApplication" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_101695493021289640195440"></input>
<input type="hidden" name="code" value=""></input>
<input type="hidden" name="application_key" value="<%=application_key %>"></input>


    <table>
       <thead>
         <th width="30%">Attribute</th>
         <th>Value</th>
       </thead>
       <tbody>
       <tr>
       <td>Site name(*)</td>
       <td><input type="text" name="application_name" class="styled inputed" value="<%=application_name %>"></input></td>
       </tr>
       <tr>
       <td>Site code(*)</td>
       <td><input type="text" name="application_code" class="styled" value="<%=application_code %>" ></input></td>
       </tr>
       <tr>
       <td>Domain name(*)</td>
       <td>
          <input type="text" name="application_domain" class="styled" value="<%=application_domain %>" ></input>
       </td>
       </tr>
       <tr>
       <td>Index page</td>
       <td>
          <input type="text" name="application_index_page" class="styled" value="<%=application_index_page %>"></input>
          <button id="searchActionButton" style="display:block;margin:4px;" type="button" class="btn btn-primary" name="" value="Search action" onClick="javascript:fnSearchAction();">Search a action</button>
       </td>
       </tr>
       <tr>
       <td>Context name(if need)</td>
       <td>
          <input type="text" name="application_context" class="styled" value="<%=application_context %>" ></input>
       </td>
       </tr>
       <tr>
       <td>Session management class name</td>
       <td>
          <input type="text" name="application_session" class="styled" value="<%=application_session %>" ></input>
          <br>ex) com.stuko.bestmember.auth.BestMemberSessionManagement
       </td>
       </tr>
       <tr>
       <td>Authentication class name</td>
       <td>
          <input type="text" name="application_auth" class="styled" value="<%=application_auth %>" ></input>
          <br>ex) com.stuko.anaconda.Auth.MemberAuth
       </td>
       </tr>
       <tr>
       <td>Security class name</td>
       <td>
          <input type="text" name="application_crypt" class="styled" value="<%=application_crypt %>" ></input>
           <br>ex) com.stuko.bestmember.auth.BestmemberSecurityManager
       </td>
       </tr>
       <tr>
       <td>Security level</td>
       <td>
          <input type="text" name="application_crypt_level" class="styled" value="<%=application_crypt_level %>" ></input>
          <br>(ex:1,2,3)
       </td>
       </tr>
       <tr>
       <td>Not found paage</td>
       <td>
          <input type="text" name="application_notfound" class="styled" value="<%=application_notfound %>" ></input>
          <!--<input id="open404" style="display:block;margin:4px;" type="button" class="button white" name="" value="Open file" onClick="javascript:fnOpenFile('<%=application_notfound%>');">-->
          <br>ex) /err/err500.html
       </td>
       </tr>
       <tr>
       <td>Common error page</td>
       <td>
         <input type="text" name="application_error" class="styled" value="<%=application_error %>" ></input>
         <!--<input id="open500" style="display:block;margin:4px;" type="button" class="button white" name="" value="Open file" onClick="javascript:fnOpenFile('<%=application_error%>');">-->
         <br>ex) /err/err500.html
       </td>
       </tr>
       <tr>
       <td>HTTP Protocol(If need)</td>
       <td>
          <input type="text" name="application_http" class="styled" value="<%=application_http %>" ></input>
       </td>
       </tr>
       <tr>
       <td>HTTPS Protocol(If need)</td>
       <td>
          <input type="text" name="application_https" class="styled" value="<%=application_https %>" ></input>
       </td>
       </tr>
       <tr>
       <td>Image server path(If need)</td>
       <td>
          <input type="text" name="application_image" class="styled" value="<%=application_image %>" ></input>
       </td>
       </tr>
       <tr>
       <td>Image server basic path(If need)</td>
       <td>
          <input type="text" name="application_image_path" class="styled" value="<%=application_image_path %>" ></input>
       </td>
       </tr>
       <tr>
       <td>Role(If need)</td>
       <td>
          <input type="text" name="application_role" class="styled" value="<%=application_role %>" ></input>
       </td>
       </tr>
      </tbody>
   </table>

</form>
     </div>
  </div>
</div>
  <%@ include file="/jsp/API/sub_footer_common.jsp" %>
