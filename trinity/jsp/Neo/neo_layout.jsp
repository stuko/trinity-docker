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
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Trinity</title>
<script src="/jsp/anaconda/js/default.js" language="javascript" ></script>
<!-- Bootstrap core JavaScript -->
<script src="/jsp/sp/vendor/jquery/jquery.min.js"></script>
<script src="/jsp/sp/vendor/tether/tether.min.js"></script>
<script src="/jsp/sp/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Plugin JavaScript -->
<script src="/jsp/sp/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="/jsp/sp/vendor/chart.js/Chart.min.js"></script>
<script src="/jsp/sp/vendor/datatables/jquery.dataTables.js"></script>
<script src="/jsp/sp/vendor/datatables/dataTables.bootstrap4.js"></script>

<!-- JQuery Plugin JavaScript -->
<script language="javascript" src="/jsp/sp/cookie/jquery.cookie.js"></script>

<style type="text/css"> 
html, body { height:100%;  } 
.h-div {height:96%; border:3px #f99 solid} 

/* The side navigation menu */
.sidenav {
    height: 100%; /* 100% Full-height */
    width: 0; /* 0 width - change this with JavaScript */
    position: fixed; /* Stay in place */
    z-index: 300; /* Stay on top */
    top: 0;
    left: 0;
    background-color: #111; /* Black*/
    overflow-x: hidden; /* Disable horizontal scroll */
    padding-top: 10px; /* Place content 60px from the top */
    transition: 0.5s; /* 0.5 second transition effect to slide in the sidenav */
}

/* The navigation menu links */
.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 13px;
    /*color: #818181;*/
    color : #000000;
    display: block;
    transition: 0.3s
}

/* When you mouse over the navigation links, change their color */
.sidenav a:hover, .offcanvas a:focus{
    color: #818181;
}

/* Position and style the close button (top right corner) */
.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 11px;
    margin-left: 50px;
}

/* Style page content - use this if you want to push the page content to the right when you open the side navigation */
#main {
    transition: margin-left .5s;
    padding: 20px;
}

/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
    .sidenav a {font-size: 18px;}
}

.form-control.select-small {
  margin: 8px 8px 8px 32px;
  height:12px;
  width:100px;
  font-size:12px;
}
.img-circle {
    border-radius: 50%;
}
</style>
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
