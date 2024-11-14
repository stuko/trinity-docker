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
  BusinessCollection bc = RequestHelper.getBusinessCollection(request,"voc");
  String cnt = "0";
  try{
     cnt = bc.getBusinessData(0).getFieldValue("CNT");
  }catch(Exception e){
  }

  BusinessCollection bc2 = RequestHelper.getBusinessCollection(request,"socialProjectList");
  String down_path = InitClass.getInstance().getPath("UploadFolder");
%>

<!-- Header -->
  <header class="masthead">
    <div class="container">
      <div class="intro-text" style="padding-bottom: 0">
        <div class="intro-lead-in" >놀라운 소프트웨어 로봇 개발/운영 서비스를 경험해 보세요</div>
        <div class="">동네 커피숍부터 대형 마트까지... 누구나 사용할 수 있는 그날까지</div>
        <div class="intro-heading text-uppercase">DUNA<sup style="font-size:15px;color:yellow;">free</sup> </div>
      </div>
    </div>

<div style="margin-top:4px;">
<%
if(bc2 != null && bc2.size() > 0){
  for(int i=0 ; i < bc2.size() ; i++){ 
    BusinessData bd = bc2.getBusinessData(i);
    if(bd.getFieldValue("PS_IMAGE").endsWith(".jpg")
       || bd.getFieldValue("PS_IMAGE").endsWith(".gif")
       || bd.getFieldValue("PS_IMAGE").endsWith(".png")){
    }else{
%>
     <span><video src="<%=down_path%><%=bd.getFieldValue("PS_IMAGE")%>" autoplay muted type="video/mp4" loop="loop" width="250px"  height="500px"></video></span>
<% 
    }
%>
<%
  }
}
%>

<!-- 
<br>
<%
if(bc2 != null && bc2.size() > 0){
  for(int i=0 ; i < bc2.size() ; i++){ 
    BusinessData bd = bc2.getBusinessData(i);
    if(bd.getFieldValue("PS_IMAGE").endsWith(".jpg")
       || bd.getFieldValue("PS_IMAGE").endsWith(".gif")
       || bd.getFieldValue("PS_IMAGE").endsWith(".png")){
%>
      <span><img src="<%=down_path%><%=bd.getFieldValue("PS_IMAGE")%>" width="250px"  height="500px"></img></span>
<%
    }else{

    }
%>
<%
  }
}
%>
<br>
<br>
--> 



<div>
  <a class="btn btn-info btn-xl text-uppercase js-scroll-trigger" href="javascript:fnGuide()"><i class='fas fa-edit' style='font-size:24px;margin-right:4px;'></i>소프트웨어 로봇 'DUNA' 사용법</a> 
        &nbsp;<a class="btn btn-secondary btn-xl text-uppercase js-scroll-trigger" href="http://lecture.bestmember.net/" target="_new"><i class='fas fa-play' style='font-size:24px;margin-right:4px;'></i>소프트웨어 로봇 'DUNA' 동영상</a> 
        &nbsp;<a class="btn btn-warning btn-xl text-uppercase js-scroll-trigger" href="https://telegram.me/socialproject_bot?game=socialproject" target="_new"><i class='far fa-comment' style='font-size:24px;margin-right:4px;'></i>PLAY 두나(DUNA)</a> 
        <div style="margin-top:40px;margin-bottom:100px;"><br> </div>
<!--        <div style="margin-top:40px;margin-bottom:100px;"><a href="https://telegram.me/socialproject_bot?game=socialproject" target="_new"><i class="fab fa-telegram-plane" style="margin-right:5px;"></i>텔레그램 프로젝트 관리 소프트웨어 로봇 체험하기</a></div> -->
</div>
</div><br>


  </header>


