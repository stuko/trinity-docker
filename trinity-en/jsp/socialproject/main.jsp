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
<style>
.rating-css {
  height: 40px;
  width: 100px;
  padding: 2px;
}
.rating-css div {
  color: #ffe400;
  font-size: 14px;
  font-family: sans-serif;
  font-weight: 80;
  text-align: center;
  text-transform: uppercase;
  padding: 2px 0;
}
.rating-css input {
  display: none;
}
.rating-css input + label {
  font-size: 6px;
  text-shadow: 1px 1px 0 #ffe400;
  cursor: pointer;
}
.rating-css input:checked + label ~ label {
  color: #838383;
}
.rating-css label:active {
  transform: scale(0.8);
  transition: 0.3s ease;
}


</style>

<%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getPublicScenario");
%>
  <section class="mt-4 mb-5">
    <div class="container mb-4">
    	<!--<h1 class="font-weight-bold title">찾아보기</h1>-->
    	<div class="row">
    		<nav class="navbar navbar-expand-lg navbar-light bg-white pl-2 pr-2">
    		<!--<button class="navbar-light navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExplore" aria-controls="navbarsDefault" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
    		</button>-->
    		<div class="collapse navbar-collapse" id="navbarsExplore">
    			<ul class="navbar-nav">

                               <li class="nav-item">
                                세상의 모든 노하우들을 로봇에게 전달해 주고, 로봇과 함께 지식을 공유할 수 있는 '소셜 프로젝트'를 사용해 보세요
                               </li>
                               <!--
    				<li class="nav-item">
    				<a class="nav-link" href="#">대화내용 인기순</a>
    				</li>
    				<li class="nav-item">
    				<a class="nav-link" href="#">제작자 인기순</a>
                                -->
    				</li>
    				<!--
    				<li class="nav-item dropdown">
    				<a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">More</a>
    				<div class="dropdown-menu shadow-lg" aria-labelledby="dropdown01">
    					<a class="dropdown-item" href="#">Astronomy</a>
    					<a class="dropdown-item" href="#">Nature</a>
    					<a class="dropdown-item" href="#">Cooking</a>
    					<a class="dropdown-item" href="#">Fashion</a>
    					<a class="dropdown-item" href="#">Wellness</a>
    					<a class="dropdown-item" href="#">Dieting</a>
    				</div>
    				</li>
                                -->
    			</ul>
    		</div>
    		</nav>
    	</div>
    </div>
    <div class="container-fluid">
    	<div class="row">
    		<div class="card-columns">
