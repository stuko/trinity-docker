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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getOAuthInfo");
if(bc != null && bc.size() > 0){
  String url = bc.getBusinessData(0).getFieldValue("OT_REQ_AUTH_URL");
  String key = bc.getBusinessData(0).getFieldValue("OT_KEY");
  String clientId = bc.getBusinessData(0).getFieldValue("OT_CLIENTID");
  String redirectUrl = bc.getBusinessData(0).getFieldValue("OT_REDIRECT_AUTH_URL");
  url = url.replace("{=OT_CLIENTID}",clientId).replace("{=OT_REDIRECT_AUTH_URL}",redirectUrl).replace("{=OT_KEY}",key);
  response.sendRedirect(url);
}else{
  out.println("You can not use OAuth");
}
%>