<!-- Modal -->
<div class="modal fade" id="noticeModal" tabindex="-1" role="dialog" aria-labelledby="noticeModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="noticeModalLabel">DUNA를 텔레그램과 연동하는 법</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <ul>
          <li> 텔레그램(Telegram)에서 소프트웨어 로봇을 생성합니다. (<a href="https://core.telegram.org/bots" target="_new">텔레그램(Telegram)</a> 앱 기능 참고)</li>
          <li> DUNA 소프트웨어 로봇을 생성합니다.(사이트 가입 후, 생성 버튼을 누르면 됩니다.)</li>
          <li> "외부 메신저 연결" 메뉴를 클릭합니다.</li>
          <li> Telegram을 선택하시고, 봇 이름과 토큰을 입력하고 저장합니다.</li>
          <li> 약 10분, 최대 1시간 이내에 해당 소프트웨어 로봇이 연동 됩니다.</li>
          <li> 정말 쉽고 간단하니, 꼭 사용해 보세요~~</li>
        </ul>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <!--<button type="button" class="btn btn-primary">Save changes</button>-->
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="linkDUNA" tabindex="-1" role="dialog" aria-labelledby="noticeModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="background:#F8F9F9">
      <div class="modal-header">
        <h5 class="modal-title" id="linkDUNALabel">소셜프로젝트 경험해 보기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <ul>
          <li> 소셜프로젝트 AI PM : 두나(DUNA) </li>
          <li> 인공지능 프로젝트 관리 로봇입니다. </li>
          <li> <a href="https://telegram.me/socialproject_bot" target="_new">바로가기</a></li>
        </ul>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <!--<button type="button" class="btn btn-primary">Save changes</button>-->
      </div>
    </div>
  </div>
</div>


<!-- Services -->
  <section class="page-section" id="services">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 text-center">
          <img src="/jsp/sp/img/duna_id.png"  style="border-radius: 50%">
          <h2 class="section-heading text-uppercase">DUNA</h2>
          <h3 class="section-subheading text-muted">소프트웨어 로봇 개발/운영 서비스</h3>
        </div>
        <div class="col-lg-6 text-center">
          <a href="http://www.socialproject.net" target="_new">
          <img src="/jsp/chatvatar/img/chatvatar.jpeg"  style="width:400px;border-radius: 50%">
          <h2 class="section-heading text-uppercase">Chatvatar</h2>
          </a>
          <h3 class="section-subheading text-muted">노하우가 소프트웨어 로봇을 만나다</h3>
        </div>

      </div>
      <div class="row text-center">
        <div class="col-md-4">
          <span class="fa-stack fa-4x">
            <i class="fas fa-circle fa-stack-2x text-primary"></i>
            <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
          </span>
          <h4 class="service-heading">전자상거래용 소프트웨어 로봇</h4>
          <p class="text-muted">전자 상거래에서 고객이 필요한 상품을 추천해주고 질문에 답변을 해주는 유용한 <b style="color:red">상담 소프트웨어 로봇</b>을 만들어 보세요.</p>
        </div>
        <div class="col-md-4">
          <span class="fa-stack fa-4x">
            <i class="fas fa-circle fa-stack-2x text-primary"></i>
            <i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
          </span>
          <h4 class="service-heading">교육용 소프트웨어 로봇</h4>
          <p class="text-muted">
