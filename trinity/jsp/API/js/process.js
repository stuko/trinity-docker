function test(){
}



	var LayerPopup = {
			
			target :
			{
					alert : $("#alert_popup"),
					confirm : $("#confirm_popup"),
					progress : $("#progress_popup")
			},
			
			overflow : $('body').css('overflow'),
	
			show : function( target, mode, title, msg )
			{
					// target을 초기화 후 다시 셋팅
					var target = null;
                                        if( mode == "alert" ) target = $("#alert_popup");
					if( mode == "confirm" ) target = $("#confirm_popup");
					if( mode == "progress" ) target = $("#progress_popup");

					if( mode == "alert" ) cloneObj = $("#alert_popup").clone();
					if( mode == "confirm" ) cloneObj = $("#confirm_popup").clone();
					if( mode == "progress" ) cloneObj = $("#progress_popup").clone();

					target.empty().append( cloneObj.html() );

                                        if(title) target.find(".layer_title").html(title);
					if( msg ) target.find(".pop_message").html( msg );
					
                                        var oHeight = target.height();
					var wHeight = $(window).height();
					var oWidth = target.width();

				
					if( $('.sp_modal_bg').length > 0 )
					{
						var zIndex = $('.sp_modal_bg:last').css('z-Index');
						$('html,body').css('overflow','hidden');
						target.css({
							top:(wHeight-oHeight)/2,
							marginLeft:(-(oWidth/2)),
							visibility:'visible',
                                                        display:'block',
							zIndex:(parseInt(zIndex)+3)
						});
						$('body').append('<div class="sp_modal_bg" style="z-index:'+(parseInt(zIndex)+2)+'"></div>');
					}
					else
					{
						$('html,body').css('overflow','hidden');
						target.css({
							top:(wHeight-oHeight)/2,
							marginLeft:(-(oWidth/2)),
							visibility:'visible',
                                                        display:'block'
						});

						$('body').append('<div class="sp_modal_bg"></div>');
					}
					
					//target.draggable();
					$('.modal_alert_close', target).click(function(e){
						e.preventDefault();
                                                $('html,body').css('overflow', 'auto'); 
						$('.sp_modal_bg').remove();
						$(this).parents('.sp_popup').css({top:'-9999px',visibility:'hidden'});
					});
			},
			
			//alert_popup
			alert : function( title, msg, callback )
			{
					LayerPopup.show( $("#alert_popup"), "alert", title, msg );
					
					if( typeof callback != 'undefined' && callback)
					{
						$('.modal_alert_confirm', $("#alert_popup")).click(function(e){
							e.preventDefault();
					                $('html,body').css('overflow', 'auto');
							$('.sp_modal_bg').remove();
							$(this).parents('.sp_popup').css({top:'-9999px',visibility:'hidden'});
					
							if (typeof callback == 'function') {
								callback();
							} else {
								if( callback ) {
									if( callback.indexOf("(") == -1 ) eval( callback +"()");
									else eval( callback );
								} else {
									if( typeof( confirmAfter ) == "function" ) {
										confirmAfter();
									}
								}
							}
							
							$(this).unbind("click");
						});
					}
					else
					{
						$('.modal_alert_confirm', $("#alert_popup")).click(function(e){
							e.preventDefault();
					                $('html,body').css('overflow', 'auto');
							$('.sp_modal_bg').remove();
							$(this).parents('.sp_popup').css({top:'-9999px',visibility:'hidden'});
						});
					}
			},
			
			//confirm_popup
			confirm : function( title, msg, callback )
			{
					LayerPopup.show( $("#confirm_popup"), "confirm", title, msg );
					$('.modal_alert_confirm', $("#confirm_popup")).click(function(e){
           					e.preventDefault();
						$('html,body').css('overflow', 'auto');
						$('.sp_modal_bg').remove();
						$(this).parents('.sp_popup').css({top:'-9999px',visibility:'hidden'});
				
						if (typeof callback == 'function') {
                                			callback();
						} else {
							if( callback ) {
                                				if( callback.indexOf("(") == -1 ) eval( callback +"()");
								else eval( callback );
							} else {
                                				if( typeof( confirmAfter ) == "function" ) {
									confirmAfter();
								}
							}
						}
						
						$(this).unbind("click");
					});
			},

			// progress 팝업은 close 에 callback
			progress : function(title , msg, callback)
			{
					LayerPopup.show( $("#progress_popup"), "progress", title, msg );
					
					if( typeof callback != 'undefined' && callback)
					{
						$('.modal_progress_close', $("#progress_popup")).click(function(e){
							e.preventDefault();
							$('html,body').css('overflow', 'auto');
							$('.sp_modal_bg').remove();
							$(this).parents('.sp_popup').css({top:'-9999px',visibility:'hidden'});
					
							if (typeof callback == 'function') {
								callback();
							} else {
								if( callback ) {
									if( callback.indexOf("(") == -1 ) eval( callback +"()");
									else eval( callback );
								} else {
									if( typeof( confirmAfter ) == "function" ) {
										confirmAfter();
									}
								}
							}
							
							$(this).unbind("click");
						});
					}
					else
					{
						$('.modal_progress_close', $("#progress_popup")).click(function(e){
							e.preventDefault();
							$('html,body').css('overflow', 'auto');
							$('.sp_modal_bg').remove();
							$(this).parents('.sp_popup').css({top:'-9999px',visibility:'hidden'});
						});
					}
			},
			
			// popup close
			closeProgress : function() 
			{
				$('.modal_progress_close', $("#progress_popup")).click();
			}
	}

	function alertPopup(t,m) {
		LayerPopup.alert(t,m);
	}

	function confirmPopup(t,m,f) {
		LayerPopup.confirm(t,m,f);
	}

	function progressPopup(t,m,f) {
		LayerPopup.progress(t,m,f);
	}

