<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%
  String strBody = request.getAttribute(BlankField.VIEW_BODY) == null ? "" : (String)request.getAttribute(BlankField.VIEW_BODY);
  String strFooter = request.getAttribute(BlankField.VIEW_FOOTER) == null ? "" : (String)request.getAttribute(BlankField.VIEW_FOOTER); 
  String strLeft = request.getAttribute(BlankField.VIEW_LEFT) == null ? "" : (String)request.getAttribute(BlankField.VIEW_LEFT); 
  String strRight = request.getAttribute(BlankField.VIEW_RIGHT) == null ? "" : (String)request.getAttribute(BlankField.VIEW_RIGHT); 
  String strTop = request.getAttribute(BlankField.VIEW_TOP) == null ? "" : (String)request.getAttribute(BlankField.VIEW_TOP); 
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Anaconda</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<!--link href="/jsp/anaconda/css/default.css" rel="stylesheet" type="text/css" media="screen" /-->
<script src="/jsp/anaconda/js/default.js" language="javascript" ></script>
<link href="/jsp/SDLC/css/style.css" rel="stylesheet" type="text/css" media="screen" />
<!--script src="/jsp/SDLC/js/default.js" language="javascript" ></script-->

</head>
<body>
	<div class="main">
		
		
<% 
 if(!strBody.equals("")) { %><jsp:include page="<%=strBody%>" flush="true" /><%
 }%>

	

	</div>

</body>
</html>


