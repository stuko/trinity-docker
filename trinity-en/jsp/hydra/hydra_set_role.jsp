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
function fnSave(application_domain,application_context,wac_name,layout)
{
	with(frmWebApplication)
	{
		code.value= "save_layout";
		application_layout.value = layout;
		application_wac_name.value = wac_name;
		callAjaxByForm("fnSave", "frmWebApplication");	
	}
}
function doRuning(callerName)
{
showRunning(callerName);

}

function doRun(callerName , REQ)
{
	alert('정상적으로 반영되었습니다.');
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
function fnSearchLayout(fieldName)
{
	var args = '';
	window.open("/Anaconda.do?CMD=CMD_SEQ_107571796881288935101238&title=레이아웃정보&Object=opener.frmWebApplication."+fieldName+"&search=" + args,"","height=450,width=800,left=200,top=20,status=no, location=no, toolbar=no,resizable=yes, scrollbars=yes");
}
</script>
		
<div class="post">
<h2 class="title"><font color="FFFFFF"><b><cite style="color:#CCFF99"><%=application_name %></cite> Layout 추가</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;
				</h2>
</div>
<table>
<tr>
<td>
<input type="button" class="button white" value="돌아가기" onClick="javascript:history.back();"></input>
</td>
</tr>
</table>
<form method="post" name="frmWebApplication" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_101695493021289640195440"></input>
<input type="hidden" name="code" value=""></input>
<input type="hidden" name="application_key" value="<%=application_key %>"></input>
<input type="hidden" name="application_domain" value="<%=application_domain %>"></input>
<input type="hidden" name="application_context" value="<%=application_context %>"></input>
<input type="hidden" name="application_wac_name" value=""></input>
<input type="hidden" name="application_layout" value=""></input>
<table class="table_hydra">
<caption>컨텐츠 추가</caption>
<colgroup>
<col width="10%"></col>
<col></col>
<col width="50%"></col>
</colgroup>
<thead>
<th scope="col">번호</th>
<th scope="col">컨텍스트</th>
<th scope="col" valign="middle">레이아웃</th>
</thead>
<tbody>
<%
	xs = xsm.getSite(application_domain,application_context);
	WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();
	Iterator it = xmlResource.getWebActionCollection();
	WebActionCollection webActionCollection = null;
	int i = 0;
	for(int ii = 1 ;it.hasNext();ii++)
	{
		String checked = "";
		webActionCollection = (WebActionCollection)it.next();
		if(xs != null)
		{
			Object obj = xs.getWacLayoutName(webActionCollection.getWEBACTION_NAME());
			if(obj != null)
			{
				i++;
%>
<tr>
<td><%=i %></td>
<td><%=webActionCollection.getWEBACTION_KOR_NAME() %></td>
<td><input type="text" class="styled" name="<%=webActionCollection.getWEBACTION_NAME() %>" value="<%=(String)obj %>" size="30"></input>
&nbsp;&nbsp;<input type="button" class="button white" value="저장" onClick="javascript:fnSave('<%=application_domain %>','<%=application_context %>','<%=webActionCollection.getWEBACTION_NAME() %>',frmWebApplication.<%=webActionCollection.getWEBACTION_NAME() %>.value);"></input>
&nbsp;&nbsp;<a href="javascript:fnSearchLayout('<%=webActionCollection.getWEBACTION_NAME()%>');" style="color:blue;"><img src="/jsp/anaconda/img/search_result.png" width="10px" height="10px" border="0" align="absmiddle"></img>찾기</a></td>
</tr>
<%
			}
		}
	}
%>
</tbody>
</table>
</form>

