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
.highlight {
    padding: 9px 14px;
    margin-bottom: 14px;
    background-color: #f7f7f9;
    border: 1px solid #e1e1e8;
    border-radius: 4px;
}
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
#image_div
{
 position:relative;
}
#image_div #image_label
{
 margin:0px;
 position:absolute;
 bottom:180px;
 left:80px;
}
#image_div #image_label span
{
 background-color: #0B4C5F;
 opacity:0.8;
 font-size:25px;
 font-family:카페24 동동;
 padding:7px;
 box-sizing:border-box;
 color:white;
 font-weight:bold;
}

/* 접근성에 문제 없음 */ 
.blind 
{ 
position: absolute; 
width: 1px; 
height: 1px; 
clip: rect(0 0 0 0); 
overflow: hidden; 
}


</style>

<%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getPublicScenarioAll");
BusinessCollection bc2 = RequestHelper.getBusinessCollection(request,"getPublicScenarioDetail");
BusinessCollection bc3 = RequestHelper.getBusinessCollection(request,"getChatBotName");

String member_level = "";
if(session.getAttribute(InitClass.getSESSION_DOMAIN()) != null){
  Object object = session.getAttribute(InitClass.getSESSION_DOMAIN());
  IAuth auth = (IAuth)object;
  member_level = auth.getAuthItem("CV_LEVEL");
}

String chatbot_name = "";
if(bc3.size() > 0) {
   chatbot_name = bc3.getBusinessData(0).getFieldValue("ChatBot");
}

%>
  <section class="bg-gray200 pt-5 pb-5">
   
   <div class="container">

<% if(bc2 != null && bc2.size() > 0) { %>
  <% String detail_image_path = bc2.getBusinessData(0).getFieldValue("PS_IMAGE"); %>
  <% String uploadFolder = InitClass.getInstance().getData(InitClass.UploadFolder); %>
  <% 
     if(!detail_image_path.trim().startsWith("http")){
       File root = new File(pageContext.getServletContext().getRealPath("/"), uploadFolder);
       File imgFile = new File( root , detail_image_path); 
       if(!imgFile.exists()) detail_image_path = "/jsp/sp/img/duna_chat_bg.png"; 
       else detail_image_path = InitClass.getInstance().getStandardPathType(uploadFolder) + InitClass.getInstance().getStandardPathType(detail_image_path);
     }
  %>




   <% 
      // String detail_image_path = InitClass.getInstance().getStandardPathType(InitClass.getInstance().getData(InitClass.UploadFolder)) + InitClass.getInstance().getStandardPathType(bc2.getBusinessData(0).getFieldValue("PS_IMAGE"));
    %>
    	<div class="row justify-content-center">
    		<div class="col-md-7">
    			<article class="card">
                          <% if ( detail_image_path.endsWith(".mp4") ) {%>
                             <video class="card-img-top mb-2" src="<%=detail_image_path%>" autoplay muted type="video/mp4" loop="loop"></video>
                          <%} else {%>
    			     <img class="card-img-top mb-2" src="<%=detail_image_path%>" alt="Card image">
                          <% } %>
    			<div class="card-body">
    				<h1 class="card-title display-4">
    				<%=bc2.getBusinessData(0).getFieldValue("PS_SUBJECT")%> </h1>
    				<ul>
                                <%
                                   String[] descs = bc2.getBusinessData(0).getFieldValue("PS_DESC").split("\n");
                                   if(descs != null) {
                                     for(String desc : descs){
                                %>  
    				  <li><%=desc.trim()%></li>
                                <% } } %>
    				</ul>
                                
                                <b style="color:red">* 아래 내용은 텔레그램 메신저의 챗봇을 연결시킨경우에 사용 가능합니다.</b>  
                                <br><br>
                                <div class="highlight">
                                <b> 대화 시나리오 사용법 </b>
   				<small class="d-block">
                                   <ol>
                                      <li>텔레그램 메신저에서 대화 그룹을 선택합니다.</li>
                                      <li>메뉴에서 찾기 버튼(아이콘)을 클릭합니다.</li>
                                      <li>검색창에 <b style="color:red;font-size:18px;">'<%=chatbot_name%>'</b>을 입력하고, 엔터 혹은 검색버튼을 클릭합니다.</li>
                                      <li><b style="color:red;font-size:18px;">'<%=chatbot_name%>'</b> 봇이 보이면, 클릭해 주세요.</li>
                                      <li>그리고 <b style="color:red;font-size:18px;">'<%=chatbot_name%>'</b> 봇과 즐거운 대화를 나눠보세요.</li>
                                     <!--li><b style="color:red;font-size:18px;">아래 이미지는 샘플 화면입니다.<br> 꼭 위에 적인 이름을 사용하세요</b-->
                                     <div id="image_div" class="section article">
                                   <!--img src="/jsp/chatvatar/img/sample.png" class="blind"-->
                                   <!--<p id="image_label"><span>본 이미지는 샘플입니다.<br> '<b style="color:red;"><%=chatbot_name%></b>'을 <br>사용해 주세요</span></p>-->
                                     </div>
                                     <br>
                                     <div>
                                       <button class="btn btn-primary" id="telegram">텔레그램에 초대하기</button>
                                     </div></li>
                                   <ol>

                                  </small>
                                  </div>



<!--                                
                                <b> 대화내용을 수정해서 이용하실수 있습니다.</b>
    				<small class="d-block">
                                  <a class="btn btn-sm btn-gray200" href="#">
                                    <i class="fa fa-external-link"></i>
                                      대화내용 수정하기
                                  </a>
                                </small>
-->

    			</div>
    			</article>
    		</div>
    	</div>
<% } %>
    </div>

    <div class="container-fluid mt-5">
       <!-- <h5 class="font-weight-bold">More like this</h5> -->
    	<div class="row">
    		<div class="card-columns">
<% if(bc != null && bc.size() > 0 ) { %>
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
    						<i class="fa fa-arrow-circle-o-right" aria-hidden="true" style="color:#FFFFFF;"></i> 자세히보기 </a>
                                                <% if("".equals(div_style)) {%>
                                                  <div style="padding: 10px 10px 10px 10px;"><%=desc.replace("\n","<br>")%></div>
                                                <% } %>
    					</div>
    				</div>
                               </a>
    			</div>
<% } %>
<% } %>



    		</div>
    	</div>
    </div>
    </section>

<script>
$("#telegram").click(function javascript_onclikc(){
   document.location.href='https://telegram.me/<%=chatbot_name.replace("@","")%>';
});

</script>
