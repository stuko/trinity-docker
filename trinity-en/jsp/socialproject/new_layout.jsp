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
  String strBody = request.getAttribute(BlankField.VIEW_BODY) == null ? "" : (String)request.getAttribute(BlankField.VIEW_BODY);
  String strFooter = request.getAttribute(BlankField.VIEW_FOOTER) == null ? "" : (String)request.getAttribute(BlankField.VIEW_FOOTER); 
  String strLeft = request.getAttribute(BlankField.VIEW_LEFT) == null ? "" : (String)request.getAttribute(BlankField.VIEW_LEFT); 
  String strRight = request.getAttribute(BlankField.VIEW_RIGHT) == null ? "" : (String)request.getAttribute(BlankField.VIEW_RIGHT); 
  String strTop = request.getAttribute(BlankField.VIEW_TOP) == null ? "" : (String)request.getAttribute(BlankField.VIEW_TOP); 
  String currentPath = "Please Input";
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="소셜 프로젝트 DUNA, 인공지능 프로젝트 관리,AI PM, Agile Project Manager, Telegram Robot" />
        <meta name="author" content="stuko" />
        <title>인공지능 프로젝트 관리 서비스 AI PM</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/jsp/duna.kr/assets/favicon.ico" />
        <!-- Custom Google font-->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="/bt/agency/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="/bt/js/plugins/toastr/toastr.min.js"></script>
        <script language="javascript" src="/jsp/anaconda/js/default.js"></script>
        <script language="javascript" src="/Anaconda.do?CMD=CMD_SEQ_104725518281582950707847"></script>
        <script src="/jsp/API/js/process.js"></script>
        <link href="/bt/agency/css/agency.css" rel="stylesheet">
        <link rel="stylesheet" href="/bt/css/plugins/toastr/toastr.min.css">
        <link rel="stylesheet" href="/jsp/API/css/my.css">
        <link href="/jsp/duna.kr/css/styles.css" rel="stylesheet" />
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-light bg-white py-3">
                <div class="container px-5">
                    <a class="navbar-brand" href="/"><span class="fw-bolder text-primary">인공지능 프로젝트 관리 서비스 - DUNA</span></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0 small fw-bolder">
                            <li class="nav-item">㈜ 소셜프로젝트</li>
                        <!--
                            <li class="nav-item"><a class="nav-link" href="/">홈</a></li>
                            <li class="nav-item"><a class="nav-link" href="/CMD_SEQ_105235238541724240037979.do">회사 소개</a></li>
                            <li class="nav-item"><a class="nav-link" href="/CMD_SEQ_101181169441724240048647.do">서비스 기능</a></li>
                            <li class="nav-item"><a class="nav-link" href="/CMD_SEQ_107988631611724240058371.do">비즈니스 제휴</a></li>
                        -->
                        </ul>
                        
                    </div>
                </div>
            </nav>
            <!-- Header-->
            <header class="py-5">
                <% if(!strTop.equals("")) { %><jsp:include page="<%=strTop%>" flush="true" /><%}%>
            </header>
            <!-- About Section-->

                <% if(!strBody.equals("")) { %><jsp:include page="<%=strBody%>" flush="true" /><%}%>

        </main>

    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
           <div class="fs-3 fw-light text-muted">궁금하면 물어보기</div>
        </div>

      </div>
      <div class="row align-items-center m-5">
        <div class="col-lg-12">
          <form id="contactForm" name="sentMessage" novalidate="novalidate">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <input class="form-control" id="name" type="text" placeholder="Your Name " required="required" data-validation-required-message="Please enter your name.">
                  <p class="help-block text-danger"></p>
                </div>
                <div class="form-group">
                  <input class="form-control" id="email" type="email" placeholder="Your Email *" required="required" data-validation-required-message="Please enter your email address.">
                  <p class="help-block text-danger"></p>
                </div>
                <div class="form-group">
                  <input class="form-control" id="phone" type="tel" placeholder="Your Phone " required="required" data-validation-required-message="Please enter your phone number.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <textarea class="form-control" style="height: 144px;" id="message" placeholder="Your Message *" required="required" data-validation-required-message="Please enter a message."></textarea>
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="clearfix"></div>
             </div>
           <div class="row">
             <div class="col-lg-12 text-center m-2">
                <button id="sendMessageButton" class="btn btn-primary btn-lg text-uppercase pl-5 pr-5" onClick="javascript:voc();">저장</button>
            </div>
           </div>
          </form>
        </div>
      </div>
    </div>

<script language="javascript">
   function voc(){
      if( $('#name').val() == '' ||  $('#email').val() == '' ||  $('#phone').val() == '' ||  $('#message').val() == ''){
         showPopup('fail','Sorry. Please confirm your input.',null);
         return;
      }
      var d = {"name" : $('#name').val(), "email" : $('#email').val(), "phone" : $('#phone').val(), "message" : $('#message').val() };
      post(d,'CMD_SEQ_106401071121560726394050',()=>{
         showPopup('success','Thank you. We will try to reflect your request.',null);
      },()=>{
         showPopup('fail','Sorry. Your call was not accepted. It may be an internal error, so please accept it again in the future.',null);
      });
   }
   
</script>
        <!-- Footer-->
        <footer class="bg-white py-4 mt-auto">
            <div class="container px-5">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col text-center "><div class="small m-0">Copyright &copy; socialproject.net 2024</div></div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/jsp/duna.kr/js/scripts.js"></script>
    </body>
</html>
