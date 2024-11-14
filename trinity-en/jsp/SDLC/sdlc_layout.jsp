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
<!--script src="/jsp/SDLC/js/default.js" language="javascript" ></script-->
<script src="/jsp/anaconda/js/default.js" language="javascript" ></script>

<!--
    <SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.AJAX.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.AWT.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Bind.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.BoardPanel.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Body.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.CBCookie.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Components.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Control.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Cookie.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Data.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Div.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Email.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Event.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Event.Listener.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Form.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.FormUI.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Func.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Grid.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Hashtable.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Interface.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Label.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Layout.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Link.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Menu.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.MenuLink.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Mouse.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Move.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Page.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Panel.ETC.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Panel.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Pop.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.QueryString.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.ScrollPane.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Static.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Table.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.Tag.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="/javascript/_Common.TextArea.js"></SCRIPT>
--> 

</head>
 
<body>
 
<div id="page_wrapper">

<div id="header_wrapper">
 
	<% 
	 if(!strTop.equals("")) { %><jsp:include page="<%=strTop%>" flush="true" /><%
	 }%>
</div>	  
<div id="left_side">
 		<% 
		 if(!strLeft.equals("")) { %><jsp:include page="<%=strLeft%>" flush="true" /><%
		 }%>	
 
 </div>
 
<div id="right_side">
 
  		<% 
		 if(!strRight.equals("")) { %><jsp:include page="<%=strRight%>" flush="true" /><%
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