소프트웨어 로봇을 통해서 학생들과 소통하고 학생들에게 필요한 교육 과정을 맞춤형으로 제공할 수 있는 <b style="color:red">코칭 소프트웨어 로봇</b>을 만들어 보세요.</p>
        </div>
        <div class="col-md-4">
          <span class="fa-stack fa-4x">
            <i class="fas fa-circle fa-stack-2x text-primary"></i>
            <i class="fas fa-lock fa-stack-1x fa-inverse"></i>
          </span>
          <h4 class="service-heading">보안용 소프트웨어 로봇</h4>
          <p class="text-muted">보안을 유지하기 위해서는 많은 자본과 자원이 필요합니다 이러한 막대한 비용을 줄일 수 있는 <b style="color:red">소프트웨어 로봇 요원</b>을 활용해 보세요</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Portfolio Grid -->
  <section class="bg-light page-section" id="portfolio">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">DUNA 주요 활용 분야</h2>
          <h3 class="section-subheading text-muted">현재 DUNA는 많은 곳에 사용될수 있도록 계속 개발진행중에  있습니다.</h3>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link"> <!--  data-toggle="modal" href="#portfolioModal1" -->
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="/bt/agency/img/portfolio/rule.jpg" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>룰엔진</h4>
            <p class="text-muted">의사결정 로직을 룰엔진에 적용하여 소프트웨어 로봇이 판단하는데 필요한 주요기능을 담당 합니다.</p>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link"> <!--  data-toggle="modal" href="#portfolioModal2"-->
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="/bt/agency/img/portfolio/realtime.jpg" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>실시간 분석엔진</h4>
            <p class="text-muted">고성능의 실시간 분석 엔진을 통해 규직기반 프로세싱을 가능하게 합니다</p>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link"> <!--  data-toggle="modal" href="#portfolioModal3" -->
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="/bt/agency/img/portfolio/profile.jpg" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>프로파일링</h4>
            <p class="text-muted">실시간 분석 프로파일링을 통해서 더 풍부한 규직을 만들어 낼 수 있습니다</p>
          </div>
        </div>
       
      </div>
    </div>
  </section>

  <section class="page-section" id="price">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">

         <div>
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
<br>
          <div class="portfolio-caption">
            <h4>무설치형 서비스</h4>
            <p class="text-muted">본 사이트에 가입 후, 무료로 사용하시면 됩니다(단, 서비스 용량의 한계문제는 이해바랍니다.)</p>
          </div>
          <div class="portfolio-caption">
            <h4>내부 설치형 서비스</h4>
            <p class="text-muted">아래 메일로 문의해 주세요</p>
          </div>
          <div class="portfolio-caption">
            <h4>제휴/연결형 서비스</h4>
            <p class="text-muted">아래 메일로 문의해 주세요</p>
          </div>
          <div class="portfolio-caption">
            <h5>* 자세한 문의는 아래 "물어보기"에 등록하시거나, stuko@nate.com 으로 요청해 주시기 바랍니다.</h5>
          </div>
        </div>
      </div>
     </div>
    </div>
  </section>


  <!-- About -->
  <section class="page-section" id="about">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">우리(베스트멤버)는?</h2>
          <h3 class="section-subheading text-muted">저희(베스트멤버)들은 세상을 좀 더 여유롭고 행복하게 변화시키기 위해 노력하고 있습니다</h3>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <ul class="timeline">
            <li>
              <div class="timeline-image">
                <img class="rounded-circle img-fluid" src="/bt/agency/img/about/1.jpg" alt="">
              </div>
              <div class="timeline-panel">
                <div class="timeline-heading">
                  <h4>2018 ~ </h4>
                  <h4 class="subheading">DUNA(free) 오픈, TRINITY 3.1 오픈 및 새로운 서비스/아이디어 준비중</h4>
                </div>
                <div class="timeline-body">
                  <p class="text-muted">긴시간의 소프트웨어 로봇 개발 운영 시스템의 준비과정을 거쳐 보다 많은 사람들이 소프트웨어 로봇을 쉽게 사용할 수 있도록 무료 서비스(서버가 버틸수 있는데 까지)를 오픈하였으며 현재도 계속 새로운 아이디어를 통해 신규 서비스를 준비중에 있습니다.</p>
                  <p class="text-muted">저희 베스트멤버는 TRINITY 라는 웹 브라우저기반의 "개발과 유지보수" 솔루션을 개발하여, 원격/재택 환경으로 쉽고 편하게 솔루션과 서비스를 개발하고 있습니다..</p>
                </div>
              </div>
            </li>
            <li class="timeline-inverted">
              <div class="timeline-image">
                <img class="rounded-circle img-fluid" src="/bt/agency/img/about/4.jpg" alt="">
              </div>
              <div class="timeline-panel">
                <div class="timeline-heading">
                  <h4>2017-2018</h4>
                  <h4 class="subheading">소프트웨어 로봇 시스템 개발</h4>
                </div>
                <div class="timeline-body">
                  <p class="text-muted">저희는 다양한 분야에 쉽게 적용될 수 있는 유용한 소프트웨어 로봇 개발 운영 시스템을 개발해 왔습니다.</p>
                </div>
              </div>
            </li>
            <li>
              <div class="timeline-image">
                <img class="rounded-circle img-fluid" src="/bt/agency/img/about/3.jpg" alt="">
              </div>
              <div class="timeline-panel">
                <div class="timeline-heading">
                  <h4>2012-2016</h4>
                  <h4 class="subheading">실시간 분석 엔진</h4>
                </div>
                <div class="timeline-body">
                  <p class="text-muted">WAYD(What Are You Doing?)라고 불리는 작은 프로젝트를 통해 실시간 분석 엔진을 개발해 왔으며 현재는 DUNA 소프트웨어 로봇 시스템으로 성장하여 다양한 분야에 활용이 가능한 유용한 엔진으로 자리 잡고 있습니다</p>
                </div>
              </div>
            </li>
          
            <li class="timeline-inverted">
              <div class="timeline-image">
                <h4>베스트멤버<br>새로운 시작<br>새로운 세상</h4>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </section>

  <!-- Team -->
  <section class="bg-light page-section" id="team">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">베스트 멤버</h2>
          <h3 class="section-subheading text-muted">DUNA를 만들기 위해 모인 사람들입니다. 현재는 이익보다는 좋은 환경을 위해 애쓰는 사람들입니다
          </h3>
        </div>
      </div>

      <div class="row">
        <div class="col-sm-4">
          <div class="team-member">
            <h4>ISJUNG</h4>
            <p class="text-muted">Software engineer</p>
            <ul class="list-inline social-buttons">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-facebook-f"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-linkedin-in"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-4">
          <div class="team-member">
            <h4>STUKO</h4>
            <p class="text-muted">Project Manager / Architect</p>
            <ul class="list-inline social-buttons">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-facebook-f"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-linkedin-in"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-4">
          <div class="team-member">
            <h4>BKI</h4>
            <p class="text-muted">Just supporter</p>
            <ul class="list-inline social-buttons">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-facebook-f"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-linkedin-in"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-lg-8 mx-auto text-center">
          <p class="large text-muted">저희들은 효율적인 작업 환경을 위해 모두 원격의 개발환경과 의사소통환경을 바탕으로 이러한 놀라운 과업을 이뤄 왔습니다.
            <br>
            <b>
            베스트 멤버는 실제 형식적으로 구성된 팀이 아니라 <br>
            가상의(SNS상의 관계)팀으로 모인 소수가 기업이 해야 하지만 <br>이익추구의 명분으로 소외되고 있는 분야를 찾아<br>
            그 환경을 개선하기 위해 노력하는 비공식적인 IT 가상 조직입니다.
            </b>
          </p>
        </div>
      </div>
    </div>
  </section>

 
  <!-- Contact -->
  <section class="page-section" id="contact">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">궁금하면 물어보기(현재 접수건수 : <%=cnt%>건)</h2>
          <h3 class="section-subheading text-muted">저희 서비스에 대해서 궁금한게 있으시면 아래 문의 방법을 통해 전달해 주세요</h3>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <form id="contactForm" name="sentMessage" novalidate="novalidate">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <input class="form-control" id="name" type="text" placeholder="Your Name " required="required" data-validation-required-message="Please enter your name.">
                  <p class="help-block text-danger"></p>
                </div>
                <div class="form-group">
                  <input class="form-control" id="email" type="email" placeholder="Your Email *" required="required" data-validation-required-message="Please enter your email address.">
                  <p class="help-block text-danger"></p>
                </div>
                <div class="form-group">
                  <input class="form-control" id="phone" type="tel" placeholder="Your Phone " required="required" data-validation-required-message="Please enter your phone number.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <textarea class="form-control" id="message" placeholder="Your Message *" required="required" data-validation-required-message="Please enter a message."></textarea>
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="clearfix"></div>
              <div class="col-lg-12 text-center">
                <div id="success"></div>
                <button id="sendMessageButton" class="btn btn-warning btn-xl text-uppercase" type="button" onClick="javascript:voc();">문의하기</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>