function showRunning(){
	var running_div = document.getElementById('running_div');
	if(running_div == null)	{
		running_div = document.createElement("div");
		running_div.setAttribute("id","running_div");
		running_div.innerHTML = '<img src="/jsp/anaconda/img/ajax-loader.gif" />';
                //top: 50%;        /* 화면의 중앙에 위치 */
                //left: 50%;        /* 화면의 중앙에 위치 */
                // margin: -100px 0 0 -100px;        /* 높이의 절반과 너비의 절반 만큼 margin 을 이용하여 조절 해 줍니다. */
		running_div.style.position = 'absolute';
		running_div.style.borderColor = '#C1DEF0';
		running_div.style.borderStyle = 'solid';
		running_div.style.borderWidth = '1px';
		running_div.style.left = '50%';
		running_div.style.top = '50%';
		running_div.style.margin = '-50px 0 0 -50px';
		running_div.style.display = 'block';
		var body = document.getElementsByTagName("BODY");
		if(body != null){
			body[0].appendChild(running_div);
		}
	}
	running_div.style.display = 'block';
}
function hideRunning(){
	var running_div = document.getElementById('running_div');
	if(running_div != null){
		running_div.style.display = 'none';
	}
}


function json(d,cmd,fnSuccess,fnError){
   showRunning();
   $.ajax({
            type : "POST",
            url : "/Anaconda.json?CMD=" + cmd,
            dataType : "json",
            data: d ,
            cache: false,
            global: false,
            error : function(err){
               hideRunning();
               fnError(err);
            },
            success : function(result){
               hideRunning();
               fnSuccess(result);
            }
        });  
}

function doJson(d,cmd,fnSuccess,fnError){
   showRunning();
   $.ajax({
            type : "POST",
            url : "/Anaconda.do?CMD=" + cmd,
            dataType : "json",
            data: d ,
            cache: false,
            global: false,
            error : function(err){
               hideRunning();
               fnError(err);
            },
            success : function(result){
               hideRunning();
               fnSuccess(result);
            }
        });  
}

