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
					if( msg ) target.find(".message").html( msg );
					
					var oHeight = target.height();
					var wHeight = $(window).height();
					var oWidth = target.width();

				
					if( $('.modal_bg').length > 0 )
					{

						var zIndex = $('.modal_bg:last').css('z-Index');
						$('html,body').css('overflow','hidden');
						target.css({
							top:(wHeight-oHeight)/2,
							marginLeft:(-(oWidth/2)),
							visibility:'visible',
                                                        display:'block',
							zIndex:(parseInt(zIndex)+3)
						});
						$('body').append('<div class="modal_bg" style="z-index:'+(parseInt(zIndex)+2)+'"></div>');
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

						$('body').append('<div class="modal_bg"></div>');
					}
					
					//target.draggable();
				
					$('.modal_alert_close', target).click(function(e){
						e.preventDefault();
						$('html,body').css('overflow', LayerPopup.overflow); 
						$('.modal_bg:last-child').remove();
						$(this).parents('.popup').css({top:'-9999px',visibility:'hidden'});
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
							$('html,body').css('overflow', LayerPopup.overflow);
							$('.modal_bg:last-child').remove();
							$(this).parents('.popup').css({top:'-9999px',visibility:'hidden'});
					
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
							$('html,body').css('overflow', LayerPopup.overflow);
							$('.modal_bg:last-child').remove();
							$(this).parents('.popup').css({top:'-9999px',visibility:'hidden'});
						});
					}
			},
			
			//confirm_popup
			confirm : function( title, msg, callback )
			{
					LayerPopup.show( $("#confirm_popup"), "confirm", title, msg );
					$('.modal_alert_confirm', $("#confirm_popup")).click(function(e){
           					e.preventDefault();
						$('html,body').css('overflow', LayerPopup.overflow);
						$('.modal_bg:last-child').remove();
						$(this).parents('.popup').css({top:'-9999px',visibility:'hidden'});
				
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
							$('html,body').css('overflow', LayerPopup.overflow);
							$('.modal_bg:last-child').remove();
							$(this).parents('.popup').css({top:'-9999px',visibility:'hidden'});
					
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
							$('html,body').css('overflow', LayerPopup.overflow);
							$('.modal_bg:last-child').remove();
							$(this).parents('.popup').css({top:'-9999px',visibility:'hidden'});
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
  post(d,'CMD_SEQ_103371013831497846151779',(json) => {
          if(json.login && json.login[0] && json.login[0].Email){
                window.localStorage.setItem('token', json.login[0].token );
                showPopup('Login',"축하합니다. 성공적으로 로그인 되셨습니다.",'/Anaconda.do?CMD=CMD_SEQ_105394223461515982311730');
            }else if(json.AcceptYN && json.AcceptYN[0] != undefined){
                var mesage = json.AcceptYN[0].Gap > 0 ? '인증메일의 유효기간이 지났습니다. 다음 이메일로 연락해주세요 email : bestmember.2017@gmail.com' : '축하합니다. 인증요청하신 메일이 승인되어 정상적으로 로그인이 가능하십니다.';
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
                           showPopup('성공', "입력하신 메일로 인증 요청 메일을 발송하였습니다.,인증 요청 메일을 확인하신후, 로그인해주시기 바랍니다.","/Anaconda.do?CMD=CMD_SEQ_101263323761515982251126");
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
       simplePopup('에러', '비밀번호를 확인해 주세요.');
       return;
   }
 var d = {password : $('#password').val() };
  post(d,'CMD_SEQ_108175503351516366897155',(json)=>{
                 if(json){
                       simplePopup('성공', '축하합니다. 수정요청하신 정보가 반영되었습니다.');
                 }else{
                      simplePopup('실패', '죄송합니다. 수정요청하신 정보를 변경할수 없습니다.');
                 }
          } ,
          ()=>{
               simplePopup('실패', '죄송합니다. 시스템에 오류가 발생하였습니다.');
          });
}

function fnForgot(){
   if(!$('#email') || $('#email').val() == '') {
       simplePopup('에러', '이메일을 확인해 주세요.(' + $('#email').val() + ')');
       return; 
  }
  var d = {email : $('#email').val()}
   post(d,'CMD_SEQ_104139162881516165491833',(json)=>{
                 if(json && json.checkEmail && json.checkEmail[0].Email == '1'){
                       var d = {email : $('#email').val() }
                       post(d,'CMD_SEQ_100255485371497915403639',(json)=>{
                           showPopup('성공', "축하합니다. 인증요청 메일이 발송되었습니다. 이메일 확인후 로그인해 주시기 바랍니다.","/Anaconda.do?CMD=CMD_SEQ_101263323761515982251126");
                        } ,
                       ()=>{
                           simplePopup('실패', '죄송합니다. 시스템 오류가 발생하였습니다.');
                       });
                 }else{
                      simplePopup('실패', '죄송합니다. 이메일 정보가 존재하지 않습니다.('+$('#email').val()+').');
                 }
          } ,
          ()=>{
               simplePopup('실패', '사이트에 가입하실수 없습니다.');
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












var element = $('.floating-chat');
var myStorage = localStorage;

if (!myStorage.getItem('chatID')) {
    myStorage.setItem('chatID', createUUID());
}

setTimeout(function() {
    element.addClass('enter');
}, 1000);

element.click(openElement);

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
alert("DDD");
  $(this).closest('#container-floating').toggleClass('is-opened');
  $('.nds').removeClass('is-opened');
  $('body').toggleClass('is-blur');
})

$('.nds').click(function(){
  $('.nds').not(this).removeClass('is-opened');
  $(this).toggleClass('is-opened');
})
