<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.filter.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.action.*"%>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
pre {
    background: #f4f4f4;
    border: 1px solid #ddd;
    border-left: 3px solid #f36d33;
    color: #666;
    page-break-inside: avoid;
    font-family: monospace;
    font-size: 15px;
    line-height: 1.6;
    margin-bottom: 1.6em;
    max-width: 100%;
    overflow: auto;
    padding: 1em 1.5em;
    display: block;
    word-wrap: break-word;
}
</style>

<%
%>

 <%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getMemberInfo");
BusinessCollection bc2 = RequestHelper.getBusinessCollection(request,"getTokenAndSecretKey");
BusinessCollection bc3 = RequestHelper.getBusinessCollection(request,"checkChatBotDB");

String clientid = "Not published";
String secretkey = "Not published";
String db = "Not published";
String url = "Not published";
String total = "0";
if(bc2 != null && bc2.size() == 1){
   clientid = bc2.getBusinessData(0).getFieldValue("Token");
   secretkey = bc2.getBusinessData(0).getFieldValue("SecretKey"); 
}
if(bc3 != null && bc3.size() == 1){
   db = bc3.getBusinessData(0).getFieldValue("db"); 
   url = bc3.getBusinessData(0).getFieldValue("url"); 
   total = bc3.getBusinessData(0).getFieldValue("total"); 
}

boolean needChatBotDB = (bc3 != null && bc3.size() > 0) ?  false : true;

String domain = request.getScheme() + "://" + request.getServerName();

%>

<script language="javascript">


function createDB(){
  var d = {};
  post(d,"CMD_SEQ_108475078891560743573347",()=>{
     showPopup("성공","축하합니다, 소프트웨어로봇 데이터베이스가 생성을 요청하였습니다. (새 데이터베이스 적용은 최다 1시간정도 소요됩니다.)",null);
     confirmPopup('성공','새로운 소프트웨어로봇 데이터 베이스가 적용되기 위해서는 최대 1시간 정도 소요됩니다., 다시 로그인을 하신후, 사용하시기 바랍니다.', ()=>{
        document.location.href='/Anaconda.do?CMD=CMD_SEQ_100466023431495768917557';
     });
  },()=>{
     showPopup("fail","Sorry. An unknown problem has occurred. Please try again later.",null);
  });
}
</script>

<div class="container-fluid" style="z-index:10;padding-top:20px;">
     <div class="card mb-3" style="padding-bottom:40px;">
           <div class="card-header">
             <h3><img src="/jsp/sp/img/login.png" width="30px">&nbsp; My Information</h3>
           </div>
          * DUNA 소프트웨어로봇 서비스를 이용해 주셔서 감사합니다.
      </div>


     <div class="card mb-3" style="padding-bottom:40px;">
           <div class="card-header">
             <h6>&nbsp; DUNA 소프트웨어로봇 인증 키<br>
             <%
              if(needChatBotDB){
             %>
             * 아직 소프트웨어로봇을 생성하지 않았습니다. 소프트웨어로봇이 필요하시면 생성 버튼을 이용해 주세요 &nbsp;
                 <button type="button" id="btn_chatbotdb" class="btn btn-danger btn-lg" onclick="javascript:createDB();">Create
 ChatBot</button>
             <%}else{%>
             <div>
              <ul>
             <li> 소프트웨어로봇이 생성되었습니다. <i class="fas fa-certificate fa-2x" style="color:#FF5733;"></i></li>
             <li> 현재 회원님의 소프트웨어로봇은 <%=total%>개의 DB 연결을 사용중이십니다.(시스템의 안정성을 위해 기본적으로 100개 이하가 할당됩니다)</li>
              </ul>
          <div>* Your clientid is : <span style="color:blue;font-weight:bold"><%=clientid%></span> , You can use this clientid in your HTTP header (name : 'clientid')</div>
          <div>* Your secretkey is : <span style="color:blue;font-weight:bold"><%=secretkey%></span> , You can use this secretkey in your HTTP header (name : 'secretkey')
          <div>* Your Instance Name is : <span style="color:blue;font-weight:bold"><%=db%></span></div>
             </div>
             <div style="margin-top:10px;">
               <button type="button" id="btn_regenerate" class="btn btn-danger btn-lg">데이터베이스 재생성</button>
               <button type="button" id="btn_increase" class="btn btn-warning btn-lg">DB 연결 증설 요청</button>
               <button type="button" id="btn_remove" class="btn btn-secondary btn-lg">탈퇴하기</button>
              </div>
             <%}%>
             </h6>
           </div>
           </div>  

      </div>
<script>
$(document).ready(function() {
    $("#btn_script_code").button().on("click", function(event) {
        $('#script_code').toggle();

    $(this).text(function(i, text){
          return text === "코드 보기" ? "코드 숨기기" : "코드 보기";
      })
   });
   $("#btn_regenerate").button().on("click", function(event) {
        confirmPopup('Warning','Really regenerate your database?',()=>{
          regenerateDB();
        });
   });
   $("#btn_increase").button().on("click", function(event) {
        confirmPopup('경고','데이터베이스 연결 수를 증설해 드릴까요?',()=>{
          increaseDB();
        });
   });


   $("#btn_remove").button().on("click", function(event) {
        confirmPopup('Warning','Really remove your all data and log out?',()=>{
          removeMe();
        });
   });


});