function post(d,cmd,fnSuccess,fnError){
   var param = (d == null || !d) ? '' : JSON.stringify(d);
   if(param.startsWith("\"")) param = param.substring(1);
   if(param.endsWith("\"")) param = param.substring(0,param.length-1);
   showRunning();
   $.ajax({
            type : "POST",
            url : "/Anaconda.json?CMD=" + cmd,
            dataType : "text",
            data: param ,
            cache: false,
            global: false,
            error : function(err){
               hideRunning();
               fnError(err);
            },
            success : function(result){
               hideRunning();
               fnSuccess(JSON.parse(result));
            }
        });  
}

function doPost(d,cmd,fnSuccess,fnError){
   var param = (d == null || !d) ? '' : JSON.stringify(d);
   if(param.startsWith("\"")) param = param.substring(1);
   if(param.endsWith("\"")) param = param.substring(0,param.length-1);
   showRunning();
   $.ajax({
            type : "POST",
            url : "/Anaconda.do?CMD=" + cmd,
            dataType : "text",
            data: param,
            cache: false,
            global: false,
            error : function(err){
               hideRunning();
               fnError(err);
            },
            success : function(result){
               hideRunning(); 
               fnSuccess(JSON.parse(result));
            }
        });  
}

function simplePopup(t,c){
   showPopup(t,c,null);
}

function showPopup(t,c,l){
   toastr.success(c,t);
   if(l && l != '' && l != null)
       document.location.href = l;
}

function login(id,pw){

  var d = {email: $('#'+id).val() , password: $('#'+pw).val()};
  post(d,'CMD_SEQ_103371013831497846151779',(json)=>{
          if(json.login && json.login[0] && json.login[0].Email){
                window.localStorage.setItem('token', json.login[0].token );
                showPopup('로그인',"축하합니다. 로그인 되셨습니다.",'/Anaconda.do?CMD=CMD_SEQ_105394223461515982311730');
            }else if(json.AcceptYN && json.AcceptYN[0] != undefined){
                var mesage = json.AcceptYN[0].Gap > 0 ? '죄송합니다. 인증용으로 발송했던 메일의 유효기간이 지났습니다. 다시한번 비밀번호 찾기를 해주시기 바랍니다.' : '축하합니다 인증된 메일로 정상적으로 로그인 되셨습니다.';
                showPopup('로그인',mesage ,null);
            }else{
                showPopup('로그인',"로그인 하실수 없습니다. 이메일 혹은 비밀번호를 확인해 주세요(-2)",null);
            }
       } , (err)=>{
          alertPopup('Error','에러가 발생하였습니다.');   
       });

}



function loginWithNext(id,pw,url){

  var d = {email: $('#'+id).val() , password: $('#'+pw).val()};
  post(d,'CMD_SEQ_103371013831497846151779',(json) => {
          if(json.login && json.login[0] && json.login[0].Email){
                window.localStorage.setItem('token', json.login[0].token );
                showPopup('Login',"Congratulations. You have successfully logged in.",url);
            }else if(json.AcceptYN && json.AcceptYN[0] != undefined){
                var mesage = json.AcceptYN[0].Gap > 0 ? 'Your verification email has expired. Please contact us by email at bestmember.2017@gmail.com' : 'Congratulations. But Your email has not been approved and you can not log in normally.';
                showPopup('로그인',mesage ,null);
            }else{
                showPopup('로그인',"로그인 하실수 없습니다. 이메일 혹은 비밀번호를 확인해 주세요(-2)",null);
            }
       } , (err)=>{
          alertPopup('Error','에러가 발생하였습니다.');   
       });

}



