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
<%
%>

<script language="javascript">
$(document).ready(function(){
 $('#btn_login').click(function(){
    fnLogin();
 });

 $("#password").keyup(function(e){if(e.keyCode == 13) { fnLogin(); } });


});

function fnLogin(){
  loginWithNext('email','password','/Anaconda.do?CMD=CMD_SEQ_105943068391560662902167');
}
</script>

<script src="https://apis.google.com/js/platform.js" async="" defer=""></script> 

<div class="container-fluid" style="z-index:10;padding-top:20px;">
     <div class="card mb-3" style="padding-bottom:40px;">
           <div class="card-header">
             <h3><img src="/jsp/sp/img/login.png" width="30px">&nbsp; 로그인</h3>
           </div>
          * DUNA 챗봇 서비스를 이용해 주셔서 감사합니다. DUNA 는 챗봇을 만들고 운영하기 위한 편리한 환경을 제공해 드립니다.
      </div>

<form id='frmLogin' name="frmLogin" method="POST" action="/Anaconda.do?CMD=CMD_SEQ_103566056471557322649622">
  <input type="hidden" id="team" name="team" value="TCODE">
  <!--
  <div class="form-group">
    <label for="team">Service code:</label>
    <input type="team" class="form-control" id="team" name="team">
  </div>
  -->
  <div class="form-group">
    <label for="email">이메일:</label>
    <input type="email" class="form-control" id="email" name="email">
  </div>
  <div class="form-group">
    <label for="pwd">비밀번호:</label>
    <input type="password" class="form-control" id="password" name="password">
  </div>
  <button type="button" id="btn_login" class="btn btn-primary btn-lg">로그인</button>
  <button type="button" id="btn_join" class="btn btn-secondary btn-lg" onClick="javascript:join()">가입하기</button>
  <button type="button" id="btn_forgot" class="btn btn-info btn-lg" onClick="javacript:forgot();">비밀번호 재발급</button>



</form>
<!--
<div style="margin-top : 20px;">
  <table>
   <tbody><tr><td style="text-align:center;align:center;vertical-align: middle;">
    <div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" perms="user_about_me,email" data-use-continue-as="false" onlogin="fnFBLogin();"></div>
     </td>
    </tr>
    <tr><td style="text-align:center;align:center;vertical-align: middle;padding-top:10px;padding-bottom:10px;">
      <div class="g-signin2" data-onsuccess="fnGGLogin" data-theme="dark"></div>
      </td>
    </tr>
  </tbody>
 </table>
</div>
-->

</div>



<script>


function fnGoSocialLoginNext(){
   document.location.href = '/Anaconda.do?CMD=CMD_SEQ_105943068391560662902167';
}

$('#pw').keyup(function(e) {
    if (e.keyCode == 13) login('id','pw');        
});


</script>
