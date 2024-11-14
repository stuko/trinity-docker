<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%
  String strBody = request.getAttribute(BlankField.VIEW_BODY) == null ? "" : (String)request.getAttribute(BlankField.VIEW_BODY);
  String strFooter = request.getAttribute(BlankField.VIEW_FOOTER) == null ? "" : (String)request.getAttribute(BlankField.VIEW_FOOTER); 
  String strLeft = request.getAttribute(BlankField.VIEW_LEFT) == null ? "" : (String)request.getAttribute(BlankField.VIEW_LEFT); 
  String strRight = request.getAttribute(BlankField.VIEW_RIGHT) == null ? "" : (String)request.getAttribute(BlankField.VIEW_RIGHT); 
  String strTop = request.getAttribute(BlankField.VIEW_TOP) == null ? "" : (String)request.getAttribute(BlankField.VIEW_TOP); 


Object sessionObject = request.getAttribute(InitClass.getSessionValue());
Object account = session.getAttribute("Account");
// Object teamName = session.getAttribute("TeamName");
// String strTeamName = teamName == null ? "After login, Select a team" : (String)teamName;

 %>


<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>소프트웨어로봇 서비스 - DUNA</title>

  <!-- Bootstrap core CSS -->
  <link href="/bt/agency/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="/bt/agency/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>



  <!-- Bootstrap core JavaScript -->
  <script src="/bt/agency/vendor/jquery/jquery.min.js"></script>
  <script src="/bt/agency/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/bt/js/plugins/toastr/toastr.min.js"></script>

    <script language="javascript" src="/jsp/anaconda/js/default.js"></script>
    <script language="javascript" src="/Anaconda.do?CMD=CMD_SEQ_104725518281582950707847"></script>
    <script src="/jsp/API/js/process.js"></script>



  <!-- Custom styles for this template -->
  <link href="/bt/agency/css/agency.css" rel="stylesheet">
  <link rel="stylesheet" href="/bt/css/plugins/toastr/toastr.min.css">
  <link rel="stylesheet" href="/jsp/API/css/my.css">


  <!-- Custom styles for this template -->
  <link href="/bt/agency/css/agency.min.css" rel="stylesheet">
  <script language="javascript">
  function logout(){
   if(confirm('Do you want to sign out?')){
      location.href='/Anaconda.do?CMD=CMD_SEQ_100466023431495768917557';
   }
  }

function duna(){
  document.location.href='/Anaconda.do?CMD=CMD_SEQ_105943068391560662902167';
}




  </script>
<link rel="stylesheet" type="text/css" href="/Anaconda.do?CMD=CMD_SEQ_101720122871551826921073">
<!--
<script src="/Anaconda.do?CMD=CMD_SEQ_106530358721551399268071" language="javascript" type="text/javascript"></script>
<script src="/Anaconda.do?CMD=CMD_SEQ_102165605081545015481840" language="JavaScript" type="text/javascript"></script>
<script src="/Anaconda.do?CMD=CMD_SEQ_105212859831551826187198" language="javascript" type="text/javascript"></script>
<script src="/Anaconda.do?CMD=CMD_SEQ_105917923031540986002023" language="JavaScript" type="text/javascript"></script>
-->
<!-- Global site tag (gtag.js) - Google Analytics -->

<style>
.mytext{
    border:0;padding:10px;background:whitesmoke;
}
.text{
    width:75%;display:flex;flex-direction:column;
}
.text > p:first-of-type{
    width:100%;margin-top:0;margin-bottom:auto;line-height: 13px;font-size: 12px;
}
.text > p:last-of-type{
    width:100%;text-align:right;color:silver;margin-bottom:-7px;margin-top:auto;
}
.text-l{
    float:left;padding-right:10px;
}        
.text-r{
    float:right;padding-left:10px;
}
.avatar{
    display:flex;
    justify-content:center;
    align-items:center;
    width:25%;
    float:left;
    padding-right:10px;
}
.macro{
    margin-top:5px;width:85%;border-radius:5px;padding:5px;display:flex;
}
.msj-rta{
    float:right;background:whitesmoke;
}
.msj{
    float:left;background:white;
}
.frame{
    background:#e0e0de;
    height:450px;
    overflow:hidden;
    padding:0;
}
.frame > div:last-of-type{
    position:absolute;bottom:5px;width:100%;display:flex;
}
/*
ul {
    width:100%;
    list-style-type: none;
    padding:18px;
    position:absolute;
    bottom:32px;
    display:flex;
    flex-direction: column;

}
*/
.msj:before{
    width: 0;
    height: 0;
    content:"";
    top:-5px;
    left:-14px;
    position:relative;
    border-style: solid;
    border-width: 0 13px 13px 0;
    border-color: transparent #ffffff transparent transparent;            
}
.msj-rta:after{
    width: 0;
    height: 0;
    content:"";
    top:-5px;
    left:14px;
    position:relative;
    border-style: solid;
    border-width: 13px 13px 0 0;
    border-color: whitesmoke transparent transparent transparent;           
}  
       