function loginCheckWithFunc(suc,err){
        var t = window.localStorage.getItem('token');
        var d = {token: t};
        doPost(d,'CMD_SEQ_106063131981499331222374', (json)=>{
            if(json.token == 'true'){
               suc(json);
            }else{
               err();
            }}, ()=>{
               err();
        });
}

function loginCheck(){
        var t = window.localStorage.getItem('token');
        var d = {token: t};
        doPost(d,'CMD_SEQ_106063131981499331222374',(json)=>{
            if(json.token != 'true'){
               showPopup('로그인', "로그인","로그인 하신후 사용하시기 바랍니다..",'');
            }}, ()=>{
               showPopup('로그인', "로그인","로그인 하신후 사용하시기 바랍니다.",'');
        });
}

function logout(){
   post(null,'CMD_SEQ_109793427901500143513342',(json)=>{
                 document.location.href = '/Anaconda.do?CMD=CMD_SEQ_101263323761515982251126';
              }, ()=>{
                 showPopup('로그인', "로그인","로그아웃 에러 발생.",'');  
              });
}

// loginCheck();
function m(t){
  if(!$('#' + t) || $('#' + t).val() == '') {
       simplePopup('에러', '다음 정보를 확인해 주세요 : '+t+'(' + $('#' + t).val() + ')');
       return false; 
  }else{
      return true;
  }
}

function fnSaveDataBase(){

   confirmPopup("확인","데이터 베이스 연결 설정정보를 저장하시겠습니까?",function(){
   if($(':radio[name="trinity"]:checked').val() != 'Y'){
     if(!m('id')) return;
     if(!m('password')) return;
     if(!m('url')) return;
     if(!m('max')) return;
   }
   var trinity = 'Y';
   if($(':radio[name="trinity"]:checked').val() == 'Y') trinity = 'Y';
   else trinity = 'N';   

   var d = {id : $('#id').val(),password : $('#password').val(),url : $('#url').val(),max : $('#max').val(),trinity : trinity};
   
   post(d,'CMD_SEQ_107099889971516372798977',(json)=>{
                 showPopup('성공', "축하합니다. 요청하신 데이터 베이스 연결 정보가 저장되었습니다..","/Anaconda.do?CMD=CMD_SEQ_101259970311516369516609");
            } , 
            ()=>{
                 showPopup('에러', "죄송합니다. 요청하신 데이터 베이스 연결 정보를 저장하지 못하였습니다.","/Anaconda.do?CMD=CMD_SEQ_101259970311516369516609");
            } );         

  });
}

function fnCreateDataBaseInTrinity(){
   confirmPopup("확인","데이터 베이스를 생성하시겠습니까?",function(){
   var d = {};
   post(d,'CMD_SEQ_100632241021516411727959',(json)=>{
                 showPopup('성공', "축하합니다. Trinity+ 에 요청하신 데이터 베이스를 생성되었습니다.","/Anaconda.do?CMD=CMD_SEQ_101259970311516369516609");
            } , 
            ()=>{
                 showPopup('에러', "죄송합니다. 요청하신 데이터 베이스 생성에 실패하였습니다.","/Anaconda.do?CMD=CMD_SEQ_101259970311516369516609");
            } );     
   });
}

function fnDropDataBaseInTrinity(){
   confirmPopup("확인","데이터 베이스를 삭제하시겠습니까?",function(){
   var d = {};
   post(d,'CMD_SEQ_101752379421516415833085',(json)=>{
                 showPopup('성공', "축하합니다. Trinityh+ 에 요청하신 데이터베이스 삭제가 완료 되었습니다.","/Anaconda.do?CMD=CMD_SEQ_101259970311516369516609");
            } , 
            ()=>{
                 showPopup('에러', "죄송합니다. 요청하신 데이터 베이스 삭제에 실패하였습니다.","/Anaconda.do?CMD=CMD_SEQ_101259970311516369516609");
            } );     

   });
}

