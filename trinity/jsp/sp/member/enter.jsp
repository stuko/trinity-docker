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
 $('#btn_join').click(function(){
  with(frmEnter){
    if(team.value == ''){
       showPopup('Failure','You must enter the service code.',null);
       return;
    }
    if(email.value == ''){
       showPopup('Failure','You must enter the email.',null);
       return;
    }
    if(password.value == ''){
       showPopup('Failure','You must enter the password.',null);
       return;
    }
    if(password.value != password2.value){
       showPopup('Failure','Please confirm your password.',null);
       return;
    }
    

    fnCheckAndEnter(email,()=>{
       var d = {"email" : email.value, "password" : password.value, "team" : team.value};
       post(d,'CMD_SEQ_101104202101497847031986',(json)=>{
          showPopup('success', "Please send an e-mail request with the e-mail you entered.",null);
          confirmPopup('Info' ,'Do you want to start DUNA? Go to login',()=>{
             login();
          });
       } , ()=>{
          simplePopup('fail', 'Sorry. There is an error in the information you entered and you can not sign up.');
       });
    });
   }
 });
});

function fnCheckAndEnter(email , fnSuccess ){
  
  if(email.value == '' || email.value.length < 5 || email.value.indexOf('@') < 0){
     showPopup('fail', "You can not use this email.",null);
     return;
  }
  
  var d = {"email" : email.value}
  post(d,"CMD_SEQ_104139162881516165491833",(json)=>{
    if(json && json.checkEmail && json.checkEmail[0].Email == '0'){
        showPopup('success', "You can use this email.",null);
        if(fnSuccess != null) fnSuccess();
    }else{
        showPopup('fail', "You can not use this email.",null);
        email.value = '';
    }
  },()=>{
    if(json && json.checkEmail && json.checkEmail[0].Email == '0'){
        showPopup('fail', "You can not use this email.",null);
        email.value = '';
    }
  });

}

function checkEmail(email){
  fnCheckAndEnter(email, null);
}
</script>

<div class="container-fluid" style="z-index:10;padding-top:20px;">
     <div class="card mb-3" style="padding-bottom:40px;">
           <div class="card-header">
             <h3><img src="/jsp/sp/img/login.png" width="30px">&nbsp; 가입하기</h3>
           </div>
          * DUNA 챗봇 서비스를 이용해 주셔서 감사합니다. DUNA 는 챗봇을 만들고 운영하기 위한 편리한 환경을 제공해 드립니다.
      </div>

<form id="frmEnter" name="frmEnter" method="POST" action="/Anaconda.do?CMD=CMD_SEQ_101104202101497847031986">
  <input type="hidden" id="team" name="team" value="TCODE">
  <!--
  <div class="form-group">
    <label for="team">Service code:</label>
    <input type="team" class="form-control" id="team" name="team">
  </div>
  -->
  <div class="form-group">
    <label for="email">이메일:</label>
    <input type="email" class="form-control" id="email" name="email" onblur="checkEmail(this)">
  </div>
  <div class="form-group">
    <label for="pwd">비밀번호:</label>
    <input type="password" class="form-control" id="pwd" name="password">
  </div>
  <div class="form-group">
    <label for="pwd">비밀번호 확인:</label>
    <input type="password" class="form-control" id="pwd2" name="password2">
  </div>
  <button type="button" id="btn_join" class="btn btn-primary btn-lg">가입하기</button>
  <button type="button" id="btn_login" class="btn btn-secondary btn-lg" onclick="javascript:login();">로그인</button>
  <button type="button" id="btn_forgot" class="btn btn-info btn-lg" onclick="javascript:forgot();">비밀번호 재발급</button>
</form>
</div>
<script>
 alertPopup('알림','회원가입시 입력한 이메일로 <br>인증메일이 발송됩니다.<br> 인증메일을 통해, 인증이 완료된후,<br> 로그인해 주시기 바랍니다.');
</script>
