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
<script language="javascript">
function fnRegisterApplication()
{
	document.location.href="/Anaconda.do?CMD=CMD_SEQ_107365064121289636666401";
}
function fnSelectApplication(application_key)
{
	document.location.href="/Anaconda.do?CMD=CMD_SEQ_107365064121289636666401&application_key=" + application_key;
}
function fnDebug()
{
	document.location.href="/Anaconda.do?CMD=CMD_SEQ_101787643881289806558558";
}
function goMenu(app_id){
 document.location.href="/Anaconda.do?CMD=CMD_SEQ_102146802191334489600138&application_key=" + app_id;
}
function goMain(domain,context,cmd){
 var openNewWindow = window.open("about:blank");
 var ctx = '';
 if(context != null && context != '' && context != 'null') ctx = context + "/"; 
 openNewWindow.location.href="http://" + domain + "/" + ctx + "Anaconda.do?CMD="+cmd;
}
</script>

<%@include file="/jsp/API/sub_top_common.jsp"%>


<div class="wrapper wrapper-content">
  <div>
                     <div class="content-module-heading cf">
			<h3 class="fl">Domain List</h3>	
			<span class="fr">
                           <button type="button" class="btn btn-secondary" onClick="javascript:fnRegisterApplication();">
                              Create domain
                           </button>
                           </span>
                      </div>

  </div>
  <div>
<table>
 <thead>
    <tr>
      <th scope="col" width="5%">Num</th>
      <th scope="col" width="35%">Site name</th>
      <th scope="col" width="40%%">Domain</th>
      <th scope="col" width="40%">Function</th>
    </tr>
  </thead>
  <tbody>
<%
XtremeSiteManager xsm = XtremeSiteManager.getInstance();
DefaultXmlDataCollection dxdc = xsm.searchXtremeSite("");
Iterator it = dxdc.iterator();
for(int i = 0;it.hasNext();i++)
{
	DefaultXmlData dxd = (DefaultXmlData)it.next();
        if(dxd == null) continue;
        XtremeSite xs = xsm.getXtremeSite(dxd.getData("application_key"));
        if(xs == null) continue;
%>
     <tr>
          <td><%=i%></td>
          <td>	<a href="javascript:fnSelectApplication('<%=dxd.getData("application_key") %>');">
        <img src="/jsp/hydra/img/server.png" width=30 border=0 align="absmiddle"><%=dxd.getData("application_name") %></a>&nbsp;
        <span style="font-size:16px;"><a href="javascript:goMain('<%=dxd.getData("application_domain") %>','<%=dxd.getData("application_context") %>','<%=xs.getIndexPage() %>');"><i class="fas fa-link"></i></a></span>
       <!-- <button type="button" class="btn btn-warning btn-sm" onClick="javascript:goMain('<%=dxd.getData("application_domain") %>','<%=dxd.getData("application_context") %>','<%=xs.getIndexPage() %>');">GO</button> -->
          </td>
          <td><%=dxd.getData("application_domain") %></td>
          <td><button type="button" class="btn btn-info" onClick="javascript:goMenu('<%=dxd.getData("application_key") %>');">
                              Add or Delete action
                           </button>
          </td>
     </tr>
<%
}
%>     
   </tbody>
</table>              
                </div>
            </div>

   <%@ include file="/jsp/API/sub_footer_common.jsp" %>