<script language="javascript">
   function voc(){
      if( $('#name').val() == '' ||  $('#email').val() == '' ||  $('#phone').val() == '' ||  $('#message').val() == ''){
         showPopup('fail','Sorry. Please confirm your input.',null);
         return;
      }
      var d = {"name" : $('#name').val(), "email" : $('#email').val(), "phone" : $('#phone').val(), "message" : $('#message').val() };
      post(d,'CMD_SEQ_106401071121560726394050',()=>{
         showPopup('success','Thank you. We will try to reflect your request.',null);
      },()=>{
         showPopup('fail','Sorry. Your call was not accepted. It may be an internal error, so please accept it again in the future.',null);
      });
   }
/*
   $('#noticeModal').modal({
     keyboard: false
   });
   $('#linkDUNA').modal({
     keyboard: false
   })
*/
   
</script><%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
  BusinessCollection bc = RequestHelper.getBusinessCollection(request,"voc");
  String cnt = "0";
  try{
     cnt = bc.getBusinessData(0).getFieldValue("CNT");
  }catch(Exception e){
  }

  BusinessCollection bc2 = RequestHelper.getBusinessCollection(request,"socialProjectList");
  String down_path = InitClass.getInstance().getPath("UploadFolder");
%>

<!-- Header -->
  <header class="masthead">
    <div class="container">
      <div class="intro-text" style="padding-bottom: 0">
        <div class="intro-lead-in" >놀라운 소프트웨어 로봇 개발/운영 서비스를 경험해 보세요</div>
        <div class="">동네 커피숍부터 대형 마트까지... 누구나 사용할 수 있는 그날까지</div>
        <div class="intro-heading text-uppercase">DUNA<sup style="font-size:15px;color:yellow;">free</sup> </div>
      </div>
    </div>

