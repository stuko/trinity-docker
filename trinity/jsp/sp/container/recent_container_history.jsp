<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.filter.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.action.*"%>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getRecentContainerHistory");
%>

<script language="javascript">
function fnClick(TeamCode,TeamName){
   frmTeamBridge.TeamCode.value = TeamCode;
   frmTeamBridge.TeamName.value = TeamName;
   frmTeamBridge.submit();
}
</script>
<form name="frmTeamBridge" id="frmTeamBridge" action="/Anaconda.do" method="POST">
  <input type="hidden" name="CMD" value="CMD_SEQ_103063019771510655619158">
  <input type="hidden" name="TeamCode">
  <input type="hidden" name="TeamName">
  <input type="hidden" name="rule_group" value="PROFILE">
</form>
<div class="container">
  <h2><img src="/jsp/sp/img/select.png" width="40px">&nbsp; Container exe. list</h2>
  <table class="table table-condensed">
    <thead>
      <tr>
        <th scope="row">Num</th>
        <th>Container name</th>
        <th>Container exe. date</th>
        <th>Exe. time(msec)</th>
        <th>Container parameter</th>
        <th>Container result</th>
      </tr>
    </thead>
    <tbody>
     <%
     if(bc != null){
       for(int i = 0; i < bc.size() ; i++) {
         String p = BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("parameter"));
         p = p.replace(",","\n");
         String r = BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("result"));
         r = r.replace(",","\n");
     %> 
       <tr>
        <td><%=bc.getBusinessData(i).getFieldValue("seq")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("container_name")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("create_datetime")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("elapsed")%></td>
        <td><div style='overflow: scroll;width:400px;height:200px;'><pre><%=p%></pre></div></td>
        <td><div style='overflow: scroll;width:400px;height:200px;'><pre><%=r%></pre></div></td>
      </tr>
     <% }
      } %>
    </tbody>
  </table>
</div>