::-webkit-input-placeholder { /* Chrome/Opera/Safari */
    color: #d4d4d4;
}
::-moz-placeholder { /* Firefox 19+ */
    color: #d4d4d4;
}
:-ms-input-placeholder { /* IE 10+ */
    color: #d4d4d4;
}
:-moz-placeholder { /* Firefox 18- */
    color: #d4d4d4;
}   
header.masthead .intro-text {
    padding-top: 200px; 
    padding-bottom: 200px;
}
</style>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-143066118-3"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-143066118-3');

var align="left";

function formatAMPM(date) {
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    minutes = minutes < 10 ? '0'+minutes : minutes;
    var strTime = hours + ':' + minutes + ' ' + ampm;
    return strTime;
}   

function appendMessage(msg){

 var d = new Date();
 var currentDate = d.getFullYear() + "년 " + ( d.getMonth() + 1 ) + "월 " + d.getDate() + "일";
 var currentTime = d.getHours() + "시 " + d.getMinutes() + "분 " + d.getSeconds() + "초";
 var date = formatAMPM(new Date());

 if(align == 'left') {
   control = '<li style="width:100%;">' +
                        '<div class="msj-rta macro">' +
                            '<div class="text text-r">' +
                                '<p><small>'+bot1.name+'</small></p>' +
                                '<p>'+msg+'</p>' +
                                '<p><small>'+date+'</small></p>' +
                            '</div>' +
                        '<div class="avatar" style="padding:0px 0px 0px 10px !important"></div>' +                                
                  '</li>';
    align = 'right';
  }else{
    control = '<li style="width:100%">' +
                        '<div class="msj macro">' +
                            '<div class="text text-l">' +
                                '<p><small>'+bot2.name+'</small></p>' +
                                '<p>'+ msg +'</p>' +
                                '<p><small>'+date+'</small></p>' +
                            '</div>' +
                        '</div>' +
                    '</li>';  
     align = 'left';
   }
   $('#allchat').append(control);
   var objDiv = document.getElementById("allchat");
   objDiv.scrollTop = objDiv.scrollHeight;
}

function getMessage(bot){
   console.log(JSON.stringify(bot));
   console.log(bot);
   console.log('call rest to chatbot');
   $.ajax({
        type : "POST",
        url : "http://app.bestmember.net:8081/chat", // "http://49.247.7.108:8081/chat",
        dataType : "text",
        data: JSON.stringify(bot),
        cache: false,
        global: false,
        error : function(err){
            console.log('err : ' + err);
        },
        success : function(data){
          var json = JSON.parse(data);
          var contents = "";
          if(json.contents_list && json.contents_list.length && json.contents_list.length > 0 ){
              if(json.contents_list[0].contents && typeof json.contents_list[0].contents != 'undefined' && typeof json.contents_list[0].contents != null) {
                contents =  json.contents_list[0].contents;
                console.log('result : ' + contents);
                appendMessage(contents);
                console.log(contents +' vs ' + bot.MY_THOUGHT);
                if(contents == bot.MY_THOUGHT) {
                   contents = changeIntent();
                }
                setTimeout(function(){getMessage(getBot(contents))},5000);
              }else{
                appendMessage(bot.message);
                console.log(contents +' vs ' + bot.MY_THOUGHT);
                bot.message = changeIntent();
                setTimeout(function(){getMessage(getBot(bot.message))},5000);
              }
          }else{
              appendMessage(bot.message);
              console.log(contents +' vs ' + bot.MY_THOUGHT);
              bot.message = changeIntent();
              setTimeout(function(){getMessage(getBot(bot.message))},5000);
          } 
        }
  });
}

var botTurn = true;
function getBot(msg){
  if(botTurn) {
    botTurn = false;
    bot1.MY_THOUGHT = msg;
    bot1.message = msg;
    return bot1;
  }else{
    botTurn = true;
    bot2.MY_THOUGHT = msg;
    bot2.message = msg;
    return bot2;
  } 
}
//getMessage(getBot(changeIntent()));


function changeIntent(){
   var it = ['피곤하다','배고프다','졸립다','기쁘다','슬프다','어렵다','누구세요','나는 나다','맛있다','하고 싶다','주고 싶다','해봐','가고 싶다','떠나고 싶다','여행','해외','꿈','직업','노래','영화'];
   
   return it[Math.floor(Math.random() * it.length)];
}
</script>