<div style="margin-top:4px;">
<%
if(bc2 != null && bc2.size() > 0){
  for(int i=0 ; i < bc2.size() ; i++){ 
    BusinessData bd = bc2.getBusinessData(i);
    if(bd.getFieldValue("PS_IMAGE").endsWith(".jpg")
       || bd.getFieldValue("PS_IMAGE").endsWith(".gif")
       || bd.getFieldValue("PS_IMAGE").endsWith(".png")){
    }else{
%>
     <span><video src="<%=down_path%><%=bd.getFieldValue("PS_IMAGE")%>" autoplay muted type="video/mp4" loop="loop" width="250px"  height="500px"></video></span>
<% 
    }
%>
<%
  }
}
%>

<!-- 
<br>
<%
if(bc2 != null && bc2.size() > 0){
  for(int i=0 ; i < bc2.size() ; i++){ 
    BusinessData bd = bc2.getBusinessData(i);
    if(bd.getFieldValue("PS_IMAGE").endsWith(".jpg")
       || bd.getFieldValue("PS_IMAGE").endsWith(".gif")
       || bd.getFieldValue("PS_IMAGE").endsWith(".png")){
%>
      <span><img src="<%=down_path%><%=bd.getFieldValue("PS_IMAGE")%>" width="250px"  height="500px"></img></span>
<%
    }else{

    }
%>
<%
  }
}
%>
<br>
<br>
--> 



<div>
  <a class="btn btn-info btn-xl text-uppercase js-scroll-trigger" href="javascript:fnGuide()"><i class='fas fa-edit' style='font-size:24px;margin-right:4px;'></i>소프트웨어 로봇 'DUNA' 사용법</a> 
        &nbsp;<a class="btn btn-secondary btn-xl text-uppercase js-scroll-trigger" href="http://lecture.bestmember.net/" target="_new"><i class='fas fa-play' style='font-size:24px;margin-right:4px;'></i>소프트웨어 로봇 'DUNA' 동영상</a> 
        &nbsp;<a class="btn btn-warning btn-xl text-uppercase js-scroll-trigger" href="https://telegram.me/socialproject_bot?game=socialproject" target="_new"><i class='far fa-comment' style='font-size:24px;margin-right:4px;'></i>PLAY 두나(DUNA)</a> 
        <div style="margin-top:40px;margin-bottom:100px;"><br> </div>
<!--        <div style="margin-top:40px;margin-bottom:100px;"><a href="https://telegram.me/socialproject_bot?game=socialproject" target="_new"><i class="fab fa-telegram-plane" style="margin-right:5px;"></i>텔레그램 프로젝트 관리 소프트웨어 로봇 체험하기</a></div> -->
</div>
</div><br>


  </header>


