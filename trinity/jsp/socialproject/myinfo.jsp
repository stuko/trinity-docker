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

String EMAIL = "";

%>
<div class="container">
<p class="text-center"> 
<div class="row">
<aside class="col-sm-12">
<div class="card">
<article class="card-body">
  <form id="frmModify" name="frmModify" action="/Anaconda.do?CMD=CMD_SEQ_108315905101597909142011" method="post">
	<a href="/CMD_SEQ_100393752981597964191876.do" class="float-right btn btn-outline-primary">내가 사용중인 시나리오</a>
	<h4 class="card-title mb-4 mt-1">나의 정보 수정</h4>
	<hr>
    <div class="form-group">
        <input name="EMAIL" id="EMAIL" class="form-control" disabled="true" placeholder="이메일" type="email" value="<%=EMAIL%>">
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
                <button id="modifyButton" type="button" class="btn btn-primary btn-block"> 수정하기 </button>
            </div> <!-- form-group// -->
        </div>
        <div class="col-md-6 text-right">
            <a class="small" href="#"> 회원 탈퇴 </a>
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
 $("#modifyButton").click(function(){
   if($("#PASSWD").val() == ''){
     alert('이메일과 비밀번호를 확인해 주세요');
     return; 
   }
   if($("#PASSWD").val() !=  $("#PASSWD2").val() ){
     alert('비밀번호가 일치하지 않습니다. 확인해 주세요');
     return; 
   }

   frmModify.submit();
 });    

</script>
