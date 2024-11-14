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


<script src="https://apis.google.com/js/platform.js" async="" defer=""></script> 
<div class="middle-box text-center loginscreen animated fadeInDown"> 
       <div>
            <div style="text-align:center">
                <h1 class="logo-name">T+</h1>
            </div>
            <h3>반가워요.</h3>
            <p>TRINITY+를 방문해주셔서 감사합니다.TRINITY+는 REST API 서비스를 사용하실 수 있도록 편리한 환경을 제공합니다.
            </p>
            <p>or.(<a href="http://api.bestmember.net/Anaconda.do?CMD=CMD_SEQ_108989841081515973724128">Home</a>)</p>
            <form class="m-t" role="form">
                <div class="form-group">
                    <input type="email" id="id" class="form-control" placeholder="이메일" required="">
                </div>
                <div class="form-group">
                    <input type="password" id="pw" class="form-control" placeholder="비밀번호" required="">
                </div>

                <button type="button" class="btn btn-primary block full-width m-b" onclick="login('id','pw')">로그인</button>
                  
                <table>
                <tbody><tr><td style="text-align:center;align:center;vertical-align: middle;">
                <div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" perms="user_about_me,email" data-use-continue-as="false" onlogin="facebooklogin();"></div>
                </td>
                </tr>
                <tr><td style="text-align:center;align:center;vertical-align: middle;padding-top:10px;padding-bottom:10px;">
                <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
                </td>
                </tr>
                </tbody></table>


<div>


</div>
<div>
                <a href="http://api.bestmember.net/Anaconda.do?CMD=CMD_SEQ_100690917941516166311802"><small>비밀번호를 잊으셨나요?</small></a>
                <p class="text-muted text-center"><small>아직 가입하지 않으셨나요?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="http://api.bestmember.net/Anaconda.do?CMD=CMD_SEQ_105576075501516163662868">계정을 만들어 보세요</a>

</div>
            </form>
            <p class="m-t"> <small>BESTMEMBER+ © 2018</small> </p>
        </div>
</div>


 <div id="fb-root"></div>
<script>

(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.0&appId=1623357291108636&autoLogAppEvents=1';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));


function facebooklogin() {

    //페이스북 로그인 버튼을 눌렀을 때의 루틴.
    FB.login(function(response) {
    var fbname;
    FB.api('/me',{ locale: 'ko_KR', fields: 'id, name, email' }, function(user) {
     fbname = user.name;
     if(user.email == null || user.email == ''){
      showPopup('실패','죄송합니다. 현재 가입하신 소셜 사이트(페이스북)에 이메일정보가 없거나, 올바르게 전달되지 못하였습니다. 다른 방법으로 로그인 하시거나, 가입후 이용해 주시기 바랍니다.',null);
      return;
      }

      $.post('/Anaconda.json?CMD=CMD_SEQ_107072005011529717161783', { 'site':'F', 'method' : 'E', 'id': user.id, 'name': fbname, 'email': user.email },
            function (json) {
                goSocialLoginResult(json,'페이스북');
            });
        });
    }, {scope: 'public_profile,email'});
}

function checkLoginState() {
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });
}

function onSignIn(googleUser){
   var profile = googleUser.getBasicProfile();

   if(profile.getEmail() == null || profile.getEmail() == ''){
      showPopup('실패','죄송합니다. 현재 가입하신 소셜 사이트(구글)에 이메일정보가 없거나, 올바르게 전달되지 못하였습니다. 다른 방법으로 로그인 하시거나, 가입후 이용해 주시기 바랍니다.',null);
      return;
   }
   
   $.post('/Anaconda.json?CMD=CMD_SEQ_107072005011529717161783', {  'site':'G', 'method' : 'E', 'id': profile.getId(), 'name': profile.getName(), 'email': profile.getEmail() },
            function (json) {
                goSocialLoginResult(json,'구글');
            });

}


function goSocialLoginResult(json, site){
    confirmPopup('소셜 로그인' ,'현재 소셜사이트('+site+')에 로그인 중입니다.<br>자동 로그인 하시겠습니까?',()=>{
    var strMsg = JSON.stringify(json);
    if(strMsg.indexOf('SocialLogin') > 0 && strMsg.indexOf('true') > 0){
       showPopup('성공','축하합니다. 요청하신 소셜 로그인 방식('+site+')으로 로그인이 성공적으로 진행 되었습니다.',null);              
       document.location.href = '/Anaconda.do?CMD=CMD_SEQ_105394223461515982311730';
     }else{ 
        showPopup('실패','죄송합니다. 소셜 로그인방식으로('+site+') 요청하였으나, 로그인연동에 실패하여, 더이상 진행할 수 없습니다. 다른 로그인 방식을 사용해 주시기 바랍니다.',null);              
     }
    });
}

$('#pw').keyup(function(e) {
    if (e.keyCode == 13) login('id','pw');        
});


</script>
