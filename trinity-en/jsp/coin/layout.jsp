<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page import="com.stuko.anaconda.Auth.*"%>
 <%
  String strBody = request.getAttribute(BlankField.VIEW_BODY) == null ? "" : (String)request.getAttribute(BlankField.VIEW_BODY);
  String strFooter = request.getAttribute(BlankField.VIEW_FOOTER) == null ? "" : (String)request.getAttribute(BlankField.VIEW_FOOTER); 
  String strLeft = request.getAttribute(BlankField.VIEW_LEFT) == null ? "" : (String)request.getAttribute(BlankField.VIEW_LEFT); 
  String strRight = request.getAttribute(BlankField.VIEW_RIGHT) == null ? "" : (String)request.getAttribute(BlankField.VIEW_RIGHT); 
  String strTop = request.getAttribute(BlankField.VIEW_TOP) == null ? "" : (String)request.getAttribute(BlankField.VIEW_TOP); 
 %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Bootswatch: Darkly</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/bootswatch-5/dist/darkly/bootstrap.css">
    <link rel="stylesheet" href="/css/bootswatch-5/docs/_vendor/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/bootswatch-5/docs/_vendor/prismjs/themes/prism-okaidia.css">
    <link rel="stylesheet" href="/css/bootswatch-5/docs/_assets/css/custom.min.css">
  </head>
  <body>
    <div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
      <div class="container">
        <a href="../" class="navbar-brand">DUNA</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="dropdown" href="https://app.bestmember.net/" id="themes">app.bestmember.net</a>
            </li>
          </ul>
          <ul class="navbar-nav ms-md-auto">
          </ul>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
            <h1>Dashboard</h1>
            <p class="lead">By DUNA</p>
          </div>
          <div class="col-lg-4 col-md-5 col-sm-6">
            <div class="sponsor">
            </div>
          </div>
        </div>
      </div>

         <% 
	 if(!strBody.equals("")) { %><jsp:include page="<%=strBody%>" flush="true" /><%
	 }%>

      <footer id="footer">
        <div class="row">
          <div class="col-lg-12">
            <ul class="list-unstyled">
            </ul>

          </div>
        </div>
      </footer>
    </div>

    <script src="/css/bootswatch-5/docs/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/css/bootswatch-5/docs/_vendor/prismjs/prism.js" data-manual></script>
    <script src="/css/bootswatch-5/docs/_assets/js/custom.js"></script>
  </body>
</html>
