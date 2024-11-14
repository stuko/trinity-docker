<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 
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



<div class="gray-bg middle-box text-center loginscreen animated fadeInDown"> 
       <div>
            <div style="text-align:center">
                <h1 class="logo-name">T+</h1>
            </div>
        <h3>계정 만들기</h3>
            <p>TRINITY+에 계정을 만드시면, REST API 서비스를 만드실 수 있습니다.
            </p>
            <p>or.(<a href="/Anaconda.do?CMD=CMD_SEQ_108989841081515973724128">Home</a>)</p>
            <form class="m-t" role="form" method="post" name="frmEnter" action="/Anaconda.do">
                <div class="form-group">
                     <input type="text" name="email" id="email" class="form-control" value="" class="form-control" placeholder="이메일" required=""></input>
               </div>
               <div class="form-group">
                     <input type="password" name="password" id="password" class="form-control" value="" class="form-control" placeholder="비밀번호" required=""></input>
               </div>
               <div class="form-group">
                     <input type="password" name="password2" id="password2" class="form-control" value="" class="form-control" placeholder="비밀번호 확인" required=""></input>
               </div>
              <button class="btn btn-primary"  type="button" value="등록" onClick="javascript:fnMemberEnter();" >가입하기</button>
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
<script>
 alertPopup('알림','회원가입시 입력한 이메일로 <br>인증메일이 발송됩니다.<br> 인증메일을 통해, 인증이 완료된후,<br> 로그인해 주시기 바랍니다.');
</script>