function fnCreateTable(){
   confirmPopup("확인","테이블을 생성하시겠습니까?",function(){
   if(!m('ddl')) return;
   var d = {sql :  $('#ddl').val() };
   post(d,'CMD_SEQ_100885748691516403686608',(json)=>{
                 showPopup('성공', "축하합니다. 요청하신 테이블이 생성되었습니다.","/Anaconda.do?CMD=CMD_SEQ_102396648511516403679993");
            } , 
            ()=>{
                 showPopup('에러', "죄송합니다. 요청하신 테이블 생성에 실패하였습니다.","/Anaconda.do?CMD=CMD_SEQ_102396648511516403679993");
            } );     
   });
}

function fnDropTable(tbl){
   confirmPopup("확인","테이블을 삭제하시겠습니까?",function(){
   var d = {sql : 'drop table ' + tbl};
   post(d,'CMD_SEQ_100885748691516403686608',(json)=>{
                 showPopup('성공', "축하합니다. 요청하신 테이블("+tbl+")이 삭제 되었습니다.","/Anaconda.do?CMD=CMD_SEQ_102396648511516403679993");
            } , 
            ()=>{
                 showPopup('에러', "죄송합니다. 요청하신 테이블 삭제에 실패하였습니다.","/Anaconda.do?CMD=CMD_SEQ_102396648511516403679993");
            } );     
 });
}


function fnMemberEnter(){
    fnMemberEnterPlus("/Anaconda.do?CMD=CMD_SEQ_101263323761515982251126");
}


function fnMemberEnterPlus(url){
   if(!$('#email') || $('#email').val() == '') {
       simplePopup('에러', '이메일 정보를 확인해 주세요.(' + $('#email').val() + ')');
       return; 
  }
  if(!$('#password') || $('#password').val() == '' || $('#password').val() != $('#password2').val()) {
       simplePopup('에러', '비밀번호를 올바르게 입력하셨는지 확인해 주세요.');
       return;
   }
  var d = {email : $('#email').val()}
   post(d,'CMD_SEQ_104139162881516165491833',(json)=>{
                 if(json && json.checkEmail && json.checkEmail[0].Email == '0'){
                       var d = {email : $('#email').val(), password: $('#password').val(), role : 'TeamLeader', name: $('#email').val() }
                       post(d,'CMD_SEQ_101104202101497847031986',(json)=>{
                           showPopup('성공', "입력하신 메일로 인증 요청 메일을 발송하였습니다.,인증 요청 메일을 확인하신후, 로그인해주시기 바랍니다.",url);
                        } ,
                       ()=>{
                           simplePopup('실패', '죄송합니다. 오류가 발생하였습니다.');
                       });
                 }else{
                      simplePopup('실패', '죄송합니다. 이미 사용중이 이메일입니다.('+$('#email').val()+').');
                 }
          } ,
          ()=>{
               simplePopup('실패', '죄송합니다. 가입에 실패하였습니다. 입력하신 메일을 확인해 주시기 바랍니다.');
          });
}


function fnMemberModify(){

   if(!$('#password') || $('#password').val() == '' || $('#password').val() != $('#password2').val()) {
       simplePopup('Error', 'Please check your password.');
       return;
   }
 var url = '';
 if($('#callback') != null && $('#callback').val() != '') {
    url = $('#callback').val();
 }
 var dm = '';
 if($('#domain') != null && $('#domain').val() != '') {
    dm = $('#domain').val();
 }
 var d = {password : $('#password').val(), callback : url, domain : dm };
  post(d,'CMD_SEQ_108175503351516366897155',(json)=>{
                 if(json){
                       simplePopup('success', 'Congratulations. The information you requested is reflected.');
                 }else{
                      simplePopup('success', 'Sorry. You can not change the information you requested.');
                 }
          } ,
          ()=>{
               simplePopup('fail', 'Sorry. The system has encountered an error.');
          });
}

