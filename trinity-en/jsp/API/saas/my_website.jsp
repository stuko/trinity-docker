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
</script>

<div id="page-wrapper" class="gray-bg dashbard-1">

      <%@include file="/jsp/API/sub_top_common.jsp"%>

             <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>My Websites</h2>
                </div>
                <div class="col-lg-2">
                </div>
            </div>


      <div class="wrapper wrapper-content animated fadeInRight">

            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>Your registered websites</h5>
                           <div>
                            <button class="btn btn-sm btn-primary pull-right m-t-n-xs" type="button" onClick="javascript:fnRegisterApplication();">
                              <strong>Register website</strong>
                           </button>
                          </div>
                        </div>
                        <div class="ibox-content">

                            <table class="footable table table-stripped toggle-arrow-tiny">
                                <thead>
                                <tr>
                                    <th data-toggle="true">No</th>
                                    <th>Website name</th>
                                    <th>Domain name</th>
                                    <th>Context Path</th>
                                </tr>
                                </thead>
                                <tbody>
<%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getMySites");
if(bc != null && bc.size() > 0)
{
	Iterator it = bc.iterator();
	for(int i = 1;it.hasNext();i++)
	{
		BusinessData bd = (BusinessData)it.next();
                String key = bd.getFieldValue("WebSiteCode");
                XtremeSiteManager xsm = XtremeSiteManager.getInstance();
                XtremeSite x = xsm.getXtremeSite(key);
                if(x != null){
%>
                                <tr>
                                    <td><%=i%></td>
                                    <td><%=x.getSiteName() %></td>
                                    <td><a href="/Anaconda.do?CMD=CMD_SEQ_107365064121289636666401&application_key=<%=x.getSiteId()%>"><i class="fa fa-check text-navy"><%=x.getDomain()%></i></a></td>
                                    <td><%=x.getContext() %></td>
                                </tr>
<%
                }
      }
}
%>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="5">
                                        <ul class="pagination pull-right"></ul>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
          
        </div>

<%@ include file="/jsp/API/sub_footer_common.jsp" %>
 </div>
	
































