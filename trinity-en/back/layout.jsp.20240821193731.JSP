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

Object sessionObject = request.getAttribute(InitClass.getSessionValue());
Object account = session.getAttribute("Account");
String jndi = (String)session.getAttribute("jndi");

String LEVEL="0";
if(sessionObject != null){
   BusinessRecord record = (BusinessRecord)sessionObject;
   LEVEL = record.getFieldValue("CV_LEVEL");
}




 %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>소셜 프로젝트 : 노하우를 공유하세요 , 소프트웨어 로봇과 함께 일해 보세요</title>
    <script data-ad-client="ca-pub-9730125948666780" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!--
    <script type="text/javascript"> 
       (function() { 
         var css = document.createElement('link');
         css.href = 'https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'; 
         css.rel = 'stylesheet'; 
         css.type = 'text/css'; 
         document.getElementsByTagName('head')[0].appendChild(css); 
       })(); 
    </script>
-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="/jsp/socialproject/assets/css/app.css">
    <link rel="stylesheet" href="/jsp/socialproject/assets/css/theme.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>


</head>

<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
    <a class="navbar-brand font-weight-bolder mr-3" href="index.html"><img src="/jsp/chatvatar/img/chatvatar.jpeg" width="60px">소셜프로젝트</a> 
    <button class="navbar-light navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsDefault" aria-controls="navbarsDefault" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarsDefault">
<!--
    	<ul class="navbar-nav mr-auto align-items-center">
    		<form class="bd-search hidden-sm-down">
    			<input type="text" class="form-control bg-graylight border-0 font-weight-bold" id="search-input" placeholder="검색하기...(준비중)" autocomplete="off">
    			<div class="dropdown-menu bd-search-results" id="search-results">
    			</div>
    		</form>
    	</ul>
-->
    	<ul class="navbar-nav ml-auto align-items-center">
    		<li class="nav-item" style='font-family:카페24 써라운드 에어'>
                   로봇(DUNA)과 함께 하는 일 상상해 보셨나요? 잘 모르는 일을 해야 할 때 찾아 보세요
                </li>
<!--
                <% if(!"0".equals(LEVEL)) { %>
                <li class="nav-item">
    		<a class="nav-link" href="/CMD_SEQ_101908816461597907677432.do"><img class="rounded-circle mr-2" src="/jsp/socialproject/assets/img/av.png" width="30"><span class="align-middle">내정보</span></a>
    		</li>
                <li class="nav-item">
    		<a class="nav-link" href="/CMD_SEQ_103062227551598142684555.do"><span class="align-middle">로그아웃</span></a>
    		</li>
                <% }else{ %>
                <li class="nav-item">
   		<a class="nav-link" href="/CMD_SEQ_101908816461597907677432.do"><img class="rounded-circle mr-2" src="/jsp/socialproject/assets/img/av.png" width="30"><span class="align-middle">로그인</span></a>
    		</li>
                <% } %>
-->
    		<!--
                <li class="nav-item dropdown">
    		<a class="nav-link" href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    		<svg style="margin-top:10px;" class="_3DJPT" version="1.1" viewbox="0 0 32 32" width="21" height="21" aria-hidden="false" data-reactid="71"><path d="M7 15.5c0 1.9-1.6 3.5-3.5 3.5s-3.5-1.6-3.5-3.5 1.6-3.5 3.5-3.5 3.5 1.6 3.5 3.5zm21.5-3.5c-1.9 0-3.5 1.6-3.5 3.5s1.6 3.5 3.5 3.5 3.5-1.6 3.5-3.5-1.6-3.5-3.5-3.5zm-12.5 0c-1.9 0-3.5 1.6-3.5 3.5s1.6 3.5 3.5 3.5 3.5-1.6 3.5-3.5-1.6-3.5-3.5-3.5z" data-reactid="22"></path></svg>
    		</a>
    		<div class="dropdown-menu dropdown-menu-right shadow-lg" aria-labelledby="dropdown02">
    			<h4 class="dropdown-header display-4">Download Pintereso<br/> HTML Bootstrap Template</h4>
    			<div class="dropdown-divider">
    			</div>
    			<span class="dropdown-item"><a href="https://github.com/wowthemesnet/template-pintereso-bootstrap-html/archive/master.zip" class="btn btn-primary d-block"><i class="fa fa-download"></i> Download</a></span>
    		</div>
    		</li>
                -->
    	</ul>
    </div>
    </nav>    
    <main role="main">
        

	<% 
	 if(!strBody.equals("")) { %><jsp:include page="<%=strBody%>" flush="true" /><%
	 }%>
        <!-- /.container-fluid -->

   
  </main>

    <script src="/jsp/socialproject/assets/js/app.js"></script>
    <script src="/jsp/socialproject/assets/js/theme.js"></script>
    
    <footer class="footer pt-5 pb-5 text-center">
        
    <div class="container">
     <!--   
          <div class="socials-media">
    
            <ul class="list-unstyled">
              <li class="d-inline-block ml-1 mr-1"><a href="#" class="text-dark"><i class="fa fa-facebook"></i></a></li>
              <li class="d-inline-block ml-1 mr-1"><a href="#" class="text-dark"><i class="fa fa-twitter"></i></a></li>
              <li class="d-inline-block ml-1 mr-1"><a href="#" class="text-dark"><i class="fa fa-instagram"></i></a></li>
              <li class="d-inline-block ml-1 mr-1"><a href="#" class="text-dark"><i class="fa fa-google-plus"></i></a></li>
              <li class="d-inline-block ml-1 mr-1"><a href="#" class="text-dark"><i class="fa fa-behance"></i></a></li>
              <li class="d-inline-block ml-1 mr-1"><a href="#" class="text-dark"><i class="fa fa-dribbble"></i></a></li>
            </ul>
          </div>
      -->  
          <p>
           <span class="credits font-weight-bold">        
               관련사이트 : 
            <a target="_blank" class="text-dark" href="http://app.bestmember.net/">
               소프트웨어 로봇 개발 운영 플랫폼 (DUNA)
            </a>
           </span>
          </p>
    
    
        </div>
        
    </footer>    
</body>
    
</html>