<!-- Modal -->
<div class="modal fade" id="noticeModal" tabindex="-1" role="dialog" aria-labelledby="noticeModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="noticeModalLabel">DUNA를 텔레그램과 연동하는 법</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <ul>
          <li> 텔레그램(Telegram)에서 소프트웨어 로봇을 생성합니다. (<a href="https://core.telegram.org/bots" target="_new">텔레그램(Telegram)</a> 앱 기능 참고)</li>
          <li> DUNA 소프트웨어 로봇을 생성합니다.(사이트 가입 후, 생성 버튼을 누르면 됩니다.)</li>
          <li> "외부 메신저 연결" 메뉴를 클릭합니다.</li>
          <li> Telegram을 선택하시고, 봇 이름과 토큰을 입력하고 저장합니다.</li>
          <li> 약 10분, 최대 1시간 이내에 해당 소프트웨어 로봇이 연동 됩니다.</li>
          <li> 정말 쉽고 간단하니, 꼭 사용해 보세요~~</li>
        </ul>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <!--<button type="button" class="btn btn-primary">Save changes</button>-->
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="linkDUNA" tabindex="-1" role="dialog" aria-labelledby="noticeModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="background:#F8F9F9">
      <div class="modal-header">
        <h5 class="modal-title" id="linkDUNALabel">소셜프로젝트 경험해 보기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <ul>
          <li> 소셜프로젝트 AI PM : 두나(DUNA) </li>
          <li> 인공지능 프로젝트 관리 로봇입니다. </li>
          <li> <a href="https://telegram.me/socialproject_bot" target="_new">바로가기</a></li>
        </ul>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <!--<button type="button" class="btn btn-primary">Save changes</button>-->
      </div>
    </div>
  </div>
</div>


<!-- Services -->
  <section class="page-section" id="services">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 text-center">
          <img src="/jsp/sp/img/duna_id.png"  style="border-radius: 50%">
          <h2 class="section-heading text-uppercase">DUNA</h2>
          <h3 class="section-subheading text-muted">소프트웨어 로봇 개발/운영 서비스</h3>
        </div>
        <div class="col-lg-6 text-center">
          <a href="http://www.socialproject.net" target="_new">
          <img src="/jsp/chatvatar/img/chatvatar.jpeg"  style="width:400px;border-radius: 50%">
          <h2 class="section-heading text-uppercase">Chatvatar</h2>
          </a>
          <h3 class="section-subheading text-muted">노하우가 소프트웨어 로봇을 만나다</h3>
        </div>

      </div>
      <div class="row text-center">
        <div class="col-md-4">
          <span class="fa-stack fa-4x">
            <i class="fas fa-circle fa-stack-2x text-primary"></i>
            <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
          </span>
          <h4 class="service-heading">전자상거래용 소프트웨어 로봇</h4>
          <p class="text-muted">전자 상거래에서 고객이 필요한 상품을 추천해주고 질문에 답변을 해주는 유용한 <b style="color:red">상담 소프트웨어 로봇</b>을 만들어 보세요.</p>
        </div>
        <div class="col-md-4">
          <span class="fa-stack fa-4x">
            <i class="fas fa-circle fa-stack-2x text-primary"></i>
            <i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
          </span>
          <h4 class="service-heading">교육용 소프트웨어 로봇</h4>
          <p class="text-muted">
