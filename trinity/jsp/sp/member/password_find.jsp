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
function findPassword(){
  fnForgotPlusAndGo(null,()=>{
    confirmPopup('Info' ,'Do you want to login?',()=>{
       document.location.href='/Anaconda.do?CMD=CMD_SEQ_104939425241510705844856';
    });
  });
}
</script>

<div class="container-fluid" style="z-index:10;padding-top:20px;">
     <div class="card mb-3" style="padding-bottom:40px;">
           <div class="card-header">
             <h3><img src="/jsp/sp/img/login.png" width="30px">&nbsp; 비밀번호 재설정</h3>
           </div>
          * 가입시 사용하셨던 이메일로 초기화된 비밀번호를 전송해 드립니다. </div>

<form id='frmLogin' name="frmLogin" method="POST" action="/Anaconda.do?CMD=CMD_SEQ_103566056471557322649622">
  <div class="form-group">
    <label for="email">이메일:</label>
    <input type="email" class="form-control" id="email" name="email">
  </div>
  <button type="button" id="btn_forgot" class="btn btn-primary btn-lg" onClick="javacript:findPassword();">비밀번호 재설정</button>
  <button type="button" id="btn_login" class="btn btn-secondary btn-lg" onClick="javascript:login();">로그인</button>
  <button type="button" id="btn_join" class="btn btn-secondary btn-lg" onClick="javascript:join()">가입하기</button>
</form>
</div>