function fnForgot(){
   fnForgotPlus("/Anaconda.do?CMD=CMD_SEQ_101263323761515982251126", null);
}


function fnForgotPlus(url){
   fnForgotPlusAndGo(url,null);
}

function fnForgotPlusAndGo(url,fnSuccess){
   if(!$('#email') || $('#email').val() == '') {
       simplePopup('Error', 'Please confirm your email.(' + $('#email').val() + ')');
       return; 
  }
  var d = {email : $('#email').val()}
   post(d,'CMD_SEQ_104139162881516165491833',(json)=>{
                 if(json && json.checkEmail && json.checkEmail[0].Email == '1'){
                       var d = {email : $('#email').val() }
                       post(d,'CMD_SEQ_100255485371497915403639',(json)=>{
                           showPopup('success', "Congratulations. A verification request has been sent. Please check your email and login.",url);
                           if(fnSuccess != null) fnSuccess();
                        } ,
                       ()=>{
                           simplePopup('fail', 'Sorry. A system error has occurred.');
                       });
                 }else{
                      simplePopup('fail', 'Sorry. Email information does not exist.('+$('#email').val()+').');
                 }
          } ,
          ()=>{
               simplePopup('fail', 'You can not join the site.');
          });
}


function fnTestDataBase(){
   var d = {};
   post(d,'CMD_SEQ_109176255151516378462755',(json)=>{
               if(json.test == 'Y')
                     showPopup('성공', "축하합니다. 요청하신 데이터베이스 테스트가 성공적으로 완료되었습니다.","");
               else
                     showPopup('실패', "죄송합니다. 요청하신 데이터베이스 테스트에 실패하였습니다.","");
           } ,
           ()=> {
               showPopup('실패', "죄송합니다. 시스템 오류가 발생하였습니다.","");              
            } ); 
}











/*
var element = $('.floating-chat');
var myStorage = localStorage;

if (!myStorage.getItem('chatID')) {
    myStorage.setItem('chatID', createUUID());
}

setTimeout(function() {
    element.addClass('enter');
}, 1000);

element.click(openElement);
*/


function openElement() {
    var messages = element.find('.messages');
    var textInput = element.find('.text-box');
    element.find('>i').hide();
    element.addClass('expand');
    element.find('.chat').addClass('enter');
    var strLength = textInput.val().length * 2;
    textInput.keydown(onMetaAndEnter).prop("disabled", false).focus();
    element.off('click', openElement);
    element.find('.header button').click(closeElement);
    element.find('#sendMessage').click(sendNewMessage);
    messages.scrollTop(messages.prop("scrollHeight"));
}

function closeElement() {
    element.find('.chat').removeClass('enter').hide();
    element.find('>i').show();
    element.removeClass('expand');
    element.find('.header button').off('click', closeElement);
    element.find('#sendMessage').off('click', sendNewMessage);
    element.find('.text-box').off('keydown', onMetaAndEnter).prop("disabled", true).blur();
    setTimeout(function() {
        element.find('.chat').removeClass('enter').show()
        element.click(openElement);
    }, 500);
}

function createUUID() {
    // http://www.ietf.org/rfc/rfc4122.txt
    var s = [];
    var hexDigits = "0123456789abcdef";
    for (var i = 0; i < 36; i++) {
        s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
    }
    s[14] = "4"; // bits 12-15 of the time_hi_and_version field to 0010
    s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1); // bits 6-7 of the clock_seq_hi_and_reserved to 01
    s[8] = s[13] = s[18] = s[23] = "-";

    var uuid = s.join("");
    return uuid;
}

function sendNewMessage() {
    var userInput = $('.text-box');
    var newMessage = userInput.html().replace(/\<div\>|\<br.*?\>/ig, '\n').replace(/\<\/div\>/g, '').trim().replace(/\n/g, '<br>');

    if (!newMessage) return;

    var messagesContainer = $('.messages');

    messagesContainer.append([
        '<li class="self">',
        newMessage,
        '</li>'
    ].join(''));

    // clean out old message
    userInput.html('');
    // focus on input
    userInput.focus();

    messagesContainer.finish().animate({
        scrollTop: messagesContainer.prop("scrollHeight")
    }, 250);
}

