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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getRecentRuleHistory");
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
<div class="container-fluid">
  <h2><img src="/jsp/sp/img/select.png" width="40px">&nbsp; 대화(채팅) 결과 리스트</h2>
  <table class="table table-condensed">
    <thead>
      <tr>
        <th scope="row">룰(Rule)</th>
        <th scope="row">채널 아이디</th>
        <th>룰 실행 시간</th>
        <th>룰 입력값</th>
        <th>룰 실행 결과값</th>
      </tr>
    </thead>
    <tbody>
     <%
     if(bc != null){
       for(int i = 0; i < bc.size() ; i++) {
         String c =  BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("rule_seq"));
         if("-1".equals(c))c = "red";
         else c = "blue";
         String p = BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("parameter"));
         p = p.replace(",","\n");
         String r = BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("result"));
         r = r.replace(",","\n");
     %> 
       <tr>
        <td><a href="/Anaconda.do?CMD=CMD_SEQ_109170810941496452670436&rule_group=<%=bc.getBusinessData(i).getFieldValue("rule_group")%>&kind=MSG&page=0"><%=bc.getBusinessData(i).getFieldValue("rule_seq")%></a></td>
        <td><%=bc.getBusinessData(i).getFieldValue("channel")%></td>
        <td style="width:300px;"><%=bc.getBusinessData(i).getFieldValue("create_datetime")%></td>
        <td><div style='overflow: auto;width:400px;height:200px'><pre><font color="<%=c%>"><%=p%></font></pre></div></td>
        <td><div style='overflow: auto;width:400px;height:200px'><pre><font color="<%=c%>"><%=r%></font></pre></div></td>
      </tr>
     <% }
      } %>
    </tbody>
  </table>
</div>
