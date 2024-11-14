<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <div id="floating-button">
    <p class="plus">+</p>
    <img class="close" src="https://ssl.gstatic.com/bt/C3341AA7A1A076756462EE2E5CD71C11/1x/bt_compose2_1x.png">
  </div>

<div class="floating-chat">
    <i class="fa fa-comments" aria-hidden="true"></i>
    <div class="chat">
        <div class="header">
            <span class="title">
                what's on your mind?
            </span>
            <button>
                <i class="fa fa-times" aria-hidden="true"></i>
            </button>
                         
        </div>
        <ul class="messages">
            <li class="other">asdasdasasdasdasasdasdasasdasdasasdasdasasdasdasasdasdas</li>
            <li class="other">Are we dogs??? 🐶</li>
            <li class="self">no... we're human</li>
            <li class="other">are you sure???</li>
            <li class="self">yes.... -___-</li>
            <li class="other">if we're not dogs.... we might be monkeys 🐵</li>
            <li class="self">i hate you</li>
            <li class="other">don't be so negative! here's a banana 🍌</li>
            <li class="self">......... -___-</li>
        </ul>
        <div class="footer">
            <div class="text-box" contenteditable="true" disabled="true"></div>
            <button id="sendMessage">send</button>
        </div>
    </div>
</div>



		<!-- alert 팝업 -->
		<div id="alert_popup" class="popup s400 alert_popup" style="display:none;" draggable="true">
			<div class="pop_header"><div class="layer_title"></div></div>
			<div class="pop_container">
				<div class="txt_dialog message"></div>
				<p class="foot_btn">
					<a href="#" class="btn_n bg_red modal_alert_confirm">확인</a>
				</p>
			</div>
			<a href="#" class="popup_close modal_alert_close">닫기</a>
		</div>

		<!-- confirm 팝업 -->
		<div id="confirm_popup"  class="popup s400 confirm_popup" style="display:none;" draggable="true">
			<div class="pop_header"><div class="layer_title"></div></div>
			<div class="pop_container">
				<div class="txt_dialog message"></div>
				<p class="foot_btn">
					<a href="#" class="btn_n bg_red modal_alert_confirm">확인</a>
					<a href="#" class="btn_n bg_gray modal_alert_close">취소</a>
				</p>
			</div>
			<a href="#" class="popup_close modal_alert_close">닫기</a>
		</div>

		<!-- 상태 진행중 팝업 -->
		<div id="progress_popup"  class="popup s400 status_progress_popup" style="display:none;" draggable="true">
			<div class="pop_header"><div class="layer_title"></div></div>
			<div class="pop_container">
				<div class="txt_dialog">
					<div class="ajax_loader"><div id="circularG_1" class="circularG"></div><div id="circularG_2" class="circularG"></div><div id="circularG_3" class="circularG"></div><div id="circularG_4" class="circularG"></div><div id="circularG_5" class="circularG"></div><div id="circularG_6" class="circularG"></div><div id="circularG_7" class="circularG"></div><div id="circularG_8" class="circularG"></div></div>
					<p class="txt_dialog3 message"></p>
				</div>
			</div>
			<a href="#" class="popup_close modal_progress_close">닫기</a>
		</div>


<div class="navbar-wrapper">
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="background:#2f4050;">
            <div class="container">
                <div class="navbar-header page-scroll">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/Anaconda.do?CMD=CMD_SEQ_105394223461515982311730">TRINITY+<sup>Free</sup></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a class="page-scroll" href="#page-top">홈</a></li>
                        <li><a class="page-scroll" href="#features">기능</a></li>
                        <li><a class="page-scroll" href="#team">팀</a></li>
                        <li><a class="page-scroll" href="#history">걸어온길</a></li>
                        <li><a class="page-scroll" href="#pricing">서비스</a></li>
                        <li><a class="page-scroll" href="#contact">연락처</a></li>

                        <li>
                     <div id="loginDiv" style="display:none;padding-top:30px;padding-left:5px;">
                     <a class="page-scroll" id="login" href="https://app.bestmember.net/Anaconda.do?CMD=CMD_SEQ_101263323761515982251126">
                        <i class="fa fa-sign-in"></i> 로그인
                    </a>
                        / 
                     <a class="page-scroll" id="login" href="https://app.bestmember.net/Anaconda.do?CMD=CMD_SEQ_105576075501516163662868">
                        <i class="fa fa-sign-in"></i> 회원가입
                    </a>
                    </div>
                    <div id="logoutDiv" style="display:none;padding-top:30px;padding-left:5px;">
                    <a class="page-scroll" id="logout" href="javascript:logout()">
                        <i class="fa fa-sign-out"></i> 로그아웃
                    </a>
                    <div>
                    </li>
                    </ul>
                </div>
            </div>
        </nav>
</div>

<script langugae="javascript">
  loginCheckWithFunc((json)=>{
     $("#logoutDiv").show();
     $("#loginDiv").hide();
  }, ()=>{
     $("#loginDiv").show();
     $("#logoutDiv").hide();
  });
</script>
