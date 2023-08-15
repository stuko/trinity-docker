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
<script src="/jsp/summernote/jquery-3.3.1.js"></script>
<script src="/jsp/trinity2/js/jquery.min.js"></script>
<script src="/jsp/trinity2/js/bootstrap.min.js"></script>
<script src="/jsp/summernote/summernote-bs4.min.js"></script>
<link href="/jsp/trinity2/css/bootstrap.min.css" rel="stylesheet" />
<!--<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">-->
<link href="/jsp/summernote/summernote-bs4.min.css" rel="stylesheet" />

        <link rel="stylesheet" href="/jsp/trinity2/css/bootstrap-responsive.min.css" />
        <!--link rel="stylesheet" href="/jsp/trinity2/css/maruti-login.css" /-->
        <link rel="stylesheet" href="/jsp/trinity2/css/fullcalendar.css" />
        <link rel="stylesheet" href="/jsp/trinity2/css/maruti-style.css" />
        <link rel="stylesheet" href="/jsp/trinity2/css/maruti-media.css" class="skin-color" />
        <link href="/bt/admin-v2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="/jsp/Neo/css/style.css">
        <link rel="stylesheet" href="/bt/jquery-ui/1.12.1/jquery-ui.theme.css" />
        <link rel="stylesheet" href="/bt/jquery-ui/1.12.1/jquery-ui.css" />
        <link rel="stylesheet" href="/bt/jquery-ui/1.12.1/jquery-ui.structure.css" />

<script src="/jsp/trinity2/js/excanvas.min.js"></script>
<!--script src="/jsp/trinity2/js/jquery.ui.custom.js"></script-->

<!--script src="/jsp/trinity2/js/jquery.flot.min.js"></script-->
<!--script src="/jsp/trinity2/js/jquery.flot.resize.min.js"></script-->
<script src="/jsp/trinity2/js/jquery.peity.min.js"></script>
<script src="/jsp/trinity2/js/fullcalendar.min.js"></script>
<!--script src="/jsp/trinity2/js/maruti.js"></script-->
<!--script src="/jsp/trinity2/js/maruti.dashboard.js"></script-->
<script src="/jsp/trinity2/js/maruti.chat.js"></script>
<script src="/bt/jquery-ui/1.12.1/jquery-ui.js"></script>

<script src="/jsp/anaconda/js/default.js"></script>
<script src="/jsp/summernote/paper-1.14.5.js"></script>
<script src="/jsp/API/js/process.js"></script>

<style>

body{
  height : 100%;
  min-height:100%;
  background : #fff;   
}
.container{ 
   min-width:95%;
   min-height:100%;
   background : #fff;
}
select { font-size: 12px;
   align:center;background:#fff;
}

table {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
  background: #fff;
}

table td, table th {
  border: 1px solid #ddd;
  padding: 8px;
}

// table tr:nth-child(even){background-color: #f2f2f2;}

//table tr:hover {background-color: #ddd;}

table th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  // background-color: #efefef;
  color: #000000;
}


table {
    float: left;
}
.table_hydra{
    float: none;
}

#search button {
  margin-top : 0px;
}
</style>
</head>
<body>
<table style="width:800px;background:white">
   <tr>
     <td>
   <div class="container" style="margin-top:20px">
      <div class="row">
        <div class="col">		
		
<% 
 if(!strBody.equals("")) { %><jsp:include page="<%=strBody%>" flush="true" /><%
 }%>

	</div>
     </div>
  </div>
  </td>
 </tr>
</table>
</body>
</html>
