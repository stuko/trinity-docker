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
<%@ page import="com.stuko.anaconda.util.InitClass"%>

 <%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getMemberInfo");

%>
<div class="gray-bg middle-box text-center loginscreen animated fadeInDown"> 
       <div>
            <div style="text-align:center">
                <h1 class="logo-name">T+</h1>
            </div>
        <h3>회원정보수정</h3>
            <p>
            </p>
            <p>or.(<a href="/Anaconda.do?CMD=CMD_SEQ_108989841081515973724128">Home</a>)</p>
            <form class="m-t" role="form" method="post" name="frmEnter" action="/Anaconda.do">
               <div class="form-group">
                     <input type="password" name="password" id="password" class="form-control" value="" class="form-control" placeholder="Password" required=""></input>
               </div>
               <div class="form-group">
                     <input type="password" name="password2" id="password2" class="form-control" value="" class="form-control" placeholder="Confirm password" required=""></input>
               </div>
              <button class="btn btn-primary"  type="button" value="수정하기" onClick="javascript:fnMemberModify();" >수정하기</button>
	      <button class="btn btn-primary"  type="button" value="돌아가기" onClick="javascript:history.back();" >돌아가기</button>
               <div>
              <div>
                <a href="https://app.bestmember.net/Anaconda.do?CMD=CMD_SEQ_101263323761515982251126"><small>로그인을 원하시나요?</small></a>
              </div>
              <div>
                <a href="/Anaconda.do?CMD=CMD_SEQ_101263323761515982251126"><small>비밀번호를 잊으셨나요?</small></a>
              </div>
               </div>
            </form>
            <p class="m-t"> <small>BESTMEMBER+ &copy; 2018</small> </p>
        </div>
</div>
