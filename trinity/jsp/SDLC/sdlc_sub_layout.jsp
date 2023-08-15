<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%
  String strBody = request.getAttribute(BlankField.VIEW_BODY) == null ? "" : (String)request.getAttribute(BlankField.VIEW_BODY);
  String strFooter = request.getAttribute(BlankField.VIEW_FOOTER) == null ? "" : (String)request.getAttribute(BlankField.VIEW_FOOTER); 
  String strLeft = request.getAttribute(BlankField.VIEW_LEFT) == null ? "" : (String)request.getAttribute(BlankField.VIEW_LEFT); 
  String strRight = request.getAttribute(BlankField.VIEW_RIGHT) == null ? "" : (String)request.getAttribute(BlankField.VIEW_RIGHT); 
  String strTop = request.getAttribute(BlankField.VIEW_TOP) == null ? "" : (String)request.getAttribute(BlankField.VIEW_TOP); 
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>Trinity</title>
<link href="/jsp/SDLC/css/style.css" rel="stylesheet" type="text/css" media="screen" />
<script src="/jsp/SDLC/js/default.js" language="javascript" ></script>
</head>
 
<body>
 
<div id="page_wrapper">
 
<div id="header_wrapper">
 
	<% 
	 if(!strTop.equals("")) { %><jsp:include page="<%=strTop%>" flush="true" /><%
	 }%>
	  
<div id="left_side">
 		<% 
		 if(!strLeft.equals("")) { %><jsp:include page="<%=strLeft%>" flush="true" /><%
		 }%>	
 
 </div>
 
<div id="content">
 
 	<% 
	 if(!strBody.equals("")) { %><jsp:include page="<%=strBody%>" flush="true" /><%
	 }%>
	 
</div>
 
<div id="footer">
<% 
 if(!strFooter.equals("")) { %><jsp:include page="<%=strFooter%>" flush="true" /><%
 }%>	


</div>
 
</div>
 
</body>
 
</html>