function onMetaAndEnter(event) {
    if ((event.metaKey || event.ctrlKey) && event.keyCode == 13) {
        sendNewMessage();
    }
}







$('#floating-button').click(function(){
  $(this).closest('#container-floating').toggleClass('is-opened');
  $('.nds').removeClass('is-opened');
  $('body').toggleClass('is-blur');
})

$('.nds').click(function(){
  $('.nds').not(this).removeClass('is-opened');
  $(this).toggleClass('is-opened');
})



//----------------------------------------
// SocialLogin
//----------------------------------------

$(document).ready(function() {
try { 
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v4.0&appId=1623357291108636&autoLogAppEvents=1';
    try{
       fjs.parentNode.insertBefore(js, fjs);
  }catch(e){}
  }(document, 'script', 'facebook-jssdk'));
}
catch (e) {
}

});




// 페이스북 로그인
function fnFBLogin() {
   FB.getLoginStatus((response) => {
    if (response.status === 'connected') {
       //user is authorized
       FB.api('/me',{ locale: 'ko_KR', fields: 'id, name, email' }, function(user) {
           fnFBLoginAfter(user);
       }, {scope: 'public_profile,email' ,  return_scopes: true});
    }else{
      FB.login(function(response) {
         FB.api('/me',{ locale: 'ko_KR', fields: 'id, name, email' }, function(user) {
           fnFBLoginAfter(user);
         }, {scope: 'public_profile,email',  return_scopes: true});
      });
    }
  });
}

// 구글 로그인
function fnGGLogin(googleUser){
   var profile = googleUser.getBasicProfile();
   fnGGLoginAfter(profile);
}


// 페이스북 로그후 프로세스
function fnFBLoginAfter(user){
  var fbname;
  fbname = user.name;
  if(user.email == null || user.email == ''){
   showPopup('Failure','Sorry. Your current social site (Facebook) does not have email information or is not delivered correctly. Please login or register.',null);
      return;
  }

  $.post('/Anaconda.json?CMD=CMD_SEQ_107072005011529717161783', { 'site':'F', 'method' : 'E', 'id': user.id, 'name': fbname, 'email': user.email },
       function (json) {
           goSocialLoginResult(json,'Facebook');
  });
}

// 구글 로그인후 프로세스
function fnGGLoginAfter(profile){

   if(profile.getEmail() == null || profile.getEmail() == ''){
      showPopup('Failure','Sorry. Your current social site (Google) does not have email information, or it was not delivered correctly. Please login or register.',null);
      return;
   }
   
   $.post('/Anaconda.json?CMD=CMD_SEQ_107072005011529717161783', {  'site':'G', 'method' : 'E', 'id': profile.getId(), 'name': profile.getName(), 'email': profile.getEmail() },
      function (json) {
          goSocialLoginResult(json,'Google');
   });

}

// SNS 로그인후에 가야할 페이지
function goSocialLoginResult(json, site){
    confirmPopup('Social login' ,'You are currently signed in to a social site ('+ site +'). Do you want to sign in automatically?',()=>{
    var strMsg = JSON.stringify(json);
    if(strMsg.indexOf('SocialLogin') > 0 && strMsg.indexOf('true') > 0){
       showPopup('success','Congratulations. You have successfully signed in with the requested social sign-in method ('+ site +').',null);              
        if(fnGoSocialLoginNext) {
          fnGoSocialLoginNext();
        }
     }else{ 
        showPopup('Failure','Sorry. I have requested a social login ('+ site +') but have failed to log in and can not proceed anymore. Please use a different login method.',null);              
     }
    });
}
