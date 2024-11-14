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


<nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav metismenu" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element"> 
                           <h2>TRINITY+</h2>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="block m-t-xs"> 
                                    <strong class="font-bold"><span id="UserName"></span></strong>
                                </span>
                                <span class="text-muted text-xs block">
                                    <span id="Role"></span>
                                    <b class="caret"></b>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a href="/Anaconda.do?CMD=CMD_SEQ_107502059411516365424300">비밀번호 변경</a></li>
                                <li class="divider"></li>
                                <li><a href="javascript:logout()">로그아웃</a></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                      <a href="#"><i class="fa fa-database"></i> <span class="nav-label">데이터베이스 관리</span> </a>
                        <ul class="nav nav-second-level collapse">
                            <li><a href="/Anaconda.do?CMD=CMD_SEQ_101259970311516369516609">연결 관리</a></li>
                            <li><a href="/Anaconda.do?CMD=CMD_SEQ_102396648511516403679993">테이블 관리</a></li>
                        </ul>
                   </li>
                   <li>
                        <a href="#"><i class="fa fa-magic"></i> <span class="nav-label">REST API 관리</span></a>
                          <ul class="nav nav-second-level collapse">
                            <li><a href="/Anaconda.do?CMD=CMD_SEQ_101546461141516501853438">REST API 등록</a></li>
                            <li><a href="/Anaconda.do?CMD=CMD_SEQ_109602875151516493932720">REST API 리스트</a></li>
                          </ul>
                    </li>
                </ul>

            </div>
        </nav>


<script language='javascript'>
   var c = 'CMD_SEQ_103883253451499751544545';
   post({},c,(json)=>{
          $('#UserName').html(json.MemberInfo == null || json.MemberInfo == undefined || json.MemberInfo[0] == null || json.MemberInfo[0] == undefined || json.MemberInfo[0].name == null || json.MemberInfo[0].name == undefined ? '정보수정' : json.MemberInfo[0].name );
          $('#Role').html(json.MemberInfo == null || json.MemberInfo == undefined || json.MemberInfo[0] == null || json.MemberInfo[0] == undefined || json.MemberInfo[0].role == null || json.MemberInfo[0].role == undefined ? '역할없음' : json.MemberInfo[0].role);
          // if($('#Role').val() == '') $('#Role').html('No Role');
   }, (err)=>{
   });
</script>
