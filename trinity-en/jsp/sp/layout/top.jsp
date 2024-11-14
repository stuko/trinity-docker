<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page import="com.stuko.anaconda.Auth.*"%>
 <%
  String strBody = request.getAttribute(BlankField.VIEW_BODY) == null ? "" : (String)request.getAttribute(BlankField.VIEW_BODY);
  String strFooter = request.getAttribute(BlankField.VIEW_FOOTER) == null ? "" : (String)request.getAttribute(BlankField.VIEW_FOOTER); 
  String strLeft = request.getAttribute(BlankField.VIEW_LEFT) == null ? "" : (String)request.getAttribute(BlankField.VIEW_LEFT); 
  String strRight = request.getAttribute(BlankField.VIEW_RIGHT) == null ? "" : (String)request.getAttribute(BlankField.VIEW_RIGHT); 
  String strTop = request.getAttribute(BlankField.VIEW_TOP) == null ? "" : (String)request.getAttribute(BlankField.VIEW_TOP); 

Object sessionObject = request.getAttribute(InitClass.getSessionValue());
Object account = session.getAttribute("Account");
String jndi = (String)session.getAttribute("jndi");

String LEVEL="0";
if(sessionObject != null){
   BusinessRecord record = (BusinessRecord)sessionObject;
   LEVEL = record.getFieldValue("CV_LEVEL");
}
%>


   <nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
    <a class="navbar-brand font-weight-bolder mr-3" href="index.html"><img src="/jsp/chatvatar/img/chatvatar.jpeg" width="60px">소셜프로젝트</a> 
    <button class="navbar-light navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsDefault" aria-controls="navbarsDefault" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarsDefault">
<!--
    	<ul class="navbar-nav mr-auto align-items-center">
    		<form class="bd-search hidden-sm-down">
    			<input type="text" class="form-control bg-graylight border-0 font-weight-bold" id="search-input" placeholder="검색하기...(준비중)" autocomplete="off">
    			<div class="dropdown-menu bd-search-results" id="search-results">
    			</div>
    		</form>
    	</ul>
-->
    	<ul class="navbar-nav ml-auto align-items-center">
    		<li class="nav-item" style='font-family:카페24 써라운드 에어'>
                   로봇(DUNA)과 함께 하는 일 상상해 보셨나요? 잘 모르는 일을 해야 할 때 찾아 보세요
                </li>
<!--
                <% if(!"0".equals(LEVEL)) { %>
                <li class="nav-item">
    		<a class="nav-link" href="/CMD_SEQ_101908816461597907677432.do"><img class="rounded-circle mr-2" src="/jsp/socialproject/assets/img/av.png" width="30"><span class="align-middle">내정보</span></a>
    		</li>
                <li class="nav-item">
    		<a class="nav-link" href="/CMD_SEQ_103062227551598142684555.do"><span class="align-middle">로그아웃</span></a>
    		</li>
                <% }else{ %>
                <li class="nav-item">
   		<a class="nav-link" href="/CMD_SEQ_101908816461597907677432.do"><img class="rounded-circle mr-2" src="/jsp/socialproject/assets/img/av.png" width="30"><span class="align-middle">로그인</span></a>
    		</li>
                <% } %>
-->
    		<!--
                <li class="nav-item dropdown">
    		<a class="nav-link" href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    		<svg style="margin-top:10px;" class="_3DJPT" version="1.1" viewbox="0 0 32 32" width="21" height="21" aria-hidden="false" data-reactid="71"><path d="M7 15.5c0 1.9-1.6 3.5-3.5 3.5s-3.5-1.6-3.5-3.5 1.6-3.5 3.5-3.5 3.5 1.6 3.5 3.5zm21.5-3.5c-1.9 0-3.5 1.6-3.5 3.5s1.6 3.5 3.5 3.5 3.5-1.6 3.5-3.5-1.6-3.5-3.5-3.5zm-12.5 0c-1.9 0-3.5 1.6-3.5 3.5s1.6 3.5 3.5 3.5 3.5-1.6 3.5-3.5-1.6-3.5-3.5-3.5z" data-reactid="22"></path></svg>
    		</a>
    		<div class="dropdown-menu dropdown-menu-right shadow-lg" aria-labelledby="dropdown02">
    			<h4 class="dropdown-header display-4">Download Pintereso<br/> HTML Bootstrap Template</h4>
    			<div class="dropdown-divider">
    			</div>
    			<span class="dropdown-item"><a href="https://github.com/wowthemesnet/template-pintereso-bootstrap-html/archive/master.zip" class="btn btn-primary d-block"><i class="fa fa-download"></i> Download</a></span>
    		</div>
    		</li>
                -->
    	</ul>
    </div>
    </nav>    
    <main role="main">
