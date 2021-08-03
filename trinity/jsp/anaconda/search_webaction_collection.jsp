<%@ page contentType="text/xml; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.scenario.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.action.*"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.analysis.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.util.*"%>
<%
String result = "{\"searchResult\": {\"result\": \"true\",\"desc\": \"init false\"}}";
String strTitle	= request.getParameter("scenario_title") != null ? URLDecoder.decode(request.getParameter("scenario_title"),"UTF-8") : request.getParameter("scenario_title");
WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();	
if(BusinessHelper.checkNull(strTitle)){
  WebActionCollection webActionCollection = null;
  boolean find = false;
  Iterator it = xmlResource.getWebActionCollection(); 
  for (; it.hasNext();) {
    webActionCollection = (WebActionCollection) it.next();
    if (webActionCollection.getWEBACTION_KOR_NAME().indexOf(strTitle) >= 0) {
      find = true;
      break;     
    }
  }
  if(find) {
      result = "{\"searchResult\": {\"result\": \"true\",\"desc\": \"search result > 0\"}}";
  }else{
    result = "{\"searchResult\": {\"result\": \"false\",\"desc\": \"search result is 0 , so you can create request\"}}";
  }
}else{
  result = "{\"searchResult\": {\"result\": \"true\",\"desc\": \"scenario title is null\"}}";
}
out.println(result);
%>
