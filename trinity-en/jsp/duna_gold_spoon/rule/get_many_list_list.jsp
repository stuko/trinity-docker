<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.xtreme.site.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%

String hour = request.getParameter("hour");
hour = hour == null ? "I" : hour;

BusinessCollection bc = RequestHelper.getBusinessCollection(request,"get_many_hit_rule_list");

%>
<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
<i class="fas fa-images"></i>&nbsp;가장 많이 선택된 룰
    </h3>	
    <p>

    </p>
  </div>
  <div class="table-responsive">
    <table class="table" style="table-layout:fixed;">
      <thead>
      <tr>
        <th width="5%">룰 번호</th>
        <th width="10%">룰 이름 이름</th>
        <th width="10%">룰 선택 횟수</th>
      </tr>
      </thead>
      <tbody>
<%
if(bc != null && bc.size() > 0) {
  for(int i = 0; i < bc.size() ; i++){
    String rule_seq = bc.getBusinessData(i).getFieldValue("rule_seq");
    String kind = bc.getBusinessData(i).getFieldValue("kind");
    String rule_group = bc.getBusinessData(i).getFieldValue("rule_group");
    String link = "/Anaconda.do?CMD=CMD_SEQ_109170810941496452670436&seq="+rule_seq+"&rule_group="+rule_group+"&kind="+kind+"&page=0";
%>
      <tr>
        <td><a href="<%=link%>"><%=bc.getBusinessData(i).getFieldValue("rule_seq")%></a></td>
        <td><%=bc.getBusinessData(i).getFieldValue("context_name")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("cnt")%></td>
      </tr>
<%
  }
}else{
%>
      <tr>
        <td colspan="3">정보가 없습니다.</td>
      </tr>
<%
}
%>
      </tbody>
    </table>
  </div>
</div>

<script language="javascript">

</script>