소프트웨어 로봇을 통해서 학생들과 소통하고 학생들에게 필요한 교육 과정을 맞춤형으로 제공할 수 있는 <b style="color:red">코칭 소프트웨어 로봇</b>을 만들어 보세요.</p>
        </div>
        <div class="col-md-4">
          <span class="fa-stack fa-4x">
            <i class="fas fa-circle fa-stack-2x text-primary"></i>
            <i class="fas fa-lock fa-stack-1x fa-inverse"></i>
          </span>
          <h4 class="service-heading">보안용 소프트웨어 로봇</h4>
          <p class="text-muted">보안을 유지하기 위해서는 많은 자본과 자원이 필요합니다 이러한 막대한 비용을 줄일 수 있는 <b style="color:red">소프트웨어 로봇 요원</b>을 활용해 보세요</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Portfolio Grid -->
  <section class="bg-light page-section" id="portfolio">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">DUNA 주요 활용 분야</h2>
          <h3 class="section-subheading text-muted">현재 DUNA는 많은 곳에 사용될수 있도록 계속 개발진행중에  있습니다.</h3>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link"> <!--  data-toggle="modal" href="#portfolioModal1" -->
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="/bt/agency/img/portfolio/rule.jpg" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>룰엔진</h4>
            <p class="text-muted">의사결정 로직을 룰엔진에 적용하여 소프트웨어 로봇이 판단하는데 필요한 주요기능을 담당 합니다.</p>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link"> <!--  data-toggle="modal" href="#portfolioModal2"-->
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="/bt/agency/img/portfolio/realtime.jpg" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>실시간 분석엔진</h4>
            <p class="text-muted">고성능의 실시간 분석 엔진을 통해 규직기반 프로세싱을 가능하게 합니다</p>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link"> <!--  data-toggle="modal" href="#portfolioModal3" -->
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="/bt/agency/img/portfolio/profile.jpg" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>프로파일링</h4>
            <p class="text-muted">실시간 분석 프로파일링을 통해서 더 풍부한 규직을 만들어 낼 수 있습니다</p>
          </div>
        </div>
       
      </div>
    </div>
  </section>

  <section class="page-section" id="price">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">

         <div>
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
<br>
          <div class="portfolio-caption">
            <h4>무설치형 서비스</h4>
            <p class="text-muted">본 사이트에 가입 후, 무료로 사용하시면 됩니다(단, 서비스 용량의 한계문제는 이해바랍니다.)</p>
          </div>
          <div class="portfolio-caption">
            <h4>내부 설치형 서비스</h4>
            <p class="text-muted">아래 메일로 문의해 주세요</p>
          </div>
          <div class="portfolio-caption">
            <h4>제휴/연결형 서비스</h4>
            <p class="text-muted">아래 메일로 문의해 주세요</p>
          </div>
          <div class="portfolio-caption">
            <h5>* 자세한 문의는 아래 "물어보기"에 등록하시거나, stuko@nate.com 으로 요청해 주시기 바랍니다.</h5>
          </div>
        </div>
      </div>
     </div>
    </div>
  </section>


  <!-- About -->
  <section class="page-section" id="about">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">우리(베스트멤버)는?</h2>
          <h3 class="section-subheading text-muted">저희(베스트멤버)들은 세상을 좀 더 여유롭고 행복하게 변화시키기 위해 노력하고 있습니다</h3>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <ul class="timeline">
            <li>
              <div class="timeline-image">
                <img class="rounded-circle img-fluid" src="/bt/agency/img/about/1.jpg" alt="">
              </div>
              <div class="timeline-panel">
                <div class="timeline-heading">
                  <h4>2018 ~ </h4>
                  <h4 class="subheading">DUNA(free) 오픈, TRINITY 3.1 오픈 및 새로운 서비스/아이디어 준비중</h4>
                </div>
                <div class="timeline-body">
                  <p class="text-muted">긴시간의 소프트웨어 로봇 개발 운영 시스템의 준비과정을 거쳐 보다 많은 사람들이 소프트웨어 로봇을 쉽게 사용할 수 있도록 무료 서비스(서버가 버틸수 있는데 까지)를 오픈하였으며 현재도 계속 새로운 아이디어를 통해 신규 서비스를 준비중에 있습니다.</p>
                  <p class="text-muted">저희 베스트멤버는 TRINITY 라는 웹 브라우저기반의 "개발과 유지보수" 솔루션을 개발하여, 원격/재택 환경으로 쉽고 편하게 솔루션과 서비스를 개발하고 있습니다..</p>
                </div>
              </div>
            </li>
            <li class="timeline-inverted">
              <div class="timeline-image">
                <img class="rounded-circle img-fluid" src="/bt/agency/img/about/4.jpg" alt="">
              </div>
              <div class="timeline-panel">
                <div class="timeline-heading">
                  <h4>2017-2018</h4>
                  <h4 class="subheading">소프트웨어 로봇 시스템 개발</h4>
                </div>
                <div class="timeline-body">
                  <p class="text-muted">저희는 다양한 분야에 쉽게 적용될 수 있는 유용한 소프트웨어 로봇 개발 운영 시스템을 개발해 왔습니다.</p>
                </div>
              </div>
            </li>
            <li>
              <div class="timeline-image">
                <img class="rounded-circle img-fluid" src="/bt/agency/img/about/3.jpg" alt="">
              </div>
              <div class="timeline-panel">
                <div class="timeline-heading">
                  <h4>2012-2016</h4>
                  <h4 class="subheading">실시간 분석 엔진</h4>
                </div>
                <div class="timeline-body">
                  <p class="text-muted">WAYD(What Are You Doing?)라고 불리는 작은 프로젝트를 통해 실시간 분석 엔진을 개발해 왔으며 현재는 DUNA 소프트웨어 로봇 시스템으로 성장하여 다양한 분야에 활용이 가능한 유용한 엔진으로 자리 잡고 있습니다</p>
                </div>
              </div>
            </li>
          
            <li class="timeline-inverted">
              <div class="timeline-image">
                <h4>베스트멤버<br>새로운 시작<br>새로운 세상</h4>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </section>

  <!-- Team -->
  <section class="bg-light page-section" id="team">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">베스트 멤버</h2>
          <h3 class="section-subheading text-muted">DUNA를 만들기 위해 모인 사람들입니다. 현재는 이익보다는 좋은 환경을 위해 애쓰는 사람들입니다
          </h3>
        </div>
      </div>

      <div class="row">
        <div class="col-sm-4">
          <div class="team-member">
            <h4>ISJUNG</h4>
            <p class="text-muted">Software engineer</p>
            <ul class="list-inline social-buttons">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-facebook-f"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-linkedin-in"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-4">
          <div class="team-member">
            <h4>STUKO</h4>
            <p class="text-muted">Project Manager / Architect</p>
            <ul class="list-inline social-buttons">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-facebook-f"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-linkedin-in"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-sm-4">
          <div class="team-member">
            <h4>BKI</h4>
            <p class="text-muted">Just supporter</p>
            <ul class="list-inline social-buttons">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-facebook-f"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-linkedin-in"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-lg-8 mx-auto text-center">
          <p class="large text-muted">저희들은 효율적인 작업 환경을 위해 모두 원격의 개발환경과 의사소통환경을 바탕으로 이러한 놀라운 과업을 이뤄 왔습니다.
            <br>
            <b>
            베스트 멤버는 실제 형식적으로 구성된 팀이 아니라 <br>
            가상의(SNS상의 관계)팀으로 모인 소수가 기업이 해야 하지만 <br>이익추구의 명분으로 소외되고 있는 분야를 찾아<br>
            그 환경을 개선하기 위해 노력하는 비공식적인 IT 가상 조직입니다.
            </b>
          </p>
        </div>
      </div>
    </div>
  </section>

 
  <!-- Contact -->
  <section class="page-section" id="contact">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">궁금하면 물어보기(현재 접수건수 : <%=cnt%>건)</h2>
          <h3 class="section-subheading text-muted">저희 서비스에 대해서 궁금한게 있으시면 아래 문의 방법을 통해 전달해 주세요</h3>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <form id="contactForm" name="sentMessage" novalidate="novalidate">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <input class="form-control" id="name" type="text" placeholder="Your Name " required="required" data-validation-required-message="Please enter your name.">
                  <p class="help-block text-danger"></p>
                </div>
                <div class="form-group">
                  <input class="form-control" id="email" type="email" placeholder="Your Email *" required="required" data-validation-required-message="Please enter your email address.">
                  <p class="help-block text-danger"></p>
                </div>
                <div class="form-group">
                  <input class="form-control" id="phone" type="tel" placeholder="Your Phone " required="required" data-validation-required-message="Please enter your phone number.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <textarea class="form-control" id="message" placeholder="Your Message *" required="required" data-validation-required-message="Please enter a message."></textarea>
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="clearfix"></div>
              <div class="col-lg-12 text-center">
                <div id="success"></div>
                <button id="sendMessageButton" class="btn btn-warning btn-xl text-uppercase" type="button" onClick="javascript:voc();">문의하기</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>

<script language="javascript">
   function voc(){
      if( $('#name').val() == '' ||  $('#email').val() == '' ||  $('#phone').val() == '' ||  $('#message').val() == ''){
         showPopup('fail','Sorry. Please confirm your input.',null);
         return;
      }
      var d = {"name" : $('#name').val(), "email" : $('#email').val(), "phone" : $('#phone').val(), "message" : $('#message').val() };
      post(d,'CMD_SEQ_106401071121560726394050',()=>{
         showPopup('success','Thank you. We will try to reflect your request.',null);
      },()=>{
         showPopup('fail','Sorry. Your call was not accepted. It may be an internal error, so please accept it again in the future.',null);
      });
   }
/*
   $('#noticeModal').modal({
     keyboard: false
   });
   $('#linkDUNA').modal({
     keyboard: false
   })
*/
   
</script>
