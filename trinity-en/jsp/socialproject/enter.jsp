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
<div class="container">
<p class="text-center"> 
<div class="row">
<aside class="col-sm-12">
<div class="card">
<article class="card-body">
  <form id="frmEnter" name="frmEnter" action="/Anaconda.do?CMD=CMD_SEQ_100352187511597964517647" method="post">
	<a href="/CMD_SEQ_101908816461597907677432.do" class="float-right btn btn-outline-primary">로그인</a>
	<h4 class="card-title mb-4 mt-1">회원 가입</h4>
	<hr>
    <div class="form-group">
        <input name="EMAIL" id="EMAIL" class="form-control" placeholder="이메일" type="email">
    </div> <!-- form-group// -->
    <div class="form-group">
        <input name="PASSWD" id="PASSWD" class="form-control" placeholder="******" type="password">
    </div> <!-- form-group// -->                                      
    <div class="form-group">
        <input name="PASSWD2" id="PASSWD2" class="form-control" placeholder="******" type="password">
    </div> <!-- form-group// -->                                      
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <button id="enterButton" type="button" class="btn btn-primary btn-block"> 회원 가입 </button>
            </div> <!-- form-group// -->
        </div>
        <div class="col-md-6 text-right">
            <a class="small" href="#">비밀번호 찾기?</a>
        </div>                                            
    </div> <!-- .row// -->                                                                  
  </form>
</article>
</div> <!-- card.// -->

</aside> <!-- col.// -->
</div> <!-- card.// -->
</div> <!-- row.// -->
</p>
</div> 
<!--container end.//-->

<script>
 $("#enterButton").click(function(){
   if($("#EMAIL").val() == '' || $("#PASSWD").val() == ''){
     alert('이메일과 비밀번호를 확인해 주세요');
     return; 
   }
   if($("#PASSWD").val() == $("#PASSWD1").val()){
     alert('비밀번호를 확인해 주세요');
     return; 
   }
   frmEnter.submit();

 });    
</script>
