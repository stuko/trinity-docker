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
        frmWebApplication.code.value = 'save_layout';
        frmWebApplication.application_domain.value = application_domain;
        frmWebApplication.application_context.value = application_context;
        frmWebApplication.application_wac_name.value = wac_name;
        frmWebApplication.application_layout.value = layout;
        var params = $("#frmWebApplication").serialize();
        $.ajax({
            type : 'post',
            url : '/Anaconda.do',
            data : params,
            dataType : 'text',
            error: function(data, status, error){
                alert(data + "," + status + "," + error);
            },
            success : function(data, status){
                alert('Applied successfully');
            }
            /* ,
            beforeSend: function(){
                $('.spinner').show()
            },
            complete: function(){
                $('.spinner').hide();
            } */
        });

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
function fnSearchLayout(fieldName)
{
	var args = '';
	window.open("/Anaconda.do?CMD=CMD_SEQ_107571796881288935101238&title=Layout&Object=opener.frmWebApplication."+fieldName+"&search=" + args,"","height=450,width=800,left=200,top=20,status=no, location=no, toolbar=no,resizable=yes, scrollbars=yes");
        return false;
}
</script>


<%@include file="/jsp/API/sub_top_common.jsp"%>

     <div class="ibox float-e-margins">
        <h2 class="fl">Select layout of site</h2>
        <div class="form-group">
           <div class="fr">
	      <button class="btn btn-secondary"  type="button" value="Back" onClick="javascript:history.back();" >Back</button>
           </div>
     </div>


<table>

<form class="form-horizontal"  method="post" name="frmWebApplication" id="frmWebApplication" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_101695493021289640195440"></input>
<input type="hidden" name="code" value=""></input>
<input type="hidden" name="application_key" value="<%=application_key %>"></input>
<input type="hidden" name="application_domain" value="<%=application_domain %>"></input>
<input type="hidden" name="application_context" value="<%=application_context %>"></input>
<input type="hidden" name="application_wac_name" value=""></input>
<input type="hidden" name="application_layout" value=""></input>


    <thead>
       <th width="10%">Seq.</th>
       <th>Action group name</th>
       <th>Layout name</th>
       <th>Function</th>
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
       <td><input type="text" class="styled" 
                               name="<%=webActionCollection.getWEBACTION_NAME() %>" 
                               value="<%=(String)obj %>" size="30"></input>
       </td>
       <td>
	      <button class="btn btn-primary" type="button" value="Back" onClick="javascript:fnSave('<%=application_domain %>','<%=application_context %>','<%=webActionCollection.getWEBACTION_NAME() %>',frmWebApplication.<%=webActionCollection.getWEBACTION_NAME() %>.value);" >Save</button>
	      <button class="btn btn-secondary" value="" type="button" onClick="javascript:fnSearchLayout('<%=webActionCollection.getWEBACTION_NAME()%>');" >Search</button>
      </td>
    </tr>
<%
			}
		}
	}
%>
   </tbody>
</table>
</form>
  </div>

  <%@ include file="/jsp/API/sub_footer_common.jsp" %>
