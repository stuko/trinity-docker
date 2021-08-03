<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.*"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.openapi.*"%>
<%@ page import="com.stuko.anaconda.util.*"%>
<%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"PRODUCT_PORTFOLIO_list");
%>

<div class="container">
<% if(bc != null && bc.size() > 0) { %>
  <% for(int i = 0; i < bc.size(); i++ ) { %>
  <div class="row">
    <div class="col">
      <%=bc.getBusinessData(0).getFieldValue("PORT_NAME") %>
    </div>
  </div>
  <% }%>
<% } else { %>
  <div class="row">
    <div class="col">
       No product
    </div>
  </div>
<% } %>
</div>
    