</head>
<!--
<div id="allchat" class="col-sm-3 col-sm-offset-4 frame" style="overflow:scroll;position:absolute;left:100px;top:350px;width:500px;height:400px;padding-right:10px;padding-left:10px;">
</div>
-->
<body id="page-top">
<!-- alert 팝업 -->
		<div id="alert_popup" class="popup s400 alert_popup" style="display:none;" draggable="true">
			<div class="pop_header"><div class="layer_title"></div></div>
			<div class="pop_container">
				<div class="txt_dialog pop_message"></div>
				<p class="foot_btn">
					<a href="#" class="btn_n bg_red modal_alert_confirm">OK</a>
				</p>
			</div>
			<a href="#" class="popup_close modal_alert_close">Close</a>
		</div>

		<!-- confirm 팝업 -->
		<div id="confirm_popup"  class="popup s400 confirm_popup" style="display:none;" draggable="true">
			<div class="pop_header"><div class="layer_title"></div></div>
			<div class="pop_container">
				<div class="txt_dialog pop_message"></div>
				<p class="foot_btn">
					<a href="#" class="btn_n bg_red modal_alert_confirm">OK</a>
					<a href="#" class="btn_n bg_gray modal_alert_close">Cancel</a>
				</p>
			</div>
			<a href="#" class="popup_close modal_alert_close">Close</a>
		</div>

		<!-- 상태 진행중 팝업 -->
		<div id="progress_popup"  class="popup s400 status_progress_popup" style="display:none;" draggable="true">
			<div class="pop_header"><div class="layer_title"></div></div>
			<div class="pop_container">
				<div class="txt_dialog">
					<div class="ajax_loader"><div id="circularG_1" class="circularG"></div><div id="circularG_2" class="circularG"></div><div id="circularG_3" class="circularG"></div><div id="circularG_4" class="circularG"></div><div id="circularG_5" class="circularG"></div><div id="circularG_6" class="circularG"></div><div id="circularG_7" class="circularG"></div><div id="circularG_8" class="circularG"></div></div>
					<p class="txt_dialog3 pop_message"></p>
				</div>
			</div>
			<a href="#" class="popup_close modal_progress_close">Close</a>
		</div>



  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
      <a class="js-scroll-trigger" href="javascript:duna();">DUNA 소프트웨어로봇 서비스<sup style="font-size:15px;color:white;">free</sup></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav text-uppercase ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#services">가능한 서비스</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#portfolio">주요기능</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#price">가격?(free)</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#about">우리들은?</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#team">팀원들</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#contact">궁금하면 물어보기</a>
          </li>
          
           <% if(account != null) {%>
          <li id="logout" class="nav-item">
            <a class="nav-link js-scroll-trigger" href="javascript:logout();">로그아웃</a>
          </li>
          <li id="logout" class="nav-item">
            <a class="nav-link js-scroll-trigger" href="javascript:duna();">DUNA</a>
          </li>
          <%}else{%>
          <li id="login" class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/Anaconda.do?CMD=CMD_SEQ_104939425241510705844856">로그인</a>
          </li>
          <li id="join" class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/Anaconda.do?CMD=CMD_SEQ_102067498911560650122990">가입하기</a>
          </li>
         <%}%>
        </ul>
      </div>
    </div>
  </nav>

 <% 
 if(!strBody.equals("")) { %><jsp:include page="<%=strBody%>" flush="true" /><%
 }%>

  <!-- Footer -->
  <footer class="footer">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-md-12">
          <span class="copyright">Copyright &copy; https://app.bestmember.net</span>
          <div>family site: http://lecture.bestmember.net(COCOA) <a href="http://lecture.bestmember.net" target="new"><i class="fas fa-external-link-alt">바로가기</i></a></div>
          <div>family site: http://www.socialproject.net <a href="http://www.socialproject.net" target="new"><i class="fas fa-external-link-alt">바로가기</i></a></div>
        </div>
      </div>
    </div>
  </footer>

 
  <!-- Bootstrap core JavaScript -->
  <script src="/bt/agency/vendor/jquery/jquery.min.js"></script>
  <script src="/bt/agency/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/bt/agency/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact form JavaScript -->
  <script src="/bt/agency/js/jqBootstrapValidation.js"></script>
  <script src="/bt/agency/js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/bt/agency/js/agency.min.js"></script>

</body>

 <script>
  function fnGuide(){
     // document.location.target='_blank';
     window.open('/DUNA-Doyouwanttoknow.pdf','_blank');
  }
 </script>

</html>
