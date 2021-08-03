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
  <form id="frmLogin" name="frmLogin" action="/Anaconda.do?CMD=CMD_SEQ_108315905101597909142011" method="post">
	<a href="/CMD_SEQ_100393752981597964191876.do" class="float-right btn btn-outline-primary">회원 가입</a>
	<h4 class="card-title mb-4 mt-1">로그인</h4>
	<p>
		<a href="" class="btn btn-block btn-outline-info"> <i class="fab fa-twitter"></i>   트위터 로그인 </a>
		<a href="" class="btn btn-block btn-outline-primary"> <i class="fab fa-facebook-f"></i>   페이스북 로그인 </a>
	</p>
	<hr>
    <div class="form-group">
        <input name="EMAIL" id="EMAIL" class="form-control" placeholder="이메일" type="email">
    </div> <!-- form-group// -->
    <div class="form-group">
        <input name="PASSWD" id="PASSWD" class="form-control" placeholder="******" type="password">
    </div> <!-- form-group// -->                                      
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <button id="loginButton" type="button" class="btn btn-primary btn-block"> 로그인 </button>
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
 $("#loginButton").click(function(){
   if($("#EMAIL").val() == '' || $("#PASSWD").val() == ''){
     alert('이메일과 비밀번호를 확인해 주세요');
     return; 
   }
   frmLogin.submit();
 });    

$("#PASSWD").keypress(function(event){
    var keycode = (event.keyCode ? event.keyCode : event.which);
    if(keycode == '13'){
        frmLogin.submit();
    }
});

</script>