<% for(int i = 0; i < bc.size(); i++){ %>
  <% String div_style="overlay"; %>
  <% String div_more_css="more"; %>
  <% String div_more_style=""; %>
  <% String desc =""; %>
  <% String image_path = bc.getBusinessData(i).getFieldValue("PS_IMAGE"); %>
  <% String uploadFolder = InitClass.getInstance().getData(InitClass.UploadFolder); %>
  <% 
  if(!image_path.trim().startsWith("http")){
     File root = new File(pageContext.getServletContext().getRealPath("/"), uploadFolder);
     File imgFile = new File( root , image_path); 
     if(!imgFile.exists()) image_path = "/jsp/sp/img/duna_chat_bg.png"; 
     else image_path = InitClass.getInstance().getStandardPathType(uploadFolder) + InitClass.getInstance().getStandardPathType(image_path);
  }
  %>
  <% // if("/jsp/sp/img/duna_chat_bg.png".equals(image_path)) div_style=""; %>
  <% if("/jsp/sp/img/duna_chat_bg.png".equals(image_path)) div_more_css=""; %>
  <% if("/jsp/sp/img/duna_chat_bg.png".equals(image_path)) div_more_style="position:absolute;top:60px;left:10px;color:#FFFFFF"; %>
  <% if("/jsp/sp/img/duna_chat_bg.png".equals(image_path)) desc = bc.getBusinessData(i).getFieldValue("PS_DESC");; %>
    			<div class="card card-pin">
                                <% if("".equals(div_style)) {%>
                                  <div style="margin-left:5px" class="nav-link"><%=bc.getBusinessData(i).getFieldValue("PS_SUBJECT")%></div>
 <div class="rating-css">
    <div class="star-icon">
      <input type="radio" name="rating1" id="rating1">
      <label for="rating1" class="fa fa-star"></label>
      <input type="radio" name="rating1" id="rating2">
      <label for="rating2" class="fa fa-star"></label>
      <input type="radio" name="rating1" id="rating3">
      <label for="rating3" class="fa fa-star"></label>
      <input type="radio" name="rating1" id="rating4">
      <label for="rating4" class="fa fa-star"></label>
      <input type="radio" name="rating1" id="rating5">
      <label for="rating5" class="fa fa-star"></label>
    </div>
  </div>

<span style="font-family:카페24 동동;color:green;margin-left:5px"><%=bc.getBusinessData(i).getFieldValue("PS_SUBJECT")%></span>
                                 <% if ( image_path.endsWith(".mp4") ) {%>
                                  <video class="card-img" src="<%=image_path%>" autoplay muted type="video/mp4" loop="loop"></video>
                                 <%} else {%>
    				  <img class="card-img" src="<%=image_path%>" alt="Card image">
                                 <% } %> 
                                <% } else { %>
 <div class="rating-css">
    <div class="star-icon">
      <input type="radio" name="rating1" id="rating1">
      <label for="rating1" class="fa fa-star"></label>
      <input type="radio" name="rating1" id="rating2">
      <label for="rating2" class="fa fa-star"></label>
      <input type="radio" name="rating1" id="rating3">
      <label for="rating3" class="fa fa-star"></label>
      <input type="radio" name="rating1" id="rating4">
      <label for="rating4" class="fa fa-star"></label>
      <input type="radio" name="rating1" id="rating5">
      <label for="rating5" class="fa fa-star"></label>
    </div>
  </div>

<span style="font-family:카페24 동동;color:green;margin-left:5px"><%=bc.getBusinessData(i).getFieldValue("PS_SUBJECT")%></span>
                                 <% if ( image_path.endsWith(".mp4") ) {%>
                                  <video class="card-img" src="<%=image_path%>" autoplay muted type="video/mp4" loop="loop"></video>
                                 <%} else {%>
    				  <img class="card-img" src="<%=image_path%>" alt="Card image">
                                 <% } %> 
                                <% } %>
                                <!--h2 class="card-title title"><%=bc.getBusinessData(i).getFieldValue("PS_SUBJECT")%></h2-->
                               <a href="/Anaconda.do?CMD=CMD_SEQ_101787861631594477479366&PS_KEY=<%=bc.getBusinessData(i).getFieldValue("PS_KEY")%>">
    				<div class="<%=div_style%>">
                                        <% if("".equals(div_style)) {%>
                                          <h4 style="margin-bottom:20px;" class=""><%=bc.getBusinessData(i).getFieldValue("PS_NAME")%></h4>
                                        <% } else { %>
      					  <h2 class="card-title title"><%=bc.getBusinessData(i).getFieldValue("PS_SUBJECT")%></h2>
                                        <% } %>
    					<div class="<%=div_more_css%>" style="<%=div_more_style%>">
    						<a 
                                                 href="/Anaconda.do?CMD=CMD_SEQ_101787861631594477479366&PS_KEY=<%=bc.getBusinessData(i).getFieldValue("PS_KEY")%>" 
                                                 style="color:#FFFFFF;">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true" style="color:#FFFFFF;"></i> More </a>
                                                <% if("".equals(div_style)) {%>
                                                  <div style="padding: 10px 10px 10px 10px;"><%=desc.replace("\n","<br>")%></div>
                                                <% } %>
    					</div>
    				</div>
                              </a>
    			</div>
<% } %>

    		</div>
    	</div>
    </div>
    </section>
