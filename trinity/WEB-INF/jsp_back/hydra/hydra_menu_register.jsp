<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

String application_key = "";
String application_name = "";
String application_code = "";
// String application_domain = "";
// String application_context  = "";
String application_vision = "";
String application_service = "";
String application_session  = "";
String application_crypt = "";
String application_crypt_level = "";
String application_notfound = "";
String application_error = "";
String application_http = "";
String application_https = "";
String application_image = "";
String application_image_path = "";

if(helper.checkBusinessNull(application_domain) && helper.checkBusinessNull(application_context))
{
	xs = xsm.getSite(application_domain,application_context);
	application_key = xs.getSiteId();
	application_name = xs.getSiteName();
	application_code = xs.getSiteCode();
	application_domain = xs.getDomain();
	application_context  = xs.getContext();
	application_session  = xs.getSessionClass();
	application_crypt = xs.getSecurityClass();
	application_crypt_level = xs.getSecurityLevel();
	application_notfound = xs.getPagenotfoundPage();
	application_error = xs.getErrorPage();
	application_http = xs.getSiteWWW();
	application_https = xs.getSiteWWWS();
	application_image = xs.getImageServer();
	application_image_path = xs.getImagePath();
}
%>


<script language="javascript">
function fnSave()
{
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
function doRuning(callerName)
{
showRunning(callerName);

}

function doRun(callerName , REQ)
{
	alert('Applied successfully');
	document.location.reload();
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
</script>

     <div class="ibox float-e-margins">
        <h2 class="fl">Create or Modify site's action</h2>
        <div class="form-group">
           <div class="fr">
              <button class="btn btn-primary"  type="button" value="Create" onClick="javascript:fnSave();" >Save or Update</button>
	      <button class="btn btn-secondary"  type="button" value="Back" onClick="javascript:history.back();" >Back</button>
           </div>
     </div>

<div class="ibox-content">
<form class="form-horizontal" method="post" id='frmWebApplication' name="frmWebApplication" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_101695493021289640195440"></input>
<input type="hidden" name="code" value=""></input>
<input type="hidden" name="application_key" value="<%=application_key %>"></input>
<input type="hidden" name="application_domain" value="<%=application_domain %>"></input>
<input type="hidden" name="application_context" value="<%=application_context %>"></input>

<div id='wac_check_div' style="display:none;"></div>

    <table>
    <thead>
       <th width="70%">Action group name</th>
       <th><input type="checkbox" class="i-checks" name="wac_all_checked"  onClick="javascript:fnAllCheck();"> Select all</th>
    </thead>
    <tbody>

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

<tr>
       <td><%=webActionCollection.getWEBACTION_KOR_NAME() %></td>
       <td>
         <input class="i-checks" type="checkbox" name="wac_checked" 
                 value="<%=webActionCollection.getWEBACTION_NAME() %>" 
                 kor_value='<%=webActionCollection.getWEBACTION_KOR_NAME() %>' <%=checked %>></input>
       </td>
    </tr>

<%
		}
	}
%>
    </tbody>
    </table>
  </form>
</div>
