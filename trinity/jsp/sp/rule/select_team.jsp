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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"MyTeamList");
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
  <h2><img src="/jsp/sp/img/select.png" width="40px">&nbsp; 팀 선택하기</h2>
  <p>(*룰을 적용하길 원하시는 팀을 선택하시기 바랍니다.
원활한 편집을 위해서는, PC에서 편집해 주시기 바랍니다.)</p>
  <h5> 팀 리스트 </h5>
  <table class="table table-condensed">
    <thead>
      <tr>
        <th scope="row">팀 이름</th>
        <th>팀 생성일</th>
        <th>팀원수</th>
        <th>기능</th>
      </tr>
    </thead>
    <tbody>
     <%
     if(bc != null){
       for(int i = 0; i < bc.size() ; i++) {
     %> 
       <tr>
        <td><%=bc.getBusinessData(i).getFieldValue("TeamName")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("TeamCreateDateTime")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("Count")%></td>
        <td><button type="button" class="btn btn-primary" onClick="javascript:fnClick('<%=bc.getBusinessData(i).getFieldValue("TeamCode")%>','<%=bc.getBusinessData(i).getFieldValue("TeamName")%>')">룰 편집</button></td>
      </tr>
     <% }
      } %>
    </tbody>
  </table>
</div>


















































