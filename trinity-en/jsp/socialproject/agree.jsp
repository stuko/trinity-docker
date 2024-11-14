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
     <h4 class="card-title mb-4 mt-1">회원 가입 동의서</h4>
	<hr>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <button id="agreeButton" type="button" class="btn btn-primary btn-block"> 동의합니다 </button>
            </div> <!-- form-group// -->
        </div>
        <!--
        <div class="col-md-6 text-right">
            <a class="small" href="#">비밀번호 찾기?</a>
        </div>                                            
        -->
    </div> <!-- .row// -->                                                                  
</article>
</div> <!-- card.// -->

</aside> <!-- col.// -->
</div> <!-- card.// -->
</div> <!-- row.// -->
</p>
</div> 
<!--container end.//-->

<script>
 $("#agreeButton").click(function(){
   document.location.href='/CMD_SEQ_102994968231597961607108.do';
 });    
</script>
