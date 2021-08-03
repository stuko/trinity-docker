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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getPublicScenario");
%>
  <section class="mt-4 mb-5">
    <div class="container mb-4">
    	<!--<h1 class="font-weight-bold title">찾아보기</h1>-->
    	<div class="row">
    		<nav class="navbar navbar-expand-lg navbar-light bg-white pl-2 pr-2">
    		<button class="navbar-light navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExplore" aria-controls="navbarsDefault" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
    		</button>
    		<div class="collapse navbar-collapse" id="navbarsExplore">
    			<ul class="navbar-nav">
                               <li class="nav-item">
                                세상의 모든 노하우들을 로봇에게 전달해 주고, 그 이상의 가치와 즐거움을 누릴 수 있는 '쳇바타'와 함께 하세요
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
                                  <div style="" class="nav-link"><%=bc.getBusinessData(i).getFieldValue("PS_SUBJECT")%></div>
    				  <img class="card-img" src="<%=image_path%>" alt="Card image">
                                <% } else { %>
    				  <img class="card-img" src="<%=image_path%>" alt="Card image">
                                <% } %>
                                <!--h2 class="card-title title"><%=bc.getBusinessData(i).getFieldValue("PS_SUBJECT")%></h2-->
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
    			</div>
<% } %>
<!--
    			<div class="card card-pin">
    				<img class="card-img" src="https://images.unsplash.com/photo-1519996521430-02b798c1d881?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=79f770fc1a5d8ff9b0eb033d0f09e15d&auto=format&fit=crop&w=500&q=60" alt="Card image">
    				<div class="overlay">
    					<h2 class="card-title title">Cool Title</h2>
    					<div class="more">
    						<a href="post.html">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>
    			<div class="card card-pin">
    				<img class="card-img" src="https://images.unsplash.com/photo-1505210512658-3ae58ae08744?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=2ef2e23adda7b89a804cf232f57e3ca3&auto=format&fit=crop&w=333&q=80" alt="Card image">
    				<div class="overlay">
    					<h2 class="card-title title">Cool Title</h2>
    					<div class="more">
    						<a href="post.html">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>
    			<div class="card card-pin">
    				<img class="card-img" src="https://images.unsplash.com/photo-1488353816557-87cd574cea04?ixlib=rb-0.3.5&s=06371203b2e3ad3e241c45f4e149a1b3&auto=format&fit=crop&w=334&q=80" alt="Card image">
    				<div class="overlay">
    					<h2 class="card-title title">Cool Title</h2>
    					<div class="more">
    						<a href="post.html">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>
    			<div class="card card-pin">
    				<img class="card-img" src="https://images.unsplash.com/photo-1518450757707-d21c8c53c8df?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c88b5f311958f841525fdb01ab3b5deb&auto=format&fit=crop&w=500&q=60" alt="Card image">
    				<div class="overlay">
    					<h2 class="card-title title">Cool Title</h2>
    					<div class="more">
    						<a href="post.html">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>
    			<div class="card card-pin">
    				<img class="card-img" src="https://images.unsplash.com/photo-1483190656465-2c49e54d29f3?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=7c4d831daffc28f6ce144ae9e44072e2&auto=format&fit=crop&w=500&q=60" alt="Card image">
    				<div class="overlay">
    					<h2 class="card-title title">Cool Title</h2>
    					<div class="more">
    						<a href="post.html">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>
    			<div class="card card-pin">
    				<img class="card-img" src="https://images.unsplash.com/photo-1501813531019-338a4182efb0?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ad934c7483b928cae6b0b9cde5ae3445&auto=format&fit=crop&w=500&q=60" alt="Card image">
    				<div class="overlay">
    					<h2 class="card-title title">Cool Title</h2>
    					<div class="more">
    						<a href="post.html">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>
    			<div class="card card-pin">
    				<img class="card-img" src="https://images.unsplash.com/photo-1518542331925-4e91e9aa0074?ixlib=rb-0.3.5&s=6958cfb3469de1e681bf17587bed53be&auto=format&fit=crop&w=500&q=60" alt="Card image">
    				<div class="overlay">
    					<h2 class="card-title title">Cool Title</h2>
    					<div class="more">
    						<a href="post.html">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>
    			<div class="card card-pin">
    				<img class="card-img" src="https://images.unsplash.com/photo-1513028179155-324cfec2566c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=32ce1df4016dadc177d6fce1b2df2429&auto=format&fit=crop&w=350&q=80" alt="Card image">
    				<div class="overlay">
    					<h2 class="card-title title">Cool Title</h2>
    					<div class="more">
    						<a href="post.html">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>
    			<div class="card card-pin">
    				<img class="card-img" src="https://images.unsplash.com/photo-1516601255109-506725109807?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ce4f3db9818f60686e8e9b62d4920ce5&auto=format&fit=crop&w=500&q=60" alt="Card image">
    				<div class="overlay">
    					<h2 class="card-title title">Cool Title</h2>
    					<div class="more">
    						<a href="post.html">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>
    			<div class="card card-pin">
    				<img class="card-img" src="https://images.unsplash.com/photo-1509233631037-deb7efd36207?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=75a5d784cdfc8f5ced8a6fe26c6d921e&auto=format&fit=crop&w=500&q=60" alt="Card image">
    				<div class="overlay">
    					<h2 class="card-title title">Cool Title</h2>
    					<div class="more">
    						<a href="post.html">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>
    			<div class="card card-pin">
    				<img class="card-img" src="https://images.unsplash.com/photo-1416879595882-3373a0480b5b?ixlib=rb-0.3.5&s=c0043ea5aa03f62a294636f93725dd6e&auto=format&fit=crop&w=500&q=60" alt="Card image">
    				<div class="overlay">
    					<h2 class="card-title title">Cool Title</h2>
    					<div class="more">
    						<a href="post.html">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>
    			<div class="card card-pin">
    				<img class="card-img" src="https://images.unsplash.com/photo-1485627658391-1365e4e0dbfe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=976b0db5c3c2b9932bb20e72f98f9b61&auto=format&fit=crop&w=500&q=60" alt="Card image">
    				<div class="overlay">
    					<h2 class="card-title title">Cool Title</h2>
    					<div class="more">
    						<a href="post.html">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>
    			<div class="card card-pin">
    				<img class="card-img" src="https://images.unsplash.com/photo-1502550900787-e956c314a221?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=e90f191de3a03c2002ac82c009490e07&auto=format&fit=crop&w=500&q=60" alt="Card image">
    				<div class="overlay">
    					<h2 class="card-title title">Cool Title</h2>
    					<div class="more">
    						<a href="post.html">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>
    			<div class="card card-pin">
    				<img class="card-img" src="https://images.unsplash.com/photo-1466692476868-aef1dfb1e735?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=9e3cd6ce6496c9c05cbf1b6cda8be0f9&auto=format&fit=crop&w=500&q=60" alt="Card image">
    				<div class="overlay">
    					<h2 class="card-title title">Cool Title</h2>
    					<div class="more">
    						<a href="post.html">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>
    			<div class="card card-pin">
    				<img class="card-img" src="https://images.unsplash.com/photo-1509885903707-b68568db61ed?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=5f11503655b51165836c2dcefa51a040&auto=format&fit=crop&w=500&q=60" alt="Card image">
    				<div class="overlay">
    					<h2 class="card-title title">Cool Title</h2>
    					<div class="more">
    						<a href="post.html">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>
    			<div class="card card-pin">
    				<img class="card-img" src="https://images.unsplash.com/photo-1518707399486-6d702a84ff00?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=b5bb16fa7eaed1a1ed47614488f7588d&auto=format&fit=crop&w=500&q=60" alt="Card image">
    				<div class="overlay">
    					<h2 class="card-title title">Cool Title</h2>
    					<div class="more">
    						<a href="post.html">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>
    			<div class="card card-pin">
    				<img class="card-img" src="https://images.unsplash.com/photo-1519408299519-b7a0274f7d67?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=d4891b98f4554cc55eab1e4a923cbdb1&auto=format&fit=crop&w=500&q=60" alt="Card image">
    				<div class="overlay">
    					<h2 class="card-title title">Cool Title</h2>
    					<div class="more">
    						<a href="post.html">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>
    			<div class="card card-pin">
    				<img class="card-img" src="https://images.unsplash.com/photo-1506706435692-290e0c5b4505?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=0bb464bb1ceea5155bc079c4f50bc36a&auto=format&fit=crop&w=500&q=60" alt="Card image">
    				<div class="overlay">
    					<h2 class="card-title title">Cool Title</h2>
    					<div class="more">
    						<a href="post.html">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>
    			<div class="card card-pin">
    				<img class="card-img" src="https://images.unsplash.com/photo-1512355144108-e94a235b10af?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c622d56d975113a08c71c912618b5f83&auto=format&fit=crop&w=500&q=60" alt="Card image">
    				<div class="overlay">
    					<h2 class="card-title title">Cool Title</h2>
    					<div class="more">
    						<a href="post.html">
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i> More </a>
    					</div>
    				</div>
    			</div>

-->


    		</div>
    	</div>
    </div>
    </section>
