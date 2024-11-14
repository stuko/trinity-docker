<%@ page contentType="text/javascript"  pageEncoding="UTF-8" %>
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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"selectRandomChatBot");
%>
var bot1 = {
         msgType : "DUNA.SAAS"
       , name : "로봇1"
       , clientId : "<%=bc.getBusinessData(0).getFieldValue("clientId")%>" 
       , secretKey : "<%=bc.getBusinessData(0).getFieldValue("secretKey")%>" 
       , channelId : "<%=bc.getBusinessData(0).getFieldValue("clientId")%>" 
       , ServiceName:'chat'
       , Level : 'normal'
       , MY_THOUGHT : ''
};
  
var bot2 = {
         msgType : "DUNA.SAAS"
       , name : "로봇2"
       , clientId : "<%=bc.getBusinessData(1).getFieldValue("clientId")%>" 
       , secretKey : "<%=bc.getBusinessData(1).getFieldValue("secretKey")%>" 
       , channelId : "<%=bc.getBusinessData(1).getFieldValue("clientId")%>" 
       , ServiceName:'chat'
       , Level : 'normal'
       , MY_THOUGHT : ''
};
