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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"search");
%>

<div class="container">
  <h2><img src="/jsp/sp/img/select.png" width="40px">&nbsp; Search result </h2>
  <table class="table table-condensed">
    <thead>
      <tr>
        <th scope="row">Rule id</th>
        <th scope="row">Rule Name</th>
        <th>Rule Script</th>
        <th>Rule Description</th>
        <th>Bigo</th>
      </tr>
    </thead>
    <tbody>
     <%
     if(bc != null){
       for(int i = 0; i < bc.size() ; i++) {
     %> 
       <tr>
        <td><a href="/Anaconda.do?CMD=CMD_SEQ_109170810941496452670436&rule_group=<%=bc.getBusinessData(i).getFieldValue("rule_group")%>&kind=MSG&page=0"><%=bc.getBusinessData(i).getFieldValue("seq")%></a></td>
        <td><%=bc.getBusinessData(i).getFieldValue("context_name")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("rule")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("context_desc")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("msg")%></td>
      </tr>
     <% }
      } %>
    </tbody>
  </table>
</div>