function regenerateDB(){
  var d = {};
  post(d,"CMD_SEQ_105291514401582930148733",()=>{
     showPopup("success","Congratulation, You own ChatBot D/B was regenerated",null);
  },()=>{
     showPopup("fail","Sorry. An unknown problem has occurred. Please try again later.",null);
  });
}

function increaseDB(){
  var d = {};
  post(d,"CMD_SEQ_108635856641607901228190",()=>{
     showPopup("성공","축하합니다. 요청하신 증설이 승인 되었습니다. 1시간정도 후에 반영될 예정입니다.",null);
     document.location.reload();
  },()=>{
     showPopup("실패","죄송합니다. 요청하신 증설이 거절 되었습니다.",null);
  });
}



function removeMe(){
  var d = {};
  post(d,"CMD_SEQ_103031638891602943798731",()=>{
     showPopup("success","Congratulation, You own Data was removed",null);
     logout();
  },()=>{
     showPopup("fail","Sorry. An unknown problem has occurred. Please try again later.",null);
  });
}
</script>
 <span class="float-xs-right" style="margin-top:10px;margin-left:10px"><button type="button" id="btn_script_code" class="btn btn-danger btn-lg">코드 보기</button></span>
 <div id="script_code" class="card mb-3" style="padding-bottom:80px;display:none;margin-bottom:40px;margin-top:20px;">
           <div class="card-header">

<h6>&nbsp; 방법 1)  HTML 소스 </h6>
<pre style="color:blue;font-weight:bold">
  (1) JQuery CDN 포함 (<a href="http://code.jquery.com/" target="_new">JQuery 소스</a>)
    &lt;script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="   crossorigin="anonymous"&gt;&lt;/script&gt;
  (2) Javascript 소스 포함 
    &lt;script src="<%=domain%>/Anaconda.do?CMD=CMD_SEQ_100697583901583557897409&clientId=<%=clientid%>&secretKey=<%=secretkey%>"&gt;&lt;/script&gt;
  (3) CSS 소스 포함
    &lt;link rel="stylesheet" href="<%=domain%>/Anaconda.do?CMD=CMD_SEQ_107379266481583583370476"&gt;
</pre>


<h6>&nbsp; 방법 2)  자바스크립트 코드 예제 <br></h6>
<pre>

REST 호출방법

http://saas.socialproject.net/rest?msgType=DUNA.SAAS&MY_THOUGHT=[메시지]&clientId=<%=clientid%>&secretKey=<%=secretkey%>&channelId=<%=clientid%>


JQuery 를 사용하는 경우 아래 처럼 작성합니다.

var d = {msgType : "DUNA.SAAS"
       , clientId : "<%=clientid%>" // Your clientId
       , secretKey : "<%=secretkey%>" // Your secretId
       , channelId : "<%=clientid%>" // Your clientId or chat room id
       , message : "Your message......."
       };
var param = JSON.stringify(d);
$.ajax({
        type : "POST",
        url : "http://engine ip :port/chat",
        dataType : "text",
        data: param ,
        cache: false,
        global: false,
        error : function(err){
        },
        success : function(json){
          var contents = "";
          if(json.contents_list && json.contents_list.length && json.contents_list.length > 0 && json.contents_list[0].contents ){
              contents =  json.contents_list[0].contents;
          } 
          alert(contents);
        }
});
</pre>
   </div>
</div>
<form id="frmModify" name="frmModify" method="POST" action="">
  <div class="form-group" style="margin-top:10px;">
    <label for="email">이메일:</label>
    <input type="email" class="form-control" id="email" name="email" readonly  value='<%=bc.getBusinessData(0).getFieldValue("Email")%>' onblur="checkEmail(this)">
  </div>
  <div class="form-group">
    <label for="pwd">도메인 URL:</label>
    <input type="text" class="form-control" id="domain" value='<%= (bc2 == null || bc2.size() == 0) ? "" : bc2.getBusinessData(0).getFieldValue("domain")%>' name="domain">(* 소프트웨어로봇을 사용하시려는 사이트의 도메인 ex: shop.cafe24.com )
  </div>
  <div class="form-group">
    <label for="pwd">콜백 URL:</label>
    <input type="text" class="form-control" id="callback" value='<%= (bc2 == null || bc2.size() == 0) ? "" : bc2.getBusinessData(0).getFieldValue("callback")%>' name="callback">(* OAuth2 콜백용 URL)
  </div>
  <div class="form-group">
    <label for="pwd">비밀번호:</label>
    <input type="password" class="form-control" id="password" value='' name="password">
  </div>
  <div class="form-group">
    <label for="pwd">비밀번호 확인:</label>
    <input type="password" class="form-control" id="password2" value='' name="password2">
  </div>
  <button type="button" id="btn_join" class="btn btn-primary btn-lg" onClick="javascript:fnMemberModify();">수정하기</button>
  <!--<button type="button" id="btn_login" class="btn btn-secondary btn-lg" onclick="javascript:login();">로그인</button>
  <button type="button" id="btn_forgot" class="btn btn-info btn-lg" onclick="javascript:forgot();">Forgot password</button>-->
</form>
</div>
