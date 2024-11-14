<%@page contentType="text/javascript; charset=UTF-8" pageEncoding="UTF-8"  %>
<%
String clientId = "";
String secretKey = "";
Object ocid = session.getAttribute("clientId");
Object osk = session.getAttribute("secretKey");
String wsocket = request.getParameter("wsocket");
clientId = ocid == null ? request.getParameter("clientId") : (String)ocid;
secretKey = osk == null ? request.getParameter("secretKey") : (String)osk;
if(clientId != null && secretKey != null){
  String channelId = request.getParameter("channelId") != null ? request.getParameter("channelId") : clientId;
%>
//----------------------------------------
// Global Variable
//----------------------------------------

var g_Profile =

{
   msgType:'DUNA.SAAS' ,
   // container : 'StickerContainer', 
   ServiceName:'chat',
   Level : 'normal',
   MY_THOUGHT : '',
   channelId : '<%=channelId%>',
   clientId : '<%=clientId%>',
   secretKey : '<%=secretKey%>',
   ip : '',
   x : '',
   y : '',
   city : '',
   dfp : getCookie("DFP"),
   person : {
        gender : "NA" ,
        age    : "NA" ,
        other  : {  
            job : "NA" ,
            experience : 'NA' ,
            hobby : "NA" ,
            interest : "NA" 
        }
    },
    context : {
        event  : {
            isScratch : "false",
            name : "",
            type : "",
            desc : ""
        },
        device : {
            device : "",
            fingerPrint : "",
            os : "",
            browser : "",
            browserVersion : "",
            engine : "",
            engineVersion : "",
            resolutionW : "",
            resolutionH : "",
            robot : "",
            refHost : "",
            refUrl : "",
            cpu : "",
            currentTime : ""
        },
        activity : {
            before : "", 
            avgClickGap : "",
            clickGap : "",
            mouseUsage : "", 
            keyboardUsage : "", 
            mouseMoveType : "",
            studyTime : "" // 실제 공부한 시간
        } ,
        message : {
            text : "" , 
            pre10Text : [], 
            pre5Text : [] , 
            pre10MinText : [], 
            pre5MinText : [] , 
            pre1Text : "" , 
            avgWaitTimeBeforeWrite : "" , 
            avgEraseCount : "" , 
            avgWaitTimeBeforeSend : "" , 
            waitTimeBeforeSend : "" , 
            avgSameTextCount : "" 
        },
        environment : {},
        weather : {
               text : "",
               rainState : "",
               rain : "",
               sky : "",
               temperature : "",
               wind : "",
               humidity : "",
               snow : "",
               rainPop : "",
               windText : ""
            },
        news : {
            politics : "",
            economy : "",
            entertainment : "",
            accident : "",
            sports : "" 
        }
    }
}

function sayDUNA(msg , success , error){
    var p = {
            msgType : "DUNA.SAAS"
          , clientId : "<%=clientId%>"
          , secretKey : "<%=secretKey%>"
          , channelId : "<%=channelId%>"
          , message : msg
          , ServiceName:'chat'
          , Level : 'normal'
          , MY_THOUGHT : msg
          , ip : ''
          , x : ''
          , y : ''
          , city : ''
          , dfp : getCookie("DFP")
          , chat_Id : "<%=channelId%>"
          , ruleTest : 'false'
          , ruleSeq : ''
          , url : ''
         };
  /*
    json(p,'CMD_SEQ_100007709531581063542164',(s)=>{
           if(success != null){
              success(s);
           }
     } , (e)=>{
           if(error != null) {
              error(e);
           }
     })
  */

      $.ajax({
          url:'/Anaconda.json?CMD=CMD_SEQ_100007709531581063542164' // 요청 할 주소
         ,async:true  // false 일 경우 동기 요청으로 변경
         ,type:'POST' // GET, PUT
         ,data: p // JSON.stringify(p) // 전송할 데이터
         ,dataType:'json'  //'text' // xml, json, script, html
         ,beforeSend:function(d) {}// 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단
         ,success:function(d) {
           // alertPopup('success',d);
           if(success != null){
              success(s);
           }
         }// 요청 완료 시
         ,error:function(d) {
           if(error != null) {
              error(e);
           }
         }// 요청 실패.
         ,complete:function(d) {}// 요청의 실패, 성공과 상관 없이 완료 될 경우 호출
     });
  }



function _chat(cmd){
   var id =  Math.random().toString(36).slice(-5);
   // var script = 'showTrinityDiv("'+cmd+'","'+id+'","chat")';
   // eval(script);
   showTrinityDiv(cmd,id,"chat");
}

function _EXE(cmd,p){
   var id =  Math.random().toString(36).slice(-5);
   var script = 'showTrinityDiv("'+cmd+'","'+id+'","'+p+'")';
   eval(script);
}
//----------------------------------
// Chat dynamic div show
//----------------------------------
function showTrinityDiv(cmd, div , parent){
  var o = document.getElementById(div);

  if(o == null || o == 'undefined' || o == 'null'){
     var tag = document.createElement('div');
     tag.id = div;
     if(parent == null ) parent = 'body';  
     if(parent != 'chat') {
        document.getElementsByTagName(parent)[0].appendChild(tag);  
     }
  }
  if(parent == 'chat') div = 'chat';
  include("/Anaconda.do?CMD=CMD_SEQ_109647074381582096778585&cmd2="+cmd+"&div="+div);
}

function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

function js(url) {
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = url;
    document.getElementsByTagName('head')[0].appendChild(script);
}

function css(url) {
    var script = document.createElement('style');
    script.type = 'text/css';
    script.src = url;
    document.getElementsByTagName('head')[0].appendChild(script);
}

function div(){
    var iDiv = document.createElement('div');
    iDiv.id = 'div_cocoa_' + (Math.random() * 100000000) ;
    document.getElementsByTagName('body')[0].appendChild(iDiv);
    return iDiv.id;
}

function addDiv(div_class){
    var iDiv = document.createElement('div');
    iDiv.id = 'div_cocoa_' + (Math.random() * 100000000) ;
    iDiv.className = div_class;
    document.getElementsByTagName('body')[0].appendChild(iDiv);
    return iDiv.id;
}

function divClass(div_id , div_class){
    var iDiv = document.createElement('div');
    iDiv.id = div_id ;
    iDiv.className = div_class;
    document.getElementsByTagName('body')[0].appendChild(iDiv);
}

function divNoClass(div_id){
    var iDiv = document.createElement('div');
    iDiv.id = div_id ;
    document.getElementsByTagName('body')[0].appendChild(iDiv);
}


function addCocoa(cmdType){
    
    var id = div();

    var command = 'CMD_SEQ_109109893481551402681324';

    if(cmdType == ''){
       command = '';      
    }else{
       command = 'CMD_SEQ_109109893481551402681324';
    }

    write(id , "/Anaconda.do?CMD=" + command);    

}


function addCocoaInDiv(div_id, cmdType){
    
    var command = 'CMD_SEQ_109109893481551402681324';

    if(cmdType == ''){
       command = '';      
    }else{
       command = 'CMD_SEQ_109109893481551402681324';
    }

    write(div_id , "/Anaconda.do?CMD=" + command);    

}


function anaconda(id, command){
    write(id , "/Anaconda.do?CMD=" + command);    
}

function write(id, url) {
     $.get(url, function(response) {
        // document.write(response);  
        $("#" + id).html(response);
    });

}


function addScratch(){

  var iframe = document.createElement('iframe');
  iframe.id = iframe.name = "iframe_scratch";
  iframe.src = "https://lecture.bestmember.net/microsite/scratch/index.html";
  iframe.width = 1200;
  iframe.height = 800;
  iframe.style.display = "block";
  if (iframe.addEventListener)
      iframe.addEventListener("load", function(evt){
        alert("loaded");
      }, false);
  else
     iframe.attachEvent("onload", function(evt){
        alert("loaded");
      });

  document.getElementsByTagName("body")[0].appendChild(iframe);

}

//----------------------------------------
// Global Event Variables
//----------------------------------------
var isDragging = false;
var eventName = "";
var eventClass = "";
var eventDesc = "";


function refreshScratchInDiv(){
  document.getElementById('iframe_scratch').contentDocument.location.reload(true);
}

function addScratchInDiv(div_id){
  var iframe = document.createElement('iframe');
  iframe.id = iframe.name = "iframe_scratch";
  iframe.src = "https://lecture.bestmember.net/microsite/scratch/index.html";
  iframe.width = 1545;
  iframe.height = 1545;
  iframe.style.frameborder = 0;
  iframe.style.border = 0;
   
  iframe.style.display = "block";

  //  var eventObject = iframe.getElementsByTagName("body")[0];

  document.getElementById(div_id).appendChild(iframe);
  
  iframe.onload = function() {

     
     /*
     var paths = iframe.contentWindow.document.getElementsByTagName("path");
     console.log(paths.length);
     for(var i = 0; i < paths.length; i++){
        paths[i].addEventListener("mouseup", function(evt){
            callEvent("mouseup",evt);
        },true);
     }
     $(this).contents().on("click", function(evt){
         callEvent("click",evt);
     });
     */
     
  }
}

function callEvent(evtName, evt){
   console.log("######## " + evtName + " ########");
   var source = evt.target || evt.srcElement;
   console.log(source.tagName);
   // console.log(source.getAttribute("class"));
   // console.log(source.innerHTML);
   var sourceEventName = source.tagName;
   var sourceEventClass = "";
   var sourceEventDesc = "";

   if(sourceEventName  != 'text'){
      var object = source.getElementsByTagName("text");
      if(object == null || object.length == 0) return;
      sourceEventName = object[0].tagName;
      sourceEventClass = object[0].getAttribute("class");
      sourceEventDesc = object[0].innerHTML;   
   }else{
      sourceEventClass = source.getAttribute("class");
      sourceEventDesc = source.innerHTML;
   }

   if(sourceEventName  == 'text' && sourceEventClass  == 'blocklyText'){
       g_Profile.context.event.isScratch = "true";
       g_Profile.context.event.name = sourceEventDesc ;
       g_Profile.context.event.type = sourceEventClass ;
       g_Profile.context.event.desc = sourceEventName  ;
       console.log("-------------------------------------------");
       console.log( JSON.stringify(g_Profile) );
       console.log(sourceEventName);
       console.log(sourceEventClass);
       console.log(sourceEventDesc);
       console.log("-------------------------------------------");
   }
}



function findIFrames(){
  var iframes = document.getElementsByTagName("iframe");
  if(iframes != null && iframes.length > 0){
     alert("exist");
  }else{
     alert("not exist");    
  }
 /*
   document.getElementById("theiframe").contentWindow.document.body.onclick = function() {
        document.getElementById("theiframe").contentWindow.location.reload();
    }


     var divs = iframe.contentWindow.document.querySelectorAll('canvas');
     divs.forEach(function(div) {
	div.addEventListener('click', iframeEventBubble, {
		capture: false // default 값은 false입니다.
               ,bubble : true

	});
	div.addEventListener('mousedown', iframeEventBubble, {
		capture: false // default 값은 false입니다.
               ,bubble : true
	});
     });

    if (iframe.addEventListener){
      iframe.addEventListener("load", function(evt){
      }, false);
      iframe.addEventListener("mousedown", function(evt){
        alert("click");
        var source = evt.target || evt.srcElement;
        alert(source);
      }, false);
    }else{
     iframe.attachEvent("onload", function(evt){
      });
     iframe.attachEvent("onmousedown", function(evt){
        alert("click");
        var source = evt.target || evt.srcElement;
        alert(source);
      });
    }

 */  
}


function include(url) {
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = url;
    document.getElementsByTagName('head')[0].appendChild(script);
}

function write(url) {
     $.get(url, function(response) {
        console.log("------------------------------");
        console.log(response);
        console.log("------------------------------");
        document.write(response);  
    }, "jsonp");

}

function addCss(contents){
   var style = document.createElement('style');
   style.type = 'text/css';
   style.innerText = contents;
   document.getElementsByTagName('head')[0].appendChild(style);
}


//------------------------------------------------------------
// 채팅 효과 추가
//------------------------------------------------------------
function loadjscssfile(filename, filetype){
    if (filetype=="js"){ //if filename is a external JavaScript file
        var fileref=document.createElement('script')
        fileref.setAttribute("type","text/javascript")
        fileref.setAttribute("src", filename)
    }
    else if (filetype=="css"){ //if filename is an external CSS file
        var fileref=document.createElement("link")
        fileref.setAttribute("rel", "stylesheet")
        fileref.setAttribute("type", "text/css")
        fileref.setAttribute("href", filename)
    }
    if (typeof fileref!="undefined")
        document.getElementsByTagName("head")[0].appendChild(fileref)
}

function smile(c){
   var org = $(c);
   var h = '<i class="twa twa-2x twa-smile">'+org.html()+'</i>';
   org.html(h);
   return h;
}


//------------------------------------------------------------
// Chat Box
//------------------------------------------------------------

document.write('<div  id="chat-window" class="avenue-messenger" style="z-index:10000;display:none">');
document.write('  <div class="menu">');
document.write('   <div class="items"><span>');

document.write('     <a href="javascript:removeMessageAll();" title="Remove"><i class="fas fa-trash-alt"></i></a><br>');
document.write('     <a href="javascript:closeChat();" title="End Chat">&#10005;</a>');
document.write('     </span></div>');
document.write('    <div class="button">...</div>');
document.write('  </div>');
document.write('  <div class="agent-face">');
document.write('    <div class="half" id="DunaApp">');
document.write('     <img class="agent circle" src="/jsp/sp/img/DUNA.jpg" alt="cocoa"></div>');

document.write('  </div>');

document.write('<div class="chat">');
document.write('  <div class="chat-title">');

document.write(' <label class="switch">');
document.write('    <input id="chat-training" type="checkbox">');
document.write('    <span class="slider round"><span class="chat-training-status"></span></span>');
document.write('  </label>');

document.write('  </div>');
document.write('  <div id="chat-message" class="messages">');
document.write('    <div class="messages-content"></div>');
document.write('  </div>');


document.write('  <div class="message-box">');

document.write('    <textarea type="text" class="message-input" placeholder="Please enter..."></textarea>');
document.write('    <button type="submit" class="message-submit">Send</button>');
document.write('  </div>');
document.write('</div>');
document.write('  </div>');

document.write('<div id="floating-button">');
document.write('    <span class="fas fa-comment-dots fa-2x" style="color:white;padding-left:14px;padding-top:14px;" onClick="javascript:showChat();"></span>');
document.write('</div>');


function ajax(u, json, succ, fail){
   $.ajax({
            type : "POST",
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8 ; lang=ko',
            url : u,
            data: json, 
            error : function(e){
                fail(e);
            },
            success : function(d){
                succ(d);
            }
    });
}

//----------------------------------------------------
// 처음 로딩 되는 시점에, 아이피를 가져온다.
//----------------------------------------------------
// (function(window){
$(document).ready(function() {

// include('https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js');

    $.get("https://ipinfo.io", function(response) {
        //console.log("------------------------------");
        //console.log(response);
        //console.log("------------------------------");

        g_Profile.ip = response.ip;
        g_Profile.city = response.city;
        var a = response.loc.split(',');
        g_Profile.x = a[0];
        g_Profile.y = a[1];
    }, "jsonp");

    g_Profile.url = window.location.href;
    g_Profile.lessonViewId = function(){
        var url = g_Profile.url;
        var reg1 = new RegExp("/mod/\\w+/view.php\\?id=(\\d+)");
        var myArray = url.match(reg1);
        if (typeof myArray == "undefined" || myArray == null)
            return null;
        else  
            return myArray[1];
    }();

  // var app = new App(document.getElementById('DunaApp'),document.getElementById('DunaStage'));
  // var timer = callSimulate(document.getElementById('DunaStage'),100);


$("#chat-training").on('click', function() {
 if ( $(this).prop('checked') ) {
    TRAINING = true;
 } else {
    TRAINING = false;
 } 
 changeChatTraining();  // /jsp/lms/chat.jsp
 
});

// })(window);
});


//----------------------------------------------------
// 레거시 아이피 구하는 법 : 사용안함.
//----------------------------------------------------
function getLegacyIP(){
  var head = document.getElementsByTagName('head')[0];
  var script= document.createElement('script');
  window.getIP = function(json) {
    //console.log(json);    
    //head.removeChild(script); // Optional
    g_Profile.ip= json.ip;

  };
  script.type= 'text/javascript';
  script.src= 'https://api.ipify.org?format=jsonp&callback=getIP';
  head.appendChild(script);
}


//----------------------------------------------------
// Feeling Analysis
//----------------------------------------------------
var g_TextHue = 0; /* 0 ~ 360 */
var g_TextSat = 50; /* 0 ~ 100 */
var g_TextLight = 50; /* 0 ~ 100 */
var g_BackHue = 0;  /* 0 ~ 360 */
var g_BackSat = 100; /* 0 ~ 100 */
var g_BackLight = 50; /* 0 ~ 100 */

const LOOKIE = 1;
const EXPERT = 0;
const NORMAL = 2;

const CLEAR = 0;
const AMBIG = 1;

const LIGHT = 0;
const MIDDLE = 1;
const HEAVY = 2;

var USER = NORMAL;
var DIALOG = CLEAR;
var MOOD = LIGHT;

// changeFeeling(NORMAL, CLEAR, HEAVY);

function changeFeeling(u, d , m){

    return ; 
    USER = u;
    DIALOG = d;
    MOOD = m;

    if(USER == LOOKIE) g_BackHue = getRandomInt(0,5) ;  // 열정, 많이 오신분
    else if(USER == EXPERT) g_BackHue = getRandomInt(115,125) ;  // 처움 오신분
    else if(USER == NORMAL) g_BackHue = getRandomInt(235,245) ;  // 중간
    else g_BackHue = getRandomInt(0,5) ; 

    if(DIALOG == CLEAR) g_BackSat = getRandomInt(95,100) ;  // 확실한 대화
    else if(DIALOG == AMBIG) g_BackSat = getRandomInt(0,5) ;  // 모호한 대화
    else g_BackSat = getRandomInt(0,1) ; 
        
    if(MOOD == HEAVY) g_BackLight = getRandomInt(85,90) ;  // 답답하고 무거움
    else if(MOOD == MIDDLE) g_BackLight = getRandomInt(91,95) ;  // 중간
    else if(MOOD == LIGHT) g_BackLight = getRandomInt(100,100) ; // 명쾌하고 , 시원함
    else g_BackLight = getRandomInt(100,100);
    const colVal = "hsl("+g_BackHue+", " + g_BackSat +"%, "+g_BackLight+"%)";
    $("body").css("background-color", colVal);
    // bground.style.setProperty("background-color", colVal);


}

function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function toast(t,msg) {
    switch (t) {
      case 'danger':
        $.toast('<h4>Warning!</h4> ' + msg, {
          sticky: true,
          type: 'danger'
        });
        return;
      case 'info':
        $.toast('<h4>Notice!</h4>  ' + msg, {
          duration: 2000,
          type: 'info'
        });
        return;
      case 'success':
        $.toast('<h4>Success!</h4>  ' + msg, {
          sticky: true,
          type: 'success'
        });
        return;
    }
    $.toast(msg, {
      duration: 2000
    });
  }


var visitorParser = function(config, callback) {

    /********************* Config **********************/
    callback = (callback == undefined ? config : callback);
    var defaultconfig = {
        setUa: navigator.userAgent, // set user-agent string
        getOpt: false, // get all options result of regex
        geoAPI: '//ip-api.com/json' // set url ip geo location apis
    };
    config = (typeof config === 'object' ? config : {});
    config.setUa = (config.setUa == undefined ? defaultconfig.setUa : config.setUa);
    config.getOpt = (config.getOpt == undefined ? defaultconfig.getOpt : config.getOpt);
    config.geoAPI = (config.geoAPI == undefined ? defaultconfig.geoAPI : config.geoAPI);

    /********************* Variable *********************/
    // object regex {match: value}
    var regex = {
        platforms: {
            'windows nt 10.0': {
                'name': 'Windows',
                'version': '10'
            },
            'windows nt 6.3': {
                'name': 'Windows',
                'version': '8.1'
            },
            'windows nt 6.2': {
                'name': 'Windows',
                'version': '8'
            },
            'windows nt 6.1': {
                'name': 'Windows',
                'version': '7'
            },
            'windows nt 6.0': {
                'name': 'Windows',
                'version': 'Vista'
            },
            'windows nt 5.2': {
                'name': 'Windows',
                'version': '2003'
            },
            'windows nt 5.1': {
                'name': 'Windows',
                'version': 'XP'
            },
            'windows nt 5.0': {
                'name': 'Windows',
                'version': '2000'
            },
            'windows nt 4.0': {
                'name': 'Windows',
                'version': 'NT 4.0'
            },
            'winnt4.0': {
                'name': 'Windows',
                'version': 'NT 4.0'
            },
            'winnt 4.0': {
                'name': 'Windows',
                'version': 'NT'
            },
            'winnt': {
                'name': 'Windows',
                'version': 'NT'
            },
            'windows 98': {
                'name': 'Windows',
                'version': '98'
            },
            'win98': {
                'name': 'Windows',
                'version': '98'
            },
            'windows 95': {
                'name': 'Windows',
                'version': '95'
            },
            'win95': {
                'name': 'Windows',
                'version': '95'
            },
            'windows phone': {
                'name': 'Windows',
                'version': 'Phone'
            },
            'windows ce': {
                'name': 'Windows',
                'version': 'CE'
            },
            'windows m': {
                'name': 'Windows',
                'version': 'Mobile'
            },
            'android': 'Android',
            'blackberry': 'BlackBerry',
            'iphone.*OS': 'iOS',
            'ipad.*OS': 'iOS',
            'ipod.*OS': 'iOS',
            'os x': 'Mac OS X',
            'ppc mac': 'Power PC Mac',
            'freebsd': 'FreeBSD',
            'ppc': 'Macintosh',
            'Ubuntu': 'Ubuntu',
            'Mint': 'Mint',
            'debian': 'Debian',
            'sunos': 'Sun Solaris',
            'beos': 'BeOS',
            'apachebench': 'ApacheBench',
            'aix': 'AIX',
            'irix': 'Irix',
            'osf': 'DEC OSF',
            'hp-ux': 'HP-UX',
            'netbsd': 'NetBSD',
            'bsdi': 'BSDi',
            'openbsd': 'OpenBSD',
            'symbian': 'Symbian OS',
            'SymbianOS': 'Symbian OS',
            'series60': 'Symbian S60',
            'SymbOS': 'Symbian OS',
            'gnu': 'GNU/Linux',
            'unix': 'Unknown Unix OS',
            'linux': 'Linux'
        },
        browsers: {
            'obigo': 'Obigo',
            'netfront': 'Netfront Browser',
            'openwave': 'Openwave Browser',
            'mobilexplorer': 'Mobile Explorer',
            'operamini': 'Opera Mini',
            'opera mini': 'Opera Mini',
            'opera mobi': 'Opera Mobile',
            'fennec': 'Firefox Mobile',
            'xiino': 'Xiino',
            'OPR': 'Opera',
            'Flock': 'Flock',
            'Edge': 'Spartan',
            'Chrome': 'Chrome',
            'CrMo': 'Chrome',
            'Chromium': 'Chromium',
            'silk': 'Silk',
            'android.* version': 'Android Browser',
            'Opera.*?Version': 'Opera',
            'Opera': 'Opera',
            'Skyfire': 'Skyfire',
            'SlimBrowser': 'SlimBrowser',
            'UCBrowser': 'UC Browser',
            'Tizen Browser': 'Tizen',
            'RockMelt': 'RockMelt',
            'Polaris': 'Polaris',
            'MSIE': 'Internet Explorer',
            'Internet Explorer': 'Internet Explorer',
            'Trident.* rv': 'Internet Explorer',
            'Shiira': 'Shiira',
            'Firefox': 'Firefox',
            'Chimera': 'Chimera',
            'Phoenix': 'Phoenix',
            'Firebird': 'Firebird',
            'Camino': 'Camino',
            'Netscape': 'Netscape',
            'OmniWeb': 'OmniWeb',
            'Konqueror': 'Konqueror',
            'icab': 'iCab',
            'Lynx': 'Lynx',
            'Links': 'Links',
            'hotjava': 'HotJava',
            'amaya': 'Amaya',
            'IBrowse': 'IBrowse',
            'Maxthon': 'Maxthon',
            'Safari': 'Safari',
            'Mozilla': 'Mozilla'
        },
        engines: {
            'presto/': 'Presto',
            'applewebKit/': 'AppleWebKit',
            'trident/': 'Trident',
            'netfront/': 'Netfront',
            'netsurf/': 'Netsurf',
            'amaya/': 'Amaya',
            'lynx/': 'Lynx',
            'w3m/': 'W3m',
            'khtml/': 'Khtml',
            'tasman/': 'Tasman',
            'links/': 'Links',
            'icab/': 'Icab',
            'gecko/': 'Gecko'
        },
        processors: {
            'x(?:86|64|32)': 'x',
            'amd(?:86|64|32)': 'x',
            'i6(?:86|64|32)': 'x',
            'ia(?:86|64|32)': 'x',
            'sun4(?:86|64|32)': 'x',
            'wow(?:86|64|32)': 'x',
            'win(?:86|64|32)': 'x',
            'ppc(?:86|64|32)': 'x',
            'powerpc(?:86|64|32)': 'x',
            'avr(?:86|64|32)': 'x',
            'arm(?:86|64|32)': 'x',
            'irix(?:86|64|32)': 'x',
            'mips(?:86|64|32)': 'x',
            'sparc(?:86|64|32)': 'x'
        },
        mobiles: {
            'microsoft': 'Microsoft',
            'xbox': 'Microsoft',
            'kin.': 'Microsoft',
            'Galaxy nexus': 'Samsung Galaxy Nexus',
            'motorola': 'Motorola',
            'geeksphone': 'GeeksPhone',
            'huawei': 'Huawei',
            'lenovo': 'Lenovo',
            'nexian': 'Nexian',
            'sprint': {
                'name': 'Sprint',
                'version': 'Phones'
            },
            'Ouya': 'Ouya',
            'asus': 'Asus',
            'nokia': 'Nokia',
            'maemo': 'Nokia',
            'palm': 'Palm',
            'elaine': 'Palm',
            'iphone': {
                'name': 'Apple',
                'version': 'iPhone'
            },
            'ipad': 'iPad',
            'ipod': {
                'name': 'Apple',
                'version': 'iPod Touch'
            },
            'sony': 'Sony Ericsson',
            'ericsson': 'Sony Ericsson',
            'blackberry': 'BlackBerry',
            'cocoon': {
                'name': 'O2',
                'version': 'Cocoon'
            },
            'blazer': 'Treo',
            'lg': 'LG',
            'amoi': 'Amoi',
            'xda': 'XDA',
            'mda': 'MDA',
            'vario': 'Vario',
            'htc': 'HTC',
            'GT-': 'Samsung Galaxy',
            'Galaxy': 'Samsung Galaxy',
            'samsung': 'Samsung',
            'sharp': 'Sharp',
            'dtv': 'Sharp',
            'sie-': 'Siemens',
            'alcatel': 'Alcatel',
            'hbbtv': 'HbbTV',
            'benq': 'BenQ',
            'ipaq': {
                'name': 'O2',
                'version': 'iPaq'
            },
            'mot-': 'Motorola',
            'milestone': 'Motorola',
            'playstation portable': {
                'name': 'PlayStation',
                'version': 'Portable'
            },
            'playstation 3': {
                'name': 'PlayStation',
                'version': '3'
            },
            'playstation vita': {
                'name': 'PlayStation',
                'version': 'Vita'
            },
            'hiptop': {
                'name': 'Danger',
                'version': 'Hiptop'
            },
            'nec-': 'NEC',
            'panasonic': 'Panasonic',
            'philips': 'Philips',
            'sagem': 'Sagem',
            'sanyo': 'Sanyo',
            'spv': 'SPV',
            'zte': 'ZTE',
            'sendo': 'Sendo',
            'nintendo dsi': {
                'name': 'Nintendo',
                'version': 'DSi'
            },
            'nintendo ds': {
                'name': 'Nintendo',
                'version': 'DS'
            },
            'nintendo 3ds': {
                'name': 'Nintendo',
                'version': '3DS'
            },
            'wii': {
                'name': 'Nintendo',
                'version': 'Wii'
            },
            'open web': 'Open Web',
            'openweb': 'OpenWeb',
            'pebble': 'Pebble',
            'jolla': 'Jolla',
            'ideatab': 'Lenovo',
            'dell': 'Dell',
            'hp': 'HP',
            'Nook': 'Nook',
            'Kindle': 'Kindle',
            'Archos': 'Archos',
            'Apple ': 'Apple',
            'playbook': 'Playbook'
        },
        robots: {
            'googlebot': 'Googlebot',
            'msnbot': 'MSNBot',
            'baiduspider': 'Baiduspider',
            'bingbot': 'Bing',
            'slurp': 'Inktomi Slurp',
            'yahoo': 'Yahoo',
            'askjeeves': 'AskJeeves',
            'fastcrawler': 'FastCrawler',
            'infoseek': 'InfoSeek Robot 1.0',
            'lycos': 'Lycos',
            'yandex': 'YandexBot',
            'mediapartners-google': 'MediaPartners Google',
            'CRAZYWEBCRAWLER': 'Crazy Webcrawler',
            'adsbot-google': 'AdsBot Google',
            'feedfetcher-google': 'Feedfetcher Google',
            'curious george': 'Curious George'
        }
    };

    // data to output
    var platform = preg_match(regex.platforms, true), // get platform info. regex and return array object
        browser = preg_match(regex.browsers, true), // get browser info. regex and return array object
        engine = preg_match(regex.engines, true), // get engine info. regex and return array object
        processor = preg_match(regex.processors), // get processor info. regex and return array object
        mobile = preg_match(regex.mobiles), // get mobile info. regex and return array object
        robot = preg_match(regex.robots), // get robot info. regex and return array object
        resolution = { // get resolution info. object width & height
            'width': window.innerWidth || document.body.clientWidth,
            'height': window.innerHeight || document.body.clientHeight
        },
        date = new Date(), // get date
        referring = uri(); // get url referrer info. string
	
	// Get json geo location
	var xhttp = new XMLHttpRequest();
	xhttp.onload = function () {
		if (xhttp.readyState === 4) {
			if (xhttp.status === 200) {
				callback(getInfo(xhttp.responseText));
			} else {
				callback(getInfo(false));
			}
		}
	};
	xhttp.onerror = function () {
		callback(getInfo(false));
	};
        //skip
	//xhttp.open("GET", config.geoAPI, true);
	//xhttp.send(); 

    /********************* Function *********************/
    function getUa() {
        var res = {};
        if (config.getOpt) {
            res = {
                'platform': platform,
                'browser': browser,
                'resolution': resolution,
                'engine': engine,
                'processor': processor,
                'mobile': mobile,
                'robot': robot,
                'date': date,
                'referring': referring
            };
        } else {
            // change array object to object
            res = {
                'platform': (platform.length > 0 ? (typeof platform === 'object' ? platform[0] : platform) : {
                    'name': ''
                }),
                'browser': (browser.length > 0 ? (typeof browser === 'object' ? browser[0] : browser) : {
                    'name': ''
                }),
                'resolution': resolution,
                'engine': (engine.length > 0 ? (typeof engine === 'object' ? engine[0] : engine) : {
                    'name': ''
                }),
                'processor': (processor.length > 0 ? (typeof processor === 'object' ? processor[0] : processor) : {
                    'name': ''
                }),
                'mobile': (mobile.length > 0 ? (typeof mobile === 'object' ? mobile[0] : mobile) : {
                    'name': ''
                }),
                'robot': (robot.length > 0 ? (typeof robot === 'object' ? robot[0] : robot) : {
                    'name': ''
                }),
                'date': date,
                'referring': referring
            };
        }
        return res;
    }

    // regex. find name & version. preg_match(name, version)
    function preg_match(a, b) {
        var c = [],
            oj = {};
        for (var k in a) {
            var d = '';
            if (a.hasOwnProperty(k)) {
                var e = new RegExp(k, 'i');
                if (e.test(config.setUa)) {
                    if (typeof a[k] === 'object') {
                        oj = {
                            'name': a[k].name,
                            'version': a[k].version
                        };
                    } else if (a[k] != 'x') {
                        if (b) {
                            var ck = '[0-9\.\_\-]+';
                            var f1 = new RegExp(k + ck, 'i');
                            var f2 = new RegExp(k + '/' + ck, 'i');
                            var f3 = new RegExp(k + '-' + ck, 'i');
                            var f4 = new RegExp(k + ' ' + ck, 'i');
                            if (f1.test(config.setUa)) {
                                var g = new RegExp(ck, 'ig');
                                var tt = config.setUa.match(f1)[0].match(g).length - 1;
                                d = config.setUa.match(f1)[0].match(g)[tt].replace('/', '').replace(/\_/g, '.').replace(/\-/g, '.')
                            } else if (f2.test(config.setUa)) {
                                var g = new RegExp('/' + ck, 'ig');
                                var tt = config.setUa.match(f2)[0].match(g).length - 1;
                                d = config.setUa.match(f2)[0].match(g)[tt].replace('/', '').replace(/\_/g, '.').replace(/\-/g, '.')
                            } else if (f3.test(config.setUa)) {
                                var tt = config.setUa.match(f3)[0].match(g).length - 1;
                                var g = new RegExp('-' + ck, 'ig');
                                d = config.setUa.match(f3)[0].match(g)[tt].replace('-', '').replace(/\_/g, '.').replace(/\-/g, '.')
                            } else if (f4.test(config.setUa)) {
                                var tt = config.setUa.match(f4)[0].match(g).length - 1;
                                var g = new RegExp(' ' + ck, 'ig');
                                d = config.setUa.match(f4)[0].match(g)[tt].replace(' ', '').replace(/\_/g, '.').replace(/\-/g, '.')
                            }
                        }
                        (d != '' ? oj = {
                            'name': a[k],
                            'version': d
                        } : oj = {
                            'name': a[k]
                        });

                    } else {
                        oj = {
                            'name': config.setUa.match(e)[0]
                        };
                    }
                    c.push(oj);
                }
            }
        }
        return c
    }

    // get url referer & parser hostname
    function uri() {
        var parser = document.createElement('a');
        parser.href = document.referrer;
        var domain = (document.referrer != '' ? parser.hostname : '');
        return {
            'url': document.referrer,
            'host': domain
        };
    }

    function getInfo(text) {
        var parser = {
            'ip': '',
            'provider': '',
            'city': '',
            'lat': '',
            'lon': '',
            'country': '',
            'country_code': '',
            'region': '',
            'region_code': '',
            'timezone': '',
            'zip': ''
        };
		if(text && /^[\],:{}\s]*$/.test(text.replace(/\\["\\\/bfnrtu]/g, '@').replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']').replace(/(?:^|:|,)(?:\s*\[)+/g, ''))){
			var json = JSON.parse(text);
			for (var key in json) {
				if (/lat/ig.test(key)) {
					parser.lat = json[key];
				} else if (/lon/ig.test(key)) {
					parser.lon = json[key];
				} else if (/country/ig.test(key)) {
					if (json[key].length > 2) {
						parser.country = json[key];
					} else {
						parser.country_code = json[key];
					}
				} else if (/region/ig.test(key)) {
					if (json[key].length > 2) {
						parser.region = json[key];
					} else {
						parser.region_code = json[key];
					}
				} else if (/city/ig.test(key)) {
					parser.city = json[key];
				} else if (/zone/ig.test(key)) {
					parser.timezone = json[key];
				} else if (/[0-9]{1,3}(\.[0-9]{1,3}){3}/ig.test(json[key])) {
					parser.ip = json[key];
				} else if (/zip/ig.test(key)) {
					parser.zip = json[key];
				} else if (/org/ig.test(key) || /isp/ig.test(key)) {
					parser.provider = json[key];
				}
			}
		}
        var visitor = {
			'uas': config.setUa,
			'parser': {
				'geo': parser,
				'ua': getUa()
			}
        };
        return visitor;
    }

}




var visitor = {};
(function() {
        var BrowserDetect ={
                            init: function () {
                                this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
                                this.version = this.searchVersion(navigator.userAgent) || this.searchVersion(navigator.appVersion) || "an unknown version";
                                this.OS = this.searchString(this.dataOS) || "an unknown OS"
                            },
                            searchString: function (data) {
                                for (var i = 0; i < data.length; i++) {
                                    var dataString = data[i].string;
                                    var dataProp = data[i].prop;
                                    this.versionSearchString = data[i].versionSearch || data[i].identity;
                                    if (dataString) {
                                        if (dataString.indexOf(data[i].subString) != -1) {
                                            return data[i].identity
                                        }
                                    } else {
                                        if (dataProp) {
                                            return data[i].identity
                                        }
                                    }
                                }
                            },
                            searchVersion: function (dataString) {
                                var index = dataString.indexOf(this.versionSearchString);
                                if (index == -1) {
                                    return
                                }
                                return parseFloat(dataString.substring(index + this.versionSearchString.length + 1))
                            },
                            dataBrowser: [{
                                string: navigator.userAgent,
                                subString: "Chrome",
                                identity: "Chrome"
                            }, {
                                string: navigator.userAgent,
                                subString: "OmniWeb",
                                versionSearch: "OmniWeb/",
                                identity: "OmniWeb"
                            }, {
                                string: navigator.vendor,
                                subString: "Apple",
                                identity: "Safari",
                                versionSearch: "Version"
                            }, {
                                prop: window.opera,
                                identity: "Opera"
                            }, {
                                string: navigator.vendor,
                                subString: "iCab",
                                identity: "iCab"
                            }, {
                                string: navigator.vendor,
                                subString: "KDE",
                                identity: "Konqueror"
                            }, {
                                string: navigator.userAgent,
                                subString: "Firefox",
                                identity: "Firefox"
                            }, {
                                string: navigator.vendor,
                                subString: "Camino",
                                identity: "Camino"
                            }, {
                                string: navigator.userAgent,
                                subString: "Netscape",
                                identity: "Netscape"
                            }, {
                                string: navigator.userAgent,
                                subString: "MSIE",
                                identity: "Explorer",
                                versionSearch: "MSIE"
                            }, {
                                string: navigator.userAgent,
                                subString: "Gecko",
                                identity: "Mozilla",
                                versionSearch: "rv"
                            }, {
                                string: navigator.userAgent,
                                subString: "Mozilla",
                                identity: "Netscape",
                                versionSearch: "Mozilla"
                            }],
                            dataOS: [{
                                string: navigator.platform,
                                subString: "Win",
                                identity: "Windows"
                            }, {
                                string: navigator.platform,
                                subString: "Mac",
                                identity: "Mac"
                            }, {
                                string: navigator.userAgent,
                                subString: "iPhone",
                                identity: "iPhone/iPod"
                            }, {
                                string: navigator.userAgent,
                                subString: "Android",
                                identity: "Android"
                            }, {
                                string: navigator.platform,
                                subString: "Linux",
                                identity: "Linux"
                            }]
        };  // end of browser detect
        BrowserDetect.init();
        var loadscript = function(url,callback) {    
            var script = document.createElement('script');
            script.type = 'text/javascript';
            if(script.readyState) { //IE
                script.onreadystatechange = function() {
                    if(script.readyState == 'loaded' || script.readyState == 'complete') {
                        script.onreadystatechange = null;
                        callback();
                    }
                };
            } else { //Others
                script.onload = function() {
                    callback();
                };
            }
            script.src = url;
            document.getElementsByTagName('head')[0].appendChild(script);
        }; //end of loadscript

        var setCookie = function (name, value, expires, path, domain, secure) {
            var today = new Date();
            today.setTime(today.getTime());
            if (expires) {
                expires = expires * 1000 * 60 * 60 * 24
            }
            var expires_date = new Date(today.getTime() + (expires));
            document.cookie = name + "=" + encodeURIComponent(value) + ((expires) ? ";expires=" + expires_date.toGMTString() : "") + ((path) ? ";path=" + path : "") + ((domain) ? ";domain=" + domain : "") + ((secure) ? ";secure" : "")
        };

        var getCookie = function (check_name) {
            var cookies = document.cookie.split(";");
            var temp_cookie = "";
            var cookie_name = "";
            var cookie_value = "";
            var cookie_found = false;
            for (i = 0; i < cookies.length; i++) {
                temp_cookie = cookies[i].split("=");
                cookie_name = temp_cookie[0].replace(/^\s+|\s+$/g, "");
                if (cookie_name == check_name) {
                    cookie_found = true;
                    if (temp_cookie.length > 1) {
                        cookie_value = decodeURIComponent(temp_cookie[1].replace(/^\s+|\s+$/g, ""))
                    }
                    break;
                }
            }
            if (!cookie_found) {
                return null
            } else {
                return cookie_value;
            }
        };

        var load_visitor_session = function () {
            var visitor_cookie = getCookie('visitor');
            if(visitor_cookie) {
                var values = visitor_cookie.split("__");
                var count = +values[0];
                cookieVal = (count+1) + "__" + values[1];
                setCookie("visitor", cookieVal, 99999, "/", "", "");
                visitor.count = count;
                visitor.first_visit_on = values[1];
                visitor.current_visit_on = new Date().toString();
            } else {
                var curr_date = new Date().toString();
                cookieVal = "1__" + curr_date;
                setCookie("visitor", cookieVal, 99999, "/", "", "");
                visitor.count = 1;
                visitor.first_visit_on = curr_date;
                visitor.current_visit_on = visitor.first_visit;
            }
        };
        
            visitor.browser_name = BrowserDetect.browser;
            visitor.browser_version = BrowserDetect.version;
            visitor.browser_engine = navigator.product;
            visitor.os = BrowserDetect.OS;
            visitor.screen_resolution = screen.width+'x'+screen.height;
            visitor.screen_width = screen.width;
            visitor.screen_height = screen.height;
            visitor.referrer = document.referrer;
            visitor.url = window.location.href;
            visitor.language = navigator.language; 

        /* load geoip script and expose data through visitor object */
        /*
        loadscript('http://j.maxmind.com/app/geoip.js', function(){
            visitor.browser_name = BrowserDetect.browser;
            visitor.browser_version = BrowserDetect.version;
            visitor.browser_engine = navigator.product;
            visitor.os = BrowserDetect.OS;
            visitor.screen_resolution = screen.width+'x'+screen.height;
            visitor.screen_width = screen.width;
            visitor.screen_height = screen.height;
            visitor.referrer = document.referrer;
            visitor.url = window.location.href;
            visitor.language = navigator.language; 
            visitor.country_code = geoip_country_code();
            visitor.country_name = geoip_country_name();
            visitor.city = geoip_city();
            visitor.region = geoip_region();
            visitor.region_name = geoip_region_name();
            visitor.latitude = geoip_latitude();
            visitor.longitude = geoip_longitude();
            visitor.postal_code = geoip_postal_code();
            load_visitor_session();
        }); 
        */ 

}) ();



function simulate(element, eventName)
{
   var eventMatchers = {
      'HTMLEvents': /^(?:load|unload|abort|error|select|change|submit|reset|focus|blur|resize|scroll)$/,
      'MouseEvents': /^(?:click|dblclick|mouse(?:down|up|over|move|out))$/
   }
   var defaultOptions = {
    pointerX: 0,
    pointerY: 0,
    button: 0,
    ctrlKey: false,
    altKey: false,
    shiftKey: false,
    metaKey: false,
    bubbles: false,
    cancelable: true
   }
    var options = extend(defaultOptions, arguments[2] || {});
    var oEvent, eventType = null;
     console.log(eventMatchers);
    for (var name in eventMatchers){
        console.log("matcher name : " + name);
        console.log("simulate event name : " + eventName);
        if (eventMatchers[name].test(eventName)) { 
              eventType = name; break; 
        }
    }

    if (!eventType){
        throw new SyntaxError('Only HTMLEvents and MouseEvents interfaces are supported');
    }

    if (document.createEvent)
    {
        oEvent = document.createEvent(eventType);
        if (eventType == 'HTMLEvents')
        {
            oEvent.initEvent(eventName, options.bubbles, options.cancelable);
        }
        else
        {
            console.log('Not HTMLEvents : ' + eventName);
            oEvent.initMouseEvent(eventName, options.bubbles, options.cancelable , document.defaultView, options.button, options.pointerX, options.pointerY, options.pointerX, options.pointerY, options.ctrlKey, options.altKey, options.shiftKey, options.metaKey, options.button, element);
            // oEvent.initMouseEvent(eventName, bubble, cancel , document.defaultView, 0, 0, 0, 80, 20, false, false, false, false, 0, element);
            // oEvent.initMouseEvent(eventName, true, true, document.defaultView , 0, 0, 0, 80, 20, false, false, false, false, 0, element);
        }
        element.dispatchEvent(oEvent);
        console.log('CreateEvent : ' + options.pointerX);
    }
    else
    {
        options.clientX = options.pointerX;
        options.clientY = options.pointerY;
        var evt = document.createEventObject();
        oEvent = extend(evt, options);
        element.fireEvent('on' + eventName, oEvent);
        console.log('Not createEvent : ' + options.pointerX);
    }
    return element;
}

function extend(destination, source) {
    for (var property in source){
      if(destination  != null && destination && destination.hasOwnProperty(property)) destination[property] = source[property];
    }
    return destination;
}




function getDunaRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function simulateByInterval(stage){
    var x = getDunaRandomInt(1,500);
    var y = getDunaRandomInt(1,600);
    simulate(stage, "mousemove", { pointerX: x , pointerY: y });  
    console.log('mouse event in ' + x + ',' + y);
}

function startSimulate(){
   simulateByInterval(document.getElementById('chat-message'));
}

function callSimulate(term){
   return setInterval(startSimulate, term);
}

//----------------------------------------
// 클라이언트 프로파일 변수
//----------------------------------------

var timerWeather;
var g_webSocket;
var g_All_show = true;

function collect(){

    g_Profile.clickGap = tGap();
    var dfp = tFP();
    setCookie('DFP',dfp,1); 
    g_Profile.context.device.fingerPrint = dfp; 

    g_Profile.context.device.os = visitor.os; 
    g_Profile.context.device.browser = visitor.browser_name;
    g_Profile.context.device.browserVersion = visitor.browser_version;
    g_Profile.context.device.engine = visitor.browser_engine;
    g_Profile.context.device.refUrl = visitor.referrer;
    g_Profile.context.device.resolutionW = visitor.screen_width;
    g_Profile.context.device.resolutionH = visitor.screen_height;
  
    visitorParser(function(data) {
      g_Profile.context.device.os = data.parser.ua.platform; 
      g_Profile.context.device.browser = data.parser.ua.browser.name;
      g_Profile.context.device.browserVersion = data.parser.ua.browser.version;
      g_Profile.context.device.engine = data.parser.ua.engine.name;
      g_Profile.context.device.engineVersion = data.parser.ua.engine.version;
      g_Profile.context.device.cpu = data.parser.ua.processor.name;
      g_Profile.context.device.refHost = data.parser.ua.referring.host;
      g_Profile.context.device.refUrl = data.parser.ua.referring.url;
      g_Profile.context.device.resolutionW = data.parser.ua.resolution.width;
      g_Profile.context.device.resolutionH = data.parser.ua.resolution.height;
      g_Profile.context.device.robot = data.parser.ua.robot.name;
    });

    g_Profile.context.environment = getEnvironment();

  
}

//----------------------------------------
// 코칭 로봇과 대화 하기
//----------------------------------------
var retryWebSocketCount = 0;
var WEBSOCKET_IP = window.location.hostname;
function initWebSocket(){
  var p = window.location.protocol;
  var protocol =  p == 'https' ? "wss" : "ws";
  var port = p == 'https' ? "9080" : "9081";
  var host = window.location.hostname;
  var wsocket = '<%=wsocket%>';
  g_webSocket = new WebSocket(wsocket);

  g_webSocket.onopen = function (event) {
           var msg = {msgType : "DUNA.SAAS" 
                  , container : "WebSocketContainer" 
                  , channelId : g_Profile.clientId
                  , clientId : g_Profile.clientId
                  , secretKey : g_Profile.secretKey
                  , ServiceName:'chat'
                  , MY_THOUGHT : 'init'
                  , message : "OPEN" 
                  , requestType : "INIT"
                  , dfp : g_Profile.dfp };
          g_webSocket.send(JSON.stringify(msg)); 
  };
  g_webSocket.onmessage = function (event) {
        var s = localStorage.getItem('chat-message');
        if(!event || !event.data || event.data == '') return;
        var json = JSON.parse(event.data);
        
        var contents = "";
        if(g_All_show){
          if(json.contents_list && json.contents_list.length && json.contents_list.length > 0 && json.contents_list[0] && json.contents_list[0].contents ){
              for(var i = 0 ; i < json.contents_list.length ; i++){
                 console.log("before : " + json.contents_list[i].contents);
                 var msg = json.contents_list[i].contents.replace(/%22/g,"\"");
                 var msg = msg.replace(/&quot;/g,"\"");
                 console.log("after : " + msg);
                 fakeMessagePlus(msg);
              }
          } 
/*
          if(json.Sticker != null && json.Sticker != undefined && json.Sticker.indexOf('https:') >= 0){
              fakeImagePlus(json.Sticker);
          }
*/
        }else{
          if(json.contents_list && json.contents_list.length && json.contents_list.length > 0 && json.contents_list[0].contents ){
              fakeMessagePlus(json.contents_list[(Math.floor(Math.random() * ((json.contents_list.length-1) - 0 + 1)) + 0)].contents);
          }else{ 
/*
              if(json.Sticker != null && json.Sticker != undefined && json.Sticker.indexOf('https:') >= 0){
                  fakeImagePlus(json.Sticker);
              }
*/
          }
        }
  };
  g_webSocket.onclose = function(){
      reconnectWebScoket()
  };
}

function sleep(){
    sleepFor((Math.random() * 20) * 50);
}
function sleepFor( sleepDuration ){
    var now = new Date().getTime();
    while(new Date().getTime() < now + sleepDuration){ /* do nothing */ } 
}

function reconnectWebScoket(){
    if(!g_webSocket || g_webSocket.readyState == 3) initWebSocket();
}

function getBotMessage(type, msg){
    if(type != null) g_Profile.msgType = type;
    else  g_Profile.msgType = "DUNA.SAAS";
    g_Profile.MY_THOUGHT = msg ;

    try{
       g_webSocket.send(JSON.stringify(g_Profile)); 
    }catch(e){
       console.log(e);
       initWebSocket();
       g_webSocket.send(JSON.stringify(g_Profile)); 
    }  

    storeMyMessage(msg);
}



//----------------------------------------
// 특정 일자 가져오기(공휴일, 잡일)
//----------------------------------------
function getSpecDate(){

var u = 'https://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getHoliDeInfo'; /*URL*/
var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'LvRQaevXlDKQkkvu%2Bgn590KMx66bn%2B9U4gDv%2FsM3QTymV55oXirAnkir8vib1Zk9JGnJoH1m71YAafOH3bgKOA%3D%3D'; /*Service Key*/
queryParams += '&' + encodeURIComponent('solYear') + '=' + encodeURIComponent('2019'); /*연*/
queryParams += '&' + encodeURIComponent('solMonth') + '=' + encodeURIComponent('01'); /*월*/
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
queryParams += '&' + encodeURIComponent('totalCount') + '=' + encodeURIComponent('30'); /**/
// contentType: 'application/x-www-form-urlencoded; charset=UTF-8 ; lang=ko',

ajax(u + queryParams, '' , function(d){
                fakeMessage();
            },
            function(d){
                if(d.ChatMessage == null || d.ChatMessage == undefined){
                    fakeMessagePlus('죄송합니다. 고객님에 대해서 분석한 결과가 없습니다.');  
                }else{   
                    fakeMessagePlus(d.ChatMessage);
                }
               if(d.Sticker != null && d.Sticker != undefined){
                    fakeMessagePlus(d.Sticker);
                }
            }
      );

}




//----------------------------------------
// 바디에서 발생하는 마우스 클릭 이벤트 발생시, 서버로 전송한다.
//----------------------------------------
$('body').on('click', function(e) {
   collect();
});

//----------------------------------------
// 바디에서 발생하는 마우스 Move 이벤트 발생시, 서버로 전송한다.
//----------------------------------------
$('body').on('mousemove', function(e) {
  // console.log(e.pageX +', '+ e.pageY);
});


//---------------------------------------
// Profiling....
//---------------------------------------
function tFP(){
   var fp = localStorage.getItem('finger-print');
   if(fp == undefined || fp == ''){
      var client = new ClientJS();
      var fingerprint = client.getFingerprint();
      localStorage.setItem('finger-print' , fingerprint);
      return fingerprint;
   }else{
      return fp;
   }
}

function tGap(){
   var ct = getCurrentTime();
   var c = localStorage.getItem('click-time');
   localStorage.setItem('click-time' , ct);
   if(c == undefined || c == ''){
      return -1;
   }else{
      return ct - c;
   }
}

function getCurrentTime(){
   return new Date().getTime();
}







var lunarMonthTable = [
[2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2],
[1, 2, 1, 1, 2, 1, 2, 5, 2, 2, 1, 2],
[1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1],   /* 1901 */
[2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2],
[1, 2, 1, 2, 3, 2, 1, 1, 2, 2, 1, 2],
[2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1],
[2, 2, 1, 2, 2, 1, 1, 2, 1, 2, 1, 2],
[1, 2, 2, 4, 1, 2, 1, 2, 1, 2, 1, 2],
[1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1],
[2, 1, 1, 2, 2, 1, 2, 1, 2, 2, 1, 2],
[1, 5, 1, 2, 1, 2, 1, 2, 2, 2, 1, 2],
[1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1],
[2, 1, 2, 1, 1, 5, 1, 2, 2, 1, 2, 2],   /* 1911 */
[2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2],
[2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2],
[2, 2, 1, 2, 5, 1, 2, 1, 2, 1, 1, 2],
[2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2],
[1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1],
[2, 3, 2, 1, 2, 2, 1, 2, 2, 1, 2, 1],
[2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1, 2],
[1, 2, 1, 1, 2, 1, 5, 2, 2, 1, 2, 2],
[1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2],
[2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2],   /* 1921 */
[2, 1, 2, 2, 3, 2, 1, 1, 2, 1, 2, 2],
[1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 1, 2],
[2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 1],
[2, 1, 2, 5, 2, 1, 2, 2, 1, 2, 1, 2],
[1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1],
[2, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2],
[1, 5, 1, 2, 1, 1, 2, 2, 1, 2, 2, 2],
[1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2],
[1, 2, 2, 1, 1, 5, 1, 2, 1, 2, 2, 1],
[2, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 1],   /* 1931 */
[2, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2],
[1, 2, 2, 1, 6, 1, 2, 1, 2, 1, 1, 2],
[1, 2, 1, 2, 2, 1, 2, 2, 1, 2, 1, 2],
[1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1],
[2, 1, 4, 1, 2, 1, 2, 1, 2, 2, 2, 1],
[2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1],
[2, 2, 1, 1, 2, 1, 4, 1, 2, 2, 1, 2],
[2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 1, 2],
[2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1],
[2, 2, 1, 2, 2, 4, 1, 1, 2, 1, 2, 1],   /* 1941 */
[2, 1, 2, 2, 1, 2, 2, 1, 2, 1, 1, 2],
[1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2],
[1, 1, 2, 4, 1, 2, 1, 2, 2, 1, 2, 2],
[1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1, 2],
[2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2],
[2, 5, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2],
[2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
[2, 2, 1, 2, 1, 2, 3, 2, 1, 2, 1, 2],
[2, 1, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1],
[2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2],   /* 1951 */
[1, 2, 1, 2, 4, 2, 1, 2, 1, 2, 1, 2],
[1, 2, 1, 1, 2, 2, 1, 2, 2, 1, 2, 2],
[1, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2],
[2, 1, 4, 1, 1, 2, 1, 2, 1, 2, 2, 2],
[1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2],
[2, 1, 2, 1, 2, 1, 1, 5, 2, 1, 2, 2],
[1, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
[1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1],
[2, 1, 2, 1, 2, 5, 2, 1, 2, 1, 2, 1],
[2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2],   /* 1961 */
[1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1],
[2, 1, 2, 3, 2, 1, 2, 1, 2, 2, 2, 1],
[2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2],
[1, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 2],
[1, 2, 5, 2, 1, 1, 2, 1, 1, 2, 2, 1],
[2, 2, 1, 2, 2, 1, 1, 2, 1, 2, 1, 2],
[1, 2, 2, 1, 2, 1, 5, 2, 1, 2, 1, 2],
[1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1],
[2, 1, 1, 2, 2, 1, 2, 1, 2, 2, 1, 2],
[1, 2, 1, 1, 5, 2, 1, 2, 2, 2, 1, 2],   /* 1971 */
[1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1],
[2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 2, 1],
[2, 2, 1, 5, 1, 2, 1, 1, 2, 2, 1, 2],
[2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2],
[2, 2, 1, 2, 1, 2, 1, 5, 2, 1, 1, 2],
[2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 1],
[2, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1],
[2, 1, 1, 2, 1, 6, 1, 2, 2, 1, 2, 1],
[2, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2],
[1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2],   /* 1981 */
[2, 1, 2, 3, 2, 1, 1, 2, 2, 1, 2, 2],
[2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2],
[2, 1, 2, 2, 1, 1, 2, 1, 1, 5, 2, 2],
[1, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2],
[1, 2, 2, 1, 2, 2, 1, 2, 1, 2, 1, 1],
[2, 1, 2, 2, 1, 5, 2, 2, 1, 2, 1, 2],
[1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1],
[2, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2],
[1, 2, 1, 1, 5, 1, 2, 1, 2, 2, 2, 2],
[1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2],   /* 1991 */
[1, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2],
[1, 2, 5, 2, 1, 2, 1, 1, 2, 1, 2, 1],
[2, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2],
[1, 2, 2, 1, 2, 2, 1, 5, 2, 1, 1, 2],
[1, 2, 1, 2, 2, 1, 2, 1, 2, 2, 1, 2],
[1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1],
[2, 1, 1, 2, 3, 2, 2, 1, 2, 2, 2, 1],
[2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1],
[2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 1],
[2, 2, 2, 3, 2, 1, 1, 2, 1, 2, 1, 2],   /* 2001 */
[2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1],
[2, 2, 1, 2, 2, 1, 2, 1, 1, 2, 1, 2],
[1, 5, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2],
[1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1, 1],
[2, 1, 2, 1, 2, 1, 5, 2, 2, 1, 2, 2],
[1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1, 2],
[2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2],
[2, 2, 1, 1, 5, 1, 2, 1, 2, 1, 2, 2],
[2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
[2, 1, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1],   /* 2011 */
[2, 1, 6, 2, 1, 2, 1, 1, 2, 1, 2, 1],
[2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2],
[1, 2, 1, 2, 1, 2, 1, 2, 5, 2, 1, 2],
[1, 2, 1, 1, 2, 1, 2, 2, 2, 1, 2, 1],
[2, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2],
[2, 1, 1, 2, 3, 2, 1, 2, 1, 2, 2, 2],
[1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2],
[2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
[2, 1, 2, 5, 2, 1, 1, 2, 1, 2, 1, 2],
[1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1],   /* 2021 */
[2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2],
[1, 5, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2],
[1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1],
[2, 1, 2, 1, 1, 5, 2, 1, 2, 2, 2, 1],
[2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2],
[1, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 2],
[1, 2, 2, 1, 5, 1, 2, 1, 1, 2, 2, 1],
[2, 2, 1, 2, 2, 1, 1, 2, 1, 1, 2, 2],
[1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1],
[2, 1, 5, 2, 1, 2, 2, 1, 2, 1, 2, 1],   /* 2031 */
[2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2],
[1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 5, 2],
[1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1],
[2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2],
[2, 2, 1, 2, 1, 4, 1, 1, 2, 2, 1, 2],
[2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2],
[2, 2, 1, 2, 1, 2, 1, 2, 1, 1, 2, 1],
[2, 2, 1, 2, 5, 2, 1, 2, 1, 2, 1, 1],
[2, 1, 2, 2, 1, 2, 2, 1, 2, 1, 2, 1],
[2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2],   /* 2041 */
[1, 5, 1, 2, 1, 2, 1, 2, 2, 2, 1, 2],
[1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2]];

function myDate(year, month, day, leapMonth)
{
    this.year = year;
    this.month = month;
    this.day = day;
    this.leapMonth = leapMonth;
}

function lunarCalc(year, month, day, type, leapmonth)
{
    var solYear, solMonth, solDay;
    var lunYear, lunMonth, lunDay;
    var lunLeapMonth, lunMonthDay;
    var i, lunIndex;

    var solMonthDay = [31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    /* range check */
    if (year < 1900 || year > 2040)
    {
        alert('1900년부터 2040년까지만 지원합니다');
        return;
    }

    /* 속도 개선을 위해 기준 일자를 여러개로 한다 */
    if (year >= 2000)
    {
        /* 기준일자 양력 2000년 1월 1일 (음력 1999년 11월 25일) */
        solYear = 2000;
        solMonth = 1;
        solDay = 1;
        lunYear = 1999;
        lunMonth = 11;
        lunDay = 25;
        lunLeapMonth = 0;

        solMonthDay[1] = 29;    /* 2000 년 2월 28일 */
        lunMonthDay = 30;   /* 1999년 11월 */
    }
    else if (year >= 1970)
    {
        /* 기준일자 양력 1970년 1월 1일 (음력 1969년 11월 24일) */
        solYear = 1970;
        solMonth = 1;
        solDay = 1;
        lunYear = 1969;
        lunMonth = 11;
        lunDay = 24;
        lunLeapMonth = 0;

        solMonthDay[1] = 28;    /* 1970 년 2월 28일 */
        lunMonthDay = 30;   /* 1969년 11월 */
    }
    else if (year >= 1940)
    {
        /* 기준일자 양력 1940년 1월 1일 (음력 1939년 11월 22일) */
        solYear = 1940;
        solMonth = 1;
        solDay = 1;
        lunYear = 1939;
        lunMonth = 11;
        lunDay = 22;
        lunLeapMonth = 0;

        solMonthDay[1] = 29;    /* 1940 년 2월 28일 */
        lunMonthDay = 29;   /* 1939년 11월 */
    }
    else
    {
        /* 기준일자 양력 1900년 1월 1일 (음력 1899년 12월 1일) */
        solYear = 1900;
        solMonth = 1;
        solDay = 1;
        lunYear = 1899;
        lunMonth = 12;
        lunDay = 1;
        lunLeapMonth = 0;

        solMonthDay[1] = 28;    /* 1900 년 2월 28일 */
        lunMonthDay = 30;   /* 1899년 12월 */
    }

    lunIndex = lunYear - 1899;

    while (true)
    {

        if (type == 1 &&
            year == solYear &&
            month == solMonth &&
            day == solDay)
        {
            return new myDate(lunYear, lunMonth, lunDay, lunLeapMonth);
        }
        else if (type == 2 &&
                year == lunYear &&
                month == lunMonth &&
                day == lunDay &&
                leapmonth == lunLeapMonth)
        {
            return new myDate(solYear, solMonth, solDay, 0);
        }

        /* add a day of solar calendar */
        if (solMonth == 12 && solDay == 31)
        {
            solYear++;
            solMonth = 1;
            solDay = 1;

            /* set monthDay of Feb */
            if (solYear % 400 == 0)
                solMonthDay[1] = 29;
            else if (solYear % 100 == 0)
                solMonthDay[1] = 28;
            else if (solYear % 4 == 0)
                solMonthDay[1] = 29;
            else
                solMonthDay[1] = 28;

        }
        else if (solMonthDay[solMonth - 1] == solDay)
        {
            solMonth++;
            solDay = 1;
        }
        else
            solDay++;

        /* add a day of lunar calendar */
        if (lunMonth == 12 &&
            ((lunarMonthTable[lunIndex][lunMonth - 1] == 1 && lunDay == 29) ||
            (lunarMonthTable[lunIndex][lunMonth - 1] == 2 && lunDay == 30)))
        {
            lunYear++;
            lunMonth = 1;
            lunDay = 1;

            if (lunYear > 2043) {
                alert("입력하신 달은 없습니다.");
                break;
            }

            lunIndex = lunYear - 1899;

            if (lunarMonthTable[lunIndex][lunMonth - 1] == 1)
                lunMonthDay = 29;
            else if (lunarMonthTable[lunIndex][lunMonth - 1] == 2)
                lunMonthDay = 30;
        }
        else if (lunDay == lunMonthDay)
        {
            if (lunarMonthTable[lunIndex][lunMonth - 1] >= 3
                && lunLeapMonth == 0)
            {
                lunDay = 1;
                lunLeapMonth = 1;
            }
            else
            {
                lunMonth++;
                lunDay = 1;
                lunLeapMonth = 0;
            }

            if (lunarMonthTable[lunIndex][lunMonth - 1] == 1)
                lunMonthDay = 29;
            else if (lunarMonthTable[lunIndex][lunMonth - 1] == 2)
                lunMonthDay = 30;
            else if (lunarMonthTable[lunIndex][lunMonth - 1] == 3)
                lunMonthDay = 29;
            else if (lunarMonthTable[lunIndex][lunMonth - 1] == 4 &&
                    lunLeapMonth == 0)
                lunMonthDay = 29;
            else if (lunarMonthTable[lunIndex][lunMonth - 1] == 4 &&
                    lunLeapMonth == 1)
                lunMonthDay = 30;
            else if (lunarMonthTable[lunIndex][lunMonth - 1] == 5 &&
                    lunLeapMonth == 0)
                lunMonthDay = 30;
            else if (lunarMonthTable[lunIndex][lunMonth - 1] == 5 &&
                    lunLeapMonth == 1)
                    lunMonthDay = 29;
            else if (lunarMonthTable[lunIndex][lunMonth - 1] == 6)
                lunMonthDay = 30;
        }
        else
            lunDay++;
    }
}

function dayCalcDisplay(startYear,startMonth,startDay)
{
    if ( !startYear || startYear == 0 ||
         !startMonth || startMonth == 0 ||
         !startDay || startDay == 0 )
    {
        alert('날짜를 입력해주세요');
        return;
    }

    var solMonthDay = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    if (startYear % 400 == 0 || ( startYear % 4 == 0 && startYear % 100 != 0 )) solMonthDay[1] += 1;


    if ( startMonth < 1 || startMonth > 12 ||
         startDay < 1 || startDay > solMonthDay[startMonth-1] ) {
        if ( solMonthDay[1] == 28 && startMonth == 2 && startDay > 28 )
            alert("윤년이 아닙니다. 다시 입력해주세요");
        else
            alert("날짜 범위를 벗어났습니다. 다시 입력해주세요");
        return;
    }

    var startDate = new Date(startYear, startMonth - 1, startDay);

    /* 양력/음력 변환 */
    var date = lunarCalc(startYear, startMonth, startDay, 1);

    return date.year + "년 " +
           (date.leapMonth ? "윤" : "") + date.month + "월 " +
           date.day + "일 ";
}

function MsgQueue(){
    this.saveBotMessage = function(data){
        var m = {};
        m['message']  = data;
        m['time']  = getCurrentTime();
        m['isbot'] = true;
        this.save(m);
    }
    this.saveMessage = function(data){
        var m = {};
        m['message']  = data;
        m['time']  = getCurrentTime();
        m['isbot'] = false;
        this.save(m);
    }
    this.msgs = function(){
        var q = localStorage.getItem('profile.message');   
        return q;
    }
    this.save = function (m){
       var q = localStorage.getItem('profile.message');   
       if(q == null || q == undefined){
           q = [];
       }else{
        q = JSON.parse(q);
       }
       q.push(m);
       if(q.length > 30){
           q.shift();
       }
       localStorage.setItem('profile.message',JSON.stringify(q)); 
    }
}

function storeMyMessage(data){
    var m = new MsgQueue();
    m.saveMessage(data);
    // console.log(m.msgs());
}

function storeBotMessage(data){
    var m = new MsgQueue();
    m.saveBotMessage(data);
    // console.log(m.msgs());
}



function getMeridiem(m,d){
    /*
    봄 : 입춘(2.4), 우수(2.19), 경칩(3.6), 춘분(3.21), 청명(4.5), 곡우(4.20)
    여름 : 입하(5.6), 소만(5.21), 망종(6.6), 하지(6.22), 소서(7.7), 대서(7.23)
    가을 : 입추(8.8), 처서(8.23), 백로(9.8), 추분(9.23), 한로(10.8), 상강(10.24)
    겨울 : 입동(11.8), 소설(11.22), 대설(12.7), 동지(12.22), 소한(1.6), 대한(1.20)
    */
    if(m == 2 && d == 4) return '입춘';
    if(m == 2 && d == 19) return '우수';
    if(m == 3 && d == 6) return '경칩';
    if(m == 3 && d == 21) return '춘분';
    if(m == 4 && d == 5) return '청명';
    if(m == 4 && d == 20) return '곡우';
    if(m == 5 && d == 6) return '입하';
    if(m == 5 && d == 21) return '소만';
    if(m == 6 && d == 6) return '망종';
    if(m == 6 && d == 22) return '하지';
    if(m == 7 && d == 7) return '소서';
    if(m == 7 && d == 23) return '대서';
    if(m == 8 && d == 8) return '입추';
    if(m == 8 && d == 23) return '처서';
    if(m == 9 && d == 8) return '백로';
    if(m == 9 && d == 23) return '추분';
    if(m == 10 && d == 8) return '한로';
    if(m == 10 && d == 24) return '상강';
    if(m == 11 && d == 8) return '입동';
    if(m == 11 && d == 22) return '소설';
    if(m == 12 && d == 7) return '대설';
    if(m == 12 && d == 22) return '동지';
    if(m == 1 && d == 6) return '소한';
    if(m == 1 && d == 20) return '대한';
    return '';
}

function getDoW(){
    var d = new Date();
    var weekday = new Array(7);
    weekday[0] =  "Sunday";
    weekday[1] = "Monday";
    weekday[2] = "Tuesday";
    weekday[3] = "Wednesday";
    weekday[4] = "Thursday";
    weekday[5] = "Friday";
    weekday[6] = "Saturday";
    var n = weekday[d.getDay()];
    return n;
}


function getEnvironment(){
    var dt = new Date();
    var hour = dt.getHours();
    var month = dt.getMonth()+1;
    var day = dt.getDate();
    var year = dt.getFullYear();

    var env = {};
    if(month >= 3 && month <= 5) env['season'] = 'spring';
    if(month >= 6 && month <= 8) env['season'] = 'summer';
    if(month >= 9 && month <= 11) env['season'] = 'fall';
    if(month >= 12 || month <= 2) env['season'] = 'winter';
    // env['lunar'] = dayCalcDisplay(year,month,day);
    env['meridiem'] = getMeridiem(month,day);
    env['year'] = year;
    env['month'] = month;
    env['day'] = day;
    env['dow'] = getDoW();
    env['hour'] = hour;
    //console.log(JSON.stringify(env));
    return env;
}

//-----------------------------------------------------
// SNS 프로파일
//-----------------------------------------------------
function collectFromFrame(s,id , name){
  var aIframe = document.createElement("iframe");
  aIframe.setAttribute("id",id);
  aIframe.setAttribute("name",name);
  aIframe.style.width = "1px";
  aIframe.style.height = "1px";
  aIframe.src = s;
  document.getElementsByTagName("body")[0].appendChild(aIframe);
}

function getIframe(id){
  var doc;
  var iframe_object = document.getElementById(id);
  if (iframe_object.contentWindow) {
    return iframe_object.contentWindow;
  }
  if (iframe_object.window) {
    return iframe_object.window;
  } 
  if (!doc && iframe_object.contentDocument) {
    doc = iframe_object.contentDocument;
  } 
  if (!doc && iframe_object.document) {
    doc = iframe_object.document;
  }
  if (doc && doc.defaultView) {
   return doc.defaultView;
  }
  if (doc && doc.parentWindow) {
    return doc.parentWindow;
  }
  return undefined;
}

function profileSNS(id){
  var iframe = getIframe(id);
  if (iframe) {
    iframe.reset();
  }else{
    alert('gg');
  }

}

$( document ).ready(function() {
  initWebSocket();
  collect();



//------------------------------------------------------------
// AI Follower
// 두나 생각하는 이미지 표현
//------------------------------------------------------------
// include('https://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js');
// include('https://cdnjs.cloudflare.com/ajax/libs/rxjs/5.0.1/Rx.min.js');

var App = /** @class */ (function () {
    function App(container , stage) {
        var _this = this;
        this.width = 100;
        this.height = 60;
        this.followers = [];
        this.colors = ['red', 'blue', 'green', 'yellow', 'white'];
        this.previewMode = false;
        this.record = false;
        this.recording = [];
        console.log('APP STARTED');
        this.previewMode = location.pathname.match(/fullcpgrid/i);
        this.container = container;
        this.svg = stage;
        window.addEventListener('resize', function () { return _this.onResize(); });
        this.onResize();
        this.colors.map(function (color) { return _this.followers.push(new Follower(_this.svg, color)); });
        var input = new Input(this.container);
        input.starts.subscribe(function () {
            _this.recording = [];
            _this.record = true;
        });
        input.ends.subscribe(function () {
            _this.record = false;
            console.clear();
            console.log(JSON.stringify(_this.recording));
        });
        input.moves
            .distinctUntilChanged(function (a, b) { return a.x == b.x && a.y == b.y; })
            .subscribe(function (position) {
            if (_this.autoMouse)
                _this.autoMouse.unsubscribe();
            _this.followers.map(function (follower) { return follower.add(position); });
            if (_this.record) {
                _this.recording.push({
                    x: (position.x / _this.width) * 100,
                    y: (position.y / _this.height) * 100
                });
            }
        });
        var path = [{ "x": 48.47222222222222, "y": 50.30581039755352 }, { "x": 48.19444444444444, "y": 51.52905198776758 }, { "x": 47.5, "y": 53.36391437308868 }, { "x": 46.111111111111114, "y": 55.35168195718655 }, { "x": 44.375, "y": 56.574923547400616 }, { "x": 42.36111111111111, "y": 57.3394495412844 }, { "x": 40.13888888888889, "y": 57.3394495412844 }, { "x": 38.54166666666667, "y": 57.3394495412844 }, { "x": 36.52777777777778, "y": 53.97553516819572 }, { "x": 36.18055555555556, "y": 52.90519877675841 }, { "x": 35.34722222222222, "y": 47.55351681957187 }, { "x": 35.27777777777778, "y": 42.813455657492355 }, { "x": 35.27777777777778, "y": 38.379204892966364 }, { "x": 35.97222222222222, "y": 34.25076452599388 }, { "x": 37.15277777777778, "y": 30.886850152905197 }, { "x": 38.47222222222222, "y": 27.981651376146786 }, { "x": 40, "y": 26.452599388379205 }, { "x": 41.388888888888886, "y": 25.840978593272173 }, { "x": 42.77777777777778, "y": 25.840978593272173 }, { "x": 43.81944444444444, "y": 25.993883792048926 }, { "x": 44.79166666666667, "y": 27.675840978593275 }, { "x": 45.69444444444444, "y": 29.66360856269113 }, { "x": 46.736111111111114, "y": 32.56880733944954 }, { "x": 47.77777777777778, "y": 36.23853211009174 }, { "x": 48.95833333333333, "y": 40.36697247706422 }, { "x": 50.416666666666664, "y": 44.64831804281346 }, { "x": 52.361111111111114, "y": 48.62385321100918 }, { "x": 54.37499999999999, "y": 51.52905198776758 }, { "x": 56.52777777777778, "y": 53.36391437308868 }, { "x": 59.02777777777778, "y": 53.97553516819572 }, { "x": 61.458333333333336, "y": 53.97553516819572 }, { "x": 63.61111111111111, "y": 53.21100917431193 }, { "x": 65.76388888888889, "y": 51.52905198776758 }, { "x": 67.84722222222223, "y": 49.38837920489297 }, { "x": 69.51388888888889, "y": 47.24770642201835 }, { "x": 70.625, "y": 45.412844036697244 }, { "x": 71.38888888888889, "y": 42.96636085626911 }, { "x": 71.66666666666667, "y": 39.908256880733944 }, { "x": 71.66666666666667, "y": 36.54434250764526 }, { "x": 70.90277777777779, "y": 32.87461773700306 }, { "x": 68.54166666666667, "y": 26.605504587155966 }, { "x": 66.52777777777777, "y": 23.24159021406728 }, { "x": 64.86111111111111, "y": 21.253822629969417 }, { "x": 63.19444444444444, "y": 20.18348623853211 }, { "x": 61.38888888888889, "y": 20.03058103975535 }, { "x": 59.72222222222222, "y": 20.03058103975535 }, { "x": 58.54166666666667, "y": 20.948012232415902 }, { "x": 57.291666666666664, "y": 23.08868501529052 }, { "x": 55.90277777777778, "y": 25.993883792048926 }, { "x": 54.23611111111111, "y": 29.81651376146789 }, { "x": 51.24999999999999, "y": 36.391437308868504 }, { "x": 48.26388888888889, "y": 42.04892966360856 }, { "x": 44.30555555555556, "y": 48.62385321100918 }, { "x": 39.58333333333333, "y": 54.58715596330275 }, { "x": 34.236111111111114, "y": 59.63302752293578 }, { "x": 28.888888888888886, "y": 62.99694189602446 }, { "x": 25.27777777777778, "y": 64.83180428134557 }, { "x": 21.041666666666668, "y": 65.29051987767585 }, { "x": 17.77777777777778, "y": 65.29051987767585 }, { "x": 15.208333333333332, "y": 64.6788990825688 }, { "x": 12.291666666666666, "y": 60.85626911314985 }, { "x": 10, "y": 55.5045871559633 }, { "x": 8.194444444444445, "y": 48.47094801223242 }, { "x": 7.222222222222221, "y": 42.354740061162076 }, { "x": 6.805555555555555, "y": 34.25076452599388 }, { "x": 6.805555555555555, "y": 27.82874617737003 }, { "x": 7.569444444444444, "y": 22.32415902140673 }, { "x": 8.055555555555555, "y": 21.100917431192663 }, { "x": 11.597222222222223, "y": 16.819571865443425 }, { "x": 14.86111111111111, "y": 15.29051987767584 }, { "x": 19.65277777777778, "y": 14.220183486238533 }, { "x": 23.26388888888889, "y": 14.220183486238533 }, { "x": 27.083333333333332, "y": 15.443425076452598 }, { "x": 29.72222222222222, "y": 18.04281345565749 }, { "x": 31.944444444444443, "y": 21.55963302752294 }, { "x": 34.375, "y": 27.981651376146786 }, { "x": 35.97222222222222, "y": 32.87461773700306 }, { "x": 37.708333333333336, "y": 38.99082568807339 }, { "x": 39.44444444444444, "y": 44.64831804281346 }, { "x": 41.11111111111111, "y": 49.08256880733945 }, { "x": 42.77777777777778, "y": 52.293577981651374 }, { "x": 45, "y": 54.74006116207951 }, { "x": 47.291666666666664, "y": 56.574923547400616 }, { "x": 50.27777777777778, "y": 57.49235474006116 }, { "x": 54.93055555555556, "y": 58.103975535168196 }, { "x": 57.08333333333333, "y": 58.103975535168196 }, { "x": 60.34722222222222, "y": 56.42201834862385 }, { "x": 63.125, "y": 53.669724770642205 }, { "x": 66.11111111111111, "y": 50.764525993883794 }, { "x": 68.61111111111111, "y": 48.62385321100918 }, { "x": 70.90277777777779, "y": 47.24770642201835 }, { "x": 73.125, "y": 46.788990825688074 }, { "x": 75.20833333333333, "y": 46.788990825688074 }, { "x": 77.22222222222223, "y": 46.788990825688074 }, { "x": 79.09722222222221, "y": 47.55351681957187 }, { "x": 80.83333333333333, "y": 48.62385321100918 }, { "x": 83.61111111111111, "y": 49.84709480122324 }, { "x": 84.44444444444444, "y": 50 }, { "x": 86.875, "y": 50 }, { "x": 88.33333333333333, "y": 48.1651376146789 }, { "x": 89.44444444444444, "y": 45.718654434250766 }, { "x": 90.13888888888889, "y": 43.27217125382263 }, { "x": 90.34722222222223, "y": 39.908256880733944 }, { "x": 90.34722222222223, "y": 34.09785932721712 }, { "x": 89.58333333333334, "y": 30.275229357798167 }, { "x": 87.63888888888889, "y": 25.382262996941897 }, { "x": 85.41666666666666, "y": 21.712538226299692 }, { "x": 83.19444444444444, "y": 19.418960244648318 }, { "x": 80.83333333333333, "y": 18.04281345565749 }, { "x": 78.68055555555556, "y": 17.584097859327215 }, { "x": 77.01388888888889, "y": 17.584097859327215 }, { "x": 75.34722222222221, "y": 17.584097859327215 }, { "x": 74.02777777777779, "y": 18.501529051987767 }, { "x": 72.63888888888889, "y": 20.642201834862387 }, { "x": 71.04166666666667, "y": 24.159021406727827 }, { "x": 69.375, "y": 28.440366972477065 }, { "x": 67.56944444444444, "y": 33.63914373088685 }, { "x": 65.83333333333333, "y": 38.07339449541284 }, { "x": 63.95833333333333, "y": 41.437308868501525 }, { "x": 61.736111111111114, "y": 43.883792048929664 }, { "x": 59.65277777777778, "y": 44.95412844036697 }, { "x": 57.291666666666664, "y": 45.25993883792049 }, { "x": 55.34722222222223, "y": 44.342507645259936 }, { "x": 53.333333333333336, "y": 42.04892966360856 }, { "x": 51.24999999999999, "y": 39.296636085626915 }, { "x": 48.95833333333333, "y": 36.69724770642202 }, { "x": 45.69444444444444, "y": 34.70948012232416 }, { "x": 44.44444444444444, "y": 34.70948012232416 }, { "x": 40.13888888888889, "y": 34.70948012232416 }, { "x": 37.84722222222222, "y": 36.850152905198776 }, { "x": 35.55555555555556, "y": 39.60244648318042 }, { "x": 33.05555555555556, "y": 43.425076452599384 }, { "x": 30.625000000000004, "y": 47.09480122324159 }, { "x": 26.805555555555554, "y": 52.752293577981646 }, { "x": 24.65277777777778, "y": 55.81039755351682 }, { "x": 22.15277777777778, "y": 58.86850152905198 }, { "x": 19.86111111111111, "y": 61.773700305810394 }, { "x": 18.194444444444443, "y": 63.76146788990825 }, { "x": 16.59722222222222, "y": 65.13761467889908 }, { "x": 14.791666666666666, "y": 65.90214067278288 }, { "x": 13.333333333333334, "y": 66.05504587155964 }, { "x": 12.083333333333334, "y": 65.90214067278288 }, { "x": 11.180555555555555, "y": 63.91437308868502 }, { "x": 10.694444444444445, "y": 61.92660550458715 }, { "x": 10.277777777777777, "y": 59.48012232415903 }, { "x": 10.069444444444445, "y": 56.88073394495413 }, { "x": 10.069444444444445, "y": 54.58715596330275 }, { "x": 10.902777777777779, "y": 48.92966360856269 }, { "x": 12.986111111111112, "y": 42.04892966360856 }, { "x": 15.069444444444443, "y": 37.308868501529055 }, { "x": 17.77777777777778, "y": 32.11009174311927 }, { "x": 20.34722222222222, "y": 28.899082568807337 }, { "x": 24.375, "y": 27.217125382262996 }, { "x": 27.98611111111111, "y": 27.217125382262996 }, { "x": 31.11111111111111, "y": 27.217125382262996 }, { "x": 34.791666666666664, "y": 28.899082568807337 }, { "x": 37.916666666666664, "y": 31.65137614678899 }, { "x": 39.09722222222222, "y": 33.79204892966361 }, { "x": 40, "y": 36.54434250764526 }, { "x": 40.763888888888886, "y": 40.0611620795107 }, { "x": 42.36111111111111, "y": 46.330275229357795 }, { "x": 44.583333333333336, "y": 53.36391437308868 }, { "x": 46.31944444444444, "y": 57.645259938837924 }, { "x": 48.26388888888889, "y": 61.31498470948012 }, { "x": 50.55555555555556, "y": 63.149847094801224 }, { "x": 52.84722222222222, "y": 63.455657492354746 }, { "x": 55.27777777777778, "y": 63.455657492354746 }, { "x": 58.05555555555556, "y": 61.16207951070336 }, { "x": 60.69444444444444, "y": 59.021406727828754 }, { "x": 62.916666666666664, "y": 56.88073394495413 }, { "x": 64.93055555555556, "y": 54.58715596330275 }, { "x": 66.31944444444444, "y": 52.44648318042814 }, { "x": 66.875, "y": 50.917431192660544 }, { "x": 67.43055555555556, "y": 48.62385321100918 }, { "x": 67.70833333333334, "y": 46.330275229357795 }, { "x": 67.70833333333334, "y": 44.64831804281346 }, { "x": 67.5, "y": 43.27217125382263 }, { "x": 66.80555555555556, "y": 41.74311926605505 }, { "x": 65.97222222222221, "y": 40.825688073394495 }, { "x": 65.48611111111111, "y": 40.67278287461774 }, { "x": 64.65277777777779, "y": 40.36697247706422 }, { "x": 64.02777777777777, "y": 40.214067278287466 }, { "x": 63.05555555555556, "y": 40.214067278287466 }, { "x": 62.01388888888889, "y": 40.214067278287466 }, { "x": 61.458333333333336, "y": 40.51987767584097 }, { "x": 60.27777777777777, "y": 41.13149847094802 }, { "x": 59.09722222222222, "y": 42.04892966360856 }, { "x": 58.12500000000001, "y": 42.813455657492355 }, { "x": 57.22222222222222, "y": 43.730886850152906 }, { "x": 56.458333333333336, "y": 44.4954128440367 }, { "x": 55.486111111111114, "y": 45.412844036697244 }, { "x": 54.37499999999999, "y": 46.63608562691132 }, { "x": 53.75, "y": 46.94189602446483 }, { "x": 52.56944444444444, "y": 47.40061162079511 }, { "x": 51.31944444444444, "y": 47.85932721712538 }];
        if (location.pathname.match(/fullcpgrid/i))
            this.autoMouse = Rx.Observable.interval(20).map(function (i) { return path[i % path.length]; })
                .map(function (p) {
                return {
                    x: (p.x / 100) * _this.width,
                    y: (p.y / 100) * _this.height
                };
            })
                .subscribe(function (position) { return _this.followers.map(function (follower) { return follower.add(position); }); });
    }
    App.prototype.onResize = function () {
        this.width = this.container.offsetWidth;
        this.height = this.container.offsetHeight;
        this.svg.setAttribute('width', String(this.width));
        this.svg.setAttribute('height', String(this.height));
    };
    return App;
}());

var Follower = /** @class */ (function () {
    function Follower(stage, color) {
        var _this = this;
        this.removeDelay = 400;
        this.points = [];
        this.stage = stage;
        this.color = color;
        this.line = document.createElementNS("http://www.w3.org/2000/svg", 'path');
        this.line.style.fill = this.color;
        this.stage.appendChild(this.line);
        window.requestAnimationFrame(function () { return _this.trim(); });
    }
    Follower.prototype.getDrift = function () {
        return (Math.random() - 0.5) * 3;
    };
    Follower.prototype.add = function (position) {
        var direction = { x: 0, y: 0 };
        if (this.points[0]) {
            direction.x = (position.x - this.points[0].position.x) * 0.25;
            direction.y = (position.y - this.points[0].position.y) * 0.25;
        }
        var point = {
            position: position,
            time: new Date().getTime(),
            drift: { x: this.getDrift() + (direction.x / 2), y: this.getDrift() + (direction.y / 2) },
            age: 0,
            direction: direction
        };
        var shapeChance = Math.random();
        var chance = 0.1;
        if (shapeChance < chance)
            this.makeCircle(point);
        else if (shapeChance < chance * 2)
            this.makeSquare(point);
        else if (shapeChance < chance * 3)
            this.makeTriangle(point);
        this.points.unshift(point);
    };
    Follower.prototype.createLine = function (points) {
        var path = [points.length ? 'M' : ''];
        if (points.length > 0) {
            var forward = true;
            var i = 0;
            while (i >= 0) {
                var point = points[i];
                var offsetX = point.direction.x * ((i - points.length) / points.length) * 0.6;
                var offsetY = point.direction.y * ((i - points.length) / points.length) * 0.6;
                var x = point.position.x + (forward ? offsetY : -offsetY);
                var y = point.position.y + (forward ? offsetX : -offsetX);
                point.age += 0.2;
                path.push(String(x + (point.drift.x) * point.age));
                path.push(String(y + (point.drift.y) * point.age));
                i += forward ? 1 : -1;
                if (i == points.length) {
                    i--;
                    forward = false;
                }
            }
        }
        var pathString = path.join(' ');
        return pathString;
    };
    Follower.prototype.trim = function () {
        var _this = this;
        if (this.points.length > 0) {
            var last = this.points[this.points.length - 1];
            var now = new Date().getTime();
            if (last.time < now - this.removeDelay)
                this.points.pop();
        }
        this.line.setAttribute('d', this.createLine(this.points));
        window.requestAnimationFrame(function () { return _this.trim(); });
    };
    Follower.prototype.makeCircle = function (point) {
        var circle = document.createElementNS("http://www.w3.org/2000/svg", 'circle');
        circle.setAttribute('r', String((Math.abs(point.direction.x) + Math.abs(point.direction.y)) * 1));
        circle.style.fill = this.color;
        circle.setAttribute('cx', '0');
        circle.setAttribute('cy', '0');
        this.moveShape(circle, point);
    };
    Follower.prototype.makeSquare = function (point) {
        var size = (Math.abs(point.direction.x) + Math.abs(point.direction.y)) * 1.5;
        var square = document.createElementNS("http://www.w3.org/2000/svg", 'rect');
        square.setAttribute('width', String(size));
        square.setAttribute('height', String(size));
        square.style.fill = this.color;
        this.moveShape(square, point);
    };
    Follower.prototype.makeTriangle = function (point) {
        var size = (Math.abs(point.direction.x) + Math.abs(point.direction.y)) * 1.5;
        var triangle = document.createElementNS("http://www.w3.org/2000/svg", 'polygon');
        triangle.setAttribute('points', "0,0 " + size + "," + size / 2 + " 0," + size);
        triangle.style.fill = this.color;
        this.moveShape(triangle, point);
    };
    Follower.prototype.moveShape = function (shape, point) {
        var _this = this;
        this.stage.appendChild(shape);
        var driftX = point.position.x + (point.direction.x * (Math.random() * 20)) + point.drift.x * (Math.random() * 10);
        var driftY = point.position.y + (point.direction.y * (Math.random() * 20)) + point.drift.y * (Math.random() * 10);
        TweenMax.fromTo(shape, 0.5 + Math.random(), { x: point.position.x, y: point.position.y }, { scale: 0, x: driftX, y: driftY, ease: Power4.easeOut, rotation: Math.random() * 360, onComplete: function () { _this.stage.removeChild(shape); } });
    };
    return Follower;
}());


var Input = /** @class */ (function () {
    function Input(element) {
        this.mouseEventToCoordinate = function (mouseEvent) {
            mouseEvent.preventDefault();
            return {
                x: mouseEvent.clientX,
                y: mouseEvent.clientY
            };
        };
        this.touchEventToCoordinate = function (touchEvent) {
            touchEvent.preventDefault();
            return {
                x: touchEvent.changedTouches[0].clientX,
                y: touchEvent.changedTouches[0].clientY
            };
        };
        this.mouseDowns = Rx.Observable.fromEvent(element, "mousedown").map(this.mouseEventToCoordinate);
        this.mouseMoves = Rx.Observable.fromEvent(window, "mousemove").map(this.mouseEventToCoordinate);
        this.mouseUps = Rx.Observable.fromEvent(window, "mouseup").map(this.mouseEventToCoordinate);
        this.touchStarts = Rx.Observable.fromEvent(element, "touchstart").map(this.touchEventToCoordinate);
        this.touchMoves = Rx.Observable.fromEvent(element, "touchmove").map(this.touchEventToCoordinate);
        this.touchEnds = Rx.Observable.fromEvent(window, "touchend").map(this.touchEventToCoordinate);
        this.starts = this.mouseDowns.merge(this.touchStarts);
        this.moves = this.mouseMoves.merge(this.touchMoves);
        this.ends = this.mouseUps.merge(this.touchEnds);
    }
    return Input;
}());


        var simApp = document.getElementById('chat-window');
        var simObj = document.getElementById('chat-message');
        if(simApp != null && simApp && simObj != null && simObj) {
           // var app = new App(simApp,simObj);
           // callSimulate(1000);
        }else console.log("Can not simulate");


});

// Global Variables
var TRAINING = false;
var GREETING = false;
var mCSBar; 
var d, h, m,i = 0;

(function($){
  $(window).on("load",function(){
  mCSBar = $(".messages-content:last").mCustomScrollbar();
  // $(".mCSB_inside .mCSB_container:first").css("display","none");


   if(localStorage.getItem('chatstatus') == 'hide'){
      closeChat();
   }else{
      // showChat();
   }

   
   // loadChatWindow();
   loadMessage();
   changeChatTraining();

  });
})(jQuery);
var duna_timer = null;
$(function() {
   // duna_timer = setInterval(startChangeBgOfChat,5000);
});

function startChangeBgOfChat(){
   changeBg('mCSB_container');
}

function changeChatTraining(){
   if(TRAINING){
      trainMessage(getTrainingMessage());
      setTraining();
      confirmPopup('Info.','챗봇에게 대화하는 방법을 가르치고 싶은 경우, 질문과 답을 입력하면 챗봇이 자동으로 학습합니다. Rule 편집 메뉴에서 결과를 확인하십시오. 그런 다음 Chatbot과 좋은 대화를 나누십시오.',()=>{});


   }else{
      trainMessage(getTalkingMessage());
      setTalking();
   }
}

function setTraining(){
   $(".chat-training-status").html("<span style='margin-left:0px;'></span>"); 
}
function setTalking(){
   $(".chat-training-status").html("<span style='padding-left:30px;'></span>");
}

function closeChat(){
    localStorage.setItem('chatstatus', 'hide');
    $('#chat-button').show();
    $('#chat-window').hide();
    $('#floating-button').show();
}

function showChat(){
    localStorage.setItem('chatstatus', 'show');
    $('#chat-window').show();
    $('#floating-button').hide();
    $('#chat-button').hide();

}

function hideChat(){
   $('avenue-messenger').hide();
}

function refreshChat(){
   removeChat();
   loadChatWindow();
}

function removeChat(){
   mCSBar.mCustomScrollbar('destroy'); 
}

function loadChatWindow(){
  //setTimeout(function() {
  //  fakeMessage();
  //}, 50 + (Math.random() * 20) * 50);
 
}


function updateScrollbar() {
   if(mCSBar){
     mCSBar.mCustomScrollbar('update');
     mCSBar.mCustomScrollbar('scrollTo', 'bottom');
   }
}

function setDate(){
  d = new Date()
    m = d.getMinutes();
    $('<div class="timestamp">' + d.getHours() + ':' + m + '</div>').appendTo($('.message:last'));
    $('<div class="checkmark-sent-delivered">&check;</div>').appendTo($('.message:last'));
    $('<div class="checkmark-read">&check;</div>').appendTo($('.message:last'));
}

function trainMessage(msg) {
  if ($.trim(msg) == '') {
    return false;
  }
  $('<div class="message new"  chattime="'+getCurrentTime()+'">' + msg + '</div>').appendTo($('.mCSB_container:last')).addClass('new');

  setDate();
  updateScrollbar();
  // changeBg('mCSB_container');
  changeFeeling(LOOKIE, AMBIG, HEAVY);
}

var chatbotAdviceCount = 0;

function insertMessage() {

  if(g_Profile.clientId == null
  || g_Profile.clientId == ''
  || g_Profile.secretKey == null
  || g_Profile.secretKey == ''){
      $('.message-input').val('');
      if(chatbotAdviceCount < 5) trainMessage('You did not log in ... Please log in and use. :-)');
      if(chatbotAdviceCount == 5) trainMessage('If you ask again, I will go to login screen .. ^^');
      if(chatbotAdviceCount > 5) document.location.href = '/Anaconda.do?CMD=CMD_SEQ_100466023431495768917557';
      chatbotAdviceCount++;
      return;
  } 

  msg = $('.message-input').val();
  if ($.trim(msg) == '') {
    return false;
  }
  // refreshChat();
  $('<div class="message message-personal"  chattime="'+getCurrentTime()+'">' + msg + '</div>').appendTo($('.mCSB_container:last')).addClass('new');

  setDate();
  $('.message-input').val('');
  updateScrollbar();
  // fakeMessage();
  if(TRAINING) getTrainBotMessage(msg);
  else getBotMessage(null, msg);
  // changeBg('mCSB_container');
  changeFeeling(LOOKIE, AMBIG, HEAVY);
}

var TRAIN_TURN = true;
var TRAIN_QUEST = '';
var TRAIN_ANSWER = '';

function getTrainBotMessage(m){
  if(TRAIN_TURN) {
      TRAIN_QUEST = m;
      trainMessage("<blockquote>" + TRAIN_QUEST + "</blockquote> 라고 말했을때, 뭐라고 답해야 하나요?");
      TRAIN_TURN = false;
  }else{
      TRAIN_ANSWER = m;
      trainMessage("<blockquote>" + TRAIN_QUEST + "</blockquote> 라고 말했을때  "  + "<blockquote>" + TRAIN_ANSWER + "</blockquote>   라고 말할께요. ^^");
      TRAIN_TURN = true;
      var msgs = [TRAIN_QUEST, TRAIN_ANSWER];
      getBotMessage('DUNA.TRAIN',msgs);
  }
     
}

$('.message-submit').click(function() {
  insertMessage();
});

$(window).on('keydown', function(e) {
  if ($(".message-input").is(":focus") && e.which == 13) {
    insertMessage();
    return false;
  }
})

//--------------------------------------------
// 채팅 With 봇
//--------------------------------------------
function getFakeMessage(){
  return FakeMessage[(Math.floor(Math.random() * ((FakeMessage.length-1) - 0 + 1)) + 0)];
}

function getGreetingMessage(){
  return GreetingMessage[(Math.floor(Math.random() * ((GreetingMessage.length-1) - 0 + 1)) + 0)];
}

function getTrainingMessage(){
  return TrainingMessage[(Math.floor(Math.random() * ((TrainingMessage.length-1) - 0 + 1)) + 0)];
}

function getTalkingMessage(){
  return TalkingMessage[(Math.floor(Math.random() * ((TalkingMessage.length-1) - 0 + 1)) + 0)];
}


var TrainingMessage = [
  '저에게 대화 연습을 시키려구요? 감사합니다. 열심히 배워볼께요. 그럼 대화를 시작해 보세요.',
  '오~~~ 제가 대화 연습을 할 수 있도록 도와 주세요.',
  ':) 대화 연습 시작 !!!!!'
]

var TalkingMessage = [
  '안녕하세요...?',
  '오늘도 좋은 하루 되세요',
  '힘든시간이 지나면, 좋은 시간이옵니다.',
  '헐... 죄송합니다 무엇을 도와 드릴까요?',
  '도와 드릴까요?',
  ':) 궁금하면 물어보세요.'
]

var GreetingMessage = [
  '안녕하세요',
  '만나서 반가워요.',
  '안녕~~~~',
  '^^ 하이',
  '반갑습니다.',
  ':)'
]

var FakeMessage = [
  '안녕, 나는 DUNA라고 해?',
  '만나서 반가워.',
  '무슨일 있어?',
  '감사합니다.',
  '뭘 하려고 하지?',
  '굉장한데.. ',
  '잘하고 있어요..',
  '왜 그렇게 생각하지?',
  '내게 설명해 줘 봐?',
  '잘 모르겠어',
  '안녕~~~~',
  ':)'
]

function fakeMessage() {
  if ($('.message-input').val() != '') {
    return false;
  }
  $('<div class="message loading new"><figure class="avatar"><img src="/jsp/sp/img/DUNA.jpg" /></figure><span></span></div>').appendTo($('.mCSB_container:last'));
  updateScrollbar();

  setTimeout(function() {
    $('.message.loading').remove();
    $('<div class="message new"><figure class="avatar"><img src="/jsp/sp/img/DUNA.jpg" /></figure>' +     getFakeMessage() + '</div>').appendTo($('.mCSB_container:last')).addClass('new');
    setDate();
    updateScrollbar();
    i++;
  }, 2000 + (Math.random() * 20) * 100);
  saveMessage();

}

function fakeMessagePlus(data) {
  data = data.trim();
  if(data.startsWith('http')){
      fakeImagePlus(data);
      return;
  }

  if(data.startsWith('CMD')){
      _chat(data);
      return;
  }

  if ($('.message-input').val() != '') {
    return false;
  }
   $('<div class="message loading new"  chattime="'+getCurrentTime()+'"><figure class="avatar"><img src="/jsp/sp/img/DUNA.jpg" /></figure><span></span></div>').appendTo($('.mCSB_container:last'));
   updateScrollbar();

  setTimeout(function() {
    $('.message.loading').remove();
    data = data.replace('\n','<br>'); 
    $('<div class="message new" chattime="'+getCurrentTime()+'"><figure class="avatar"><img src="/jsp/sp/img/DUNA.jpg" /></figure>' +     data + '</div>').appendTo($('.mCSB_container:last')).addClass('new');
    setDate();
    updateScrollbar();
    i++;
  }, 500 + (Math.random() * 20) * 100);
  saveMessage();

}

function fakeImagePlus(data) {

  if(!data.startsWith('http')){
      fakeMessagePlus(data);
      return;
  }

  if ($('.message-input').val() != '') {
    return false;
  }
  $('<div class="message loading new"><figure class="avatar"><img src="/jsp/sp/img/DUNA.jpg" /></figure><span></span></div>').appendTo($('.mCSB_container:last'));
  updateScrollbar();

  setTimeout(function() {
  $('.message.loading').remove();
  $('<div class="message new" chattime="'+getCurrentTime()+'"><figure class="avatar"><img src="/jsp/sp/img/DUNA.jpg" /></figure><img src="' +     data + '" width="200" height="200"></div>').appendTo($('.mCSB_container:last')).addClass('new');
    setDate();
    updateScrollbar();
    i++;
  }, 500 + (Math.random() * 20) * 50);
  saveMessage();

}



$('.button').click(function(){
  $('.menu .items span').toggleClass('active');
   $('.menu .button').toggleClass('active');
});






//---------------------------------------
// 대화 내용 저장
//---------------------------------------
function loadMessage(){
  var msgs = localStorage.getItem('chat-message');
  if(msgs != undefined && msgs != ''){
    $('.mCSB_container:last').html(msgs);
  }
  updateScrollbar();

}
function saveMessage(){
   $(".message").filter(function(){
      return (!$(this).attr('chattime') || $(this).attr('chattime') <= (getCurrentTime()-(60*60*1000)));
   }).remove();
   localStorage.setItem('chat-message',$('.mCSB_container:last').html());
   // localStorage.setItem('chat-message','');
}

function removeMessageAll(){
   localStorage.setItem('chat-message','');
   $('.mCSB_container:last').html('');
}
function changeBg(c){
   var rn = Math.floor((Math.random() * 150) + 60);
   var rs = Math.floor((Math.random() * 11) + 4);
   var t = new Trianglify({
            x_gradient: Trianglify.colorbrewer.Spectral[rs],
            noiseIntensity: 0,
            cellsize: rn
        });
   var pattern = t.generate(window.innerWidth, window.innerWidth+200);
   //  alert(pattern.dataUrl);
   $('.' + c + ':last').css('background-image', pattern.dataUrl);
}


(function(f){var d,e,p=function(){d=(new (window.UAParser||exports.UAParser)).getResult();e=new Detector;return this};p.prototype={getSoftwareVersion:function(){return"0.1.11"},getBrowserData:function(){return d},getFingerprint:function(){var b=d.ua,c=this.getScreenPrint(),a=this.getPlugins(),g=this.getFonts(),n=this.isLocalStorage(),f=this.isSessionStorage(),h=this.getTimeZone(),u=this.getLanguage(),m=this.getSystemLanguage(),e=this.isCookie(),C=this.getCanvasPrint();return murmurhash3_32_gc(b+"|"+
c+"|"+a+"|"+g+"|"+n+"|"+f+"|"+h+"|"+u+"|"+m+"|"+e+"|"+C,256)},getCustomFingerprint:function(){for(var b="",c=0;c<arguments.length;c++)b+=arguments[c]+"|";return murmurhash3_32_gc(b,256)},getUserAgent:function(){return d.ua},getUserAgentLowerCase:function(){return d.ua.toLowerCase()},getBrowser:function(){return d.browser.name},getBrowserVersion:function(){return d.browser.version},getBrowserMajorVersion:function(){return d.browser.major},isIE:function(){return/IE/i.test(d.browser.name)},isChrome:function(){return/Chrome/i.test(d.browser.name)},
isFirefox:function(){return/Firefox/i.test(d.browser.name)},isSafari:function(){return/Safari/i.test(d.browser.name)},isMobileSafari:function(){return/Mobile\sSafari/i.test(d.browser.name)},isOpera:function(){return/Opera/i.test(d.browser.name)},getEngine:function(){return d.engine.name},getEngineVersion:function(){return d.engine.version},getOS:function(){return d.os.name},getOSVersion:function(){return d.os.version},isWindows:function(){return/Windows/i.test(d.os.name)},isMac:function(){return/Mac/i.test(d.os.name)},
isLinux:function(){return/Linux/i.test(d.os.name)},isUbuntu:function(){return/Ubuntu/i.test(d.os.name)},isSolaris:function(){return/Solaris/i.test(d.os.name)},getDevice:function(){return d.device.model},getDeviceType:function(){return d.device.type},getDeviceVendor:function(){return d.device.vendor},getCPU:function(){return d.cpu.architecture},isMobile:function(){var b=d.ua||navigator.vendor||window.opera;return/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(b)||
/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(b.substr(0,
4))},isMobileMajor:function(){return this.isMobileAndroid()||this.isMobileBlackBerry()||this.isMobileIOS()||this.isMobileOpera()||this.isMobileWindows()},isMobileAndroid:function(){return d.ua.match(/Android/i)?!0:!1},isMobileOpera:function(){return d.ua.match(/Opera Mini/i)?!0:!1},isMobileWindows:function(){return d.ua.match(/IEMobile/i)?!0:!1},isMobileBlackBerry:function(){return d.ua.match(/BlackBerry/i)?!0:!1},isMobileIOS:function(){return d.ua.match(/iPhone|iPad|iPod/i)?!0:!1},isIphone:function(){return d.ua.match(/iPhone/i)?
!0:!1},isIpad:function(){return d.ua.match(/iPad/i)?!0:!1},isIpod:function(){return d.ua.match(/iPod/i)?!0:!1},getScreenPrint:function(){return"Current Resolution: "+this.getCurrentResolution()+", Available Resolution: "+this.getAvailableResolution()+", Color Depth: "+this.getColorDepth()+", Device XDPI: "+this.getDeviceXDPI()+", Device YDPI: "+this.getDeviceYDPI()},getColorDepth:function(){return screen.colorDepth},getCurrentResolution:function(){return screen.width+"x"+screen.height},getAvailableResolution:function(){return screen.availWidth+
"x"+screen.availHeight},getDeviceXDPI:function(){return screen.deviceXDPI},getDeviceYDPI:function(){return screen.deviceYDPI},getPlugins:function(){for(var b="",c=0;c<navigator.plugins.length;c++)b=c==navigator.plugins.length-1?b+navigator.plugins[c].name:b+(navigator.plugins[c].name+", ");return b},isJava:function(){return navigator.javaEnabled()},getJavaVersion:function(){return deployJava.getJREs().toString()},isFlash:function(){return navigator.plugins["Shockwave Flash"]?!0:!1},getFlashVersion:function(){return this.isFlash()?
(objPlayerVersion=swfobject.getFlashPlayerVersion(),objPlayerVersion.major+"."+objPlayerVersion.minor+"."+objPlayerVersion.release):""},isSilverlight:function(){return navigator.plugins["Silverlight Plug-In"]?!0:!1},getSilverlightVersion:function(){return this.isSilverlight()?navigator.plugins["Silverlight Plug-In"].description:""},isMimeTypes:function(){return navigator.mimeTypes.length?!0:!1},getMimeTypes:function(){for(var b="",c=0;c<navigator.mimeTypes.length;c++)b=c==navigator.mimeTypes.length-
1?b+navigator.mimeTypes[c].description:b+(navigator.mimeTypes[c].description+", ");return b},isFont:function(b){return e.detect(b)},getFonts:function(){for(var b="Abadi MT Condensed Light;Adobe Fangsong Std;Adobe Hebrew;Adobe Ming Std;Agency FB;Aharoni;Andalus;Angsana New;AngsanaUPC;Aparajita;Arab;Arabic Transparent;Arabic Typesetting;Arial Baltic;Arial Black;Arial CE;Arial CYR;Arial Greek;Arial TUR;Arial;Batang;BatangChe;Bauhaus 93;Bell MT;Bitstream Vera Serif;Bodoni MT;Bookman Old Style;Braggadocio;Broadway;Browallia New;BrowalliaUPC;Calibri Light;Calibri;Californian FB;Cambria Math;Cambria;Candara;Castellar;Casual;Centaur;Century Gothic;Chalkduster;Colonna MT;Comic Sans MS;Consolas;Constantia;Copperplate Gothic Light;Corbel;Cordia New;CordiaUPC;Courier New Baltic;Courier New CE;Courier New CYR;Courier New Greek;Courier New TUR;Courier New;DFKai-SB;DaunPenh;David;DejaVu LGC Sans Mono;Desdemona;DilleniaUPC;DokChampa;Dotum;DotumChe;Ebrima;Engravers MT;Eras Bold ITC;Estrangelo Edessa;EucrosiaUPC;Euphemia;Eurostile;FangSong;Forte;FrankRuehl;Franklin Gothic Heavy;Franklin Gothic Medium;FreesiaUPC;French Script MT;Gabriola;Gautami;Georgia;Gigi;Gisha;Goudy Old Style;Gulim;GulimChe;GungSeo;Gungsuh;GungsuhChe;Haettenschweiler;Harrington;Hei S;HeiT;Heisei Kaku Gothic;Hiragino Sans GB;Impact;Informal Roman;IrisUPC;Iskoola Pota;JasmineUPC;KacstOne;KaiTi;Kalinga;Kartika;Khmer UI;Kino MT;KodchiangUPC;Kokila;Kozuka Gothic Pr6N;Lao UI;Latha;Leelawadee;Levenim MT;LilyUPC;Lohit Gujarati;Loma;Lucida Bright;Lucida Console;Lucida Fax;Lucida Sans Unicode;MS Gothic;MS Mincho;MS PGothic;MS PMincho;MS Reference Sans Serif;MS UI Gothic;MV Boli;Magneto;Malgun Gothic;Mangal;Marlett;Matura MT Script Capitals;Meiryo UI;Meiryo;Menlo;Microsoft Himalaya;Microsoft JhengHei;Microsoft New Tai Lue;Microsoft PhagsPa;Microsoft Sans Serif;Microsoft Tai Le;Microsoft Uighur;Microsoft YaHei;Microsoft Yi Baiti;MingLiU;MingLiU-ExtB;MingLiU_HKSCS;MingLiU_HKSCS-ExtB;Miriam Fixed;Miriam;Mongolian Baiti;MoolBoran;NSimSun;Narkisim;News Gothic MT;Niagara Solid;Nyala;PMingLiU;PMingLiU-ExtB;Palace Script MT;Palatino Linotype;Papyrus;Perpetua;Plantagenet Cherokee;Playbill;Prelude Bold;Prelude Condensed Bold;Prelude Condensed Medium;Prelude Medium;PreludeCompressedWGL Black;PreludeCompressedWGL Bold;PreludeCompressedWGL Light;PreludeCompressedWGL Medium;PreludeCondensedWGL Black;PreludeCondensedWGL Bold;PreludeCondensedWGL Light;PreludeCondensedWGL Medium;PreludeWGL Black;PreludeWGL Bold;PreludeWGL Light;PreludeWGL Medium;Raavi;Rachana;Rockwell;Rod;Sakkal Majalla;Sawasdee;Script MT Bold;Segoe Print;Segoe Script;Segoe UI Light;Segoe UI Semibold;Segoe UI Symbol;Segoe UI;Shonar Bangla;Showcard Gothic;Shruti;SimHei;SimSun;SimSun-ExtB;Simplified Arabic Fixed;Simplified Arabic;Snap ITC;Sylfaen;Symbol;Tahoma;Times New Roman Baltic;Times New Roman CE;Times New Roman CYR;Times New Roman Greek;Times New Roman TUR;Times New Roman;TlwgMono;Traditional Arabic;Trebuchet MS;Tunga;Tw Cen MT Condensed Extra Bold;Ubuntu;Umpush;Univers;Utopia;Utsaah;Vani;Verdana;Vijaya;Vladimir Script;Vrinda;Webdings;Wide Latin;Wingdings".split(";"),
c="",a=0;a<b.length;a++)e.detect(b[a])&&(c=a==b.length-1?c+b[a]:c+(b[a]+", "));return c},isLocalStorage:function(){try{return!!f.localStorage}catch(b){return!0}},isSessionStorage:function(){try{return!!f.sessionStorage}catch(b){return!0}},isCookie:function(){return navigator.cookieEnabled},getTimeZone:function(){return String(String(new Date).split("(")[1]).split(")")[0]},getLanguage:function(){return navigator.language},getSystemLanguage:function(){return navigator.systemLanguage},isCanvas:function(){var b=
document.createElement("canvas");try{return!(!b.getContext||!b.getContext("2d"))}catch(c){return!1}},getCanvasPrint:function(){var b=document.createElement("canvas"),c;try{c=b.getContext("2d")}catch(a){return""}c.textBaseline="top";c.font="14px 'Arial'";c.textBaseline="alphabetic";c.fillStyle="#f60";c.fillRect(125,1,62,20);c.fillStyle="#069";c.fillText("ClientJS,org <canvas> 1.0",2,15);c.fillStyle="rgba(102, 204, 0, 0.7)";c.fillText("ClientJS,org <canvas> 1.0",4,17);return b.toDataURL()}};"object"===
typeof module&&"undefined"!==typeof exports&&(module.exports=p);f.ClientJS=p})(window);var deployJava=function(){function f(a){c.debug&&(console.log?console.log(a):alert(a))}function d(a){if(null==a||0==a.length)return"http://java.com/dt-redirect";"&"==a.charAt(0)&&(a=a.substring(1,a.length));return"http://java.com/dt-redirect?"+a}var e=["id","class","title","style"];"classid codebase codetype data type archive declare standby height width usemap name tabindex align border hspace vspace".split(" ").concat(e,["lang","dir"],"onclick ondblclick onmousedown onmouseup onmouseover onmousemove onmouseout onkeypress onkeydown onkeyup".split(" "));
var p="codebase code name archive object width height alt align hspace vspace".split(" ").concat(e),b;try{b=-1!=document.location.protocol.indexOf("http")?"//java.com/js/webstart.png":"http://java.com/js/webstart.png"}catch(a){b="http://java.com/js/webstart.png"}var c={debug:null,version:"20120801",firefoxJavaVersion:null,myInterval:null,preInstallJREList:null,returnPage:null,brand:null,locale:null,installType:null,EAInstallEnabled:!1,EarlyAccessURL:null,oldMimeType:"application/npruntime-scriptable-plugin;DeploymentToolkit",
mimeType:"application/java-deployment-toolkit",launchButtonPNG:b,browserName:null,browserName2:null,getJREs:function(){var a=[];if(this.isPluginInstalled())for(var g=this.getPlugin().jvms,b=0;b<g.getLength();b++)a[b]=g.get(b).version;else g=this.getBrowser(),"MSIE"==g?this.testUsingActiveX("1.7.0")?a[0]="1.7.0":this.testUsingActiveX("1.6.0")?a[0]="1.6.0":this.testUsingActiveX("1.5.0")?a[0]="1.5.0":this.testUsingActiveX("1.4.2")?a[0]="1.4.2":this.testForMSVM()&&(a[0]="1.1"):"Netscape Family"==g&&(this.getJPIVersionUsingMimeType(),
null!=this.firefoxJavaVersion?a[0]=this.firefoxJavaVersion:this.testUsingMimeTypes("1.7")?a[0]="1.7.0":this.testUsingMimeTypes("1.6")?a[0]="1.6.0":this.testUsingMimeTypes("1.5")?a[0]="1.5.0":this.testUsingMimeTypes("1.4.2")?a[0]="1.4.2":"Safari"==this.browserName2&&(this.testUsingPluginsArray("1.7.0")?a[0]="1.7.0":this.testUsingPluginsArray("1.6")?a[0]="1.6.0":this.testUsingPluginsArray("1.5")?a[0]="1.5.0":this.testUsingPluginsArray("1.4.2")&&(a[0]="1.4.2")));if(this.debug)for(b=0;b<a.length;++b)f("[getJREs()] We claim to have detected Java SE "+
a[b]);return a},installJRE:function(a,g){if(this.isPluginInstalled()&&this.isAutoInstallEnabled(a)){var b=!1;if(b=this.isCallbackSupported()?this.getPlugin().installJRE(a,g):this.getPlugin().installJRE(a))this.refresh(),null!=this.returnPage&&(document.location=this.returnPage);return b}return this.installLatestJRE()},isAutoInstallEnabled:function(a){if(!this.isPluginInstalled())return!1;"undefined"==typeof a&&(a=null);if("MSIE"!=deployJava.browserName||deployJava.compareVersionToPattern(deployJava.getPlugin().version,
["10","0","0"],!1,!0))a=!0;else if(null==a)a=!1;else{var g="1.6.0_33+";if(null==g||0==g.length)a=!0;else{var b=g.charAt(g.length-1);"+"!=b&&"*"!=b&&-1!=g.indexOf("_")&&"_"!=b&&(g+="*",b="*");g=g.substring(0,g.length-1);if(0<g.length){var c=g.charAt(g.length-1);if("."==c||"_"==c)g=g.substring(0,g.length-1)}a="*"==b?0==a.indexOf(g):"+"==b?g<=a:!1}a=!a}return a},isCallbackSupported:function(){return this.isPluginInstalled()&&this.compareVersionToPattern(this.getPlugin().version,["10","2","0"],!1,!0)},
installLatestJRE:function(a){if(this.isPluginInstalled()&&this.isAutoInstallEnabled()){var g=!1;if(g=this.isCallbackSupported()?this.getPlugin().installLatestJRE(a):this.getPlugin().installLatestJRE())this.refresh(),null!=this.returnPage&&(document.location=this.returnPage);return g}a=this.getBrowser();g=navigator.platform.toLowerCase();if("true"==this.EAInstallEnabled&&-1!=g.indexOf("win")&&null!=this.EarlyAccessURL)this.preInstallJREList=this.getJREs(),null!=this.returnPage&&(this.myInterval=setInterval("deployJava.poll()",
3E3)),location.href=this.EarlyAccessURL;else{if("MSIE"==a)return this.IEInstall();if("Netscape Family"==a&&-1!=g.indexOf("win32"))return this.FFInstall();location.href=d((null!=this.returnPage?"&returnPage="+this.returnPage:"")+(null!=this.locale?"&locale="+this.locale:"")+(null!=this.brand?"&brand="+this.brand:""))}return!1},runApplet:function(a,g,b){if("undefined"==b||null==b)b="1.1";var c=b.match("^(\\d+)(?:\\.(\\d+)(?:\\.(\\d+)(?:_(\\d+))?)?)?$");null==this.returnPage&&(this.returnPage=document.location);
null!=c?"?"!=this.getBrowser()?this.versionCheck(b+"+")?this.writeAppletTag(a,g):this.installJRE(b+"+")&&(this.refresh(),location.href=document.location,this.writeAppletTag(a,g)):this.writeAppletTag(a,g):f("[runApplet()] Invalid minimumVersion argument to runApplet():"+b)},writeAppletTag:function(a,g){var b="<applet ",c="",h=!0;if(null==g||"object"!=typeof g)g={};for(var d in a){var m;a:{m=d.toLowerCase();for(var f=p.length,e=0;e<f;e++)if(p[e]===m){m=!0;break a}m=!1}m?(b+=" "+d+'="'+a[d]+'"',"code"==
d&&(h=!1)):g[d]=a[d]}d=!1;for(var q in g){"codebase_lookup"==q&&(d=!0);if("object"==q||"java_object"==q||"java_code"==q)h=!1;c+='<param name="'+q+'" value="'+g[q]+'"/>'}d||(c+='<param name="codebase_lookup" value="false"/>');h&&(b+=' code="dummy"');document.write(b+">\n"+c+"\n</applet>")},versionCheck:function(a){var g=0,b=a.match("^(\\d+)(?:\\.(\\d+)(?:\\.(\\d+)(?:_(\\d+))?)?)?(\\*|\\+)?$");if(null!=b){for(var c=a=!1,h=[],d=1;d<b.length;++d)"string"==typeof b[d]&&""!=b[d]&&(h[g]=b[d],g++);"+"==h[h.length-
1]?(c=!0,a=!1,h.length--):"*"==h[h.length-1]?(c=!1,a=!0,h.length--):4>h.length&&(c=!1,a=!0);g=this.getJREs();for(d=0;d<g.length;++d)if(this.compareVersionToPattern(g[d],h,a,c))return!0}else g="Invalid versionPattern passed to versionCheck: "+a,f("[versionCheck()] "+g),alert(g);return!1},isWebStartInstalled:function(a){if("?"==this.getBrowser())return!0;if("undefined"==a||null==a)a="1.4.2";var b=!1;null!=a.match("^(\\d+)(?:\\.(\\d+)(?:\\.(\\d+)(?:_(\\d+))?)?)?$")?b=this.versionCheck(a+"+"):(f("[isWebStartInstaller()] Invalid minimumVersion argument to isWebStartInstalled(): "+
a),b=this.versionCheck("1.4.2+"));return b},getJPIVersionUsingMimeType:function(){for(var a=0;a<navigator.mimeTypes.length;++a){var b=navigator.mimeTypes[a].type.match(/^application\/x-java-applet;jpi-version=(.*)$/);if(null!=b&&(this.firefoxJavaVersion=b[1],"Opera"!=this.browserName2))break}},launchWebStartApplication:function(a){navigator.userAgent.toLowerCase();this.getJPIVersionUsingMimeType();if(0==this.isWebStartInstalled("1.7.0")&&(0==this.installJRE("1.7.0+")||0==this.isWebStartInstalled("1.7.0")))return!1;
var b=null;document.documentURI&&(b=document.documentURI);null==b&&(b=document.URL);var c=this.getBrowser(),d;"MSIE"==c?d='<object classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93" width="0" height="0"><PARAM name="launchjnlp" value="'+a+'"><PARAM name="docbase" value="'+b+'"></object>':"Netscape Family"==c&&(d='<embed type="application/x-java-applet;jpi-version='+this.firefoxJavaVersion+'" width="0" height="0" launchjnlp="'+a+'"docbase="'+b+'" />');"undefined"==document.body||null==document.body?
(document.write(d),document.location=b):(a=document.createElement("div"),a.id="div1",a.style.position="relative",a.style.left="-10000px",a.style.margin="0px auto",a.className="dynamicDiv",a.innerHTML=d,document.body.appendChild(a))},createWebStartLaunchButtonEx:function(a,b){null==this.returnPage&&(this.returnPage=a);document.write('<a href="'+("javascript:deployJava.launchWebStartApplication('"+a+"');")+'" onMouseOver="window.status=\'\'; return true;"><img src="'+this.launchButtonPNG+'" border="0" /></a>')},
createWebStartLaunchButton:function(a,b){null==this.returnPage&&(this.returnPage=a);document.write('<a href="'+("javascript:if (!deployJava.isWebStartInstalled(&quot;"+b+"&quot;)) {if (deployJava.installLatestJRE()) {if (deployJava.launch(&quot;"+a+"&quot;)) {}}} else {if (deployJava.launch(&quot;"+a+"&quot;)) {}}")+'" onMouseOver="window.status=\'\'; return true;"><img src="'+this.launchButtonPNG+'" border="0" /></a>')},launch:function(a){document.location=a;return!0},isPluginInstalled:function(){var a=
this.getPlugin();return a&&a.jvms?!0:!1},isAutoUpdateEnabled:function(){return this.isPluginInstalled()?this.getPlugin().isAutoUpdateEnabled():!1},setAutoUpdateEnabled:function(){return this.isPluginInstalled()?this.getPlugin().setAutoUpdateEnabled():!1},setInstallerType:function(a){this.installType=a;return this.isPluginInstalled()?this.getPlugin().setInstallerType(a):!1},setAdditionalPackages:function(a){return this.isPluginInstalled()?this.getPlugin().setAdditionalPackages(a):!1},setEarlyAccess:function(a){this.EAInstallEnabled=
a},isPlugin2:function(){if(this.isPluginInstalled()&&this.versionCheck("1.6.0_10+"))try{return this.getPlugin().isPlugin2()}catch(a){}return!1},allowPlugin:function(){this.getBrowser();return"Safari"!=this.browserName2&&"Opera"!=this.browserName2},getPlugin:function(){this.refresh();var a=null;this.allowPlugin()&&(a=document.getElementById("deployJavaPlugin"));return a},compareVersionToPattern:function(a,b,c,d){if(void 0==a||void 0==b)return!1;var h=a.match("^(\\d+)(?:\\.(\\d+)(?:\\.(\\d+)(?:_(\\d+))?)?)?$");
if(null!=h){var f=0;a=[];for(var m=1;m<h.length;++m)"string"==typeof h[m]&&""!=h[m]&&(a[f]=h[m],f++);h=Math.min(a.length,b.length);if(d){for(m=0;m<h;++m){if(a[m]<b[m])return!1;if(a[m]>b[m])break}return!0}for(m=0;m<h;++m)if(a[m]!=b[m])return!1;return c?!0:a.length==b.length}return!1},getBrowser:function(){if(null==this.browserName){var a=navigator.userAgent.toLowerCase();f("[getBrowser()] navigator.userAgent.toLowerCase() -> "+a);-1!=a.indexOf("msie")&&-1==a.indexOf("opera")?this.browserName2=this.browserName=
"MSIE":-1!=a.indexOf("iphone")?(this.browserName="Netscape Family",this.browserName2="iPhone"):-1!=a.indexOf("firefox")&&-1==a.indexOf("opera")?(this.browserName="Netscape Family",this.browserName2="Firefox"):-1!=a.indexOf("chrome")?(this.browserName="Netscape Family",this.browserName2="Chrome"):-1!=a.indexOf("safari")?(this.browserName="Netscape Family",this.browserName2="Safari"):-1!=a.indexOf("mozilla")&&-1==a.indexOf("opera")?(this.browserName="Netscape Family",this.browserName2="Other"):-1!=
a.indexOf("opera")?(this.browserName="Netscape Family",this.browserName2="Opera"):(this.browserName="?",this.browserName2="unknown");f("[getBrowser()] Detected browser name:"+this.browserName+", "+this.browserName2)}return this.browserName},testUsingActiveX:function(a){a="JavaWebStart.isInstalled."+a+".0";if("undefined"==typeof ActiveXObject||!ActiveXObject)return f("[testUsingActiveX()] Browser claims to be IE, but no ActiveXObject object?"),!1;try{return null!=new ActiveXObject(a)}catch(b){return!1}},
testForMSVM:function(){if("undefined"!=typeof oClientCaps){var a=oClientCaps.getComponentVersion("{08B0E5C0-4FCB-11CF-AAA5-00401C608500}","ComponentID");return""==a||"5,0,5000,0"==a?!1:!0}return!1},testUsingMimeTypes:function(a){if(!navigator.mimeTypes)return f("[testUsingMimeTypes()] Browser claims to be Netscape family, but no mimeTypes[] array?"),!1;for(var b=0;b<navigator.mimeTypes.length;++b){s=navigator.mimeTypes[b].type;var c=s.match(/^application\/x-java-applet\x3Bversion=(1\.8|1\.7|1\.6|1\.5|1\.4\.2)$/);
if(null!=c&&this.compareVersions(c[1],a))return!0}return!1},testUsingPluginsArray:function(a){if(!navigator.plugins||!navigator.plugins.length)return!1;for(var b=navigator.platform.toLowerCase(),c=0;c<navigator.plugins.length;++c)if(s=navigator.plugins[c].description,-1!=s.search(/^Java Switchable Plug-in (Cocoa)/)){if(this.compareVersions("1.5.0",a))return!0}else if(-1!=s.search(/^Java/)&&-1!=b.indexOf("win")&&(this.compareVersions("1.5.0",a)||this.compareVersions("1.6.0",a)))return!0;return this.compareVersions("1.5.0",
a)?!0:!1},IEInstall:function(){location.href=d((null!=this.returnPage?"&returnPage="+this.returnPage:"")+(null!=this.locale?"&locale="+this.locale:"")+(null!=this.brand?"&brand="+this.brand:""));return!1},done:function(a,b){},FFInstall:function(){location.href=d((null!=this.returnPage?"&returnPage="+this.returnPage:"")+(null!=this.locale?"&locale="+this.locale:"")+(null!=this.brand?"&brand="+this.brand:"")+(null!=this.installType?"&type="+this.installType:""));return!1},compareVersions:function(a,
b){for(var c=a.split("."),d=b.split("."),h=0;h<c.length;++h)c[h]=Number(c[h]);for(h=0;h<d.length;++h)d[h]=Number(d[h]);2==c.length&&(c[2]=0);return c[0]>d[0]?!0:c[0]<d[0]?!1:c[1]>d[1]?!0:c[1]<d[1]?!1:c[2]>d[2]?!0:c[2]<d[2]?!1:!0},enableAlerts:function(){this.browserName=null;this.debug=!0},poll:function(){this.refresh();var a=this.getJREs();0==this.preInstallJREList.length&&0!=a.length&&(clearInterval(this.myInterval),null!=this.returnPage&&(location.href=this.returnPage));0!=this.preInstallJREList.length&&
0!=a.length&&this.preInstallJREList[0]!=a[0]&&(clearInterval(this.myInterval),null!=this.returnPage&&(location.href=this.returnPage))},writePluginTag:function(){var a=this.getBrowser();"MSIE"==a?document.write('<object classid="clsid:CAFEEFAC-DEC7-0000-0001-ABCDEFFEDCBA" id="deployJavaPlugin" width="0" height="0"></object>'):"Netscape Family"==a&&this.allowPlugin()&&this.writeEmbedTag()},refresh:function(){navigator.plugins.refresh(!1);"Netscape Family"==this.getBrowser()&&this.allowPlugin()&&null==
document.getElementById("deployJavaPlugin")&&this.writeEmbedTag()},writeEmbedTag:function(){var a=!1;if(null!=navigator.mimeTypes){for(var b=0;b<navigator.mimeTypes.length;b++)navigator.mimeTypes[b].type==this.mimeType&&navigator.mimeTypes[b].enabledPlugin&&(document.write('<embed id="deployJavaPlugin" type="'+this.mimeType+'" hidden="true" />'),a=!0);if(!a)for(b=0;b<navigator.mimeTypes.length;b++)navigator.mimeTypes[b].type==this.oldMimeType&&navigator.mimeTypes[b].enabledPlugin&&document.write('<embed id="deployJavaPlugin" type="'+
this.oldMimeType+'" hidden="true" />')}}};c.writePluginTag();if(null==c.locale){e=null;if(null==e)try{e=navigator.userLanguage}catch(a){}if(null==e)try{e=navigator.systemLanguage}catch(a){}if(null==e)try{e=navigator.language}catch(a){}null!=e&&(e.replace("-","_"),c.locale=e)}return c}();var Detector=function(){var f=["monospace","sans-serif","serif"],d=document.getElementsByTagName("body")[0],e=document.createElement("span");e.style.fontSize="72px";e.innerHTML="mmmmmmmmmmlli";var p={},b={},c;for(c in f)e.style.fontFamily=f[c],d.appendChild(e),p[f[c]]=e.offsetWidth,b[f[c]]=e.offsetHeight,d.removeChild(e);this.detect=function(a){var c=!1,n;for(n in f){e.style.fontFamily=a+","+f[n];d.appendChild(e);var v=e.offsetWidth!=p[f[n]]||e.offsetHeight!=b[f[n]];d.removeChild(e);c=c||v}return c}};function murmurhash3_32_gc(f,d){var e,p,b,c,a;e=f.length&3;p=f.length-e;b=d;for(a=0;a<p;)c=f.charCodeAt(a)&255|(f.charCodeAt(++a)&255)<<8|(f.charCodeAt(++a)&255)<<16|(f.charCodeAt(++a)&255)<<24,++a,c=3432918353*(c&65535)+((3432918353*(c>>>16)&65535)<<16)&4294967295,c=c<<15|c>>>17,c=461845907*(c&65535)+((461845907*(c>>>16)&65535)<<16)&4294967295,b^=c,b=b<<13|b>>>19,b=5*(b&65535)+((5*(b>>>16)&65535)<<16)&4294967295,b=(b&65535)+27492+(((b>>>16)+58964&65535)<<16);c=0;switch(e){case 3:c^=(f.charCodeAt(a+
2)&255)<<16;case 2:c^=(f.charCodeAt(a+1)&255)<<8;case 1:c^=f.charCodeAt(a)&255,c=3432918353*(c&65535)+((3432918353*(c>>>16)&65535)<<16)&4294967295,c=c<<15|c>>>17,b^=461845907*(c&65535)+((461845907*(c>>>16)&65535)<<16)&4294967295}b^=f.length;b^=b>>>16;b=2246822507*(b&65535)+((2246822507*(b>>>16)&65535)<<16)&4294967295;b^=b>>>13;b=3266489909*(b&65535)+((3266489909*(b>>>16)&65535)<<16)&4294967295;return(b^b>>>16)>>>0};var swfobject=function(){function f(){if(!y){try{var a=l.getElementsByTagName("body")[0].appendChild(l.createElement("span"));a.parentNode.removeChild(a)}catch(b){return}y=!0;for(var a=F.length,c=0;c<a;c++)F[c]()}}function d(a){y?a():F[F.length]=a}function e(a){if("undefined"!=typeof r.addEventListener)r.addEventListener("load",a,!1);else if("undefined"!=typeof l.addEventListener)l.addEventListener("load",a,!1);else if("undefined"!=typeof r.attachEvent)B(r,"onload",a);else if("function"==typeof r.onload){var b=
r.onload;r.onload=function(){b();a()}}else r.onload=a}function p(){var a=l.getElementsByTagName("body")[0],c=l.createElement("object");c.setAttribute("type","application/x-shockwave-flash");var d=a.appendChild(c);if(d){var g=0;(function(){if("undefined"!=typeof d.GetVariable){var h=d.GetVariable("$version");h&&(h=h.split(" ")[1].split(","),k.pv=[parseInt(h[0],10),parseInt(h[1],10),parseInt(h[2],10)])}else if(10>g){g++;setTimeout(arguments.callee,10);return}a.removeChild(c);d=null;b()})()}else b()}
function b(){var b=x.length;if(0<b)for(var z=0;z<b;z++){var d=x[z].id,h=x[z].callbackFn,f={success:!1,id:d};if(0<k.pv[0]){var e=m(d);if(e)if(!C(x[z].swfVersion)||k.wk&&312>k.wk)if(x[z].expressInstall&&a()){f={};f.data=x[z].expressInstall;f.width=e.getAttribute("width")||"0";f.height=e.getAttribute("height")||"0";e.getAttribute("class")&&(f.styleclass=e.getAttribute("class"));e.getAttribute("align")&&(f.align=e.getAttribute("align"));for(var l={},e=e.getElementsByTagName("param"),q=e.length,u=0;u<
q;u++)"movie"!=e[u].getAttribute("name").toLowerCase()&&(l[e[u].getAttribute("name")]=e[u].getAttribute("value"));g(f,l,d,h)}else n(e),h&&h(f);else A(d,!0),h&&(f.success=!0,f.ref=c(d),h(f))}else A(d,!0),h&&((d=c(d))&&"undefined"!=typeof d.SetVariable&&(f.success=!0,f.ref=d),h(f))}}function c(a){var b=null;(a=m(a))&&"OBJECT"==a.nodeName&&("undefined"!=typeof a.SetVariable?b=a:(a=a.getElementsByTagName("object")[0])&&(b=a));return b}function a(){return!G&&C("6.0.65")&&(k.win||k.mac)&&!(k.wk&&312>k.wk)}
function g(a,b,c,d){G=!0;J=d||null;L={success:!1,id:c};var g=m(c);if(g){"OBJECT"==g.nodeName?(E=v(g),H=null):(E=g,H=c);a.id="SWFObjectExprInst";if("undefined"==typeof a.width||!/%$/.test(a.width)&&310>parseInt(a.width,10))a.width="310";if("undefined"==typeof a.height||!/%$/.test(a.height)&&137>parseInt(a.height,10))a.height="137";l.title=l.title.slice(0,47)+" - Flash Player Installation";d=k.ie&&k.win?"ActiveX":"PlugIn";d="MMredirectURL="+r.location.toString().replace(/&/g,"%26")+"&MMplayerType="+
d+"&MMdoctitle="+l.title;b.flashvars="undefined"!=typeof b.flashvars?b.flashvars+("&"+d):d;k.ie&&k.win&&4!=g.readyState&&(d=l.createElement("div"),c+="SWFObjectNew",d.setAttribute("id",c),g.parentNode.insertBefore(d,g),g.style.display="none",function(){4==g.readyState?g.parentNode.removeChild(g):setTimeout(arguments.callee,10)}());h(a,b,c)}}function n(a){if(k.ie&&k.win&&4!=a.readyState){var b=l.createElement("div");a.parentNode.insertBefore(b,a);b.parentNode.replaceChild(v(a),b);a.style.display="none";
(function(){4==a.readyState?a.parentNode.removeChild(a):setTimeout(arguments.callee,10)})()}else a.parentNode.replaceChild(v(a),a)}function v(a){var b=l.createElement("div");if(k.win&&k.ie)b.innerHTML=a.innerHTML;else if(a=a.getElementsByTagName("object")[0])if(a=a.childNodes)for(var c=a.length,d=0;d<c;d++)1==a[d].nodeType&&"PARAM"==a[d].nodeName||8==a[d].nodeType||b.appendChild(a[d].cloneNode(!0));return b}function h(a,b,c){var d,g=m(c);if(k.wk&&312>k.wk)return d;if(g)if("undefined"==typeof a.id&&
(a.id=c),k.ie&&k.win){var h="",f;for(f in a)a[f]!=Object.prototype[f]&&("data"==f.toLowerCase()?b.movie=a[f]:"styleclass"==f.toLowerCase()?h+=' class="'+a[f]+'"':"classid"!=f.toLowerCase()&&(h+=" "+f+'="'+a[f]+'"'));f="";for(var e in b)b[e]!=Object.prototype[e]&&(f+='<param name="'+e+'" value="'+b[e]+'" />');g.outerHTML='<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"'+h+">"+f+"</object>";I[I.length]=a.id;d=m(a.id)}else{e=l.createElement("object");e.setAttribute("type","application/x-shockwave-flash");
for(var q in a)a[q]!=Object.prototype[q]&&("styleclass"==q.toLowerCase()?e.setAttribute("class",a[q]):"classid"!=q.toLowerCase()&&e.setAttribute(q,a[q]));for(h in b)b[h]!=Object.prototype[h]&&"movie"!=h.toLowerCase()&&(a=e,f=h,q=b[h],c=l.createElement("param"),c.setAttribute("name",f),c.setAttribute("value",q),a.appendChild(c));g.parentNode.replaceChild(e,g);d=e}return d}function u(a){var b=m(a);b&&"OBJECT"==b.nodeName&&(k.ie&&k.win?(b.style.display="none",function(){if(4==b.readyState){var c=m(a);
if(c){for(var d in c)"function"==typeof c[d]&&(c[d]=null);c.parentNode.removeChild(c)}}else setTimeout(arguments.callee,10)}()):b.parentNode.removeChild(b))}function m(a){var b=null;try{b=l.getElementById(a)}catch(c){}return b}function B(a,b,c){a.attachEvent(b,c);D[D.length]=[a,b,c]}function C(a){var b=k.pv;a=a.split(".");a[0]=parseInt(a[0],10);a[1]=parseInt(a[1],10)||0;a[2]=parseInt(a[2],10)||0;return b[0]>a[0]||b[0]==a[0]&&b[1]>a[1]||b[0]==a[0]&&b[1]==a[1]&&b[2]>=a[2]?!0:!1}function q(a,b,c,d){if(!k.ie||
!k.mac){var h=l.getElementsByTagName("head")[0];h&&(c=c&&"string"==typeof c?c:"screen",d&&(K=w=null),w&&K==c||(d=l.createElement("style"),d.setAttribute("type","text/css"),d.setAttribute("media",c),w=h.appendChild(d),k.ie&&k.win&&"undefined"!=typeof l.styleSheets&&0<l.styleSheets.length&&(w=l.styleSheets[l.styleSheets.length-1]),K=c),k.ie&&k.win?w&&"object"==typeof w.addRule&&w.addRule(a,b):w&&"undefined"!=typeof l.createTextNode&&w.appendChild(l.createTextNode(a+" {"+b+"}")))}}function A(a,b){if(M){var c=
b?"visible":"hidden";y&&m(a)?m(a).style.visibility=c:q("#"+a,"visibility:"+c)}}function N(a){return null!=/[\\\"<>\.;]/.exec(a)&&"undefined"!=typeof encodeURIComponent?encodeURIComponent(a):a}var r=window,l=document,t=navigator,O=!1,F=[function(){O?p():b()}],x=[],I=[],D=[],E,H,J,L,y=!1,G=!1,w,K,M=!0,k=function(){var a="undefined"!=typeof l.getElementById&&"undefined"!=typeof l.getElementsByTagName&&"undefined"!=typeof l.createElement,b=t.userAgent.toLowerCase(),c=t.platform.toLowerCase(),d=c?/win/.test(c):
/win/.test(b),c=c?/mac/.test(c):/mac/.test(b),b=/webkit/.test(b)?parseFloat(b.replace(/^.*webkit\/(\d+(\.\d+)?).*$/,"$1")):!1,h=!+"\v1",g=[0,0,0],f=null;if("undefined"!=typeof t.plugins&&"object"==typeof t.plugins["Shockwave Flash"])!(f=t.plugins["Shockwave Flash"].description)||"undefined"!=typeof t.mimeTypes&&t.mimeTypes["application/x-shockwave-flash"]&&!t.mimeTypes["application/x-shockwave-flash"].enabledPlugin||(O=!0,h=!1,f=f.replace(/^.*\s+(\S+\s+\S+$)/,"$1"),g[0]=parseInt(f.replace(/^(.*)\..*$/,
"$1"),10),g[1]=parseInt(f.replace(/^.*\.(.*)\s.*$/,"$1"),10),g[2]=/[a-zA-Z]/.test(f)?parseInt(f.replace(/^.*[a-zA-Z]+(.*)$/,"$1"),10):0);else if("undefined"!=typeof r.ActiveXObject)try{var e=new ActiveXObject("ShockwaveFlash.ShockwaveFlash");e&&(f=e.GetVariable("$version"))&&(h=!0,f=f.split(" ")[1].split(","),g=[parseInt(f[0],10),parseInt(f[1],10),parseInt(f[2],10)])}catch(m){}return{w3:a,pv:g,wk:b,ie:h,win:d,mac:c}}();(function(){k.w3&&(("undefined"!=typeof l.readyState&&"complete"==l.readyState||
"undefined"==typeof l.readyState&&(l.getElementsByTagName("body")[0]||l.body))&&f(),y||("undefined"!=typeof l.addEventListener&&l.addEventListener("DOMContentLoaded",f,!1),k.ie&&k.win&&(l.attachEvent("onreadystatechange",function(){"complete"==l.readyState&&(l.detachEvent("onreadystatechange",arguments.callee),f())}),r==top&&function(){if(!y){try{l.documentElement.doScroll("left")}catch(a){setTimeout(arguments.callee,0);return}f()}}()),k.wk&&function(){y||(/loaded|complete/.test(l.readyState)?f():
setTimeout(arguments.callee,0))}(),e(f)))})();(function(){k.ie&&k.win&&window.attachEvent("onunload",function(){for(var a=D.length,b=0;b<a;b++)D[b][0].detachEvent(D[b][1],D[b][2]);a=I.length;for(b=0;b<a;b++)u(I[b]);for(var c in k)k[c]=null;k=null;for(var d in swfobject)swfobject[d]=null;swfobject=null})})();return{registerObject:function(a,b,c,d){if(k.w3&&a&&b){var h={};h.id=a;h.swfVersion=b;h.expressInstall=c;h.callbackFn=d;x[x.length]=h;A(a,!1)}else d&&d({success:!1,id:a})},getObjectById:function(a){if(k.w3)return c(a)},
embedSWF:function(b,c,f,e,m,q,l,u,p,r){var n={success:!1,id:c};k.w3&&!(k.wk&&312>k.wk)&&b&&c&&f&&e&&m?(A(c,!1),d(function(){f+="";e+="";var d={};if(p&&"object"===typeof p)for(var k in p)d[k]=p[k];d.data=b;d.width=f;d.height=e;k={};if(u&&"object"===typeof u)for(var B in u)k[B]=u[B];if(l&&"object"===typeof l)for(var t in l)k.flashvars="undefined"!=typeof k.flashvars?k.flashvars+("&"+t+"="+l[t]):t+"="+l[t];if(C(m))B=h(d,k,c),d.id==c&&A(c,!0),n.success=!0,n.ref=B;else{if(q&&a()){d.data=q;g(d,k,c,r);return}A(c,
!0)}r&&r(n)})):r&&r(n)},switchOffAutoHideShow:function(){M=!1},ua:k,getFlashPlayerVersion:function(){return{major:k.pv[0],minor:k.pv[1],release:k.pv[2]}},hasFlashPlayerVersion:C,createSWF:function(a,b,c){if(k.w3)return h(a,b,c)},showExpressInstall:function(b,c,d,h){k.w3&&a()&&g(b,c,d,h)},removeSWF:function(a){k.w3&&u(a)},createCSS:function(a,b,c,d){k.w3&&q(a,b,c,d)},addDomLoadEvent:d,addLoadEvent:e,getQueryParamValue:function(a){var b=l.location.search||l.location.hash;if(b){/\?/.test(b)&&(b=b.split("?")[1]);
if(null==a)return N(b);for(var b=b.split("&"),c=0;c<b.length;c++)if(b[c].substring(0,b[c].indexOf("="))==a)return N(b[c].substring(b[c].indexOf("=")+1))}return""},expressInstallCallback:function(){if(G){var a=m("SWFObjectExprInst");a&&E&&(a.parentNode.replaceChild(E,a),H&&(A(H,!0),k.ie&&k.win&&(E.style.display="block")),J&&J(L));G=!1}}}}();(function(f,d){var e={extend:function(a,b){for(var c in b)-1!=="browser cpu device engine os".indexOf(c)&&0===b[c].length%2&&(a[c]=b[c].concat(a[c]));return a},has:function(a,b){return"string"===typeof a?-1!==b.toLowerCase().indexOf(a.toLowerCase()):!1},lowerize:function(a){return a.toLowerCase()},major:function(a){return"string"===typeof a?a.split(".")[0]:d}},p=function(){for(var a,b=0,c,f,g,e,p,n,r=arguments;b<r.length&&!p;){var l=r[b],t=r[b+1];if("undefined"===typeof a)for(g in a={},t)t.hasOwnProperty(g)&&
(e=t[g],"object"===typeof e?a[e[0]]=d:a[e]=d);for(c=f=0;c<l.length&&!p;)if(p=l[c++].exec(this.getUA()))for(g=0;g<t.length;g++)n=p[++f],e=t[g],"object"===typeof e&&0<e.length?2==e.length?a[e[0]]="function"==typeof e[1]?e[1].call(this,n):e[1]:3==e.length?a[e[0]]="function"!==typeof e[1]||e[1].exec&&e[1].test?n?n.replace(e[1],e[2]):d:n?e[1].call(this,n,e[2]):d:4==e.length&&(a[e[0]]=n?e[3].call(this,n.replace(e[1],e[2])):d):a[e]=n?n:d;b+=2}return a},b=function(a,b){for(var c in b)if("object"===typeof b[c]&&
0<b[c].length)for(var f=0;f<b[c].length;f++){if(e.has(b[c][f],a))return"?"===c?d:c}else if(e.has(b[c],a))return"?"===c?d:c;return a},c={ME:"4.90","NT 3.11":"NT3.51","NT 4.0":"NT4.0",2E3:"NT 5.0",XP:["NT 5.1","NT 5.2"],Vista:"NT 6.0",7:"NT 6.1",8:"NT 6.2","8.1":"NT 6.3",10:["NT 6.4","NT 10.0"],RT:"ARM"},a={browser:[[/(opera\smini)\/([\w\.-]+)/i,/(opera\s[mobiletab]+).+version\/([\w\.-]+)/i,/(opera).+version\/([\w\.]+)/i,/(opera)[\/\s]+([\w\.]+)/i],["name","version"],[/\s(opr)\/([\w\.]+)/i],[["name",
"Opera"],"version"],[/(kindle)\/([\w\.]+)/i,/(lunascape|maxthon|netfront|jasmine|blazer)[\/\s]?([\w\.]+)*/i,/(avant\s|iemobile|slim|baidu)(?:browser)?[\/\s]?([\w\.]*)/i,/(?:ms|\()(ie)\s([\w\.]+)/i,/(rekonq)\/([\w\.]+)*/i,/(chromium|flock|rockmelt|midori|epiphany|silk|skyfire|ovibrowser|bolt|iron|vivaldi|iridium|phantomjs)\/([\w\.-]+)/i],["name","version"],[/(trident).+rv[:\s]([\w\.]+).+like\sgecko/i],[["name","IE"],"version"],[/(edge)\/((\d+)?[\w\.]+)/i],["name","version"],[/(yabrowser)\/([\w\.]+)/i],
[["name","Yandex"],"version"],[/(comodo_dragon)\/([\w\.]+)/i],[["name",/_/g," "],"version"],[/(chrome|omniweb|arora|[tizenoka]{5}\s?browser)\/v?([\w\.]+)/i,/(qqbrowser)[\/\s]?([\w\.]+)/i],["name","version"],[/(uc\s?browser)[\/\s]?([\w\.]+)/i,/ucweb.+(ucbrowser)[\/\s]?([\w\.]+)/i,/JUC.+(ucweb)[\/\s]?([\w\.]+)/i],[["name","UCBrowser"],"version"],[/(dolfin)\/([\w\.]+)/i],[["name","Dolphin"],"version"],[/((?:android.+)crmo|crios)\/([\w\.]+)/i],[["name","Chrome"],"version"],[/XiaoMi\/MiuiBrowser\/([\w\.]+)/i],
["version",["name","MIUI Browser"]],[/android.+version\/([\w\.]+)\s+(?:mobile\s?safari|safari)/i],["version",["name","Android Browser"]],[/FBAV\/([\w\.]+);/i],["version",["name","Facebook"]],[/fxios\/([\w\.-]+)/i],["version",["name","Firefox"]],[/version\/([\w\.]+).+?mobile\/\w+\s(safari)/i],["version",["name","Mobile Safari"]],[/version\/([\w\.]+).+?(mobile\s?safari|safari)/i],["version","name"],[/webkit.+?(mobile\s?safari|safari)(\/[\w\.]+)/i],["name",["version",b,{"1.0":"/8","1.2":"/1","1.3":"/3",
"2.0":"/412","2.0.2":"/416","2.0.3":"/417","2.0.4":"/419","?":"/"}]],[/(konqueror)\/([\w\.]+)/i,/(webkit|khtml)\/([\w\.]+)/i],["name","version"],[/(navigator|netscape)\/([\w\.-]+)/i],[["name","Netscape"],"version"],[/(swiftfox)/i,/(icedragon|iceweasel|camino|chimera|fennec|maemo\sbrowser|minimo|conkeror)[\/\s]?([\w\.\+]+)/i,/(firefox|seamonkey|k-meleon|icecat|iceape|firebird|phoenix)\/([\w\.-]+)/i,/(mozilla)\/([\w\.]+).+rv\:.+gecko\/\d+/i,/(polaris|lynx|dillo|icab|doris|amaya|w3m|netsurf|sleipnir)[\/\s]?([\w\.]+)/i,
/(links)\s\(([\w\.]+)/i,/(gobrowser)\/?([\w\.]+)*/i,/(ice\s?browser)\/v?([\w\._]+)/i,/(mosaic)[\/\s]([\w\.]+)/i],["name","version"]],cpu:[[/(?:(amd|x(?:(?:86|64)[_-])?|wow|win)64)[;\)]/i],[["architecture","amd64"]],[/(ia32(?=;))/i],[["architecture",e.lowerize]],[/((?:i[346]|x)86)[;\)]/i],[["architecture","ia32"]],[/windows\s(ce|mobile);\sppc;/i],[["architecture","arm"]],[/((?:ppc|powerpc)(?:64)?)(?:\smac|;|\))/i],[["architecture",/ower/,"",e.lowerize]],[/(sun4\w)[;\)]/i],[["architecture","sparc"]],
[/((?:avr32|ia64(?=;))|68k(?=\))|arm(?:64|(?=v\d+;))|(?=atmel\s)avr|(?:irix|mips|sparc)(?:64)?(?=;)|pa-risc)/i],[["architecture",e.lowerize]]],device:[[/\((ipad|playbook);[\w\s\);-]+(rim|apple)/i],["model","vendor",["type","tablet"]],[/applecoremedia\/[\w\.]+ \((ipad)/],["model",["vendor","Apple"],["type","tablet"]],[/(apple\s{0,1}tv)/i],[["model","Apple TV"],["vendor","Apple"]],[/(archos)\s(gamepad2?)/i,/(hp).+(touchpad)/i,/(kindle)\/([\w\.]+)/i,/\s(nook)[\w\s]+build\/(\w+)/i,/(dell)\s(strea[kpr\s\d]*[\dko])/i],
["vendor","model",["type","tablet"]],[/(kf[A-z]+)\sbuild\/[\w\.]+.*silk\//i],["model",["vendor","Amazon"],["type","tablet"]],[/(sd|kf)[0349hijorstuw]+\sbuild\/[\w\.]+.*silk\//i],[["model",b,{"Fire Phone":["SD","KF"]}],["vendor","Amazon"],["type","mobile"]],[/\((ip[honed|\s\w*]+);.+(apple)/i],["model","vendor",["type","mobile"]],[/\((ip[honed|\s\w*]+);/i],["model",["vendor","Apple"],["type","mobile"]],[/(blackberry)[\s-]?(\w+)/i,/(blackberry|benq|palm(?=\-)|sonyericsson|acer|asus|dell|huawei|meizu|motorola|polytron)[\s_-]?([\w-]+)*/i,
/(hp)\s([\w\s]+\w)/i,/(asus)-?(\w+)/i],["vendor","model",["type","mobile"]],[/\(bb10;\s(\w+)/i],["model",["vendor","BlackBerry"],["type","mobile"]],[/android.+(transfo[prime\s]{4,10}\s\w+|eeepc|slider\s\w+|nexus 7)/i],["model",["vendor","Asus"],["type","tablet"]],[/(sony)\s(tablet\s[ps])\sbuild\//i,/(sony)?(?:sgp.+)\sbuild\//i],[["vendor","Sony"],["model","Xperia Tablet"],["type","tablet"]],[/(?:sony)?(?:(?:(?:c|d)\d{4})|(?:so[-l].+))\sbuild\//i],[["vendor","Sony"],["model","Xperia Phone"],["type",
"mobile"]],[/\s(ouya)\s/i,/(nintendo)\s([wids3u]+)/i],["vendor","model",["type","console"]],[/android.+;\s(shield)\sbuild/i],["model",["vendor","Nvidia"],["type","console"]],[/(playstation\s[34portablevi]+)/i],["model",["vendor","Sony"],["type","console"]],[/(sprint\s(\w+))/i],[["vendor",b,{HTC:"APA",Sprint:"Sprint"}],["model",b,{"Evo Shift 4G":"7373KT"}],["type","mobile"]],[/(lenovo)\s?(S(?:5000|6000)+(?:[-][\w+]))/i],["vendor","model",["type","tablet"]],[/(htc)[;_\s-]+([\w\s]+(?=\))|\w+)*/i,/(zte)-(\w+)*/i,
/(alcatel|geeksphone|huawei|lenovo|nexian|panasonic|(?=;\s)sony)[_\s-]?([\w-]+)*/i],["vendor",["model",/_/g," "],["type","mobile"]],[/(nexus\s9)/i],["model",["vendor","HTC"],["type","tablet"]],[/[\s\(;](xbox(?:\sone)?)[\s\);]/i],["model",["vendor","Microsoft"],["type","console"]],[/(kin\.[onetw]{3})/i],[["model",/\./g," "],["vendor","Microsoft"],["type","mobile"]],[/\s(milestone|droid(?:[2-4x]|\s(?:bionic|x2|pro|razr))?(:?\s4g)?)[\w\s]+build\//i,/mot[\s-]?(\w+)*/i,/(XT\d{3,4}) build\//i,/(nexus\s[6])/i],
["model",["vendor","Motorola"],["type","mobile"]],[/android.+\s(mz60\d|xoom[\s2]{0,2})\sbuild\//i],["model",["vendor","Motorola"],["type","tablet"]],[/android.+((sch-i[89]0\d|shw-m380s|gt-p\d{4}|gt-n8000|sgh-t8[56]9|nexus 10))/i,/((SM-T\w+))/i],[["vendor","Samsung"],"model",["type","tablet"]],[/((s[cgp]h-\w+|gt-\w+|galaxy\snexus|sm-n900))/i,/(sam[sung]*)[\s-]*(\w+-?[\w-]*)*/i,/sec-((sgh\w+))/i],[["vendor","Samsung"],"model",["type","mobile"]],[/(samsung);smarttv/i],["vendor","model",["type","smarttv"]],
[/\(dtv[\);].+(aquos)/i],["model",["vendor","Sharp"],["type","smarttv"]],[/sie-(\w+)*/i],["model",["vendor","Siemens"],["type","mobile"]],[/(maemo|nokia).*(n900|lumia\s\d+)/i,/(nokia)[\s_-]?([\w-]+)*/i],[["vendor","Nokia"],"model",["type","mobile"]],[/android\s3\.[\s\w;-]{10}(a\d{3})/i],["model",["vendor","Acer"],["type","tablet"]],[/android\s3\.[\s\w;-]{10}(lg?)-([06cv9]{3,4})/i],[["vendor","LG"],"model",["type","tablet"]],[/(lg) netcast\.tv/i],["vendor","model",["type","smarttv"]],[/(nexus\s[45])/i,
/lg[e;\s\/-]+(\w+)*/i],["model",["vendor","LG"],["type","mobile"]],[/android.+(ideatab[a-z0-9\-\s]+)/i],["model",["vendor","Lenovo"],["type","tablet"]],[/linux;.+((jolla));/i],["vendor","model",["type","mobile"]],[/((pebble))app\/[\d\.]+\s/i],["vendor","model",["type","wearable"]],[/android.+;\s(glass)\s\d/i],["model",["vendor","Google"],["type","wearable"]],[/android.+(\w+)\s+build\/hm\1/i,/android.+(hm[\s\-_]*note?[\s_]*(?:\d\w)?)\s+build/i,/android.+(mi[\s\-_]*(?:one|one[\s_]plus)?[\s_]*(?:\d\w)?)\s+build/i],
[["model",/_/g," "],["vendor","Xiaomi"],["type","mobile"]],[/\s(tablet)[;\/\s]/i,/\s(mobile)[;\/\s]/i],[["type",e.lowerize],"vendor","model"]],engine:[[/windows.+\sedge\/([\w\.]+)/i],["version",["name","EdgeHTML"]],[/(presto)\/([\w\.]+)/i,/(webkit|trident|netfront|netsurf|amaya|lynx|w3m)\/([\w\.]+)/i,/(khtml|tasman|links)[\/\s]\(?([\w\.]+)/i,/(icab)[\/\s]([23]\.[\d\.]+)/i],["name","version"],[/rv\:([\w\.]+).*(gecko)/i],["version","name"]],os:[[/microsoft\s(windows)\s(vista|xp)/i],["name","version"],
[/(windows)\snt\s6\.2;\s(arm)/i,/(windows\sphone(?:\sos)*|windows\smobile|windows)[\s\/]?([ntce\d\.\s]+\w)/i],["name",["version",b,c]],[/(win(?=3|9|n)|win\s9x\s)([nt\d\.]+)/i],[["name","Windows"],["version",b,c]],[/\((bb)(10);/i],[["name","BlackBerry"],"version"],[/(blackberry)\w*\/?([\w\.]+)*/i,/(tizen)[\/\s]([\w\.]+)/i,/(android|webos|palm\sos|qnx|bada|rim\stablet\sos|meego|contiki)[\/\s-]?([\w\.]+)*/i,/linux;.+(sailfish);/i],["name","version"],[/(symbian\s?os|symbos|s60(?=;))[\/\s-]?([\w\.]+)*/i],
[["name","Symbian"],"version"],[/\((series40);/i],["name"],[/mozilla.+\(mobile;.+gecko.+firefox/i],[["name","Firefox OS"],"version"],[/(nintendo|playstation)\s([wids34portablevu]+)/i,/(mint)[\/\s\(]?(\w+)*/i,/(mageia|vectorlinux)[;\s]/i,/(joli|[kxln]?ubuntu|debian|[open]*suse|gentoo|(?=\s)arch|slackware|fedora|mandriva|centos|pclinuxos|redhat|zenwalk|linpus)[\/\s-]?([\w\.-]+)*/i,/(hurd|linux)\s?([\w\.]+)*/i,/(gnu)\s?([\w\.]+)*/i],["name","version"],[/(cros)\s[\w]+\s([\w\.]+\w)/i],[["name","Chromium OS"],
"version"],[/(sunos)\s?([\w\.]+\d)*/i],[["name","Solaris"],"version"],[/\s([frentopc-]{0,4}bsd|dragonfly)\s?([\w\.]+)*/i],["name","version"],[/(ip[honead]+)(?:.*os\s([\w]+)*\slike\smac|;\sopera)/i],[["name","iOS"],["version",/_/g,"."]],[/(mac\sos\sx)\s?([\w\s\.]+\w)*/i,/(macintosh|mac(?=_powerpc)\s)/i],[["name","Mac OS"],["version",/_/g,"."]],[/((?:open)?solaris)[\/\s-]?([\w\.]+)*/i,/(haiku)\s(\w+)/i,/(aix)\s((\d)(?=\.|\)|\s)[\w\.]*)*/i,/(plan\s9|minix|beos|os\/2|amigaos|morphos|risc\sos|openvms)/i,
/(unix)\s?([\w\.]+)*/i],["name","version"]]},g=function(b,c){if(!(this instanceof g))return(new g(b,c)).getResult();var d=b||(f&&f.navigator&&f.navigator.userAgent?f.navigator.userAgent:""),n=c?e.extend(a,c):a;this.getBrowser=function(){var a=p.apply(this,n.browser);a.major=e.major(a.version);return a};this.getCPU=function(){return p.apply(this,n.cpu)};this.getDevice=function(){return p.apply(this,n.device)};this.getEngine=function(){return p.apply(this,n.engine)};this.getOS=function(){return p.apply(this,
n.os)};this.getResult=function(){return{ua:this.getUA(),browser:this.getBrowser(),engine:this.getEngine(),os:this.getOS(),device:this.getDevice(),cpu:this.getCPU()}};this.getUA=function(){return d};this.setUA=function(a){d=a;return this};this.setUA(d);return this};g.VERSION="0.7.10";g.BROWSER={NAME:"name",MAJOR:"major",VERSION:"version"};g.CPU={ARCHITECTURE:"architecture"};g.DEVICE={MODEL:"model",VENDOR:"vendor",TYPE:"type",CONSOLE:"console",MOBILE:"mobile",SMARTTV:"smarttv",TABLET:"tablet",WEARABLE:"wearable",
EMBEDDED:"embedded"};g.ENGINE={NAME:"name",VERSION:"version"};g.OS={NAME:"name",VERSION:"version"};"undefined"!==typeof exports?("undefined"!==typeof module&&module.exports&&(exports=module.exports=g),exports.UAParser=g):"function"===typeof define&&define.amd?define(function(){return g}):f.UAParser=g;var n=f.jQuery||f.Zepto;if("undefined"!==typeof n){var v=new g;n.ua=v.getResult();n.ua.get=function(){return v.getUA()};n.ua.set=function(a){v.setUA(a);a=v.getResult();for(var b in a)n.ua[b]=a[b]}}})("object"===
typeof window?window:this);





!function(e){"function"==typeof define&&define.amd?define(["jquery"],e):"undefined"!=typeof module&&module.exports?module.exports=e:e(jQuery,window,document)}(function(e){!function(t){var o="function"==typeof define&&define.amd,a="undefined"!=typeof module&&module.exports,n="https:"==document.location.protocol?"https:":"http:",i="cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js";o||(a?require("jquery-mousewheel")(e):e.event.special.mousewheel||e("head").append(decodeURI("%3Cscript src="+n+"//"+i+"%3E%3C/script%3E"))),t()}(function(){var t,o="mCustomScrollbar",a="mCS",n=".mCustomScrollbar",i={setTop:0,setLeft:0,axis:"y",scrollbarPosition:"inside",scrollInertia:950,autoDraggerLength:!0,alwaysShowScrollbar:0,snapOffset:0,mouseWheel:{enable:!0,scrollAmount:"auto",axis:"y",deltaFactor:"auto",disableOver:["select","option","keygen","datalist","textarea"]},scrollButtons:{scrollType:"stepless",scrollAmount:"auto"},keyboard:{enable:!0,scrollType:"stepless",scrollAmount:"auto"},contentTouchScroll:25,documentTouchScroll:!0,advanced:{autoScrollOnFocus:"input,textarea,select,button,datalist,keygen,a[tabindex],area,object,[contenteditable='true']",updateOnContentResize:!0,updateOnImageLoad:"auto",autoUpdateTimeout:60},theme:"light",callbacks:{onTotalScrollOffset:0,onTotalScrollBackOffset:0,alwaysTriggerOffsets:!0}},r=0,l={},s=window.attachEvent&&!window.addEventListener?1:0,c=!1,d=["mCSB_dragger_onDrag","mCSB_scrollTools_onDrag","mCS_img_loaded","mCS_disabled","mCS_destroyed","mCS_no_scrollbar","mCS-autoHide","mCS-dir-rtl","mCS_no_scrollbar_y","mCS_no_scrollbar_x","mCS_y_hidden","mCS_x_hidden","mCSB_draggerContainer","mCSB_buttonUp","mCSB_buttonDown","mCSB_buttonLeft","mCSB_buttonRight"],u={init:function(t){var t=e.extend(!0,{},i,t),o=f.call(this);if(t.live){var s=t.liveSelector||this.selector||n,c=e(s);if("off"===t.live)return void m(s);l[s]=setTimeout(function(){c.mCustomScrollbar(t),"once"===t.live&&c.length&&m(s)},500)}else m(s);return t.setWidth=t.set_width?t.set_width:t.setWidth,t.setHeight=t.set_height?t.set_height:t.setHeight,t.axis=t.horizontalScroll?"x":p(t.axis),t.scrollInertia=t.scrollInertia>0&&t.scrollInertia<17?17:t.scrollInertia,"object"!=typeof t.mouseWheel&&1==t.mouseWheel&&(t.mouseWheel={enable:!0,scrollAmount:"auto",axis:"y",preventDefault:!1,deltaFactor:"auto",normalizeDelta:!1,invert:!1}),t.mouseWheel.scrollAmount=t.mouseWheelPixels?t.mouseWheelPixels:t.mouseWheel.scrollAmount,t.mouseWheel.normalizeDelta=t.advanced.normalizeMouseWheelDelta?t.advanced.normalizeMouseWheelDelta:t.mouseWheel.normalizeDelta,t.scrollButtons.scrollType=g(t.scrollButtons.scrollType),h(t),e(o).each(function(){var o=e(this);if(!o.data(a)){o.data(a,{idx:++r,opt:t,scrollRatio:{y:null,x:null},overflowed:null,contentReset:{y:null,x:null},bindEvents:!1,tweenRunning:!1,sequential:{},langDir:o.css("direction"),cbOffsets:null,trigger:null,poll:{size:{o:0,n:0},img:{o:0,n:0},change:{o:0,n:0}}});var n=o.data(a),i=n.opt,l=o.data("mcs-axis"),s=o.data("mcs-scrollbar-position"),c=o.data("mcs-theme");l&&(i.axis=l),s&&(i.scrollbarPosition=s),c&&(i.theme=c,h(i)),v.call(this),n&&i.callbacks.onCreate&&"function"==typeof i.callbacks.onCreate&&i.callbacks.onCreate.call(this),e("#mCSB_"+n.idx+"_container img:not(."+d[2]+")").addClass(d[2]),u.update.call(null,o)}})},update:function(t,o){var n=t||f.call(this);return e(n).each(function(){var t=e(this);if(t.data(a)){var n=t.data(a),i=n.opt,r=e("#mCSB_"+n.idx+"_container"),l=e("#mCSB_"+n.idx),s=[e("#mCSB_"+n.idx+"_dragger_vertical"),e("#mCSB_"+n.idx+"_dragger_horizontal")];if(!r.length)return;n.tweenRunning&&Q(t),o&&n&&i.callbacks.onBeforeUpdate&&"function"==typeof i.callbacks.onBeforeUpdate&&i.callbacks.onBeforeUpdate.call(this),t.hasClass(d[3])&&t.removeClass(d[3]),t.hasClass(d[4])&&t.removeClass(d[4]),l.css("max-height","none"),l.height()!==t.height()&&l.css("max-height",t.height()),_.call(this),"y"===i.axis||i.advanced.autoExpandHorizontalScroll||r.css("width",x(r)),n.overflowed=y.call(this),M.call(this),i.autoDraggerLength&&S.call(this),b.call(this),T.call(this);var c=[Math.abs(r[0].offsetTop),Math.abs(r[0].offsetLeft)];"x"!==i.axis&&(n.overflowed[0]?s[0].height()>s[0].parent().height()?B.call(this):(G(t,c[0].toString(),{dir:"y",dur:0,overwrite:"none"}),n.contentReset.y=null):(B.call(this),"y"===i.axis?k.call(this):"yx"===i.axis&&n.overflowed[1]&&G(t,c[1].toString(),{dir:"x",dur:0,overwrite:"none"}))),"y"!==i.axis&&(n.overflowed[1]?s[1].width()>s[1].parent().width()?B.call(this):(G(t,c[1].toString(),{dir:"x",dur:0,overwrite:"none"}),n.contentReset.x=null):(B.call(this),"x"===i.axis?k.call(this):"yx"===i.axis&&n.overflowed[0]&&G(t,c[0].toString(),{dir:"y",dur:0,overwrite:"none"}))),o&&n&&(2===o&&i.callbacks.onImageLoad&&"function"==typeof i.callbacks.onImageLoad?i.callbacks.onImageLoad.call(this):3===o&&i.callbacks.onSelectorChange&&"function"==typeof i.callbacks.onSelectorChange?i.callbacks.onSelectorChange.call(this):i.callbacks.onUpdate&&"function"==typeof i.callbacks.onUpdate&&i.callbacks.onUpdate.call(this)),N.call(this)}})},scrollTo:function(t,o){if("undefined"!=typeof t&&null!=t){var n=f.call(this);return e(n).each(function(){var n=e(this);if(n.data(a)){var i=n.data(a),r=i.opt,l={trigger:"external",scrollInertia:r.scrollInertia,scrollEasing:"mcsEaseInOut",moveDragger:!1,timeout:60,callbacks:!0,onStart:!0,onUpdate:!0,onComplete:!0},s=e.extend(!0,{},l,o),c=Y.call(this,t),d=s.scrollInertia>0&&s.scrollInertia<17?17:s.scrollInertia;c[0]=X.call(this,c[0],"y"),c[1]=X.call(this,c[1],"x"),s.moveDragger&&(c[0]*=i.scrollRatio.y,c[1]*=i.scrollRatio.x),s.dur=ne()?0:d,setTimeout(function(){null!==c[0]&&"undefined"!=typeof c[0]&&"x"!==r.axis&&i.overflowed[0]&&(s.dir="y",s.overwrite="all",G(n,c[0].toString(),s)),null!==c[1]&&"undefined"!=typeof c[1]&&"y"!==r.axis&&i.overflowed[1]&&(s.dir="x",s.overwrite="none",G(n,c[1].toString(),s))},s.timeout)}})}},stop:function(){var t=f.call(this);return e(t).each(function(){var t=e(this);t.data(a)&&Q(t)})},disable:function(t){var o=f.call(this);return e(o).each(function(){var o=e(this);if(o.data(a)){o.data(a);N.call(this,"remove"),k.call(this),t&&B.call(this),M.call(this,!0),o.addClass(d[3])}})},destroy:function(){var t=f.call(this);return e(t).each(function(){var n=e(this);if(n.data(a)){var i=n.data(a),r=i.opt,l=e("#mCSB_"+i.idx),s=e("#mCSB_"+i.idx+"_container"),c=e(".mCSB_"+i.idx+"_scrollbar");r.live&&m(r.liveSelector||e(t).selector),N.call(this,"remove"),k.call(this),B.call(this),n.removeData(a),$(this,"mcs"),c.remove(),s.find("img."+d[2]).removeClass(d[2]),l.replaceWith(s.contents()),n.removeClass(o+" _"+a+"_"+i.idx+" "+d[6]+" "+d[7]+" "+d[5]+" "+d[3]).addClass(d[4])}})}},f=function(){return"object"!=typeof e(this)||e(this).length<1?n:this},h=function(t){var o=["rounded","rounded-dark","rounded-dots","rounded-dots-dark"],a=["rounded-dots","rounded-dots-dark","3d","3d-dark","3d-thick","3d-thick-dark","inset","inset-dark","inset-2","inset-2-dark","inset-3","inset-3-dark"],n=["minimal","minimal-dark"],i=["minimal","minimal-dark"],r=["minimal","minimal-dark"];t.autoDraggerLength=e.inArray(t.theme,o)>-1?!1:t.autoDraggerLength,t.autoExpandScrollbar=e.inArray(t.theme,a)>-1?!1:t.autoExpandScrollbar,t.scrollButtons.enable=e.inArray(t.theme,n)>-1?!1:t.scrollButtons.enable,t.autoHideScrollbar=e.inArray(t.theme,i)>-1?!0:t.autoHideScrollbar,t.scrollbarPosition=e.inArray(t.theme,r)>-1?"outside":t.scrollbarPosition},m=function(e){l[e]&&(clearTimeout(l[e]),$(l,e))},p=function(e){return"yx"===e||"xy"===e||"auto"===e?"yx":"x"===e||"horizontal"===e?"x":"y"},g=function(e){return"stepped"===e||"pixels"===e||"step"===e||"click"===e?"stepped":"stepless"},v=function(){var t=e(this),n=t.data(a),i=n.opt,r=i.autoExpandScrollbar?" "+d[1]+"_expand":"",l=["<div id='mCSB_"+n.idx+"_scrollbar_vertical' class='mCSB_scrollTools mCSB_"+n.idx+"_scrollbar mCS-"+i.theme+" mCSB_scrollTools_vertical"+r+"'><div class='"+d[12]+"'><div id='mCSB_"+n.idx+"_dragger_vertical' class='mCSB_dragger' style='position:absolute;'><div class='mCSB_dragger_bar' /></div><div class='mCSB_draggerRail' /></div></div>","<div id='mCSB_"+n.idx+"_scrollbar_horizontal' class='mCSB_scrollTools mCSB_"+n.idx+"_scrollbar mCS-"+i.theme+" mCSB_scrollTools_horizontal"+r+"'><div class='"+d[12]+"'><div id='mCSB_"+n.idx+"_dragger_horizontal' class='mCSB_dragger' style='position:absolute;'><div class='mCSB_dragger_bar' /></div><div class='mCSB_draggerRail' /></div></div>"],s="yx"===i.axis?"mCSB_vertical_horizontal":"x"===i.axis?"mCSB_horizontal":"mCSB_vertical",c="yx"===i.axis?l[0]+l[1]:"x"===i.axis?l[1]:l[0],u="yx"===i.axis?"<div id='mCSB_"+n.idx+"_container_wrapper' class='mCSB_container_wrapper' />":"",f=i.autoHideScrollbar?" "+d[6]:"",h="x"!==i.axis&&"rtl"===n.langDir?" "+d[7]:"";i.setWidth&&t.css("width",i.setWidth),i.setHeight&&t.css("height",i.setHeight),i.setLeft="y"!==i.axis&&"rtl"===n.langDir?"989999px":i.setLeft,t.addClass(o+" _"+a+"_"+n.idx+f+h).wrapInner("<div id='mCSB_"+n.idx+"' class='mCustomScrollBox mCS-"+i.theme+" "+s+"'><div id='mCSB_"+n.idx+"_container' class='mCSB_container' style='position:relative; top:"+i.setTop+"; left:"+i.setLeft+";' dir='"+n.langDir+"' /></div>");var m=e("#mCSB_"+n.idx),p=e("#mCSB_"+n.idx+"_container");"y"===i.axis||i.advanced.autoExpandHorizontalScroll||p.css("width",x(p)),"outside"===i.scrollbarPosition?("static"===t.css("position")&&t.css("position","relative"),t.css("overflow","visible"),m.addClass("mCSB_outside").after(c)):(m.addClass("mCSB_inside").append(c),p.wrap(u)),w.call(this);var g=[e("#mCSB_"+n.idx+"_dragger_vertical"),e("#mCSB_"+n.idx+"_dragger_horizontal")];g[0].css("min-height",g[0].height()),g[1].css("min-width",g[1].width())},x=function(t){var o=[t[0].scrollWidth,Math.max.apply(Math,t.children().map(function(){return e(this).outerWidth(!0)}).get())],a=t.parent().width();return o[0]>a?o[0]:o[1]>a?o[1]:"100%"},_=function(){var t=e(this),o=t.data(a),n=o.opt,i=e("#mCSB_"+o.idx+"_container");if(n.advanced.autoExpandHorizontalScroll&&"y"!==n.axis){i.css({width:"auto","min-width":0,"overflow-x":"scroll"});var r=Math.ceil(i[0].scrollWidth);3===n.advanced.autoExpandHorizontalScroll||2!==n.advanced.autoExpandHorizontalScroll&&r>i.parent().width()?i.css({width:r,"min-width":"100%","overflow-x":"inherit"}):i.css({"overflow-x":"inherit",position:"absolute"}).wrap("<div class='mCSB_h_wrapper' style='position:relative; left:0; width:999999px;' />").css({width:Math.ceil(i[0].getBoundingClientRect().right+.4)-Math.floor(i[0].getBoundingClientRect().left),"min-width":"100%",position:"relative"}).unwrap()}},w=function(){var t=e(this),o=t.data(a),n=o.opt,i=e(".mCSB_"+o.idx+"_scrollbar:first"),r=oe(n.scrollButtons.tabindex)?"tabindex='"+n.scrollButtons.tabindex+"'":"",l=["<a href='#' class='"+d[13]+"' "+r+" />","<a href='#' class='"+d[14]+"' "+r+" />","<a href='#' class='"+d[15]+"' "+r+" />","<a href='#' class='"+d[16]+"' "+r+" />"],s=["x"===n.axis?l[2]:l[0],"x"===n.axis?l[3]:l[1],l[2],l[3]];n.scrollButtons.enable&&i.prepend(s[0]).append(s[1]).next(".mCSB_scrollTools").prepend(s[2]).append(s[3])},S=function(){var t=e(this),o=t.data(a),n=e("#mCSB_"+o.idx),i=e("#mCSB_"+o.idx+"_container"),r=[e("#mCSB_"+o.idx+"_dragger_vertical"),e("#mCSB_"+o.idx+"_dragger_horizontal")],l=[n.height()/i.outerHeight(!1),n.width()/i.outerWidth(!1)],c=[parseInt(r[0].css("min-height")),Math.round(l[0]*r[0].parent().height()),parseInt(r[1].css("min-width")),Math.round(l[1]*r[1].parent().width())],d=s&&c[1]<c[0]?c[0]:c[1],u=s&&c[3]<c[2]?c[2]:c[3];r[0].css({height:d,"max-height":r[0].parent().height()-10}).find(".mCSB_dragger_bar").css({"line-height":c[0]+"px"}),r[1].css({width:u,"max-width":r[1].parent().width()-10})},b=function(){var t=e(this),o=t.data(a),n=e("#mCSB_"+o.idx),i=e("#mCSB_"+o.idx+"_container"),r=[e("#mCSB_"+o.idx+"_dragger_vertical"),e("#mCSB_"+o.idx+"_dragger_horizontal")],l=[i.outerHeight(!1)-n.height(),i.outerWidth(!1)-n.width()],s=[l[0]/(r[0].parent().height()-r[0].height()),l[1]/(r[1].parent().width()-r[1].width())];o.scrollRatio={y:s[0],x:s[1]}},C=function(e,t,o){var a=o?d[0]+"_expanded":"",n=e.closest(".mCSB_scrollTools");"active"===t?(e.toggleClass(d[0]+" "+a),n.toggleClass(d[1]),e[0]._draggable=e[0]._draggable?0:1):e[0]._draggable||("hide"===t?(e.removeClass(d[0]),n.removeClass(d[1])):(e.addClass(d[0]),n.addClass(d[1])))},y=function(){var t=e(this),o=t.data(a),n=e("#mCSB_"+o.idx),i=e("#mCSB_"+o.idx+"_container"),r=null==o.overflowed?i.height():i.outerHeight(!1),l=null==o.overflowed?i.width():i.outerWidth(!1),s=i[0].scrollHeight,c=i[0].scrollWidth;return s>r&&(r=s),c>l&&(l=c),[r>n.height(),l>n.width()]},B=function(){var t=e(this),o=t.data(a),n=o.opt,i=e("#mCSB_"+o.idx),r=e("#mCSB_"+o.idx+"_container"),l=[e("#mCSB_"+o.idx+"_dragger_vertical"),e("#mCSB_"+o.idx+"_dragger_horizontal")];if(Q(t),("x"!==n.axis&&!o.overflowed[0]||"y"===n.axis&&o.overflowed[0])&&(l[0].add(r).css("top",0),G(t,"_resetY")),"y"!==n.axis&&!o.overflowed[1]||"x"===n.axis&&o.overflowed[1]){var s=dx=0;"rtl"===o.langDir&&(s=i.width()-r.outerWidth(!1),dx=Math.abs(s/o.scrollRatio.x)),r.css("left",s),l[1].css("left",dx),G(t,"_resetX")}},T=function(){function t(){r=setTimeout(function(){e.event.special.mousewheel?(clearTimeout(r),W.call(o[0])):t()},100)}var o=e(this),n=o.data(a),i=n.opt;if(!n.bindEvents){if(I.call(this),i.contentTouchScroll&&D.call(this),E.call(this),i.mouseWheel.enable){var r;t()}P.call(this),U.call(this),i.advanced.autoScrollOnFocus&&H.call(this),i.scrollButtons.enable&&F.call(this),i.keyboard.enable&&q.call(this),n.bindEvents=!0}},k=function(){var t=e(this),o=t.data(a),n=o.opt,i=a+"_"+o.idx,r=".mCSB_"+o.idx+"_scrollbar",l=e("#mCSB_"+o.idx+",#mCSB_"+o.idx+"_container,#mCSB_"+o.idx+"_container_wrapper,"+r+" ."+d[12]+",#mCSB_"+o.idx+"_dragger_vertical,#mCSB_"+o.idx+"_dragger_horizontal,"+r+">a"),s=e("#mCSB_"+o.idx+"_container");n.advanced.releaseDraggableSelectors&&l.add(e(n.advanced.releaseDraggableSelectors)),n.advanced.extraDraggableSelectors&&l.add(e(n.advanced.extraDraggableSelectors)),o.bindEvents&&(e(document).add(e(!A()||top.document)).unbind("."+i),l.each(function(){e(this).unbind("."+i)}),clearTimeout(t[0]._focusTimeout),$(t[0],"_focusTimeout"),clearTimeout(o.sequential.step),$(o.sequential,"step"),clearTimeout(s[0].onCompleteTimeout),$(s[0],"onCompleteTimeout"),o.bindEvents=!1)},M=function(t){var o=e(this),n=o.data(a),i=n.opt,r=e("#mCSB_"+n.idx+"_container_wrapper"),l=r.length?r:e("#mCSB_"+n.idx+"_container"),s=[e("#mCSB_"+n.idx+"_scrollbar_vertical"),e("#mCSB_"+n.idx+"_scrollbar_horizontal")],c=[s[0].find(".mCSB_dragger"),s[1].find(".mCSB_dragger")];"x"!==i.axis&&(n.overflowed[0]&&!t?(s[0].add(c[0]).add(s[0].children("a")).css("display","block"),l.removeClass(d[8]+" "+d[10])):(i.alwaysShowScrollbar?(2!==i.alwaysShowScrollbar&&c[0].css("display","none"),l.removeClass(d[10])):(s[0].css("display","none"),l.addClass(d[10])),l.addClass(d[8]))),"y"!==i.axis&&(n.overflowed[1]&&!t?(s[1].add(c[1]).add(s[1].children("a")).css("display","block"),l.removeClass(d[9]+" "+d[11])):(i.alwaysShowScrollbar?(2!==i.alwaysShowScrollbar&&c[1].css("display","none"),l.removeClass(d[11])):(s[1].css("display","none"),l.addClass(d[11])),l.addClass(d[9]))),n.overflowed[0]||n.overflowed[1]?o.removeClass(d[5]):o.addClass(d[5])},O=function(t){var o=t.type,a=t.target.ownerDocument!==document&&null!==frameElement?[e(frameElement).offset().top,e(frameElement).offset().left]:null,n=A()&&t.target.ownerDocument!==top.document&&null!==frameElement?[e(t.view.frameElement).offset().top,e(t.view.frameElement).offset().left]:[0,0];switch(o){case"pointerdown":case"MSPointerDown":case"pointermove":case"MSPointerMove":case"pointerup":case"MSPointerUp":return a?[t.originalEvent.pageY-a[0]+n[0],t.originalEvent.pageX-a[1]+n[1],!1]:[t.originalEvent.pageY,t.originalEvent.pageX,!1];case"touchstart":case"touchmove":case"touchend":var i=t.originalEvent.touches[0]||t.originalEvent.changedTouches[0],r=t.originalEvent.touches.length||t.originalEvent.changedTouches.length;return t.target.ownerDocument!==document?[i.screenY,i.screenX,r>1]:[i.pageY,i.pageX,r>1];default:return a?[t.pageY-a[0]+n[0],t.pageX-a[1]+n[1],!1]:[t.pageY,t.pageX,!1]}},I=function(){function t(e,t,a,n){if(h[0].idleTimer=d.scrollInertia<233?250:0,o.attr("id")===f[1])var i="x",s=(o[0].offsetLeft-t+n)*l.scrollRatio.x;else var i="y",s=(o[0].offsetTop-e+a)*l.scrollRatio.y;G(r,s.toString(),{dir:i,drag:!0})}var o,n,i,r=e(this),l=r.data(a),d=l.opt,u=a+"_"+l.idx,f=["mCSB_"+l.idx+"_dragger_vertical","mCSB_"+l.idx+"_dragger_horizontal"],h=e("#mCSB_"+l.idx+"_container"),m=e("#"+f[0]+",#"+f[1]),p=d.advanced.releaseDraggableSelectors?m.add(e(d.advanced.releaseDraggableSelectors)):m,g=d.advanced.extraDraggableSelectors?e(!A()||top.document).add(e(d.advanced.extraDraggableSelectors)):e(!A()||top.document);m.bind("contextmenu."+u,function(e){e.preventDefault()}).bind("mousedown."+u+" touchstart."+u+" pointerdown."+u+" MSPointerDown."+u,function(t){if(t.stopImmediatePropagation(),t.preventDefault(),ee(t)){c=!0,s&&(document.onselectstart=function(){return!1}),L.call(h,!1),Q(r),o=e(this);var a=o.offset(),l=O(t)[0]-a.top,u=O(t)[1]-a.left,f=o.height()+a.top,m=o.width()+a.left;f>l&&l>0&&m>u&&u>0&&(n=l,i=u),C(o,"active",d.autoExpandScrollbar)}}).bind("touchmove."+u,function(e){e.stopImmediatePropagation(),e.preventDefault();var a=o.offset(),r=O(e)[0]-a.top,l=O(e)[1]-a.left;t(n,i,r,l)}),e(document).add(g).bind("mousemove."+u+" pointermove."+u+" MSPointerMove."+u,function(e){if(o){var a=o.offset(),r=O(e)[0]-a.top,l=O(e)[1]-a.left;if(n===r&&i===l)return;t(n,i,r,l)}}).add(p).bind("mouseup."+u+" touchend."+u+" pointerup."+u+" MSPointerUp."+u,function(e){o&&(C(o,"active",d.autoExpandScrollbar),o=null),c=!1,s&&(document.onselectstart=null),L.call(h,!0)})},D=function(){function o(e){if(!te(e)||c||O(e)[2])return void(t=0);t=1,b=0,C=0,d=1,y.removeClass("mCS_touch_action");var o=I.offset();u=O(e)[0]-o.top,f=O(e)[1]-o.left,z=[O(e)[0],O(e)[1]]}function n(e){if(te(e)&&!c&&!O(e)[2]&&(T.documentTouchScroll||e.preventDefault(),e.stopImmediatePropagation(),(!C||b)&&d)){g=K();var t=M.offset(),o=O(e)[0]-t.top,a=O(e)[1]-t.left,n="mcsLinearOut";if(E.push(o),W.push(a),z[2]=Math.abs(O(e)[0]-z[0]),z[3]=Math.abs(O(e)[1]-z[1]),B.overflowed[0])var i=D[0].parent().height()-D[0].height(),r=u-o>0&&o-u>-(i*B.scrollRatio.y)&&(2*z[3]<z[2]||"yx"===T.axis);if(B.overflowed[1])var l=D[1].parent().width()-D[1].width(),h=f-a>0&&a-f>-(l*B.scrollRatio.x)&&(2*z[2]<z[3]||"yx"===T.axis);r||h?(U||e.preventDefault(),b=1):(C=1,y.addClass("mCS_touch_action")),U&&e.preventDefault(),w="yx"===T.axis?[u-o,f-a]:"x"===T.axis?[null,f-a]:[u-o,null],I[0].idleTimer=250,B.overflowed[0]&&s(w[0],R,n,"y","all",!0),B.overflowed[1]&&s(w[1],R,n,"x",L,!0)}}function i(e){if(!te(e)||c||O(e)[2])return void(t=0);t=1,e.stopImmediatePropagation(),Q(y),p=K();var o=M.offset();h=O(e)[0]-o.top,m=O(e)[1]-o.left,E=[],W=[]}function r(e){if(te(e)&&!c&&!O(e)[2]){d=0,e.stopImmediatePropagation(),b=0,C=0,v=K();var t=M.offset(),o=O(e)[0]-t.top,a=O(e)[1]-t.left;if(!(v-g>30)){_=1e3/(v-p);var n="mcsEaseOut",i=2.5>_,r=i?[E[E.length-2],W[W.length-2]]:[0,0];x=i?[o-r[0],a-r[1]]:[o-h,a-m];var u=[Math.abs(x[0]),Math.abs(x[1])];_=i?[Math.abs(x[0]/4),Math.abs(x[1]/4)]:[_,_];var f=[Math.abs(I[0].offsetTop)-x[0]*l(u[0]/_[0],_[0]),Math.abs(I[0].offsetLeft)-x[1]*l(u[1]/_[1],_[1])];w="yx"===T.axis?[f[0],f[1]]:"x"===T.axis?[null,f[1]]:[f[0],null],S=[4*u[0]+T.scrollInertia,4*u[1]+T.scrollInertia];var y=parseInt(T.contentTouchScroll)||0;w[0]=u[0]>y?w[0]:0,w[1]=u[1]>y?w[1]:0,B.overflowed[0]&&s(w[0],S[0],n,"y",L,!1),B.overflowed[1]&&s(w[1],S[1],n,"x",L,!1)}}}function l(e,t){var o=[1.5*t,2*t,t/1.5,t/2];return e>90?t>4?o[0]:o[3]:e>60?t>3?o[3]:o[2]:e>30?t>8?o[1]:t>6?o[0]:t>4?t:o[2]:t>8?t:o[3]}function s(e,t,o,a,n,i){e&&G(y,e.toString(),{dur:t,scrollEasing:o,dir:a,overwrite:n,drag:i})}var d,u,f,h,m,p,g,v,x,_,w,S,b,C,y=e(this),B=y.data(a),T=B.opt,k=a+"_"+B.idx,M=e("#mCSB_"+B.idx),I=e("#mCSB_"+B.idx+"_container"),D=[e("#mCSB_"+B.idx+"_dragger_vertical"),e("#mCSB_"+B.idx+"_dragger_horizontal")],E=[],W=[],R=0,L="yx"===T.axis?"none":"all",z=[],P=I.find("iframe"),H=["touchstart."+k+" pointerdown."+k+" MSPointerDown."+k,"touchmove."+k+" pointermove."+k+" MSPointerMove."+k,"touchend."+k+" pointerup."+k+" MSPointerUp."+k],U=void 0!==document.body.style.touchAction&&""!==document.body.style.touchAction;I.bind(H[0],function(e){o(e)}).bind(H[1],function(e){n(e)}),M.bind(H[0],function(e){i(e)}).bind(H[2],function(e){r(e)}),P.length&&P.each(function(){e(this).bind("load",function(){A(this)&&e(this.contentDocument||this.contentWindow.document).bind(H[0],function(e){o(e),i(e)}).bind(H[1],function(e){n(e)}).bind(H[2],function(e){r(e)})})})},E=function(){function o(){return window.getSelection?window.getSelection().toString():document.selection&&"Control"!=document.selection.type?document.selection.createRange().text:0}function n(e,t,o){d.type=o&&i?"stepped":"stepless",d.scrollAmount=10,j(r,e,t,"mcsLinearOut",o?60:null)}var i,r=e(this),l=r.data(a),s=l.opt,d=l.sequential,u=a+"_"+l.idx,f=e("#mCSB_"+l.idx+"_container"),h=f.parent();f.bind("mousedown."+u,function(e){t||i||(i=1,c=!0)}).add(document).bind("mousemove."+u,function(e){if(!t&&i&&o()){var a=f.offset(),r=O(e)[0]-a.top+f[0].offsetTop,c=O(e)[1]-a.left+f[0].offsetLeft;r>0&&r<h.height()&&c>0&&c<h.width()?d.step&&n("off",null,"stepped"):("x"!==s.axis&&l.overflowed[0]&&(0>r?n("on",38):r>h.height()&&n("on",40)),"y"!==s.axis&&l.overflowed[1]&&(0>c?n("on",37):c>h.width()&&n("on",39)))}}).bind("mouseup."+u+" dragend."+u,function(e){t||(i&&(i=0,n("off",null)),c=!1)})},W=function(){function t(t,a){if(Q(o),!z(o,t.target)){var r="auto"!==i.mouseWheel.deltaFactor?parseInt(i.mouseWheel.deltaFactor):s&&t.deltaFactor<100?100:t.deltaFactor||100,d=i.scrollInertia;if("x"===i.axis||"x"===i.mouseWheel.axis)var u="x",f=[Math.round(r*n.scrollRatio.x),parseInt(i.mouseWheel.scrollAmount)],h="auto"!==i.mouseWheel.scrollAmount?f[1]:f[0]>=l.width()?.9*l.width():f[0],m=Math.abs(e("#mCSB_"+n.idx+"_container")[0].offsetLeft),p=c[1][0].offsetLeft,g=c[1].parent().width()-c[1].width(),v="y"===i.mouseWheel.axis?t.deltaY||a:t.deltaX;else var u="y",f=[Math.round(r*n.scrollRatio.y),parseInt(i.mouseWheel.scrollAmount)],h="auto"!==i.mouseWheel.scrollAmount?f[1]:f[0]>=l.height()?.9*l.height():f[0],m=Math.abs(e("#mCSB_"+n.idx+"_container")[0].offsetTop),p=c[0][0].offsetTop,g=c[0].parent().height()-c[0].height(),v=t.deltaY||a;"y"===u&&!n.overflowed[0]||"x"===u&&!n.overflowed[1]||((i.mouseWheel.invert||t.webkitDirectionInvertedFromDevice)&&(v=-v),i.mouseWheel.normalizeDelta&&(v=0>v?-1:1),(v>0&&0!==p||0>v&&p!==g||i.mouseWheel.preventDefault)&&(t.stopImmediatePropagation(),t.preventDefault()),t.deltaFactor<5&&!i.mouseWheel.normalizeDelta&&(h=t.deltaFactor,d=17),G(o,(m-v*h).toString(),{dir:u,dur:d}))}}if(e(this).data(a)){var o=e(this),n=o.data(a),i=n.opt,r=a+"_"+n.idx,l=e("#mCSB_"+n.idx),c=[e("#mCSB_"+n.idx+"_dragger_vertical"),e("#mCSB_"+n.idx+"_dragger_horizontal")],d=e("#mCSB_"+n.idx+"_container").find("iframe");d.length&&d.each(function(){e(this).bind("load",function(){A(this)&&e(this.contentDocument||this.contentWindow.document).bind("mousewheel."+r,function(e,o){t(e,o)})})}),l.bind("mousewheel."+r,function(e,o){t(e,o)})}},R=new Object,A=function(t){var o=!1,a=!1,n=null;if(void 0===t?a="#empty":void 0!==e(t).attr("id")&&(a=e(t).attr("id")),a!==!1&&void 0!==R[a])return R[a];if(t){try{var i=t.contentDocument||t.contentWindow.document;n=i.body.innerHTML}catch(r){}o=null!==n}else{try{var i=top.document;n=i.body.innerHTML}catch(r){}o=null!==n}return a!==!1&&(R[a]=o),o},L=function(e){var t=this.find("iframe");if(t.length){var o=e?"auto":"none";t.css("pointer-events",o)}},z=function(t,o){var n=o.nodeName.toLowerCase(),i=t.data(a).opt.mouseWheel.disableOver,r=["select","textarea"];return e.inArray(n,i)>-1&&!(e.inArray(n,r)>-1&&!e(o).is(":focus"))},P=function(){var t,o=e(this),n=o.data(a),i=a+"_"+n.idx,r=e("#mCSB_"+n.idx+"_container"),l=r.parent(),s=e(".mCSB_"+n.idx+"_scrollbar ."+d[12]);s.bind("mousedown."+i+" touchstart."+i+" pointerdown."+i+" MSPointerDown."+i,function(o){c=!0,e(o.target).hasClass("mCSB_dragger")||(t=1)}).bind("touchend."+i+" pointerup."+i+" MSPointerUp."+i,function(e){c=!1}).bind("click."+i,function(a){if(t&&(t=0,e(a.target).hasClass(d[12])||e(a.target).hasClass("mCSB_draggerRail"))){Q(o);var i=e(this),s=i.find(".mCSB_dragger");if(i.parent(".mCSB_scrollTools_horizontal").length>0){if(!n.overflowed[1])return;var c="x",u=a.pageX>s.offset().left?-1:1,f=Math.abs(r[0].offsetLeft)-u*(.9*l.width())}else{if(!n.overflowed[0])return;var c="y",u=a.pageY>s.offset().top?-1:1,f=Math.abs(r[0].offsetTop)-u*(.9*l.height())}G(o,f.toString(),{dir:c,scrollEasing:"mcsEaseInOut"})}})},H=function(){var t=e(this),o=t.data(a),n=o.opt,i=a+"_"+o.idx,r=e("#mCSB_"+o.idx+"_container"),l=r.parent();r.bind("focusin."+i,function(o){var a=e(document.activeElement),i=r.find(".mCustomScrollBox").length,s=0;a.is(n.advanced.autoScrollOnFocus)&&(Q(t),clearTimeout(t[0]._focusTimeout),t[0]._focusTimer=i?(s+17)*i:0,t[0]._focusTimeout=setTimeout(function(){var e=[ae(a)[0],ae(a)[1]],o=[r[0].offsetTop,r[0].offsetLeft],i=[o[0]+e[0]>=0&&o[0]+e[0]<l.height()-a.outerHeight(!1),o[1]+e[1]>=0&&o[0]+e[1]<l.width()-a.outerWidth(!1)],c="yx"!==n.axis||i[0]||i[1]?"all":"none";"x"===n.axis||i[0]||G(t,e[0].toString(),{dir:"y",scrollEasing:"mcsEaseInOut",overwrite:c,dur:s}),"y"===n.axis||i[1]||G(t,e[1].toString(),{dir:"x",scrollEasing:"mcsEaseInOut",overwrite:c,dur:s})},t[0]._focusTimer))})},U=function(){var t=e(this),o=t.data(a),n=a+"_"+o.idx,i=e("#mCSB_"+o.idx+"_container").parent();i.bind("scroll."+n,function(t){0===i.scrollTop()&&0===i.scrollLeft()||e(".mCSB_"+o.idx+"_scrollbar").css("visibility","hidden")})},F=function(){var t=e(this),o=t.data(a),n=o.opt,i=o.sequential,r=a+"_"+o.idx,l=".mCSB_"+o.idx+"_scrollbar",s=e(l+">a");s.bind("contextmenu."+r,function(e){e.preventDefault()}).bind("mousedown."+r+" touchstart."+r+" pointerdown."+r+" MSPointerDown."+r+" mouseup."+r+" touchend."+r+" pointerup."+r+" MSPointerUp."+r+" mouseout."+r+" pointerout."+r+" MSPointerOut."+r+" click."+r,function(a){function r(e,o){i.scrollAmount=n.scrollButtons.scrollAmount,j(t,e,o)}if(a.preventDefault(),ee(a)){var l=e(this).attr("class");switch(i.type=n.scrollButtons.scrollType,a.type){case"mousedown":case"touchstart":case"pointerdown":case"MSPointerDown":if("stepped"===i.type)return;c=!0,o.tweenRunning=!1,r("on",l);break;case"mouseup":case"touchend":case"pointerup":case"MSPointerUp":case"mouseout":case"pointerout":case"MSPointerOut":if("stepped"===i.type)return;c=!1,i.dir&&r("off",l);break;case"click":if("stepped"!==i.type||o.tweenRunning)return;r("on",l)}}})},q=function(){function t(t){function a(e,t){r.type=i.keyboard.scrollType,r.scrollAmount=i.keyboard.scrollAmount,"stepped"===r.type&&n.tweenRunning||j(o,e,t)}switch(t.type){case"blur":n.tweenRunning&&r.dir&&a("off",null);break;case"keydown":case"keyup":var l=t.keyCode?t.keyCode:t.which,s="on";if("x"!==i.axis&&(38===l||40===l)||"y"!==i.axis&&(37===l||39===l)){if((38===l||40===l)&&!n.overflowed[0]||(37===l||39===l)&&!n.overflowed[1])return;"keyup"===t.type&&(s="off"),e(document.activeElement).is(u)||(t.preventDefault(),t.stopImmediatePropagation(),a(s,l))}else if(33===l||34===l){if((n.overflowed[0]||n.overflowed[1])&&(t.preventDefault(),t.stopImmediatePropagation()),"keyup"===t.type){Q(o);var f=34===l?-1:1;if("x"===i.axis||"yx"===i.axis&&n.overflowed[1]&&!n.overflowed[0])var h="x",m=Math.abs(c[0].offsetLeft)-f*(.9*d.width());else var h="y",m=Math.abs(c[0].offsetTop)-f*(.9*d.height());G(o,m.toString(),{dir:h,scrollEasing:"mcsEaseInOut"})}}else if((35===l||36===l)&&!e(document.activeElement).is(u)&&((n.overflowed[0]||n.overflowed[1])&&(t.preventDefault(),t.stopImmediatePropagation()),"keyup"===t.type)){if("x"===i.axis||"yx"===i.axis&&n.overflowed[1]&&!n.overflowed[0])var h="x",m=35===l?Math.abs(d.width()-c.outerWidth(!1)):0;else var h="y",m=35===l?Math.abs(d.height()-c.outerHeight(!1)):0;G(o,m.toString(),{dir:h,scrollEasing:"mcsEaseInOut"})}}}var o=e(this),n=o.data(a),i=n.opt,r=n.sequential,l=a+"_"+n.idx,s=e("#mCSB_"+n.idx),c=e("#mCSB_"+n.idx+"_container"),d=c.parent(),u="input,textarea,select,datalist,keygen,[contenteditable='true']",f=c.find("iframe"),h=["blur."+l+" keydown."+l+" keyup."+l];f.length&&f.each(function(){e(this).bind("load",function(){A(this)&&e(this.contentDocument||this.contentWindow.document).bind(h[0],function(e){t(e)})})}),s.attr("tabindex","0").bind(h[0],function(e){t(e)})},j=function(t,o,n,i,r){function l(e){u.snapAmount&&(f.scrollAmount=u.snapAmount instanceof Array?"x"===f.dir[0]?u.snapAmount[1]:u.snapAmount[0]:u.snapAmount);var o="stepped"!==f.type,a=r?r:e?o?p/1.5:g:1e3/60,n=e?o?7.5:40:2.5,s=[Math.abs(h[0].offsetTop),Math.abs(h[0].offsetLeft)],d=[c.scrollRatio.y>10?10:c.scrollRatio.y,c.scrollRatio.x>10?10:c.scrollRatio.x],m="x"===f.dir[0]?s[1]+f.dir[1]*(d[1]*n):s[0]+f.dir[1]*(d[0]*n),v="x"===f.dir[0]?s[1]+f.dir[1]*parseInt(f.scrollAmount):s[0]+f.dir[1]*parseInt(f.scrollAmount),x="auto"!==f.scrollAmount?v:m,_=i?i:e?o?"mcsLinearOut":"mcsEaseInOut":"mcsLinear",w=!!e;return e&&17>a&&(x="x"===f.dir[0]?s[1]:s[0]),G(t,x.toString(),{dir:f.dir[0],scrollEasing:_,dur:a,onComplete:w}),e?void(f.dir=!1):(clearTimeout(f.step),void(f.step=setTimeout(function(){l()},a)))}function s(){clearTimeout(f.step),$(f,"step"),Q(t)}var c=t.data(a),u=c.opt,f=c.sequential,h=e("#mCSB_"+c.idx+"_container"),m="stepped"===f.type,p=u.scrollInertia<26?26:u.scrollInertia,g=u.scrollInertia<1?17:u.scrollInertia;switch(o){case"on":if(f.dir=[n===d[16]||n===d[15]||39===n||37===n?"x":"y",n===d[13]||n===d[15]||38===n||37===n?-1:1],Q(t),oe(n)&&"stepped"===f.type)return;l(m);break;case"off":s(),(m||c.tweenRunning&&f.dir)&&l(!0)}},Y=function(t){var o=e(this).data(a).opt,n=[];return"function"==typeof t&&(t=t()),t instanceof Array?n=t.length>1?[t[0],t[1]]:"x"===o.axis?[null,t[0]]:[t[0],null]:(n[0]=t.y?t.y:t.x||"x"===o.axis?null:t,n[1]=t.x?t.x:t.y||"y"===o.axis?null:t),"function"==typeof n[0]&&(n[0]=n[0]()),"function"==typeof n[1]&&(n[1]=n[1]()),n},X=function(t,o){if(null!=t&&"undefined"!=typeof t){var n=e(this),i=n.data(a),r=i.opt,l=e("#mCSB_"+i.idx+"_container"),s=l.parent(),c=typeof t;o||(o="x"===r.axis?"x":"y");var d="x"===o?l.outerWidth(!1)-s.width():l.outerHeight(!1)-s.height(),f="x"===o?l[0].offsetLeft:l[0].offsetTop,h="x"===o?"left":"top";switch(c){case"function":return t();case"object":var m=t.jquery?t:e(t);if(!m.length)return;return"x"===o?ae(m)[1]:ae(m)[0];case"string":case"number":if(oe(t))return Math.abs(t);if(-1!==t.indexOf("%"))return Math.abs(d*parseInt(t)/100);if(-1!==t.indexOf("-="))return Math.abs(f-parseInt(t.split("-=")[1]));if(-1!==t.indexOf("+=")){var p=f+parseInt(t.split("+=")[1]);return p>=0?0:Math.abs(p)}if(-1!==t.indexOf("px")&&oe(t.split("px")[0]))return Math.abs(t.split("px")[0]);if("top"===t||"left"===t)return 0;if("bottom"===t)return Math.abs(s.height()-l.outerHeight(!1));if("right"===t)return Math.abs(s.width()-l.outerWidth(!1));if("first"===t||"last"===t){var m=l.find(":"+t);return"x"===o?ae(m)[1]:ae(m)[0]}return e(t).length?"x"===o?ae(e(t))[1]:ae(e(t))[0]:(l.css(h,t),void u.update.call(null,n[0]))}}},N=function(t){function o(){return clearTimeout(f[0].autoUpdate),0===l.parents("html").length?void(l=null):void(f[0].autoUpdate=setTimeout(function(){return c.advanced.updateOnSelectorChange&&(s.poll.change.n=i(),s.poll.change.n!==s.poll.change.o)?(s.poll.change.o=s.poll.change.n,void r(3)):c.advanced.updateOnContentResize&&(s.poll.size.n=l[0].scrollHeight+l[0].scrollWidth+f[0].offsetHeight+l[0].offsetHeight+l[0].offsetWidth,s.poll.size.n!==s.poll.size.o)?(s.poll.size.o=s.poll.size.n,void r(1)):!c.advanced.updateOnImageLoad||"auto"===c.advanced.updateOnImageLoad&&"y"===c.axis||(s.poll.img.n=f.find("img").length,s.poll.img.n===s.poll.img.o)?void((c.advanced.updateOnSelectorChange||c.advanced.updateOnContentResize||c.advanced.updateOnImageLoad)&&o()):(s.poll.img.o=s.poll.img.n,void f.find("img").each(function(){n(this)}))},c.advanced.autoUpdateTimeout))}function n(t){function o(e,t){return function(){
return t.apply(e,arguments)}}function a(){this.onload=null,e(t).addClass(d[2]),r(2)}if(e(t).hasClass(d[2]))return void r();var n=new Image;n.onload=o(n,a),n.src=t.src}function i(){c.advanced.updateOnSelectorChange===!0&&(c.advanced.updateOnSelectorChange="*");var e=0,t=f.find(c.advanced.updateOnSelectorChange);return c.advanced.updateOnSelectorChange&&t.length>0&&t.each(function(){e+=this.offsetHeight+this.offsetWidth}),e}function r(e){clearTimeout(f[0].autoUpdate),u.update.call(null,l[0],e)}var l=e(this),s=l.data(a),c=s.opt,f=e("#mCSB_"+s.idx+"_container");return t?(clearTimeout(f[0].autoUpdate),void $(f[0],"autoUpdate")):void o()},V=function(e,t,o){return Math.round(e/t)*t-o},Q=function(t){var o=t.data(a),n=e("#mCSB_"+o.idx+"_container,#mCSB_"+o.idx+"_container_wrapper,#mCSB_"+o.idx+"_dragger_vertical,#mCSB_"+o.idx+"_dragger_horizontal");n.each(function(){Z.call(this)})},G=function(t,o,n){function i(e){return s&&c.callbacks[e]&&"function"==typeof c.callbacks[e]}function r(){return[c.callbacks.alwaysTriggerOffsets||w>=S[0]+y,c.callbacks.alwaysTriggerOffsets||-B>=w]}function l(){var e=[h[0].offsetTop,h[0].offsetLeft],o=[x[0].offsetTop,x[0].offsetLeft],a=[h.outerHeight(!1),h.outerWidth(!1)],i=[f.height(),f.width()];t[0].mcs={content:h,top:e[0],left:e[1],draggerTop:o[0],draggerLeft:o[1],topPct:Math.round(100*Math.abs(e[0])/(Math.abs(a[0])-i[0])),leftPct:Math.round(100*Math.abs(e[1])/(Math.abs(a[1])-i[1])),direction:n.dir}}var s=t.data(a),c=s.opt,d={trigger:"internal",dir:"y",scrollEasing:"mcsEaseOut",drag:!1,dur:c.scrollInertia,overwrite:"all",callbacks:!0,onStart:!0,onUpdate:!0,onComplete:!0},n=e.extend(d,n),u=[n.dur,n.drag?0:n.dur],f=e("#mCSB_"+s.idx),h=e("#mCSB_"+s.idx+"_container"),m=h.parent(),p=c.callbacks.onTotalScrollOffset?Y.call(t,c.callbacks.onTotalScrollOffset):[0,0],g=c.callbacks.onTotalScrollBackOffset?Y.call(t,c.callbacks.onTotalScrollBackOffset):[0,0];if(s.trigger=n.trigger,0===m.scrollTop()&&0===m.scrollLeft()||(e(".mCSB_"+s.idx+"_scrollbar").css("visibility","visible"),m.scrollTop(0).scrollLeft(0)),"_resetY"!==o||s.contentReset.y||(i("onOverflowYNone")&&c.callbacks.onOverflowYNone.call(t[0]),s.contentReset.y=1),"_resetX"!==o||s.contentReset.x||(i("onOverflowXNone")&&c.callbacks.onOverflowXNone.call(t[0]),s.contentReset.x=1),"_resetY"!==o&&"_resetX"!==o){if(!s.contentReset.y&&t[0].mcs||!s.overflowed[0]||(i("onOverflowY")&&c.callbacks.onOverflowY.call(t[0]),s.contentReset.x=null),!s.contentReset.x&&t[0].mcs||!s.overflowed[1]||(i("onOverflowX")&&c.callbacks.onOverflowX.call(t[0]),s.contentReset.x=null),c.snapAmount){var v=c.snapAmount instanceof Array?"x"===n.dir?c.snapAmount[1]:c.snapAmount[0]:c.snapAmount;o=V(o,v,c.snapOffset)}switch(n.dir){case"x":var x=e("#mCSB_"+s.idx+"_dragger_horizontal"),_="left",w=h[0].offsetLeft,S=[f.width()-h.outerWidth(!1),x.parent().width()-x.width()],b=[o,0===o?0:o/s.scrollRatio.x],y=p[1],B=g[1],T=y>0?y/s.scrollRatio.x:0,k=B>0?B/s.scrollRatio.x:0;break;case"y":var x=e("#mCSB_"+s.idx+"_dragger_vertical"),_="top",w=h[0].offsetTop,S=[f.height()-h.outerHeight(!1),x.parent().height()-x.height()],b=[o,0===o?0:o/s.scrollRatio.y],y=p[0],B=g[0],T=y>0?y/s.scrollRatio.y:0,k=B>0?B/s.scrollRatio.y:0}b[1]<0||0===b[0]&&0===b[1]?b=[0,0]:b[1]>=S[1]?b=[S[0],S[1]]:b[0]=-b[0],t[0].mcs||(l(),i("onInit")&&c.callbacks.onInit.call(t[0])),clearTimeout(h[0].onCompleteTimeout),J(x[0],_,Math.round(b[1]),u[1],n.scrollEasing),!s.tweenRunning&&(0===w&&b[0]>=0||w===S[0]&&b[0]<=S[0])||J(h[0],_,Math.round(b[0]),u[0],n.scrollEasing,n.overwrite,{onStart:function(){n.callbacks&&n.onStart&&!s.tweenRunning&&(i("onScrollStart")&&(l(),c.callbacks.onScrollStart.call(t[0])),s.tweenRunning=!0,C(x),s.cbOffsets=r())},onUpdate:function(){n.callbacks&&n.onUpdate&&i("whileScrolling")&&(l(),c.callbacks.whileScrolling.call(t[0]))},onComplete:function(){if(n.callbacks&&n.onComplete){"yx"===c.axis&&clearTimeout(h[0].onCompleteTimeout);var e=h[0].idleTimer||0;h[0].onCompleteTimeout=setTimeout(function(){i("onScroll")&&(l(),c.callbacks.onScroll.call(t[0])),i("onTotalScroll")&&b[1]>=S[1]-T&&s.cbOffsets[0]&&(l(),c.callbacks.onTotalScroll.call(t[0])),i("onTotalScrollBack")&&b[1]<=k&&s.cbOffsets[1]&&(l(),c.callbacks.onTotalScrollBack.call(t[0])),s.tweenRunning=!1,h[0].idleTimer=0,C(x,"hide")},e)}}})}},J=function(e,t,o,a,n,i,r){function l(){S.stop||(x||m.call(),x=K()-v,s(),x>=S.time&&(S.time=x>S.time?x+f-(x-S.time):x+f-1,S.time<x+1&&(S.time=x+1)),S.time<a?S.id=h(l):g.call())}function s(){a>0?(S.currVal=u(S.time,_,b,a,n),w[t]=Math.round(S.currVal)+"px"):w[t]=o+"px",p.call()}function c(){f=1e3/60,S.time=x+f,h=window.requestAnimationFrame?window.requestAnimationFrame:function(e){return s(),setTimeout(e,.01)},S.id=h(l)}function d(){null!=S.id&&(window.requestAnimationFrame?window.cancelAnimationFrame(S.id):clearTimeout(S.id),S.id=null)}function u(e,t,o,a,n){switch(n){case"linear":case"mcsLinear":return o*e/a+t;case"mcsLinearOut":return e/=a,e--,o*Math.sqrt(1-e*e)+t;case"easeInOutSmooth":return e/=a/2,1>e?o/2*e*e+t:(e--,-o/2*(e*(e-2)-1)+t);case"easeInOutStrong":return e/=a/2,1>e?o/2*Math.pow(2,10*(e-1))+t:(e--,o/2*(-Math.pow(2,-10*e)+2)+t);case"easeInOut":case"mcsEaseInOut":return e/=a/2,1>e?o/2*e*e*e+t:(e-=2,o/2*(e*e*e+2)+t);case"easeOutSmooth":return e/=a,e--,-o*(e*e*e*e-1)+t;case"easeOutStrong":return o*(-Math.pow(2,-10*e/a)+1)+t;case"easeOut":case"mcsEaseOut":default:var i=(e/=a)*e,r=i*e;return t+o*(.499999999999997*r*i+-2.5*i*i+5.5*r+-6.5*i+4*e)}}e._mTween||(e._mTween={top:{},left:{}});var f,h,r=r||{},m=r.onStart||function(){},p=r.onUpdate||function(){},g=r.onComplete||function(){},v=K(),x=0,_=e.offsetTop,w=e.style,S=e._mTween[t];"left"===t&&(_=e.offsetLeft);var b=o-_;S.stop=0,"none"!==i&&d(),c()},K=function(){return window.performance&&window.performance.now?window.performance.now():window.performance&&window.performance.webkitNow?window.performance.webkitNow():Date.now?Date.now():(new Date).getTime()},Z=function(){var e=this;e._mTween||(e._mTween={top:{},left:{}});for(var t=["top","left"],o=0;o<t.length;o++){var a=t[o];e._mTween[a].id&&(window.requestAnimationFrame?window.cancelAnimationFrame(e._mTween[a].id):clearTimeout(e._mTween[a].id),e._mTween[a].id=null,e._mTween[a].stop=1)}},$=function(e,t){try{delete e[t]}catch(o){e[t]=null}},ee=function(e){return!(e.which&&1!==e.which)},te=function(e){var t=e.originalEvent.pointerType;return!(t&&"touch"!==t&&2!==t)},oe=function(e){return!isNaN(parseFloat(e))&&isFinite(e)},ae=function(e){var t=e.parents(".mCSB_container");return[e.offset().top-t.offset().top,e.offset().left-t.offset().left]},ne=function(){function e(){var e=["webkit","moz","ms","o"];if("hidden"in document)return"hidden";for(var t=0;t<e.length;t++)if(e[t]+"Hidden"in document)return e[t]+"Hidden";return null}var t=e();return t?document[t]:!1};e.fn[o]=function(t){return u[t]?u[t].apply(this,Array.prototype.slice.call(arguments,1)):"object"!=typeof t&&t?void e.error("Method "+t+" does not exist"):u.init.apply(this,arguments)},e[o]=function(t){return u[t]?u[t].apply(this,Array.prototype.slice.call(arguments,1)):"object"!=typeof t&&t?void e.error("Method "+t+" does not exist"):u.init.apply(this,arguments)},e[o].defaults=i,window[o]=!0,e(window).bind("load",function(){e(n)[o](),e.extend(e.expr[":"],{mcsInView:e.expr[":"].mcsInView||function(t){var o,a,n=e(t),i=n.parents(".mCSB_container");if(i.length)return o=i.parent(),a=[i[0].offsetTop,i[0].offsetLeft],a[0]+ae(n)[0]>=0&&a[0]+ae(n)[0]<o.height()-n.outerHeight(!1)&&a[1]+ae(n)[1]>=0&&a[1]+ae(n)[1]<o.width()-n.outerWidth(!1)},mcsInSight:e.expr[":"].mcsInSight||function(t,o,a){var n,i,r,l,s=e(t),c=s.parents(".mCSB_container"),d="exact"===a[3]?[[1,0],[1,0]]:[[.9,.1],[.6,.4]];if(c.length)return n=[s.outerHeight(!1),s.outerWidth(!1)],r=[c[0].offsetTop+ae(s)[0],c[0].offsetLeft+ae(s)[1]],i=[c.parent()[0].offsetHeight,c.parent()[0].offsetWidth],l=[n[0]<i[0]?d[0]:d[1],n[1]<i[1]?d[0]:d[1]],r[0]-i[0]*l[0][0]<0&&r[0]+n[0]-i[0]*l[0][1]>=0&&r[1]-i[1]*l[1][0]<0&&r[1]+n[1]-i[1]*l[1][1]>=0},mcsOverflow:e.expr[":"].mcsOverflow||function(t){var o=e(t).data(a);if(o)return o.overflowed[0]||o.overflowed[1]}})})})});
//# sourceMappingURL=jquery.mCustomScrollbar.min.js.map




/*!
 * VERSION: 1.18.0
 * DATE: 2015-09-05
 * UPDATES AND DOCS AT: http://greensock.com
 * 
 * Includes all of the following: TweenLite, TweenMax, TimelineLite, TimelineMax, EasePack, CSSPlugin, RoundPropsPlugin, BezierPlugin, AttrPlugin, DirectionalRotationPlugin
 *
 * @license Copyright (c) 2008-2015, GreenSock. All rights reserved.
 * This work is subject to the terms at http://greensock.com/standard-license or for
 * Club GreenSock members, the software agreement that was issued with your membership.
 * 
 * @author: Jack Doyle, jack@greensock.com
 **/
var _gsScope="undefined"!=typeof module&&module.exports&&"undefined"!=typeof global?global:this||window;(_gsScope._gsQueue||(_gsScope._gsQueue=[])).push(function(){"use strict";_gsScope._gsDefine("TweenMax",["core.Animation","core.SimpleTimeline","TweenLite"],function(t,e,i){var s=function(t){var e,i=[],s=t.length;for(e=0;e!==s;i.push(t[e++]));return i},r=function(t,e,i){var s,r,n=t.cycle;for(s in n)r=n[s],t[s]="function"==typeof r?r.call(e[i],i):r[i%r.length];delete t.cycle},n=function(t,e,s){i.call(this,t,e,s),this._cycle=0,this._yoyo=this.vars.yoyo===!0,this._repeat=this.vars.repeat||0,this._repeatDelay=this.vars.repeatDelay||0,this._dirty=!0,this.render=n.prototype.render},a=1e-10,o=i._internals,l=o.isSelector,h=o.isArray,_=n.prototype=i.to({},.1,{}),u=[];n.version="1.18.0",_.constructor=n,_.kill()._gc=!1,n.killTweensOf=n.killDelayedCallsTo=i.killTweensOf,n.getTweensOf=i.getTweensOf,n.lagSmoothing=i.lagSmoothing,n.ticker=i.ticker,n.render=i.render,_.invalidate=function(){return this._yoyo=this.vars.yoyo===!0,this._repeat=this.vars.repeat||0,this._repeatDelay=this.vars.repeatDelay||0,this._uncache(!0),i.prototype.invalidate.call(this)},_.updateTo=function(t,e){var s,r=this.ratio,n=this.vars.immediateRender||t.immediateRender;e&&this._startTime<this._timeline._time&&(this._startTime=this._timeline._time,this._uncache(!1),this._gc?this._enabled(!0,!1):this._timeline.insert(this,this._startTime-this._delay));for(s in t)this.vars[s]=t[s];if(this._initted||n)if(e)this._initted=!1,n&&this.render(0,!0,!0);else if(this._gc&&this._enabled(!0,!1),this._notifyPluginsOfEnabled&&this._firstPT&&i._onPluginEvent("_onDisable",this),this._time/this._duration>.998){var a=this._time;this.render(0,!0,!1),this._initted=!1,this.render(a,!0,!1)}else if(this._time>0||n){this._initted=!1,this._init();for(var o,l=1/(1-r),h=this._firstPT;h;)o=h.s+h.c,h.c*=l,h.s=o-h.c,h=h._next}return this},_.render=function(t,e,i){this._initted||0===this._duration&&this.vars.repeat&&this.invalidate();var s,r,n,l,h,_,u,c,f=this._dirty?this.totalDuration():this._totalDuration,p=this._time,m=this._totalTime,d=this._cycle,g=this._duration,v=this._rawPrevTime;if(t>=f?(this._totalTime=f,this._cycle=this._repeat,this._yoyo&&0!==(1&this._cycle)?(this._time=0,this.ratio=this._ease._calcEnd?this._ease.getRatio(0):0):(this._time=g,this.ratio=this._ease._calcEnd?this._ease.getRatio(1):1),this._reversed||(s=!0,r="onComplete",i=i||this._timeline.autoRemoveChildren),0===g&&(this._initted||!this.vars.lazy||i)&&(this._startTime===this._timeline._duration&&(t=0),(0===t||0>v||v===a)&&v!==t&&(i=!0,v>a&&(r="onReverseComplete")),this._rawPrevTime=c=!e||t||v===t?t:a)):1e-7>t?(this._totalTime=this._time=this._cycle=0,this.ratio=this._ease._calcEnd?this._ease.getRatio(0):0,(0!==m||0===g&&v>0)&&(r="onReverseComplete",s=this._reversed),0>t&&(this._active=!1,0===g&&(this._initted||!this.vars.lazy||i)&&(v>=0&&(i=!0),this._rawPrevTime=c=!e||t||v===t?t:a)),this._initted||(i=!0)):(this._totalTime=this._time=t,0!==this._repeat&&(l=g+this._repeatDelay,this._cycle=this._totalTime/l>>0,0!==this._cycle&&this._cycle===this._totalTime/l&&this._cycle--,this._time=this._totalTime-this._cycle*l,this._yoyo&&0!==(1&this._cycle)&&(this._time=g-this._time),this._time>g?this._time=g:0>this._time&&(this._time=0)),this._easeType?(h=this._time/g,_=this._easeType,u=this._easePower,(1===_||3===_&&h>=.5)&&(h=1-h),3===_&&(h*=2),1===u?h*=h:2===u?h*=h*h:3===u?h*=h*h*h:4===u&&(h*=h*h*h*h),this.ratio=1===_?1-h:2===_?h:.5>this._time/g?h/2:1-h/2):this.ratio=this._ease.getRatio(this._time/g)),p===this._time&&!i&&d===this._cycle)return m!==this._totalTime&&this._onUpdate&&(e||this._callback("onUpdate")),void 0;if(!this._initted){if(this._init(),!this._initted||this._gc)return;if(!i&&this._firstPT&&(this.vars.lazy!==!1&&this._duration||this.vars.lazy&&!this._duration))return this._time=p,this._totalTime=m,this._rawPrevTime=v,this._cycle=d,o.lazyTweens.push(this),this._lazy=[t,e],void 0;this._time&&!s?this.ratio=this._ease.getRatio(this._time/g):s&&this._ease._calcEnd&&(this.ratio=this._ease.getRatio(0===this._time?0:1))}for(this._lazy!==!1&&(this._lazy=!1),this._active||!this._paused&&this._time!==p&&t>=0&&(this._active=!0),0===m&&(2===this._initted&&t>0&&this._init(),this._startAt&&(t>=0?this._startAt.render(t,e,i):r||(r="_dummyGS")),this.vars.onStart&&(0!==this._totalTime||0===g)&&(e||this._callback("onStart"))),n=this._firstPT;n;)n.f?n.t[n.p](n.c*this.ratio+n.s):n.t[n.p]=n.c*this.ratio+n.s,n=n._next;this._onUpdate&&(0>t&&this._startAt&&this._startTime&&this._startAt.render(t,e,i),e||(this._totalTime!==m||s)&&this._callback("onUpdate")),this._cycle!==d&&(e||this._gc||this.vars.onRepeat&&this._callback("onRepeat")),r&&(!this._gc||i)&&(0>t&&this._startAt&&!this._onUpdate&&this._startTime&&this._startAt.render(t,e,i),s&&(this._timeline.autoRemoveChildren&&this._enabled(!1,!1),this._active=!1),!e&&this.vars[r]&&this._callback(r),0===g&&this._rawPrevTime===a&&c!==a&&(this._rawPrevTime=0))},n.to=function(t,e,i){return new n(t,e,i)},n.from=function(t,e,i){return i.runBackwards=!0,i.immediateRender=0!=i.immediateRender,new n(t,e,i)},n.fromTo=function(t,e,i,s){return s.startAt=i,s.immediateRender=0!=s.immediateRender&&0!=i.immediateRender,new n(t,e,s)},n.staggerTo=n.allTo=function(t,e,a,o,_,c,f){o=o||0;var p,m,d,g,v=a.delay||0,y=[],T=function(){a.onComplete&&a.onComplete.apply(a.onCompleteScope||this,arguments),_.apply(f||a.callbackScope||this,c||u)},x=a.cycle,w=a.startAt&&a.startAt.cycle;for(h(t)||("string"==typeof t&&(t=i.selector(t)||t),l(t)&&(t=s(t))),t=t||[],0>o&&(t=s(t),t.reverse(),o*=-1),p=t.length-1,d=0;p>=d;d++){m={};for(g in a)m[g]=a[g];if(x&&r(m,t,d),w){w=m.startAt={};for(g in a.startAt)w[g]=a.startAt[g];r(m.startAt,t,d)}m.delay=v,d===p&&_&&(m.onComplete=T),y[d]=new n(t[d],e,m),v+=o}return y},n.staggerFrom=n.allFrom=function(t,e,i,s,r,a,o){return i.runBackwards=!0,i.immediateRender=0!=i.immediateRender,n.staggerTo(t,e,i,s,r,a,o)},n.staggerFromTo=n.allFromTo=function(t,e,i,s,r,a,o,l){return s.startAt=i,s.immediateRender=0!=s.immediateRender&&0!=i.immediateRender,n.staggerTo(t,e,s,r,a,o,l)},n.delayedCall=function(t,e,i,s,r){return new n(e,0,{delay:t,onComplete:e,onCompleteParams:i,callbackScope:s,onReverseComplete:e,onReverseCompleteParams:i,immediateRender:!1,useFrames:r,overwrite:0})},n.set=function(t,e){return new n(t,0,e)},n.isTweening=function(t){return i.getTweensOf(t,!0).length>0};var c=function(t,e){for(var s=[],r=0,n=t._first;n;)n instanceof i?s[r++]=n:(e&&(s[r++]=n),s=s.concat(c(n,e)),r=s.length),n=n._next;return s},f=n.getAllTweens=function(e){return c(t._rootTimeline,e).concat(c(t._rootFramesTimeline,e))};n.killAll=function(t,i,s,r){null==i&&(i=!0),null==s&&(s=!0);var n,a,o,l=f(0!=r),h=l.length,_=i&&s&&r;for(o=0;h>o;o++)a=l[o],(_||a instanceof e||(n=a.target===a.vars.onComplete)&&s||i&&!n)&&(t?a.totalTime(a._reversed?0:a.totalDuration()):a._enabled(!1,!1))},n.killChildTweensOf=function(t,e){if(null!=t){var r,a,_,u,c,f=o.tweenLookup;if("string"==typeof t&&(t=i.selector(t)||t),l(t)&&(t=s(t)),h(t))for(u=t.length;--u>-1;)n.killChildTweensOf(t[u],e);else{r=[];for(_ in f)for(a=f[_].target.parentNode;a;)a===t&&(r=r.concat(f[_].tweens)),a=a.parentNode;for(c=r.length,u=0;c>u;u++)e&&r[u].totalTime(r[u].totalDuration()),r[u]._enabled(!1,!1)}}};var p=function(t,i,s,r){i=i!==!1,s=s!==!1,r=r!==!1;for(var n,a,o=f(r),l=i&&s&&r,h=o.length;--h>-1;)a=o[h],(l||a instanceof e||(n=a.target===a.vars.onComplete)&&s||i&&!n)&&a.paused(t)};return n.pauseAll=function(t,e,i){p(!0,t,e,i)},n.resumeAll=function(t,e,i){p(!1,t,e,i)},n.globalTimeScale=function(e){var s=t._rootTimeline,r=i.ticker.time;return arguments.length?(e=e||a,s._startTime=r-(r-s._startTime)*s._timeScale/e,s=t._rootFramesTimeline,r=i.ticker.frame,s._startTime=r-(r-s._startTime)*s._timeScale/e,s._timeScale=t._rootTimeline._timeScale=e,e):s._timeScale},_.progress=function(t){return arguments.length?this.totalTime(this.duration()*(this._yoyo&&0!==(1&this._cycle)?1-t:t)+this._cycle*(this._duration+this._repeatDelay),!1):this._time/this.duration()},_.totalProgress=function(t){return arguments.length?this.totalTime(this.totalDuration()*t,!1):this._totalTime/this.totalDuration()},_.time=function(t,e){return arguments.length?(this._dirty&&this.totalDuration(),t>this._duration&&(t=this._duration),this._yoyo&&0!==(1&this._cycle)?t=this._duration-t+this._cycle*(this._duration+this._repeatDelay):0!==this._repeat&&(t+=this._cycle*(this._duration+this._repeatDelay)),this.totalTime(t,e)):this._time},_.duration=function(e){return arguments.length?t.prototype.duration.call(this,e):this._duration},_.totalDuration=function(t){return arguments.length?-1===this._repeat?this:this.duration((t-this._repeat*this._repeatDelay)/(this._repeat+1)):(this._dirty&&(this._totalDuration=-1===this._repeat?999999999999:this._duration*(this._repeat+1)+this._repeatDelay*this._repeat,this._dirty=!1),this._totalDuration)},_.repeat=function(t){return arguments.length?(this._repeat=t,this._uncache(!0)):this._repeat},_.repeatDelay=function(t){return arguments.length?(this._repeatDelay=t,this._uncache(!0)):this._repeatDelay},_.yoyo=function(t){return arguments.length?(this._yoyo=t,this):this._yoyo},n},!0),_gsScope._gsDefine("TimelineLite",["core.Animation","core.SimpleTimeline","TweenLite"],function(t,e,i){var s=function(t){e.call(this,t),this._labels={},this.autoRemoveChildren=this.vars.autoRemoveChildren===!0,this.smoothChildTiming=this.vars.smoothChildTiming===!0,this._sortChildren=!0,this._onUpdate=this.vars.onUpdate;var i,s,r=this.vars;for(s in r)i=r[s],l(i)&&-1!==i.join("").indexOf("{self}")&&(r[s]=this._swapSelfInParams(i));l(r.tweens)&&this.add(r.tweens,0,r.align,r.stagger)},r=1e-10,n=i._internals,a=s._internals={},o=n.isSelector,l=n.isArray,h=n.lazyTweens,_=n.lazyRender,u=_gsScope._gsDefine.globals,c=function(t){var e,i={};for(e in t)i[e]=t[e];return i},f=function(t,e,i){var s,r,n=t.cycle;for(s in n)r=n[s],t[s]="function"==typeof r?r.call(e[i],i):r[i%r.length];delete t.cycle},p=a.pauseCallback=function(){},m=function(t){var e,i=[],s=t.length;for(e=0;e!==s;i.push(t[e++]));return i},d=s.prototype=new e;return s.version="1.18.0",d.constructor=s,d.kill()._gc=d._forcingPlayhead=d._hasPause=!1,d.to=function(t,e,s,r){var n=s.repeat&&u.TweenMax||i;return e?this.add(new n(t,e,s),r):this.set(t,s,r)},d.from=function(t,e,s,r){return this.add((s.repeat&&u.TweenMax||i).from(t,e,s),r)},d.fromTo=function(t,e,s,r,n){var a=r.repeat&&u.TweenMax||i;return e?this.add(a.fromTo(t,e,s,r),n):this.set(t,r,n)},d.staggerTo=function(t,e,r,n,a,l,h,_){var u,p,d=new s({onComplete:l,onCompleteParams:h,callbackScope:_,smoothChildTiming:this.smoothChildTiming}),g=r.cycle;for("string"==typeof t&&(t=i.selector(t)||t),t=t||[],o(t)&&(t=m(t)),n=n||0,0>n&&(t=m(t),t.reverse(),n*=-1),p=0;t.length>p;p++)u=c(r),u.startAt&&(u.startAt=c(u.startAt),u.startAt.cycle&&f(u.startAt,t,p)),g&&f(u,t,p),d.to(t[p],e,u,p*n);return this.add(d,a)},d.staggerFrom=function(t,e,i,s,r,n,a,o){return i.immediateRender=0!=i.immediateRender,i.runBackwards=!0,this.staggerTo(t,e,i,s,r,n,a,o)},d.staggerFromTo=function(t,e,i,s,r,n,a,o,l){return s.startAt=i,s.immediateRender=0!=s.immediateRender&&0!=i.immediateRender,this.staggerTo(t,e,s,r,n,a,o,l)},d.call=function(t,e,s,r){return this.add(i.delayedCall(0,t,e,s),r)},d.set=function(t,e,s){return s=this._parseTimeOrLabel(s,0,!0),null==e.immediateRender&&(e.immediateRender=s===this._time&&!this._paused),this.add(new i(t,0,e),s)},s.exportRoot=function(t,e){t=t||{},null==t.smoothChildTiming&&(t.smoothChildTiming=!0);var r,n,a=new s(t),o=a._timeline;for(null==e&&(e=!0),o._remove(a,!0),a._startTime=0,a._rawPrevTime=a._time=a._totalTime=o._time,r=o._first;r;)n=r._next,e&&r instanceof i&&r.target===r.vars.onComplete||a.add(r,r._startTime-r._delay),r=n;return o.add(a,0),a},d.add=function(r,n,a,o){var h,_,u,c,f,p;if("number"!=typeof n&&(n=this._parseTimeOrLabel(n,0,!0,r)),!(r instanceof t)){if(r instanceof Array||r&&r.push&&l(r)){for(a=a||"normal",o=o||0,h=n,_=r.length,u=0;_>u;u++)l(c=r[u])&&(c=new s({tweens:c})),this.add(c,h),"string"!=typeof c&&"function"!=typeof c&&("sequence"===a?h=c._startTime+c.totalDuration()/c._timeScale:"start"===a&&(c._startTime-=c.delay())),h+=o;return this._uncache(!0)}if("string"==typeof r)return this.addLabel(r,n);if("function"!=typeof r)throw"Cannot add "+r+" into the timeline; it is not a tween, timeline, function, or string.";r=i.delayedCall(0,r)}if(e.prototype.add.call(this,r,n),(this._gc||this._time===this._duration)&&!this._paused&&this._duration<this.duration())for(f=this,p=f.rawTime()>r._startTime;f._timeline;)p&&f._timeline.smoothChildTiming?f.totalTime(f._totalTime,!0):f._gc&&f._enabled(!0,!1),f=f._timeline;return this},d.remove=function(e){if(e instanceof t){this._remove(e,!1);var i=e._timeline=e.vars.useFrames?t._rootFramesTimeline:t._rootTimeline;return e._startTime=(e._paused?e._pauseTime:i._time)-(e._reversed?e.totalDuration()-e._totalTime:e._totalTime)/e._timeScale,this}if(e instanceof Array||e&&e.push&&l(e)){for(var s=e.length;--s>-1;)this.remove(e[s]);return this}return"string"==typeof e?this.removeLabel(e):this.kill(null,e)},d._remove=function(t,i){e.prototype._remove.call(this,t,i);var s=this._last;return s?this._time>s._startTime+s._totalDuration/s._timeScale&&(this._time=this.duration(),this._totalTime=this._totalDuration):this._time=this._totalTime=this._duration=this._totalDuration=0,this},d.append=function(t,e){return this.add(t,this._parseTimeOrLabel(null,e,!0,t))},d.insert=d.insertMultiple=function(t,e,i,s){return this.add(t,e||0,i,s)},d.appendMultiple=function(t,e,i,s){return this.add(t,this._parseTimeOrLabel(null,e,!0,t),i,s)},d.addLabel=function(t,e){return this._labels[t]=this._parseTimeOrLabel(e),this},d.addPause=function(t,e,s,r){var n=i.delayedCall(0,p,s,r||this);return n.vars.onComplete=n.vars.onReverseComplete=e,n.data="isPause",this._hasPause=!0,this.add(n,t)},d.removeLabel=function(t){return delete this._labels[t],this},d.getLabelTime=function(t){return null!=this._labels[t]?this._labels[t]:-1},d._parseTimeOrLabel=function(e,i,s,r){var n;if(r instanceof t&&r.timeline===this)this.remove(r);else if(r&&(r instanceof Array||r.push&&l(r)))for(n=r.length;--n>-1;)r[n]instanceof t&&r[n].timeline===this&&this.remove(r[n]);if("string"==typeof i)return this._parseTimeOrLabel(i,s&&"number"==typeof e&&null==this._labels[i]?e-this.duration():0,s);if(i=i||0,"string"!=typeof e||!isNaN(e)&&null==this._labels[e])null==e&&(e=this.duration());else{if(n=e.indexOf("="),-1===n)return null==this._labels[e]?s?this._labels[e]=this.duration()+i:i:this._labels[e]+i;i=parseInt(e.charAt(n-1)+"1",10)*Number(e.substr(n+1)),e=n>1?this._parseTimeOrLabel(e.substr(0,n-1),0,s):this.duration()}return Number(e)+i},d.seek=function(t,e){return this.totalTime("number"==typeof t?t:this._parseTimeOrLabel(t),e!==!1)},d.stop=function(){return this.paused(!0)},d.gotoAndPlay=function(t,e){return this.play(t,e)},d.gotoAndStop=function(t,e){return this.pause(t,e)},d.render=function(t,e,i){this._gc&&this._enabled(!0,!1);var s,n,a,o,l,u,c=this._dirty?this.totalDuration():this._totalDuration,f=this._time,p=this._startTime,m=this._timeScale,d=this._paused;if(t>=c)this._totalTime=this._time=c,this._reversed||this._hasPausedChild()||(n=!0,o="onComplete",l=!!this._timeline.autoRemoveChildren,0===this._duration&&(0===t||0>this._rawPrevTime||this._rawPrevTime===r)&&this._rawPrevTime!==t&&this._first&&(l=!0,this._rawPrevTime>r&&(o="onReverseComplete"))),this._rawPrevTime=this._duration||!e||t||this._rawPrevTime===t?t:r,t=c+1e-4;else if(1e-7>t)if(this._totalTime=this._time=0,(0!==f||0===this._duration&&this._rawPrevTime!==r&&(this._rawPrevTime>0||0>t&&this._rawPrevTime>=0))&&(o="onReverseComplete",n=this._reversed),0>t)this._active=!1,this._timeline.autoRemoveChildren&&this._reversed?(l=n=!0,o="onReverseComplete"):this._rawPrevTime>=0&&this._first&&(l=!0),this._rawPrevTime=t;else{if(this._rawPrevTime=this._duration||!e||t||this._rawPrevTime===t?t:r,0===t&&n)for(s=this._first;s&&0===s._startTime;)s._duration||(n=!1),s=s._next;t=0,this._initted||(l=!0)}else{if(this._hasPause&&!this._forcingPlayhead&&!e){if(t>=f)for(s=this._first;s&&t>=s._startTime&&!u;)s._duration||"isPause"!==s.data||s.ratio||0===s._startTime&&0===this._rawPrevTime||(u=s),s=s._next;else for(s=this._last;s&&s._startTime>=t&&!u;)s._duration||"isPause"===s.data&&s._rawPrevTime>0&&(u=s),s=s._prev;u&&(this._time=t=u._startTime,this._totalTime=t+this._cycle*(this._totalDuration+this._repeatDelay))}this._totalTime=this._time=this._rawPrevTime=t}if(this._time!==f&&this._first||i||l||u){if(this._initted||(this._initted=!0),this._active||!this._paused&&this._time!==f&&t>0&&(this._active=!0),0===f&&this.vars.onStart&&0!==this._time&&(e||this._callback("onStart")),this._time>=f)for(s=this._first;s&&(a=s._next,!this._paused||d);)(s._active||s._startTime<=this._time&&!s._paused&&!s._gc)&&(u===s&&this.pause(),s._reversed?s.render((s._dirty?s.totalDuration():s._totalDuration)-(t-s._startTime)*s._timeScale,e,i):s.render((t-s._startTime)*s._timeScale,e,i)),s=a;else for(s=this._last;s&&(a=s._prev,!this._paused||d);){if(s._active||f>=s._startTime&&!s._paused&&!s._gc){if(u===s){for(u=s._prev;u&&u.endTime()>this._time;)u.render(u._reversed?u.totalDuration()-(t-u._startTime)*u._timeScale:(t-u._startTime)*u._timeScale,e,i),u=u._prev;u=null,this.pause()}s._reversed?s.render((s._dirty?s.totalDuration():s._totalDuration)-(t-s._startTime)*s._timeScale,e,i):s.render((t-s._startTime)*s._timeScale,e,i)}s=a}this._onUpdate&&(e||(h.length&&_(),this._callback("onUpdate"))),o&&(this._gc||(p===this._startTime||m!==this._timeScale)&&(0===this._time||c>=this.totalDuration())&&(n&&(h.length&&_(),this._timeline.autoRemoveChildren&&this._enabled(!1,!1),this._active=!1),!e&&this.vars[o]&&this._callback(o)))}},d._hasPausedChild=function(){for(var t=this._first;t;){if(t._paused||t instanceof s&&t._hasPausedChild())return!0;t=t._next}return!1},d.getChildren=function(t,e,s,r){r=r||-9999999999;for(var n=[],a=this._first,o=0;a;)r>a._startTime||(a instanceof i?e!==!1&&(n[o++]=a):(s!==!1&&(n[o++]=a),t!==!1&&(n=n.concat(a.getChildren(!0,e,s)),o=n.length))),a=a._next;return n},d.getTweensOf=function(t,e){var s,r,n=this._gc,a=[],o=0;for(n&&this._enabled(!0,!0),s=i.getTweensOf(t),r=s.length;--r>-1;)(s[r].timeline===this||e&&this._contains(s[r]))&&(a[o++]=s[r]);return n&&this._enabled(!1,!0),a},d.recent=function(){return this._recent},d._contains=function(t){for(var e=t.timeline;e;){if(e===this)return!0;e=e.timeline}return!1},d.shiftChildren=function(t,e,i){i=i||0;for(var s,r=this._first,n=this._labels;r;)r._startTime>=i&&(r._startTime+=t),r=r._next;if(e)for(s in n)n[s]>=i&&(n[s]+=t);return this._uncache(!0)},d._kill=function(t,e){if(!t&&!e)return this._enabled(!1,!1);for(var i=e?this.getTweensOf(e):this.getChildren(!0,!0,!1),s=i.length,r=!1;--s>-1;)i[s]._kill(t,e)&&(r=!0);return r},d.clear=function(t){var e=this.getChildren(!1,!0,!0),i=e.length;for(this._time=this._totalTime=0;--i>-1;)e[i]._enabled(!1,!1);return t!==!1&&(this._labels={}),this._uncache(!0)},d.invalidate=function(){for(var e=this._first;e;)e.invalidate(),e=e._next;return t.prototype.invalidate.call(this)},d._enabled=function(t,i){if(t===this._gc)for(var s=this._first;s;)s._enabled(t,!0),s=s._next;return e.prototype._enabled.call(this,t,i)},d.totalTime=function(){this._forcingPlayhead=!0;var e=t.prototype.totalTime.apply(this,arguments);return this._forcingPlayhead=!1,e},d.duration=function(t){return arguments.length?(0!==this.duration()&&0!==t&&this.timeScale(this._duration/t),this):(this._dirty&&this.totalDuration(),this._duration)},d.totalDuration=function(t){if(!arguments.length){if(this._dirty){for(var e,i,s=0,r=this._last,n=999999999999;r;)e=r._prev,r._dirty&&r.totalDuration(),r._startTime>n&&this._sortChildren&&!r._paused?this.add(r,r._startTime-r._delay):n=r._startTime,0>r._startTime&&!r._paused&&(s-=r._startTime,this._timeline.smoothChildTiming&&(this._startTime+=r._startTime/this._timeScale),this.shiftChildren(-r._startTime,!1,-9999999999),n=0),i=r._startTime+r._totalDuration/r._timeScale,i>s&&(s=i),r=e;this._duration=this._totalDuration=s,this._dirty=!1}return this._totalDuration}return 0!==this.totalDuration()&&0!==t&&this.timeScale(this._totalDuration/t),this},d.paused=function(e){if(!e)for(var i=this._first,s=this._time;i;)i._startTime===s&&"isPause"===i.data&&(i._rawPrevTime=0),i=i._next;return t.prototype.paused.apply(this,arguments)},d.usesFrames=function(){for(var e=this._timeline;e._timeline;)e=e._timeline;return e===t._rootFramesTimeline},d.rawTime=function(){return this._paused?this._totalTime:(this._timeline.rawTime()-this._startTime)*this._timeScale},s},!0),_gsScope._gsDefine("TimelineMax",["TimelineLite","TweenLite","easing.Ease"],function(t,e,i){var s=function(e){t.call(this,e),this._repeat=this.vars.repeat||0,this._repeatDelay=this.vars.repeatDelay||0,this._cycle=0,this._yoyo=this.vars.yoyo===!0,this._dirty=!0},r=1e-10,n=e._internals,a=n.lazyTweens,o=n.lazyRender,l=new i(null,null,1,0),h=s.prototype=new t;return h.constructor=s,h.kill()._gc=!1,s.version="1.18.0",h.invalidate=function(){return this._yoyo=this.vars.yoyo===!0,this._repeat=this.vars.repeat||0,this._repeatDelay=this.vars.repeatDelay||0,this._uncache(!0),t.prototype.invalidate.call(this)},h.addCallback=function(t,i,s,r){return this.add(e.delayedCall(0,t,s,r),i)},h.removeCallback=function(t,e){if(t)if(null==e)this._kill(null,t);else for(var i=this.getTweensOf(t,!1),s=i.length,r=this._parseTimeOrLabel(e);--s>-1;)i[s]._startTime===r&&i[s]._enabled(!1,!1);return this},h.removePause=function(e){return this.removeCallback(t._internals.pauseCallback,e)},h.tweenTo=function(t,i){i=i||{};var s,r,n,a={ease:l,useFrames:this.usesFrames(),immediateRender:!1};for(r in i)a[r]=i[r];return a.time=this._parseTimeOrLabel(t),s=Math.abs(Number(a.time)-this._time)/this._timeScale||.001,n=new e(this,s,a),a.onStart=function(){n.target.paused(!0),n.vars.time!==n.target.time()&&s===n.duration()&&n.duration(Math.abs(n.vars.time-n.target.time())/n.target._timeScale),i.onStart&&n._callback("onStart")},n},h.tweenFromTo=function(t,e,i){i=i||{},t=this._parseTimeOrLabel(t),i.startAt={onComplete:this.seek,onCompleteParams:[t],callbackScope:this},i.immediateRender=i.immediateRender!==!1;var s=this.tweenTo(e,i);return s.duration(Math.abs(s.vars.time-t)/this._timeScale||.001)},h.render=function(t,e,i){this._gc&&this._enabled(!0,!1);var s,n,l,h,_,u,c,f=this._dirty?this.totalDuration():this._totalDuration,p=this._duration,m=this._time,d=this._totalTime,g=this._startTime,v=this._timeScale,y=this._rawPrevTime,T=this._paused,x=this._cycle;if(t>=f)this._locked||(this._totalTime=f,this._cycle=this._repeat),this._reversed||this._hasPausedChild()||(n=!0,h="onComplete",_=!!this._timeline.autoRemoveChildren,0===this._duration&&(0===t||0>y||y===r)&&y!==t&&this._first&&(_=!0,y>r&&(h="onReverseComplete"))),this._rawPrevTime=this._duration||!e||t||this._rawPrevTime===t?t:r,this._yoyo&&0!==(1&this._cycle)?this._time=t=0:(this._time=p,t=p+1e-4);else if(1e-7>t)if(this._locked||(this._totalTime=this._cycle=0),this._time=0,(0!==m||0===p&&y!==r&&(y>0||0>t&&y>=0)&&!this._locked)&&(h="onReverseComplete",n=this._reversed),0>t)this._active=!1,this._timeline.autoRemoveChildren&&this._reversed?(_=n=!0,h="onReverseComplete"):y>=0&&this._first&&(_=!0),this._rawPrevTime=t;else{if(this._rawPrevTime=p||!e||t||this._rawPrevTime===t?t:r,0===t&&n)for(s=this._first;s&&0===s._startTime;)s._duration||(n=!1),s=s._next;t=0,this._initted||(_=!0)}else if(0===p&&0>y&&(_=!0),this._time=this._rawPrevTime=t,this._locked||(this._totalTime=t,0!==this._repeat&&(u=p+this._repeatDelay,this._cycle=this._totalTime/u>>0,0!==this._cycle&&this._cycle===this._totalTime/u&&this._cycle--,this._time=this._totalTime-this._cycle*u,this._yoyo&&0!==(1&this._cycle)&&(this._time=p-this._time),this._time>p?(this._time=p,t=p+1e-4):0>this._time?this._time=t=0:t=this._time)),this._hasPause&&!this._forcingPlayhead&&!e){if(t=this._time,t>=m)for(s=this._first;s&&t>=s._startTime&&!c;)s._duration||"isPause"!==s.data||s.ratio||0===s._startTime&&0===this._rawPrevTime||(c=s),s=s._next;else for(s=this._last;s&&s._startTime>=t&&!c;)s._duration||"isPause"===s.data&&s._rawPrevTime>0&&(c=s),s=s._prev;c&&(this._time=t=c._startTime,this._totalTime=t+this._cycle*(this._totalDuration+this._repeatDelay))}if(this._cycle!==x&&!this._locked){var w=this._yoyo&&0!==(1&x),b=w===(this._yoyo&&0!==(1&this._cycle)),P=this._totalTime,k=this._cycle,S=this._rawPrevTime,R=this._time;if(this._totalTime=x*p,x>this._cycle?w=!w:this._totalTime+=p,this._time=m,this._rawPrevTime=0===p?y-1e-4:y,this._cycle=x,this._locked=!0,m=w?0:p,this.render(m,e,0===p),e||this._gc||this.vars.onRepeat&&this._callback("onRepeat"),b&&(m=w?p+1e-4:-1e-4,this.render(m,!0,!1)),this._locked=!1,this._paused&&!T)return;this._time=R,this._totalTime=P,this._cycle=k,this._rawPrevTime=S}if(!(this._time!==m&&this._first||i||_||c))return d!==this._totalTime&&this._onUpdate&&(e||this._callback("onUpdate")),void 0;if(this._initted||(this._initted=!0),this._active||!this._paused&&this._totalTime!==d&&t>0&&(this._active=!0),0===d&&this.vars.onStart&&0!==this._totalTime&&(e||this._callback("onStart")),this._time>=m)for(s=this._first;s&&(l=s._next,!this._paused||T);)(s._active||s._startTime<=this._time&&!s._paused&&!s._gc)&&(c===s&&this.pause(),s._reversed?s.render((s._dirty?s.totalDuration():s._totalDuration)-(t-s._startTime)*s._timeScale,e,i):s.render((t-s._startTime)*s._timeScale,e,i)),s=l;else for(s=this._last;s&&(l=s._prev,!this._paused||T);){if(s._active||m>=s._startTime&&!s._paused&&!s._gc){if(c===s){for(c=s._prev;c&&c.endTime()>this._time;)c.render(c._reversed?c.totalDuration()-(t-c._startTime)*c._timeScale:(t-c._startTime)*c._timeScale,e,i),c=c._prev;c=null,this.pause()}s._reversed?s.render((s._dirty?s.totalDuration():s._totalDuration)-(t-s._startTime)*s._timeScale,e,i):s.render((t-s._startTime)*s._timeScale,e,i)}s=l}this._onUpdate&&(e||(a.length&&o(),this._callback("onUpdate"))),h&&(this._locked||this._gc||(g===this._startTime||v!==this._timeScale)&&(0===this._time||f>=this.totalDuration())&&(n&&(a.length&&o(),this._timeline.autoRemoveChildren&&this._enabled(!1,!1),this._active=!1),!e&&this.vars[h]&&this._callback(h)))},h.getActive=function(t,e,i){null==t&&(t=!0),null==e&&(e=!0),null==i&&(i=!1);var s,r,n=[],a=this.getChildren(t,e,i),o=0,l=a.length;for(s=0;l>s;s++)r=a[s],r.isActive()&&(n[o++]=r);return n},h.getLabelAfter=function(t){t||0!==t&&(t=this._time);var e,i=this.getLabelsArray(),s=i.length;for(e=0;s>e;e++)if(i[e].time>t)return i[e].name;return null},h.getLabelBefore=function(t){null==t&&(t=this._time);for(var e=this.getLabelsArray(),i=e.length;--i>-1;)if(t>e[i].time)return e[i].name;return null},h.getLabelsArray=function(){var t,e=[],i=0;for(t in this._labels)e[i++]={time:this._labels[t],name:t};return e.sort(function(t,e){return t.time-e.time}),e},h.progress=function(t,e){return arguments.length?this.totalTime(this.duration()*(this._yoyo&&0!==(1&this._cycle)?1-t:t)+this._cycle*(this._duration+this._repeatDelay),e):this._time/this.duration()},h.totalProgress=function(t,e){return arguments.length?this.totalTime(this.totalDuration()*t,e):this._totalTime/this.totalDuration()},h.totalDuration=function(e){return arguments.length?-1===this._repeat?this:this.duration((e-this._repeat*this._repeatDelay)/(this._repeat+1)):(this._dirty&&(t.prototype.totalDuration.call(this),this._totalDuration=-1===this._repeat?999999999999:this._duration*(this._repeat+1)+this._repeatDelay*this._repeat),this._totalDuration)},h.time=function(t,e){return arguments.length?(this._dirty&&this.totalDuration(),t>this._duration&&(t=this._duration),this._yoyo&&0!==(1&this._cycle)?t=this._duration-t+this._cycle*(this._duration+this._repeatDelay):0!==this._repeat&&(t+=this._cycle*(this._duration+this._repeatDelay)),this.totalTime(t,e)):this._time},h.repeat=function(t){return arguments.length?(this._repeat=t,this._uncache(!0)):this._repeat},h.repeatDelay=function(t){return arguments.length?(this._repeatDelay=t,this._uncache(!0)):this._repeatDelay},h.yoyo=function(t){return arguments.length?(this._yoyo=t,this):this._yoyo},h.currentLabel=function(t){return arguments.length?this.seek(t,!0):this.getLabelBefore(this._time+1e-8)},s},!0),function(){var t=180/Math.PI,e=[],i=[],s=[],r={},n=_gsScope._gsDefine.globals,a=function(t,e,i,s){this.a=t,this.b=e,this.c=i,this.d=s,this.da=s-t,this.ca=i-t,this.ba=e-t},o=",x,y,z,left,top,right,bottom,marginTop,marginLeft,marginRight,marginBottom,paddingLeft,paddingTop,paddingRight,paddingBottom,backgroundPosition,backgroundPosition_y,",l=function(t,e,i,s){var r={a:t},n={},a={},o={c:s},l=(t+e)/2,h=(e+i)/2,_=(i+s)/2,u=(l+h)/2,c=(h+_)/2,f=(c-u)/8;return r.b=l+(t-l)/4,n.b=u+f,r.c=n.a=(r.b+n.b)/2,n.c=a.a=(u+c)/2,a.b=c-f,o.b=_+(s-_)/4,a.c=o.a=(a.b+o.b)/2,[r,n,a,o]},h=function(t,r,n,a,o){var h,_,u,c,f,p,m,d,g,v,y,T,x,w=t.length-1,b=0,P=t[0].a;for(h=0;w>h;h++)f=t[b],_=f.a,u=f.d,c=t[b+1].d,o?(y=e[h],T=i[h],x=.25*(T+y)*r/(a?.5:s[h]||.5),p=u-(u-_)*(a?.5*r:0!==y?x/y:0),m=u+(c-u)*(a?.5*r:0!==T?x/T:0),d=u-(p+((m-p)*(3*y/(y+T)+.5)/4||0))):(p=u-.5*(u-_)*r,m=u+.5*(c-u)*r,d=u-(p+m)/2),p+=d,m+=d,f.c=g=p,f.b=0!==h?P:P=f.a+.6*(f.c-f.a),f.da=u-_,f.ca=g-_,f.ba=P-_,n?(v=l(_,P,g,u),t.splice(b,1,v[0],v[1],v[2],v[3]),b+=4):b++,P=m;f=t[b],f.b=P,f.c=P+.4*(f.d-P),f.da=f.d-f.a,f.ca=f.c-f.a,f.ba=P-f.a,n&&(v=l(f.a,P,f.c,f.d),t.splice(b,1,v[0],v[1],v[2],v[3]))},_=function(t,s,r,n){var o,l,h,_,u,c,f=[];if(n)for(t=[n].concat(t),l=t.length;--l>-1;)"string"==typeof(c=t[l][s])&&"="===c.charAt(1)&&(t[l][s]=n[s]+Number(c.charAt(0)+c.substr(2)));if(o=t.length-2,0>o)return f[0]=new a(t[0][s],0,0,t[-1>o?0:1][s]),f;for(l=0;o>l;l++)h=t[l][s],_=t[l+1][s],f[l]=new a(h,0,0,_),r&&(u=t[l+2][s],e[l]=(e[l]||0)+(_-h)*(_-h),i[l]=(i[l]||0)+(u-_)*(u-_));return f[l]=new a(t[l][s],0,0,t[l+1][s]),f},u=function(t,n,a,l,u,c){var f,p,m,d,g,v,y,T,x={},w=[],b=c||t[0];u="string"==typeof u?","+u+",":o,null==n&&(n=1);for(p in t[0])w.push(p);if(t.length>1){for(T=t[t.length-1],y=!0,f=w.length;--f>-1;)if(p=w[f],Math.abs(b[p]-T[p])>.05){y=!1;break}y&&(t=t.concat(),c&&t.unshift(c),t.push(t[1]),c=t[t.length-3])}for(e.length=i.length=s.length=0,f=w.length;--f>-1;)p=w[f],r[p]=-1!==u.indexOf(","+p+","),x[p]=_(t,p,r[p],c);for(f=e.length;--f>-1;)e[f]=Math.sqrt(e[f]),i[f]=Math.sqrt(i[f]);if(!l){for(f=w.length;--f>-1;)if(r[p])for(m=x[w[f]],v=m.length-1,d=0;v>d;d++)g=m[d+1].da/i[d]+m[d].da/e[d],s[d]=(s[d]||0)+g*g;for(f=s.length;--f>-1;)s[f]=Math.sqrt(s[f])}for(f=w.length,d=a?4:1;--f>-1;)p=w[f],m=x[p],h(m,n,a,l,r[p]),y&&(m.splice(0,d),m.splice(m.length-d,d));return x},c=function(t,e,i){e=e||"soft";var s,r,n,o,l,h,_,u,c,f,p,m={},d="cubic"===e?3:2,g="soft"===e,v=[];if(g&&i&&(t=[i].concat(t)),null==t||d+1>t.length)throw"invalid Bezier data";for(c in t[0])v.push(c);for(h=v.length;--h>-1;){for(c=v[h],m[c]=l=[],f=0,u=t.length,_=0;u>_;_++)s=null==i?t[_][c]:"string"==typeof(p=t[_][c])&&"="===p.charAt(1)?i[c]+Number(p.charAt(0)+p.substr(2)):Number(p),g&&_>1&&u-1>_&&(l[f++]=(s+l[f-2])/2),l[f++]=s;for(u=f-d+1,f=0,_=0;u>_;_+=d)s=l[_],r=l[_+1],n=l[_+2],o=2===d?0:l[_+3],l[f++]=p=3===d?new a(s,r,n,o):new a(s,(2*r+s)/3,(2*r+n)/3,n);l.length=f}return m},f=function(t,e,i){for(var s,r,n,a,o,l,h,_,u,c,f,p=1/i,m=t.length;--m>-1;)for(c=t[m],n=c.a,a=c.d-n,o=c.c-n,l=c.b-n,s=r=0,_=1;i>=_;_++)h=p*_,u=1-h,s=r-(r=(h*h*a+3*u*(h*o+u*l))*h),f=m*i+_-1,e[f]=(e[f]||0)+s*s},p=function(t,e){e=e>>0||6;var i,s,r,n,a=[],o=[],l=0,h=0,_=e-1,u=[],c=[];for(i in t)f(t[i],a,e);for(r=a.length,s=0;r>s;s++)l+=Math.sqrt(a[s]),n=s%e,c[n]=l,n===_&&(h+=l,n=s/e>>0,u[n]=c,o[n]=h,l=0,c=[]);return{length:h,lengths:o,segments:u}},m=_gsScope._gsDefine.plugin({propName:"bezier",priority:-1,version:"1.3.4",API:2,global:!0,init:function(t,e,i){this._target=t,e instanceof Array&&(e={values:e}),this._func={},this._round={},this._props=[],this._timeRes=null==e.timeResolution?6:parseInt(e.timeResolution,10);var s,r,n,a,o,l=e.values||[],h={},_=l[0],f=e.autoRotate||i.vars.orientToBezier;this._autoRotate=f?f instanceof Array?f:[["x","y","rotation",f===!0?0:Number(f)||0]]:null;
for(s in _)this._props.push(s);for(n=this._props.length;--n>-1;)s=this._props[n],this._overwriteProps.push(s),r=this._func[s]="function"==typeof t[s],h[s]=r?t[s.indexOf("set")||"function"!=typeof t["get"+s.substr(3)]?s:"get"+s.substr(3)]():parseFloat(t[s]),o||h[s]!==l[0][s]&&(o=h);if(this._beziers="cubic"!==e.type&&"quadratic"!==e.type&&"soft"!==e.type?u(l,isNaN(e.curviness)?1:e.curviness,!1,"thruBasic"===e.type,e.correlate,o):c(l,e.type,h),this._segCount=this._beziers[s].length,this._timeRes){var m=p(this._beziers,this._timeRes);this._length=m.length,this._lengths=m.lengths,this._segments=m.segments,this._l1=this._li=this._s1=this._si=0,this._l2=this._lengths[0],this._curSeg=this._segments[0],this._s2=this._curSeg[0],this._prec=1/this._curSeg.length}if(f=this._autoRotate)for(this._initialRotations=[],f[0]instanceof Array||(this._autoRotate=f=[f]),n=f.length;--n>-1;){for(a=0;3>a;a++)s=f[n][a],this._func[s]="function"==typeof t[s]?t[s.indexOf("set")||"function"!=typeof t["get"+s.substr(3)]?s:"get"+s.substr(3)]:!1;s=f[n][2],this._initialRotations[n]=this._func[s]?this._func[s].call(this._target):this._target[s]}return this._startRatio=i.vars.runBackwards?1:0,!0},set:function(e){var i,s,r,n,a,o,l,h,_,u,c=this._segCount,f=this._func,p=this._target,m=e!==this._startRatio;if(this._timeRes){if(_=this._lengths,u=this._curSeg,e*=this._length,r=this._li,e>this._l2&&c-1>r){for(h=c-1;h>r&&e>=(this._l2=_[++r]););this._l1=_[r-1],this._li=r,this._curSeg=u=this._segments[r],this._s2=u[this._s1=this._si=0]}else if(this._l1>e&&r>0){for(;r>0&&(this._l1=_[--r])>=e;);0===r&&this._l1>e?this._l1=0:r++,this._l2=_[r],this._li=r,this._curSeg=u=this._segments[r],this._s1=u[(this._si=u.length-1)-1]||0,this._s2=u[this._si]}if(i=r,e-=this._l1,r=this._si,e>this._s2&&u.length-1>r){for(h=u.length-1;h>r&&e>=(this._s2=u[++r]););this._s1=u[r-1],this._si=r}else if(this._s1>e&&r>0){for(;r>0&&(this._s1=u[--r])>=e;);0===r&&this._s1>e?this._s1=0:r++,this._s2=u[r],this._si=r}o=(r+(e-this._s1)/(this._s2-this._s1))*this._prec}else i=0>e?0:e>=1?c-1:c*e>>0,o=(e-i*(1/c))*c;for(s=1-o,r=this._props.length;--r>-1;)n=this._props[r],a=this._beziers[n][i],l=(o*o*a.da+3*s*(o*a.ca+s*a.ba))*o+a.a,this._round[n]&&(l=Math.round(l)),f[n]?p[n](l):p[n]=l;if(this._autoRotate){var d,g,v,y,T,x,w,b=this._autoRotate;for(r=b.length;--r>-1;)n=b[r][2],x=b[r][3]||0,w=b[r][4]===!0?1:t,a=this._beziers[b[r][0]],d=this._beziers[b[r][1]],a&&d&&(a=a[i],d=d[i],g=a.a+(a.b-a.a)*o,y=a.b+(a.c-a.b)*o,g+=(y-g)*o,y+=(a.c+(a.d-a.c)*o-y)*o,v=d.a+(d.b-d.a)*o,T=d.b+(d.c-d.b)*o,v+=(T-v)*o,T+=(d.c+(d.d-d.c)*o-T)*o,l=m?Math.atan2(T-v,y-g)*w+x:this._initialRotations[r],f[n]?p[n](l):p[n]=l)}}}),d=m.prototype;m.bezierThrough=u,m.cubicToQuadratic=l,m._autoCSS=!0,m.quadraticToCubic=function(t,e,i){return new a(t,(2*e+t)/3,(2*e+i)/3,i)},m._cssRegister=function(){var t=n.CSSPlugin;if(t){var e=t._internals,i=e._parseToProxy,s=e._setPluginRatio,r=e.CSSPropTween;e._registerComplexSpecialProp("bezier",{parser:function(t,e,n,a,o,l){e instanceof Array&&(e={values:e}),l=new m;var h,_,u,c=e.values,f=c.length-1,p=[],d={};if(0>f)return o;for(h=0;f>=h;h++)u=i(t,c[h],a,o,l,f!==h),p[h]=u.end;for(_ in e)d[_]=e[_];return d.values=p,o=new r(t,"bezier",0,0,u.pt,2),o.data=u,o.plugin=l,o.setRatio=s,0===d.autoRotate&&(d.autoRotate=!0),!d.autoRotate||d.autoRotate instanceof Array||(h=d.autoRotate===!0?0:Number(d.autoRotate),d.autoRotate=null!=u.end.left?[["left","top","rotation",h,!1]]:null!=u.end.x?[["x","y","rotation",h,!1]]:!1),d.autoRotate&&(a._transform||a._enableTransforms(!1),u.autoRotate=a._target._gsTransform),l._onInitTween(u.proxy,d,a._tween),o}})}},d._roundProps=function(t,e){for(var i=this._overwriteProps,s=i.length;--s>-1;)(t[i[s]]||t.bezier||t.bezierThrough)&&(this._round[i[s]]=e)},d._kill=function(t){var e,i,s=this._props;for(e in this._beziers)if(e in t)for(delete this._beziers[e],delete this._func[e],i=s.length;--i>-1;)s[i]===e&&s.splice(i,1);return this._super._kill.call(this,t)}}(),_gsScope._gsDefine("plugins.CSSPlugin",["plugins.TweenPlugin","TweenLite"],function(t,e){var i,s,r,n,a=function(){t.call(this,"css"),this._overwriteProps.length=0,this.setRatio=a.prototype.setRatio},o=_gsScope._gsDefine.globals,l={},h=a.prototype=new t("css");h.constructor=a,a.version="1.18.0",a.API=2,a.defaultTransformPerspective=0,a.defaultSkewType="compensated",a.defaultSmoothOrigin=!0,h="px",a.suffixMap={top:h,right:h,bottom:h,left:h,width:h,height:h,fontSize:h,padding:h,margin:h,perspective:h,lineHeight:""};var _,u,c,f,p,m,d=/(?:\d|\-\d|\.\d|\-\.\d)+/g,g=/(?:\d|\-\d|\.\d|\-\.\d|\+=\d|\-=\d|\+=.\d|\-=\.\d)+/g,v=/(?:\+=|\-=|\-|\b)[\d\-\.]+[a-zA-Z0-9]*(?:%|\b)/gi,y=/(?![+-]?\d*\.?\d+|[+-]|e[+-]\d+)[^0-9]/g,T=/(?:\d|\-|\+|=|#|\.)*/g,x=/opacity *= *([^)]*)/i,w=/opacity:([^;]*)/i,b=/alpha\(opacity *=.+?\)/i,P=/^(rgb|hsl)/,k=/([A-Z])/g,S=/-([a-z])/gi,R=/(^(?:url\(\"|url\())|(?:(\"\))$|\)$)/gi,O=function(t,e){return e.toUpperCase()},A=/(?:Left|Right|Width)/i,C=/(M11|M12|M21|M22)=[\d\-\.e]+/gi,D=/progid\:DXImageTransform\.Microsoft\.Matrix\(.+?\)/i,M=/,(?=[^\)]*(?:\(|$))/gi,z=Math.PI/180,F=180/Math.PI,I={},E=document,N=function(t){return E.createElementNS?E.createElementNS("http://www.w3.org/1999/xhtml",t):E.createElement(t)},L=N("div"),X=N("img"),B=a._internals={_specialProps:l},j=navigator.userAgent,Y=function(){var t=j.indexOf("Android"),e=N("a");return c=-1!==j.indexOf("Safari")&&-1===j.indexOf("Chrome")&&(-1===t||Number(j.substr(t+8,1))>3),p=c&&6>Number(j.substr(j.indexOf("Version/")+8,1)),f=-1!==j.indexOf("Firefox"),(/MSIE ([0-9]{1,}[\.0-9]{0,})/.exec(j)||/Trident\/.*rv:([0-9]{1,}[\.0-9]{0,})/.exec(j))&&(m=parseFloat(RegExp.$1)),e?(e.style.cssText="top:1px;opacity:.55;",/^0.55/.test(e.style.opacity)):!1}(),U=function(t){return x.test("string"==typeof t?t:(t.currentStyle?t.currentStyle.filter:t.style.filter)||"")?parseFloat(RegExp.$1)/100:1},q=function(t){window.console&&console.log(t)},V="",G="",W=function(t,e){e=e||L;var i,s,r=e.style;if(void 0!==r[t])return t;for(t=t.charAt(0).toUpperCase()+t.substr(1),i=["O","Moz","ms","Ms","Webkit"],s=5;--s>-1&&void 0===r[i[s]+t];);return s>=0?(G=3===s?"ms":i[s],V="-"+G.toLowerCase()+"-",G+t):null},Z=E.defaultView?E.defaultView.getComputedStyle:function(){},Q=a.getStyle=function(t,e,i,s,r){var n;return Y||"opacity"!==e?(!s&&t.style[e]?n=t.style[e]:(i=i||Z(t))?n=i[e]||i.getPropertyValue(e)||i.getPropertyValue(e.replace(k,"-$1").toLowerCase()):t.currentStyle&&(n=t.currentStyle[e]),null==r||n&&"none"!==n&&"auto"!==n&&"auto auto"!==n?n:r):U(t)},$=B.convertToPixels=function(t,i,s,r,n){if("px"===r||!r)return s;if("auto"===r||!s)return 0;var o,l,h,_=A.test(i),u=t,c=L.style,f=0>s;if(f&&(s=-s),"%"===r&&-1!==i.indexOf("border"))o=s/100*(_?t.clientWidth:t.clientHeight);else{if(c.cssText="border:0 solid red;position:"+Q(t,"position")+";line-height:0;","%"!==r&&u.appendChild&&"v"!==r.charAt(0)&&"rem"!==r)c[_?"borderLeftWidth":"borderTopWidth"]=s+r;else{if(u=t.parentNode||E.body,l=u._gsCache,h=e.ticker.frame,l&&_&&l.time===h)return l.width*s/100;c[_?"width":"height"]=s+r}u.appendChild(L),o=parseFloat(L[_?"offsetWidth":"offsetHeight"]),u.removeChild(L),_&&"%"===r&&a.cacheWidths!==!1&&(l=u._gsCache=u._gsCache||{},l.time=h,l.width=100*(o/s)),0!==o||n||(o=$(t,i,s,r,!0))}return f?-o:o},H=B.calculateOffset=function(t,e,i){if("absolute"!==Q(t,"position",i))return 0;var s="left"===e?"Left":"Top",r=Q(t,"margin"+s,i);return t["offset"+s]-($(t,e,parseFloat(r),r.replace(T,""))||0)},K=function(t,e){var i,s,r,n={};if(e=e||Z(t,null))if(i=e.length)for(;--i>-1;)r=e[i],(-1===r.indexOf("-transform")||ke===r)&&(n[r.replace(S,O)]=e.getPropertyValue(r));else for(i in e)(-1===i.indexOf("Transform")||Pe===i)&&(n[i]=e[i]);else if(e=t.currentStyle||t.style)for(i in e)"string"==typeof i&&void 0===n[i]&&(n[i.replace(S,O)]=e[i]);return Y||(n.opacity=U(t)),s=Ne(t,e,!1),n.rotation=s.rotation,n.skewX=s.skewX,n.scaleX=s.scaleX,n.scaleY=s.scaleY,n.x=s.x,n.y=s.y,Re&&(n.z=s.z,n.rotationX=s.rotationX,n.rotationY=s.rotationY,n.scaleZ=s.scaleZ),n.filters&&delete n.filters,n},J=function(t,e,i,s,r){var n,a,o,l={},h=t.style;for(a in i)"cssText"!==a&&"length"!==a&&isNaN(a)&&(e[a]!==(n=i[a])||r&&r[a])&&-1===a.indexOf("Origin")&&("number"==typeof n||"string"==typeof n)&&(l[a]="auto"!==n||"left"!==a&&"top"!==a?""!==n&&"auto"!==n&&"none"!==n||"string"!=typeof e[a]||""===e[a].replace(y,"")?n:0:H(t,a),void 0!==h[a]&&(o=new pe(h,a,h[a],o)));if(s)for(a in s)"className"!==a&&(l[a]=s[a]);return{difs:l,firstMPT:o}},te={width:["Left","Right"],height:["Top","Bottom"]},ee=["marginLeft","marginRight","marginTop","marginBottom"],ie=function(t,e,i){var s=parseFloat("width"===e?t.offsetWidth:t.offsetHeight),r=te[e],n=r.length;for(i=i||Z(t,null);--n>-1;)s-=parseFloat(Q(t,"padding"+r[n],i,!0))||0,s-=parseFloat(Q(t,"border"+r[n]+"Width",i,!0))||0;return s},se=function(t,e){if("contain"===t||"auto"===t||"auto auto"===t)return t+" ";(null==t||""===t)&&(t="0 0");var i=t.split(" "),s=-1!==t.indexOf("left")?"0%":-1!==t.indexOf("right")?"100%":i[0],r=-1!==t.indexOf("top")?"0%":-1!==t.indexOf("bottom")?"100%":i[1];return null==r?r="center"===s?"50%":"0":"center"===r&&(r="50%"),("center"===s||isNaN(parseFloat(s))&&-1===(s+"").indexOf("="))&&(s="50%"),t=s+" "+r+(i.length>2?" "+i[2]:""),e&&(e.oxp=-1!==s.indexOf("%"),e.oyp=-1!==r.indexOf("%"),e.oxr="="===s.charAt(1),e.oyr="="===r.charAt(1),e.ox=parseFloat(s.replace(y,"")),e.oy=parseFloat(r.replace(y,"")),e.v=t),e||t},re=function(t,e){return"string"==typeof t&&"="===t.charAt(1)?parseInt(t.charAt(0)+"1",10)*parseFloat(t.substr(2)):parseFloat(t)-parseFloat(e)},ne=function(t,e){return null==t?e:"string"==typeof t&&"="===t.charAt(1)?parseInt(t.charAt(0)+"1",10)*parseFloat(t.substr(2))+e:parseFloat(t)},ae=function(t,e,i,s){var r,n,a,o,l,h=1e-6;return null==t?o=e:"number"==typeof t?o=t:(r=360,n=t.split("_"),l="="===t.charAt(1),a=(l?parseInt(t.charAt(0)+"1",10)*parseFloat(n[0].substr(2)):parseFloat(n[0]))*(-1===t.indexOf("rad")?1:F)-(l?0:e),n.length&&(s&&(s[i]=e+a),-1!==t.indexOf("short")&&(a%=r,a!==a%(r/2)&&(a=0>a?a+r:a-r)),-1!==t.indexOf("_cw")&&0>a?a=(a+9999999999*r)%r-(0|a/r)*r:-1!==t.indexOf("ccw")&&a>0&&(a=(a-9999999999*r)%r-(0|a/r)*r)),o=e+a),h>o&&o>-h&&(o=0),o},oe={aqua:[0,255,255],lime:[0,255,0],silver:[192,192,192],black:[0,0,0],maroon:[128,0,0],teal:[0,128,128],blue:[0,0,255],navy:[0,0,128],white:[255,255,255],fuchsia:[255,0,255],olive:[128,128,0],yellow:[255,255,0],orange:[255,165,0],gray:[128,128,128],purple:[128,0,128],green:[0,128,0],red:[255,0,0],pink:[255,192,203],cyan:[0,255,255],transparent:[255,255,255,0]},le=function(t,e,i){return t=0>t?t+1:t>1?t-1:t,0|255*(1>6*t?e+6*(i-e)*t:.5>t?i:2>3*t?e+6*(i-e)*(2/3-t):e)+.5},he=a.parseColor=function(t,e){var i,s,r,n,a,o,l,h,_,u,c;if(t)if("number"==typeof t)i=[t>>16,255&t>>8,255&t];else{if(","===t.charAt(t.length-1)&&(t=t.substr(0,t.length-1)),oe[t])i=oe[t];else if("#"===t.charAt(0))4===t.length&&(s=t.charAt(1),r=t.charAt(2),n=t.charAt(3),t="#"+s+s+r+r+n+n),t=parseInt(t.substr(1),16),i=[t>>16,255&t>>8,255&t];else if("hsl"===t.substr(0,3))if(i=c=t.match(d),e){if(-1!==t.indexOf("="))return t.match(g)}else a=Number(i[0])%360/360,o=Number(i[1])/100,l=Number(i[2])/100,r=.5>=l?l*(o+1):l+o-l*o,s=2*l-r,i.length>3&&(i[3]=Number(t[3])),i[0]=le(a+1/3,s,r),i[1]=le(a,s,r),i[2]=le(a-1/3,s,r);else i=t.match(d)||oe.transparent;i[0]=Number(i[0]),i[1]=Number(i[1]),i[2]=Number(i[2]),i.length>3&&(i[3]=Number(i[3]))}else i=oe.black;return e&&!c&&(s=i[0]/255,r=i[1]/255,n=i[2]/255,h=Math.max(s,r,n),_=Math.min(s,r,n),l=(h+_)/2,h===_?a=o=0:(u=h-_,o=l>.5?u/(2-h-_):u/(h+_),a=h===s?(r-n)/u+(n>r?6:0):h===r?(n-s)/u+2:(s-r)/u+4,a*=60),i[0]=0|a+.5,i[1]=0|100*o+.5,i[2]=0|100*l+.5),i},_e=function(t,e){var i,s,r,n=t.match(ue)||[],a=0,o=n.length?"":t;for(i=0;n.length>i;i++)s=n[i],r=t.substr(a,t.indexOf(s,a)-a),a+=r.length+s.length,s=he(s,e),3===s.length&&s.push(1),o+=r+(e?"hsla("+s[0]+","+s[1]+"%,"+s[2]+"%,"+s[3]:"rgba("+s.join(","))+")";return o},ue="(?:\\b(?:(?:rgb|rgba|hsl|hsla)\\(.+?\\))|\\B#.+?\\b";for(h in oe)ue+="|"+h+"\\b";ue=RegExp(ue+")","gi"),a.colorStringFilter=function(t){var e,i=t[0]+t[1];ue.lastIndex=0,ue.test(i)&&(e=-1!==i.indexOf("hsl(")||-1!==i.indexOf("hsla("),t[0]=_e(t[0],e),t[1]=_e(t[1],e))},e.defaultStringFilter||(e.defaultStringFilter=a.colorStringFilter);var ce=function(t,e,i,s){if(null==t)return function(t){return t};var r,n=e?(t.match(ue)||[""])[0]:"",a=t.split(n).join("").match(v)||[],o=t.substr(0,t.indexOf(a[0])),l=")"===t.charAt(t.length-1)?")":"",h=-1!==t.indexOf(" ")?" ":",",_=a.length,u=_>0?a[0].replace(d,""):"";return _?r=e?function(t){var e,c,f,p;if("number"==typeof t)t+=u;else if(s&&M.test(t)){for(p=t.replace(M,"|").split("|"),f=0;p.length>f;f++)p[f]=r(p[f]);return p.join(",")}if(e=(t.match(ue)||[n])[0],c=t.split(e).join("").match(v)||[],f=c.length,_>f--)for(;_>++f;)c[f]=i?c[0|(f-1)/2]:a[f];return o+c.join(h)+h+e+l+(-1!==t.indexOf("inset")?" inset":"")}:function(t){var e,n,c;if("number"==typeof t)t+=u;else if(s&&M.test(t)){for(n=t.replace(M,"|").split("|"),c=0;n.length>c;c++)n[c]=r(n[c]);return n.join(",")}if(e=t.match(v)||[],c=e.length,_>c--)for(;_>++c;)e[c]=i?e[0|(c-1)/2]:a[c];return o+e.join(h)+l}:function(t){return t}},fe=function(t){return t=t.split(","),function(e,i,s,r,n,a,o){var l,h=(i+"").split(" ");for(o={},l=0;4>l;l++)o[t[l]]=h[l]=h[l]||h[(l-1)/2>>0];return r.parse(e,o,n,a)}},pe=(B._setPluginRatio=function(t){this.plugin.setRatio(t);for(var e,i,s,r,n=this.data,a=n.proxy,o=n.firstMPT,l=1e-6;o;)e=a[o.v],o.r?e=Math.round(e):l>e&&e>-l&&(e=0),o.t[o.p]=e,o=o._next;if(n.autoRotate&&(n.autoRotate.rotation=a.rotation),1===t)for(o=n.firstMPT;o;){if(i=o.t,i.type){if(1===i.type){for(r=i.xs0+i.s+i.xs1,s=1;i.l>s;s++)r+=i["xn"+s]+i["xs"+(s+1)];i.e=r}}else i.e=i.s+i.xs0;o=o._next}},function(t,e,i,s,r){this.t=t,this.p=e,this.v=i,this.r=r,s&&(s._prev=this,this._next=s)}),me=(B._parseToProxy=function(t,e,i,s,r,n){var a,o,l,h,_,u=s,c={},f={},p=i._transform,m=I;for(i._transform=null,I=e,s=_=i.parse(t,e,s,r),I=m,n&&(i._transform=p,u&&(u._prev=null,u._prev&&(u._prev._next=null)));s&&s!==u;){if(1>=s.type&&(o=s.p,f[o]=s.s+s.c,c[o]=s.s,n||(h=new pe(s,"s",o,h,s.r),s.c=0),1===s.type))for(a=s.l;--a>0;)l="xn"+a,o=s.p+"_"+l,f[o]=s.data[l],c[o]=s[l],n||(h=new pe(s,l,o,h,s.rxp[l]));s=s._next}return{proxy:c,end:f,firstMPT:h,pt:_}},B.CSSPropTween=function(t,e,s,r,a,o,l,h,_,u,c){this.t=t,this.p=e,this.s=s,this.c=r,this.n=l||e,t instanceof me||n.push(this.n),this.r=h,this.type=o||0,_&&(this.pr=_,i=!0),this.b=void 0===u?s:u,this.e=void 0===c?s+r:c,a&&(this._next=a,a._prev=this)}),de=function(t,e,i,s,r,n){var a=new me(t,e,i,s-i,r,-1,n);return a.b=i,a.e=a.xs0=s,a},ge=a.parseComplex=function(t,e,i,s,r,n,a,o,l,h){i=i||n||"",a=new me(t,e,0,0,a,h?2:1,null,!1,o,i,s),s+="";var u,c,f,p,m,v,y,T,x,w,b,P,k,S=i.split(", ").join(",").split(" "),R=s.split(", ").join(",").split(" "),O=S.length,A=_!==!1;for((-1!==s.indexOf(",")||-1!==i.indexOf(","))&&(S=S.join(" ").replace(M,", ").split(" "),R=R.join(" ").replace(M,", ").split(" "),O=S.length),O!==R.length&&(S=(n||"").split(" "),O=S.length),a.plugin=l,a.setRatio=h,ue.lastIndex=0,u=0;O>u;u++)if(p=S[u],m=R[u],T=parseFloat(p),T||0===T)a.appendXtra("",T,re(m,T),m.replace(g,""),A&&-1!==m.indexOf("px"),!0);else if(r&&ue.test(p))P=","===m.charAt(m.length-1)?"),":")",k=-1!==m.indexOf("hsl")&&Y,p=he(p,k),m=he(m,k),x=p.length+m.length>6,x&&!Y&&0===m[3]?(a["xs"+a.l]+=a.l?" transparent":"transparent",a.e=a.e.split(R[u]).join("transparent")):(Y||(x=!1),k?a.appendXtra(x?"hsla(":"hsl(",p[0],re(m[0],p[0]),",",!1,!0).appendXtra("",p[1],re(m[1],p[1]),"%,",!1).appendXtra("",p[2],re(m[2],p[2]),x?"%,":"%"+P,!1):a.appendXtra(x?"rgba(":"rgb(",p[0],m[0]-p[0],",",!0,!0).appendXtra("",p[1],m[1]-p[1],",",!0).appendXtra("",p[2],m[2]-p[2],x?",":P,!0),x&&(p=4>p.length?1:p[3],a.appendXtra("",p,(4>m.length?1:m[3])-p,P,!1))),ue.lastIndex=0;else if(v=p.match(d)){if(y=m.match(g),!y||y.length!==v.length)return a;for(f=0,c=0;v.length>c;c++)b=v[c],w=p.indexOf(b,f),a.appendXtra(p.substr(f,w-f),Number(b),re(y[c],b),"",A&&"px"===p.substr(w+b.length,2),0===c),f=w+b.length;a["xs"+a.l]+=p.substr(f)}else a["xs"+a.l]+=a.l?" "+p:p;if(-1!==s.indexOf("=")&&a.data){for(P=a.xs0+a.data.s,u=1;a.l>u;u++)P+=a["xs"+u]+a.data["xn"+u];a.e=P+a["xs"+u]}return a.l||(a.type=-1,a.xs0=a.e),a.xfirst||a},ve=9;for(h=me.prototype,h.l=h.pr=0;--ve>0;)h["xn"+ve]=0,h["xs"+ve]="";h.xs0="",h._next=h._prev=h.xfirst=h.data=h.plugin=h.setRatio=h.rxp=null,h.appendXtra=function(t,e,i,s,r,n){var a=this,o=a.l;return a["xs"+o]+=n&&o?" "+t:t||"",i||0===o||a.plugin?(a.l++,a.type=a.setRatio?2:1,a["xs"+a.l]=s||"",o>0?(a.data["xn"+o]=e+i,a.rxp["xn"+o]=r,a["xn"+o]=e,a.plugin||(a.xfirst=new me(a,"xn"+o,e,i,a.xfirst||a,0,a.n,r,a.pr),a.xfirst.xs0=0),a):(a.data={s:e+i},a.rxp={},a.s=e,a.c=i,a.r=r,a)):(a["xs"+o]+=e+(s||""),a)};var ye=function(t,e){e=e||{},this.p=e.prefix?W(t)||t:t,l[t]=l[this.p]=this,this.format=e.formatter||ce(e.defaultValue,e.color,e.collapsible,e.multi),e.parser&&(this.parse=e.parser),this.clrs=e.color,this.multi=e.multi,this.keyword=e.keyword,this.dflt=e.defaultValue,this.pr=e.priority||0},Te=B._registerComplexSpecialProp=function(t,e,i){"object"!=typeof e&&(e={parser:i});var s,r,n=t.split(","),a=e.defaultValue;for(i=i||[a],s=0;n.length>s;s++)e.prefix=0===s&&e.prefix,e.defaultValue=i[s]||a,r=new ye(n[s],e)},xe=function(t){if(!l[t]){var e=t.charAt(0).toUpperCase()+t.substr(1)+"Plugin";Te(t,{parser:function(t,i,s,r,n,a,h){var _=o.com.greensock.plugins[e];return _?(_._cssRegister(),l[s].parse(t,i,s,r,n,a,h)):(q("Error: "+e+" js file not loaded."),n)}})}};h=ye.prototype,h.parseComplex=function(t,e,i,s,r,n){var a,o,l,h,_,u,c=this.keyword;if(this.multi&&(M.test(i)||M.test(e)?(o=e.replace(M,"|").split("|"),l=i.replace(M,"|").split("|")):c&&(o=[e],l=[i])),l){for(h=l.length>o.length?l.length:o.length,a=0;h>a;a++)e=o[a]=o[a]||this.dflt,i=l[a]=l[a]||this.dflt,c&&(_=e.indexOf(c),u=i.indexOf(c),_!==u&&(-1===u?o[a]=o[a].split(c).join(""):-1===_&&(o[a]+=" "+c)));e=o.join(", "),i=l.join(", ")}return ge(t,this.p,e,i,this.clrs,this.dflt,s,this.pr,r,n)},h.parse=function(t,e,i,s,n,a){return this.parseComplex(t.style,this.format(Q(t,this.p,r,!1,this.dflt)),this.format(e),n,a)},a.registerSpecialProp=function(t,e,i){Te(t,{parser:function(t,s,r,n,a,o){var l=new me(t,r,0,0,a,2,r,!1,i);return l.plugin=o,l.setRatio=e(t,s,n._tween,r),l},priority:i})},a.useSVGTransformAttr=c||f;var we,be="scaleX,scaleY,scaleZ,x,y,z,skewX,skewY,rotation,rotationX,rotationY,perspective,xPercent,yPercent".split(","),Pe=W("transform"),ke=V+"transform",Se=W("transformOrigin"),Re=null!==W("perspective"),Oe=B.Transform=function(){this.perspective=parseFloat(a.defaultTransformPerspective)||0,this.force3D=a.defaultForce3D!==!1&&Re?a.defaultForce3D||"auto":!1},Ae=window.SVGElement,Ce=function(t,e,i){var s,r=E.createElementNS("http://www.w3.org/2000/svg",t),n=/([a-z])([A-Z])/g;for(s in i)r.setAttributeNS(null,s.replace(n,"$1-$2").toLowerCase(),i[s]);return e.appendChild(r),r},De=E.documentElement,Me=function(){var t,e,i,s=m||/Android/i.test(j)&&!window.chrome;return E.createElementNS&&!s&&(t=Ce("svg",De),e=Ce("rect",t,{width:100,height:50,x:100}),i=e.getBoundingClientRect().width,e.style[Se]="50% 50%",e.style[Pe]="scaleX(0.5)",s=i===e.getBoundingClientRect().width&&!(f&&Re),De.removeChild(t)),s}(),ze=function(t,e,i,s,r){var n,o,l,h,_,u,c,f,p,m,d,g,v,y,T=t._gsTransform,x=Ee(t,!0);T&&(v=T.xOrigin,y=T.yOrigin),(!s||2>(n=s.split(" ")).length)&&(c=t.getBBox(),e=se(e).split(" "),n=[(-1!==e[0].indexOf("%")?parseFloat(e[0])/100*c.width:parseFloat(e[0]))+c.x,(-1!==e[1].indexOf("%")?parseFloat(e[1])/100*c.height:parseFloat(e[1]))+c.y]),i.xOrigin=h=parseFloat(n[0]),i.yOrigin=_=parseFloat(n[1]),s&&x!==Ie&&(u=x[0],c=x[1],f=x[2],p=x[3],m=x[4],d=x[5],g=u*p-c*f,o=h*(p/g)+_*(-f/g)+(f*d-p*m)/g,l=h*(-c/g)+_*(u/g)-(u*d-c*m)/g,h=i.xOrigin=n[0]=o,_=i.yOrigin=n[1]=l),T&&(r||r!==!1&&a.defaultSmoothOrigin!==!1?(o=h-v,l=_-y,T.xOffset+=o*x[0]+l*x[2]-o,T.yOffset+=o*x[1]+l*x[3]-l):T.xOffset=T.yOffset=0),t.setAttribute("data-svg-origin",n.join(" "))},Fe=function(t){return!!(Ae&&"function"==typeof t.getBBox&&t.getCTM&&(!t.parentNode||t.parentNode.getBBox&&t.parentNode.getCTM))},Ie=[1,0,0,1,0,0],Ee=function(t,e){var i,s,r,n,a,o=t._gsTransform||new Oe,l=1e5;if(Pe?s=Q(t,ke,null,!0):t.currentStyle&&(s=t.currentStyle.filter.match(C),s=s&&4===s.length?[s[0].substr(4),Number(s[2].substr(4)),Number(s[1].substr(4)),s[3].substr(4),o.x||0,o.y||0].join(","):""),i=!s||"none"===s||"matrix(1, 0, 0, 1, 0, 0)"===s,(o.svg||t.getBBox&&Fe(t))&&(i&&-1!==(t.style[Pe]+"").indexOf("matrix")&&(s=t.style[Pe],i=0),r=t.getAttribute("transform"),i&&r&&(-1!==r.indexOf("matrix")?(s=r,i=0):-1!==r.indexOf("translate")&&(s="matrix(1,0,0,1,"+r.match(/(?:\-|\b)[\d\-\.e]+\b/gi).join(",")+")",i=0))),i)return Ie;for(r=(s||"").match(/(?:\-|\b)[\d\-\.e]+\b/gi)||[],ve=r.length;--ve>-1;)n=Number(r[ve]),r[ve]=(a=n-(n|=0))?(0|a*l+(0>a?-.5:.5))/l+n:n;return e&&r.length>6?[r[0],r[1],r[4],r[5],r[12],r[13]]:r},Ne=B.getTransform=function(t,i,s,n){if(t._gsTransform&&s&&!n)return t._gsTransform;var o,l,h,_,u,c,f=s?t._gsTransform||new Oe:new Oe,p=0>f.scaleX,m=2e-5,d=1e5,g=Re?parseFloat(Q(t,Se,i,!1,"0 0 0").split(" ")[2])||f.zOrigin||0:0,v=parseFloat(a.defaultTransformPerspective)||0;if(f.svg=!(!t.getBBox||!Fe(t)),f.svg&&(ze(t,Q(t,Se,r,!1,"50% 50%")+"",f,t.getAttribute("data-svg-origin")),we=a.useSVGTransformAttr||Me),o=Ee(t),o!==Ie){if(16===o.length){var y,T,x,w,b,P=o[0],k=o[1],S=o[2],R=o[3],O=o[4],A=o[5],C=o[6],D=o[7],M=o[8],z=o[9],I=o[10],E=o[12],N=o[13],L=o[14],X=o[11],B=Math.atan2(C,I);f.zOrigin&&(L=-f.zOrigin,E=M*L-o[12],N=z*L-o[13],L=I*L+f.zOrigin-o[14]),f.rotationX=B*F,B&&(w=Math.cos(-B),b=Math.sin(-B),y=O*w+M*b,T=A*w+z*b,x=C*w+I*b,M=O*-b+M*w,z=A*-b+z*w,I=C*-b+I*w,X=D*-b+X*w,O=y,A=T,C=x),B=Math.atan2(M,I),f.rotationY=B*F,B&&(w=Math.cos(-B),b=Math.sin(-B),y=P*w-M*b,T=k*w-z*b,x=S*w-I*b,z=k*b+z*w,I=S*b+I*w,X=R*b+X*w,P=y,k=T,S=x),B=Math.atan2(k,P),f.rotation=B*F,B&&(w=Math.cos(-B),b=Math.sin(-B),P=P*w+O*b,T=k*w+A*b,A=k*-b+A*w,C=S*-b+C*w,k=T),f.rotationX&&Math.abs(f.rotationX)+Math.abs(f.rotation)>359.9&&(f.rotationX=f.rotation=0,f.rotationY+=180),f.scaleX=(0|Math.sqrt(P*P+k*k)*d+.5)/d,f.scaleY=(0|Math.sqrt(A*A+z*z)*d+.5)/d,f.scaleZ=(0|Math.sqrt(C*C+I*I)*d+.5)/d,f.skewX=0,f.perspective=X?1/(0>X?-X:X):0,f.x=E,f.y=N,f.z=L,f.svg&&(f.x-=f.xOrigin-(f.xOrigin*P-f.yOrigin*O),f.y-=f.yOrigin-(f.yOrigin*k-f.xOrigin*A))}else if(!(Re&&!n&&o.length&&f.x===o[4]&&f.y===o[5]&&(f.rotationX||f.rotationY)||void 0!==f.x&&"none"===Q(t,"display",i))){var j=o.length>=6,Y=j?o[0]:1,U=o[1]||0,q=o[2]||0,V=j?o[3]:1;f.x=o[4]||0,f.y=o[5]||0,h=Math.sqrt(Y*Y+U*U),_=Math.sqrt(V*V+q*q),u=Y||U?Math.atan2(U,Y)*F:f.rotation||0,c=q||V?Math.atan2(q,V)*F+u:f.skewX||0,Math.abs(c)>90&&270>Math.abs(c)&&(p?(h*=-1,c+=0>=u?180:-180,u+=0>=u?180:-180):(_*=-1,c+=0>=c?180:-180)),f.scaleX=h,f.scaleY=_,f.rotation=u,f.skewX=c,Re&&(f.rotationX=f.rotationY=f.z=0,f.perspective=v,f.scaleZ=1),f.svg&&(f.x-=f.xOrigin-(f.xOrigin*Y+f.yOrigin*q),f.y-=f.yOrigin-(f.xOrigin*U+f.yOrigin*V))}f.zOrigin=g;for(l in f)m>f[l]&&f[l]>-m&&(f[l]=0)}return s&&(t._gsTransform=f,f.svg&&(we&&t.style[Pe]?e.delayedCall(.001,function(){je(t.style,Pe)}):!we&&t.getAttribute("transform")&&e.delayedCall(.001,function(){t.removeAttribute("transform")}))),f},Le=function(t){var e,i,s=this.data,r=-s.rotation*z,n=r+s.skewX*z,a=1e5,o=(0|Math.cos(r)*s.scaleX*a)/a,l=(0|Math.sin(r)*s.scaleX*a)/a,h=(0|Math.sin(n)*-s.scaleY*a)/a,_=(0|Math.cos(n)*s.scaleY*a)/a,u=this.t.style,c=this.t.currentStyle;if(c){i=l,l=-h,h=-i,e=c.filter,u.filter="";var f,p,d=this.t.offsetWidth,g=this.t.offsetHeight,v="absolute"!==c.position,y="progid:DXImageTransform.Microsoft.Matrix(M11="+o+", M12="+l+", M21="+h+", M22="+_,w=s.x+d*s.xPercent/100,b=s.y+g*s.yPercent/100;if(null!=s.ox&&(f=(s.oxp?.01*d*s.ox:s.ox)-d/2,p=(s.oyp?.01*g*s.oy:s.oy)-g/2,w+=f-(f*o+p*l),b+=p-(f*h+p*_)),v?(f=d/2,p=g/2,y+=", Dx="+(f-(f*o+p*l)+w)+", Dy="+(p-(f*h+p*_)+b)+")"):y+=", sizingMethod='auto expand')",u.filter=-1!==e.indexOf("DXImageTransform.Microsoft.Matrix(")?e.replace(D,y):y+" "+e,(0===t||1===t)&&1===o&&0===l&&0===h&&1===_&&(v&&-1===y.indexOf("Dx=0, Dy=0")||x.test(e)&&100!==parseFloat(RegExp.$1)||-1===e.indexOf("gradient("&&e.indexOf("Alpha"))&&u.removeAttribute("filter")),!v){var P,k,S,R=8>m?1:-1;for(f=s.ieOffsetX||0,p=s.ieOffsetY||0,s.ieOffsetX=Math.round((d-((0>o?-o:o)*d+(0>l?-l:l)*g))/2+w),s.ieOffsetY=Math.round((g-((0>_?-_:_)*g+(0>h?-h:h)*d))/2+b),ve=0;4>ve;ve++)k=ee[ve],P=c[k],i=-1!==P.indexOf("px")?parseFloat(P):$(this.t,k,parseFloat(P),P.replace(T,""))||0,S=i!==s[k]?2>ve?-s.ieOffsetX:-s.ieOffsetY:2>ve?f-s.ieOffsetX:p-s.ieOffsetY,u[k]=(s[k]=Math.round(i-S*(0===ve||2===ve?1:R)))+"px"}}},Xe=B.set3DTransformRatio=B.setTransformRatio=function(t){var e,i,s,r,n,a,o,l,h,_,u,c,p,m,d,g,v,y,T,x,w,b,P,k=this.data,S=this.t.style,R=k.rotation,O=k.rotationX,A=k.rotationY,C=k.scaleX,D=k.scaleY,M=k.scaleZ,F=k.x,I=k.y,E=k.z,N=k.svg,L=k.perspective,X=k.force3D;if(!(((1!==t&&0!==t||"auto"!==X||this.tween._totalTime!==this.tween._totalDuration&&this.tween._totalTime)&&X||E||L||A||O)&&(!we||!N)&&Re))return R||k.skewX||N?(R*=z,b=k.skewX*z,P=1e5,e=Math.cos(R)*C,r=Math.sin(R)*C,i=Math.sin(R-b)*-D,n=Math.cos(R-b)*D,b&&"simple"===k.skewType&&(v=Math.tan(b),v=Math.sqrt(1+v*v),i*=v,n*=v,k.skewY&&(e*=v,r*=v)),N&&(F+=k.xOrigin-(k.xOrigin*e+k.yOrigin*i)+k.xOffset,I+=k.yOrigin-(k.xOrigin*r+k.yOrigin*n)+k.yOffset,we&&(k.xPercent||k.yPercent)&&(m=this.t.getBBox(),F+=.01*k.xPercent*m.width,I+=.01*k.yPercent*m.height),m=1e-6,m>F&&F>-m&&(F=0),m>I&&I>-m&&(I=0)),T=(0|e*P)/P+","+(0|r*P)/P+","+(0|i*P)/P+","+(0|n*P)/P+","+F+","+I+")",N&&we?this.t.setAttribute("transform","matrix("+T):S[Pe]=(k.xPercent||k.yPercent?"translate("+k.xPercent+"%,"+k.yPercent+"%) matrix(":"matrix(")+T):S[Pe]=(k.xPercent||k.yPercent?"translate("+k.xPercent+"%,"+k.yPercent+"%) matrix(":"matrix(")+C+",0,0,"+D+","+F+","+I+")",void 0;if(f&&(m=1e-4,m>C&&C>-m&&(C=M=2e-5),m>D&&D>-m&&(D=M=2e-5),!L||k.z||k.rotationX||k.rotationY||(L=0)),R||k.skewX)R*=z,d=e=Math.cos(R),g=r=Math.sin(R),k.skewX&&(R-=k.skewX*z,d=Math.cos(R),g=Math.sin(R),"simple"===k.skewType&&(v=Math.tan(k.skewX*z),v=Math.sqrt(1+v*v),d*=v,g*=v,k.skewY&&(e*=v,r*=v))),i=-g,n=d;else{if(!(A||O||1!==M||L||N))return S[Pe]=(k.xPercent||k.yPercent?"translate("+k.xPercent+"%,"+k.yPercent+"%) translate3d(":"translate3d(")+F+"px,"+I+"px,"+E+"px)"+(1!==C||1!==D?" scale("+C+","+D+")":""),void 0;e=n=1,i=r=0}h=1,s=a=o=l=_=u=0,c=L?-1/L:0,p=k.zOrigin,m=1e-6,x=",",w="0",R=A*z,R&&(d=Math.cos(R),g=Math.sin(R),o=-g,_=c*-g,s=e*g,a=r*g,h=d,c*=d,e*=d,r*=d),R=O*z,R&&(d=Math.cos(R),g=Math.sin(R),v=i*d+s*g,y=n*d+a*g,l=h*g,u=c*g,s=i*-g+s*d,a=n*-g+a*d,h*=d,c*=d,i=v,n=y),1!==M&&(s*=M,a*=M,h*=M,c*=M),1!==D&&(i*=D,n*=D,l*=D,u*=D),1!==C&&(e*=C,r*=C,o*=C,_*=C),(p||N)&&(p&&(F+=s*-p,I+=a*-p,E+=h*-p+p),N&&(F+=k.xOrigin-(k.xOrigin*e+k.yOrigin*i)+k.xOffset,I+=k.yOrigin-(k.xOrigin*r+k.yOrigin*n)+k.yOffset),m>F&&F>-m&&(F=w),m>I&&I>-m&&(I=w),m>E&&E>-m&&(E=0)),T=k.xPercent||k.yPercent?"translate("+k.xPercent+"%,"+k.yPercent+"%) matrix3d(":"matrix3d(",T+=(m>e&&e>-m?w:e)+x+(m>r&&r>-m?w:r)+x+(m>o&&o>-m?w:o),T+=x+(m>_&&_>-m?w:_)+x+(m>i&&i>-m?w:i)+x+(m>n&&n>-m?w:n),O||A?(T+=x+(m>l&&l>-m?w:l)+x+(m>u&&u>-m?w:u)+x+(m>s&&s>-m?w:s),T+=x+(m>a&&a>-m?w:a)+x+(m>h&&h>-m?w:h)+x+(m>c&&c>-m?w:c)+x):T+=",0,0,0,0,1,0,",T+=F+x+I+x+E+x+(L?1+-E/L:1)+")",S[Pe]=T};h=Oe.prototype,h.x=h.y=h.z=h.skewX=h.skewY=h.rotation=h.rotationX=h.rotationY=h.zOrigin=h.xPercent=h.yPercent=h.xOffset=h.yOffset=0,h.scaleX=h.scaleY=h.scaleZ=1,Te("transform,scale,scaleX,scaleY,scaleZ,x,y,z,rotation,rotationX,rotationY,rotationZ,skewX,skewY,shortRotation,shortRotationX,shortRotationY,shortRotationZ,transformOrigin,svgOrigin,transformPerspective,directionalRotation,parseTransform,force3D,skewType,xPercent,yPercent,smoothOrigin",{parser:function(t,e,i,s,n,o,l){if(s._lastParsedTransform===l)return n;s._lastParsedTransform=l;var h,_,u,c,f,p,m,d,g,v,y=t._gsTransform,T=t.style,x=1e-6,w=be.length,b=l,P={},k="transformOrigin";if(l.display?(c=Q(t,"display"),T.display="block",h=Ne(t,r,!0,l.parseTransform),T.display=c):h=Ne(t,r,!0,l.parseTransform),s._transform=h,"string"==typeof b.transform&&Pe)c=L.style,c[Pe]=b.transform,c.display="block",c.position="absolute",E.body.appendChild(L),_=Ne(L,null,!1),E.body.removeChild(L),_.perspective||(_.perspective=h.perspective),null!=b.xPercent&&(_.xPercent=ne(b.xPercent,h.xPercent)),null!=b.yPercent&&(_.yPercent=ne(b.yPercent,h.yPercent));else if("object"==typeof b){if(_={scaleX:ne(null!=b.scaleX?b.scaleX:b.scale,h.scaleX),scaleY:ne(null!=b.scaleY?b.scaleY:b.scale,h.scaleY),scaleZ:ne(b.scaleZ,h.scaleZ),x:ne(b.x,h.x),y:ne(b.y,h.y),z:ne(b.z,h.z),xPercent:ne(b.xPercent,h.xPercent),yPercent:ne(b.yPercent,h.yPercent),perspective:ne(b.transformPerspective,h.perspective)},d=b.directionalRotation,null!=d)if("object"==typeof d)for(c in d)b[c]=d[c];else b.rotation=d;"string"==typeof b.x&&-1!==b.x.indexOf("%")&&(_.x=0,_.xPercent=ne(b.x,h.xPercent)),"string"==typeof b.y&&-1!==b.y.indexOf("%")&&(_.y=0,_.yPercent=ne(b.y,h.yPercent)),_.rotation=ae("rotation"in b?b.rotation:"shortRotation"in b?b.shortRotation+"_short":"rotationZ"in b?b.rotationZ:h.rotation,h.rotation,"rotation",P),Re&&(_.rotationX=ae("rotationX"in b?b.rotationX:"shortRotationX"in b?b.shortRotationX+"_short":h.rotationX||0,h.rotationX,"rotationX",P),_.rotationY=ae("rotationY"in b?b.rotationY:"shortRotationY"in b?b.shortRotationY+"_short":h.rotationY||0,h.rotationY,"rotationY",P)),_.skewX=null==b.skewX?h.skewX:ae(b.skewX,h.skewX),_.skewY=null==b.skewY?h.skewY:ae(b.skewY,h.skewY),(u=_.skewY-h.skewY)&&(_.skewX+=u,_.rotation+=u)}for(Re&&null!=b.force3D&&(h.force3D=b.force3D,m=!0),h.skewType=b.skewType||h.skewType||a.defaultSkewType,p=h.force3D||h.z||h.rotationX||h.rotationY||_.z||_.rotationX||_.rotationY||_.perspective,p||null==b.scale||(_.scaleZ=1);--w>-1;)i=be[w],f=_[i]-h[i],(f>x||-x>f||null!=b[i]||null!=I[i])&&(m=!0,n=new me(h,i,h[i],f,n),i in P&&(n.e=P[i]),n.xs0=0,n.plugin=o,s._overwriteProps.push(n.n));return f=b.transformOrigin,h.svg&&(f||b.svgOrigin)&&(g=h.xOffset,v=h.yOffset,ze(t,se(f),_,b.svgOrigin,b.smoothOrigin),n=de(h,"xOrigin",(y?h:_).xOrigin,_.xOrigin,n,k),n=de(h,"yOrigin",(y?h:_).yOrigin,_.yOrigin,n,k),(g!==h.xOffset||v!==h.yOffset)&&(n=de(h,"xOffset",y?g:h.xOffset,h.xOffset,n,k),n=de(h,"yOffset",y?v:h.yOffset,h.yOffset,n,k)),f=we?null:"0px 0px"),(f||Re&&p&&h.zOrigin)&&(Pe?(m=!0,i=Se,f=(f||Q(t,i,r,!1,"50% 50%"))+"",n=new me(T,i,0,0,n,-1,k),n.b=T[i],n.plugin=o,Re?(c=h.zOrigin,f=f.split(" "),h.zOrigin=(f.length>2&&(0===c||"0px"!==f[2])?parseFloat(f[2]):c)||0,n.xs0=n.e=f[0]+" "+(f[1]||"50%")+" 0px",n=new me(h,"zOrigin",0,0,n,-1,n.n),n.b=c,n.xs0=n.e=h.zOrigin):n.xs0=n.e=f):se(f+"",h)),m&&(s._transformType=h.svg&&we||!p&&3!==this._transformType?2:3),n},prefix:!0}),Te("boxShadow",{defaultValue:"0px 0px 0px 0px #999",prefix:!0,color:!0,multi:!0,keyword:"inset"}),Te("borderRadius",{defaultValue:"0px",parser:function(t,e,i,n,a){e=this.format(e);var o,l,h,_,u,c,f,p,m,d,g,v,y,T,x,w,b=["borderTopLeftRadius","borderTopRightRadius","borderBottomRightRadius","borderBottomLeftRadius"],P=t.style;for(m=parseFloat(t.offsetWidth),d=parseFloat(t.offsetHeight),o=e.split(" "),l=0;b.length>l;l++)this.p.indexOf("border")&&(b[l]=W(b[l])),u=_=Q(t,b[l],r,!1,"0px"),-1!==u.indexOf(" ")&&(_=u.split(" "),u=_[0],_=_[1]),c=h=o[l],f=parseFloat(u),v=u.substr((f+"").length),y="="===c.charAt(1),y?(p=parseInt(c.charAt(0)+"1",10),c=c.substr(2),p*=parseFloat(c),g=c.substr((p+"").length-(0>p?1:0))||""):(p=parseFloat(c),g=c.substr((p+"").length)),""===g&&(g=s[i]||v),g!==v&&(T=$(t,"borderLeft",f,v),x=$(t,"borderTop",f,v),"%"===g?(u=100*(T/m)+"%",_=100*(x/d)+"%"):"em"===g?(w=$(t,"borderLeft",1,"em"),u=T/w+"em",_=x/w+"em"):(u=T+"px",_=x+"px"),y&&(c=parseFloat(u)+p+g,h=parseFloat(_)+p+g)),a=ge(P,b[l],u+" "+_,c+" "+h,!1,"0px",a);return a},prefix:!0,formatter:ce("0px 0px 0px 0px",!1,!0)}),Te("backgroundPosition",{defaultValue:"0 0",parser:function(t,e,i,s,n,a){var o,l,h,_,u,c,f="background-position",p=r||Z(t,null),d=this.format((p?m?p.getPropertyValue(f+"-x")+" "+p.getPropertyValue(f+"-y"):p.getPropertyValue(f):t.currentStyle.backgroundPositionX+" "+t.currentStyle.backgroundPositionY)||"0 0"),g=this.format(e);
if(-1!==d.indexOf("%")!=(-1!==g.indexOf("%"))&&(c=Q(t,"backgroundImage").replace(R,""),c&&"none"!==c)){for(o=d.split(" "),l=g.split(" "),X.setAttribute("src",c),h=2;--h>-1;)d=o[h],_=-1!==d.indexOf("%"),_!==(-1!==l[h].indexOf("%"))&&(u=0===h?t.offsetWidth-X.width:t.offsetHeight-X.height,o[h]=_?parseFloat(d)/100*u+"px":100*(parseFloat(d)/u)+"%");d=o.join(" ")}return this.parseComplex(t.style,d,g,n,a)},formatter:se}),Te("backgroundSize",{defaultValue:"0 0",formatter:se}),Te("perspective",{defaultValue:"0px",prefix:!0}),Te("perspectiveOrigin",{defaultValue:"50% 50%",prefix:!0}),Te("transformStyle",{prefix:!0}),Te("backfaceVisibility",{prefix:!0}),Te("userSelect",{prefix:!0}),Te("margin",{parser:fe("marginTop,marginRight,marginBottom,marginLeft")}),Te("padding",{parser:fe("paddingTop,paddingRight,paddingBottom,paddingLeft")}),Te("clip",{defaultValue:"rect(0px,0px,0px,0px)",parser:function(t,e,i,s,n,a){var o,l,h;return 9>m?(l=t.currentStyle,h=8>m?" ":",",o="rect("+l.clipTop+h+l.clipRight+h+l.clipBottom+h+l.clipLeft+")",e=this.format(e).split(",").join(h)):(o=this.format(Q(t,this.p,r,!1,this.dflt)),e=this.format(e)),this.parseComplex(t.style,o,e,n,a)}}),Te("textShadow",{defaultValue:"0px 0px 0px #999",color:!0,multi:!0}),Te("autoRound,strictUnits",{parser:function(t,e,i,s,r){return r}}),Te("border",{defaultValue:"0px solid #000",parser:function(t,e,i,s,n,a){return this.parseComplex(t.style,this.format(Q(t,"borderTopWidth",r,!1,"0px")+" "+Q(t,"borderTopStyle",r,!1,"solid")+" "+Q(t,"borderTopColor",r,!1,"#000")),this.format(e),n,a)},color:!0,formatter:function(t){var e=t.split(" ");return e[0]+" "+(e[1]||"solid")+" "+(t.match(ue)||["#000"])[0]}}),Te("borderWidth",{parser:fe("borderTopWidth,borderRightWidth,borderBottomWidth,borderLeftWidth")}),Te("float,cssFloat,styleFloat",{parser:function(t,e,i,s,r){var n=t.style,a="cssFloat"in n?"cssFloat":"styleFloat";return new me(n,a,0,0,r,-1,i,!1,0,n[a],e)}});var Be=function(t){var e,i=this.t,s=i.filter||Q(this.data,"filter")||"",r=0|this.s+this.c*t;100===r&&(-1===s.indexOf("atrix(")&&-1===s.indexOf("radient(")&&-1===s.indexOf("oader(")?(i.removeAttribute("filter"),e=!Q(this.data,"filter")):(i.filter=s.replace(b,""),e=!0)),e||(this.xn1&&(i.filter=s=s||"alpha(opacity="+r+")"),-1===s.indexOf("pacity")?0===r&&this.xn1||(i.filter=s+" alpha(opacity="+r+")"):i.filter=s.replace(x,"opacity="+r))};Te("opacity,alpha,autoAlpha",{defaultValue:"1",parser:function(t,e,i,s,n,a){var o=parseFloat(Q(t,"opacity",r,!1,"1")),l=t.style,h="autoAlpha"===i;return"string"==typeof e&&"="===e.charAt(1)&&(e=("-"===e.charAt(0)?-1:1)*parseFloat(e.substr(2))+o),h&&1===o&&"hidden"===Q(t,"visibility",r)&&0!==e&&(o=0),Y?n=new me(l,"opacity",o,e-o,n):(n=new me(l,"opacity",100*o,100*(e-o),n),n.xn1=h?1:0,l.zoom=1,n.type=2,n.b="alpha(opacity="+n.s+")",n.e="alpha(opacity="+(n.s+n.c)+")",n.data=t,n.plugin=a,n.setRatio=Be),h&&(n=new me(l,"visibility",0,0,n,-1,null,!1,0,0!==o?"inherit":"hidden",0===e?"hidden":"inherit"),n.xs0="inherit",s._overwriteProps.push(n.n),s._overwriteProps.push(i)),n}});var je=function(t,e){e&&(t.removeProperty?(("ms"===e.substr(0,2)||"webkit"===e.substr(0,6))&&(e="-"+e),t.removeProperty(e.replace(k,"-$1").toLowerCase())):t.removeAttribute(e))},Ye=function(t){if(this.t._gsClassPT=this,1===t||0===t){this.t.setAttribute("class",0===t?this.b:this.e);for(var e=this.data,i=this.t.style;e;)e.v?i[e.p]=e.v:je(i,e.p),e=e._next;1===t&&this.t._gsClassPT===this&&(this.t._gsClassPT=null)}else this.t.getAttribute("class")!==this.e&&this.t.setAttribute("class",this.e)};Te("className",{parser:function(t,e,s,n,a,o,l){var h,_,u,c,f,p=t.getAttribute("class")||"",m=t.style.cssText;if(a=n._classNamePT=new me(t,s,0,0,a,2),a.setRatio=Ye,a.pr=-11,i=!0,a.b=p,_=K(t,r),u=t._gsClassPT){for(c={},f=u.data;f;)c[f.p]=1,f=f._next;u.setRatio(1)}return t._gsClassPT=a,a.e="="!==e.charAt(1)?e:p.replace(RegExp("\\s*\\b"+e.substr(2)+"\\b"),"")+("+"===e.charAt(0)?" "+e.substr(2):""),t.setAttribute("class",a.e),h=J(t,_,K(t),l,c),t.setAttribute("class",p),a.data=h.firstMPT,t.style.cssText=m,a=a.xfirst=n.parse(t,h.difs,a,o)}});var Ue=function(t){if((1===t||0===t)&&this.data._totalTime===this.data._totalDuration&&"isFromStart"!==this.data.data){var e,i,s,r,n,a=this.t.style,o=l.transform.parse;if("all"===this.e)a.cssText="",r=!0;else for(e=this.e.split(" ").join("").split(","),s=e.length;--s>-1;)i=e[s],l[i]&&(l[i].parse===o?r=!0:i="transformOrigin"===i?Se:l[i].p),je(a,i);r&&(je(a,Pe),n=this.t._gsTransform,n&&(n.svg&&this.t.removeAttribute("data-svg-origin"),delete this.t._gsTransform))}};for(Te("clearProps",{parser:function(t,e,s,r,n){return n=new me(t,s,0,0,n,2),n.setRatio=Ue,n.e=e,n.pr=-10,n.data=r._tween,i=!0,n}}),h="bezier,throwProps,physicsProps,physics2D".split(","),ve=h.length;ve--;)xe(h[ve]);h=a.prototype,h._firstPT=h._lastParsedTransform=h._transform=null,h._onInitTween=function(t,e,o){if(!t.nodeType)return!1;this._target=t,this._tween=o,this._vars=e,_=e.autoRound,i=!1,s=e.suffixMap||a.suffixMap,r=Z(t,""),n=this._overwriteProps;var h,f,m,d,g,v,y,T,x,b=t.style;if(u&&""===b.zIndex&&(h=Q(t,"zIndex",r),("auto"===h||""===h)&&this._addLazySet(b,"zIndex",0)),"string"==typeof e&&(d=b.cssText,h=K(t,r),b.cssText=d+";"+e,h=J(t,h,K(t)).difs,!Y&&w.test(e)&&(h.opacity=parseFloat(RegExp.$1)),e=h,b.cssText=d),this._firstPT=f=e.className?l.className.parse(t,e.className,"className",this,null,null,e):this.parse(t,e,null),this._transformType){for(x=3===this._transformType,Pe?c&&(u=!0,""===b.zIndex&&(y=Q(t,"zIndex",r),("auto"===y||""===y)&&this._addLazySet(b,"zIndex",0)),p&&this._addLazySet(b,"WebkitBackfaceVisibility",this._vars.WebkitBackfaceVisibility||(x?"visible":"hidden"))):b.zoom=1,m=f;m&&m._next;)m=m._next;T=new me(t,"transform",0,0,null,2),this._linkCSSP(T,null,m),T.setRatio=Pe?Xe:Le,T.data=this._transform||Ne(t,r,!0),T.tween=o,T.pr=-1,n.pop()}if(i){for(;f;){for(v=f._next,m=d;m&&m.pr>f.pr;)m=m._next;(f._prev=m?m._prev:g)?f._prev._next=f:d=f,(f._next=m)?m._prev=f:g=f,f=v}this._firstPT=d}return!0},h.parse=function(t,e,i,n){var a,o,h,u,c,f,p,m,d,g,v=t.style;for(a in e)f=e[a],o=l[a],o?i=o.parse(t,f,a,this,i,n,e):(c=Q(t,a,r)+"",d="string"==typeof f,"color"===a||"fill"===a||"stroke"===a||-1!==a.indexOf("Color")||d&&P.test(f)?(d||(f=he(f),f=(f.length>3?"rgba(":"rgb(")+f.join(",")+")"),i=ge(v,a,c,f,!0,"transparent",i,0,n)):!d||-1===f.indexOf(" ")&&-1===f.indexOf(",")?(h=parseFloat(c),p=h||0===h?c.substr((h+"").length):"",(""===c||"auto"===c)&&("width"===a||"height"===a?(h=ie(t,a,r),p="px"):"left"===a||"top"===a?(h=H(t,a,r),p="px"):(h="opacity"!==a?0:1,p="")),g=d&&"="===f.charAt(1),g?(u=parseInt(f.charAt(0)+"1",10),f=f.substr(2),u*=parseFloat(f),m=f.replace(T,"")):(u=parseFloat(f),m=d?f.replace(T,""):""),""===m&&(m=a in s?s[a]:p),f=u||0===u?(g?u+h:u)+m:e[a],p!==m&&""!==m&&(u||0===u)&&h&&(h=$(t,a,h,p),"%"===m?(h/=$(t,a,100,"%")/100,e.strictUnits!==!0&&(c=h+"%")):"em"===m||"rem"===m?h/=$(t,a,1,m):"px"!==m&&(u=$(t,a,u,m),m="px"),g&&(u||0===u)&&(f=u+h+m)),g&&(u+=h),!h&&0!==h||!u&&0!==u?void 0!==v[a]&&(f||"NaN"!=f+""&&null!=f)?(i=new me(v,a,u||h||0,0,i,-1,a,!1,0,c,f),i.xs0="none"!==f||"display"!==a&&-1===a.indexOf("Style")?f:c):q("invalid "+a+" tween value: "+e[a]):(i=new me(v,a,h,u-h,i,0,a,_!==!1&&("px"===m||"zIndex"===a),0,c,f),i.xs0=m)):i=ge(v,a,c,f,!0,null,i,0,n)),n&&i&&!i.plugin&&(i.plugin=n);return i},h.setRatio=function(t){var e,i,s,r=this._firstPT,n=1e-6;if(1!==t||this._tween._time!==this._tween._duration&&0!==this._tween._time)if(t||this._tween._time!==this._tween._duration&&0!==this._tween._time||this._tween._rawPrevTime===-1e-6)for(;r;){if(e=r.c*t+r.s,r.r?e=Math.round(e):n>e&&e>-n&&(e=0),r.type)if(1===r.type)if(s=r.l,2===s)r.t[r.p]=r.xs0+e+r.xs1+r.xn1+r.xs2;else if(3===s)r.t[r.p]=r.xs0+e+r.xs1+r.xn1+r.xs2+r.xn2+r.xs3;else if(4===s)r.t[r.p]=r.xs0+e+r.xs1+r.xn1+r.xs2+r.xn2+r.xs3+r.xn3+r.xs4;else if(5===s)r.t[r.p]=r.xs0+e+r.xs1+r.xn1+r.xs2+r.xn2+r.xs3+r.xn3+r.xs4+r.xn4+r.xs5;else{for(i=r.xs0+e+r.xs1,s=1;r.l>s;s++)i+=r["xn"+s]+r["xs"+(s+1)];r.t[r.p]=i}else-1===r.type?r.t[r.p]=r.xs0:r.setRatio&&r.setRatio(t);else r.t[r.p]=e+r.xs0;r=r._next}else for(;r;)2!==r.type?r.t[r.p]=r.b:r.setRatio(t),r=r._next;else for(;r;){if(2!==r.type)if(r.r&&-1!==r.type)if(e=Math.round(r.s+r.c),r.type){if(1===r.type){for(s=r.l,i=r.xs0+e+r.xs1,s=1;r.l>s;s++)i+=r["xn"+s]+r["xs"+(s+1)];r.t[r.p]=i}}else r.t[r.p]=e+r.xs0;else r.t[r.p]=r.e;else r.setRatio(t);r=r._next}},h._enableTransforms=function(t){this._transform=this._transform||Ne(this._target,r,!0),this._transformType=this._transform.svg&&we||!t&&3!==this._transformType?2:3};var qe=function(){this.t[this.p]=this.e,this.data._linkCSSP(this,this._next,null,!0)};h._addLazySet=function(t,e,i){var s=this._firstPT=new me(t,e,0,0,this._firstPT,2);s.e=i,s.setRatio=qe,s.data=this},h._linkCSSP=function(t,e,i,s){return t&&(e&&(e._prev=t),t._next&&(t._next._prev=t._prev),t._prev?t._prev._next=t._next:this._firstPT===t&&(this._firstPT=t._next,s=!0),i?i._next=t:s||null!==this._firstPT||(this._firstPT=t),t._next=e,t._prev=i),t},h._kill=function(e){var i,s,r,n=e;if(e.autoAlpha||e.alpha){n={};for(s in e)n[s]=e[s];n.opacity=1,n.autoAlpha&&(n.visibility=1)}return e.className&&(i=this._classNamePT)&&(r=i.xfirst,r&&r._prev?this._linkCSSP(r._prev,i._next,r._prev._prev):r===this._firstPT&&(this._firstPT=i._next),i._next&&this._linkCSSP(i._next,i._next._next,r._prev),this._classNamePT=null),t.prototype._kill.call(this,n)};var Ve=function(t,e,i){var s,r,n,a;if(t.slice)for(r=t.length;--r>-1;)Ve(t[r],e,i);else for(s=t.childNodes,r=s.length;--r>-1;)n=s[r],a=n.type,n.style&&(e.push(K(n)),i&&i.push(n)),1!==a&&9!==a&&11!==a||!n.childNodes.length||Ve(n,e,i)};return a.cascadeTo=function(t,i,s){var r,n,a,o,l=e.to(t,i,s),h=[l],_=[],u=[],c=[],f=e._internals.reservedProps;for(t=l._targets||l.target,Ve(t,_,c),l.render(i,!0,!0),Ve(t,u),l.render(0,!0,!0),l._enabled(!0),r=c.length;--r>-1;)if(n=J(c[r],_[r],u[r]),n.firstMPT){n=n.difs;for(a in s)f[a]&&(n[a]=s[a]);o={};for(a in n)o[a]=_[r][a];h.push(e.fromTo(c[r],i,o,n))}return h},t.activate([a]),a},!0),function(){var t=_gsScope._gsDefine.plugin({propName:"roundProps",version:"1.5",priority:-1,API:2,init:function(t,e,i){return this._tween=i,!0}}),e=function(t){for(;t;)t.f||t.blob||(t.r=1),t=t._next},i=t.prototype;i._onInitAllProps=function(){for(var t,i,s,r=this._tween,n=r.vars.roundProps.join?r.vars.roundProps:r.vars.roundProps.split(","),a=n.length,o={},l=r._propLookup.roundProps;--a>-1;)o[n[a]]=1;for(a=n.length;--a>-1;)for(t=n[a],i=r._firstPT;i;)s=i._next,i.pg?i.t._roundProps(o,!0):i.n===t&&(2===i.f&&i.t?e(i.t._firstPT):(this._add(i.t,t,i.s,i.c),s&&(s._prev=i._prev),i._prev?i._prev._next=s:r._firstPT===i&&(r._firstPT=s),i._next=i._prev=null,r._propLookup[t]=l)),i=s;return!1},i._add=function(t,e,i,s){this._addTween(t,e,i,i+s,e,!0),this._overwriteProps.push(e)}}(),function(){_gsScope._gsDefine.plugin({propName:"attr",API:2,version:"0.5.0",init:function(t,e){var i;if("function"!=typeof t.setAttribute)return!1;for(i in e)this._addTween(t,"setAttribute",t.getAttribute(i)+"",e[i]+"",i,!1,i),this._overwriteProps.push(i);return!0}})}(),_gsScope._gsDefine.plugin({propName:"directionalRotation",version:"0.2.1",API:2,init:function(t,e){"object"!=typeof e&&(e={rotation:e}),this.finals={};var i,s,r,n,a,o,l=e.useRadians===!0?2*Math.PI:360,h=1e-6;for(i in e)"useRadians"!==i&&(o=(e[i]+"").split("_"),s=o[0],r=parseFloat("function"!=typeof t[i]?t[i]:t[i.indexOf("set")||"function"!=typeof t["get"+i.substr(3)]?i:"get"+i.substr(3)]()),n=this.finals[i]="string"==typeof s&&"="===s.charAt(1)?r+parseInt(s.charAt(0)+"1",10)*Number(s.substr(2)):Number(s)||0,a=n-r,o.length&&(s=o.join("_"),-1!==s.indexOf("short")&&(a%=l,a!==a%(l/2)&&(a=0>a?a+l:a-l)),-1!==s.indexOf("_cw")&&0>a?a=(a+9999999999*l)%l-(0|a/l)*l:-1!==s.indexOf("ccw")&&a>0&&(a=(a-9999999999*l)%l-(0|a/l)*l)),(a>h||-h>a)&&(this._addTween(t,i,r,r+a,i),this._overwriteProps.push(i)));return!0},set:function(t){var e;if(1!==t)this._super.setRatio.call(this,t);else for(e=this._firstPT;e;)e.f?e.t[e.p](this.finals[e.p]):e.t[e.p]=this.finals[e.p],e=e._next}})._autoCSS=!0,_gsScope._gsDefine("easing.Back",["easing.Ease"],function(t){var e,i,s,r=_gsScope.GreenSockGlobals||_gsScope,n=r.com.greensock,a=2*Math.PI,o=Math.PI/2,l=n._class,h=function(e,i){var s=l("easing."+e,function(){},!0),r=s.prototype=new t;return r.constructor=s,r.getRatio=i,s},_=t.register||function(){},u=function(t,e,i,s){var r=l("easing."+t,{easeOut:new e,easeIn:new i,easeInOut:new s},!0);return _(r,t),r},c=function(t,e,i){this.t=t,this.v=e,i&&(this.next=i,i.prev=this,this.c=i.v-e,this.gap=i.t-t)},f=function(e,i){var s=l("easing."+e,function(t){this._p1=t||0===t?t:1.70158,this._p2=1.525*this._p1},!0),r=s.prototype=new t;return r.constructor=s,r.getRatio=i,r.config=function(t){return new s(t)},s},p=u("Back",f("BackOut",function(t){return(t-=1)*t*((this._p1+1)*t+this._p1)+1}),f("BackIn",function(t){return t*t*((this._p1+1)*t-this._p1)}),f("BackInOut",function(t){return 1>(t*=2)?.5*t*t*((this._p2+1)*t-this._p2):.5*((t-=2)*t*((this._p2+1)*t+this._p2)+2)})),m=l("easing.SlowMo",function(t,e,i){e=e||0===e?e:.7,null==t?t=.7:t>1&&(t=1),this._p=1!==t?e:0,this._p1=(1-t)/2,this._p2=t,this._p3=this._p1+this._p2,this._calcEnd=i===!0},!0),d=m.prototype=new t;return d.constructor=m,d.getRatio=function(t){var e=t+(.5-t)*this._p;return this._p1>t?this._calcEnd?1-(t=1-t/this._p1)*t:e-(t=1-t/this._p1)*t*t*t*e:t>this._p3?this._calcEnd?1-(t=(t-this._p3)/this._p1)*t:e+(t-e)*(t=(t-this._p3)/this._p1)*t*t*t:this._calcEnd?1:e},m.ease=new m(.7,.7),d.config=m.config=function(t,e,i){return new m(t,e,i)},e=l("easing.SteppedEase",function(t){t=t||1,this._p1=1/t,this._p2=t+1},!0),d=e.prototype=new t,d.constructor=e,d.getRatio=function(t){return 0>t?t=0:t>=1&&(t=.999999999),(this._p2*t>>0)*this._p1},d.config=e.config=function(t){return new e(t)},i=l("easing.RoughEase",function(e){e=e||{};for(var i,s,r,n,a,o,l=e.taper||"none",h=[],_=0,u=0|(e.points||20),f=u,p=e.randomize!==!1,m=e.clamp===!0,d=e.template instanceof t?e.template:null,g="number"==typeof e.strength?.4*e.strength:.4;--f>-1;)i=p?Math.random():1/u*f,s=d?d.getRatio(i):i,"none"===l?r=g:"out"===l?(n=1-i,r=n*n*g):"in"===l?r=i*i*g:.5>i?(n=2*i,r=.5*n*n*g):(n=2*(1-i),r=.5*n*n*g),p?s+=Math.random()*r-.5*r:f%2?s+=.5*r:s-=.5*r,m&&(s>1?s=1:0>s&&(s=0)),h[_++]={x:i,y:s};for(h.sort(function(t,e){return t.x-e.x}),o=new c(1,1,null),f=u;--f>-1;)a=h[f],o=new c(a.x,a.y,o);this._prev=new c(0,0,0!==o.t?o:o.next)},!0),d=i.prototype=new t,d.constructor=i,d.getRatio=function(t){var e=this._prev;if(t>e.t){for(;e.next&&t>=e.t;)e=e.next;e=e.prev}else for(;e.prev&&e.t>=t;)e=e.prev;return this._prev=e,e.v+(t-e.t)/e.gap*e.c},d.config=function(t){return new i(t)},i.ease=new i,u("Bounce",h("BounceOut",function(t){return 1/2.75>t?7.5625*t*t:2/2.75>t?7.5625*(t-=1.5/2.75)*t+.75:2.5/2.75>t?7.5625*(t-=2.25/2.75)*t+.9375:7.5625*(t-=2.625/2.75)*t+.984375}),h("BounceIn",function(t){return 1/2.75>(t=1-t)?1-7.5625*t*t:2/2.75>t?1-(7.5625*(t-=1.5/2.75)*t+.75):2.5/2.75>t?1-(7.5625*(t-=2.25/2.75)*t+.9375):1-(7.5625*(t-=2.625/2.75)*t+.984375)}),h("BounceInOut",function(t){var e=.5>t;return t=e?1-2*t:2*t-1,t=1/2.75>t?7.5625*t*t:2/2.75>t?7.5625*(t-=1.5/2.75)*t+.75:2.5/2.75>t?7.5625*(t-=2.25/2.75)*t+.9375:7.5625*(t-=2.625/2.75)*t+.984375,e?.5*(1-t):.5*t+.5})),u("Circ",h("CircOut",function(t){return Math.sqrt(1-(t-=1)*t)}),h("CircIn",function(t){return-(Math.sqrt(1-t*t)-1)}),h("CircInOut",function(t){return 1>(t*=2)?-.5*(Math.sqrt(1-t*t)-1):.5*(Math.sqrt(1-(t-=2)*t)+1)})),s=function(e,i,s){var r=l("easing."+e,function(t,e){this._p1=t>=1?t:1,this._p2=(e||s)/(1>t?t:1),this._p3=this._p2/a*(Math.asin(1/this._p1)||0),this._p2=a/this._p2},!0),n=r.prototype=new t;return n.constructor=r,n.getRatio=i,n.config=function(t,e){return new r(t,e)},r},u("Elastic",s("ElasticOut",function(t){return this._p1*Math.pow(2,-10*t)*Math.sin((t-this._p3)*this._p2)+1},.3),s("ElasticIn",function(t){return-(this._p1*Math.pow(2,10*(t-=1))*Math.sin((t-this._p3)*this._p2))},.3),s("ElasticInOut",function(t){return 1>(t*=2)?-.5*this._p1*Math.pow(2,10*(t-=1))*Math.sin((t-this._p3)*this._p2):.5*this._p1*Math.pow(2,-10*(t-=1))*Math.sin((t-this._p3)*this._p2)+1},.45)),u("Expo",h("ExpoOut",function(t){return 1-Math.pow(2,-10*t)}),h("ExpoIn",function(t){return Math.pow(2,10*(t-1))-.001}),h("ExpoInOut",function(t){return 1>(t*=2)?.5*Math.pow(2,10*(t-1)):.5*(2-Math.pow(2,-10*(t-1)))})),u("Sine",h("SineOut",function(t){return Math.sin(t*o)}),h("SineIn",function(t){return-Math.cos(t*o)+1}),h("SineInOut",function(t){return-.5*(Math.cos(Math.PI*t)-1)})),l("easing.EaseLookup",{find:function(e){return t.map[e]}},!0),_(r.SlowMo,"SlowMo","ease,"),_(i,"RoughEase","ease,"),_(e,"SteppedEase","ease,"),p},!0)}),_gsScope._gsDefine&&_gsScope._gsQueue.pop()(),function(t,e){"use strict";var i=t.GreenSockGlobals=t.GreenSockGlobals||t;if(!i.TweenLite){var s,r,n,a,o,l=function(t){var e,s=t.split("."),r=i;for(e=0;s.length>e;e++)r[s[e]]=r=r[s[e]]||{};return r},h=l("com.greensock"),_=1e-10,u=function(t){var e,i=[],s=t.length;for(e=0;e!==s;i.push(t[e++]));return i},c=function(){},f=function(){var t=Object.prototype.toString,e=t.call([]);return function(i){return null!=i&&(i instanceof Array||"object"==typeof i&&!!i.push&&t.call(i)===e)}}(),p={},m=function(s,r,n,a){this.sc=p[s]?p[s].sc:[],p[s]=this,this.gsClass=null,this.func=n;var o=[];this.check=function(h){for(var _,u,c,f,d,g=r.length,v=g;--g>-1;)(_=p[r[g]]||new m(r[g],[])).gsClass?(o[g]=_.gsClass,v--):h&&_.sc.push(this);if(0===v&&n)for(u=("com.greensock."+s).split("."),c=u.pop(),f=l(u.join("."))[c]=this.gsClass=n.apply(n,o),a&&(i[c]=f,d="undefined"!=typeof module&&module.exports,!d&&"function"==typeof define&&define.amd?define((t.GreenSockAMDPath?t.GreenSockAMDPath+"/":"")+s.split(".").pop(),[],function(){return f}):s===e&&d&&(module.exports=f)),g=0;this.sc.length>g;g++)this.sc[g].check()},this.check(!0)},d=t._gsDefine=function(t,e,i,s){return new m(t,e,i,s)},g=h._class=function(t,e,i){return e=e||function(){},d(t,[],function(){return e},i),e};d.globals=i;var v=[0,0,1,1],y=[],T=g("easing.Ease",function(t,e,i,s){this._func=t,this._type=i||0,this._power=s||0,this._params=e?v.concat(e):v},!0),x=T.map={},w=T.register=function(t,e,i,s){for(var r,n,a,o,l=e.split(","),_=l.length,u=(i||"easeIn,easeOut,easeInOut").split(",");--_>-1;)for(n=l[_],r=s?g("easing."+n,null,!0):h.easing[n]||{},a=u.length;--a>-1;)o=u[a],x[n+"."+o]=x[o+n]=r[o]=t.getRatio?t:t[o]||new t};for(n=T.prototype,n._calcEnd=!1,n.getRatio=function(t){if(this._func)return this._params[0]=t,this._func.apply(null,this._params);var e=this._type,i=this._power,s=1===e?1-t:2===e?t:.5>t?2*t:2*(1-t);return 1===i?s*=s:2===i?s*=s*s:3===i?s*=s*s*s:4===i&&(s*=s*s*s*s),1===e?1-s:2===e?s:.5>t?s/2:1-s/2},s=["Linear","Quad","Cubic","Quart","Quint,Strong"],r=s.length;--r>-1;)n=s[r]+",Power"+r,w(new T(null,null,1,r),n,"easeOut",!0),w(new T(null,null,2,r),n,"easeIn"+(0===r?",easeNone":"")),w(new T(null,null,3,r),n,"easeInOut");x.linear=h.easing.Linear.easeIn,x.swing=h.easing.Quad.easeInOut;var b=g("events.EventDispatcher",function(t){this._listeners={},this._eventTarget=t||this});n=b.prototype,n.addEventListener=function(t,e,i,s,r){r=r||0;var n,l,h=this._listeners[t],_=0;for(null==h&&(this._listeners[t]=h=[]),l=h.length;--l>-1;)n=h[l],n.c===e&&n.s===i?h.splice(l,1):0===_&&r>n.pr&&(_=l+1);h.splice(_,0,{c:e,s:i,up:s,pr:r}),this!==a||o||a.wake()},n.removeEventListener=function(t,e){var i,s=this._listeners[t];if(s)for(i=s.length;--i>-1;)if(s[i].c===e)return s.splice(i,1),void 0},n.dispatchEvent=function(t){var e,i,s,r=this._listeners[t];if(r)for(e=r.length,i=this._eventTarget;--e>-1;)s=r[e],s&&(s.up?s.c.call(s.s||i,{type:t,target:i}):s.c.call(s.s||i))};var P=t.requestAnimationFrame,k=t.cancelAnimationFrame,S=Date.now||function(){return(new Date).getTime()},R=S();for(s=["ms","moz","webkit","o"],r=s.length;--r>-1&&!P;)P=t[s[r]+"RequestAnimationFrame"],k=t[s[r]+"CancelAnimationFrame"]||t[s[r]+"CancelRequestAnimationFrame"];g("Ticker",function(t,e){var i,s,r,n,l,h=this,u=S(),f=e!==!1&&P,p=500,m=33,d="tick",g=function(t){var e,a,o=S()-R;o>p&&(u+=o-m),R+=o,h.time=(R-u)/1e3,e=h.time-l,(!i||e>0||t===!0)&&(h.frame++,l+=e+(e>=n?.004:n-e),a=!0),t!==!0&&(r=s(g)),a&&h.dispatchEvent(d)};b.call(h),h.time=h.frame=0,h.tick=function(){g(!0)},h.lagSmoothing=function(t,e){p=t||1/_,m=Math.min(e,p,0)},h.sleep=function(){null!=r&&(f&&k?k(r):clearTimeout(r),s=c,r=null,h===a&&(o=!1))},h.wake=function(){null!==r?h.sleep():h.frame>10&&(R=S()-p+5),s=0===i?c:f&&P?P:function(t){return setTimeout(t,0|1e3*(l-h.time)+1)},h===a&&(o=!0),g(2)},h.fps=function(t){return arguments.length?(i=t,n=1/(i||60),l=this.time+n,h.wake(),void 0):i},h.useRAF=function(t){return arguments.length?(h.sleep(),f=t,h.fps(i),void 0):f},h.fps(t),setTimeout(function(){f&&5>h.frame&&h.useRAF(!1)},1500)}),n=h.Ticker.prototype=new h.events.EventDispatcher,n.constructor=h.Ticker;var O=g("core.Animation",function(t,e){if(this.vars=e=e||{},this._duration=this._totalDuration=t||0,this._delay=Number(e.delay)||0,this._timeScale=1,this._active=e.immediateRender===!0,this.data=e.data,this._reversed=e.reversed===!0,W){o||a.wake();var i=this.vars.useFrames?G:W;i.add(this,i._time),this.vars.paused&&this.paused(!0)}});a=O.ticker=new h.Ticker,n=O.prototype,n._dirty=n._gc=n._initted=n._paused=!1,n._totalTime=n._time=0,n._rawPrevTime=-1,n._next=n._last=n._onUpdate=n._timeline=n.timeline=null,n._paused=!1;var A=function(){o&&S()-R>2e3&&a.wake(),setTimeout(A,2e3)};A(),n.play=function(t,e){return null!=t&&this.seek(t,e),this.reversed(!1).paused(!1)},n.pause=function(t,e){return null!=t&&this.seek(t,e),this.paused(!0)},n.resume=function(t,e){return null!=t&&this.seek(t,e),this.paused(!1)},n.seek=function(t,e){return this.totalTime(Number(t),e!==!1)},n.restart=function(t,e){return this.reversed(!1).paused(!1).totalTime(t?-this._delay:0,e!==!1,!0)},n.reverse=function(t,e){return null!=t&&this.seek(t||this.totalDuration(),e),this.reversed(!0).paused(!1)},n.render=function(){},n.invalidate=function(){return this._time=this._totalTime=0,this._initted=this._gc=!1,this._rawPrevTime=-1,(this._gc||!this.timeline)&&this._enabled(!0),this},n.isActive=function(){var t,e=this._timeline,i=this._startTime;return!e||!this._gc&&!this._paused&&e.isActive()&&(t=e.rawTime())>=i&&i+this.totalDuration()/this._timeScale>t},n._enabled=function(t,e){return o||a.wake(),this._gc=!t,this._active=this.isActive(),e!==!0&&(t&&!this.timeline?this._timeline.add(this,this._startTime-this._delay):!t&&this.timeline&&this._timeline._remove(this,!0)),!1},n._kill=function(){return this._enabled(!1,!1)},n.kill=function(t,e){return this._kill(t,e),this},n._uncache=function(t){for(var e=t?this:this.timeline;e;)e._dirty=!0,e=e.timeline;return this},n._swapSelfInParams=function(t){for(var e=t.length,i=t.concat();--e>-1;)"{self}"===t[e]&&(i[e]=this);return i},n._callback=function(t){var e=this.vars;e[t].apply(e[t+"Scope"]||e.callbackScope||this,e[t+"Params"]||y)},n.eventCallback=function(t,e,i,s){if("on"===(t||"").substr(0,2)){var r=this.vars;if(1===arguments.length)return r[t];null==e?delete r[t]:(r[t]=e,r[t+"Params"]=f(i)&&-1!==i.join("").indexOf("{self}")?this._swapSelfInParams(i):i,r[t+"Scope"]=s),"onUpdate"===t&&(this._onUpdate=e)}return this},n.delay=function(t){return arguments.length?(this._timeline.smoothChildTiming&&this.startTime(this._startTime+t-this._delay),this._delay=t,this):this._delay},n.duration=function(t){return arguments.length?(this._duration=this._totalDuration=t,this._uncache(!0),this._timeline.smoothChildTiming&&this._time>0&&this._time<this._duration&&0!==t&&this.totalTime(this._totalTime*(t/this._duration),!0),this):(this._dirty=!1,this._duration)},n.totalDuration=function(t){return this._dirty=!1,arguments.length?this.duration(t):this._totalDuration},n.time=function(t,e){return arguments.length?(this._dirty&&this.totalDuration(),this.totalTime(t>this._duration?this._duration:t,e)):this._time},n.totalTime=function(t,e,i){if(o||a.wake(),!arguments.length)return this._totalTime;if(this._timeline){if(0>t&&!i&&(t+=this.totalDuration()),this._timeline.smoothChildTiming){this._dirty&&this.totalDuration();var s=this._totalDuration,r=this._timeline;if(t>s&&!i&&(t=s),this._startTime=(this._paused?this._pauseTime:r._time)-(this._reversed?s-t:t)/this._timeScale,r._dirty||this._uncache(!1),r._timeline)for(;r._timeline;)r._timeline._time!==(r._startTime+r._totalTime)/r._timeScale&&r.totalTime(r._totalTime,!0),r=r._timeline}this._gc&&this._enabled(!0,!1),(this._totalTime!==t||0===this._duration)&&(F.length&&Q(),this.render(t,e,!1),F.length&&Q())}return this},n.progress=n.totalProgress=function(t,e){var i=this.duration();return arguments.length?this.totalTime(i*t,e):i?this._time/i:this.ratio},n.startTime=function(t){return arguments.length?(t!==this._startTime&&(this._startTime=t,this.timeline&&this.timeline._sortChildren&&this.timeline.add(this,t-this._delay)),this):this._startTime},n.endTime=function(t){return this._startTime+(0!=t?this.totalDuration():this.duration())/this._timeScale},n.timeScale=function(t){if(!arguments.length)return this._timeScale;if(t=t||_,this._timeline&&this._timeline.smoothChildTiming){var e=this._pauseTime,i=e||0===e?e:this._timeline.totalTime();this._startTime=i-(i-this._startTime)*this._timeScale/t}return this._timeScale=t,this._uncache(!1)},n.reversed=function(t){return arguments.length?(t!=this._reversed&&(this._reversed=t,this.totalTime(this._timeline&&!this._timeline.smoothChildTiming?this.totalDuration()-this._totalTime:this._totalTime,!0)),this):this._reversed},n.paused=function(t){if(!arguments.length)return this._paused;var e,i,s=this._timeline;return t!=this._paused&&s&&(o||t||a.wake(),e=s.rawTime(),i=e-this._pauseTime,!t&&s.smoothChildTiming&&(this._startTime+=i,this._uncache(!1)),this._pauseTime=t?e:null,this._paused=t,this._active=this.isActive(),!t&&0!==i&&this._initted&&this.duration()&&(e=s.smoothChildTiming?this._totalTime:(e-this._startTime)/this._timeScale,this.render(e,e===this._totalTime,!0))),this._gc&&!t&&this._enabled(!0,!1),this};var C=g("core.SimpleTimeline",function(t){O.call(this,0,t),this.autoRemoveChildren=this.smoothChildTiming=!0});n=C.prototype=new O,n.constructor=C,n.kill()._gc=!1,n._first=n._last=n._recent=null,n._sortChildren=!1,n.add=n.insert=function(t,e){var i,s;if(t._startTime=Number(e||0)+t._delay,t._paused&&this!==t._timeline&&(t._pauseTime=t._startTime+(this.rawTime()-t._startTime)/t._timeScale),t.timeline&&t.timeline._remove(t,!0),t.timeline=t._timeline=this,t._gc&&t._enabled(!0,!0),i=this._last,this._sortChildren)for(s=t._startTime;i&&i._startTime>s;)i=i._prev;return i?(t._next=i._next,i._next=t):(t._next=this._first,this._first=t),t._next?t._next._prev=t:this._last=t,t._prev=i,this._recent=t,this._timeline&&this._uncache(!0),this},n._remove=function(t,e){return t.timeline===this&&(e||t._enabled(!1,!0),t._prev?t._prev._next=t._next:this._first===t&&(this._first=t._next),t._next?t._next._prev=t._prev:this._last===t&&(this._last=t._prev),t._next=t._prev=t.timeline=null,t===this._recent&&(this._recent=this._last),this._timeline&&this._uncache(!0)),this},n.render=function(t,e,i){var s,r=this._first;for(this._totalTime=this._time=this._rawPrevTime=t;r;)s=r._next,(r._active||t>=r._startTime&&!r._paused)&&(r._reversed?r.render((r._dirty?r.totalDuration():r._totalDuration)-(t-r._startTime)*r._timeScale,e,i):r.render((t-r._startTime)*r._timeScale,e,i)),r=s},n.rawTime=function(){return o||a.wake(),this._totalTime};var D=g("TweenLite",function(e,i,s){if(O.call(this,i,s),this.render=D.prototype.render,null==e)throw"Cannot tween a null target.";this.target=e="string"!=typeof e?e:D.selector(e)||e;var r,n,a,o=e.jquery||e.length&&e!==t&&e[0]&&(e[0]===t||e[0].nodeType&&e[0].style&&!e.nodeType),l=this.vars.overwrite;if(this._overwrite=l=null==l?V[D.defaultOverwrite]:"number"==typeof l?l>>0:V[l],(o||e instanceof Array||e.push&&f(e))&&"number"!=typeof e[0])for(this._targets=a=u(e),this._propLookup=[],this._siblings=[],r=0;a.length>r;r++)n=a[r],n?"string"!=typeof n?n.length&&n!==t&&n[0]&&(n[0]===t||n[0].nodeType&&n[0].style&&!n.nodeType)?(a.splice(r--,1),this._targets=a=a.concat(u(n))):(this._siblings[r]=$(n,this,!1),1===l&&this._siblings[r].length>1&&K(n,this,null,1,this._siblings[r])):(n=a[r--]=D.selector(n),"string"==typeof n&&a.splice(r+1,1)):a.splice(r--,1);else this._propLookup={},this._siblings=$(e,this,!1),1===l&&this._siblings.length>1&&K(e,this,null,1,this._siblings);(this.vars.immediateRender||0===i&&0===this._delay&&this.vars.immediateRender!==!1)&&(this._time=-_,this.render(-this._delay))},!0),M=function(e){return e&&e.length&&e!==t&&e[0]&&(e[0]===t||e[0].nodeType&&e[0].style&&!e.nodeType)},z=function(t,e){var i,s={};for(i in t)q[i]||i in e&&"transform"!==i&&"x"!==i&&"y"!==i&&"width"!==i&&"height"!==i&&"className"!==i&&"border"!==i||!(!j[i]||j[i]&&j[i]._autoCSS)||(s[i]=t[i],delete t[i]);t.css=s};n=D.prototype=new O,n.constructor=D,n.kill()._gc=!1,n.ratio=0,n._firstPT=n._targets=n._overwrittenProps=n._startAt=null,n._notifyPluginsOfEnabled=n._lazy=!1,D.version="1.18.0",D.defaultEase=n._ease=new T(null,null,1,1),D.defaultOverwrite="auto",D.ticker=a,D.autoSleep=120,D.lagSmoothing=function(t,e){a.lagSmoothing(t,e)},D.selector=t.$||t.jQuery||function(e){var i=t.$||t.jQuery;return i?(D.selector=i,i(e)):"undefined"==typeof document?e:document.querySelectorAll?document.querySelectorAll(e):document.getElementById("#"===e.charAt(0)?e.substr(1):e)};var F=[],I={},E=/(?:(-|-=|\+=)?\d*\.?\d*(?:e[\-+]?\d+)?)[0-9]/gi,N=function(t){for(var e,i=this._firstPT,s=1e-6;i;)e=i.blob?t?this.join(""):this.start:i.c*t+i.s,i.r?e=Math.round(e):s>e&&e>-s&&(e=0),i.f?i.fp?i.t[i.p](i.fp,e):i.t[i.p](e):i.t[i.p]=e,i=i._next},L=function(t,e,i,s){var r,n,a,o,l,h,_,u=[t,e],c=0,f="",p=0;for(u.start=t,i&&(i(u),t=u[0],e=u[1]),u.length=0,r=t.match(E)||[],n=e.match(E)||[],s&&(s._next=null,s.blob=1,u._firstPT=s),l=n.length,o=0;l>o;o++)_=n[o],h=e.substr(c,e.indexOf(_,c)-c),f+=h||!o?h:",",c+=h.length,p?p=(p+1)%5:"rgba("===h.substr(-5)&&(p=1),_===r[o]||o>=r.length?f+=_:(f&&(u.push(f),f=""),a=parseFloat(r[o]),u.push(a),u._firstPT={_next:u._firstPT,t:u,p:u.length-1,s:a,c:("="===_.charAt(1)?parseInt(_.charAt(0)+"1",10)*parseFloat(_.substr(2)):parseFloat(_)-a)||0,f:0,r:p&&4>p}),c+=_.length;return f+=e.substr(c),f&&u.push(f),u.setRatio=N,u},X=function(t,e,i,s,r,n,a,o){var l,h,_="get"===i?t[e]:i,u=typeof t[e],c="string"==typeof s&&"="===s.charAt(1),f={t:t,p:e,s:_,f:"function"===u,pg:0,n:r||e,r:n,pr:0,c:c?parseInt(s.charAt(0)+"1",10)*parseFloat(s.substr(2)):parseFloat(s)-_||0};return"number"!==u&&("function"===u&&"get"===i&&(h=e.indexOf("set")||"function"!=typeof t["get"+e.substr(3)]?e:"get"+e.substr(3),f.s=_=a?t[h](a):t[h]()),"string"==typeof _&&(a||isNaN(_))?(f.fp=a,l=L(_,s,o||D.defaultStringFilter,f),f={t:l,p:"setRatio",s:0,c:1,f:2,pg:0,n:r||e,pr:0}):c||(f.c=parseFloat(s)-parseFloat(_)||0)),f.c?((f._next=this._firstPT)&&(f._next._prev=f),this._firstPT=f,f):void 0},B=D._internals={isArray:f,isSelector:M,lazyTweens:F,blobDif:L},j=D._plugins={},Y=B.tweenLookup={},U=0,q=B.reservedProps={ease:1,delay:1,overwrite:1,onComplete:1,onCompleteParams:1,onCompleteScope:1,useFrames:1,runBackwards:1,startAt:1,onUpdate:1,onUpdateParams:1,onUpdateScope:1,onStart:1,onStartParams:1,onStartScope:1,onReverseComplete:1,onReverseCompleteParams:1,onReverseCompleteScope:1,onRepeat:1,onRepeatParams:1,onRepeatScope:1,easeParams:1,yoyo:1,immediateRender:1,repeat:1,repeatDelay:1,data:1,paused:1,reversed:1,autoCSS:1,lazy:1,onOverwrite:1,callbackScope:1,stringFilter:1},V={none:0,all:1,auto:2,concurrent:3,allOnStart:4,preexisting:5,"true":1,"false":0},G=O._rootFramesTimeline=new C,W=O._rootTimeline=new C,Z=30,Q=B.lazyRender=function(){var t,e=F.length;for(I={};--e>-1;)t=F[e],t&&t._lazy!==!1&&(t.render(t._lazy[0],t._lazy[1],!0),t._lazy=!1);F.length=0};W._startTime=a.time,G._startTime=a.frame,W._active=G._active=!0,setTimeout(Q,1),O._updateRoot=D.render=function(){var t,e,i;if(F.length&&Q(),W.render((a.time-W._startTime)*W._timeScale,!1,!1),G.render((a.frame-G._startTime)*G._timeScale,!1,!1),F.length&&Q(),a.frame>=Z){Z=a.frame+(parseInt(D.autoSleep,10)||120);
for(i in Y){for(e=Y[i].tweens,t=e.length;--t>-1;)e[t]._gc&&e.splice(t,1);0===e.length&&delete Y[i]}if(i=W._first,(!i||i._paused)&&D.autoSleep&&!G._first&&1===a._listeners.tick.length){for(;i&&i._paused;)i=i._next;i||a.sleep()}}},a.addEventListener("tick",O._updateRoot);var $=function(t,e,i){var s,r,n=t._gsTweenID;if(Y[n||(t._gsTweenID=n="t"+U++)]||(Y[n]={target:t,tweens:[]}),e&&(s=Y[n].tweens,s[r=s.length]=e,i))for(;--r>-1;)s[r]===e&&s.splice(r,1);return Y[n].tweens},H=function(t,e,i,s){var r,n,a=t.vars.onOverwrite;return a&&(r=a(t,e,i,s)),a=D.onOverwrite,a&&(n=a(t,e,i,s)),r!==!1&&n!==!1},K=function(t,e,i,s,r){var n,a,o,l;if(1===s||s>=4){for(l=r.length,n=0;l>n;n++)if((o=r[n])!==e)o._gc||o._kill(null,t,e)&&(a=!0);else if(5===s)break;return a}var h,u=e._startTime+_,c=[],f=0,p=0===e._duration;for(n=r.length;--n>-1;)(o=r[n])===e||o._gc||o._paused||(o._timeline!==e._timeline?(h=h||J(e,0,p),0===J(o,h,p)&&(c[f++]=o)):u>=o._startTime&&o._startTime+o.totalDuration()/o._timeScale>u&&((p||!o._initted)&&2e-10>=u-o._startTime||(c[f++]=o)));for(n=f;--n>-1;)if(o=c[n],2===s&&o._kill(i,t,e)&&(a=!0),2!==s||!o._firstPT&&o._initted){if(2!==s&&!H(o,e))continue;o._enabled(!1,!1)&&(a=!0)}return a},J=function(t,e,i){for(var s=t._timeline,r=s._timeScale,n=t._startTime;s._timeline;){if(n+=s._startTime,r*=s._timeScale,s._paused)return-100;s=s._timeline}return n/=r,n>e?n-e:i&&n===e||!t._initted&&2*_>n-e?_:(n+=t.totalDuration()/t._timeScale/r)>e+_?0:n-e-_};n._init=function(){var t,e,i,s,r,n=this.vars,a=this._overwrittenProps,o=this._duration,l=!!n.immediateRender,h=n.ease;if(n.startAt){this._startAt&&(this._startAt.render(-1,!0),this._startAt.kill()),r={};for(s in n.startAt)r[s]=n.startAt[s];if(r.overwrite=!1,r.immediateRender=!0,r.lazy=l&&n.lazy!==!1,r.startAt=r.delay=null,this._startAt=D.to(this.target,0,r),l)if(this._time>0)this._startAt=null;else if(0!==o)return}else if(n.runBackwards&&0!==o)if(this._startAt)this._startAt.render(-1,!0),this._startAt.kill(),this._startAt=null;else{0!==this._time&&(l=!1),i={};for(s in n)q[s]&&"autoCSS"!==s||(i[s]=n[s]);if(i.overwrite=0,i.data="isFromStart",i.lazy=l&&n.lazy!==!1,i.immediateRender=l,this._startAt=D.to(this.target,0,i),l){if(0===this._time)return}else this._startAt._init(),this._startAt._enabled(!1),this.vars.immediateRender&&(this._startAt=null)}if(this._ease=h=h?h instanceof T?h:"function"==typeof h?new T(h,n.easeParams):x[h]||D.defaultEase:D.defaultEase,n.easeParams instanceof Array&&h.config&&(this._ease=h.config.apply(h,n.easeParams)),this._easeType=this._ease._type,this._easePower=this._ease._power,this._firstPT=null,this._targets)for(t=this._targets.length;--t>-1;)this._initProps(this._targets[t],this._propLookup[t]={},this._siblings[t],a?a[t]:null)&&(e=!0);else e=this._initProps(this.target,this._propLookup,this._siblings,a);if(e&&D._onPluginEvent("_onInitAllProps",this),a&&(this._firstPT||"function"!=typeof this.target&&this._enabled(!1,!1)),n.runBackwards)for(i=this._firstPT;i;)i.s+=i.c,i.c=-i.c,i=i._next;this._onUpdate=n.onUpdate,this._initted=!0},n._initProps=function(e,i,s,r){var n,a,o,l,h,_;if(null==e)return!1;I[e._gsTweenID]&&Q(),this.vars.css||e.style&&e!==t&&e.nodeType&&j.css&&this.vars.autoCSS!==!1&&z(this.vars,e);for(n in this.vars)if(_=this.vars[n],q[n])_&&(_ instanceof Array||_.push&&f(_))&&-1!==_.join("").indexOf("{self}")&&(this.vars[n]=_=this._swapSelfInParams(_,this));else if(j[n]&&(l=new j[n])._onInitTween(e,this.vars[n],this)){for(this._firstPT=h={_next:this._firstPT,t:l,p:"setRatio",s:0,c:1,f:1,n:n,pg:1,pr:l._priority},a=l._overwriteProps.length;--a>-1;)i[l._overwriteProps[a]]=this._firstPT;(l._priority||l._onInitAllProps)&&(o=!0),(l._onDisable||l._onEnable)&&(this._notifyPluginsOfEnabled=!0),h._next&&(h._next._prev=h)}else i[n]=X.call(this,e,n,"get",_,n,0,null,this.vars.stringFilter);return r&&this._kill(r,e)?this._initProps(e,i,s,r):this._overwrite>1&&this._firstPT&&s.length>1&&K(e,this,i,this._overwrite,s)?(this._kill(i,e),this._initProps(e,i,s,r)):(this._firstPT&&(this.vars.lazy!==!1&&this._duration||this.vars.lazy&&!this._duration)&&(I[e._gsTweenID]=!0),o)},n.render=function(t,e,i){var s,r,n,a,o=this._time,l=this._duration,h=this._rawPrevTime;if(t>=l)this._totalTime=this._time=l,this.ratio=this._ease._calcEnd?this._ease.getRatio(1):1,this._reversed||(s=!0,r="onComplete",i=i||this._timeline.autoRemoveChildren),0===l&&(this._initted||!this.vars.lazy||i)&&(this._startTime===this._timeline._duration&&(t=0),(0===t||0>h||h===_&&"isPause"!==this.data)&&h!==t&&(i=!0,h>_&&(r="onReverseComplete")),this._rawPrevTime=a=!e||t||h===t?t:_);else if(1e-7>t)this._totalTime=this._time=0,this.ratio=this._ease._calcEnd?this._ease.getRatio(0):0,(0!==o||0===l&&h>0)&&(r="onReverseComplete",s=this._reversed),0>t&&(this._active=!1,0===l&&(this._initted||!this.vars.lazy||i)&&(h>=0&&(h!==_||"isPause"!==this.data)&&(i=!0),this._rawPrevTime=a=!e||t||h===t?t:_)),this._initted||(i=!0);else if(this._totalTime=this._time=t,this._easeType){var u=t/l,c=this._easeType,f=this._easePower;(1===c||3===c&&u>=.5)&&(u=1-u),3===c&&(u*=2),1===f?u*=u:2===f?u*=u*u:3===f?u*=u*u*u:4===f&&(u*=u*u*u*u),this.ratio=1===c?1-u:2===c?u:.5>t/l?u/2:1-u/2}else this.ratio=this._ease.getRatio(t/l);if(this._time!==o||i){if(!this._initted){if(this._init(),!this._initted||this._gc)return;if(!i&&this._firstPT&&(this.vars.lazy!==!1&&this._duration||this.vars.lazy&&!this._duration))return this._time=this._totalTime=o,this._rawPrevTime=h,F.push(this),this._lazy=[t,e],void 0;this._time&&!s?this.ratio=this._ease.getRatio(this._time/l):s&&this._ease._calcEnd&&(this.ratio=this._ease.getRatio(0===this._time?0:1))}for(this._lazy!==!1&&(this._lazy=!1),this._active||!this._paused&&this._time!==o&&t>=0&&(this._active=!0),0===o&&(this._startAt&&(t>=0?this._startAt.render(t,e,i):r||(r="_dummyGS")),this.vars.onStart&&(0!==this._time||0===l)&&(e||this._callback("onStart"))),n=this._firstPT;n;)n.f?n.t[n.p](n.c*this.ratio+n.s):n.t[n.p]=n.c*this.ratio+n.s,n=n._next;this._onUpdate&&(0>t&&this._startAt&&t!==-1e-4&&this._startAt.render(t,e,i),e||(this._time!==o||s)&&this._callback("onUpdate")),r&&(!this._gc||i)&&(0>t&&this._startAt&&!this._onUpdate&&t!==-1e-4&&this._startAt.render(t,e,i),s&&(this._timeline.autoRemoveChildren&&this._enabled(!1,!1),this._active=!1),!e&&this.vars[r]&&this._callback(r),0===l&&this._rawPrevTime===_&&a!==_&&(this._rawPrevTime=0))}},n._kill=function(t,e,i){if("all"===t&&(t=null),null==t&&(null==e||e===this.target))return this._lazy=!1,this._enabled(!1,!1);e="string"!=typeof e?e||this._targets||this.target:D.selector(e)||e;var s,r,n,a,o,l,h,_,u,c=i&&this._time&&i._startTime===this._startTime&&this._timeline===i._timeline;if((f(e)||M(e))&&"number"!=typeof e[0])for(s=e.length;--s>-1;)this._kill(t,e[s],i)&&(l=!0);else{if(this._targets){for(s=this._targets.length;--s>-1;)if(e===this._targets[s]){o=this._propLookup[s]||{},this._overwrittenProps=this._overwrittenProps||[],r=this._overwrittenProps[s]=t?this._overwrittenProps[s]||{}:"all";break}}else{if(e!==this.target)return!1;o=this._propLookup,r=this._overwrittenProps=t?this._overwrittenProps||{}:"all"}if(o){if(h=t||o,_=t!==r&&"all"!==r&&t!==o&&("object"!=typeof t||!t._tempKill),i&&(D.onOverwrite||this.vars.onOverwrite)){for(n in h)o[n]&&(u||(u=[]),u.push(n));if((u||!t)&&!H(this,i,e,u))return!1}for(n in h)(a=o[n])&&(c&&(a.f?a.t[a.p](a.s):a.t[a.p]=a.s,l=!0),a.pg&&a.t._kill(h)&&(l=!0),a.pg&&0!==a.t._overwriteProps.length||(a._prev?a._prev._next=a._next:a===this._firstPT&&(this._firstPT=a._next),a._next&&(a._next._prev=a._prev),a._next=a._prev=null),delete o[n]),_&&(r[n]=1);!this._firstPT&&this._initted&&this._enabled(!1,!1)}}return l},n.invalidate=function(){return this._notifyPluginsOfEnabled&&D._onPluginEvent("_onDisable",this),this._firstPT=this._overwrittenProps=this._startAt=this._onUpdate=null,this._notifyPluginsOfEnabled=this._active=this._lazy=!1,this._propLookup=this._targets?{}:[],O.prototype.invalidate.call(this),this.vars.immediateRender&&(this._time=-_,this.render(-this._delay)),this},n._enabled=function(t,e){if(o||a.wake(),t&&this._gc){var i,s=this._targets;if(s)for(i=s.length;--i>-1;)this._siblings[i]=$(s[i],this,!0);else this._siblings=$(this.target,this,!0)}return O.prototype._enabled.call(this,t,e),this._notifyPluginsOfEnabled&&this._firstPT?D._onPluginEvent(t?"_onEnable":"_onDisable",this):!1},D.to=function(t,e,i){return new D(t,e,i)},D.from=function(t,e,i){return i.runBackwards=!0,i.immediateRender=0!=i.immediateRender,new D(t,e,i)},D.fromTo=function(t,e,i,s){return s.startAt=i,s.immediateRender=0!=s.immediateRender&&0!=i.immediateRender,new D(t,e,s)},D.delayedCall=function(t,e,i,s,r){return new D(e,0,{delay:t,onComplete:e,onCompleteParams:i,callbackScope:s,onReverseComplete:e,onReverseCompleteParams:i,immediateRender:!1,lazy:!1,useFrames:r,overwrite:0})},D.set=function(t,e){return new D(t,0,e)},D.getTweensOf=function(t,e){if(null==t)return[];t="string"!=typeof t?t:D.selector(t)||t;var i,s,r,n;if((f(t)||M(t))&&"number"!=typeof t[0]){for(i=t.length,s=[];--i>-1;)s=s.concat(D.getTweensOf(t[i],e));for(i=s.length;--i>-1;)for(n=s[i],r=i;--r>-1;)n===s[r]&&s.splice(i,1)}else for(s=$(t).concat(),i=s.length;--i>-1;)(s[i]._gc||e&&!s[i].isActive())&&s.splice(i,1);return s},D.killTweensOf=D.killDelayedCallsTo=function(t,e,i){"object"==typeof e&&(i=e,e=!1);for(var s=D.getTweensOf(t,e),r=s.length;--r>-1;)s[r]._kill(i,t)};var te=g("plugins.TweenPlugin",function(t,e){this._overwriteProps=(t||"").split(","),this._propName=this._overwriteProps[0],this._priority=e||0,this._super=te.prototype},!0);if(n=te.prototype,te.version="1.18.0",te.API=2,n._firstPT=null,n._addTween=X,n.setRatio=N,n._kill=function(t){var e,i=this._overwriteProps,s=this._firstPT;if(null!=t[this._propName])this._overwriteProps=[];else for(e=i.length;--e>-1;)null!=t[i[e]]&&i.splice(e,1);for(;s;)null!=t[s.n]&&(s._next&&(s._next._prev=s._prev),s._prev?(s._prev._next=s._next,s._prev=null):this._firstPT===s&&(this._firstPT=s._next)),s=s._next;return!1},n._roundProps=function(t,e){for(var i=this._firstPT;i;)(t[this._propName]||null!=i.n&&t[i.n.split(this._propName+"_").join("")])&&(i.r=e),i=i._next},D._onPluginEvent=function(t,e){var i,s,r,n,a,o=e._firstPT;if("_onInitAllProps"===t){for(;o;){for(a=o._next,s=r;s&&s.pr>o.pr;)s=s._next;(o._prev=s?s._prev:n)?o._prev._next=o:r=o,(o._next=s)?s._prev=o:n=o,o=a}o=e._firstPT=r}for(;o;)o.pg&&"function"==typeof o.t[t]&&o.t[t]()&&(i=!0),o=o._next;return i},te.activate=function(t){for(var e=t.length;--e>-1;)t[e].API===te.API&&(j[(new t[e])._propName]=t[e]);return!0},d.plugin=function(t){if(!(t&&t.propName&&t.init&&t.API))throw"illegal plugin definition.";var e,i=t.propName,s=t.priority||0,r=t.overwriteProps,n={init:"_onInitTween",set:"setRatio",kill:"_kill",round:"_roundProps",initAll:"_onInitAllProps"},a=g("plugins."+i.charAt(0).toUpperCase()+i.substr(1)+"Plugin",function(){te.call(this,i,s),this._overwriteProps=r||[]},t.global===!0),o=a.prototype=new te(i);o.constructor=a,a.API=t.API;for(e in n)"function"==typeof t[e]&&(o[n[e]]=t[e]);return a.version=t.version,te.activate([a]),a},s=t._gsQueue){for(r=0;s.length>r;r++)s[r]();for(n in p)p[n].func||t.console.log("GSAP encountered missing dependency: com.greensock."+n)}o=!1}}("undefined"!=typeof module&&module.exports&&"undefined"!=typeof global?global:this||window,"TweenMax");




/**
  @license
  Apache License 2.0 https://github.com/ReactiveX/RxJS/blob/master/LICENSE.txt
 **/
var __extends,__assign,__rest,__decorate,__param,__metadata,__awaiter,__generator;
(function(l){function m(k,l){return function(m,u){return k[m]=l?l(m,u):u}}var u="object"===typeof global?global:"object"===typeof self?self:"object"===typeof this?this:{};"object"===typeof System&&"function"===typeof System.register?System.register("tslib",[],function(k){l(m(u,k));return{setters:[],execute:function(){}}}):"function"===typeof define&&define.amd?define("tslib",["exports"],function(k){l(m(u,m(k)))}):"object"===typeof module&&"object"===typeof module.exports?l(m(u,m(module.exports))):
l(m(u))})(function(l){__extends=function(l,u){function k(){this.constructor=l}for(var m in u)u.hasOwnProperty(m)&&(l[m]=u[m]);l.prototype=null===u?Object.create(u):(k.prototype=u.prototype,new k)};__assign=Object.assign||function(l){for(var m,k=1,E=arguments.length;k<E;k++){m=arguments[k];for(var w in m)Object.prototype.hasOwnProperty.call(m,w)&&(l[w]=m[w])}return l};__rest=function(l,u){var k={},m;for(m in l)Object.prototype.hasOwnProperty.call(l,m)&&0>u.indexOf(m)&&(k[m]=l[m]);if(null!=l&&"function"===
typeof Object.getOwnPropertySymbols){var w=0;for(m=Object.getOwnPropertySymbols(l);w<m.length;w++)0>u.indexOf(m[w])&&(k[m[w]]=l[m[w]])}return k};__decorate=function(l,u,k,E){var m=arguments.length,A=3>m?u:null===E?E=Object.getOwnPropertyDescriptor(u,k):E,F;if("object"===typeof Reflect&&"function"===typeof Reflect.decorate)A=Reflect.decorate(l,u,k,E);else for(var v=l.length-1;0<=v;v--)if(F=l[v])A=(3>m?F(A):3<m?F(u,k,A):F(u,k))||A;return 3<m&&A&&Object.defineProperty(u,k,A),A};__param=function(l,u){return function(k,
m){u(k,m,l)}};__metadata=function(l,u){if("object"===typeof Reflect&&"function"===typeof Reflect.metadata)return Reflect.metadata(l,u)};__awaiter=function(l,u,k,E){return new (k||(k=Promise))(function(m,A){function w(l){try{G(E.next(l))}catch(q){A(q)}}function v(l){try{G(E["throw"](l))}catch(q){A(q)}}function G(l){l.done?m(l.value):(new k(function(k){k(l.value)})).then(w,v)}G((E=E.apply(l,u)).next())})};__generator=function(l,u){function k(l){return function(k){return m([l,k])}}function m(k){if(A)throw new TypeError("Generator is already executing.");
for(;w;)try{if(A=1,F&&(v=F[k[0]&2?"return":k[0]?"throw":"next"])&&!(v=v.call(F,k[1])).done)return v;if(F=0,v)k=[0,v.value];switch(k[0]){case 0:case 1:v=k;break;case 4:return w.label++,{value:k[1],done:!1};case 5:w.label++;F=k[1];k=[0];continue;case 7:k=w.ops.pop();w.trys.pop();continue;default:if(!(v=w.trys,v=0<v.length&&v[v.length-1])&&(6===k[0]||2===k[0])){w=0;continue}if(3===k[0]&&(!v||k[1]>v[0]&&k[1]<v[3]))w.label=k[1];else if(6===k[0]&&w.label<v[1])w.label=v[1],v=k;else if(v&&w.label<v[2])w.label=
v[2],w.ops.push(k);else{v[2]&&w.ops.pop();w.trys.pop();continue}}k=u.call(l,w)}catch(Z){k=[6,Z],F=0}finally{A=v=0}if(k[0]&5)throw k[1];return{value:k[0]?k[1]:void 0,done:!0}}var w={label:0,sent:function(){if(v[0]&1)throw v[1];return v[1]},trys:[],ops:[]},A,F,v;return{next:k(0),"throw":k(1),"return":k(2)}};l("__extends",__extends);l("__assign",__assign);l("__rest",__rest);l("__decorate",__decorate);l("__param",__param);l("__metadata",__metadata);l("__awaiter",__awaiter);l("__generator",__generator)});
(function(l,m){"object"===typeof exports&&"undefined"!==typeof module?m(exports):"function"===typeof define&&define.amd?define(["exports"],m):m(l.Rx=l.Rx||{})})(this,function(l){function m(b){return"function"===typeof b}function u(){try{return qa.apply(this,arguments)}catch(b){return n.e=b,n}}function k(b){qa=b;return u}function E(b){var a=b.subject;a.next(b.value);a.complete()}function w(b){b.subject.error(b.err)}function A(b){var a=this,c=b.source;b=b.subscriber;var e=c.callbackFunc,d=c.args,f=
c.scheduler,h=c.subject;if(!h){var h=c.subject=new P,g=function J(){for(var c=[],b=0;b<arguments.length;b++)c[b-0]=arguments[b];var e=J.source,b=e.selector,e=e.subject,d=c.shift();d?e.error(d):b?(c=k(b).apply(this,c),c===n?a.add(f.schedule(v,0,{err:n.e,subject:e})):a.add(f.schedule(F,0,{value:c,subject:e}))):a.add(f.schedule(F,0,{value:1===c.length?c[0]:c,subject:e}))};g.source=c;k(e).apply(this,d.concat(g))===n&&h.error(n.e)}a.add(h.subscribe(b))}function F(b){var a=b.subject;a.next(b.value);a.complete()}
function v(b){b.subject.error(b.err)}function G(b){return b&&"function"===typeof b.schedule}function Z(b){return b&&"function"!==typeof b.subscribe&&"function"===typeof b.then}function q(b,a,c,e){var d=new ra(b,c,e);if(d.closed)return null;if(a instanceof g)if(a._isScalar)d.next(a.value),d.complete();else return a.subscribe(d);else if(H(a)){b=0;for(c=a.length;b<c&&!d.closed;b++)d.next(a[b]);d.closed||d.complete()}else{if(Z(a))return a.then(function(c){d.closed||(d.next(c),d.complete())},function(c){return d.error(c)}).then(null,
function(c){r.setTimeout(function(){throw c;})}),d;if(a&&"function"===typeof a[I]){a=a[I]();do{b=a.next();if(b.done){d.complete();break}d.next(b.value);if(d.closed)break}while(1)}else if(a&&"function"===typeof a[M])if(a=a[M](),"function"!==typeof a.subscribe)d.error(new TypeError("Provided object does not correctly implement Symbol.observable"));else return a.subscribe(new ra(b,c,e));else d.error(new TypeError("You provided "+(null!=a&&"object"===typeof a?"an invalid object":"'"+a+"'")+" where a stream was expected. You can provide an Observable, Promise, Array, or Iterable."))}return null}
function S(){for(var b=[],a=0;a<arguments.length;a++)b[a-0]=arguments[a];a=null;G(b[b.length-1])&&(a=b.pop());return null===a&&1===b.length?b[0]:(new K(b,a)).lift(new aa(1))}function sa(b){var a=b.value;b=b.subscriber;b.closed||(b.next(a),b.complete())}function ob(b){var a=b.err;b=b.subscriber;b.closed||b.error(a)}function ga(b){return!H(b)&&0<=b-parseFloat(b)+1}function ta(){for(var b=[],a=0;a<arguments.length;a++)b[a-0]=arguments[a];var a=Number.POSITIVE_INFINITY,c=null,e=b[b.length-1];G(e)?(c=
b.pop(),1<b.length&&"number"===typeof b[b.length-1]&&(a=b.pop())):"number"===typeof e&&(a=b.pop());return null===c&&1===b.length?b[0]:(new K(b,c)).lift(new aa(a))}function ua(){for(var b=[],a=0;a<arguments.length;a++)b[a-0]=arguments[a];if(1===b.length)if(H(b[0]))b=b[0];else return b[0];return(new K(b)).lift(new pb)}function qb(b){var a=b.obj,c=b.keys,e=b.index,d=b.subscriber;e===b.length?d.complete():(c=c[e],d.next([c,a[c]]),b.index=e+1,this.schedule(b))}function ba(b){return b instanceof Date&&
!isNaN(+b)}function va(){for(var b=[],a=0;a<arguments.length;a++)b[a-0]=arguments[a];a=b[b.length-1];"function"===typeof a&&b.pop();return(new K(b)).lift(new wa(a))}function xa(b,a){if("function"!==typeof b)throw new TypeError("argument is not a function. Are you looking for `mapTo()`?");return this.lift(new ya(b,a))}function rb(b,a){void 0===a&&(a=null);return new Q({method:"GET",url:b,headers:a})}function sb(b,a,c){return new Q({method:"POST",url:b,body:a,headers:c})}function tb(b,a){return new Q({method:"DELETE",
url:b,headers:a})}function ub(b,a,c){return new Q({method:"PUT",url:b,body:a,headers:c})}function vb(b,a){return(new Q({method:"GET",url:b,responseType:"json",headers:a})).lift(new ya(function(c,a){return c.response},null))}function wb(b){for(var a=[],c=1;c<arguments.length;c++)a[c-1]=arguments[c];for(var c=a.length,e=0;e<c;e++){var d=a[e],f;for(f in d)d.hasOwnProperty(f)&&(b[f]=d[f])}return b}function za(b){var a=b.subscriber,c=b.context;c&&a.closeContext(c);a.closed||(b.context=a.openContext(),
b.context.closeAction=this.schedule(b,b.bufferTimeSpan))}function xb(b){var a=b.bufferCreationInterval,c=b.bufferTimeSpan,e=b.subscriber,d=b.scheduler,f=e.openContext();e.closed||(e.add(f.closeAction=d.schedule(Aa,c,{subscriber:e,context:f})),this.schedule(b,a))}function Aa(b){b.subscriber.closeContext(b.context)}function Ba(b){b=new yb(b);var a=this.lift(b);return b.caught=a}function Ca(b,a,c){void 0===c&&(c=Number.POSITIVE_INFINITY);"number"===typeof a&&(c=a,a=null);return this.lift(new Da(b,a,
c))}function Ea(b,a,c){void 0===c&&(c=Number.POSITIVE_INFINITY);"number"===typeof a&&(c=a,a=null);return this.lift(new Fa(b,a,c))}function zb(b){b.debouncedNext()}function Ab(){return function(){function b(){this._values=[]}b.prototype.add=function(a){this.has(a)||this._values.push(a)};b.prototype.has=function(a){return-1!==this._values.indexOf(a)};Object.defineProperty(b.prototype,"size",{get:function(){return this._values.length},enumerable:!0,configurable:!0});b.prototype.clear=function(){this._values.length=
0};return b}()}function Ga(b,a){return this.lift(new Bb(b,a))}function Ha(b,a,c){return this.lift(new Cb(b,a,c))}function ha(b,a){return this.lift(new Db(b,a))}function Ia(b){return this.lift(new Eb(b))}function Fb(b){b.clearThrottle()}function Ja(b){return b(this)}function N(b,a){var c;c="function"===typeof b?b:function(){return b};if("function"===typeof a)return this.lift(new Gb(c,a));a=Object.create(this,Hb);a.source=this;a.subjectFactory=c;return a}function Ib(b,a){function c(){return!c.pred.apply(c.thisArg,
arguments)}c.pred=b;c.thisArg=a;return c}function Jb(b,a){return function(c){var e=c;for(c=0;c<a;c++)if(e=e[b[c]],"undefined"===typeof e)return;return e}}function Kb(b){var a=b.period;b.subscriber.notifyNext();this.schedule(b,a)}function Lb(){return new y}function Ka(){return this.lift(new Mb)}function Nb(b){b.subscriber.clearThrottle()}function Ob(b){var a=b.subscriber,c=b.windowTimeSpan,e=b.window;e&&e.complete();b.window=a.openWindow();this.schedule(b,c)}function Pb(b){var a=b.windowTimeSpan,c=
b.subscriber,e=b.scheduler,d=b.windowCreationInterval,f=c.openWindow(),h={action:this,subscription:null};h.subscription=e.schedule(La,a,{subscriber:c,window:f,context:h});this.add(h.subscription);this.schedule(b,d)}function La(b){var a=b.subscriber,c=b.window;(b=b.context)&&b.action&&b.subscription&&b.action.remove(b.subscription);a.closeWindow(c)}function Ma(b,a){for(var c=0,e=a.length;c<e;c++)for(var d=a[c],f=Object.getOwnPropertyNames(d.prototype),h=0,g=f.length;h<g;h++){var k=f[h];b.prototype[k]=
d.prototype[k]}}var r="object"==typeof window&&window.window===window&&window||"object"==typeof self&&self.self===self&&self||"object"==typeof global&&global.global===global&&global;if(!r)throw Error("RxJS could not find any global context (window, self, global)");var H=Array.isArray||function(b){return b&&"number"===typeof b.length},n={e:{}},qa,ia=function(b){function a(c){b.call(this);this.errors=c;c=Error.call(this,c?c.length+" errors occurred during unsubscription:\n  "+c.map(function(c,a){return a+
1+") "+c.toString()}).join("\n  "):"");this.name=c.name="UnsubscriptionError";this.stack=c.stack;this.message=c.message}__extends(a,b);return a}(Error),x=function(){function b(a){this.closed=!1;a&&(this._unsubscribe=a)}b.prototype.unsubscribe=function(){var a=!1,c;if(!this.closed){this.closed=!0;var b=this._unsubscribe,d=this._subscriptions;this._subscriptions=null;if(m(b)){var f=k(b).call(this);f===n&&(a=!0,(c=c||[]).push(n.e))}if(H(d))for(var b=-1,h=d.length;++b<h;)f=d[b],null!=f&&"object"===typeof f&&
(f=k(f.unsubscribe).call(f),f===n&&(a=!0,c=c||[],f=n.e,f instanceof ia?c=c.concat(f.errors):c.push(f)));if(a)throw new ia(c);}};b.prototype.add=function(a){if(!a||a===b.EMPTY)return b.EMPTY;if(a===this)return this;var c=a;switch(typeof a){case "function":c=new b(a);case "object":c.closed||"function"!==typeof c.unsubscribe||(this.closed?c.unsubscribe():(this._subscriptions||(this._subscriptions=[])).push(c));break;default:throw Error("unrecognized teardown "+a+" added to Subscription.");}return c};
b.prototype.remove=function(a){if(null!=a&&a!==this&&a!==b.EMPTY){var c=this._subscriptions;c&&(a=c.indexOf(a),-1!==a&&c.splice(a,1))}};b.EMPTY=function(a){a.closed=!0;return a}(new b);return b}(),ja={closed:!0,next:function(b){},error:function(b){throw b;},complete:function(){}},ka=r.Symbol,T="function"===typeof ka&&"function"===typeof ka.for?ka.for("rxSubscriber"):"@@rxSubscriber",p=function(b){function a(c,e,d){b.call(this);this.syncErrorValue=null;this.isStopped=this.syncErrorThrowable=this.syncErrorThrown=
!1;switch(arguments.length){case 0:this.destination=ja;break;case 1:if(!c){this.destination=ja;break}if("object"===typeof c){c instanceof a?(this.destination=c,this.destination.add(this)):(this.syncErrorThrowable=!0,this.destination=new Na(this,c));break}default:this.syncErrorThrowable=!0,this.destination=new Na(this,c,e,d)}}__extends(a,b);a.prototype[T]=function(){return this};a.create=function(c,b,d){c=new a(c,b,d);c.syncErrorThrowable=!1;return c};a.prototype.next=function(c){this.isStopped||this._next(c)};
a.prototype.error=function(c){this.isStopped||(this.isStopped=!0,this._error(c))};a.prototype.complete=function(){this.isStopped||(this.isStopped=!0,this._complete())};a.prototype.unsubscribe=function(){this.closed||(this.isStopped=!0,b.prototype.unsubscribe.call(this))};a.prototype._next=function(c){this.destination.next(c)};a.prototype._error=function(c){this.destination.error(c);this.unsubscribe()};a.prototype._complete=function(){this.destination.complete();this.unsubscribe()};return a}(x),Na=
function(b){function a(c,a,d,f){b.call(this);this._parent=c;var e;c=this;m(a)?e=a:a&&(c=a,e=a.next,d=a.error,f=a.complete,m(c.unsubscribe)&&this.add(c.unsubscribe.bind(c)),c.unsubscribe=this.unsubscribe.bind(this));this._context=c;this._next=e;this._error=d;this._complete=f}__extends(a,b);a.prototype.next=function(c){if(!this.isStopped&&this._next){var a=this._parent;a.syncErrorThrowable?this.__tryOrSetError(a,this._next,c)&&this.unsubscribe():this.__tryOrUnsub(this._next,c)}};a.prototype.error=function(c){if(!this.isStopped){var a=
this._parent;if(this._error)a.syncErrorThrowable?this.__tryOrSetError(a,this._error,c):this.__tryOrUnsub(this._error,c),this.unsubscribe();else if(a.syncErrorThrowable)a.syncErrorValue=c,a.syncErrorThrown=!0,this.unsubscribe();else throw this.unsubscribe(),c;}};a.prototype.complete=function(){if(!this.isStopped){var c=this._parent;this._complete&&(c.syncErrorThrowable?this.__tryOrSetError(c,this._complete):this.__tryOrUnsub(this._complete));this.unsubscribe()}};a.prototype.__tryOrUnsub=function(c,
a){try{c.call(this._context,a)}catch(d){throw this.unsubscribe(),d;}};a.prototype.__tryOrSetError=function(c,a,b){try{a.call(this._context,b)}catch(f){return c.syncErrorValue=f,c.syncErrorThrown=!0}return!1};a.prototype._unsubscribe=function(){var c=this._parent;this._parent=this._context=null;c.unsubscribe()};return a}(p),M=function(b){var a=b.Symbol;"function"===typeof a?a.observable?b=a.observable:(b=a("observable"),a.observable=b):b="@@observable";return b}(r),g=function(){function b(a){this._isScalar=
!1;a&&(this._subscribe=a)}b.prototype.lift=function(a){var c=new b;c.source=this;c.operator=a;return c};b.prototype.subscribe=function(a,c,b){var e=this.operator;a:{if(a){if(a instanceof p)break a;if(a[T]){a=a[T]();break a}}a=a||c||b?new p(a,c,b):new p(ja)}e?e.call(a,this.source):a.add(this._subscribe(a));if(a.syncErrorThrowable&&(a.syncErrorThrowable=!1,a.syncErrorThrown))throw a.syncErrorValue;return a};b.prototype.forEach=function(a,c){var b=this;c||(r.Rx&&r.Rx.config&&r.Rx.config.Promise?c=r.Rx.config.Promise:
r.Promise&&(c=r.Promise));if(!c)throw Error("no Promise impl found");return new c(function(c,e){var d=b.subscribe(function(c){if(d)try{a(c)}catch(B){e(B),d.unsubscribe()}else a(c)},e,c)})};b.prototype._subscribe=function(a){return this.source.subscribe(a)};b.prototype[M]=function(){return this};b.create=function(a){return new b(a)};return b}(),O=function(b){function a(){var c=b.call(this,"object unsubscribed");this.name=c.name="ObjectUnsubscribedError";this.stack=c.stack;this.message=c.message}__extends(a,
b);return a}(Error),Oa=function(b){function a(c,a){b.call(this);this.subject=c;this.subscriber=a;this.closed=!1}__extends(a,b);a.prototype.unsubscribe=function(){if(!this.closed){this.closed=!0;var c=this.subject,a=c.observers;this.subject=null;!a||0===a.length||c.isStopped||c.closed||(c=a.indexOf(this.subscriber),-1!==c&&a.splice(c,1))}};return a}(x),Pa=function(b){function a(c){b.call(this,c);this.destination=c}__extends(a,b);return a}(p),y=function(b){function a(){b.call(this);this.observers=[];
this.hasError=this.isStopped=this.closed=!1;this.thrownError=null}__extends(a,b);a.prototype[T]=function(){return new Pa(this)};a.prototype.lift=function(c){var a=new ca(this,this);a.operator=c;return a};a.prototype.next=function(c){if(this.closed)throw new O;if(!this.isStopped)for(var a=this.observers,b=a.length,a=a.slice(),f=0;f<b;f++)a[f].next(c)};a.prototype.error=function(c){if(this.closed)throw new O;this.hasError=!0;this.thrownError=c;this.isStopped=!0;for(var a=this.observers,b=a.length,a=
a.slice(),f=0;f<b;f++)a[f].error(c);this.observers.length=0};a.prototype.complete=function(){if(this.closed)throw new O;this.isStopped=!0;for(var c=this.observers,a=c.length,c=c.slice(),b=0;b<a;b++)c[b].complete();this.observers.length=0};a.prototype.unsubscribe=function(){this.closed=this.isStopped=!0;this.observers=null};a.prototype._subscribe=function(c){if(this.closed)throw new O;if(this.hasError)return c.error(this.thrownError),x.EMPTY;if(this.isStopped)return c.complete(),x.EMPTY;this.observers.push(c);
return new Oa(this,c)};a.prototype.asObservable=function(){var c=new g;c.source=this;return c};a.create=function(c,a){return new ca(c,a)};return a}(g),ca=function(b){function a(c,a){b.call(this);this.destination=c;this.source=a}__extends(a,b);a.prototype.next=function(c){var a=this.destination;a&&a.next&&a.next(c)};a.prototype.error=function(c){var a=this.destination;a&&a.error&&this.destination.error(c)};a.prototype.complete=function(){var c=this.destination;c&&c.complete&&this.destination.complete()};
a.prototype._subscribe=function(c){return this.source?this.source.subscribe(c):x.EMPTY};return a}(y),P=function(b){function a(){b.apply(this,arguments);this.value=null;this.hasCompleted=this.hasNext=!1}__extends(a,b);a.prototype._subscribe=function(c){return this.hasCompleted&&this.hasNext?(c.next(this.value),c.complete(),x.EMPTY):this.hasError?(c.error(this.thrownError),x.EMPTY):b.prototype._subscribe.call(this,c)};a.prototype.next=function(c){this.hasCompleted||(this.value=c,this.hasNext=!0)};a.prototype.complete=
function(){this.hasCompleted=!0;this.hasNext&&b.prototype.next.call(this,this.value);b.prototype.complete.call(this)};return a}(y),Qb=function(b){function a(c,a,d,f){b.call(this);this.callbackFunc=c;this.selector=a;this.args=d;this.scheduler=f}__extends(a,b);a.create=function(c,b,d){void 0===b&&(b=void 0);return function(){for(var e=[],h=0;h<arguments.length;h++)e[h-0]=arguments[h];return new a(c,b,e,d)}};a.prototype._subscribe=function(c){var b=this.callbackFunc,d=this.args,f=this.scheduler,h=this.subject;
if(f)return f.schedule(a.dispatch,0,{source:this,subscriber:c});h||(h=this.subject=new P,f=function B(){for(var c=[],a=0;a<arguments.length;a++)c[a-0]=arguments[a];var b=B.source,a=b.selector,b=b.subject;a?(c=k(a).apply(this,c),c===n?b.error(n.e):(b.next(c),b.complete())):(b.next(1===c.length?c[0]:c),b.complete())},f.source=this,k(b).apply(this,d.concat(f))===n&&h.error(n.e));return h.subscribe(c)};a.dispatch=function(c){var a=this,b=c.source;c=c.subscriber;var f=b.callbackFunc,h=b.args,g=b.scheduler,
B=b.subject;if(!B){var B=b.subject=new P,l=function nb(){for(var c=[],b=0;b<arguments.length;b++)c[b-0]=arguments[b];var e=nb.source,b=e.selector,e=e.subject;b?(c=k(b).apply(this,c),c===n?a.add(g.schedule(w,0,{err:n.e,subject:e})):a.add(g.schedule(E,0,{value:c,subject:e}))):a.add(g.schedule(E,0,{value:1===c.length?c[0]:c,subject:e}))};l.source=b;k(f).apply(this,h.concat(l))===n&&B.error(n.e)}a.add(B.subscribe(c))};return a}(g).create;g.bindCallback=Qb;var Rb=function(b){function a(c,a,d,f){b.call(this);
this.callbackFunc=c;this.selector=a;this.args=d;this.scheduler=f}__extends(a,b);a.create=function(c,b,d){void 0===b&&(b=void 0);return function(){for(var e=[],h=0;h<arguments.length;h++)e[h-0]=arguments[h];return new a(c,b,e,d)}};a.prototype._subscribe=function(c){var a=this.callbackFunc,b=this.args,f=this.scheduler,h=this.subject;if(f)return f.schedule(A,0,{source:this,subscriber:c});h||(h=this.subject=new P,f=function B(){for(var c=[],a=0;a<arguments.length;a++)c[a-0]=arguments[a];var b=B.source,
a=b.selector,b=b.subject,e=c.shift();e?b.error(e):a?(c=k(a).apply(this,c),c===n?b.error(n.e):(b.next(c),b.complete())):(b.next(1===c.length?c[0]:c),b.complete())},f.source=this,k(a).apply(this,b.concat(f))===n&&h.error(n.e));return h.subscribe(c)};return a}(g).create;g.bindNodeCallback=Rb;var la=function(b){function a(c,a){b.call(this);this.value=c;this.scheduler=a;this._isScalar=!0;a&&(this._isScalar=!1)}__extends(a,b);a.create=function(c,b){return new a(c,b)};a.dispatch=function(c){var a=c.value,
b=c.subscriber;c.done?b.complete():(b.next(a),b.closed||(c.done=!0,this.schedule(c)))};a.prototype._subscribe=function(c){var b=this.value,d=this.scheduler;if(d)return d.schedule(a.dispatch,0,{done:!1,value:b,subscriber:c});c.next(b);c.closed||c.complete()};return a}(g),L=function(b){function a(c){b.call(this);this.scheduler=c}__extends(a,b);a.create=function(c){return new a(c)};a.dispatch=function(c){c.subscriber.complete()};a.prototype._subscribe=function(c){var b=this.scheduler;if(b)return b.schedule(a.dispatch,
0,{subscriber:c});c.complete()};return a}(g),K=function(b){function a(c,a){b.call(this);this.array=c;this.scheduler=a;a||1!==c.length||(this._isScalar=!0,this.value=c[0])}__extends(a,b);a.create=function(c,b){return new a(c,b)};a.of=function(){for(var c=[],b=0;b<arguments.length;b++)c[b-0]=arguments[b];b=c[c.length-1];G(b)?c.pop():b=null;var d=c.length;return 1<d?new a(c,b):1===d?new la(c[0],b):new L(b)};a.dispatch=function(c){var a=c.array,b=c.index,f=c.subscriber;b>=c.count?f.complete():(f.next(a[b]),
f.closed||(c.index=b+1,this.schedule(c)))};a.prototype._subscribe=function(c){var b=this.array,d=b.length,f=this.scheduler;if(f)return f.schedule(a.dispatch,0,{array:b,index:0,count:d,subscriber:c});for(f=0;f<d&&!c.closed;f++)c.next(b[f]);c.complete()};return a}(g),t=function(b){function a(){b.apply(this,arguments)}__extends(a,b);a.prototype.notifyNext=function(c,a,b,f,h){this.destination.next(a)};a.prototype.notifyError=function(c,a){this.destination.error(c)};a.prototype.notifyComplete=function(c){this.destination.complete()};
return a}(p),I=function(b){var a=b.Symbol;if("function"===typeof a)return a.iterator||(a.iterator=a("iterator polyfill")),a.iterator;if((a=b.Set)&&"function"===typeof(new a)["@@iterator"])return"@@iterator";if(b=b.Map)for(var a=Object.getOwnPropertyNames(b.prototype),c=0;c<a.length;++c){var e=a[c];if("entries"!==e&&"size"!==e&&b.prototype[e]===b.prototype.entries)return e}return"@@iterator"}(r),ra=function(b){function a(c,a,d){b.call(this);this.parent=c;this.outerValue=a;this.outerIndex=d;this.index=
0}__extends(a,b);a.prototype._next=function(c){this.parent.notifyNext(this.outerValue,c,this.outerIndex,this.index++,this)};a.prototype._error=function(c){this.parent.notifyError(c,this);this.unsubscribe()};a.prototype._complete=function(){this.parent.notifyComplete(this);this.unsubscribe()};return a}(p),Qa={},ma=function(){function b(a){this.project=a}b.prototype.call=function(a,c){return c.subscribe(new Sb(a,this.project))};return b}(),Sb=function(b){function a(c,a){b.call(this,c);this.project=
a;this.active=0;this.values=[];this.observables=[]}__extends(a,b);a.prototype._next=function(c){this.values.push(Qa);this.observables.push(c)};a.prototype._complete=function(){var c=this.observables,a=c.length;if(0===a)this.destination.complete();else{this.toRespond=this.active=a;for(var b=0;b<a;b++){var f=c[b];this.add(q(this,f,f,b))}}};a.prototype.notifyComplete=function(c){0===--this.active&&this.destination.complete()};a.prototype.notifyNext=function(c,a,b,f,h){c=this.values;f=c[b];f=this.toRespond?
f===Qa?--this.toRespond:this.toRespond:0;c[b]=a;0===f&&(this.project?this._tryProject(c):this.destination.next(c.slice()))};a.prototype._tryProject=function(c){var a;try{a=this.project.apply(this,c)}catch(d){this.destination.error(d);return}this.destination.next(a)};return a}(t);g.combineLatest=function(){for(var b=[],a=0;a<arguments.length;a++)b[a-0]=arguments[a];var c=a=null;G(b[b.length-1])&&(c=b.pop());"function"===typeof b[b.length-1]&&(a=b.pop());1===b.length&&H(b[0])&&(b=b[0]);return(new K(b,
c)).lift(new ma(a))};var aa=function(){function b(a){this.concurrent=a}b.prototype.call=function(a,c){return c.subscribe(new Tb(a,this.concurrent))};return b}(),Tb=function(b){function a(c,a){b.call(this,c);this.concurrent=a;this.hasCompleted=!1;this.buffer=[];this.active=0}__extends(a,b);a.prototype._next=function(c){this.active<this.concurrent?(this.active++,this.add(q(this,c))):this.buffer.push(c)};a.prototype._complete=function(){this.hasCompleted=!0;0===this.active&&0===this.buffer.length&&this.destination.complete()};
a.prototype.notifyComplete=function(c){var a=this.buffer;this.remove(c);this.active--;0<a.length?this._next(a.shift()):0===this.active&&this.hasCompleted&&this.destination.complete()};return a}(t);g.concat=S;var Vb=function(b){function a(c){b.call(this);this.observableFactory=c}__extends(a,b);a.create=function(c){return new a(c)};a.prototype._subscribe=function(c){return new Ub(c,this.observableFactory)};return a}(g),Ub=function(b){function a(c,a){b.call(this,c);this.factory=a;this.tryDefer()}__extends(a,
b);a.prototype.tryDefer=function(){try{this._callFactory()}catch(c){this._error(c)}};a.prototype._callFactory=function(){var c=this.factory();c&&this.add(q(this,c))};return a}(t);g.defer=Vb.create;g.empty=L.create;var Xb=function(b){function a(c,a){b.call(this);this.sources=c;this.resultSelector=a}__extends(a,b);a.create=function(){for(var c=[],b=0;b<arguments.length;b++)c[b-0]=arguments[b];if(null===c||0===arguments.length)return new L;b=null;"function"===typeof c[c.length-1]&&(b=c.pop());1===c.length&&
H(c[0])&&(c=c[0]);return 0===c.length?new L:new a(c,b)};a.prototype._subscribe=function(c){return new Wb(c,this.sources,this.resultSelector)};return a}(g),Wb=function(b){function a(c,a,d){b.call(this,c);this.sources=a;this.resultSelector=d;this.haveValues=this.completed=0;this.total=c=a.length;this.values=Array(c);for(d=0;d<c;d++){var e=q(this,a[d],null,d);e&&(e.outerIndex=d,this.add(e))}}__extends(a,b);a.prototype.notifyNext=function(c,a,b,f,h){this.values[b]=a;h._hasValue||(h._hasValue=!0,this.haveValues++)};
a.prototype.notifyComplete=function(c){var a=this.destination,b=this.haveValues,f=this.resultSelector,h=this.values,g=h.length;c._hasValue?(this.completed++,this.completed===g&&(b===g&&(c=f?f.apply(this,h):h,a.next(c)),a.complete())):a.complete()};return a}(t);g.forkJoin=Xb.create;var Ra=function(b){function a(c,a){b.call(this);this.promise=c;this.scheduler=a}__extends(a,b);a.create=function(c,b){return new a(c,b)};a.prototype._subscribe=function(c){var a=this,b=this.promise,f=this.scheduler;if(null==
f)this._isScalar?c.closed||(c.next(this.value),c.complete()):b.then(function(b){a.value=b;a._isScalar=!0;c.closed||(c.next(b),c.complete())},function(a){c.closed||c.error(a)}).then(null,function(c){r.setTimeout(function(){throw c;})});else if(this._isScalar){if(!c.closed)return f.schedule(sa,0,{value:this.value,subscriber:c})}else b.then(function(b){a.value=b;a._isScalar=!0;c.closed||c.add(f.schedule(sa,0,{value:b,subscriber:c}))},function(a){c.closed||c.add(f.schedule(ob,0,{err:a,subscriber:c}))}).then(null,
function(c){r.setTimeout(function(){throw c;})})};return a}(g),$b=function(b){function a(c,a){b.call(this);this.scheduler=a;if(null==c)throw Error("iterator cannot be null.");if((a=c[I])||"string"!==typeof c)if(a||void 0===c.length){if(!a)throw new TypeError("object is not iterable");c=c[I]()}else c=new Yb(c);else c=new Zb(c);this.iterator=c}__extends(a,b);a.create=function(c,b){return new a(c,b)};a.dispatch=function(c){var a=c.index,b=c.iterator,f=c.subscriber;if(c.hasError)f.error(c.error);else{var h=
b.next();h.done?f.complete():(f.next(h.value),c.index=a+1,f.closed?"function"===typeof b.return&&b.return():this.schedule(c))}};a.prototype._subscribe=function(c){var b=this.iterator,d=this.scheduler;if(d)return d.schedule(a.dispatch,0,{index:0,iterator:b,subscriber:c});do{d=b.next();if(d.done){c.complete();break}else c.next(d.value);if(c.closed){"function"===typeof b.return&&b.return();break}}while(1)};return a}(g),Zb=function(){function b(a,c,b){void 0===c&&(c=0);void 0===b&&(b=a.length);this.str=
a;this.idx=c;this.len=b}b.prototype[I]=function(){return this};b.prototype.next=function(){return this.idx<this.len?{done:!1,value:this.str.charAt(this.idx++)}:{done:!0,value:void 0}};return b}(),Yb=function(){function b(a,c,b){void 0===c&&(c=0);if(void 0===b)if(b=+a.length,isNaN(b))b=0;else if(0!==b&&"number"===typeof b&&r.isFinite(b)){var e;e=+b;e=0===e?e:isNaN(e)?e:0>e?-1:1;b=e*Math.floor(Math.abs(b));b=0>=b?0:b>Sa?Sa:b}this.arr=a;this.idx=c;this.len=b}b.prototype[I]=function(){return this};b.prototype.next=
function(){return this.idx<this.len?{done:!1,value:this.arr[this.idx++]}:{done:!0,value:void 0}};return b}(),Sa=Math.pow(2,53)-1,ac=function(b){function a(c,a){b.call(this);this.arrayLike=c;this.scheduler=a;a||1!==c.length||(this._isScalar=!0,this.value=c[0])}__extends(a,b);a.create=function(c,b){var e=c.length;return 0===e?new L:1===e?new la(c[0],b):new a(c,b)};a.dispatch=function(c){var a=c.arrayLike,b=c.index,f=c.subscriber;f.closed||(b>=c.length?f.complete():(f.next(a[b]),c.index=b+1,this.schedule(c)))};
a.prototype._subscribe=function(c){var b=this.arrayLike,d=this.scheduler,f=b.length;if(d)return d.schedule(a.dispatch,0,{arrayLike:b,index:0,length:f,subscriber:c});for(d=0;d<f&&!c.closed;d++)c.next(b[d]);c.complete()};return a}(g),z=function(){function b(a,c,b){this.kind=a;this.value=c;this.error=b;this.hasValue="N"===a}b.prototype.observe=function(a){switch(this.kind){case "N":return a.next&&a.next(this.value);case "E":return a.error&&a.error(this.error);case "C":return a.complete&&a.complete()}};
b.prototype.do=function(a,c,b){switch(this.kind){case "N":return a&&a(this.value);case "E":return c&&c(this.error);case "C":return b&&b()}};b.prototype.accept=function(a,c,b){return a&&"function"===typeof a.next?this.observe(a):this.do(a,c,b)};b.prototype.toObservable=function(){switch(this.kind){case "N":return g.of(this.value);case "E":return g.throw(this.error);case "C":return g.empty()}throw Error("unexpected notification kind value");};b.createNext=function(a){return"undefined"!==typeof a?new b("N",
a):this.undefinedValueNotification};b.createError=function(a){return new b("E",void 0,a)};b.createComplete=function(){return this.completeNotification};b.completeNotification=new b("C");b.undefinedValueNotification=new b("N",void 0);return b}(),bc=function(){function b(a,c){void 0===c&&(c=0);this.scheduler=a;this.delay=c}b.prototype.call=function(a,c){return c.subscribe(new na(a,this.scheduler,this.delay))};return b}(),na=function(b){function a(c,a,d){void 0===d&&(d=0);b.call(this,c);this.scheduler=
a;this.delay=d}__extends(a,b);a.dispatch=function(c){c.notification.observe(c.destination)};a.prototype.scheduleMessage=function(c){this.add(this.scheduler.schedule(a.dispatch,this.delay,new cc(c,this.destination)))};a.prototype._next=function(c){this.scheduleMessage(z.createNext(c))};a.prototype._error=function(c){this.scheduleMessage(z.createError(c))};a.prototype._complete=function(){this.scheduleMessage(z.createComplete())};return a}(p),cc=function(){return function(b,a){this.notification=b;this.destination=
a}}(),Ta=function(b){function a(c,a){b.call(this,null);this.ish=c;this.scheduler=a}__extends(a,b);a.create=function(c,b){if(null!=c){if("function"===typeof c[M])return c instanceof g&&!b?c:new a(c,b);if(H(c))return new K(c,b);if(Z(c))return new Ra(c,b);if("function"===typeof c[I]||"string"===typeof c)return new $b(c,b);if(c&&"number"===typeof c.length)return new ac(c,b)}throw new TypeError((null!==c&&typeof c||c)+" is not observable");};a.prototype._subscribe=function(c){var a=this.ish,b=this.scheduler;
return null==b?a[M]().subscribe(c):a[M]().subscribe(new na(c,b,0))};return a}(g);g.from=Ta.create;var Ua=Object.prototype.toString,dc=function(b){function a(c,a,d,f){b.call(this);this.sourceObj=c;this.eventName=a;this.selector=d;this.options=f}__extends(a,b);a.create=function(c,b,d,f){m(d)&&(f=d,d=void 0);return new a(c,b,f,d)};a.setupSubscription=function(c,b,d,f,h){var e;if(c&&"[object NodeList]"===Ua.call(c)||c&&"[object HTMLCollection]"===Ua.call(c))for(var g=0,k=c.length;g<k;g++)a.setupSubscription(c[g],
b,d,f,h);else if(c&&"function"===typeof c.addEventListener&&"function"===typeof c.removeEventListener)c.addEventListener(b,d,h),e=function(){return c.removeEventListener(b,d)};else if(c&&"function"===typeof c.on&&"function"===typeof c.off)c.on(b,d),e=function(){return c.off(b,d)};else if(c&&"function"===typeof c.addListener&&"function"===typeof c.removeListener)c.addListener(b,d),e=function(){return c.removeListener(b,d)};else throw new TypeError("Invalid event target");f.add(new x(e))};a.prototype._subscribe=
function(c){var b=this.selector;a.setupSubscription(this.sourceObj,this.eventName,b?function(){for(var a=[],e=0;e<arguments.length;e++)a[e-0]=arguments[e];a=k(b).apply(void 0,a);a===n?c.error(n.e):c.next(a)}:function(a){return c.next(a)},c,this.options)};return a}(g).create;g.fromEvent=dc;var ec=function(b){function a(c,a,d){b.call(this);this.addHandler=c;this.removeHandler=a;this.selector=d}__extends(a,b);a.create=function(c,b,d){return new a(c,b,d)};a.prototype._subscribe=function(c){var a=this,
b=this.removeHandler,f=this.selector?function(){for(var b=[],e=0;e<arguments.length;e++)b[e-0]=arguments[e];a._callSelector(c,b)}:function(a){c.next(a)};this._callAddHandler(f,c);c.add(new x(function(){b(f)}))};a.prototype._callSelector=function(c,a){try{var b=this.selector.apply(this,a);c.next(b)}catch(f){c.error(f)}};a.prototype._callAddHandler=function(c,a){try{this.addHandler(c)}catch(d){a.error(d)}};return a}(g).create;g.fromEventPattern=ec;g.fromPromise=Ra.create;var Va=function(b){return b},
fc=function(b){function a(c,a,d,f,h){b.call(this);this.initialState=c;this.condition=a;this.iterate=d;this.resultSelector=f;this.scheduler=h}__extends(a,b);a.create=function(c,b,d,f,h){return 1==arguments.length?new a(c.initialState,c.condition,c.iterate,c.resultSelector||Va,c.scheduler):void 0===f||G(f)?new a(c,b,d,Va,f):new a(c,b,d,f,h)};a.prototype._subscribe=function(c){var b=this.initialState;if(this.scheduler)return this.scheduler.schedule(a.dispatch,0,{subscriber:c,iterate:this.iterate,condition:this.condition,
resultSelector:this.resultSelector,state:b});var d=this.condition,f=this.resultSelector,h=this.iterate;do{if(d){var g=void 0;try{g=d(b)}catch(B){c.error(B);break}if(!g){c.complete();break}}g=void 0;try{g=f(b)}catch(B){c.error(B);break}c.next(g);if(c.closed)break;try{b=h(b)}catch(B){c.error(B);break}}while(1)};a.dispatch=function(c){var a=c.subscriber,b=c.condition;if(!a.closed){if(c.needIterate)try{c.state=c.iterate(c.state)}catch(D){a.error(D);return}else c.needIterate=!0;if(b){var f=void 0;try{f=
b(c.state)}catch(D){a.error(D);return}if(!f){a.complete();return}if(a.closed)return}var h;try{h=c.resultSelector(c.state)}catch(D){a.error(D);return}if(!a.closed&&(a.next(h),!a.closed))return this.schedule(c)}};return a}(g);g.generate=fc.create;var hc=function(b){function a(c,a,d){b.call(this);this.condition=c;this.thenSource=a;this.elseSource=d}__extends(a,b);a.create=function(c,b,d){return new a(c,b,d)};a.prototype._subscribe=function(c){return new gc(c,this.condition,this.thenSource,this.elseSource)};
return a}(g),gc=function(b){function a(c,a,d,f){b.call(this,c);this.condition=a;this.thenSource=d;this.elseSource=f;this.tryIf()}__extends(a,b);a.prototype.tryIf=function(){var c=this.condition,a=this.thenSource,b=this.elseSource,f;try{(c=(f=c())?a:b)?this.add(q(this,c)):this._complete()}catch(h){this._error(h)}};return a}(t);g.if=hc.create;var U=function(b){function a(c,a){b.call(this,c,a);this.scheduler=c;this.work=a;this.pending=!1}__extends(a,b);a.prototype.schedule=function(c,a){void 0===a&&
(a=0);if(this.closed)return this;this.state=c;this.pending=!0;c=this.id;var b=this.scheduler;null!=c&&(this.id=this.recycleAsyncId(b,c,a));this.delay=a;this.id=this.id||this.requestAsyncId(b,this.id,a);return this};a.prototype.requestAsyncId=function(c,a,b){void 0===b&&(b=0);return r.setInterval(c.flush.bind(c,this),b)};a.prototype.recycleAsyncId=function(c,a,b){void 0===b&&(b=0);return null!==b&&this.delay===b?a:(r.clearInterval(a),void 0)};a.prototype.execute=function(c,a){if(this.closed)return Error("executing a cancelled action");
this.pending=!1;if(c=this._execute(c,a))return c;!1===this.pending&&null!=this.id&&(this.id=this.recycleAsyncId(this.scheduler,this.id,null))};a.prototype._execute=function(c,a){a=!1;var b=void 0;try{this.work(c)}catch(f){a=!0,b=!!f&&f||Error(f)}if(a)return this.unsubscribe(),b};a.prototype._unsubscribe=function(){var c=this.id,a=this.scheduler,b=a.actions,f=b.indexOf(this);this.state=this.delay=this.work=null;this.pending=!1;this.scheduler=null;-1!==f&&b.splice(f,1);null!=c&&(this.id=this.recycleAsyncId(a,
c,null))};return a}(function(b){function a(c,a){b.call(this)}__extends(a,b);a.prototype.schedule=function(c,a){return this};return a}(x)),V=function(b){function a(){b.apply(this,arguments);this.actions=[];this.active=!1;this.scheduled=void 0}__extends(a,b);a.prototype.flush=function(c){var a=this.actions;if(this.active)a.push(c);else{var b;this.active=!0;do if(b=c.execute(c.state,c.delay))break;while(c=a.shift());this.active=!1;if(b){for(;c=a.shift();)c.unsubscribe();throw b;}}};return a}(function(){function b(a,
c){void 0===c&&(c=b.now);this.SchedulerAction=a;this.now=c}b.prototype.schedule=function(a,c,b){void 0===c&&(c=0);return(new this.SchedulerAction(this,a)).schedule(b,c)};b.now=Date.now?Date.now:function(){return+new Date};return b}()),C=new V(U),ic=function(b){function a(c,a){void 0===c&&(c=0);void 0===a&&(a=C);b.call(this);this.period=c;this.scheduler=a;if(!ga(c)||0>c)this.period=0;a&&"function"===typeof a.schedule||(this.scheduler=C)}__extends(a,b);a.create=function(c,b){void 0===c&&(c=0);void 0===
b&&(b=C);return new a(c,b)};a.dispatch=function(c){var a=c.subscriber,b=c.period;a.next(c.index);a.closed||(c.index+=1,this.schedule(c,b))};a.prototype._subscribe=function(c){var b=this.period;c.add(this.scheduler.schedule(a.dispatch,b,{index:0,subscriber:c,period:b}))};return a}(g).create;g.interval=ic;g.merge=ta;var pb=function(){function b(){}b.prototype.call=function(a,c){return c.subscribe(new jc(a))};return b}(),jc=function(b){function a(c){b.call(this,c);this.hasFirst=!1;this.observables=[];
this.subscriptions=[]}__extends(a,b);a.prototype._next=function(c){this.observables.push(c)};a.prototype._complete=function(){var c=this.observables,a=c.length;if(0===a)this.destination.complete();else{for(var b=0;b<a&&!this.hasFirst;b++){var f=c[b],f=q(this,f,f,b);this.subscriptions&&this.subscriptions.push(f);this.add(f)}this.observables=null}};a.prototype.notifyNext=function(c,a,b,f,h){if(!this.hasFirst){this.hasFirst=!0;for(c=0;c<this.subscriptions.length;c++)c!==b&&(f=this.subscriptions[c],f.unsubscribe(),
this.remove(f));this.subscriptions=null}this.destination.next(a)};return a}(t);g.race=ua;var kc=function(b){function a(){b.call(this)}__extends(a,b);a.create=function(){return new a};a.prototype._subscribe=function(c){};return a}(g).create;g.never=kc;g.of=K.of;var Wa=function(){function b(a){this.nextSources=a}b.prototype.call=function(a,c){return c.subscribe(new lc(a,this.nextSources))};return b}(),lc=function(b){function a(c,a){b.call(this,c);this.destination=c;this.nextSources=a}__extends(a,b);
a.prototype.notifyError=function(c,a){this.subscribeToNextSource()};a.prototype.notifyComplete=function(c){this.subscribeToNextSource()};a.prototype._error=function(c){this.subscribeToNextSource()};a.prototype._complete=function(){this.subscribeToNextSource()};a.prototype.subscribeToNextSource=function(){var c=this.nextSources.shift();c?this.add(q(this,c)):this.destination.complete()};return a}(t);g.onErrorResumeNext=function(){for(var b=[],a=0;a<arguments.length;a++)b[a-0]=arguments[a];1===b.length&&
H(b[0])&&(b=b[0]);a=b.shift();return(new Ta(a,null)).lift(new Wa(b))};var mc=function(b){function a(c,a){b.call(this);this.obj=c;this.scheduler=a;this.keys=Object.keys(c)}__extends(a,b);a.create=function(c,b){return new a(c,b)};a.prototype._subscribe=function(c){var a=this.keys,b=this.scheduler,f=a.length;if(b)return b.schedule(qb,0,{obj:this.obj,keys:a,length:f,index:0,subscriber:c});for(b=0;b<f;b++){var h=a[b];c.next([h,this.obj[h]])}c.complete()};return a}(g).create;g.pairs=mc;var nc=function(b){function a(c,
a,d){b.call(this);this.start=c;this._count=a;this.scheduler=d}__extends(a,b);a.create=function(c,b,d){void 0===c&&(c=0);void 0===b&&(b=0);return new a(c,b,d)};a.dispatch=function(c){var a=c.start,b=c.index,f=c.subscriber;b>=c.count?f.complete():(f.next(a),f.closed||(c.index=b+1,c.start=a+1,this.schedule(c)))};a.prototype._subscribe=function(c){var b=0,d=this.start,f=this._count,h=this.scheduler;if(h)return h.schedule(a.dispatch,0,{index:b,count:f,start:d,subscriber:c});do{if(b++>=f){c.complete();
break}c.next(d++);if(c.closed)break}while(1)};return a}(g).create;g.range=nc;var pc=function(b){function a(c,a){b.call(this);this.resourceFactory=c;this.observableFactory=a}__extends(a,b);a.create=function(c,b){return new a(c,b)};a.prototype._subscribe=function(c){var a=this.resourceFactory,b=this.observableFactory,f;try{return f=a(),new oc(c,f,b)}catch(h){c.error(h)}};return a}(g),oc=function(b){function a(c,a,d){b.call(this,c);this.resource=a;this.observableFactory=d;c.add(a);this.tryUse()}__extends(a,
b);a.prototype.tryUse=function(){try{var c=this.observableFactory.call(this,this.resource);c&&this.add(q(this,c))}catch(e){this._error(e)}};return a}(t);g.using=pc.create;var qc=function(b){function a(c,a){b.call(this);this.error=c;this.scheduler=a}__extends(a,b);a.create=function(c,b){return new a(c,b)};a.dispatch=function(c){c.subscriber.error(c.error)};a.prototype._subscribe=function(c){var b=this.error,d=this.scheduler;if(d)return d.schedule(a.dispatch,0,{error:b,subscriber:c});c.error(b)};return a}(g).create;
g.throw=qc;var rc=function(b){function a(c,a,d){void 0===c&&(c=0);b.call(this);this.period=-1;this.dueTime=0;ga(a)?this.period=1>Number(a)&&1||Number(a):G(a)&&(d=a);G(d)||(d=C);this.scheduler=d;this.dueTime=ba(c)?+c-this.scheduler.now():c}__extends(a,b);a.create=function(c,b,d){void 0===c&&(c=0);return new a(c,b,d)};a.dispatch=function(c){var a=c.index,b=c.period,f=c.subscriber;f.next(a);if(!f.closed){if(-1===b)return f.complete();c.index=a+1;this.schedule(c,b)}};a.prototype._subscribe=function(c){return this.scheduler.schedule(a.dispatch,
this.dueTime,{index:0,period:this.period,subscriber:c})};return a}(g).create;g.timer=rc;var wa=function(){function b(a){this.project=a}b.prototype.call=function(a,c){return c.subscribe(new sc(a,this.project))};return b}(),sc=function(b){function a(c,a,d){void 0===d&&(d=Object.create(null));b.call(this,c);this.iterators=[];this.active=0;this.project="function"===typeof a?a:null;this.values=d}__extends(a,b);a.prototype._next=function(c){var a=this.iterators;H(c)?a.push(new tc(c)):"function"===typeof c[I]?
a.push(new uc(c[I]())):a.push(new vc(this.destination,this,c))};a.prototype._complete=function(){var c=this.iterators,a=c.length;this.active=a;for(var b=0;b<a;b++){var f=c[b];f.stillUnsubscribed?this.add(f.subscribe(f,b)):this.active--}};a.prototype.notifyInactive=function(){this.active--;0===this.active&&this.destination.complete()};a.prototype.checkIterators=function(){for(var c=this.iterators,a=c.length,b=this.destination,f=0;f<a;f++){var h=c[f];if("function"===typeof h.hasValue&&!h.hasValue())return}for(var g=
!1,k=[],f=0;f<a;f++){var h=c[f],l=h.next();h.hasCompleted()&&(g=!0);if(l.done){b.complete();return}k.push(l.value)}this.project?this._tryProject(k):b.next(k);g&&b.complete()};a.prototype._tryProject=function(c){var a;try{a=this.project.apply(this,c)}catch(d){this.destination.error(d);return}this.destination.next(a)};return a}(p),uc=function(){function b(a){this.iterator=a;this.nextResult=a.next()}b.prototype.hasValue=function(){return!0};b.prototype.next=function(){var a=this.nextResult;this.nextResult=
this.iterator.next();return a};b.prototype.hasCompleted=function(){var a=this.nextResult;return a&&a.done};return b}(),tc=function(){function b(a){this.array=a;this.length=this.index=0;this.length=a.length}b.prototype[I]=function(){return this};b.prototype.next=function(a){a=this.index++;var c=this.array;return a<this.length?{value:c[a],done:!1}:{value:null,done:!0}};b.prototype.hasValue=function(){return this.array.length>this.index};b.prototype.hasCompleted=function(){return this.array.length===
this.index};return b}(),vc=function(b){function a(c,a,d){b.call(this,c);this.parent=a;this.observable=d;this.stillUnsubscribed=!0;this.buffer=[];this.isComplete=!1}__extends(a,b);a.prototype[I]=function(){return this};a.prototype.next=function(){var c=this.buffer;return 0===c.length&&this.isComplete?{value:null,done:!0}:{value:c.shift(),done:!1}};a.prototype.hasValue=function(){return 0<this.buffer.length};a.prototype.hasCompleted=function(){return 0===this.buffer.length&&this.isComplete};a.prototype.notifyComplete=
function(){0<this.buffer.length?(this.isComplete=!0,this.parent.notifyInactive()):this.destination.complete()};a.prototype.notifyNext=function(c,a,b,f,h){this.buffer.push(a);this.parent.checkIterators()};a.prototype.subscribe=function(c,a){return q(this,this.observable,this,a)};return a}(t);g.zip=va;var ya=function(){function b(a,c){this.project=a;this.thisArg=c}b.prototype.call=function(a,c){return c.subscribe(new wc(a,this.project,this.thisArg))};return b}(),wc=function(b){function a(c,a,d){b.call(this,
c);this.project=a;this.count=0;this.thisArg=d||this}__extends(a,b);a.prototype._next=function(c){var a;try{a=this.project.call(this.thisArg,c,this.count++)}catch(d){this.destination.error(d);return}this.destination.next(a)};return a}(p),Q=function(b){function a(c){b.call(this);var a={async:!0,createXHR:function(){var c;if(this.crossDomain)if(r.XMLHttpRequest)c=new r.XMLHttpRequest,"withCredentials"in c&&(c.withCredentials=!!this.withCredentials);else if(r.XDomainRequest)c=new r.XDomainRequest;else throw Error("CORS is not supported by your browser");
else if(r.XMLHttpRequest)c=new r.XMLHttpRequest;else{var a=void 0;try{for(var b=["Msxml2.XMLHTTP","Microsoft.XMLHTTP","Msxml2.XMLHTTP.4.0"],e=0;3>e;e++)try{a=b[e];new r.ActiveXObject(a);break}catch(J){}c=new r.ActiveXObject(a)}catch(J){throw Error("XMLHttpRequest is not supported by your browser");}}return c},crossDomain:!1,withCredentials:!1,headers:{},method:"GET",responseType:"json",timeout:0};if("string"===typeof c)a.url=c;else for(var d in c)c.hasOwnProperty(d)&&(a[d]=c[d]);this.request=a}__extends(a,
b);a.prototype._subscribe=function(c){return new xc(c,this.request)};a.create=function(){var c=function(c){return new a(c)};c.get=rb;c.post=sb;c.delete=tb;c.put=ub;c.getJSON=vb;return c}();return a}(g),xc=function(b){function a(c,a){b.call(this,c);this.request=a;this.done=!1;c=a.headers=a.headers||{};a.crossDomain||c["X-Requested-With"]||(c["X-Requested-With"]="XMLHttpRequest");"Content-Type"in c||r.FormData&&a.body instanceof r.FormData||"undefined"===typeof a.body||(c["Content-Type"]="application/x-www-form-urlencoded; charset\x3dUTF-8");
a.body=this.serializeBody(a.body,a.headers["Content-Type"]);this.send()}__extends(a,b);a.prototype.next=function(c){this.done=!0;var a=this.destination;c=new Xa(c,this.xhr,this.request);a.next(c)};a.prototype.send=function(){var c=this.request,a=this.request,b=a.user,f=a.method,h=a.url,g=a.async,l=a.password,p=a.headers,a=a.body,m=k(c.createXHR).call(c);if(m===n)this.error(n.e);else{this.xhr=m;b=b?k(m.open).call(m,f,h,g,b,l):k(m.open).call(m,f,h,g);if(b===n)return this.error(n.e),null;m.timeout=c.timeout;
m.responseType=c.responseType;this.setHeaders(m,p);this.setupEvents(m,c);b=a?k(m.send).call(m,a):k(m.send).call(m);if(b===n)return this.error(n.e),null}return m};a.prototype.serializeBody=function(c,a){if(!c||"string"===typeof c||r.FormData&&c instanceof r.FormData)return c;if(a){var b=a.indexOf(";");-1!==b&&(a=a.substring(0,b))}switch(a){case "application/x-www-form-urlencoded":return Object.keys(c).map(function(a){return encodeURI(a)+"\x3d"+encodeURI(c[a])}).join("\x26");case "application/json":return JSON.stringify(c);
default:return c}};a.prototype.setHeaders=function(c,a){for(var b in a)a.hasOwnProperty(b)&&c.setRequestHeader(b,a[b])};a.prototype.setupEvents=function(c,a){function b(c){var a=b.subscriber,e=b.progressSubscriber,d=b.request;e&&e.error(c);a.error(new Ya(this,d))}function e(c){var a=e.subscriber,b=e.progressSubscriber,d=e.request;if(4===this.readyState){var f=1223===this.status?204:this.status,h="text"===this.responseType?this.response||this.responseText:this.response;0===f&&(f=h?200:0);200<=f&&300>
f?(b&&b.complete(),a.next(c),a.complete()):(b&&b.error(c),a.error(new da("ajax error "+f,this,d)))}}var h=a.progressSubscriber;c.ontimeout=b;b.request=a;b.subscriber=this;b.progressSubscriber=h;if(c.upload&&"withCredentials"in c&&r.XDomainRequest){if(h){var g;g=function(c){g.progressSubscriber.next(c)};c.onprogress=g;g.progressSubscriber=h}var k;k=function(c){var a=k.progressSubscriber,b=k.subscriber,e=k.request;a&&a.error(c);b.error(new da("ajax error",this,e))};c.onerror=k;k.request=a;k.subscriber=
this;k.progressSubscriber=h}c.onreadystatechange=e;e.subscriber=this;e.progressSubscriber=h;e.request=a};a.prototype.unsubscribe=function(){var c=this.xhr;!this.done&&c&&4!==c.readyState&&"function"===typeof c.abort&&c.abort();b.prototype.unsubscribe.call(this)};return a}(p),Xa=function(){return function(b,a,c){this.originalEvent=b;this.xhr=a;this.request=c;this.status=a.status;this.responseType=a.responseType||c.responseType;switch(this.responseType){case "json":this.response="response"in a?a.responseType?
a.response:JSON.parse(a.response||a.responseText||"null"):JSON.parse(a.responseText||"null");break;case "xml":this.response=a.responseXML;break;default:this.response="response"in a?a.response:a.responseText}}}(),da=function(b){function a(c,a,d){b.call(this,c);this.message=c;this.xhr=a;this.request=d;this.status=a.status}__extends(a,b);return a}(Error),Ya=function(b){function a(c,a){b.call(this,"ajax timeout",c,a)}__extends(a,b);return a}(da);g.ajax=Q.create;var yc=function(b){function a(c,a){b.call(this,
c,a);this.scheduler=c;this.work=a}__extends(a,b);a.prototype.schedule=function(c,a){void 0===a&&(a=0);if(0<a)return b.prototype.schedule.call(this,c,a);this.delay=a;this.state=c;this.scheduler.flush(this);return this};a.prototype.execute=function(c,a){return 0<a||this.closed?b.prototype.execute.call(this,c,a):this._execute(c,a)};a.prototype.requestAsyncId=function(c,a,d){void 0===d&&(d=0);return null!==d&&0<d||null===d&&0<this.delay?b.prototype.requestAsyncId.call(this,c,a,d):c.flush(this)};return a}(U),
Za=new (function(b){function a(){b.apply(this,arguments)}__extends(a,b);return a}(V))(yc),R=function(b){function a(c,a,d){void 0===c&&(c=Number.POSITIVE_INFINITY);void 0===a&&(a=Number.POSITIVE_INFINITY);b.call(this);this.scheduler=d;this._events=[];this._bufferSize=1>c?1:c;this._windowTime=1>a?1:a}__extends(a,b);a.prototype.next=function(c){var a=this._getNow();this._events.push(new zc(a,c));this._trimBufferThenGetEvents();b.prototype.next.call(this,c)};a.prototype._subscribe=function(c){var a=this._trimBufferThenGetEvents(),
b=this.scheduler,f;if(this.closed)throw new O;this.hasError?f=x.EMPTY:this.isStopped?f=x.EMPTY:(this.observers.push(c),f=new Oa(this,c));b&&c.add(c=new na(c,b));for(var b=a.length,h=0;h<b&&!c.closed;h++)c.next(a[h].value);this.hasError?c.error(this.thrownError):this.isStopped&&c.complete();return f};a.prototype._getNow=function(){return(this.scheduler||Za).now()};a.prototype._trimBufferThenGetEvents=function(){for(var c=this._getNow(),a=this._bufferSize,b=this._windowTime,f=this._events,h=f.length,
g=0;g<h&&!(c-f[g].time<b);)g++;h>a&&(g=Math.max(g,h-a));0<g&&f.splice(0,g);return f};return a}(y),zc=function(){return function(b,a){this.time=b;this.value=a}}(),Ac=r.Object.assign||wb,Bc=function(b){function a(c,a){if(c instanceof g)b.call(this,a,c);else{b.call(this);this.WebSocketCtor=r.WebSocket;this._output=new y;"string"===typeof c?this.url=c:Ac(this,c);if(!this.WebSocketCtor)throw Error("no WebSocket constructor can be found");this.destination=new R}}__extends(a,b);a.prototype.resultSelector=
function(c){return JSON.parse(c.data)};a.create=function(c){return new a(c)};a.prototype.lift=function(c){var b=new a(this,this.destination);b.operator=c;return b};a.prototype._resetState=function(){this.socket=null;this.source||(this.destination=new R);this._output=new y};a.prototype.multiplex=function(c,a,b){var e=this;return new g(function(d){var f=k(c)();f===n?d.error(n.e):e.next(f);var h=e.subscribe(function(c){var a=k(b)(c);a===n?d.error(n.e):a&&d.next(c)},function(c){return d.error(c)},function(){return d.complete()});
return function(){var c=k(a)();c===n?d.error(n.e):e.next(c);h.unsubscribe()}})};a.prototype._connectSocket=function(){var c=this,a=this.WebSocketCtor,b=this._output,f=null;try{this.socket=f=this.protocol?new a(this.url,this.protocol):new a(this.url)}catch(D){b.error(D);return}var h=new x(function(){c.socket=null;f&&1===f.readyState&&f.close()});f.onopen=function(a){var e=c.openObserver;e&&e.next(a);a=c.destination;c.destination=p.create(function(c){return 1===f.readyState&&f.send(c)},function(a){var e=
c.closingObserver;e&&e.next(void 0);a&&a.code?f.close(a.code,a.reason):b.error(new TypeError("WebSocketSubject.error must be called with an object with an error code, and an optional reason: { code: number, reason: string }"));c._resetState()},function(){var a=c.closingObserver;a&&a.next(void 0);f.close();c._resetState()});a&&a instanceof R&&h.add(a.subscribe(c.destination))};f.onerror=function(a){c._resetState();b.error(a)};f.onclose=function(a){c._resetState();var e=c.closeObserver;e&&e.next(a);
a.wasClean?b.complete():b.error(a)};f.onmessage=function(a){a=k(c.resultSelector)(a);a===n?b.error(n.e):b.next(a)}};a.prototype._subscribe=function(c){var a=this,b=this.source;if(b)return b.subscribe(c);this.socket||this._connectSocket();b=new x;b.add(this._output.subscribe(c));b.add(function(){var c=a.socket;0===a._output.observers.length&&(c&&1===c.readyState&&c.close(),a._resetState())});return b};a.prototype.unsubscribe=function(){var c=this.source,a=this.socket;a&&1===a.readyState&&(a.close(),
this._resetState());b.prototype.unsubscribe.call(this);c||(this.destination=new R)};return a}(ca).create;g.webSocket=Bc;var Dc=function(){function b(a){this.closingNotifier=a}b.prototype.call=function(a,c){return c.subscribe(new Cc(a,this.closingNotifier))};return b}(),Cc=function(b){function a(c,a){b.call(this,c);this.buffer=[];this.add(q(this,a))}__extends(a,b);a.prototype._next=function(c){this.buffer.push(c)};a.prototype.notifyNext=function(c,a,b,f,h){c=this.buffer;this.buffer=[];this.destination.next(c)};
return a}(t);g.prototype.buffer=function(b){return this.lift(new Dc(b))};var Fc=function(){function b(a,c){this.bufferSize=a;this.startBufferEvery=c}b.prototype.call=function(a,c){return c.subscribe(new Ec(a,this.bufferSize,this.startBufferEvery))};return b}(),Ec=function(b){function a(c,a,d){b.call(this,c);this.bufferSize=a;this.startBufferEvery=d;this.buffers=[];this.count=0}__extends(a,b);a.prototype._next=function(c){var a=this.count++,b=this.destination,f=this.bufferSize,h=this.startBufferEvery,
g=this.buffers;0===a%(null==h?f:h)&&g.push([]);for(a=g.length;a--;)h=g[a],h.push(c),h.length===f&&(g.splice(a,1),b.next(h))};a.prototype._complete=function(){for(var c=this.destination,a=this.buffers;0<a.length;){var d=a.shift();0<d.length&&c.next(d)}b.prototype._complete.call(this)};return a}(p);g.prototype.bufferCount=function(b,a){void 0===a&&(a=null);return this.lift(new Fc(b,a))};var Hc=function(){function b(a,c,b,d){this.bufferTimeSpan=a;this.bufferCreationInterval=c;this.maxBufferSize=b;this.scheduler=
d}b.prototype.call=function(a,c){return c.subscribe(new Gc(a,this.bufferTimeSpan,this.bufferCreationInterval,this.maxBufferSize,this.scheduler))};return b}(),Ic=function(){return function(){this.buffer=[]}}(),Gc=function(b){function a(c,a,d,f,h){b.call(this,c);this.bufferTimeSpan=a;this.bufferCreationInterval=d;this.maxBufferSize=f;this.scheduler=h;this.contexts=[];c=this.openContext();(this.timespanOnly=null==d||0>d)?this.add(c.closeAction=h.schedule(za,a,{subscriber:this,context:c,bufferTimeSpan:a})):
(f={bufferTimeSpan:a,bufferCreationInterval:d,subscriber:this,scheduler:h},this.add(c.closeAction=h.schedule(Aa,a,{subscriber:this,context:c})),this.add(h.schedule(xb,d,f)))}__extends(a,b);a.prototype._next=function(c){for(var a=this.contexts,b=a.length,f,h=0;h<b;h++){var g=a[h],k=g.buffer;k.push(c);k.length==this.maxBufferSize&&(f=g)}if(f)this.onBufferFull(f)};a.prototype._error=function(a){this.contexts.length=0;b.prototype._error.call(this,a)};a.prototype._complete=function(){for(var a=this.contexts,
e=this.destination;0<a.length;){var d=a.shift();e.next(d.buffer)}b.prototype._complete.call(this)};a.prototype._unsubscribe=function(){this.contexts=null};a.prototype.onBufferFull=function(a){this.closeContext(a);a=a.closeAction;a.unsubscribe();this.remove(a);if(!this.closed&&this.timespanOnly){a=this.openContext();var c=this.bufferTimeSpan;this.add(a.closeAction=this.scheduler.schedule(za,c,{subscriber:this,context:a,bufferTimeSpan:c}))}};a.prototype.openContext=function(){var a=new Ic;this.contexts.push(a);
return a};a.prototype.closeContext=function(a){this.destination.next(a.buffer);var c=this.contexts;0<=(c?c.indexOf(a):-1)&&c.splice(c.indexOf(a),1)};return a}(p);g.prototype.bufferTime=function(b){var a=arguments.length,c=C;G(arguments[arguments.length-1])&&(c=arguments[arguments.length-1],a--);var e=null;2<=a&&(e=arguments[1]);var d=Number.POSITIVE_INFINITY;3<=a&&(d=arguments[2]);return this.lift(new Hc(b,e,d,c))};var Kc=function(){function b(a,c){this.openings=a;this.closingSelector=c}b.prototype.call=
function(a,c){return c.subscribe(new Jc(a,this.openings,this.closingSelector))};return b}(),Jc=function(b){function a(a,e,d){b.call(this,a);this.openings=e;this.closingSelector=d;this.contexts=[];this.add(q(this,e))}__extends(a,b);a.prototype._next=function(a){for(var c=this.contexts,b=c.length,f=0;f<b;f++)c[f].buffer.push(a)};a.prototype._error=function(a){for(var c=this.contexts;0<c.length;){var d=c.shift();d.subscription.unsubscribe();d.buffer=null;d.subscription=null}this.contexts=null;b.prototype._error.call(this,
a)};a.prototype._complete=function(){for(var a=this.contexts;0<a.length;){var e=a.shift();this.destination.next(e.buffer);e.subscription.unsubscribe();e.buffer=null;e.subscription=null}this.contexts=null;b.prototype._complete.call(this)};a.prototype.notifyNext=function(a,b,d,f,h){a?this.closeBuffer(a):this.openBuffer(b)};a.prototype.notifyComplete=function(a){this.closeBuffer(a.context)};a.prototype.openBuffer=function(a){try{var c=this.closingSelector.call(this,a);c&&this.trySubscribe(c)}catch(d){this._error(d)}};
a.prototype.closeBuffer=function(a){var c=this.contexts;if(c&&a){var b=a.subscription;this.destination.next(a.buffer);c.splice(c.indexOf(a),1);this.remove(b);b.unsubscribe()}};a.prototype.trySubscribe=function(a){var c=this.contexts,b=new x,f={buffer:[],subscription:b};c.push(f);a=q(this,a,f);!a||a.closed?this.closeBuffer(f):(a.context=f,this.add(a),b.add(a))};return a}(t);g.prototype.bufferToggle=function(b,a){return this.lift(new Kc(b,a))};var Mc=function(){function b(a){this.closingSelector=a}
b.prototype.call=function(a,c){return c.subscribe(new Lc(a,this.closingSelector))};return b}(),Lc=function(b){function a(a,e){b.call(this,a);this.closingSelector=e;this.subscribing=!1;this.openBuffer()}__extends(a,b);a.prototype._next=function(a){this.buffer.push(a)};a.prototype._complete=function(){var a=this.buffer;a&&this.destination.next(a);b.prototype._complete.call(this)};a.prototype._unsubscribe=function(){this.buffer=null;this.subscribing=!1};a.prototype.notifyNext=function(a,b,d,f,h){this.openBuffer()};
a.prototype.notifyComplete=function(){this.subscribing?this.complete():this.openBuffer()};a.prototype.openBuffer=function(){var a=this.closingSubscription;a&&(this.remove(a),a.unsubscribe());(a=this.buffer)&&this.destination.next(a);this.buffer=[];var b=k(this.closingSelector)();b===n?this.error(n.e):(this.closingSubscription=a=new x,this.add(a),this.subscribing=!0,a.add(q(this,b)),this.subscribing=!1)};return a}(t);g.prototype.bufferWhen=function(b){return this.lift(new Mc(b))};var yb=function(){function b(a){this.selector=
a}b.prototype.call=function(a,c){return c.subscribe(new Nc(a,this.selector,this.caught))};return b}(),Nc=function(b){function a(a,e,d){b.call(this,a);this.selector=e;this.caught=d}__extends(a,b);a.prototype.error=function(a){if(!this.isStopped){var c=void 0;try{c=this.selector(a,this.caught)}catch(d){this.destination.error(d);return}this.unsubscribe();this.destination.remove(this);q(this,c)}};return a}(t);g.prototype.catch=Ba;g.prototype._catch=Ba;g.prototype.combineAll=function(b){return this.lift(new ma(b))};
g.prototype.combineLatest=function(){for(var b=[],a=0;a<arguments.length;a++)b[a-0]=arguments[a];a=null;"function"===typeof b[b.length-1]&&(a=b.pop());1===b.length&&H(b[0])&&(b=b[0]);b.unshift(this);return this.lift.call(new K(b),new ma(a))};g.prototype.concat=function(){for(var b=[],a=0;a<arguments.length;a++)b[a-0]=arguments[a];return this.lift.call(S.apply(void 0,[this].concat(b)))};g.prototype.concatAll=function(){return this.lift(new aa(1))};var Da=function(){function b(a,c,b){void 0===b&&(b=
Number.POSITIVE_INFINITY);this.project=a;this.resultSelector=c;this.concurrent=b}b.prototype.call=function(a,c){return c.subscribe(new Oc(a,this.project,this.resultSelector,this.concurrent))};return b}(),Oc=function(b){function a(a,e,d,f){void 0===f&&(f=Number.POSITIVE_INFINITY);b.call(this,a);this.project=e;this.resultSelector=d;this.concurrent=f;this.hasCompleted=!1;this.buffer=[];this.index=this.active=0}__extends(a,b);a.prototype._next=function(a){this.active<this.concurrent?this._tryNext(a):
this.buffer.push(a)};a.prototype._tryNext=function(a){var c,b=this.index++;try{c=this.project(a,b)}catch(f){this.destination.error(f);return}this.active++;this._innerSub(c,a,b)};a.prototype._innerSub=function(a,b,d){this.add(q(this,a,b,d))};a.prototype._complete=function(){this.hasCompleted=!0;0===this.active&&0===this.buffer.length&&this.destination.complete()};a.prototype.notifyNext=function(a,b,d,f,h){this.resultSelector?this._notifyResultSelector(a,b,d,f):this.destination.next(b)};a.prototype._notifyResultSelector=
function(a,b,d,f){var c;try{c=this.resultSelector(a,b,d,f)}catch(D){this.destination.error(D);return}this.destination.next(c)};a.prototype.notifyComplete=function(a){var c=this.buffer;this.remove(a);this.active--;0<c.length?this._next(c.shift()):0===this.active&&this.hasCompleted&&this.destination.complete()};return a}(t);g.prototype.concatMap=function(b,a){return this.lift(new Da(b,a,1))};var Fa=function(){function b(a,c,b){void 0===b&&(b=Number.POSITIVE_INFINITY);this.ish=a;this.resultSelector=
c;this.concurrent=b}b.prototype.call=function(a,c){return c.subscribe(new Pc(a,this.ish,this.resultSelector,this.concurrent))};return b}(),Pc=function(b){function a(a,e,d,f){void 0===f&&(f=Number.POSITIVE_INFINITY);b.call(this,a);this.ish=e;this.resultSelector=d;this.concurrent=f;this.hasCompleted=!1;this.buffer=[];this.index=this.active=0}__extends(a,b);a.prototype._next=function(a){if(this.active<this.concurrent){var c=this.resultSelector,b=this.index++,f=this.ish,h=this.destination;this.active++;
this._innerSub(f,h,c,a,b)}else this.buffer.push(a)};a.prototype._innerSub=function(a,b,d,f,h){this.add(q(this,a,f,h))};a.prototype._complete=function(){this.hasCompleted=!0;0===this.active&&0===this.buffer.length&&this.destination.complete()};a.prototype.notifyNext=function(a,b,d,f,h){h=this.destination;this.resultSelector?this.trySelectResult(a,b,d,f):h.next(b)};a.prototype.trySelectResult=function(a,b,d,f){var c=this.resultSelector,e=this.destination,g;try{g=c(a,b,d,f)}catch(J){e.error(J);return}e.next(g)};
a.prototype.notifyError=function(a){this.destination.error(a)};a.prototype.notifyComplete=function(a){var c=this.buffer;this.remove(a);this.active--;0<c.length?this._next(c.shift()):0===this.active&&this.hasCompleted&&this.destination.complete()};return a}(t);g.prototype.concatMapTo=function(b,a){return this.lift(new Fa(b,a,1))};var Rc=function(){function b(a,c){this.predicate=a;this.source=c}b.prototype.call=function(a,c){return c.subscribe(new Qc(a,this.predicate,this.source))};return b}(),Qc=function(b){function a(a,
e,d){b.call(this,a);this.predicate=e;this.source=d;this.index=this.count=0}__extends(a,b);a.prototype._next=function(a){this.predicate?this._tryPredicate(a):this.count++};a.prototype._tryPredicate=function(a){var c;try{c=this.predicate(a,this.index++,this.source)}catch(d){this.destination.error(d);return}c&&this.count++};a.prototype._complete=function(){this.destination.next(this.count);this.destination.complete()};return a}(p);g.prototype.count=function(b){return this.lift(new Rc(b,this))};var Tc=
function(){function b(){}b.prototype.call=function(a,c){return c.subscribe(new Sc(a))};return b}(),Sc=function(b){function a(a){b.call(this,a)}__extends(a,b);a.prototype._next=function(a){a.observe(this.destination)};return a}(p);g.prototype.dematerialize=function(){return this.lift(new Tc)};var Vc=function(){function b(a){this.durationSelector=a}b.prototype.call=function(a,c){return c.subscribe(new Uc(a,this.durationSelector))};return b}(),Uc=function(b){function a(a,e){b.call(this,a);this.durationSelector=
e;this.hasValue=!1;this.durationSubscription=null}__extends(a,b);a.prototype._next=function(a){try{var c=this.durationSelector.call(this,a);c&&this._tryNext(a,c)}catch(d){this.destination.error(d)}};a.prototype._complete=function(){this.emitValue();this.destination.complete()};a.prototype._tryNext=function(a,b){var c=this.durationSubscription;this.value=a;this.hasValue=!0;c&&(c.unsubscribe(),this.remove(c));c=q(this,b);c.closed||this.add(this.durationSubscription=c)};a.prototype.notifyNext=function(a,
b,d,f,h){this.emitValue()};a.prototype.notifyComplete=function(){this.emitValue()};a.prototype.emitValue=function(){if(this.hasValue){var a=this.value,e=this.durationSubscription;e&&(this.durationSubscription=null,e.unsubscribe(),this.remove(e));this.value=null;this.hasValue=!1;b.prototype._next.call(this,a)}};return a}(t);g.prototype.debounce=function(b){return this.lift(new Vc(b))};var Xc=function(){function b(a,c){this.dueTime=a;this.scheduler=c}b.prototype.call=function(a,c){return c.subscribe(new Wc(a,
this.dueTime,this.scheduler))};return b}(),Wc=function(b){function a(a,e,d){b.call(this,a);this.dueTime=e;this.scheduler=d;this.lastValue=this.debouncedSubscription=null;this.hasValue=!1}__extends(a,b);a.prototype._next=function(a){this.clearDebounce();this.lastValue=a;this.hasValue=!0;this.add(this.debouncedSubscription=this.scheduler.schedule(zb,this.dueTime,this))};a.prototype._complete=function(){this.debouncedNext();this.destination.complete()};a.prototype.debouncedNext=function(){this.clearDebounce();
this.hasValue&&(this.destination.next(this.lastValue),this.lastValue=null,this.hasValue=!1)};a.prototype.clearDebounce=function(){var a=this.debouncedSubscription;null!==a&&(this.remove(a),a.unsubscribe(),this.debouncedSubscription=null)};return a}(p);g.prototype.debounceTime=function(b,a){void 0===a&&(a=C);return this.lift(new Xc(b,a))};var Zc=function(){function b(a){this.defaultValue=a}b.prototype.call=function(a,c){return c.subscribe(new Yc(a,this.defaultValue))};return b}(),Yc=function(b){function a(a,
e){b.call(this,a);this.defaultValue=e;this.isEmpty=!0}__extends(a,b);a.prototype._next=function(a){this.isEmpty=!1;this.destination.next(a)};a.prototype._complete=function(){this.isEmpty&&this.destination.next(this.defaultValue);this.destination.complete()};return a}(p);g.prototype.defaultIfEmpty=function(b){void 0===b&&(b=null);return this.lift(new Zc(b))};var ad=function(){function b(a,c){this.delay=a;this.scheduler=c}b.prototype.call=function(a,c){return c.subscribe(new $c(a,this.delay,this.scheduler))};
return b}(),$c=function(b){function a(a,e,d){b.call(this,a);this.delay=e;this.scheduler=d;this.queue=[];this.errored=this.active=!1}__extends(a,b);a.dispatch=function(a){for(var c=a.source,b=c.queue,f=a.scheduler,h=a.destination;0<b.length&&0>=b[0].time-f.now();)b.shift().notification.observe(h);0<b.length?(c=Math.max(0,b[0].time-f.now()),this.schedule(a,c)):c.active=!1};a.prototype._schedule=function(c){this.active=!0;this.add(c.schedule(a.dispatch,this.delay,{source:this,destination:this.destination,
scheduler:c}))};a.prototype.scheduleNotification=function(a){if(!0!==this.errored){var c=this.scheduler;a=new bd(c.now()+this.delay,a);this.queue.push(a);!1===this.active&&this._schedule(c)}};a.prototype._next=function(a){this.scheduleNotification(z.createNext(a))};a.prototype._error=function(a){this.errored=!0;this.queue=[];this.destination.error(a)};a.prototype._complete=function(){this.scheduleNotification(z.createComplete())};return a}(p),bd=function(){return function(b,a){this.time=b;this.notification=
a}}();g.prototype.delay=function(b,a){void 0===a&&(a=C);b=ba(b)?+b-a.now():Math.abs(b);return this.lift(new ad(b,a))};var $a=function(){function b(a){this.delayDurationSelector=a}b.prototype.call=function(a,c){return c.subscribe(new cd(a,this.delayDurationSelector))};return b}(),cd=function(b){function a(a,e){b.call(this,a);this.delayDurationSelector=e;this.completed=!1;this.delayNotifierSubscriptions=[];this.values=[]}__extends(a,b);a.prototype.notifyNext=function(a,b,d,f,h){this.destination.next(a);
this.removeSubscription(h);this.tryComplete()};a.prototype.notifyError=function(a,b){this._error(a)};a.prototype.notifyComplete=function(a){(a=this.removeSubscription(a))&&this.destination.next(a);this.tryComplete()};a.prototype._next=function(a){try{var c=this.delayDurationSelector(a);c&&this.tryDelay(c,a)}catch(d){this.destination.error(d)}};a.prototype._complete=function(){this.completed=!0;this.tryComplete()};a.prototype.removeSubscription=function(a){a.unsubscribe();a=this.delayNotifierSubscriptions.indexOf(a);
var c=null;-1!==a&&(c=this.values[a],this.delayNotifierSubscriptions.splice(a,1),this.values.splice(a,1));return c};a.prototype.tryDelay=function(a,b){a=q(this,a,b);this.add(a);this.delayNotifierSubscriptions.push(a);this.values.push(b)};a.prototype.tryComplete=function(){this.completed&&0===this.delayNotifierSubscriptions.length&&this.destination.complete()};return a}(t),ed=function(b){function a(a,e){b.call(this);this.source=a;this.subscriptionDelay=e}__extends(a,b);a.prototype._subscribe=function(a){this.subscriptionDelay.subscribe(new dd(a,
this.source))};return a}(g),dd=function(b){function a(a,e){b.call(this);this.parent=a;this.source=e;this.sourceSubscribed=!1}__extends(a,b);a.prototype._next=function(a){this.subscribeToSource()};a.prototype._error=function(a){this.unsubscribe();this.parent.error(a)};a.prototype._complete=function(){this.subscribeToSource()};a.prototype.subscribeToSource=function(){this.sourceSubscribed||(this.sourceSubscribed=!0,this.unsubscribe(),this.source.subscribe(this.parent))};return a}(p);g.prototype.delayWhen=
function(b,a){return a?(new ed(this,a)).lift(new $a(b)):this.lift(new $a(b))};var fd=r.Set||Ab(),hd=function(){function b(a,c){this.keySelector=a;this.flushes=c}b.prototype.call=function(a,c){return c.subscribe(new gd(a,this.keySelector,this.flushes))};return b}(),gd=function(b){function a(a,e,d){b.call(this,a);this.keySelector=e;this.values=new fd;d&&this.add(q(this,d))}__extends(a,b);a.prototype.notifyNext=function(a,b,d,f,h){this.values.clear()};a.prototype.notifyError=function(a,b){this._error(a)};
a.prototype._next=function(a){this.keySelector?this._useKeySelector(a):this._finalizeNext(a,a)};a.prototype._useKeySelector=function(a){var c,b=this.destination;try{c=this.keySelector(a)}catch(f){b.error(f);return}this._finalizeNext(c,a)};a.prototype._finalizeNext=function(a,b){var c=this.values;c.has(a)||(c.add(a),this.destination.next(b))};return a}(t);g.prototype.distinct=function(b,a){return this.lift(new hd(b,a))};var Bb=function(){function b(a,c){this.compare=a;this.keySelector=c}b.prototype.call=
function(a,c){return c.subscribe(new id(a,this.compare,this.keySelector))};return b}(),id=function(b){function a(a,e,d){b.call(this,a);this.keySelector=d;this.hasKey=!1;"function"===typeof e&&(this.compare=e)}__extends(a,b);a.prototype.compare=function(a,b){return a===b};a.prototype._next=function(a){var c=a;if(this.keySelector&&(c=k(this.keySelector)(a),c===n))return this.destination.error(n.e);var b=!1;if(this.hasKey){if(b=k(this.compare)(this.key,c),b===n)return this.destination.error(n.e)}else this.hasKey=
!0;!1===!!b&&(this.key=c,this.destination.next(a))};return a}(p);g.prototype.distinctUntilChanged=Ga;g.prototype.distinctUntilKeyChanged=function(b,a){return Ga.call(this,function(c,e){return a?a(c[b],e[b]):c[b]===e[b]})};var Cb=function(){function b(a,c,b){this.nextOrObserver=a;this.error=c;this.complete=b}b.prototype.call=function(a,c){return c.subscribe(new jd(a,this.nextOrObserver,this.error,this.complete))};return b}(),jd=function(b){function a(a,e,d,f){b.call(this,a);a=new p(e,d,f);a.syncErrorThrowable=
!0;this.add(a);this.safeSubscriber=a}__extends(a,b);a.prototype._next=function(a){var c=this.safeSubscriber;c.next(a);c.syncErrorThrown?this.destination.error(c.syncErrorValue):this.destination.next(a)};a.prototype._error=function(a){var c=this.safeSubscriber;c.error(a);c.syncErrorThrown?this.destination.error(c.syncErrorValue):this.destination.error(a)};a.prototype._complete=function(){var a=this.safeSubscriber;a.complete();a.syncErrorThrown?this.destination.error(a.syncErrorValue):this.destination.complete()};
return a}(p);g.prototype.do=Ha;g.prototype._do=Ha;var ld=function(){function b(){}b.prototype.call=function(a,c){return c.subscribe(new kd(a))};return b}(),kd=function(b){function a(a){b.call(this,a);this.hasSubscription=this.hasCompleted=!1}__extends(a,b);a.prototype._next=function(a){this.hasSubscription||(this.hasSubscription=!0,this.add(q(this,a)))};a.prototype._complete=function(){this.hasCompleted=!0;this.hasSubscription||this.destination.complete()};a.prototype.notifyComplete=function(a){this.remove(a);
this.hasSubscription=!1;this.hasCompleted&&this.destination.complete()};return a}(t);g.prototype.exhaust=function(){return this.lift(new ld)};var nd=function(){function b(a,c){this.project=a;this.resultSelector=c}b.prototype.call=function(a,c){return c.subscribe(new md(a,this.project,this.resultSelector))};return b}(),md=function(b){function a(a,e,d){b.call(this,a);this.project=e;this.resultSelector=d;this.hasCompleted=this.hasSubscription=!1;this.index=0}__extends(a,b);a.prototype._next=function(a){this.hasSubscription||
this.tryNext(a)};a.prototype.tryNext=function(a){var c=this.index++,b=this.destination;try{var f=this.project(a,c);this.hasSubscription=!0;this.add(q(this,f,a,c))}catch(h){b.error(h)}};a.prototype._complete=function(){this.hasCompleted=!0;this.hasSubscription||this.destination.complete()};a.prototype.notifyNext=function(a,b,d,f,h){h=this.destination;this.resultSelector?this.trySelectResult(a,b,d,f):h.next(b)};a.prototype.trySelectResult=function(a,b,d,f){var c=this.resultSelector,e=this.destination;
try{var g=c(a,b,d,f);e.next(g)}catch(J){e.error(J)}};a.prototype.notifyError=function(a){this.destination.error(a)};a.prototype.notifyComplete=function(a){this.remove(a);this.hasSubscription=!1;this.hasCompleted&&this.destination.complete()};return a}(t);g.prototype.exhaustMap=function(b,a){return this.lift(new nd(b,a))};var pd=function(){function b(a,c,b){this.project=a;this.concurrent=c;this.scheduler=b}b.prototype.call=function(a,c){return c.subscribe(new od(a,this.project,this.concurrent,this.scheduler))};
return b}(),od=function(b){function a(a,e,d,f){b.call(this,a);this.project=e;this.concurrent=d;this.scheduler=f;this.active=this.index=0;this.hasCompleted=!1;d<Number.POSITIVE_INFINITY&&(this.buffer=[])}__extends(a,b);a.dispatch=function(a){a.subscriber.subscribeToProjection(a.result,a.value,a.index)};a.prototype._next=function(c){var b=this.destination;if(b.closed)this._complete();else{var d=this.index++;if(this.active<this.concurrent){b.next(c);var f=k(this.project)(c,d);f===n?b.error(n.e):this.scheduler?
this.add(this.scheduler.schedule(a.dispatch,0,{subscriber:this,result:f,value:c,index:d})):this.subscribeToProjection(f,c,d)}else this.buffer.push(c)}};a.prototype.subscribeToProjection=function(a,b,d){this.active++;this.add(q(this,a,b,d))};a.prototype._complete=function(){(this.hasCompleted=!0,0===this.active)&&this.destination.complete()};a.prototype.notifyNext=function(a,b,d,f,h){this._next(b)};a.prototype.notifyComplete=function(a){var c=this.buffer;this.remove(a);this.active--;c&&0<c.length&&
this._next(c.shift());this.hasCompleted&&0===this.active&&this.destination.complete()};return a}(t);g.prototype.expand=function(b,a,c){void 0===a&&(a=Number.POSITIVE_INFINITY);void 0===c&&(c=void 0);a=1>(a||0)?Number.POSITIVE_INFINITY:a;return this.lift(new pd(b,a,c))};var W=function(b){function a(){var a=b.call(this,"argument out of range");this.name=a.name="ArgumentOutOfRangeError";this.stack=a.stack;this.message=a.message}__extends(a,b);return a}(Error),rd=function(){function b(a,c){this.index=
a;this.defaultValue=c;if(0>a)throw new W;}b.prototype.call=function(a,c){return c.subscribe(new qd(a,this.index,this.defaultValue))};return b}(),qd=function(b){function a(a,e,d){b.call(this,a);this.index=e;this.defaultValue=d}__extends(a,b);a.prototype._next=function(a){0===this.index--&&(this.destination.next(a),this.destination.complete())};a.prototype._complete=function(){var a=this.destination;0<=this.index&&("undefined"!==typeof this.defaultValue?a.next(this.defaultValue):a.error(new W));a.complete()};
return a}(p);g.prototype.elementAt=function(b,a){return this.lift(new rd(b,a))};var Db=function(){function b(a,c){this.predicate=a;this.thisArg=c}b.prototype.call=function(a,c){return c.subscribe(new sd(a,this.predicate,this.thisArg))};return b}(),sd=function(b){function a(a,e,d){b.call(this,a);this.predicate=e;this.thisArg=d;this.count=0;this.predicate=e}__extends(a,b);a.prototype._next=function(a){var c;try{c=this.predicate.call(this.thisArg,a,this.count++)}catch(d){this.destination.error(d);return}c&&
this.destination.next(a)};return a}(p);g.prototype.filter=ha;var Eb=function(){function b(a){this.callback=a}b.prototype.call=function(a,c){return c.subscribe(new td(a,this.callback))};return b}(),td=function(b){function a(a,e){b.call(this,a);this.add(new x(e))}__extends(a,b);return a}(p);g.prototype.finally=Ia;g.prototype._finally=Ia;var ab=function(){function b(a,c,b,d){this.predicate=a;this.source=c;this.yieldIndex=b;this.thisArg=d}b.prototype.call=function(a,c){return c.subscribe(new ud(a,this.predicate,
this.source,this.yieldIndex,this.thisArg))};return b}(),ud=function(b){function a(a,e,d,f,h){b.call(this,a);this.predicate=e;this.source=d;this.yieldIndex=f;this.thisArg=h;this.index=0}__extends(a,b);a.prototype.notifyComplete=function(a){var c=this.destination;c.next(a);c.complete()};a.prototype._next=function(a){var c=this.predicate,b=this.thisArg,f=this.index++;try{c.call(b||this,a,f,this.source)&&this.notifyComplete(this.yieldIndex?f:a)}catch(h){this.destination.error(h)}};a.prototype._complete=
function(){this.notifyComplete(this.yieldIndex?-1:void 0)};return a}(p);g.prototype.find=function(b,a){if("function"!==typeof b)throw new TypeError("predicate is not a function");return this.lift(new ab(b,this,!1,a))};g.prototype.findIndex=function(b,a){return this.lift(new ab(b,this,!0,a))};var ea=function(b){function a(){var a=b.call(this,"no elements in sequence");this.name=a.name="EmptyError";this.stack=a.stack;this.message=a.message}__extends(a,b);return a}(Error),wd=function(){function b(a,
c,b,d){this.predicate=a;this.resultSelector=c;this.defaultValue=b;this.source=d}b.prototype.call=function(a,c){return c.subscribe(new vd(a,this.predicate,this.resultSelector,this.defaultValue,this.source))};return b}(),vd=function(b){function a(a,e,d,f,h){b.call(this,a);this.predicate=e;this.resultSelector=d;this.defaultValue=f;this.source=h;this.index=0;this._emitted=this.hasCompleted=!1}__extends(a,b);a.prototype._next=function(a){var c=this.index++;this.predicate?this._tryPredicate(a,c):this._emit(a,
c)};a.prototype._tryPredicate=function(a,b){var c;try{c=this.predicate(a,b,this.source)}catch(f){this.destination.error(f);return}c&&this._emit(a,b)};a.prototype._emit=function(a,b){this.resultSelector?this._tryResultSelector(a,b):this._emitFinal(a)};a.prototype._tryResultSelector=function(a,b){var c;try{c=this.resultSelector(a,b)}catch(f){this.destination.error(f);return}this._emitFinal(c)};a.prototype._emitFinal=function(a){var c=this.destination;this._emitted||(this._emitted=!0,c.next(a),c.complete(),
this.hasCompleted=!0)};a.prototype._complete=function(){var a=this.destination;this.hasCompleted||"undefined"===typeof this.defaultValue?this.hasCompleted||a.error(new ea):(a.next(this.defaultValue),a.complete())};return a}(p);g.prototype.first=function(b,a,c){return this.lift(new wd(b,a,c,this))};var xd=function(){function b(){this.size=0;this._values=[];this._keys=[]}b.prototype.get=function(a){a=this._keys.indexOf(a);return-1===a?void 0:this._values[a]};b.prototype.set=function(a,c){var b=this._keys.indexOf(a);
-1===b?(this._keys.push(a),this._values.push(c),this.size++):this._values[b]=c;return this};b.prototype.delete=function(a){a=this._keys.indexOf(a);if(-1===a)return!1;this._values.splice(a,1);this._keys.splice(a,1);this.size--;return!0};b.prototype.clear=function(){this._keys.length=0;this.size=this._values.length=0};b.prototype.forEach=function(a,c){for(var b=0;b<this.size;b++)a.call(c,this._values[b],this._keys[b])};return b}(),yd=r.Map||xd,zd=function(){function b(){this.values={}}b.prototype.delete=
function(a){this.values[a]=null;return!0};b.prototype.set=function(a,c){this.values[a]=c;return this};b.prototype.get=function(a){return this.values[a]};b.prototype.forEach=function(a,c){var b=this.values,d;for(d in b)b.hasOwnProperty(d)&&null!==b[d]&&a.call(c,b[d],d)};b.prototype.clear=function(){this.values={}};return b}(),Bd=function(){function b(a,c,b,d){this.keySelector=a;this.elementSelector=c;this.durationSelector=b;this.subjectSelector=d}b.prototype.call=function(a,c){return c.subscribe(new Ad(a,
this.keySelector,this.elementSelector,this.durationSelector,this.subjectSelector))};return b}(),Ad=function(b){function a(a,e,d,f,h){b.call(this,a);this.keySelector=e;this.elementSelector=d;this.durationSelector=f;this.subjectSelector=h;this.groups=null;this.attemptedToUnsubscribe=!1;this.count=0}__extends(a,b);a.prototype._next=function(a){var c;try{c=this.keySelector(a)}catch(d){this.error(d);return}this._group(a,c)};a.prototype._group=function(a,b){var c=this.groups;c||(c=this.groups="string"===
typeof b?new zd:new yd);var e=c.get(b),h;if(this.elementSelector)try{h=this.elementSelector(a)}catch(D){this.error(D)}else h=a;if(!e&&(e=this.subjectSelector?this.subjectSelector():new y,c.set(b,e),a=new bb(b,e,this),this.destination.next(a),this.durationSelector)){a=void 0;try{a=this.durationSelector(new bb(b,e))}catch(D){this.error(D);return}this.add(a.subscribe(new Cd(b,e,this)))}e.closed||e.next(h)};a.prototype._error=function(a){var c=this.groups;c&&(c.forEach(function(c,b){c.error(a)}),c.clear());
this.destination.error(a)};a.prototype._complete=function(){var a=this.groups;a&&(a.forEach(function(a,c){a.complete()}),a.clear());this.destination.complete()};a.prototype.removeGroup=function(a){this.groups.delete(a)};a.prototype.unsubscribe=function(){this.closed||this.attemptedToUnsubscribe||(this.attemptedToUnsubscribe=!0,0===this.count&&b.prototype.unsubscribe.call(this))};return a}(p),Cd=function(b){function a(a,e,d){b.call(this);this.key=a;this.group=e;this.parent=d}__extends(a,b);a.prototype._next=
function(a){this._complete()};a.prototype._error=function(a){var c=this.group;c.closed||c.error(a);this.parent.removeGroup(this.key)};a.prototype._complete=function(){var a=this.group;a.closed||a.complete();this.parent.removeGroup(this.key)};return a}(p),bb=function(b){function a(a,e,d){b.call(this);this.key=a;this.groupSubject=e;this.refCountSubscription=d}__extends(a,b);a.prototype._subscribe=function(a){var c=new x,b=this.refCountSubscription,f=this.groupSubject;b&&!b.closed&&c.add(new Dd(b));
c.add(f.subscribe(a));return c};return a}(g),Dd=function(b){function a(a){b.call(this);this.parent=a;a.count++}__extends(a,b);a.prototype.unsubscribe=function(){var a=this.parent;a.closed||this.closed||(b.prototype.unsubscribe.call(this),--a.count,0===a.count&&a.attemptedToUnsubscribe&&a.unsubscribe())};return a}(x);g.prototype.groupBy=function(b,a,c,e){return this.lift(new Bd(b,a,c,e))};var Fd=function(){function b(){}b.prototype.call=function(a,c){return c.subscribe(new Ed(a))};return b}(),Ed=function(b){function a(){b.apply(this,
arguments)}__extends(a,b);a.prototype._next=function(a){};return a}(p);g.prototype.ignoreElements=function(){return this.lift(new Fd)};var Hd=function(){function b(){}b.prototype.call=function(a,c){return c.subscribe(new Gd(a))};return b}(),Gd=function(b){function a(a){b.call(this,a)}__extends(a,b);a.prototype.notifyComplete=function(a){var c=this.destination;c.next(a);c.complete()};a.prototype._next=function(a){this.notifyComplete(!1)};a.prototype._complete=function(){this.notifyComplete(!0)};return a}(p);
g.prototype.isEmpty=function(){return this.lift(new Hd)};var Jd=function(){function b(a){this.durationSelector=a}b.prototype.call=function(a,c){return c.subscribe(new Id(a,this.durationSelector))};return b}(),Id=function(b){function a(a,e){b.call(this,a);this.durationSelector=e;this.hasValue=!1}__extends(a,b);a.prototype._next=function(a){this.value=a;this.hasValue=!0;this.throttled||(a=k(this.durationSelector)(a),a===n?this.destination.error(n.e):this.add(this.throttled=q(this,a)))};a.prototype.clearThrottle=
function(){var a=this.value,b=this.hasValue,d=this.throttled;d&&(this.remove(d),this.throttled=null,d.unsubscribe());b&&(this.value=null,this.hasValue=!1,this.destination.next(a))};a.prototype.notifyNext=function(a,b,d,f){this.clearThrottle()};a.prototype.notifyComplete=function(){this.clearThrottle()};return a}(t);g.prototype.audit=function(b){return this.lift(new Jd(b))};var Ld=function(){function b(a,c){this.duration=a;this.scheduler=c}b.prototype.call=function(a,c){return c.subscribe(new Kd(a,
this.duration,this.scheduler))};return b}(),Kd=function(b){function a(a,e,d){b.call(this,a);this.duration=e;this.scheduler=d;this.hasValue=!1}__extends(a,b);a.prototype._next=function(a){this.value=a;this.hasValue=!0;this.throttled||this.add(this.throttled=this.scheduler.schedule(Fb,this.duration,this))};a.prototype.clearThrottle=function(){var a=this.value,b=this.hasValue,d=this.throttled;d&&(this.remove(d),this.throttled=null,d.unsubscribe());b&&(this.value=null,this.hasValue=!1,this.destination.next(a))};
return a}(p);g.prototype.auditTime=function(b,a){void 0===a&&(a=C);return this.lift(new Ld(b,a))};var Nd=function(){function b(a,c,b,d){this.predicate=a;this.resultSelector=c;this.defaultValue=b;this.source=d}b.prototype.call=function(a,c){return c.subscribe(new Md(a,this.predicate,this.resultSelector,this.defaultValue,this.source))};return b}(),Md=function(b){function a(a,e,d,f,h){b.call(this,a);this.predicate=e;this.resultSelector=d;this.defaultValue=f;this.source=h;this.hasValue=!1;this.index=
0;"undefined"!==typeof f&&(this.lastValue=f,this.hasValue=!0)}__extends(a,b);a.prototype._next=function(a){var c=this.index++;this.predicate?this._tryPredicate(a,c):this.resultSelector?this._tryResultSelector(a,c):(this.lastValue=a,this.hasValue=!0)};a.prototype._tryPredicate=function(a,b){var c;try{c=this.predicate(a,b,this.source)}catch(f){this.destination.error(f);return}c&&(this.resultSelector?this._tryResultSelector(a,b):(this.lastValue=a,this.hasValue=!0))};a.prototype._tryResultSelector=function(a,
b){var c;try{c=this.resultSelector(a,b)}catch(f){this.destination.error(f);return}this.lastValue=c;this.hasValue=!0};a.prototype._complete=function(){var a=this.destination;this.hasValue?(a.next(this.lastValue),a.complete()):a.error(new ea)};return a}(p);g.prototype.last=function(b,a,c){return this.lift(new Nd(b,a,c,this))};g.prototype.let=Ja;g.prototype.letBind=Ja;var Pd=function(){function b(a,c,b){this.predicate=a;this.thisArg=c;this.source=b}b.prototype.call=function(a,c){return c.subscribe(new Od(a,
this.predicate,this.thisArg,this.source))};return b}(),Od=function(b){function a(a,e,d,f){b.call(this,a);this.predicate=e;this.thisArg=d;this.source=f;this.index=0;this.thisArg=d||this}__extends(a,b);a.prototype.notifyComplete=function(a){this.destination.next(a);this.destination.complete()};a.prototype._next=function(a){var c=!1;try{c=this.predicate.call(this.thisArg,a,this.index++,this.source)}catch(d){this.destination.error(d);return}c||this.notifyComplete(!1)};a.prototype._complete=function(){this.notifyComplete(!0)};
return a}(p);g.prototype.every=function(b,a){return this.lift(new Pd(b,a,this))};g.prototype.map=xa;var Rd=function(){function b(a){this.value=a}b.prototype.call=function(a,c){return c.subscribe(new Qd(a,this.value))};return b}(),Qd=function(b){function a(a,e){b.call(this,a);this.value=e}__extends(a,b);a.prototype._next=function(a){this.destination.next(this.value)};return a}(p);g.prototype.mapTo=function(b){return this.lift(new Rd(b))};var Td=function(){function b(){}b.prototype.call=function(a,
c){return c.subscribe(new Sd(a))};return b}(),Sd=function(b){function a(a){b.call(this,a)}__extends(a,b);a.prototype._next=function(a){this.destination.next(z.createNext(a))};a.prototype._error=function(a){var c=this.destination;c.next(z.createError(a));c.complete()};a.prototype._complete=function(){var a=this.destination;a.next(z.createComplete());a.complete()};return a}(p);g.prototype.materialize=function(){return this.lift(new Td)};var oa=function(){function b(a,c,b){void 0===b&&(b=!1);this.accumulator=
a;this.seed=c;this.hasSeed=b}b.prototype.call=function(a,c){return c.subscribe(new Ud(a,this.accumulator,this.seed,this.hasSeed))};return b}(),Ud=function(b){function a(a,e,d,f){b.call(this,a);this.accumulator=e;this.hasSeed=f;this.hasValue=!1;this.acc=d}__extends(a,b);a.prototype._next=function(a){this.hasValue||(this.hasValue=this.hasSeed)?this._tryReduce(a):(this.acc=a,this.hasValue=!0)};a.prototype._tryReduce=function(a){var c;try{c=this.accumulator(this.acc,a)}catch(d){this.destination.error(d);
return}this.acc=c};a.prototype._complete=function(){(this.hasValue||this.hasSeed)&&this.destination.next(this.acc);this.destination.complete()};return a}(p);g.prototype.max=function(b){return this.lift(new oa("function"===typeof b?function(a,c){return 0<b(a,c)?a:c}:function(a,c){return a>c?a:c}))};g.prototype.merge=function(){for(var b=[],a=0;a<arguments.length;a++)b[a-0]=arguments[a];return this.lift.call(ta.apply(void 0,[this].concat(b)))};g.prototype.mergeAll=function(b){void 0===b&&(b=Number.POSITIVE_INFINITY);
return this.lift(new aa(b))};g.prototype.mergeMap=Ca;g.prototype.flatMap=Ca;g.prototype.flatMapTo=Ea;g.prototype.mergeMapTo=Ea;var Wd=function(){function b(a,c,b){this.project=a;this.seed=c;this.concurrent=b}b.prototype.call=function(a,c){return c.subscribe(new Vd(a,this.project,this.seed,this.concurrent))};return b}(),Vd=function(b){function a(a,e,d,f){b.call(this,a);this.project=e;this.acc=d;this.concurrent=f;this.hasCompleted=this.hasValue=!1;this.buffer=[];this.index=this.active=0}__extends(a,
b);a.prototype._next=function(a){if(this.active<this.concurrent){var c=this.index++,b=k(this.project)(this.acc,a),f=this.destination;b===n?f.error(n.e):(this.active++,this._innerSub(b,a,c))}else this.buffer.push(a)};a.prototype._innerSub=function(a,b,d){this.add(q(this,a,b,d))};a.prototype._complete=function(){this.hasCompleted=!0;0===this.active&&0===this.buffer.length&&(!1===this.hasValue&&this.destination.next(this.acc),this.destination.complete())};a.prototype.notifyNext=function(a,b,d,f,h){a=
this.destination;this.acc=b;this.hasValue=!0;a.next(b)};a.prototype.notifyComplete=function(a){var c=this.buffer;this.remove(a);this.active--;0<c.length?this._next(c.shift()):0===this.active&&this.hasCompleted&&(!1===this.hasValue&&this.destination.next(this.acc),this.destination.complete())};return a}(t);g.prototype.mergeScan=function(b,a,c){void 0===c&&(c=Number.POSITIVE_INFINITY);return this.lift(new Wd(b,a,c))};g.prototype.min=function(b){return this.lift(new oa("function"===typeof b?function(a,
c){return 0>b(a,c)?a:c}:function(a,c){return a<c?a:c}))};var X=function(b){function a(a,e){b.call(this);this.source=a;this.subjectFactory=e;this._refCount=0}__extends(a,b);a.prototype._subscribe=function(a){return this.getSubject().subscribe(a)};a.prototype.getSubject=function(){var a=this._subject;if(!a||a.isStopped)this._subject=this.subjectFactory();return this._subject};a.prototype.connect=function(){var a=this._connection;a||(a=this._connection=new x,a.add(this.source.subscribe(new Xd(this.getSubject(),
this))),a.closed?(this._connection=null,a=x.EMPTY):this._connection=a);return a};a.prototype.refCount=function(){return this.lift(new Yd(this))};return a}(g),Hb={operator:{value:null},_refCount:{value:0,writable:!0},_subscribe:{value:X.prototype._subscribe},getSubject:{value:X.prototype.getSubject},connect:{value:X.prototype.connect},refCount:{value:X.prototype.refCount}},Xd=function(b){function a(a,e){b.call(this,a);this.connectable=e}__extends(a,b);a.prototype._error=function(a){this._unsubscribe();
b.prototype._error.call(this,a)};a.prototype._complete=function(){this._unsubscribe();b.prototype._complete.call(this)};a.prototype._unsubscribe=function(){var a=this.connectable;if(a){this.connectable=null;var b=a._connection;a._refCount=0;a._subject=null;a._connection=null;b&&b.unsubscribe()}};return a}(Pa),Yd=function(){function b(a){this.connectable=a}b.prototype.call=function(a,c){var b=this.connectable;b._refCount++;a=new Zd(a,b);c=c.subscribe(a);a.closed||(a.connection=b.connect());return c};
return b}(),Zd=function(b){function a(a,e){b.call(this,a);this.connectable=e}__extends(a,b);a.prototype._unsubscribe=function(){var a=this.connectable;if(a){this.connectable=null;var b=a._refCount;0>=b?this.connection=null:(a._refCount=b-1,1<b?this.connection=null:(b=this.connection,a=a._connection,this.connection=null,!a||b&&a!==b||a.unsubscribe()))}else this.connection=null};return a}(p),Gb=function(){function b(a,c){this.subjectFactory=a;this.selector=c}b.prototype.call=function(a,c){var b=this.selector,
d=this.subjectFactory();a=b(d).subscribe(a);a.add(c.subscribe(d));return a};return b}();g.prototype.multicast=N;g.prototype.observeOn=function(b,a){void 0===a&&(a=0);return this.lift(new bc(b,a))};g.prototype.onErrorResumeNext=function(){for(var b=[],a=0;a<arguments.length;a++)b[a-0]=arguments[a];1===b.length&&H(b[0])&&(b=b[0]);return this.lift(new Wa(b))};var ae=function(){function b(){}b.prototype.call=function(a,c){return c.subscribe(new $d(a))};return b}(),$d=function(b){function a(a){b.call(this,
a);this.hasPrev=!1}__extends(a,b);a.prototype._next=function(a){this.hasPrev?this.destination.next([this.prev,a]):this.hasPrev=!0;this.prev=a};return a}(p);g.prototype.pairwise=function(){return this.lift(new ae)};g.prototype.partition=function(b,a){return[ha.call(this,b,a),ha.call(this,Ib(b,a))]};g.prototype.pluck=function(){for(var b=[],a=0;a<arguments.length;a++)b[a-0]=arguments[a];a=b.length;if(0===a)throw Error("list of properties cannot be empty.");return xa.call(this,Jb(b,a))};g.prototype.publish=
function(b){return b?N.call(this,function(){return new y},b):N.call(this,new y)};var cb=function(b){function a(a){b.call(this);this._value=a}__extends(a,b);Object.defineProperty(a.prototype,"value",{get:function(){return this.getValue()},enumerable:!0,configurable:!0});a.prototype._subscribe=function(a){var c=b.prototype._subscribe.call(this,a);c&&!c.closed&&a.next(this._value);return c};a.prototype.getValue=function(){if(this.hasError)throw this.thrownError;if(this.closed)throw new O;return this._value};
a.prototype.next=function(a){b.prototype.next.call(this,this._value=a)};return a}(y);g.prototype.publishBehavior=function(b){return N.call(this,new cb(b))};g.prototype.publishReplay=function(b,a,c){void 0===b&&(b=Number.POSITIVE_INFINITY);void 0===a&&(a=Number.POSITIVE_INFINITY);return N.call(this,new R(b,a,c))};g.prototype.publishLast=function(){return N.call(this,new P)};g.prototype.race=function(){for(var b=[],a=0;a<arguments.length;a++)b[a-0]=arguments[a];1===b.length&&H(b[0])&&(b=b[0]);return this.lift.call(ua.apply(void 0,
[this].concat(b)))};g.prototype.reduce=function(b,a){var c=!1;2<=arguments.length&&(c=!0);return this.lift(new oa(b,a,c))};var db=function(){function b(a,c){this.count=a;this.source=c}b.prototype.call=function(a,c){return c.subscribe(new be(a,this.count,this.source))};return b}(),be=function(b){function a(a,e,d){b.call(this,a);this.count=e;this.source=d}__extends(a,b);a.prototype.complete=function(){if(!this.isStopped){var a=this.source,e=this.count;if(0===e)return b.prototype.complete.call(this);
-1<e&&(this.count=e-1);this.unsubscribe();this.closed=this.isStopped=!1;a.subscribe(this)}};return a}(p);g.prototype.repeat=function(b){void 0===b&&(b=-1);return 0===b?new L:0>b?this.lift(new db(-1,this)):this.lift(new db(b-1,this))};var de=function(){function b(a,c){this.notifier=a;this.source=c}b.prototype.call=function(a,c){return c.subscribe(new ce(a,this.notifier,this.source))};return b}(),ce=function(b){function a(a,e,d){b.call(this,a);this.notifier=e;this.source=d}__extends(a,b);a.prototype.complete=
function(){if(!this.isStopped){var a=this.notifications,e=this.retries,d=this.retriesSubscription;if(e)this.retriesSubscription=this.notifications=null;else{a=new y;e=k(this.notifier)(a);if(e===n)return b.prototype.complete.call(this);d=q(this,e)}this.unsubscribe();this.closed=!1;this.notifications=a;this.retries=e;this.retriesSubscription=d;a.next()}};a.prototype._unsubscribe=function(){var a=this.notifications,b=this.retriesSubscription;a&&(a.unsubscribe(),this.notifications=null);b&&(b.unsubscribe(),
this.retriesSubscription=null);this.retries=null};a.prototype.notifyNext=function(a,b,d,f,h){a=this.notifications;b=this.retries;d=this.retriesSubscription;this.retriesSubscription=this.retries=this.notifications=null;this.unsubscribe();this.closed=this.isStopped=!1;this.notifications=a;this.retries=b;this.retriesSubscription=d;this.source.subscribe(this)};return a}(t);g.prototype.repeatWhen=function(b){return this.lift(new de(b,this))};var fe=function(){function b(a,c){this.count=a;this.source=c}
b.prototype.call=function(a,c){return c.subscribe(new ee(a,this.count,this.source))};return b}(),ee=function(b){function a(a,e,d){b.call(this,a);this.count=e;this.source=d}__extends(a,b);a.prototype.error=function(a){if(!this.isStopped){var c=this.source,d=this.count;if(0===d)return b.prototype.error.call(this,a);-1<d&&(this.count=d-1);this.unsubscribe();this.closed=this.isStopped=!1;c.subscribe(this)}};return a}(p);g.prototype.retry=function(b){void 0===b&&(b=-1);return this.lift(new fe(b,this))};
var he=function(){function b(a,c){this.notifier=a;this.source=c}b.prototype.call=function(a,c){return c.subscribe(new ge(a,this.notifier,this.source))};return b}(),ge=function(b){function a(a,e,d){b.call(this,a);this.notifier=e;this.source=d}__extends(a,b);a.prototype.error=function(a){if(!this.isStopped){var c=this.errors,d=this.retries,f=this.retriesSubscription;if(d)this.retriesSubscription=this.errors=null;else{c=new y;d=k(this.notifier)(c);if(d===n)return b.prototype.error.call(this,n.e);f=q(this,
d)}this.unsubscribe();this.closed=!1;this.errors=c;this.retries=d;this.retriesSubscription=f;c.next(a)}};a.prototype._unsubscribe=function(){var a=this.errors,b=this.retriesSubscription;a&&(a.unsubscribe(),this.errors=null);b&&(b.unsubscribe(),this.retriesSubscription=null);this.retries=null};a.prototype.notifyNext=function(a,b,d,f,h){a=this.errors;b=this.retries;d=this.retriesSubscription;this.retriesSubscription=this.retries=this.errors=null;this.unsubscribe();this.closed=this.isStopped=!1;this.errors=
a;this.retries=b;this.retriesSubscription=d;this.source.subscribe(this)};return a}(t);g.prototype.retryWhen=function(b){return this.lift(new he(b,this))};var je=function(){function b(a){this.notifier=a}b.prototype.call=function(a,c){a=new ie(a);c=c.subscribe(a);c.add(q(a,this.notifier));return c};return b}(),ie=function(b){function a(){b.apply(this,arguments);this.hasValue=!1}__extends(a,b);a.prototype._next=function(a){this.value=a;this.hasValue=!0};a.prototype.notifyNext=function(a,b,d,f,h){this.emitValue()};
a.prototype.notifyComplete=function(){this.emitValue()};a.prototype.emitValue=function(){this.hasValue&&(this.hasValue=!1,this.destination.next(this.value))};return a}(t);g.prototype.sample=function(b){return this.lift(new je(b))};var le=function(){function b(a,c){this.period=a;this.scheduler=c}b.prototype.call=function(a,c){return c.subscribe(new ke(a,this.period,this.scheduler))};return b}(),ke=function(b){function a(a,e,d){b.call(this,a);this.period=e;this.scheduler=d;this.hasValue=!1;this.add(d.schedule(Kb,
e,{subscriber:this,period:e}))}__extends(a,b);a.prototype._next=function(a){this.lastValue=a;this.hasValue=!0};a.prototype.notifyNext=function(){this.hasValue&&(this.hasValue=!1,this.destination.next(this.lastValue))};return a}(p);g.prototype.sampleTime=function(b,a){void 0===a&&(a=C);return this.lift(new le(b,a))};var ne=function(){function b(a,c,b){void 0===b&&(b=!1);this.accumulator=a;this.seed=c;this.hasSeed=b}b.prototype.call=function(a,c){return c.subscribe(new me(a,this.accumulator,this.seed,
this.hasSeed))};return b}(),me=function(b){function a(a,e,d,f){b.call(this,a);this.accumulator=e;this._seed=d;this.hasSeed=f;this.index=0}__extends(a,b);Object.defineProperty(a.prototype,"seed",{get:function(){return this._seed},set:function(a){this.hasSeed=!0;this._seed=a},enumerable:!0,configurable:!0});a.prototype._next=function(a){if(this.hasSeed)return this._tryNext(a);this.seed=a;this.destination.next(a)};a.prototype._tryNext=function(a){var c=this.index++,b;try{b=this.accumulator(this.seed,
a,c)}catch(f){this.destination.error(f)}this.seed=b;this.destination.next(b)};return a}(p);g.prototype.scan=function(b,a){var c=!1;2<=arguments.length&&(c=!0);return this.lift(new ne(b,a,c))};var pe=function(){function b(a,c){this.compareTo=a;this.comparor=c}b.prototype.call=function(a,c){return c.subscribe(new oe(a,this.compareTo,this.comparor))};return b}(),oe=function(b){function a(a,e,d){b.call(this,a);this.compareTo=e;this.comparor=d;this._a=[];this._b=[];this._oneComplete=!1;this.add(e.subscribe(new qe(a,
this)))}__extends(a,b);a.prototype._next=function(a){this._oneComplete&&0===this._b.length?this.emit(!1):(this._a.push(a),this.checkValues())};a.prototype._complete=function(){this._oneComplete?this.emit(0===this._a.length&&0===this._b.length):this._oneComplete=!0};a.prototype.checkValues=function(){for(var a=this._a,b=this._b,d=this.comparor;0<a.length&&0<b.length;){var f=a.shift(),h=b.shift();d?(f=k(d)(f,h),f===n&&this.destination.error(n.e)):f=f===h;f||this.emit(!1)}};a.prototype.emit=function(a){var c=
this.destination;c.next(a);c.complete()};a.prototype.nextB=function(a){this._oneComplete&&0===this._a.length?this.emit(!1):(this._b.push(a),this.checkValues())};return a}(p),qe=function(b){function a(a,e){b.call(this,a);this.parent=e}__extends(a,b);a.prototype._next=function(a){this.parent.nextB(a)};a.prototype._error=function(a){this.parent.error(a)};a.prototype._complete=function(){this.parent._complete()};return a}(p);g.prototype.sequenceEqual=function(b,a){return this.lift(new pe(b,a))};g.prototype.share=
function(){return N.call(this,Lb).refCount()};var se=function(){function b(a,c){this.predicate=a;this.source=c}b.prototype.call=function(a,c){return c.subscribe(new re(a,this.predicate,this.source))};return b}(),re=function(b){function a(a,e,d){b.call(this,a);this.predicate=e;this.source=d;this.seenValue=!1;this.index=0}__extends(a,b);a.prototype.applySingleValue=function(a){this.seenValue?this.destination.error("Sequence contains more than one element"):(this.seenValue=!0,this.singleValue=a)};a.prototype._next=
function(a){var c=this.predicate;this.index++;c?this.tryNext(a):this.applySingleValue(a)};a.prototype.tryNext=function(a){try{this.predicate(a,this.index,this.source)&&this.applySingleValue(a)}catch(e){this.destination.error(e)}};a.prototype._complete=function(){var a=this.destination;0<this.index?(a.next(this.seenValue?this.singleValue:void 0),a.complete()):a.error(new ea)};return a}(p);g.prototype.single=function(b){return this.lift(new se(b,this))};var ue=function(){function b(a){this.total=a}
b.prototype.call=function(a,c){return c.subscribe(new te(a,this.total))};return b}(),te=function(b){function a(a,e){b.call(this,a);this.total=e;this.count=0}__extends(a,b);a.prototype._next=function(a){++this.count>this.total&&this.destination.next(a)};return a}(p);g.prototype.skip=function(b){return this.lift(new ue(b))};var we=function(){function b(a){this.notifier=a}b.prototype.call=function(a,c){return c.subscribe(new ve(a,this.notifier))};return b}(),ve=function(b){function a(a,e){b.call(this,
a);this.isInnerStopped=this.hasValue=!1;this.add(q(this,e))}__extends(a,b);a.prototype._next=function(a){this.hasValue&&b.prototype._next.call(this,a)};a.prototype._complete=function(){this.isInnerStopped?b.prototype._complete.call(this):this.unsubscribe()};a.prototype.notifyNext=function(a,b,d,f,h){this.hasValue=!0};a.prototype.notifyComplete=function(){this.isInnerStopped=!0;this.isStopped&&b.prototype._complete.call(this)};return a}(t);g.prototype.skipUntil=function(b){return this.lift(new we(b))};
var ye=function(){function b(a){this.predicate=a}b.prototype.call=function(a,c){return c.subscribe(new xe(a,this.predicate))};return b}(),xe=function(b){function a(a,e){b.call(this,a);this.predicate=e;this.skipping=!0;this.index=0}__extends(a,b);a.prototype._next=function(a){var c=this.destination;this.skipping&&this.tryCallPredicate(a);this.skipping||c.next(a)};a.prototype.tryCallPredicate=function(a){try{this.skipping=!!this.predicate(a,this.index++)}catch(e){this.destination.error(e)}};return a}(p);
g.prototype.skipWhile=function(b){return this.lift(new ye(b))};g.prototype.startWith=function(){for(var b=[],a=0;a<arguments.length;a++)b[a-0]=arguments[a];a=b[b.length-1];G(a)?b.pop():a=null;var c=b.length;return 1===c?S(new la(b[0],a),this):1<c?S(new K(b,a),this):S(new L(a),this)};var eb=new (function(){function b(a){this.root=a;a.setImmediate&&"function"===typeof a.setImmediate?(this.setImmediate=a.setImmediate.bind(a),this.clearImmediate=a.clearImmediate.bind(a)):(this.nextHandle=1,this.tasksByHandle=
{},this.currentlyRunningATask=!1,this.canUseProcessNextTick()?this.setImmediate=this.createProcessNextTickSetImmediate():this.canUsePostMessage()?this.setImmediate=this.createPostMessageSetImmediate():this.canUseMessageChannel()?this.setImmediate=this.createMessageChannelSetImmediate():this.canUseReadyStateChange()?this.setImmediate=this.createReadyStateChangeSetImmediate():this.setImmediate=this.createSetTimeoutSetImmediate(),a=function e(a){delete e.instance.tasksByHandle[a]},a.instance=this,this.clearImmediate=
a)}b.prototype.identify=function(a){return this.root.Object.prototype.toString.call(a)};b.prototype.canUseProcessNextTick=function(){return"[object process]"===this.identify(this.root.process)};b.prototype.canUseMessageChannel=function(){return!!this.root.MessageChannel};b.prototype.canUseReadyStateChange=function(){var a=this.root.document;return!!(a&&"onreadystatechange"in a.createElement("script"))};b.prototype.canUsePostMessage=function(){var a=this.root;if(a.postMessage&&!a.importScripts){var c=
!0,b=a.onmessage;a.onmessage=function(){c=!1};a.postMessage("","*");a.onmessage=b;return c}return!1};b.prototype.partiallyApplied=function(a){for(var c=[],b=1;b<arguments.length;b++)c[b-1]=arguments[b];b=function f(){var a=f.handler,c=f.args;"function"===typeof a?a.apply(void 0,c):(new Function(""+a))()};b.handler=a;b.args=c;return b};b.prototype.addFromSetImmediateArguments=function(a){this.tasksByHandle[this.nextHandle]=this.partiallyApplied.apply(void 0,a);return this.nextHandle++};b.prototype.createProcessNextTickSetImmediate=
function(){var a=function e(){var a=e.instance,b=a.addFromSetImmediateArguments(arguments);a.root.process.nextTick(a.partiallyApplied(a.runIfPresent,b));return b};a.instance=this;return a};b.prototype.createPostMessageSetImmediate=function(){var a=this.root,b="setImmediate$"+a.Math.random()+"$",e=function f(c){var e=f.instance;c.source===a&&"string"===typeof c.data&&0===c.data.indexOf(b)&&e.runIfPresent(+c.data.slice(b.length))};e.instance=this;a.addEventListener("message",e,!1);e=function h(){var a=
h,b=a.messagePrefix,a=a.instance,c=a.addFromSetImmediateArguments(arguments);a.root.postMessage(b+c,"*");return c};e.instance=this;e.messagePrefix=b;return e};b.prototype.runIfPresent=function(a){if(this.currentlyRunningATask)this.root.setTimeout(this.partiallyApplied(this.runIfPresent,a),0);else{var b=this.tasksByHandle[a];if(b){this.currentlyRunningATask=!0;try{b()}finally{this.clearImmediate(a),this.currentlyRunningATask=!1}}}};b.prototype.createMessageChannelSetImmediate=function(){var a=this,
b=new this.root.MessageChannel;b.port1.onmessage=function(b){a.runIfPresent(b.data)};var e=function f(){var a=f,b=a.channel,a=a.instance.addFromSetImmediateArguments(arguments);b.port2.postMessage(a);return a};e.channel=b;e.instance=this;return e};b.prototype.createReadyStateChangeSetImmediate=function(){var a=function e(){var a=e.instance,b=a.root.document,h=b.documentElement,g=a.addFromSetImmediateArguments(arguments),k=b.createElement("script");k.onreadystatechange=function(){a.runIfPresent(g);
k.onreadystatechange=null;h.removeChild(k);k=null};h.appendChild(k);return g};a.instance=this;return a};b.prototype.createSetTimeoutSetImmediate=function(){var a=function e(){var a=e.instance,b=a.addFromSetImmediateArguments(arguments);a.root.setTimeout(a.partiallyApplied(a.runIfPresent,b),0);return b};a.instance=this;return a};return b}())(r),ze=function(b){function a(a,e){b.call(this,a,e);this.scheduler=a;this.work=e}__extends(a,b);a.prototype.requestAsyncId=function(a,e,d){void 0===d&&(d=0);if(null!==
d&&0<d)return b.prototype.requestAsyncId.call(this,a,e,d);a.actions.push(this);return a.scheduled||(a.scheduled=eb.setImmediate(a.flush.bind(a,null)))};a.prototype.recycleAsyncId=function(a,e,d){void 0===d&&(d=0);if(null!==d&&0<d||null===d&&0<this.delay)return b.prototype.recycleAsyncId.call(this,a,e,d);0===a.actions.length&&(eb.clearImmediate(e),a.scheduled=void 0)};return a}(U),fa=new (function(b){function a(){b.apply(this,arguments)}__extends(a,b);a.prototype.flush=function(a){this.active=!0;this.scheduled=
void 0;var b=this.actions,c,f=-1,h=b.length;a=a||b.shift();do if(c=a.execute(a.state,a.delay))break;while(++f<h&&(a=b.shift()));this.active=!1;if(c){for(;++f<h&&(a=b.shift());)a.unsubscribe();throw c;}};return a}(V))(ze),Ae=function(b){function a(a,e,d){void 0===e&&(e=0);void 0===d&&(d=fa);b.call(this);this.source=a;this.delayTime=e;this.scheduler=d;if(!ga(e)||0>e)this.delayTime=0;d&&"function"===typeof d.schedule||(this.scheduler=fa)}__extends(a,b);a.create=function(b,e,d){void 0===e&&(e=0);void 0===
d&&(d=fa);return new a(b,e,d)};a.dispatch=function(a){return this.add(a.source.subscribe(a.subscriber))};a.prototype._subscribe=function(b){return this.scheduler.schedule(a.dispatch,this.delayTime,{source:this.source,subscriber:b})};return a}(g),Be=function(){function b(a,b){this.scheduler=a;this.delay=b}b.prototype.call=function(a,b){return(new Ae(b,this.delay,this.scheduler)).subscribe(a)};return b}();g.prototype.subscribeOn=function(b,a){void 0===a&&(a=0);return this.lift(new Be(b,a))};var Mb=
function(){function b(){}b.prototype.call=function(a,b){return b.subscribe(new Ce(a))};return b}(),Ce=function(b){function a(a){b.call(this,a);this.active=0;this.hasCompleted=!1}__extends(a,b);a.prototype._next=function(a){this.unsubscribeInner();this.active++;this.add(this.innerSubscription=q(this,a))};a.prototype._complete=function(){this.hasCompleted=!0;0===this.active&&this.destination.complete()};a.prototype.unsubscribeInner=function(){this.active=0<this.active?this.active-1:0;var a=this.innerSubscription;
a&&(a.unsubscribe(),this.remove(a))};a.prototype.notifyNext=function(a,b,d,f,h){this.destination.next(b)};a.prototype.notifyError=function(a){this.destination.error(a)};a.prototype.notifyComplete=function(){this.unsubscribeInner();this.hasCompleted&&0===this.active&&this.destination.complete()};return a}(t);g.prototype.switch=Ka;g.prototype._switch=Ka;var Ee=function(){function b(a,b){this.project=a;this.resultSelector=b}b.prototype.call=function(a,b){return b.subscribe(new De(a,this.project,this.resultSelector))};
return b}(),De=function(b){function a(a,e,d){b.call(this,a);this.project=e;this.resultSelector=d;this.index=0}__extends(a,b);a.prototype._next=function(a){var b,c=this.index++;try{b=this.project(a,c)}catch(f){this.destination.error(f);return}this._innerSub(b,a,c)};a.prototype._innerSub=function(a,b,d){var c=this.innerSubscription;c&&c.unsubscribe();this.add(this.innerSubscription=q(this,a,b,d))};a.prototype._complete=function(){var a=this.innerSubscription;a&&!a.closed||b.prototype._complete.call(this)};
a.prototype._unsubscribe=function(){this.innerSubscription=null};a.prototype.notifyComplete=function(a){this.remove(a);this.innerSubscription=null;this.isStopped&&b.prototype._complete.call(this)};a.prototype.notifyNext=function(a,b,d,f,h){this.resultSelector?this._tryNotifyNext(a,b,d,f):this.destination.next(b)};a.prototype._tryNotifyNext=function(a,b,d,f){var c;try{c=this.resultSelector(a,b,d,f)}catch(D){this.destination.error(D);return}this.destination.next(c)};return a}(t);g.prototype.switchMap=
function(b,a){return this.lift(new Ee(b,a))};var Ge=function(){function b(a,b){this.observable=a;this.resultSelector=b}b.prototype.call=function(a,b){return b.subscribe(new Fe(a,this.observable,this.resultSelector))};return b}(),Fe=function(b){function a(a,e,d){b.call(this,a);this.inner=e;this.resultSelector=d;this.index=0}__extends(a,b);a.prototype._next=function(a){var b=this.innerSubscription;b&&b.unsubscribe();this.add(this.innerSubscription=q(this,this.inner,a,this.index++))};a.prototype._complete=
function(){var a=this.innerSubscription;a&&!a.closed||b.prototype._complete.call(this)};a.prototype._unsubscribe=function(){this.innerSubscription=null};a.prototype.notifyComplete=function(a){this.remove(a);this.innerSubscription=null;this.isStopped&&b.prototype._complete.call(this)};a.prototype.notifyNext=function(a,b,d,f,g){g=this.destination;this.resultSelector?this.tryResultSelector(a,b,d,f):g.next(b)};a.prototype.tryResultSelector=function(a,b,d,f){var c=this.resultSelector,e=this.destination,
g;try{g=c(a,b,d,f)}catch(J){e.error(J);return}e.next(g)};return a}(t);g.prototype.switchMapTo=function(b,a){return this.lift(new Ge(b,a))};var Ie=function(){function b(a){this.total=a;if(0>this.total)throw new W;}b.prototype.call=function(a,b){return b.subscribe(new He(a,this.total))};return b}(),He=function(b){function a(a,e){b.call(this,a);this.total=e;this.count=0}__extends(a,b);a.prototype._next=function(a){var b=this.total,c=++this.count;c<=b&&(this.destination.next(a),c===b&&(this.destination.complete(),
this.unsubscribe()))};return a}(p);g.prototype.take=function(b){return 0===b?new L:this.lift(new Ie(b))};var Ke=function(){function b(a){this.total=a;if(0>this.total)throw new W;}b.prototype.call=function(a,b){return b.subscribe(new Je(a,this.total))};return b}(),Je=function(b){function a(a,e){b.call(this,a);this.total=e;this.ring=[];this.count=0}__extends(a,b);a.prototype._next=function(a){var b=this.ring,c=this.total,f=this.count++;b.length<c?b.push(a):b[f%c]=a};a.prototype._complete=function(){var a=
this.destination,b=this.count;if(0<b)for(var d=this.count>=this.total?this.total:this.count,f=this.ring,g=0;g<d;g++){var k=b++%d;a.next(f[k])}a.complete()};return a}(p);g.prototype.takeLast=function(b){return 0===b?new L:this.lift(new Ke(b))};var Me=function(){function b(a){this.notifier=a}b.prototype.call=function(a,b){return b.subscribe(new Le(a,this.notifier))};return b}(),Le=function(b){function a(a,e){b.call(this,a);this.notifier=e;this.add(q(this,e))}__extends(a,b);a.prototype.notifyNext=function(a,
b,d,f,g){this.complete()};a.prototype.notifyComplete=function(){};return a}(t);g.prototype.takeUntil=function(b){return this.lift(new Me(b))};var Oe=function(){function b(a){this.predicate=a}b.prototype.call=function(a,b){return b.subscribe(new Ne(a,this.predicate))};return b}(),Ne=function(b){function a(a,e){b.call(this,a);this.predicate=e;this.index=0}__extends(a,b);a.prototype._next=function(a){var b=this.destination,c;try{c=this.predicate(a,this.index++)}catch(f){b.error(f);return}this.nextOrComplete(a,
c)};a.prototype.nextOrComplete=function(a,b){var c=this.destination;b?c.next(a):c.complete()};return a}(p);g.prototype.takeWhile=function(b){return this.lift(new Oe(b))};var Qe=function(){function b(a){this.durationSelector=a}b.prototype.call=function(a,b){return b.subscribe(new Pe(a,this.durationSelector))};return b}(),Pe=function(b){function a(a,e){b.call(this,a);this.destination=a;this.durationSelector=e}__extends(a,b);a.prototype._next=function(a){this.throttled||this.tryDurationSelector(a)};
a.prototype.tryDurationSelector=function(a){var b=null;try{b=this.durationSelector(a)}catch(d){this.destination.error(d);return}this.emitAndThrottle(a,b)};a.prototype.emitAndThrottle=function(a,b){this.add(this.throttled=q(this,b));this.destination.next(a)};a.prototype._unsubscribe=function(){var a=this.throttled;a&&(this.remove(a),this.throttled=null,a.unsubscribe())};a.prototype.notifyNext=function(a,b,d,f,g){this._unsubscribe()};a.prototype.notifyComplete=function(){this._unsubscribe()};return a}(t);
g.prototype.throttle=function(b){return this.lift(new Qe(b))};var Se=function(){function b(a,b){this.duration=a;this.scheduler=b}b.prototype.call=function(a,b){return b.subscribe(new Re(a,this.duration,this.scheduler))};return b}(),Re=function(b){function a(a,e,d){b.call(this,a);this.duration=e;this.scheduler=d}__extends(a,b);a.prototype._next=function(a){this.throttled||(this.add(this.throttled=this.scheduler.schedule(Nb,this.duration,{subscriber:this})),this.destination.next(a))};a.prototype.clearThrottle=
function(){var a=this.throttled;a&&(a.unsubscribe(),this.remove(a),this.throttled=null)};return a}(p);g.prototype.throttleTime=function(b,a){void 0===a&&(a=C);return this.lift(new Se(b,a))};var fb=function(){return function(b,a){this.value=b;this.interval=a}}(),Ue=function(){function b(a){this.scheduler=a}b.prototype.call=function(a,b){return b.subscribe(new Te(a,this.scheduler))};return b}(),Te=function(b){function a(a,e){b.call(this,a);this.scheduler=e;this.lastTime=0;this.lastTime=e.now()}__extends(a,
b);a.prototype._next=function(a){var b=this.scheduler.now(),c=b-this.lastTime;this.lastTime=b;this.destination.next(new fb(a,c))};return a}(p);g.prototype.timeInterval=function(b){void 0===b&&(b=C);return this.lift(new Ue(b))};var gb=function(b){function a(){var a=b.call(this,"Timeout has occurred");this.name=a.name="TimeoutError";this.stack=a.stack;this.message=a.message}__extends(a,b);return a}(Error),We=function(){function b(a,b,e,d){this.waitFor=a;this.absoluteTimeout=b;this.scheduler=e;this.errorInstance=
d}b.prototype.call=function(a,b){return b.subscribe(new Ve(a,this.absoluteTimeout,this.waitFor,this.scheduler,this.errorInstance))};return b}(),Ve=function(b){function a(a,e,d,f,g){b.call(this,a);this.absoluteTimeout=e;this.waitFor=d;this.scheduler=f;this.errorInstance=g;this._previousIndex=this.index=0;this._hasCompleted=!1;this.scheduleTimeout()}__extends(a,b);Object.defineProperty(a.prototype,"previousIndex",{get:function(){return this._previousIndex},enumerable:!0,configurable:!0});Object.defineProperty(a.prototype,
"hasCompleted",{get:function(){return this._hasCompleted},enumerable:!0,configurable:!0});a.dispatchTimeout=function(a){var b=a.subscriber;a=a.index;b.hasCompleted||b.previousIndex!==a||b.notifyTimeout()};a.prototype.scheduleTimeout=function(){var b=this.index;this.scheduler.schedule(a.dispatchTimeout,this.waitFor,{subscriber:this,index:b});this.index++;this._previousIndex=b};a.prototype._next=function(a){this.destination.next(a);this.absoluteTimeout||this.scheduleTimeout()};a.prototype._error=function(a){this.destination.error(a);
this._hasCompleted=!0};a.prototype._complete=function(){this.destination.complete();this._hasCompleted=!0};a.prototype.notifyTimeout=function(){this.error(this.errorInstance)};return a}(p);g.prototype.timeout=function(b,a){void 0===a&&(a=C);var c=ba(b);b=c?+b-a.now():Math.abs(b);return this.lift(new We(b,c,a,new gb))};var Ye=function(){function b(a,b,e,d){this.waitFor=a;this.absoluteTimeout=b;this.withObservable=e;this.scheduler=d}b.prototype.call=function(a,b){return b.subscribe(new Xe(a,this.absoluteTimeout,
this.waitFor,this.withObservable,this.scheduler))};return b}(),Xe=function(b){function a(a,e,d,f,g){b.call(this);this.destination=a;this.absoluteTimeout=e;this.waitFor=d;this.withObservable=f;this.scheduler=g;this.timeoutSubscription=void 0;this._previousIndex=this.index=0;this._hasCompleted=!1;a.add(this);this.scheduleTimeout()}__extends(a,b);Object.defineProperty(a.prototype,"previousIndex",{get:function(){return this._previousIndex},enumerable:!0,configurable:!0});Object.defineProperty(a.prototype,
"hasCompleted",{get:function(){return this._hasCompleted},enumerable:!0,configurable:!0});a.dispatchTimeout=function(a){var b=a.subscriber;a=a.index;b.hasCompleted||b.previousIndex!==a||b.handleTimeout()};a.prototype.scheduleTimeout=function(){var b=this.index;this.scheduler.schedule(a.dispatchTimeout,this.waitFor,{subscriber:this,index:b});this.index++;this._previousIndex=b};a.prototype._next=function(a){this.destination.next(a);this.absoluteTimeout||this.scheduleTimeout()};a.prototype._error=function(a){this.destination.error(a);
this._hasCompleted=!0};a.prototype._complete=function(){this.destination.complete();this._hasCompleted=!0};a.prototype.handleTimeout=function(){if(!this.closed){var a=this.withObservable;this.unsubscribe();this.destination.add(this.timeoutSubscription=q(this,a))}};return a}(t);g.prototype.timeoutWith=function(b,a,c){void 0===c&&(c=C);var e=ba(b);b=e?+b-c.now():Math.abs(b);return this.lift(new Ye(b,e,a,c))};var hb=function(){return function(b,a){this.value=b;this.timestamp=a}}(),$e=function(){function b(a){this.scheduler=
a}b.prototype.call=function(a,b){return b.subscribe(new Ze(a,this.scheduler))};return b}(),Ze=function(b){function a(a,e){b.call(this,a);this.scheduler=e}__extends(a,b);a.prototype._next=function(a){var b=this.scheduler.now();this.destination.next(new hb(a,b))};return a}(p);g.prototype.timestamp=function(b){void 0===b&&(b=C);return this.lift(new $e(b))};var bf=function(){function b(){}b.prototype.call=function(a,b){return b.subscribe(new af(a))};return b}(),af=function(b){function a(a){b.call(this,
a);this.array=[]}__extends(a,b);a.prototype._next=function(a){this.array.push(a)};a.prototype._complete=function(){this.destination.next(this.array);this.destination.complete()};return a}(p);g.prototype.toArray=function(){return this.lift(new bf)};g.prototype.toPromise=function(b){var a=this;b||(r.Rx&&r.Rx.config&&r.Rx.config.Promise?b=r.Rx.config.Promise:r.Promise&&(b=r.Promise));if(!b)throw Error("no Promise impl found");return new b(function(b,e){var c;a.subscribe(function(a){return c=a},function(a){return e(a)},
function(){return b(c)})})};var df=function(){function b(a){this.windowBoundaries=a}b.prototype.call=function(a,b){a=new cf(a);b=b.subscribe(a);b.closed||a.add(q(a,this.windowBoundaries));return b};return b}(),cf=function(b){function a(a){b.call(this,a);this.window=new y;a.next(this.window)}__extends(a,b);a.prototype.notifyNext=function(a,b,d,f,g){this.openWindow()};a.prototype.notifyError=function(a,b){this._error(a)};a.prototype.notifyComplete=function(a){this._complete()};a.prototype._next=function(a){this.window.next(a)};
a.prototype._error=function(a){this.window.error(a);this.destination.error(a)};a.prototype._complete=function(){this.window.complete();this.destination.complete()};a.prototype._unsubscribe=function(){this.window=null};a.prototype.openWindow=function(){var a=this.window;a&&a.complete();var a=this.destination,b=this.window=new y;a.next(b)};return a}(t);g.prototype.window=function(b){return this.lift(new df(b))};var ff=function(){function b(a,b){this.windowSize=a;this.startWindowEvery=b}b.prototype.call=
function(a,b){return b.subscribe(new ef(a,this.windowSize,this.startWindowEvery))};return b}(),ef=function(b){function a(a,e,d){b.call(this,a);this.destination=a;this.windowSize=e;this.startWindowEvery=d;this.windows=[new y];this.count=0;a.next(this.windows[0])}__extends(a,b);a.prototype._next=function(a){for(var b=0<this.startWindowEvery?this.startWindowEvery:this.windowSize,c=this.destination,f=this.windowSize,g=this.windows,k=g.length,l=0;l<k&&!this.closed;l++)g[l].next(a);a=this.count-f+1;0<=
a&&0===a%b&&!this.closed&&g.shift().complete();0!==++this.count%b||this.closed||(b=new y,g.push(b),c.next(b))};a.prototype._error=function(a){var b=this.windows;if(b)for(;0<b.length&&!this.closed;)b.shift().error(a);this.destination.error(a)};a.prototype._complete=function(){var a=this.windows;if(a)for(;0<a.length&&!this.closed;)a.shift().complete();this.destination.complete()};a.prototype._unsubscribe=function(){this.count=0;this.windows=null};return a}(p);g.prototype.windowCount=function(b,a){void 0===
a&&(a=0);return this.lift(new ff(b,a))};var hf=function(){function b(a,b,e){this.windowTimeSpan=a;this.windowCreationInterval=b;this.scheduler=e}b.prototype.call=function(a,b){return b.subscribe(new gf(a,this.windowTimeSpan,this.windowCreationInterval,this.scheduler))};return b}(),gf=function(b){function a(a,e,d,f){b.call(this,a);this.destination=a;this.windowTimeSpan=e;this.windowCreationInterval=d;this.scheduler=f;this.windows=[];if(null!==d&&0<=d){a={subscriber:this,window:this.openWindow(),context:null};
var c={windowTimeSpan:e,windowCreationInterval:d,subscriber:this,scheduler:f};this.add(f.schedule(La,e,a));this.add(f.schedule(Pb,d,c))}else d={subscriber:this,window:this.openWindow(),windowTimeSpan:e},this.add(f.schedule(Ob,e,d))}__extends(a,b);a.prototype._next=function(a){for(var b=this.windows,c=b.length,f=0;f<c;f++){var g=b[f];g.closed||g.next(a)}};a.prototype._error=function(a){for(var b=this.windows;0<b.length;)b.shift().error(a);this.destination.error(a)};a.prototype._complete=function(){for(var a=
this.windows;0<a.length;){var b=a.shift();b.closed||b.complete()}this.destination.complete()};a.prototype.openWindow=function(){var a=new y;this.windows.push(a);this.destination.next(a);return a};a.prototype.closeWindow=function(a){a.complete();var b=this.windows;b.splice(b.indexOf(a),1)};return a}(p);g.prototype.windowTime=function(b,a,c){void 0===a&&(a=null);void 0===c&&(c=C);return this.lift(new hf(b,a,c))};var kf=function(){function b(a,b){this.openings=a;this.closingSelector=b}b.prototype.call=
function(a,b){return b.subscribe(new jf(a,this.openings,this.closingSelector))};return b}(),jf=function(b){function a(a,e,d){b.call(this,a);this.openings=e;this.closingSelector=d;this.contexts=[];this.add(this.openSubscription=q(this,e,e))}__extends(a,b);a.prototype._next=function(a){var b=this.contexts;if(b)for(var c=b.length,f=0;f<c;f++)b[f].window.next(a)};a.prototype._error=function(a){var c=this.contexts;this.contexts=null;if(c)for(var d=c.length,f=-1;++f<d;){var g=c[f];g.window.error(a);g.subscription.unsubscribe()}b.prototype._error.call(this,
a)};a.prototype._complete=function(){var a=this.contexts;this.contexts=null;if(a)for(var e=a.length,d=-1;++d<e;){var f=a[d];f.window.complete();f.subscription.unsubscribe()}b.prototype._complete.call(this)};a.prototype._unsubscribe=function(){var a=this.contexts;this.contexts=null;if(a)for(var b=a.length,d=-1;++d<b;){var f=a[d];f.window.unsubscribe();f.subscription.unsubscribe()}};a.prototype.notifyNext=function(a,b,d,f,g){if(a===this.openings){f=k(this.closingSelector)(b);if(f===n)return this.error(n.e);
a=new y;b=new x;d={window:a,subscription:b};this.contexts.push(d);f=q(this,f,d);f.closed?this.closeWindow(this.contexts.length-1):(f.context=d,b.add(f));this.destination.next(a)}else this.closeWindow(this.contexts.indexOf(a))};a.prototype.notifyError=function(a){this.error(a)};a.prototype.notifyComplete=function(a){a!==this.openSubscription&&this.closeWindow(this.contexts.indexOf(a.context))};a.prototype.closeWindow=function(a){if(-1!==a){var b=this.contexts,c=b[a],f=c.window,c=c.subscription;b.splice(a,
1);f.complete();c.unsubscribe()}};return a}(t);g.prototype.windowToggle=function(b,a){return this.lift(new kf(b,a))};var mf=function(){function b(a){this.closingSelector=a}b.prototype.call=function(a,b){return b.subscribe(new lf(a,this.closingSelector))};return b}(),lf=function(b){function a(a,e){b.call(this,a);this.destination=a;this.closingSelector=e;this.openWindow()}__extends(a,b);a.prototype.notifyNext=function(a,b,d,f,g){this.openWindow(g)};a.prototype.notifyError=function(a,b){this._error(a)};
a.prototype.notifyComplete=function(a){this.openWindow(a)};a.prototype._next=function(a){this.window.next(a)};a.prototype._error=function(a){this.window.error(a);this.destination.error(a);this.unsubscribeClosingNotification()};a.prototype._complete=function(){this.window.complete();this.destination.complete();this.unsubscribeClosingNotification()};a.prototype.unsubscribeClosingNotification=function(){this.closingNotification&&this.closingNotification.unsubscribe()};a.prototype.openWindow=function(a){void 0===
a&&(a=null);a&&(this.remove(a),a.unsubscribe());(a=this.window)&&a.complete();a=this.window=new y;this.destination.next(a);a=k(this.closingSelector)();a===n?(a=n.e,this.destination.error(a),this.window.error(a)):this.add(this.closingNotification=q(this,a))};return a}(t);g.prototype.windowWhen=function(b){return this.lift(new mf(b))};var of=function(){function b(a,b){this.observables=a;this.project=b}b.prototype.call=function(a,b){return b.subscribe(new nf(a,this.observables,this.project))};return b}(),
nf=function(b){function a(a,e,d){b.call(this,a);this.observables=e;this.project=d;this.toRespond=[];a=e.length;this.values=Array(a);for(d=0;d<a;d++)this.toRespond.push(d);for(d=0;d<a;d++){var c=e[d];this.add(q(this,c,c,d))}}__extends(a,b);a.prototype.notifyNext=function(a,b,d,f,g){this.values[d]=b;a=this.toRespond;0<a.length&&(d=a.indexOf(d),-1!==d&&a.splice(d,1))};a.prototype.notifyComplete=function(){};a.prototype._next=function(a){0===this.toRespond.length&&(a=[a].concat(this.values),this.project?
this._tryProject(a):this.destination.next(a))};a.prototype._tryProject=function(a){var b;try{b=this.project.apply(this,a)}catch(d){this.destination.error(d);return}this.destination.next(b)};return a}(t);g.prototype.withLatestFrom=function(){for(var b=[],a=0;a<arguments.length;a++)b[a-0]=arguments[a];var c;"function"===typeof b[b.length-1]&&(c=b.pop());return this.lift(new of(b,c))};g.prototype.zip=function(){for(var b=[],a=0;a<arguments.length;a++)b[a-0]=arguments[a];return this.lift.call(va.apply(void 0,
[this].concat(b)))};g.prototype.zipAll=function(b){return this.lift(new wa(b))};var Y=function(){return function(b,a){void 0===a&&(a=Number.POSITIVE_INFINITY);this.subscribedFrame=b;this.unsubscribedFrame=a}}(),ib=function(){function b(){this.subscriptions=[]}b.prototype.logSubscribedFrame=function(){this.subscriptions.push(new Y(this.scheduler.now()));return this.subscriptions.length-1};b.prototype.logUnsubscribedFrame=function(a){var b=this.subscriptions;b[a]=new Y(b[a].subscribedFrame,this.scheduler.now())};
return b}(),pa=function(b){function a(a,e){b.call(this,function(a){var b=this,c=b.logSubscribedFrame();a.add(new x(function(){b.logUnsubscribedFrame(c)}));b.scheduleMessages(a);return a});this.messages=a;this.subscriptions=[];this.scheduler=e}__extends(a,b);a.prototype.scheduleMessages=function(a){for(var b=this.messages.length,c=0;c<b;c++){var f=this.messages[c];a.add(this.scheduler.schedule(function(a){a.message.notification.observe(a.subscriber)},f.frame,{message:f,subscriber:a}))}};return a}(g);
Ma(pa,[ib]);var jb=function(b){function a(a,e){b.call(this);this.messages=a;this.subscriptions=[];this.scheduler=e}__extends(a,b);a.prototype._subscribe=function(a){var c=this,d=c.logSubscribedFrame();a.add(new x(function(){c.logUnsubscribedFrame(d)}));return b.prototype._subscribe.call(this,a)};a.prototype.setup=function(){for(var a=this,b=a.messages.length,d=0;d<b;d++)(function(){var b=a.messages[d];a.scheduler.schedule(function(){b.notification.observe(a)},b.frame)})()};return a}(y);Ma(jb,[ib]);
var lb=function(b){function a(a,e){var c=this;void 0===a&&(a=kb);void 0===e&&(e=Number.POSITIVE_INFINITY);b.call(this,a,function(){return c.frame});this.maxFrames=e;this.frame=0;this.index=-1}__extends(a,b);a.prototype.flush=function(){for(var a=this.actions,b=this.maxFrames,d,f;(f=a.shift())&&(this.frame=f.delay)<=b&&!(d=f.execute(f.state,f.delay)););if(d){for(;f=a.shift();)f.unsubscribe();throw d;}};a.frameTimeFactor=10;return a}(V),kb=function(b){function a(a,e,d){void 0===d&&(d=a.index+=1);b.call(this,
a,e);this.scheduler=a;this.work=e;this.index=d;this.index=a.index=d}__extends(a,b);a.prototype.schedule=function(c,e){void 0===e&&(e=0);return this.id?this.add(new a(this.scheduler,this.work)).schedule(c,e):b.prototype.schedule.call(this,c,e)};a.prototype.requestAsyncId=function(b,e,d){void 0===d&&(d=0);this.delay=b.frame+d;b=b.actions;b.push(this);b.sort(a.sortActions);return!0};a.prototype.recycleAsyncId=function(a,b,d){};a.sortActions=function(a,b){return a.delay===b.delay?a.index===b.index?0:
a.index>b.index?1:-1:a.delay>b.delay?1:-1};return a}(U),pf=function(b){function a(a){b.call(this,kb,750);this.assertDeepEqual=a;this.hotObservables=[];this.coldObservables=[];this.flushTests=[]}__extends(a,b);a.prototype.createTime=function(b){b=b.indexOf("|");if(-1===b)throw Error('marble diagram for time should have a completion marker "|"');return b*a.frameTimeFactor};a.prototype.createColdObservable=function(b,e,d){if(-1!==b.indexOf("^"))throw Error('cold observable cannot have subscription offset "^"');
if(-1!==b.indexOf("!"))throw Error('cold observable cannot have unsubscription marker "!"');b=a.parseMarbles(b,e,d);b=new pa(b,this);this.coldObservables.push(b);return b};a.prototype.createHotObservable=function(b,e,d){if(-1!==b.indexOf("!"))throw Error('hot observable cannot have unsubscription marker "!"');b=a.parseMarbles(b,e,d);b=new jb(b,this);this.hotObservables.push(b);return b};a.prototype.materializeInnerObservable=function(a,b){var c=this,e=[];a.subscribe(function(a){e.push({frame:c.frame-
b,notification:z.createNext(a)})},function(a){e.push({frame:c.frame-b,notification:z.createError(a)})},function(){e.push({frame:c.frame-b,notification:z.createComplete()})});return e};a.prototype.expectObservable=function(b,e){var c=this;void 0===e&&(e=null);var f=[],h={actual:f,ready:!1};e=a.parseMarblesAsSubscriptions(e).unsubscribedFrame;var k;this.schedule(function(){k=b.subscribe(function(a){var b=a;a instanceof g&&(b=c.materializeInnerObservable(b,c.frame));f.push({frame:c.frame,notification:z.createNext(b)})},
function(a){f.push({frame:c.frame,notification:z.createError(a)})},function(){f.push({frame:c.frame,notification:z.createComplete()})})},0);e!==Number.POSITIVE_INFINITY&&this.schedule(function(){return k.unsubscribe()},e);this.flushTests.push(h);return{toBe:function(b,c,d){h.ready=!0;h.expected=a.parseMarbles(b,c,d,!0)}}};a.prototype.expectSubscriptions=function(b){var c={actual:b,ready:!1};this.flushTests.push(c);return{toBe:function(b){b="string"===typeof b?[b]:b;c.ready=!0;c.expected=b.map(function(b){return a.parseMarblesAsSubscriptions(b)})}}};
a.prototype.flush=function(){for(var a=this.hotObservables;0<a.length;)a.shift().setup();b.prototype.flush.call(this);for(a=this.flushTests.filter(function(a){return a.ready});0<a.length;){var e=a.shift();this.assertDeepEqual(e.actual,e.expected)}};a.parseMarblesAsSubscriptions=function(a){if("string"!==typeof a)return new Y(Number.POSITIVE_INFINITY);for(var b=a.length,c=-1,f=Number.POSITIVE_INFINITY,g=Number.POSITIVE_INFINITY,k=0;k<b;k++){var l=k*this.frameTimeFactor,m=a[k];switch(m){case "-":case " ":break;
case "(":c=l;break;case ")":c=-1;break;case "^":if(f!==Number.POSITIVE_INFINITY)throw Error("found a second subscription point '^' in a subscription marble diagram. There can only be one.");f=-1<c?c:l;break;case "!":if(g!==Number.POSITIVE_INFINITY)throw Error("found a second subscription point '^' in a subscription marble diagram. There can only be one.");g=-1<c?c:l;break;default:throw Error("there can only be '^' and '!' markers in a subscription marble diagram. Found instead '"+m+"'.");}}return 0>
g?new Y(f):new Y(f,g)};a.parseMarbles=function(a,b,d,f){void 0===f&&(f=!1);if(-1!==a.indexOf("!"))throw Error('conventional marble diagrams cannot have the unsubscription marker "!"');for(var c=a.length,e=[],g=a.indexOf("^"),g=-1===g?0:g*-this.frameTimeFactor,k="object"!==typeof b?function(a){return a}:function(a){return f&&b[a]instanceof pa?b[a].messages:b[a]},l=-1,m=0;m<c;m++){var p=m*this.frameTimeFactor+g,n=void 0,q=a[m];switch(q){case "-":case " ":break;case "(":l=p;break;case ")":l=-1;break;
case "|":n=z.createComplete();break;case "^":break;case "#":n=z.createError(d||"error");break;default:n=z.createNext(k(q))}n&&e.push({frame:-1<l?l:p,notification:n})}return e};return a}(lb),mb=new (function(){return function(b){b.requestAnimationFrame?(this.cancelAnimationFrame=b.cancelAnimationFrame.bind(b),this.requestAnimationFrame=b.requestAnimationFrame.bind(b)):b.mozRequestAnimationFrame?(this.cancelAnimationFrame=b.mozCancelAnimationFrame.bind(b),this.requestAnimationFrame=b.mozRequestAnimationFrame.bind(b)):
b.webkitRequestAnimationFrame?(this.cancelAnimationFrame=b.webkitCancelAnimationFrame.bind(b),this.requestAnimationFrame=b.webkitRequestAnimationFrame.bind(b)):b.msRequestAnimationFrame?(this.cancelAnimationFrame=b.msCancelAnimationFrame.bind(b),this.requestAnimationFrame=b.msRequestAnimationFrame.bind(b)):b.oRequestAnimationFrame?(this.cancelAnimationFrame=b.oCancelAnimationFrame.bind(b),this.requestAnimationFrame=b.oRequestAnimationFrame.bind(b)):(this.cancelAnimationFrame=b.clearTimeout.bind(b),
this.requestAnimationFrame=function(a){return b.setTimeout(a,1E3/60)})}}())(r),qf=function(b){function a(a,e){b.call(this,a,e);this.scheduler=a;this.work=e}__extends(a,b);a.prototype.requestAsyncId=function(a,e,d){void 0===d&&(d=0);if(null!==d&&0<d)return b.prototype.requestAsyncId.call(this,a,e,d);a.actions.push(this);return a.scheduled||(a.scheduled=mb.requestAnimationFrame(a.flush.bind(a,null)))};a.prototype.recycleAsyncId=function(a,e,d){void 0===d&&(d=0);if(null!==d&&0<d||null===d&&0<this.delay)return b.prototype.recycleAsyncId.call(this,
a,e,d);0===a.actions.length&&(mb.cancelAnimationFrame(e),a.scheduled=void 0)};return a}(U),rf=new (function(b){function a(){b.apply(this,arguments)}__extends(a,b);a.prototype.flush=function(a){this.active=!0;this.scheduled=void 0;var b=this.actions,c,f=-1,g=b.length;a=a||b.shift();do if(c=a.execute(a.state,a.delay))break;while(++f<g&&(a=b.shift()));this.active=!1;if(c){for(;++f<g&&(a=b.shift());)a.unsubscribe();throw c;}};return a}(V))(qf),sf={rxSubscriber:T,observable:M,iterator:I};l.Scheduler={asap:fa,
queue:Za,animationFrame:rf,async:C};l.Symbol=sf;l.Subject=y;l.AnonymousSubject=ca;l.Observable=g;l.Subscription=x;l.Subscriber=p;l.AsyncSubject=P;l.ReplaySubject=R;l.BehaviorSubject=cb;l.ConnectableObservable=X;l.Notification=z;l.EmptyError=ea;l.ArgumentOutOfRangeError=W;l.ObjectUnsubscribedError=O;l.TimeoutError=gb;l.UnsubscriptionError=ia;l.TimeInterval=fb;l.Timestamp=hb;l.TestScheduler=pf;l.VirtualTimeScheduler=lb;l.AjaxResponse=Xa;l.AjaxError=da;l.AjaxTimeoutError=Ya;Object.defineProperty(l,"__esModule",
{value:!0})});





function Trianglify(f){function e(f,e){return"undefined"!=typeof f?f:e}"undefined"==typeof f&&(f={}),this.options={cellsize:e(f.cellsize,150),bleed:e(f.cellsize,150),cellpadding:e(f.cellpadding,.1*f.cellsize||15),noiseIntensity:e(f.noiseIntensity,0),x_gradient:e(f.x_gradient,Trianglify.randomColor()),format:e(f.format,"svg"),fillOpacity:e(f.fillOpacity,1),strokeOpacity:e(f.strokeOpacity,1)},this.options.y_gradient=f.y_gradient||this.options.x_gradient.map(function(f){return d3.rgb(f).brighter(.5)})}"undefined"!=typeof module&&module.exports&&(d3=require("d3"),jsdom=require("jsdom"),document=new(jsdom.level(1,"core").Document),XMLSerializer=require("xmldom").XMLSerializer,btoa=require("btoa"),module.exports=Trianglify),Trianglify.randomColor=function(){var f=Object.keys(Trianglify.colorbrewer),e=Trianglify.colorbrewer[f[Math.floor(Math.random()*f.length)]];f=Object.keys(e);var d=e[f[Math.floor(Math.random()*f.length)]];return d},Trianglify.prototype.generate=function(f,e){return new Trianglify.Pattern(this.options,f,e)},Trianglify.Pattern=function(f,e,d){this.options=f,this.width=e,this.height=d,this.polys=this.generatePolygons(),this.svg=this.generateSVG();var a=new XMLSerializer;this.svgString=a.serializeToString(this.svg),this.base64=btoa(this.svgString),this.dataUri="data:image/svg+xml;base64,"+this.base64,this.dataUrl="url("+this.dataUri+")"},Trianglify.Pattern.prototype.append=function(){document.body.appendChild(this.svg)},Trianglify.Pattern.gradient_2d=function(f,e,d,a){return function(c,b){var t=d3.scale.linear().range(f).domain(d3.range(0,d,d/f.length)),i=d3.scale.linear().range(e).domain(d3.range(0,a,a/e.length));return d3.interpolateRgb(t(c),i(b))(.5)}},Trianglify.Pattern.prototype.generatePolygons=function(){var f=this.options,e=Math.ceil((this.width+2*f.bleed)/f.cellsize),d=Math.ceil((this.height+2*f.bleed)/f.cellsize),a=d3.range(e*d).map(function(d){var a=d%e,c=Math.floor(d/e),b=Math.round(-f.bleed+a*f.cellsize+Math.random()*(f.cellsize-2*f.cellpadding)+f.cellpadding),t=Math.round(-f.bleed+c*f.cellsize+Math.random()*(f.cellsize-2*f.cellpadding)+f.cellpadding);return[b,t]});return d3.geom.voronoi().triangles(a)},Trianglify.Pattern.prototype.generateSVG=function(){var f=this.options,e=Trianglify.Pattern.gradient_2d(f.x_gradient,f.y_gradient,this.width,this.height),d=document.createElementNS("http://www.w3.org/2000/svg","svg"),a=d3.select(d);a.attr("width",this.width),a.attr("height",this.height),a.attr("xmlns","http://www.w3.org/2000/svg");var c=a.append("g");if(f.noiseIntensity>.01){var b=a.append("filter").attr("id","noise");b.append("feTurbulence").attr("type","fractalNoise").attr("in","fillPaint").attr("fill","#F00").attr("baseFrequency",.7).attr("numOctaves","3").attr("stitchTiles","stitch");var t=b.append("feComponentTransfer");t.append("feFuncR").attr("type","linear").attr("slope","2").attr("intercept","-.5"),t.append("feFuncG").attr("type","linear").attr("slope","2").attr("intercept","-.5"),t.append("feFuncB").attr("type","linear").attr("slope","2").attr("intercept","-.5"),b.append("feColorMatrix").attr("type","matrix").attr("values","0.3333 0.3333 0.3333 0 0 \n 0.3333 0.3333 0.3333 0 0 \n 0.3333 0.3333 0.3333 0 0 \n 0 0 0 1 0"),a.append("rect").attr("opacity",f.noiseIntensity).attr("width","100%").attr("height","100%").attr("filter","url(#noise)")}return this.polys.forEach(function(d){var a=(d[0][0]+d[1][0]+d[2][0])/3,b=(d[0][1]+d[1][1]+d[2][1])/3,t=e(a,b),i=c.append("path").attr("d","M"+d.join("L")+"Z").attr({fill:t,stroke:t});1!=f.fillOpacity&&i.attr("fill-opacity",f.fillOpacity),1!=f.strokeOpacity&&i.attr("stroke-opacity",f.strokeOpacity)}),a.node()},Trianglify.Pattern.prototype.append=function(){document.body.appendChild(this.svg)},Trianglify.colorbrewer={YlGn:{3:["#f7fcb9","#addd8e","#31a354"],4:["#ffffcc","#c2e699","#78c679","#238443"],5:["#ffffcc","#c2e699","#78c679","#31a354","#006837"],6:["#ffffcc","#d9f0a3","#addd8e","#78c679","#31a354","#006837"],7:["#ffffcc","#d9f0a3","#addd8e","#78c679","#41ab5d","#238443","#005a32"],8:["#ffffe5","#f7fcb9","#d9f0a3","#addd8e","#78c679","#41ab5d","#238443","#005a32"],9:["#ffffe5","#f7fcb9","#d9f0a3","#addd8e","#78c679","#41ab5d","#238443","#006837","#004529"]},YlGnBu:{3:["#edf8b1","#7fcdbb","#2c7fb8"],4:["#ffffcc","#a1dab4","#41b6c4","#225ea8"],5:["#ffffcc","#a1dab4","#41b6c4","#2c7fb8","#253494"],6:["#ffffcc","#c7e9b4","#7fcdbb","#41b6c4","#2c7fb8","#253494"],7:["#ffffcc","#c7e9b4","#7fcdbb","#41b6c4","#1d91c0","#225ea8","#0c2c84"],8:["#ffffd9","#edf8b1","#c7e9b4","#7fcdbb","#41b6c4","#1d91c0","#225ea8","#0c2c84"],9:["#ffffd9","#edf8b1","#c7e9b4","#7fcdbb","#41b6c4","#1d91c0","#225ea8","#253494","#081d58"]},GnBu:{3:["#e0f3db","#a8ddb5","#43a2ca"],4:["#f0f9e8","#bae4bc","#7bccc4","#2b8cbe"],5:["#f0f9e8","#bae4bc","#7bccc4","#43a2ca","#0868ac"],6:["#f0f9e8","#ccebc5","#a8ddb5","#7bccc4","#43a2ca","#0868ac"],7:["#f0f9e8","#ccebc5","#a8ddb5","#7bccc4","#4eb3d3","#2b8cbe","#08589e"],8:["#f7fcf0","#e0f3db","#ccebc5","#a8ddb5","#7bccc4","#4eb3d3","#2b8cbe","#08589e"],9:["#f7fcf0","#e0f3db","#ccebc5","#a8ddb5","#7bccc4","#4eb3d3","#2b8cbe","#0868ac","#084081"]},BuGn:{3:["#e5f5f9","#99d8c9","#2ca25f"],4:["#edf8fb","#b2e2e2","#66c2a4","#238b45"],5:["#edf8fb","#b2e2e2","#66c2a4","#2ca25f","#006d2c"],6:["#edf8fb","#ccece6","#99d8c9","#66c2a4","#2ca25f","#006d2c"],7:["#edf8fb","#ccece6","#99d8c9","#66c2a4","#41ae76","#238b45","#005824"],8:["#f7fcfd","#e5f5f9","#ccece6","#99d8c9","#66c2a4","#41ae76","#238b45","#005824"],9:["#f7fcfd","#e5f5f9","#ccece6","#99d8c9","#66c2a4","#41ae76","#238b45","#006d2c","#00441b"]},PuBuGn:{3:["#ece2f0","#a6bddb","#1c9099"],4:["#f6eff7","#bdc9e1","#67a9cf","#02818a"],5:["#f6eff7","#bdc9e1","#67a9cf","#1c9099","#016c59"],6:["#f6eff7","#d0d1e6","#a6bddb","#67a9cf","#1c9099","#016c59"],7:["#f6eff7","#d0d1e6","#a6bddb","#67a9cf","#3690c0","#02818a","#016450"],8:["#fff7fb","#ece2f0","#d0d1e6","#a6bddb","#67a9cf","#3690c0","#02818a","#016450"],9:["#fff7fb","#ece2f0","#d0d1e6","#a6bddb","#67a9cf","#3690c0","#02818a","#016c59","#014636"]},PuBu:{3:["#ece7f2","#a6bddb","#2b8cbe"],4:["#f1eef6","#bdc9e1","#74a9cf","#0570b0"],5:["#f1eef6","#bdc9e1","#74a9cf","#2b8cbe","#045a8d"],6:["#f1eef6","#d0d1e6","#a6bddb","#74a9cf","#2b8cbe","#045a8d"],7:["#f1eef6","#d0d1e6","#a6bddb","#74a9cf","#3690c0","#0570b0","#034e7b"],8:["#fff7fb","#ece7f2","#d0d1e6","#a6bddb","#74a9cf","#3690c0","#0570b0","#034e7b"],9:["#fff7fb","#ece7f2","#d0d1e6","#a6bddb","#74a9cf","#3690c0","#0570b0","#045a8d","#023858"]},BuPu:{3:["#e0ecf4","#9ebcda","#8856a7"],4:["#edf8fb","#b3cde3","#8c96c6","#88419d"],5:["#edf8fb","#b3cde3","#8c96c6","#8856a7","#810f7c"],6:["#edf8fb","#bfd3e6","#9ebcda","#8c96c6","#8856a7","#810f7c"],7:["#edf8fb","#bfd3e6","#9ebcda","#8c96c6","#8c6bb1","#88419d","#6e016b"],8:["#f7fcfd","#e0ecf4","#bfd3e6","#9ebcda","#8c96c6","#8c6bb1","#88419d","#6e016b"],9:["#f7fcfd","#e0ecf4","#bfd3e6","#9ebcda","#8c96c6","#8c6bb1","#88419d","#810f7c","#4d004b"]},RdPu:{3:["#fde0dd","#fa9fb5","#c51b8a"],4:["#feebe2","#fbb4b9","#f768a1","#ae017e"],5:["#feebe2","#fbb4b9","#f768a1","#c51b8a","#7a0177"],6:["#feebe2","#fcc5c0","#fa9fb5","#f768a1","#c51b8a","#7a0177"],7:["#feebe2","#fcc5c0","#fa9fb5","#f768a1","#dd3497","#ae017e","#7a0177"],8:["#fff7f3","#fde0dd","#fcc5c0","#fa9fb5","#f768a1","#dd3497","#ae017e","#7a0177"],9:["#fff7f3","#fde0dd","#fcc5c0","#fa9fb5","#f768a1","#dd3497","#ae017e","#7a0177","#49006a"]},PuRd:{3:["#e7e1ef","#c994c7","#dd1c77"],4:["#f1eef6","#d7b5d8","#df65b0","#ce1256"],5:["#f1eef6","#d7b5d8","#df65b0","#dd1c77","#980043"],6:["#f1eef6","#d4b9da","#c994c7","#df65b0","#dd1c77","#980043"],7:["#f1eef6","#d4b9da","#c994c7","#df65b0","#e7298a","#ce1256","#91003f"],8:["#f7f4f9","#e7e1ef","#d4b9da","#c994c7","#df65b0","#e7298a","#ce1256","#91003f"],9:["#f7f4f9","#e7e1ef","#d4b9da","#c994c7","#df65b0","#e7298a","#ce1256","#980043","#67001f"]},OrRd:{3:["#fee8c8","#fdbb84","#e34a33"],4:["#fef0d9","#fdcc8a","#fc8d59","#d7301f"],5:["#fef0d9","#fdcc8a","#fc8d59","#e34a33","#b30000"],6:["#fef0d9","#fdd49e","#fdbb84","#fc8d59","#e34a33","#b30000"],7:["#fef0d9","#fdd49e","#fdbb84","#fc8d59","#ef6548","#d7301f","#990000"],8:["#fff7ec","#fee8c8","#fdd49e","#fdbb84","#fc8d59","#ef6548","#d7301f","#990000"],9:["#fff7ec","#fee8c8","#fdd49e","#fdbb84","#fc8d59","#ef6548","#d7301f","#b30000","#7f0000"]},YlOrRd:{3:["#ffeda0","#feb24c","#f03b20"],4:["#ffffb2","#fecc5c","#fd8d3c","#e31a1c"],5:["#ffffb2","#fecc5c","#fd8d3c","#f03b20","#bd0026"],6:["#ffffb2","#fed976","#feb24c","#fd8d3c","#f03b20","#bd0026"],7:["#ffffb2","#fed976","#feb24c","#fd8d3c","#fc4e2a","#e31a1c","#b10026"],8:["#ffffcc","#ffeda0","#fed976","#feb24c","#fd8d3c","#fc4e2a","#e31a1c","#b10026"],9:["#ffffcc","#ffeda0","#fed976","#feb24c","#fd8d3c","#fc4e2a","#e31a1c","#bd0026","#800026"]},YlOrBr:{3:["#fff7bc","#fec44f","#d95f0e"],4:["#ffffd4","#fed98e","#fe9929","#cc4c02"],5:["#ffffd4","#fed98e","#fe9929","#d95f0e","#993404"],6:["#ffffd4","#fee391","#fec44f","#fe9929","#d95f0e","#993404"],7:["#ffffd4","#fee391","#fec44f","#fe9929","#ec7014","#cc4c02","#8c2d04"],8:["#ffffe5","#fff7bc","#fee391","#fec44f","#fe9929","#ec7014","#cc4c02","#8c2d04"],9:["#ffffe5","#fff7bc","#fee391","#fec44f","#fe9929","#ec7014","#cc4c02","#993404","#662506"]},Purples:{3:["#efedf5","#bcbddc","#756bb1"],4:["#f2f0f7","#cbc9e2","#9e9ac8","#6a51a3"],5:["#f2f0f7","#cbc9e2","#9e9ac8","#756bb1","#54278f"],6:["#f2f0f7","#dadaeb","#bcbddc","#9e9ac8","#756bb1","#54278f"],7:["#f2f0f7","#dadaeb","#bcbddc","#9e9ac8","#807dba","#6a51a3","#4a1486"],8:["#fcfbfd","#efedf5","#dadaeb","#bcbddc","#9e9ac8","#807dba","#6a51a3","#4a1486"],9:["#fcfbfd","#efedf5","#dadaeb","#bcbddc","#9e9ac8","#807dba","#6a51a3","#54278f","#3f007d"]},Blues:{3:["#deebf7","#9ecae1","#3182bd"],4:["#eff3ff","#bdd7e7","#6baed6","#2171b5"],5:["#eff3ff","#bdd7e7","#6baed6","#3182bd","#08519c"],6:["#eff3ff","#c6dbef","#9ecae1","#6baed6","#3182bd","#08519c"],7:["#eff3ff","#c6dbef","#9ecae1","#6baed6","#4292c6","#2171b5","#084594"],8:["#f7fbff","#deebf7","#c6dbef","#9ecae1","#6baed6","#4292c6","#2171b5","#084594"],9:["#f7fbff","#deebf7","#c6dbef","#9ecae1","#6baed6","#4292c6","#2171b5","#08519c","#08306b"]},Greens:{3:["#e5f5e0","#a1d99b","#31a354"],4:["#edf8e9","#bae4b3","#74c476","#238b45"],5:["#edf8e9","#bae4b3","#74c476","#31a354","#006d2c"],6:["#edf8e9","#c7e9c0","#a1d99b","#74c476","#31a354","#006d2c"],7:["#edf8e9","#c7e9c0","#a1d99b","#74c476","#41ab5d","#238b45","#005a32"],8:["#f7fcf5","#e5f5e0","#c7e9c0","#a1d99b","#74c476","#41ab5d","#238b45","#005a32"],9:["#f7fcf5","#e5f5e0","#c7e9c0","#a1d99b","#74c476","#41ab5d","#238b45","#006d2c","#00441b"]},Oranges:{3:["#fee6ce","#fdae6b","#e6550d"],4:["#feedde","#fdbe85","#fd8d3c","#d94701"],5:["#feedde","#fdbe85","#fd8d3c","#e6550d","#a63603"],6:["#feedde","#fdd0a2","#fdae6b","#fd8d3c","#e6550d","#a63603"],7:["#feedde","#fdd0a2","#fdae6b","#fd8d3c","#f16913","#d94801","#8c2d04"],8:["#fff5eb","#fee6ce","#fdd0a2","#fdae6b","#fd8d3c","#f16913","#d94801","#8c2d04"],9:["#fff5eb","#fee6ce","#fdd0a2","#fdae6b","#fd8d3c","#f16913","#d94801","#a63603","#7f2704"]},Reds:{3:["#fee0d2","#fc9272","#de2d26"],4:["#fee5d9","#fcae91","#fb6a4a","#cb181d"],5:["#fee5d9","#fcae91","#fb6a4a","#de2d26","#a50f15"],6:["#fee5d9","#fcbba1","#fc9272","#fb6a4a","#de2d26","#a50f15"],7:["#fee5d9","#fcbba1","#fc9272","#fb6a4a","#ef3b2c","#cb181d","#99000d"],8:["#fff5f0","#fee0d2","#fcbba1","#fc9272","#fb6a4a","#ef3b2c","#cb181d","#99000d"],9:["#fff5f0","#fee0d2","#fcbba1","#fc9272","#fb6a4a","#ef3b2c","#cb181d","#a50f15","#67000d"]},Greys:{3:["#f0f0f0","#bdbdbd","#636363"],4:["#f7f7f7","#cccccc","#969696","#525252"],5:["#f7f7f7","#cccccc","#969696","#636363","#252525"],6:["#f7f7f7","#d9d9d9","#bdbdbd","#969696","#636363","#252525"],7:["#f7f7f7","#d9d9d9","#bdbdbd","#969696","#737373","#525252","#252525"],8:["#ffffff","#f0f0f0","#d9d9d9","#bdbdbd","#969696","#737373","#525252","#252525"],9:["#ffffff","#f0f0f0","#d9d9d9","#bdbdbd","#969696","#737373","#525252","#252525","#000000"]},PuOr:{3:["#f1a340","#f7f7f7","#998ec3"],4:["#e66101","#fdb863","#b2abd2","#5e3c99"],5:["#e66101","#fdb863","#f7f7f7","#b2abd2","#5e3c99"],6:["#b35806","#f1a340","#fee0b6","#d8daeb","#998ec3","#542788"],7:["#b35806","#f1a340","#fee0b6","#f7f7f7","#d8daeb","#998ec3","#542788"],8:["#b35806","#e08214","#fdb863","#fee0b6","#d8daeb","#b2abd2","#8073ac","#542788"],9:["#b35806","#e08214","#fdb863","#fee0b6","#f7f7f7","#d8daeb","#b2abd2","#8073ac","#542788"],10:["#7f3b08","#b35806","#e08214","#fdb863","#fee0b6","#d8daeb","#b2abd2","#8073ac","#542788","#2d004b"],11:["#7f3b08","#b35806","#e08214","#fdb863","#fee0b6","#f7f7f7","#d8daeb","#b2abd2","#8073ac","#542788","#2d004b"]},BrBG:{3:["#d8b365","#f5f5f5","#5ab4ac"],4:["#a6611a","#dfc27d","#80cdc1","#018571"],5:["#a6611a","#dfc27d","#f5f5f5","#80cdc1","#018571"],6:["#8c510a","#d8b365","#f6e8c3","#c7eae5","#5ab4ac","#01665e"],7:["#8c510a","#d8b365","#f6e8c3","#f5f5f5","#c7eae5","#5ab4ac","#01665e"],8:["#8c510a","#bf812d","#dfc27d","#f6e8c3","#c7eae5","#80cdc1","#35978f","#01665e"],9:["#8c510a","#bf812d","#dfc27d","#f6e8c3","#f5f5f5","#c7eae5","#80cdc1","#35978f","#01665e"],10:["#543005","#8c510a","#bf812d","#dfc27d","#f6e8c3","#c7eae5","#80cdc1","#35978f","#01665e","#003c30"],11:["#543005","#8c510a","#bf812d","#dfc27d","#f6e8c3","#f5f5f5","#c7eae5","#80cdc1","#35978f","#01665e","#003c30"]},PRGn:{3:["#af8dc3","#f7f7f7","#7fbf7b"],4:["#7b3294","#c2a5cf","#a6dba0","#008837"],5:["#7b3294","#c2a5cf","#f7f7f7","#a6dba0","#008837"],6:["#762a83","#af8dc3","#e7d4e8","#d9f0d3","#7fbf7b","#1b7837"],7:["#762a83","#af8dc3","#e7d4e8","#f7f7f7","#d9f0d3","#7fbf7b","#1b7837"],8:["#762a83","#9970ab","#c2a5cf","#e7d4e8","#d9f0d3","#a6dba0","#5aae61","#1b7837"],9:["#762a83","#9970ab","#c2a5cf","#e7d4e8","#f7f7f7","#d9f0d3","#a6dba0","#5aae61","#1b7837"],10:["#40004b","#762a83","#9970ab","#c2a5cf","#e7d4e8","#d9f0d3","#a6dba0","#5aae61","#1b7837","#00441b"],11:["#40004b","#762a83","#9970ab","#c2a5cf","#e7d4e8","#f7f7f7","#d9f0d3","#a6dba0","#5aae61","#1b7837","#00441b"]},PiYG:{3:["#e9a3c9","#f7f7f7","#a1d76a"],4:["#d01c8b","#f1b6da","#b8e186","#4dac26"],5:["#d01c8b","#f1b6da","#f7f7f7","#b8e186","#4dac26"],6:["#c51b7d","#e9a3c9","#fde0ef","#e6f5d0","#a1d76a","#4d9221"],7:["#c51b7d","#e9a3c9","#fde0ef","#f7f7f7","#e6f5d0","#a1d76a","#4d9221"],8:["#c51b7d","#de77ae","#f1b6da","#fde0ef","#e6f5d0","#b8e186","#7fbc41","#4d9221"],9:["#c51b7d","#de77ae","#f1b6da","#fde0ef","#f7f7f7","#e6f5d0","#b8e186","#7fbc41","#4d9221"],10:["#8e0152","#c51b7d","#de77ae","#f1b6da","#fde0ef","#e6f5d0","#b8e186","#7fbc41","#4d9221","#276419"],11:["#8e0152","#c51b7d","#de77ae","#f1b6da","#fde0ef","#f7f7f7","#e6f5d0","#b8e186","#7fbc41","#4d9221","#276419"]},RdBu:{3:["#ef8a62","#f7f7f7","#67a9cf"],4:["#ca0020","#f4a582","#92c5de","#0571b0"],5:["#ca0020","#f4a582","#f7f7f7","#92c5de","#0571b0"],6:["#b2182b","#ef8a62","#fddbc7","#d1e5f0","#67a9cf","#2166ac"],7:["#b2182b","#ef8a62","#fddbc7","#f7f7f7","#d1e5f0","#67a9cf","#2166ac"],8:["#b2182b","#d6604d","#f4a582","#fddbc7","#d1e5f0","#92c5de","#4393c3","#2166ac"],9:["#b2182b","#d6604d","#f4a582","#fddbc7","#f7f7f7","#d1e5f0","#92c5de","#4393c3","#2166ac"],10:["#67001f","#b2182b","#d6604d","#f4a582","#fddbc7","#d1e5f0","#92c5de","#4393c3","#2166ac","#053061"],11:["#67001f","#b2182b","#d6604d","#f4a582","#fddbc7","#f7f7f7","#d1e5f0","#92c5de","#4393c3","#2166ac","#053061"]},RdGy:{3:["#ef8a62","#ffffff","#999999"],4:["#ca0020","#f4a582","#bababa","#404040"],5:["#ca0020","#f4a582","#ffffff","#bababa","#404040"],6:["#b2182b","#ef8a62","#fddbc7","#e0e0e0","#999999","#4d4d4d"],7:["#b2182b","#ef8a62","#fddbc7","#ffffff","#e0e0e0","#999999","#4d4d4d"],8:["#b2182b","#d6604d","#f4a582","#fddbc7","#e0e0e0","#bababa","#878787","#4d4d4d"],9:["#b2182b","#d6604d","#f4a582","#fddbc7","#ffffff","#e0e0e0","#bababa","#878787","#4d4d4d"],10:["#67001f","#b2182b","#d6604d","#f4a582","#fddbc7","#e0e0e0","#bababa","#878787","#4d4d4d","#1a1a1a"],11:["#67001f","#b2182b","#d6604d","#f4a582","#fddbc7","#ffffff","#e0e0e0","#bababa","#878787","#4d4d4d","#1a1a1a"]},RdYlBu:{3:["#fc8d59","#ffffbf","#91bfdb"],4:["#d7191c","#fdae61","#abd9e9","#2c7bb6"],5:["#d7191c","#fdae61","#ffffbf","#abd9e9","#2c7bb6"],6:["#d73027","#fc8d59","#fee090","#e0f3f8","#91bfdb","#4575b4"],7:["#d73027","#fc8d59","#fee090","#ffffbf","#e0f3f8","#91bfdb","#4575b4"],8:["#d73027","#f46d43","#fdae61","#fee090","#e0f3f8","#abd9e9","#74add1","#4575b4"],9:["#d73027","#f46d43","#fdae61","#fee090","#ffffbf","#e0f3f8","#abd9e9","#74add1","#4575b4"],10:["#a50026","#d73027","#f46d43","#fdae61","#fee090","#e0f3f8","#abd9e9","#74add1","#4575b4","#313695"],11:["#a50026","#d73027","#f46d43","#fdae61","#fee090","#ffffbf","#e0f3f8","#abd9e9","#74add1","#4575b4","#313695"]},Spectral:{3:["#fc8d59","#ffffbf","#99d594"],4:["#d7191c","#fdae61","#abdda4","#2b83ba"],5:["#d7191c","#fdae61","#ffffbf","#abdda4","#2b83ba"],6:["#d53e4f","#fc8d59","#fee08b","#e6f598","#99d594","#3288bd"],7:["#d53e4f","#fc8d59","#fee08b","#ffffbf","#e6f598","#99d594","#3288bd"],8:["#d53e4f","#f46d43","#fdae61","#fee08b","#e6f598","#abdda4","#66c2a5","#3288bd"],9:["#d53e4f","#f46d43","#fdae61","#fee08b","#ffffbf","#e6f598","#abdda4","#66c2a5","#3288bd"],10:["#9e0142","#d53e4f","#f46d43","#fdae61","#fee08b","#e6f598","#abdda4","#66c2a5","#3288bd","#5e4fa2"],11:["#9e0142","#d53e4f","#f46d43","#fdae61","#fee08b","#ffffbf","#e6f598","#abdda4","#66c2a5","#3288bd","#5e4fa2"]},RdYlGn:{3:["#fc8d59","#ffffbf","#91cf60"],4:["#d7191c","#fdae61","#a6d96a","#1a9641"],5:["#d7191c","#fdae61","#ffffbf","#a6d96a","#1a9641"],6:["#d73027","#fc8d59","#fee08b","#d9ef8b","#91cf60","#1a9850"],7:["#d73027","#fc8d59","#fee08b","#ffffbf","#d9ef8b","#91cf60","#1a9850"],8:["#d73027","#f46d43","#fdae61","#fee08b","#d9ef8b","#a6d96a","#66bd63","#1a9850"],9:["#d73027","#f46d43","#fdae61","#fee08b","#ffffbf","#d9ef8b","#a6d96a","#66bd63","#1a9850"],10:["#a50026","#d73027","#f46d43","#fdae61","#fee08b","#d9ef8b","#a6d96a","#66bd63","#1a9850","#006837"],11:["#a50026","#d73027","#f46d43","#fdae61","#fee08b","#ffffbf","#d9ef8b","#a6d96a","#66bd63","#1a9850","#006837"]}};




!function(){function n(n){return n&&(n.ownerDocument||n.document||n).documentElement}function t(n){return n&&(n.ownerDocument&&n.ownerDocument.defaultView||n.document&&n||n.defaultView)}function e(n,t){return t>n?-1:n>t?1:n>=t?0:0/0}function r(n){return null===n?0/0:+n}function u(n){return!isNaN(n)}function i(n){return{left:function(t,e,r,u){for(arguments.length<3&&(r=0),arguments.length<4&&(u=t.length);u>r;){var i=r+u>>>1;n(t[i],e)<0?r=i+1:u=i}return r},right:function(t,e,r,u){for(arguments.length<3&&(r=0),arguments.length<4&&(u=t.length);u>r;){var i=r+u>>>1;n(t[i],e)>0?u=i:r=i+1}return r}}}function o(n){return n.length}function a(n){for(var t=1;n*t%1;)t*=10;return t}function c(n,t){for(var e in t)Object.defineProperty(n.prototype,e,{value:t[e],enumerable:!1})}function l(){this._=Object.create(null)}function s(n){return(n+="")===pa||n[0]===va?va+n:n}function f(n){return(n+="")[0]===va?n.slice(1):n}function h(n){return s(n)in this._}function g(n){return(n=s(n))in this._&&delete this._[n]}function p(){var n=[];for(var t in this._)n.push(f(t));return n}function v(){var n=0;for(var t in this._)++n;return n}function d(){for(var n in this._)return!1;return!0}function m(){this._=Object.create(null)}function y(n){return n}function M(n,t,e){return function(){var r=e.apply(t,arguments);return r===t?n:r}}function x(n,t){if(t in n)return t;t=t.charAt(0).toUpperCase()+t.slice(1);for(var e=0,r=da.length;r>e;++e){var u=da[e]+t;if(u in n)return u}}function b(){}function _(){}function w(n){function t(){for(var t,r=e,u=-1,i=r.length;++u<i;)(t=r[u].on)&&t.apply(this,arguments);return n}var e=[],r=new l;return t.on=function(t,u){var i,o=r.get(t);return arguments.length<2?o&&o.on:(o&&(o.on=null,e=e.slice(0,i=e.indexOf(o)).concat(e.slice(i+1)),r.remove(t)),u&&e.push(r.set(t,{on:u})),n)},t}function S(){ta.event.preventDefault()}function k(){for(var n,t=ta.event;n=t.sourceEvent;)t=n;return t}function E(n){for(var t=new _,e=0,r=arguments.length;++e<r;)t[arguments[e]]=w(t);return t.of=function(e,r){return function(u){try{var i=u.sourceEvent=ta.event;u.target=n,ta.event=u,t[u.type].apply(e,r)}finally{ta.event=i}}},t}function A(n){return ya(n,_a),n}function N(n){return"function"==typeof n?n:function(){return Ma(n,this)}}function C(n){return"function"==typeof n?n:function(){return xa(n,this)}}function z(n,t){function e(){this.removeAttribute(n)}function r(){this.removeAttributeNS(n.space,n.local)}function u(){this.setAttribute(n,t)}function i(){this.setAttributeNS(n.space,n.local,t)}function o(){var e=t.apply(this,arguments);null==e?this.removeAttribute(n):this.setAttribute(n,e)}function a(){var e=t.apply(this,arguments);null==e?this.removeAttributeNS(n.space,n.local):this.setAttributeNS(n.space,n.local,e)}return n=ta.ns.qualify(n),null==t?n.local?r:e:"function"==typeof t?n.local?a:o:n.local?i:u}function q(n){return n.trim().replace(/\s+/g," ")}function L(n){return new RegExp("(?:^|\\s+)"+ta.requote(n)+"(?:\\s+|$)","g")}function T(n){return(n+"").trim().split(/^|\s+/)}function R(n,t){function e(){for(var e=-1;++e<u;)n[e](this,t)}function r(){for(var e=-1,r=t.apply(this,arguments);++e<u;)n[e](this,r)}n=T(n).map(D);var u=n.length;return"function"==typeof t?r:e}function D(n){var t=L(n);return function(e,r){if(u=e.classList)return r?u.add(n):u.remove(n);var u=e.getAttribute("class")||"";r?(t.lastIndex=0,t.test(u)||e.setAttribute("class",q(u+" "+n))):e.setAttribute("class",q(u.replace(t," ")))}}function P(n,t,e){function r(){this.style.removeProperty(n)}function u(){this.style.setProperty(n,t,e)}function i(){var r=t.apply(this,arguments);null==r?this.style.removeProperty(n):this.style.setProperty(n,r,e)}return null==t?r:"function"==typeof t?i:u}function U(n,t){function e(){delete this[n]}function r(){this[n]=t}function u(){var e=t.apply(this,arguments);null==e?delete this[n]:this[n]=e}return null==t?e:"function"==typeof t?u:r}function j(n){function t(){var t=this.ownerDocument,e=this.namespaceURI;return e?t.createElementNS(e,n):t.createElement(n)}function e(){return this.ownerDocument.createElementNS(n.space,n.local)}return"function"==typeof n?n:(n=ta.ns.qualify(n)).local?e:t}function F(){var n=this.parentNode;n&&n.removeChild(this)}function H(n){return{__data__:n}}function O(n){return function(){return ba(this,n)}}function I(n){return arguments.length||(n=e),function(t,e){return t&&e?n(t.__data__,e.__data__):!t-!e}}function Y(n,t){for(var e=0,r=n.length;r>e;e++)for(var u,i=n[e],o=0,a=i.length;a>o;o++)(u=i[o])&&t(u,o,e);return n}function Z(n){return ya(n,Sa),n}function V(n){var t,e;return function(r,u,i){var o,a=n[i].update,c=a.length;for(i!=e&&(e=i,t=0),u>=t&&(t=u+1);!(o=a[t])&&++t<c;);return o}}function X(n,t,e){function r(){var t=this[o];t&&(this.removeEventListener(n,t,t.$),delete this[o])}function u(){var u=c(t,ra(arguments));r.call(this),this.addEventListener(n,this[o]=u,u.$=e),u._=t}function i(){var t,e=new RegExp("^__on([^.]+)"+ta.requote(n)+"$");for(var r in this)if(t=r.match(e)){var u=this[r];this.removeEventListener(t[1],u,u.$),delete this[r]}}var o="__on"+n,a=n.indexOf("."),c=$;a>0&&(n=n.slice(0,a));var l=ka.get(n);return l&&(n=l,c=B),a?t?u:r:t?b:i}function $(n,t){return function(e){var r=ta.event;ta.event=e,t[0]=this.__data__;try{n.apply(this,t)}finally{ta.event=r}}}function B(n,t){var e=$(n,t);return function(n){var t=this,r=n.relatedTarget;r&&(r===t||8&r.compareDocumentPosition(t))||e.call(t,n)}}function W(e){var r=".dragsuppress-"+ ++Aa,u="click"+r,i=ta.select(t(e)).on("touchmove"+r,S).on("dragstart"+r,S).on("selectstart"+r,S);if(null==Ea&&(Ea="onselectstart"in e?!1:x(e.style,"userSelect")),Ea){var o=n(e).style,a=o[Ea];o[Ea]="none"}return function(n){if(i.on(r,null),Ea&&(o[Ea]=a),n){var t=function(){i.on(u,null)};i.on(u,function(){S(),t()},!0),setTimeout(t,0)}}}function J(n,e){e.changedTouches&&(e=e.changedTouches[0]);var r=n.ownerSVGElement||n;if(r.createSVGPoint){var u=r.createSVGPoint();if(0>Na){var i=t(n);if(i.scrollX||i.scrollY){r=ta.select("body").append("svg").style({position:"absolute",top:0,left:0,margin:0,padding:0,border:"none"},"important");var o=r[0][0].getScreenCTM();Na=!(o.f||o.e),r.remove()}}return Na?(u.x=e.pageX,u.y=e.pageY):(u.x=e.clientX,u.y=e.clientY),u=u.matrixTransform(n.getScreenCTM().inverse()),[u.x,u.y]}var a=n.getBoundingClientRect();return[e.clientX-a.left-n.clientLeft,e.clientY-a.top-n.clientTop]}function G(){return ta.event.changedTouches[0].identifier}function K(n){return n>0?1:0>n?-1:0}function Q(n,t,e){return(t[0]-n[0])*(e[1]-n[1])-(t[1]-n[1])*(e[0]-n[0])}function nt(n){return n>1?0:-1>n?qa:Math.acos(n)}function tt(n){return n>1?Ra:-1>n?-Ra:Math.asin(n)}function et(n){return((n=Math.exp(n))-1/n)/2}function rt(n){return((n=Math.exp(n))+1/n)/2}function ut(n){return((n=Math.exp(2*n))-1)/(n+1)}function it(n){return(n=Math.sin(n/2))*n}function ot(){}function at(n,t,e){return this instanceof at?(this.h=+n,this.s=+t,void(this.l=+e)):arguments.length<2?n instanceof at?new at(n.h,n.s,n.l):bt(""+n,_t,at):new at(n,t,e)}function ct(n,t,e){function r(n){return n>360?n-=360:0>n&&(n+=360),60>n?i+(o-i)*n/60:180>n?o:240>n?i+(o-i)*(240-n)/60:i}function u(n){return Math.round(255*r(n))}var i,o;return n=isNaN(n)?0:(n%=360)<0?n+360:n,t=isNaN(t)?0:0>t?0:t>1?1:t,e=0>e?0:e>1?1:e,o=.5>=e?e*(1+t):e+t-e*t,i=2*e-o,new mt(u(n+120),u(n),u(n-120))}function lt(n,t,e){return this instanceof lt?(this.h=+n,this.c=+t,void(this.l=+e)):arguments.length<2?n instanceof lt?new lt(n.h,n.c,n.l):n instanceof ft?gt(n.l,n.a,n.b):gt((n=wt((n=ta.rgb(n)).r,n.g,n.b)).l,n.a,n.b):new lt(n,t,e)}function st(n,t,e){return isNaN(n)&&(n=0),isNaN(t)&&(t=0),new ft(e,Math.cos(n*=Da)*t,Math.sin(n)*t)}function ft(n,t,e){return this instanceof ft?(this.l=+n,this.a=+t,void(this.b=+e)):arguments.length<2?n instanceof ft?new ft(n.l,n.a,n.b):n instanceof lt?st(n.h,n.c,n.l):wt((n=mt(n)).r,n.g,n.b):new ft(n,t,e)}function ht(n,t,e){var r=(n+16)/116,u=r+t/500,i=r-e/200;return u=pt(u)*Xa,r=pt(r)*$a,i=pt(i)*Ba,new mt(dt(3.2404542*u-1.5371385*r-.4985314*i),dt(-.969266*u+1.8760108*r+.041556*i),dt(.0556434*u-.2040259*r+1.0572252*i))}function gt(n,t,e){return n>0?new lt(Math.atan2(e,t)*Pa,Math.sqrt(t*t+e*e),n):new lt(0/0,0/0,n)}function pt(n){return n>.206893034?n*n*n:(n-4/29)/7.787037}function vt(n){return n>.008856?Math.pow(n,1/3):7.787037*n+4/29}function dt(n){return Math.round(255*(.00304>=n?12.92*n:1.055*Math.pow(n,1/2.4)-.055))}function mt(n,t,e){return this instanceof mt?(this.r=~~n,this.g=~~t,void(this.b=~~e)):arguments.length<2?n instanceof mt?new mt(n.r,n.g,n.b):bt(""+n,mt,ct):new mt(n,t,e)}function yt(n){return new mt(n>>16,n>>8&255,255&n)}function Mt(n){return yt(n)+""}function xt(n){return 16>n?"0"+Math.max(0,n).toString(16):Math.min(255,n).toString(16)}function bt(n,t,e){var r,u,i,o=0,a=0,c=0;if(r=/([a-z]+)\((.*)\)/i.exec(n))switch(u=r[2].split(","),r[1]){case"hsl":return e(parseFloat(u[0]),parseFloat(u[1])/100,parseFloat(u[2])/100);case"rgb":return t(kt(u[0]),kt(u[1]),kt(u[2]))}return(i=Ga.get(n.toLowerCase()))?t(i.r,i.g,i.b):(null==n||"#"!==n.charAt(0)||isNaN(i=parseInt(n.slice(1),16))||(4===n.length?(o=(3840&i)>>4,o=o>>4|o,a=240&i,a=a>>4|a,c=15&i,c=c<<4|c):7===n.length&&(o=(16711680&i)>>16,a=(65280&i)>>8,c=255&i)),t(o,a,c))}function _t(n,t,e){var r,u,i=Math.min(n/=255,t/=255,e/=255),o=Math.max(n,t,e),a=o-i,c=(o+i)/2;return a?(u=.5>c?a/(o+i):a/(2-o-i),r=n==o?(t-e)/a+(e>t?6:0):t==o?(e-n)/a+2:(n-t)/a+4,r*=60):(r=0/0,u=c>0&&1>c?0:r),new at(r,u,c)}function wt(n,t,e){n=St(n),t=St(t),e=St(e);var r=vt((.4124564*n+.3575761*t+.1804375*e)/Xa),u=vt((.2126729*n+.7151522*t+.072175*e)/$a),i=vt((.0193339*n+.119192*t+.9503041*e)/Ba);return ft(116*u-16,500*(r-u),200*(u-i))}function St(n){return(n/=255)<=.04045?n/12.92:Math.pow((n+.055)/1.055,2.4)}function kt(n){var t=parseFloat(n);return"%"===n.charAt(n.length-1)?Math.round(2.55*t):t}function Et(n){return"function"==typeof n?n:function(){return n}}function At(n){return function(t,e,r){return 2===arguments.length&&"function"==typeof e&&(r=e,e=null),Nt(t,e,n,r)}}function Nt(n,t,e,r){function u(){var n,t=c.status;if(!t&&zt(c)||t>=200&&300>t||304===t){try{n=e.call(i,c)}catch(r){return void o.error.call(i,r)}o.load.call(i,n)}else o.error.call(i,c)}var i={},o=ta.dispatch("beforesend","progress","load","error"),a={},c=new XMLHttpRequest,l=null;return!this.XDomainRequest||"withCredentials"in c||!/^(http(s)?:)?\/\//.test(n)||(c=new XDomainRequest),"onload"in c?c.onload=c.onerror=u:c.onreadystatechange=function(){c.readyState>3&&u()},c.onprogress=function(n){var t=ta.event;ta.event=n;try{o.progress.call(i,c)}finally{ta.event=t}},i.header=function(n,t){return n=(n+"").toLowerCase(),arguments.length<2?a[n]:(null==t?delete a[n]:a[n]=t+"",i)},i.mimeType=function(n){return arguments.length?(t=null==n?null:n+"",i):t},i.responseType=function(n){return arguments.length?(l=n,i):l},i.response=function(n){return e=n,i},["get","post"].forEach(function(n){i[n]=function(){return i.send.apply(i,[n].concat(ra(arguments)))}}),i.send=function(e,r,u){if(2===arguments.length&&"function"==typeof r&&(u=r,r=null),c.open(e,n,!0),null==t||"accept"in a||(a.accept=t+",*/*"),c.setRequestHeader)for(var s in a)c.setRequestHeader(s,a[s]);return null!=t&&c.overrideMimeType&&c.overrideMimeType(t),null!=l&&(c.responseType=l),null!=u&&i.on("error",u).on("load",function(n){u(null,n)}),o.beforesend.call(i,c),c.send(null==r?null:r),i},i.abort=function(){return c.abort(),i},ta.rebind(i,o,"on"),null==r?i:i.get(Ct(r))}function Ct(n){return 1===n.length?function(t,e){n(null==t?e:null)}:n}function zt(n){var t=n.responseType;return t&&"text"!==t?n.response:n.responseText}function qt(){var n=Lt(),t=Tt()-n;t>24?(isFinite(t)&&(clearTimeout(tc),tc=setTimeout(qt,t)),nc=0):(nc=1,rc(qt))}function Lt(){var n=Date.now();for(ec=Ka;ec;)n>=ec.t&&(ec.f=ec.c(n-ec.t)),ec=ec.n;return n}function Tt(){for(var n,t=Ka,e=1/0;t;)t.f?t=n?n.n=t.n:Ka=t.n:(t.t<e&&(e=t.t),t=(n=t).n);return Qa=n,e}function Rt(n,t){return t-(n?Math.ceil(Math.log(n)/Math.LN10):1)}function Dt(n,t){var e=Math.pow(10,3*ga(8-t));return{scale:t>8?function(n){return n/e}:function(n){return n*e},symbol:n}}function Pt(n){var t=n.decimal,e=n.thousands,r=n.grouping,u=n.currency,i=r&&e?function(n,t){for(var u=n.length,i=[],o=0,a=r[0],c=0;u>0&&a>0&&(c+a+1>t&&(a=Math.max(1,t-c)),i.push(n.substring(u-=a,u+a)),!((c+=a+1)>t));)a=r[o=(o+1)%r.length];return i.reverse().join(e)}:y;return function(n){var e=ic.exec(n),r=e[1]||" ",o=e[2]||">",a=e[3]||"-",c=e[4]||"",l=e[5],s=+e[6],f=e[7],h=e[8],g=e[9],p=1,v="",d="",m=!1,y=!0;switch(h&&(h=+h.substring(1)),(l||"0"===r&&"="===o)&&(l=r="0",o="="),g){case"n":f=!0,g="g";break;case"%":p=100,d="%",g="f";break;case"p":p=100,d="%",g="r";break;case"b":case"o":case"x":case"X":"#"===c&&(v="0"+g.toLowerCase());case"c":y=!1;case"d":m=!0,h=0;break;case"s":p=-1,g="r"}"$"===c&&(v=u[0],d=u[1]),"r"!=g||h||(g="g"),null!=h&&("g"==g?h=Math.max(1,Math.min(21,h)):("e"==g||"f"==g)&&(h=Math.max(0,Math.min(20,h)))),g=oc.get(g)||Ut;var M=l&&f;return function(n){var e=d;if(m&&n%1)return"";var u=0>n||0===n&&0>1/n?(n=-n,"-"):"-"===a?"":a;if(0>p){var c=ta.formatPrefix(n,h);n=c.scale(n),e=c.symbol+d}else n*=p;n=g(n,h);var x,b,_=n.lastIndexOf(".");if(0>_){var w=y?n.lastIndexOf("e"):-1;0>w?(x=n,b=""):(x=n.substring(0,w),b=n.substring(w))}else x=n.substring(0,_),b=t+n.substring(_+1);!l&&f&&(x=i(x,1/0));var S=v.length+x.length+b.length+(M?0:u.length),k=s>S?new Array(S=s-S+1).join(r):"";return M&&(x=i(k+x,k.length?s-b.length:1/0)),u+=v,n=x+b,("<"===o?u+n+k:">"===o?k+u+n:"^"===o?k.substring(0,S>>=1)+u+n+k.substring(S):u+(M?n:k+n))+e}}}function Ut(n){return n+""}function jt(){this._=new Date(arguments.length>1?Date.UTC.apply(this,arguments):arguments[0])}function Ft(n,t,e){function r(t){var e=n(t),r=i(e,1);return r-t>t-e?e:r}function u(e){return t(e=n(new cc(e-1)),1),e}function i(n,e){return t(n=new cc(+n),e),n}function o(n,r,i){var o=u(n),a=[];if(i>1)for(;r>o;)e(o)%i||a.push(new Date(+o)),t(o,1);else for(;r>o;)a.push(new Date(+o)),t(o,1);return a}function a(n,t,e){try{cc=jt;var r=new jt;return r._=n,o(r,t,e)}finally{cc=Date}}n.floor=n,n.round=r,n.ceil=u,n.offset=i,n.range=o;var c=n.utc=Ht(n);return c.floor=c,c.round=Ht(r),c.ceil=Ht(u),c.offset=Ht(i),c.range=a,n}function Ht(n){return function(t,e){try{cc=jt;var r=new jt;return r._=t,n(r,e)._}finally{cc=Date}}}function Ot(n){function t(n){function t(t){for(var e,u,i,o=[],a=-1,c=0;++a<r;)37===n.charCodeAt(a)&&(o.push(n.slice(c,a)),null!=(u=sc[e=n.charAt(++a)])&&(e=n.charAt(++a)),(i=N[e])&&(e=i(t,null==u?"e"===e?" ":"0":u)),o.push(e),c=a+1);return o.push(n.slice(c,a)),o.join("")}var r=n.length;return t.parse=function(t){var r={y:1900,m:0,d:1,H:0,M:0,S:0,L:0,Z:null},u=e(r,n,t,0);if(u!=t.length)return null;"p"in r&&(r.H=r.H%12+12*r.p);var i=null!=r.Z&&cc!==jt,o=new(i?jt:cc);return"j"in r?o.setFullYear(r.y,0,r.j):"w"in r&&("W"in r||"U"in r)?(o.setFullYear(r.y,0,1),o.setFullYear(r.y,0,"W"in r?(r.w+6)%7+7*r.W-(o.getDay()+5)%7:r.w+7*r.U-(o.getDay()+6)%7)):o.setFullYear(r.y,r.m,r.d),o.setHours(r.H+(r.Z/100|0),r.M+r.Z%100,r.S,r.L),i?o._:o},t.toString=function(){return n},t}function e(n,t,e,r){for(var u,i,o,a=0,c=t.length,l=e.length;c>a;){if(r>=l)return-1;if(u=t.charCodeAt(a++),37===u){if(o=t.charAt(a++),i=C[o in sc?t.charAt(a++):o],!i||(r=i(n,e,r))<0)return-1}else if(u!=e.charCodeAt(r++))return-1}return r}function r(n,t,e){_.lastIndex=0;var r=_.exec(t.slice(e));return r?(n.w=w.get(r[0].toLowerCase()),e+r[0].length):-1}function u(n,t,e){x.lastIndex=0;var r=x.exec(t.slice(e));return r?(n.w=b.get(r[0].toLowerCase()),e+r[0].length):-1}function i(n,t,e){E.lastIndex=0;var r=E.exec(t.slice(e));return r?(n.m=A.get(r[0].toLowerCase()),e+r[0].length):-1}function o(n,t,e){S.lastIndex=0;var r=S.exec(t.slice(e));return r?(n.m=k.get(r[0].toLowerCase()),e+r[0].length):-1}function a(n,t,r){return e(n,N.c.toString(),t,r)}function c(n,t,r){return e(n,N.x.toString(),t,r)}function l(n,t,r){return e(n,N.X.toString(),t,r)}function s(n,t,e){var r=M.get(t.slice(e,e+=2).toLowerCase());return null==r?-1:(n.p=r,e)}var f=n.dateTime,h=n.date,g=n.time,p=n.periods,v=n.days,d=n.shortDays,m=n.months,y=n.shortMonths;t.utc=function(n){function e(n){try{cc=jt;var t=new cc;return t._=n,r(t)}finally{cc=Date}}var r=t(n);return e.parse=function(n){try{cc=jt;var t=r.parse(n);return t&&t._}finally{cc=Date}},e.toString=r.toString,e},t.multi=t.utc.multi=ae;var M=ta.map(),x=Yt(v),b=Zt(v),_=Yt(d),w=Zt(d),S=Yt(m),k=Zt(m),E=Yt(y),A=Zt(y);p.forEach(function(n,t){M.set(n.toLowerCase(),t)});var N={a:function(n){return d[n.getDay()]},A:function(n){return v[n.getDay()]},b:function(n){return y[n.getMonth()]},B:function(n){return m[n.getMonth()]},c:t(f),d:function(n,t){return It(n.getDate(),t,2)},e:function(n,t){return It(n.getDate(),t,2)},H:function(n,t){return It(n.getHours(),t,2)},I:function(n,t){return It(n.getHours()%12||12,t,2)},j:function(n,t){return It(1+ac.dayOfYear(n),t,3)},L:function(n,t){return It(n.getMilliseconds(),t,3)},m:function(n,t){return It(n.getMonth()+1,t,2)},M:function(n,t){return It(n.getMinutes(),t,2)},p:function(n){return p[+(n.getHours()>=12)]},S:function(n,t){return It(n.getSeconds(),t,2)},U:function(n,t){return It(ac.sundayOfYear(n),t,2)},w:function(n){return n.getDay()},W:function(n,t){return It(ac.mondayOfYear(n),t,2)},x:t(h),X:t(g),y:function(n,t){return It(n.getFullYear()%100,t,2)},Y:function(n,t){return It(n.getFullYear()%1e4,t,4)},Z:ie,"%":function(){return"%"}},C={a:r,A:u,b:i,B:o,c:a,d:Qt,e:Qt,H:te,I:te,j:ne,L:ue,m:Kt,M:ee,p:s,S:re,U:Xt,w:Vt,W:$t,x:c,X:l,y:Wt,Y:Bt,Z:Jt,"%":oe};return t}function It(n,t,e){var r=0>n?"-":"",u=(r?-n:n)+"",i=u.length;return r+(e>i?new Array(e-i+1).join(t)+u:u)}function Yt(n){return new RegExp("^(?:"+n.map(ta.requote).join("|")+")","i")}function Zt(n){for(var t=new l,e=-1,r=n.length;++e<r;)t.set(n[e].toLowerCase(),e);return t}function Vt(n,t,e){fc.lastIndex=0;var r=fc.exec(t.slice(e,e+1));return r?(n.w=+r[0],e+r[0].length):-1}function Xt(n,t,e){fc.lastIndex=0;var r=fc.exec(t.slice(e));return r?(n.U=+r[0],e+r[0].length):-1}function $t(n,t,e){fc.lastIndex=0;var r=fc.exec(t.slice(e));return r?(n.W=+r[0],e+r[0].length):-1}function Bt(n,t,e){fc.lastIndex=0;var r=fc.exec(t.slice(e,e+4));return r?(n.y=+r[0],e+r[0].length):-1}function Wt(n,t,e){fc.lastIndex=0;var r=fc.exec(t.slice(e,e+2));return r?(n.y=Gt(+r[0]),e+r[0].length):-1}function Jt(n,t,e){return/^[+-]\d{4}$/.test(t=t.slice(e,e+5))?(n.Z=-t,e+5):-1}function Gt(n){return n+(n>68?1900:2e3)}function Kt(n,t,e){fc.lastIndex=0;var r=fc.exec(t.slice(e,e+2));return r?(n.m=r[0]-1,e+r[0].length):-1}function Qt(n,t,e){fc.lastIndex=0;var r=fc.exec(t.slice(e,e+2));return r?(n.d=+r[0],e+r[0].length):-1}function ne(n,t,e){fc.lastIndex=0;var r=fc.exec(t.slice(e,e+3));return r?(n.j=+r[0],e+r[0].length):-1}function te(n,t,e){fc.lastIndex=0;var r=fc.exec(t.slice(e,e+2));return r?(n.H=+r[0],e+r[0].length):-1}function ee(n,t,e){fc.lastIndex=0;var r=fc.exec(t.slice(e,e+2));return r?(n.M=+r[0],e+r[0].length):-1}function re(n,t,e){fc.lastIndex=0;var r=fc.exec(t.slice(e,e+2));return r?(n.S=+r[0],e+r[0].length):-1}function ue(n,t,e){fc.lastIndex=0;var r=fc.exec(t.slice(e,e+3));return r?(n.L=+r[0],e+r[0].length):-1}function ie(n){var t=n.getTimezoneOffset(),e=t>0?"-":"+",r=ga(t)/60|0,u=ga(t)%60;return e+It(r,"0",2)+It(u,"0",2)}function oe(n,t,e){hc.lastIndex=0;var r=hc.exec(t.slice(e,e+1));return r?e+r[0].length:-1}function ae(n){for(var t=n.length,e=-1;++e<t;)n[e][0]=this(n[e][0]);return function(t){for(var e=0,r=n[e];!r[1](t);)r=n[++e];return r[0](t)}}function ce(){}function le(n,t,e){var r=e.s=n+t,u=r-n,i=r-u;e.t=n-i+(t-u)}function se(n,t){n&&dc.hasOwnProperty(n.type)&&dc[n.type](n,t)}function fe(n,t,e){var r,u=-1,i=n.length-e;for(t.lineStart();++u<i;)r=n[u],t.point(r[0],r[1],r[2]);t.lineEnd()}function he(n,t){var e=-1,r=n.length;for(t.polygonStart();++e<r;)fe(n[e],t,1);t.polygonEnd()}function ge(){function n(n,t){n*=Da,t=t*Da/2+qa/4;var e=n-r,o=e>=0?1:-1,a=o*e,c=Math.cos(t),l=Math.sin(t),s=i*l,f=u*c+s*Math.cos(a),h=s*o*Math.sin(a);yc.add(Math.atan2(h,f)),r=n,u=c,i=l}var t,e,r,u,i;Mc.point=function(o,a){Mc.point=n,r=(t=o)*Da,u=Math.cos(a=(e=a)*Da/2+qa/4),i=Math.sin(a)},Mc.lineEnd=function(){n(t,e)}}function pe(n){var t=n[0],e=n[1],r=Math.cos(e);return[r*Math.cos(t),r*Math.sin(t),Math.sin(e)]}function ve(n,t){return n[0]*t[0]+n[1]*t[1]+n[2]*t[2]}function de(n,t){return[n[1]*t[2]-n[2]*t[1],n[2]*t[0]-n[0]*t[2],n[0]*t[1]-n[1]*t[0]]}function me(n,t){n[0]+=t[0],n[1]+=t[1],n[2]+=t[2]}function ye(n,t){return[n[0]*t,n[1]*t,n[2]*t]}function Me(n){var t=Math.sqrt(n[0]*n[0]+n[1]*n[1]+n[2]*n[2]);n[0]/=t,n[1]/=t,n[2]/=t}function xe(n){return[Math.atan2(n[1],n[0]),tt(n[2])]}function be(n,t){return ga(n[0]-t[0])<Ca&&ga(n[1]-t[1])<Ca}function _e(n,t){n*=Da;var e=Math.cos(t*=Da);we(e*Math.cos(n),e*Math.sin(n),Math.sin(t))}function we(n,t,e){++xc,_c+=(n-_c)/xc,wc+=(t-wc)/xc,Sc+=(e-Sc)/xc}function Se(){function n(n,u){n*=Da;var i=Math.cos(u*=Da),o=i*Math.cos(n),a=i*Math.sin(n),c=Math.sin(u),l=Math.atan2(Math.sqrt((l=e*c-r*a)*l+(l=r*o-t*c)*l+(l=t*a-e*o)*l),t*o+e*a+r*c);bc+=l,kc+=l*(t+(t=o)),Ec+=l*(e+(e=a)),Ac+=l*(r+(r=c)),we(t,e,r)}var t,e,r;qc.point=function(u,i){u*=Da;var o=Math.cos(i*=Da);t=o*Math.cos(u),e=o*Math.sin(u),r=Math.sin(i),qc.point=n,we(t,e,r)}}function ke(){qc.point=_e}function Ee(){function n(n,t){n*=Da;var e=Math.cos(t*=Da),o=e*Math.cos(n),a=e*Math.sin(n),c=Math.sin(t),l=u*c-i*a,s=i*o-r*c,f=r*a-u*o,h=Math.sqrt(l*l+s*s+f*f),g=r*o+u*a+i*c,p=h&&-nt(g)/h,v=Math.atan2(h,g);Nc+=p*l,Cc+=p*s,zc+=p*f,bc+=v,kc+=v*(r+(r=o)),Ec+=v*(u+(u=a)),Ac+=v*(i+(i=c)),we(r,u,i)}var t,e,r,u,i;qc.point=function(o,a){t=o,e=a,qc.point=n,o*=Da;var c=Math.cos(a*=Da);r=c*Math.cos(o),u=c*Math.sin(o),i=Math.sin(a),we(r,u,i)},qc.lineEnd=function(){n(t,e),qc.lineEnd=ke,qc.point=_e}}function Ae(n,t){function e(e,r){return e=n(e,r),t(e[0],e[1])}return n.invert&&t.invert&&(e.invert=function(e,r){return e=t.invert(e,r),e&&n.invert(e[0],e[1])}),e}function Ne(){return!0}function Ce(n,t,e,r,u){var i=[],o=[];if(n.forEach(function(n){if(!((t=n.length-1)<=0)){var t,e=n[0],r=n[t];if(be(e,r)){u.lineStart();for(var a=0;t>a;++a)u.point((e=n[a])[0],e[1]);return void u.lineEnd()}var c=new qe(e,n,null,!0),l=new qe(e,null,c,!1);c.o=l,i.push(c),o.push(l),c=new qe(r,n,null,!1),l=new qe(r,null,c,!0),c.o=l,i.push(c),o.push(l)}}),o.sort(t),ze(i),ze(o),i.length){for(var a=0,c=e,l=o.length;l>a;++a)o[a].e=c=!c;for(var s,f,h=i[0];;){for(var g=h,p=!0;g.v;)if((g=g.n)===h)return;s=g.z,u.lineStart();do{if(g.v=g.o.v=!0,g.e){if(p)for(var a=0,l=s.length;l>a;++a)u.point((f=s[a])[0],f[1]);else r(g.x,g.n.x,1,u);g=g.n}else{if(p){s=g.p.z;for(var a=s.length-1;a>=0;--a)u.point((f=s[a])[0],f[1])}else r(g.x,g.p.x,-1,u);g=g.p}g=g.o,s=g.z,p=!p}while(!g.v);u.lineEnd()}}}function ze(n){if(t=n.length){for(var t,e,r=0,u=n[0];++r<t;)u.n=e=n[r],e.p=u,u=e;u.n=e=n[0],e.p=u}}function qe(n,t,e,r){this.x=n,this.z=t,this.o=e,this.e=r,this.v=!1,this.n=this.p=null}function Le(n,t,e,r){return function(u,i){function o(t,e){var r=u(t,e);n(t=r[0],e=r[1])&&i.point(t,e)}function a(n,t){var e=u(n,t);d.point(e[0],e[1])}function c(){y.point=a,d.lineStart()}function l(){y.point=o,d.lineEnd()}function s(n,t){v.push([n,t]);var e=u(n,t);x.point(e[0],e[1])}function f(){x.lineStart(),v=[]}function h(){s(v[0][0],v[0][1]),x.lineEnd();var n,t=x.clean(),e=M.buffer(),r=e.length;if(v.pop(),p.push(v),v=null,r)if(1&t){n=e[0];var u,r=n.length-1,o=-1;if(r>0){for(b||(i.polygonStart(),b=!0),i.lineStart();++o<r;)i.point((u=n[o])[0],u[1]);i.lineEnd()}}else r>1&&2&t&&e.push(e.pop().concat(e.shift())),g.push(e.filter(Te))}var g,p,v,d=t(i),m=u.invert(r[0],r[1]),y={point:o,lineStart:c,lineEnd:l,polygonStart:function(){y.point=s,y.lineStart=f,y.lineEnd=h,g=[],p=[]},polygonEnd:function(){y.point=o,y.lineStart=c,y.lineEnd=l,g=ta.merge(g);var n=Fe(m,p);g.length?(b||(i.polygonStart(),b=!0),Ce(g,De,n,e,i)):n&&(b||(i.polygonStart(),b=!0),i.lineStart(),e(null,null,1,i),i.lineEnd()),b&&(i.polygonEnd(),b=!1),g=p=null},sphere:function(){i.polygonStart(),i.lineStart(),e(null,null,1,i),i.lineEnd(),i.polygonEnd()}},M=Re(),x=t(M),b=!1;return y}}function Te(n){return n.length>1}function Re(){var n,t=[];return{lineStart:function(){t.push(n=[])},point:function(t,e){n.push([t,e])},lineEnd:b,buffer:function(){var e=t;return t=[],n=null,e},rejoin:function(){t.length>1&&t.push(t.pop().concat(t.shift()))}}}function De(n,t){return((n=n.x)[0]<0?n[1]-Ra-Ca:Ra-n[1])-((t=t.x)[0]<0?t[1]-Ra-Ca:Ra-t[1])}function Pe(n){var t,e=0/0,r=0/0,u=0/0;return{lineStart:function(){n.lineStart(),t=1},point:function(i,o){var a=i>0?qa:-qa,c=ga(i-e);ga(c-qa)<Ca?(n.point(e,r=(r+o)/2>0?Ra:-Ra),n.point(u,r),n.lineEnd(),n.lineStart(),n.point(a,r),n.point(i,r),t=0):u!==a&&c>=qa&&(ga(e-u)<Ca&&(e-=u*Ca),ga(i-a)<Ca&&(i-=a*Ca),r=Ue(e,r,i,o),n.point(u,r),n.lineEnd(),n.lineStart(),n.point(a,r),t=0),n.point(e=i,r=o),u=a},lineEnd:function(){n.lineEnd(),e=r=0/0},clean:function(){return 2-t}}}function Ue(n,t,e,r){var u,i,o=Math.sin(n-e);return ga(o)>Ca?Math.atan((Math.sin(t)*(i=Math.cos(r))*Math.sin(e)-Math.sin(r)*(u=Math.cos(t))*Math.sin(n))/(u*i*o)):(t+r)/2}function je(n,t,e,r){var u;if(null==n)u=e*Ra,r.point(-qa,u),r.point(0,u),r.point(qa,u),r.point(qa,0),r.point(qa,-u),r.point(0,-u),r.point(-qa,-u),r.point(-qa,0),r.point(-qa,u);else if(ga(n[0]-t[0])>Ca){var i=n[0]<t[0]?qa:-qa;u=e*i/2,r.point(-i,u),r.point(0,u),r.point(i,u)}else r.point(t[0],t[1])}function Fe(n,t){var e=n[0],r=n[1],u=[Math.sin(e),-Math.cos(e),0],i=0,o=0;yc.reset();for(var a=0,c=t.length;c>a;++a){var l=t[a],s=l.length;if(s)for(var f=l[0],h=f[0],g=f[1]/2+qa/4,p=Math.sin(g),v=Math.cos(g),d=1;;){d===s&&(d=0),n=l[d];var m=n[0],y=n[1]/2+qa/4,M=Math.sin(y),x=Math.cos(y),b=m-h,_=b>=0?1:-1,w=_*b,S=w>qa,k=p*M;if(yc.add(Math.atan2(k*_*Math.sin(w),v*x+k*Math.cos(w))),i+=S?b+_*La:b,S^h>=e^m>=e){var E=de(pe(f),pe(n));Me(E);var A=de(u,E);Me(A);var N=(S^b>=0?-1:1)*tt(A[2]);(r>N||r===N&&(E[0]||E[1]))&&(o+=S^b>=0?1:-1)}if(!d++)break;h=m,p=M,v=x,f=n}}return(-Ca>i||Ca>i&&0>yc)^1&o}function He(n){function t(n,t){return Math.cos(n)*Math.cos(t)>i}function e(n){var e,i,c,l,s;return{lineStart:function(){l=c=!1,s=1},point:function(f,h){var g,p=[f,h],v=t(f,h),d=o?v?0:u(f,h):v?u(f+(0>f?qa:-qa),h):0;if(!e&&(l=c=v)&&n.lineStart(),v!==c&&(g=r(e,p),(be(e,g)||be(p,g))&&(p[0]+=Ca,p[1]+=Ca,v=t(p[0],p[1]))),v!==c)s=0,v?(n.lineStart(),g=r(p,e),n.point(g[0],g[1])):(g=r(e,p),n.point(g[0],g[1]),n.lineEnd()),e=g;else if(a&&e&&o^v){var m;d&i||!(m=r(p,e,!0))||(s=0,o?(n.lineStart(),n.point(m[0][0],m[0][1]),n.point(m[1][0],m[1][1]),n.lineEnd()):(n.point(m[1][0],m[1][1]),n.lineEnd(),n.lineStart(),n.point(m[0][0],m[0][1])))}!v||e&&be(e,p)||n.point(p[0],p[1]),e=p,c=v,i=d},lineEnd:function(){c&&n.lineEnd(),e=null},clean:function(){return s|(l&&c)<<1}}}function r(n,t,e){var r=pe(n),u=pe(t),o=[1,0,0],a=de(r,u),c=ve(a,a),l=a[0],s=c-l*l;if(!s)return!e&&n;var f=i*c/s,h=-i*l/s,g=de(o,a),p=ye(o,f),v=ye(a,h);me(p,v);var d=g,m=ve(p,d),y=ve(d,d),M=m*m-y*(ve(p,p)-1);if(!(0>M)){var x=Math.sqrt(M),b=ye(d,(-m-x)/y);if(me(b,p),b=xe(b),!e)return b;var _,w=n[0],S=t[0],k=n[1],E=t[1];w>S&&(_=w,w=S,S=_);var A=S-w,N=ga(A-qa)<Ca,C=N||Ca>A;if(!N&&k>E&&(_=k,k=E,E=_),C?N?k+E>0^b[1]<(ga(b[0]-w)<Ca?k:E):k<=b[1]&&b[1]<=E:A>qa^(w<=b[0]&&b[0]<=S)){var z=ye(d,(-m+x)/y);return me(z,p),[b,xe(z)]}}}function u(t,e){var r=o?n:qa-n,u=0;return-r>t?u|=1:t>r&&(u|=2),-r>e?u|=4:e>r&&(u|=8),u}var i=Math.cos(n),o=i>0,a=ga(i)>Ca,c=gr(n,6*Da);return Le(t,e,c,o?[0,-n]:[-qa,n-qa])}function Oe(n,t,e,r){return function(u){var i,o=u.a,a=u.b,c=o.x,l=o.y,s=a.x,f=a.y,h=0,g=1,p=s-c,v=f-l;if(i=n-c,p||!(i>0)){if(i/=p,0>p){if(h>i)return;g>i&&(g=i)}else if(p>0){if(i>g)return;i>h&&(h=i)}if(i=e-c,p||!(0>i)){if(i/=p,0>p){if(i>g)return;i>h&&(h=i)}else if(p>0){if(h>i)return;g>i&&(g=i)}if(i=t-l,v||!(i>0)){if(i/=v,0>v){if(h>i)return;g>i&&(g=i)}else if(v>0){if(i>g)return;i>h&&(h=i)}if(i=r-l,v||!(0>i)){if(i/=v,0>v){if(i>g)return;i>h&&(h=i)}else if(v>0){if(h>i)return;g>i&&(g=i)}return h>0&&(u.a={x:c+h*p,y:l+h*v}),1>g&&(u.b={x:c+g*p,y:l+g*v}),u}}}}}}function Ie(n,t,e,r){function u(r,u){return ga(r[0]-n)<Ca?u>0?0:3:ga(r[0]-e)<Ca?u>0?2:1:ga(r[1]-t)<Ca?u>0?1:0:u>0?3:2}function i(n,t){return o(n.x,t.x)}function o(n,t){var e=u(n,1),r=u(t,1);return e!==r?e-r:0===e?t[1]-n[1]:1===e?n[0]-t[0]:2===e?n[1]-t[1]:t[0]-n[0]}return function(a){function c(n){for(var t=0,e=d.length,r=n[1],u=0;e>u;++u)for(var i,o=1,a=d[u],c=a.length,l=a[0];c>o;++o)i=a[o],l[1]<=r?i[1]>r&&Q(l,i,n)>0&&++t:i[1]<=r&&Q(l,i,n)<0&&--t,l=i;return 0!==t}function l(i,a,c,l){var s=0,f=0;if(null==i||(s=u(i,c))!==(f=u(a,c))||o(i,a)<0^c>0){do l.point(0===s||3===s?n:e,s>1?r:t);while((s=(s+c+4)%4)!==f)}else l.point(a[0],a[1])}function s(u,i){return u>=n&&e>=u&&i>=t&&r>=i}function f(n,t){s(n,t)&&a.point(n,t)}function h(){C.point=p,d&&d.push(m=[]),S=!0,w=!1,b=_=0/0}function g(){v&&(p(y,M),x&&w&&A.rejoin(),v.push(A.buffer())),C.point=f,w&&a.lineEnd()}function p(n,t){n=Math.max(-Tc,Math.min(Tc,n)),t=Math.max(-Tc,Math.min(Tc,t));var e=s(n,t);if(d&&m.push([n,t]),S)y=n,M=t,x=e,S=!1,e&&(a.lineStart(),a.point(n,t));else if(e&&w)a.point(n,t);else{var r={a:{x:b,y:_},b:{x:n,y:t}};N(r)?(w||(a.lineStart(),a.point(r.a.x,r.a.y)),a.point(r.b.x,r.b.y),e||a.lineEnd(),k=!1):e&&(a.lineStart(),a.point(n,t),k=!1)}b=n,_=t,w=e}var v,d,m,y,M,x,b,_,w,S,k,E=a,A=Re(),N=Oe(n,t,e,r),C={point:f,lineStart:h,lineEnd:g,polygonStart:function(){a=A,v=[],d=[],k=!0},polygonEnd:function(){a=E,v=ta.merge(v);var t=c([n,r]),e=k&&t,u=v.length;(e||u)&&(a.polygonStart(),e&&(a.lineStart(),l(null,null,1,a),a.lineEnd()),u&&Ce(v,i,t,l,a),a.polygonEnd()),v=d=m=null}};return C}}function Ye(n){var t=0,e=qa/3,r=ir(n),u=r(t,e);return u.parallels=function(n){return arguments.length?r(t=n[0]*qa/180,e=n[1]*qa/180):[t/qa*180,e/qa*180]},u}function Ze(n,t){function e(n,t){var e=Math.sqrt(i-2*u*Math.sin(t))/u;return[e*Math.sin(n*=u),o-e*Math.cos(n)]}var r=Math.sin(n),u=(r+Math.sin(t))/2,i=1+r*(2*u-r),o=Math.sqrt(i)/u;return e.invert=function(n,t){var e=o-t;return[Math.atan2(n,e)/u,tt((i-(n*n+e*e)*u*u)/(2*u))]},e}function Ve(){function n(n,t){Dc+=u*n-r*t,r=n,u=t}var t,e,r,u;Hc.point=function(i,o){Hc.point=n,t=r=i,e=u=o},Hc.lineEnd=function(){n(t,e)}}function Xe(n,t){Pc>n&&(Pc=n),n>jc&&(jc=n),Uc>t&&(Uc=t),t>Fc&&(Fc=t)}function $e(){function n(n,t){o.push("M",n,",",t,i)}function t(n,t){o.push("M",n,",",t),a.point=e}function e(n,t){o.push("L",n,",",t)}function r(){a.point=n}function u(){o.push("Z")}var i=Be(4.5),o=[],a={point:n,lineStart:function(){a.point=t},lineEnd:r,polygonStart:function(){a.lineEnd=u},polygonEnd:function(){a.lineEnd=r,a.point=n},pointRadius:function(n){return i=Be(n),a},result:function(){if(o.length){var n=o.join("");return o=[],n}}};return a}function Be(n){return"m0,"+n+"a"+n+","+n+" 0 1,1 0,"+-2*n+"a"+n+","+n+" 0 1,1 0,"+2*n+"z"}function We(n,t){_c+=n,wc+=t,++Sc}function Je(){function n(n,r){var u=n-t,i=r-e,o=Math.sqrt(u*u+i*i);kc+=o*(t+n)/2,Ec+=o*(e+r)/2,Ac+=o,We(t=n,e=r)}var t,e;Ic.point=function(r,u){Ic.point=n,We(t=r,e=u)}}function Ge(){Ic.point=We}function Ke(){function n(n,t){var e=n-r,i=t-u,o=Math.sqrt(e*e+i*i);kc+=o*(r+n)/2,Ec+=o*(u+t)/2,Ac+=o,o=u*n-r*t,Nc+=o*(r+n),Cc+=o*(u+t),zc+=3*o,We(r=n,u=t)}var t,e,r,u;Ic.point=function(i,o){Ic.point=n,We(t=r=i,e=u=o)},Ic.lineEnd=function(){n(t,e)}}function Qe(n){function t(t,e){n.moveTo(t+o,e),n.arc(t,e,o,0,La)}function e(t,e){n.moveTo(t,e),a.point=r}function r(t,e){n.lineTo(t,e)}function u(){a.point=t}function i(){n.closePath()}var o=4.5,a={point:t,lineStart:function(){a.point=e},lineEnd:u,polygonStart:function(){a.lineEnd=i},polygonEnd:function(){a.lineEnd=u,a.point=t},pointRadius:function(n){return o=n,a},result:b};return a}function nr(n){function t(n){return(a?r:e)(n)}function e(t){return rr(t,function(e,r){e=n(e,r),t.point(e[0],e[1])})}function r(t){function e(e,r){e=n(e,r),t.point(e[0],e[1])}function r(){M=0/0,S.point=i,t.lineStart()}function i(e,r){var i=pe([e,r]),o=n(e,r);u(M,x,y,b,_,w,M=o[0],x=o[1],y=e,b=i[0],_=i[1],w=i[2],a,t),t.point(M,x)}function o(){S.point=e,t.lineEnd()}function c(){r(),S.point=l,S.lineEnd=s}function l(n,t){i(f=n,h=t),g=M,p=x,v=b,d=_,m=w,S.point=i}function s(){u(M,x,y,b,_,w,g,p,f,v,d,m,a,t),S.lineEnd=o,o()}var f,h,g,p,v,d,m,y,M,x,b,_,w,S={point:e,lineStart:r,lineEnd:o,polygonStart:function(){t.polygonStart(),S.lineStart=c
},polygonEnd:function(){t.polygonEnd(),S.lineStart=r}};return S}function u(t,e,r,a,c,l,s,f,h,g,p,v,d,m){var y=s-t,M=f-e,x=y*y+M*M;if(x>4*i&&d--){var b=a+g,_=c+p,w=l+v,S=Math.sqrt(b*b+_*_+w*w),k=Math.asin(w/=S),E=ga(ga(w)-1)<Ca||ga(r-h)<Ca?(r+h)/2:Math.atan2(_,b),A=n(E,k),N=A[0],C=A[1],z=N-t,q=C-e,L=M*z-y*q;(L*L/x>i||ga((y*z+M*q)/x-.5)>.3||o>a*g+c*p+l*v)&&(u(t,e,r,a,c,l,N,C,E,b/=S,_/=S,w,d,m),m.point(N,C),u(N,C,E,b,_,w,s,f,h,g,p,v,d,m))}}var i=.5,o=Math.cos(30*Da),a=16;return t.precision=function(n){return arguments.length?(a=(i=n*n)>0&&16,t):Math.sqrt(i)},t}function tr(n){var t=nr(function(t,e){return n([t*Pa,e*Pa])});return function(n){return or(t(n))}}function er(n){this.stream=n}function rr(n,t){return{point:t,sphere:function(){n.sphere()},lineStart:function(){n.lineStart()},lineEnd:function(){n.lineEnd()},polygonStart:function(){n.polygonStart()},polygonEnd:function(){n.polygonEnd()}}}function ur(n){return ir(function(){return n})()}function ir(n){function t(n){return n=a(n[0]*Da,n[1]*Da),[n[0]*h+c,l-n[1]*h]}function e(n){return n=a.invert((n[0]-c)/h,(l-n[1])/h),n&&[n[0]*Pa,n[1]*Pa]}function r(){a=Ae(o=lr(m,M,x),i);var n=i(v,d);return c=g-n[0]*h,l=p+n[1]*h,u()}function u(){return s&&(s.valid=!1,s=null),t}var i,o,a,c,l,s,f=nr(function(n,t){return n=i(n,t),[n[0]*h+c,l-n[1]*h]}),h=150,g=480,p=250,v=0,d=0,m=0,M=0,x=0,b=Lc,_=y,w=null,S=null;return t.stream=function(n){return s&&(s.valid=!1),s=or(b(o,f(_(n)))),s.valid=!0,s},t.clipAngle=function(n){return arguments.length?(b=null==n?(w=n,Lc):He((w=+n)*Da),u()):w},t.clipExtent=function(n){return arguments.length?(S=n,_=n?Ie(n[0][0],n[0][1],n[1][0],n[1][1]):y,u()):S},t.scale=function(n){return arguments.length?(h=+n,r()):h},t.translate=function(n){return arguments.length?(g=+n[0],p=+n[1],r()):[g,p]},t.center=function(n){return arguments.length?(v=n[0]%360*Da,d=n[1]%360*Da,r()):[v*Pa,d*Pa]},t.rotate=function(n){return arguments.length?(m=n[0]%360*Da,M=n[1]%360*Da,x=n.length>2?n[2]%360*Da:0,r()):[m*Pa,M*Pa,x*Pa]},ta.rebind(t,f,"precision"),function(){return i=n.apply(this,arguments),t.invert=i.invert&&e,r()}}function or(n){return rr(n,function(t,e){n.point(t*Da,e*Da)})}function ar(n,t){return[n,t]}function cr(n,t){return[n>qa?n-La:-qa>n?n+La:n,t]}function lr(n,t,e){return n?t||e?Ae(fr(n),hr(t,e)):fr(n):t||e?hr(t,e):cr}function sr(n){return function(t,e){return t+=n,[t>qa?t-La:-qa>t?t+La:t,e]}}function fr(n){var t=sr(n);return t.invert=sr(-n),t}function hr(n,t){function e(n,t){var e=Math.cos(t),a=Math.cos(n)*e,c=Math.sin(n)*e,l=Math.sin(t),s=l*r+a*u;return[Math.atan2(c*i-s*o,a*r-l*u),tt(s*i+c*o)]}var r=Math.cos(n),u=Math.sin(n),i=Math.cos(t),o=Math.sin(t);return e.invert=function(n,t){var e=Math.cos(t),a=Math.cos(n)*e,c=Math.sin(n)*e,l=Math.sin(t),s=l*i-c*o;return[Math.atan2(c*i+l*o,a*r+s*u),tt(s*r-a*u)]},e}function gr(n,t){var e=Math.cos(n),r=Math.sin(n);return function(u,i,o,a){var c=o*t;null!=u?(u=pr(e,u),i=pr(e,i),(o>0?i>u:u>i)&&(u+=o*La)):(u=n+o*La,i=n-.5*c);for(var l,s=u;o>0?s>i:i>s;s-=c)a.point((l=xe([e,-r*Math.cos(s),-r*Math.sin(s)]))[0],l[1])}}function pr(n,t){var e=pe(t);e[0]-=n,Me(e);var r=nt(-e[1]);return((-e[2]<0?-r:r)+2*Math.PI-Ca)%(2*Math.PI)}function vr(n,t,e){var r=ta.range(n,t-Ca,e).concat(t);return function(n){return r.map(function(t){return[n,t]})}}function dr(n,t,e){var r=ta.range(n,t-Ca,e).concat(t);return function(n){return r.map(function(t){return[t,n]})}}function mr(n){return n.source}function yr(n){return n.target}function Mr(n,t,e,r){var u=Math.cos(t),i=Math.sin(t),o=Math.cos(r),a=Math.sin(r),c=u*Math.cos(n),l=u*Math.sin(n),s=o*Math.cos(e),f=o*Math.sin(e),h=2*Math.asin(Math.sqrt(it(r-t)+u*o*it(e-n))),g=1/Math.sin(h),p=h?function(n){var t=Math.sin(n*=h)*g,e=Math.sin(h-n)*g,r=e*c+t*s,u=e*l+t*f,o=e*i+t*a;return[Math.atan2(u,r)*Pa,Math.atan2(o,Math.sqrt(r*r+u*u))*Pa]}:function(){return[n*Pa,t*Pa]};return p.distance=h,p}function xr(){function n(n,u){var i=Math.sin(u*=Da),o=Math.cos(u),a=ga((n*=Da)-t),c=Math.cos(a);Yc+=Math.atan2(Math.sqrt((a=o*Math.sin(a))*a+(a=r*i-e*o*c)*a),e*i+r*o*c),t=n,e=i,r=o}var t,e,r;Zc.point=function(u,i){t=u*Da,e=Math.sin(i*=Da),r=Math.cos(i),Zc.point=n},Zc.lineEnd=function(){Zc.point=Zc.lineEnd=b}}function br(n,t){function e(t,e){var r=Math.cos(t),u=Math.cos(e),i=n(r*u);return[i*u*Math.sin(t),i*Math.sin(e)]}return e.invert=function(n,e){var r=Math.sqrt(n*n+e*e),u=t(r),i=Math.sin(u),o=Math.cos(u);return[Math.atan2(n*i,r*o),Math.asin(r&&e*i/r)]},e}function _r(n,t){function e(n,t){o>0?-Ra+Ca>t&&(t=-Ra+Ca):t>Ra-Ca&&(t=Ra-Ca);var e=o/Math.pow(u(t),i);return[e*Math.sin(i*n),o-e*Math.cos(i*n)]}var r=Math.cos(n),u=function(n){return Math.tan(qa/4+n/2)},i=n===t?Math.sin(n):Math.log(r/Math.cos(t))/Math.log(u(t)/u(n)),o=r*Math.pow(u(n),i)/i;return i?(e.invert=function(n,t){var e=o-t,r=K(i)*Math.sqrt(n*n+e*e);return[Math.atan2(n,e)/i,2*Math.atan(Math.pow(o/r,1/i))-Ra]},e):Sr}function wr(n,t){function e(n,t){var e=i-t;return[e*Math.sin(u*n),i-e*Math.cos(u*n)]}var r=Math.cos(n),u=n===t?Math.sin(n):(r-Math.cos(t))/(t-n),i=r/u+n;return ga(u)<Ca?ar:(e.invert=function(n,t){var e=i-t;return[Math.atan2(n,e)/u,i-K(u)*Math.sqrt(n*n+e*e)]},e)}function Sr(n,t){return[n,Math.log(Math.tan(qa/4+t/2))]}function kr(n){var t,e=ur(n),r=e.scale,u=e.translate,i=e.clipExtent;return e.scale=function(){var n=r.apply(e,arguments);return n===e?t?e.clipExtent(null):e:n},e.translate=function(){var n=u.apply(e,arguments);return n===e?t?e.clipExtent(null):e:n},e.clipExtent=function(n){var o=i.apply(e,arguments);if(o===e){if(t=null==n){var a=qa*r(),c=u();i([[c[0]-a,c[1]-a],[c[0]+a,c[1]+a]])}}else t&&(o=null);return o},e.clipExtent(null)}function Er(n,t){return[Math.log(Math.tan(qa/4+t/2)),-n]}function Ar(n){return n[0]}function Nr(n){return n[1]}function Cr(n){for(var t=n.length,e=[0,1],r=2,u=2;t>u;u++){for(;r>1&&Q(n[e[r-2]],n[e[r-1]],n[u])<=0;)--r;e[r++]=u}return e.slice(0,r)}function zr(n,t){return n[0]-t[0]||n[1]-t[1]}function qr(n,t,e){return(e[0]-t[0])*(n[1]-t[1])<(e[1]-t[1])*(n[0]-t[0])}function Lr(n,t,e,r){var u=n[0],i=e[0],o=t[0]-u,a=r[0]-i,c=n[1],l=e[1],s=t[1]-c,f=r[1]-l,h=(a*(c-l)-f*(u-i))/(f*o-a*s);return[u+h*o,c+h*s]}function Tr(n){var t=n[0],e=n[n.length-1];return!(t[0]-e[0]||t[1]-e[1])}function Rr(){tu(this),this.edge=this.site=this.circle=null}function Dr(n){var t=el.pop()||new Rr;return t.site=n,t}function Pr(n){Xr(n),Qc.remove(n),el.push(n),tu(n)}function Ur(n){var t=n.circle,e=t.x,r=t.cy,u={x:e,y:r},i=n.P,o=n.N,a=[n];Pr(n);for(var c=i;c.circle&&ga(e-c.circle.x)<Ca&&ga(r-c.circle.cy)<Ca;)i=c.P,a.unshift(c),Pr(c),c=i;a.unshift(c),Xr(c);for(var l=o;l.circle&&ga(e-l.circle.x)<Ca&&ga(r-l.circle.cy)<Ca;)o=l.N,a.push(l),Pr(l),l=o;a.push(l),Xr(l);var s,f=a.length;for(s=1;f>s;++s)l=a[s],c=a[s-1],Kr(l.edge,c.site,l.site,u);c=a[0],l=a[f-1],l.edge=Jr(c.site,l.site,null,u),Vr(c),Vr(l)}function jr(n){for(var t,e,r,u,i=n.x,o=n.y,a=Qc._;a;)if(r=Fr(a,o)-i,r>Ca)a=a.L;else{if(u=i-Hr(a,o),!(u>Ca)){r>-Ca?(t=a.P,e=a):u>-Ca?(t=a,e=a.N):t=e=a;break}if(!a.R){t=a;break}a=a.R}var c=Dr(n);if(Qc.insert(t,c),t||e){if(t===e)return Xr(t),e=Dr(t.site),Qc.insert(c,e),c.edge=e.edge=Jr(t.site,c.site),Vr(t),void Vr(e);if(!e)return void(c.edge=Jr(t.site,c.site));Xr(t),Xr(e);var l=t.site,s=l.x,f=l.y,h=n.x-s,g=n.y-f,p=e.site,v=p.x-s,d=p.y-f,m=2*(h*d-g*v),y=h*h+g*g,M=v*v+d*d,x={x:(d*y-g*M)/m+s,y:(h*M-v*y)/m+f};Kr(e.edge,l,p,x),c.edge=Jr(l,n,null,x),e.edge=Jr(n,p,null,x),Vr(t),Vr(e)}}function Fr(n,t){var e=n.site,r=e.x,u=e.y,i=u-t;if(!i)return r;var o=n.P;if(!o)return-1/0;e=o.site;var a=e.x,c=e.y,l=c-t;if(!l)return a;var s=a-r,f=1/i-1/l,h=s/l;return f?(-h+Math.sqrt(h*h-2*f*(s*s/(-2*l)-c+l/2+u-i/2)))/f+r:(r+a)/2}function Hr(n,t){var e=n.N;if(e)return Fr(e,t);var r=n.site;return r.y===t?r.x:1/0}function Or(n){this.site=n,this.edges=[]}function Ir(n){for(var t,e,r,u,i,o,a,c,l,s,f=n[0][0],h=n[1][0],g=n[0][1],p=n[1][1],v=Kc,d=v.length;d--;)if(i=v[d],i&&i.prepare())for(a=i.edges,c=a.length,o=0;c>o;)s=a[o].end(),r=s.x,u=s.y,l=a[++o%c].start(),t=l.x,e=l.y,(ga(r-t)>Ca||ga(u-e)>Ca)&&(a.splice(o,0,new Qr(Gr(i.site,s,ga(r-f)<Ca&&p-u>Ca?{x:f,y:ga(t-f)<Ca?e:p}:ga(u-p)<Ca&&h-r>Ca?{x:ga(e-p)<Ca?t:h,y:p}:ga(r-h)<Ca&&u-g>Ca?{x:h,y:ga(t-h)<Ca?e:g}:ga(u-g)<Ca&&r-f>Ca?{x:ga(e-g)<Ca?t:f,y:g}:null),i.site,null)),++c)}function Yr(n,t){return t.angle-n.angle}function Zr(){tu(this),this.x=this.y=this.arc=this.site=this.cy=null}function Vr(n){var t=n.P,e=n.N;if(t&&e){var r=t.site,u=n.site,i=e.site;if(r!==i){var o=u.x,a=u.y,c=r.x-o,l=r.y-a,s=i.x-o,f=i.y-a,h=2*(c*f-l*s);if(!(h>=-za)){var g=c*c+l*l,p=s*s+f*f,v=(f*g-l*p)/h,d=(c*p-s*g)/h,f=d+a,m=rl.pop()||new Zr;m.arc=n,m.site=u,m.x=v+o,m.y=f+Math.sqrt(v*v+d*d),m.cy=f,n.circle=m;for(var y=null,M=tl._;M;)if(m.y<M.y||m.y===M.y&&m.x<=M.x){if(!M.L){y=M.P;break}M=M.L}else{if(!M.R){y=M;break}M=M.R}tl.insert(y,m),y||(nl=m)}}}}function Xr(n){var t=n.circle;t&&(t.P||(nl=t.N),tl.remove(t),rl.push(t),tu(t),n.circle=null)}function $r(n){for(var t,e=Gc,r=Oe(n[0][0],n[0][1],n[1][0],n[1][1]),u=e.length;u--;)t=e[u],(!Br(t,n)||!r(t)||ga(t.a.x-t.b.x)<Ca&&ga(t.a.y-t.b.y)<Ca)&&(t.a=t.b=null,e.splice(u,1))}function Br(n,t){var e=n.b;if(e)return!0;var r,u,i=n.a,o=t[0][0],a=t[1][0],c=t[0][1],l=t[1][1],s=n.l,f=n.r,h=s.x,g=s.y,p=f.x,v=f.y,d=(h+p)/2,m=(g+v)/2;if(v===g){if(o>d||d>=a)return;if(h>p){if(i){if(i.y>=l)return}else i={x:d,y:c};e={x:d,y:l}}else{if(i){if(i.y<c)return}else i={x:d,y:l};e={x:d,y:c}}}else if(r=(h-p)/(v-g),u=m-r*d,-1>r||r>1)if(h>p){if(i){if(i.y>=l)return}else i={x:(c-u)/r,y:c};e={x:(l-u)/r,y:l}}else{if(i){if(i.y<c)return}else i={x:(l-u)/r,y:l};e={x:(c-u)/r,y:c}}else if(v>g){if(i){if(i.x>=a)return}else i={x:o,y:r*o+u};e={x:a,y:r*a+u}}else{if(i){if(i.x<o)return}else i={x:a,y:r*a+u};e={x:o,y:r*o+u}}return n.a=i,n.b=e,!0}function Wr(n,t){this.l=n,this.r=t,this.a=this.b=null}function Jr(n,t,e,r){var u=new Wr(n,t);return Gc.push(u),e&&Kr(u,n,t,e),r&&Kr(u,t,n,r),Kc[n.i].edges.push(new Qr(u,n,t)),Kc[t.i].edges.push(new Qr(u,t,n)),u}function Gr(n,t,e){var r=new Wr(n,null);return r.a=t,r.b=e,Gc.push(r),r}function Kr(n,t,e,r){n.a||n.b?n.l===e?n.b=r:n.a=r:(n.a=r,n.l=t,n.r=e)}function Qr(n,t,e){var r=n.a,u=n.b;this.edge=n,this.site=t,this.angle=e?Math.atan2(e.y-t.y,e.x-t.x):n.l===t?Math.atan2(u.x-r.x,r.y-u.y):Math.atan2(r.x-u.x,u.y-r.y)}function nu(){this._=null}function tu(n){n.U=n.C=n.L=n.R=n.P=n.N=null}function eu(n,t){var e=t,r=t.R,u=e.U;u?u.L===e?u.L=r:u.R=r:n._=r,r.U=u,e.U=r,e.R=r.L,e.R&&(e.R.U=e),r.L=e}function ru(n,t){var e=t,r=t.L,u=e.U;u?u.L===e?u.L=r:u.R=r:n._=r,r.U=u,e.U=r,e.L=r.R,e.L&&(e.L.U=e),r.R=e}function uu(n){for(;n.L;)n=n.L;return n}function iu(n,t){var e,r,u,i=n.sort(ou).pop();for(Gc=[],Kc=new Array(n.length),Qc=new nu,tl=new nu;;)if(u=nl,i&&(!u||i.y<u.y||i.y===u.y&&i.x<u.x))(i.x!==e||i.y!==r)&&(Kc[i.i]=new Or(i),jr(i),e=i.x,r=i.y),i=n.pop();else{if(!u)break;Ur(u.arc)}t&&($r(t),Ir(t));var o={cells:Kc,edges:Gc};return Qc=tl=Gc=Kc=null,o}function ou(n,t){return t.y-n.y||t.x-n.x}function au(n,t,e){return(n.x-e.x)*(t.y-n.y)-(n.x-t.x)*(e.y-n.y)}function cu(n){return n.x}function lu(n){return n.y}function su(){return{leaf:!0,nodes:[],point:null,x:null,y:null}}function fu(n,t,e,r,u,i){if(!n(t,e,r,u,i)){var o=.5*(e+u),a=.5*(r+i),c=t.nodes;c[0]&&fu(n,c[0],e,r,o,a),c[1]&&fu(n,c[1],o,r,u,a),c[2]&&fu(n,c[2],e,a,o,i),c[3]&&fu(n,c[3],o,a,u,i)}}function hu(n,t,e,r,u,i,o){var a,c=1/0;return function l(n,s,f,h,g){if(!(s>i||f>o||r>h||u>g)){if(p=n.point){var p,v=t-n.x,d=e-n.y,m=v*v+d*d;if(c>m){var y=Math.sqrt(c=m);r=t-y,u=e-y,i=t+y,o=e+y,a=p}}for(var M=n.nodes,x=.5*(s+h),b=.5*(f+g),_=t>=x,w=e>=b,S=w<<1|_,k=S+4;k>S;++S)if(n=M[3&S])switch(3&S){case 0:l(n,s,f,x,b);break;case 1:l(n,x,f,h,b);break;case 2:l(n,s,b,x,g);break;case 3:l(n,x,b,h,g)}}}(n,r,u,i,o),a}function gu(n,t){n=ta.rgb(n),t=ta.rgb(t);var e=n.r,r=n.g,u=n.b,i=t.r-e,o=t.g-r,a=t.b-u;return function(n){return"#"+xt(Math.round(e+i*n))+xt(Math.round(r+o*n))+xt(Math.round(u+a*n))}}function pu(n,t){var e,r={},u={};for(e in n)e in t?r[e]=mu(n[e],t[e]):u[e]=n[e];for(e in t)e in n||(u[e]=t[e]);return function(n){for(e in r)u[e]=r[e](n);return u}}function vu(n,t){return n=+n,t=+t,function(e){return n*(1-e)+t*e}}function du(n,t){var e,r,u,i=il.lastIndex=ol.lastIndex=0,o=-1,a=[],c=[];for(n+="",t+="";(e=il.exec(n))&&(r=ol.exec(t));)(u=r.index)>i&&(u=t.slice(i,u),a[o]?a[o]+=u:a[++o]=u),(e=e[0])===(r=r[0])?a[o]?a[o]+=r:a[++o]=r:(a[++o]=null,c.push({i:o,x:vu(e,r)})),i=ol.lastIndex;return i<t.length&&(u=t.slice(i),a[o]?a[o]+=u:a[++o]=u),a.length<2?c[0]?(t=c[0].x,function(n){return t(n)+""}):function(){return t}:(t=c.length,function(n){for(var e,r=0;t>r;++r)a[(e=c[r]).i]=e.x(n);return a.join("")})}function mu(n,t){for(var e,r=ta.interpolators.length;--r>=0&&!(e=ta.interpolators[r](n,t)););return e}function yu(n,t){var e,r=[],u=[],i=n.length,o=t.length,a=Math.min(n.length,t.length);for(e=0;a>e;++e)r.push(mu(n[e],t[e]));for(;i>e;++e)u[e]=n[e];for(;o>e;++e)u[e]=t[e];return function(n){for(e=0;a>e;++e)u[e]=r[e](n);return u}}function Mu(n){return function(t){return 0>=t?0:t>=1?1:n(t)}}function xu(n){return function(t){return 1-n(1-t)}}function bu(n){return function(t){return.5*(.5>t?n(2*t):2-n(2-2*t))}}function _u(n){return n*n}function wu(n){return n*n*n}function Su(n){if(0>=n)return 0;if(n>=1)return 1;var t=n*n,e=t*n;return 4*(.5>n?e:3*(n-t)+e-.75)}function ku(n){return function(t){return Math.pow(t,n)}}function Eu(n){return 1-Math.cos(n*Ra)}function Au(n){return Math.pow(2,10*(n-1))}function Nu(n){return 1-Math.sqrt(1-n*n)}function Cu(n,t){var e;return arguments.length<2&&(t=.45),arguments.length?e=t/La*Math.asin(1/n):(n=1,e=t/4),function(r){return 1+n*Math.pow(2,-10*r)*Math.sin((r-e)*La/t)}}function zu(n){return n||(n=1.70158),function(t){return t*t*((n+1)*t-n)}}function qu(n){return 1/2.75>n?7.5625*n*n:2/2.75>n?7.5625*(n-=1.5/2.75)*n+.75:2.5/2.75>n?7.5625*(n-=2.25/2.75)*n+.9375:7.5625*(n-=2.625/2.75)*n+.984375}function Lu(n,t){n=ta.hcl(n),t=ta.hcl(t);var e=n.h,r=n.c,u=n.l,i=t.h-e,o=t.c-r,a=t.l-u;return isNaN(o)&&(o=0,r=isNaN(r)?t.c:r),isNaN(i)?(i=0,e=isNaN(e)?t.h:e):i>180?i-=360:-180>i&&(i+=360),function(n){return st(e+i*n,r+o*n,u+a*n)+""}}function Tu(n,t){n=ta.hsl(n),t=ta.hsl(t);var e=n.h,r=n.s,u=n.l,i=t.h-e,o=t.s-r,a=t.l-u;return isNaN(o)&&(o=0,r=isNaN(r)?t.s:r),isNaN(i)?(i=0,e=isNaN(e)?t.h:e):i>180?i-=360:-180>i&&(i+=360),function(n){return ct(e+i*n,r+o*n,u+a*n)+""}}function Ru(n,t){n=ta.lab(n),t=ta.lab(t);var e=n.l,r=n.a,u=n.b,i=t.l-e,o=t.a-r,a=t.b-u;return function(n){return ht(e+i*n,r+o*n,u+a*n)+""}}function Du(n,t){return t-=n,function(e){return Math.round(n+t*e)}}function Pu(n){var t=[n.a,n.b],e=[n.c,n.d],r=ju(t),u=Uu(t,e),i=ju(Fu(e,t,-u))||0;t[0]*e[1]<e[0]*t[1]&&(t[0]*=-1,t[1]*=-1,r*=-1,u*=-1),this.rotate=(r?Math.atan2(t[1],t[0]):Math.atan2(-e[0],e[1]))*Pa,this.translate=[n.e,n.f],this.scale=[r,i],this.skew=i?Math.atan2(u,i)*Pa:0}function Uu(n,t){return n[0]*t[0]+n[1]*t[1]}function ju(n){var t=Math.sqrt(Uu(n,n));return t&&(n[0]/=t,n[1]/=t),t}function Fu(n,t,e){return n[0]+=e*t[0],n[1]+=e*t[1],n}function Hu(n,t){var e,r=[],u=[],i=ta.transform(n),o=ta.transform(t),a=i.translate,c=o.translate,l=i.rotate,s=o.rotate,f=i.skew,h=o.skew,g=i.scale,p=o.scale;return a[0]!=c[0]||a[1]!=c[1]?(r.push("translate(",null,",",null,")"),u.push({i:1,x:vu(a[0],c[0])},{i:3,x:vu(a[1],c[1])})):r.push(c[0]||c[1]?"translate("+c+")":""),l!=s?(l-s>180?s+=360:s-l>180&&(l+=360),u.push({i:r.push(r.pop()+"rotate(",null,")")-2,x:vu(l,s)})):s&&r.push(r.pop()+"rotate("+s+")"),f!=h?u.push({i:r.push(r.pop()+"skewX(",null,")")-2,x:vu(f,h)}):h&&r.push(r.pop()+"skewX("+h+")"),g[0]!=p[0]||g[1]!=p[1]?(e=r.push(r.pop()+"scale(",null,",",null,")"),u.push({i:e-4,x:vu(g[0],p[0])},{i:e-2,x:vu(g[1],p[1])})):(1!=p[0]||1!=p[1])&&r.push(r.pop()+"scale("+p+")"),e=u.length,function(n){for(var t,i=-1;++i<e;)r[(t=u[i]).i]=t.x(n);return r.join("")}}function Ou(n,t){return t=(t-=n=+n)||1/t,function(e){return(e-n)/t}}function Iu(n,t){return t=(t-=n=+n)||1/t,function(e){return Math.max(0,Math.min(1,(e-n)/t))}}function Yu(n){for(var t=n.source,e=n.target,r=Vu(t,e),u=[t];t!==r;)t=t.parent,u.push(t);for(var i=u.length;e!==r;)u.splice(i,0,e),e=e.parent;return u}function Zu(n){for(var t=[],e=n.parent;null!=e;)t.push(n),n=e,e=e.parent;return t.push(n),t}function Vu(n,t){if(n===t)return n;for(var e=Zu(n),r=Zu(t),u=e.pop(),i=r.pop(),o=null;u===i;)o=u,u=e.pop(),i=r.pop();return o}function Xu(n){n.fixed|=2}function $u(n){n.fixed&=-7}function Bu(n){n.fixed|=4,n.px=n.x,n.py=n.y}function Wu(n){n.fixed&=-5}function Ju(n,t,e){var r=0,u=0;if(n.charge=0,!n.leaf)for(var i,o=n.nodes,a=o.length,c=-1;++c<a;)i=o[c],null!=i&&(Ju(i,t,e),n.charge+=i.charge,r+=i.charge*i.cx,u+=i.charge*i.cy);if(n.point){n.leaf||(n.point.x+=Math.random()-.5,n.point.y+=Math.random()-.5);var l=t*e[n.point.index];n.charge+=n.pointCharge=l,r+=l*n.point.x,u+=l*n.point.y}n.cx=r/n.charge,n.cy=u/n.charge}function Gu(n,t){return ta.rebind(n,t,"sort","children","value"),n.nodes=n,n.links=ri,n}function Ku(n,t){for(var e=[n];null!=(n=e.pop());)if(t(n),(u=n.children)&&(r=u.length))for(var r,u;--r>=0;)e.push(u[r])}function Qu(n,t){for(var e=[n],r=[];null!=(n=e.pop());)if(r.push(n),(i=n.children)&&(u=i.length))for(var u,i,o=-1;++o<u;)e.push(i[o]);for(;null!=(n=r.pop());)t(n)}function ni(n){return n.children}function ti(n){return n.value}function ei(n,t){return t.value-n.value}function ri(n){return ta.merge(n.map(function(n){return(n.children||[]).map(function(t){return{source:n,target:t}})}))}function ui(n){return n.x}function ii(n){return n.y}function oi(n,t,e){n.y0=t,n.y=e}function ai(n){return ta.range(n.length)}function ci(n){for(var t=-1,e=n[0].length,r=[];++t<e;)r[t]=0;return r}function li(n){for(var t,e=1,r=0,u=n[0][1],i=n.length;i>e;++e)(t=n[e][1])>u&&(r=e,u=t);return r}function si(n){return n.reduce(fi,0)}function fi(n,t){return n+t[1]}function hi(n,t){return gi(n,Math.ceil(Math.log(t.length)/Math.LN2+1))}function gi(n,t){for(var e=-1,r=+n[0],u=(n[1]-r)/t,i=[];++e<=t;)i[e]=u*e+r;return i}function pi(n){return[ta.min(n),ta.max(n)]}function vi(n,t){return n.value-t.value}function di(n,t){var e=n._pack_next;n._pack_next=t,t._pack_prev=n,t._pack_next=e,e._pack_prev=t}function mi(n,t){n._pack_next=t,t._pack_prev=n}function yi(n,t){var e=t.x-n.x,r=t.y-n.y,u=n.r+t.r;return.999*u*u>e*e+r*r}function Mi(n){function t(n){s=Math.min(n.x-n.r,s),f=Math.max(n.x+n.r,f),h=Math.min(n.y-n.r,h),g=Math.max(n.y+n.r,g)}if((e=n.children)&&(l=e.length)){var e,r,u,i,o,a,c,l,s=1/0,f=-1/0,h=1/0,g=-1/0;if(e.forEach(xi),r=e[0],r.x=-r.r,r.y=0,t(r),l>1&&(u=e[1],u.x=u.r,u.y=0,t(u),l>2))for(i=e[2],wi(r,u,i),t(i),di(r,i),r._pack_prev=i,di(i,u),u=r._pack_next,o=3;l>o;o++){wi(r,u,i=e[o]);var p=0,v=1,d=1;for(a=u._pack_next;a!==u;a=a._pack_next,v++)if(yi(a,i)){p=1;break}if(1==p)for(c=r._pack_prev;c!==a._pack_prev&&!yi(c,i);c=c._pack_prev,d++);p?(d>v||v==d&&u.r<r.r?mi(r,u=a):mi(r=c,u),o--):(di(r,i),u=i,t(i))}var m=(s+f)/2,y=(h+g)/2,M=0;for(o=0;l>o;o++)i=e[o],i.x-=m,i.y-=y,M=Math.max(M,i.r+Math.sqrt(i.x*i.x+i.y*i.y));n.r=M,e.forEach(bi)}}function xi(n){n._pack_next=n._pack_prev=n}function bi(n){delete n._pack_next,delete n._pack_prev}function _i(n,t,e,r){var u=n.children;if(n.x=t+=r*n.x,n.y=e+=r*n.y,n.r*=r,u)for(var i=-1,o=u.length;++i<o;)_i(u[i],t,e,r)}function wi(n,t,e){var r=n.r+e.r,u=t.x-n.x,i=t.y-n.y;if(r&&(u||i)){var o=t.r+e.r,a=u*u+i*i;o*=o,r*=r;var c=.5+(r-o)/(2*a),l=Math.sqrt(Math.max(0,2*o*(r+a)-(r-=a)*r-o*o))/(2*a);e.x=n.x+c*u+l*i,e.y=n.y+c*i-l*u}else e.x=n.x+r,e.y=n.y}function Si(n,t){return n.parent==t.parent?1:2}function ki(n){var t=n.children;return t.length?t[0]:n.t}function Ei(n){var t,e=n.children;return(t=e.length)?e[t-1]:n.t}function Ai(n,t,e){var r=e/(t.i-n.i);t.c-=r,t.s+=e,n.c+=r,t.z+=e,t.m+=e}function Ni(n){for(var t,e=0,r=0,u=n.children,i=u.length;--i>=0;)t=u[i],t.z+=e,t.m+=e,e+=t.s+(r+=t.c)}function Ci(n,t,e){return n.a.parent===t.parent?n.a:e}function zi(n){return 1+ta.max(n,function(n){return n.y})}function qi(n){return n.reduce(function(n,t){return n+t.x},0)/n.length}function Li(n){var t=n.children;return t&&t.length?Li(t[0]):n}function Ti(n){var t,e=n.children;return e&&(t=e.length)?Ti(e[t-1]):n}function Ri(n){return{x:n.x,y:n.y,dx:n.dx,dy:n.dy}}function Di(n,t){var e=n.x+t[3],r=n.y+t[0],u=n.dx-t[1]-t[3],i=n.dy-t[0]-t[2];return 0>u&&(e+=u/2,u=0),0>i&&(r+=i/2,i=0),{x:e,y:r,dx:u,dy:i}}function Pi(n){var t=n[0],e=n[n.length-1];return e>t?[t,e]:[e,t]}function Ui(n){return n.rangeExtent?n.rangeExtent():Pi(n.range())}function ji(n,t,e,r){var u=e(n[0],n[1]),i=r(t[0],t[1]);return function(n){return i(u(n))}}function Fi(n,t){var e,r=0,u=n.length-1,i=n[r],o=n[u];return i>o&&(e=r,r=u,u=e,e=i,i=o,o=e),n[r]=t.floor(i),n[u]=t.ceil(o),n}function Hi(n){return n?{floor:function(t){return Math.floor(t/n)*n},ceil:function(t){return Math.ceil(t/n)*n}}:ml}function Oi(n,t,e,r){var u=[],i=[],o=0,a=Math.min(n.length,t.length)-1;for(n[a]<n[0]&&(n=n.slice().reverse(),t=t.slice().reverse());++o<=a;)u.push(e(n[o-1],n[o])),i.push(r(t[o-1],t[o]));return function(t){var e=ta.bisect(n,t,1,a)-1;return i[e](u[e](t))}}function Ii(n,t,e,r){function u(){var u=Math.min(n.length,t.length)>2?Oi:ji,c=r?Iu:Ou;return o=u(n,t,c,e),a=u(t,n,c,mu),i}function i(n){return o(n)}var o,a;return i.invert=function(n){return a(n)},i.domain=function(t){return arguments.length?(n=t.map(Number),u()):n},i.range=function(n){return arguments.length?(t=n,u()):t},i.rangeRound=function(n){return i.range(n).interpolate(Du)},i.clamp=function(n){return arguments.length?(r=n,u()):r},i.interpolate=function(n){return arguments.length?(e=n,u()):e},i.ticks=function(t){return Xi(n,t)},i.tickFormat=function(t,e){return $i(n,t,e)},i.nice=function(t){return Zi(n,t),u()},i.copy=function(){return Ii(n,t,e,r)},u()}function Yi(n,t){return ta.rebind(n,t,"range","rangeRound","interpolate","clamp")}function Zi(n,t){return Fi(n,Hi(Vi(n,t)[2]))}function Vi(n,t){null==t&&(t=10);var e=Pi(n),r=e[1]-e[0],u=Math.pow(10,Math.floor(Math.log(r/t)/Math.LN10)),i=t/r*u;return.15>=i?u*=10:.35>=i?u*=5:.75>=i&&(u*=2),e[0]=Math.ceil(e[0]/u)*u,e[1]=Math.floor(e[1]/u)*u+.5*u,e[2]=u,e}function Xi(n,t){return ta.range.apply(ta,Vi(n,t))}function $i(n,t,e){var r=Vi(n,t);if(e){var u=ic.exec(e);if(u.shift(),"s"===u[8]){var i=ta.formatPrefix(Math.max(ga(r[0]),ga(r[1])));return u[7]||(u[7]="."+Bi(i.scale(r[2]))),u[8]="f",e=ta.format(u.join("")),function(n){return e(i.scale(n))+i.symbol}}u[7]||(u[7]="."+Wi(u[8],r)),e=u.join("")}else e=",."+Bi(r[2])+"f";return ta.format(e)}function Bi(n){return-Math.floor(Math.log(n)/Math.LN10+.01)}function Wi(n,t){var e=Bi(t[2]);return n in yl?Math.abs(e-Bi(Math.max(ga(t[0]),ga(t[1]))))+ +("e"!==n):e-2*("%"===n)}function Ji(n,t,e,r){function u(n){return(e?Math.log(0>n?0:n):-Math.log(n>0?0:-n))/Math.log(t)}function i(n){return e?Math.pow(t,n):-Math.pow(t,-n)}function o(t){return n(u(t))}return o.invert=function(t){return i(n.invert(t))},o.domain=function(t){return arguments.length?(e=t[0]>=0,n.domain((r=t.map(Number)).map(u)),o):r},o.base=function(e){return arguments.length?(t=+e,n.domain(r.map(u)),o):t},o.nice=function(){var t=Fi(r.map(u),e?Math:xl);return n.domain(t),r=t.map(i),o},o.ticks=function(){var n=Pi(r),o=[],a=n[0],c=n[1],l=Math.floor(u(a)),s=Math.ceil(u(c)),f=t%1?2:t;if(isFinite(s-l)){if(e){for(;s>l;l++)for(var h=1;f>h;h++)o.push(i(l)*h);o.push(i(l))}else for(o.push(i(l));l++<s;)for(var h=f-1;h>0;h--)o.push(i(l)*h);for(l=0;o[l]<a;l++);for(s=o.length;o[s-1]>c;s--);o=o.slice(l,s)}return o},o.tickFormat=function(n,t){if(!arguments.length)return Ml;arguments.length<2?t=Ml:"function"!=typeof t&&(t=ta.format(t));var r,a=Math.max(.1,n/o.ticks().length),c=e?(r=1e-12,Math.ceil):(r=-1e-12,Math.floor);return function(n){return n/i(c(u(n)+r))<=a?t(n):""}},o.copy=function(){return Ji(n.copy(),t,e,r)},Yi(o,n)}function Gi(n,t,e){function r(t){return n(u(t))}var u=Ki(t),i=Ki(1/t);return r.invert=function(t){return i(n.invert(t))},r.domain=function(t){return arguments.length?(n.domain((e=t.map(Number)).map(u)),r):e},r.ticks=function(n){return Xi(e,n)},r.tickFormat=function(n,t){return $i(e,n,t)},r.nice=function(n){return r.domain(Zi(e,n))},r.exponent=function(o){return arguments.length?(u=Ki(t=o),i=Ki(1/t),n.domain(e.map(u)),r):t},r.copy=function(){return Gi(n.copy(),t,e)},Yi(r,n)}function Ki(n){return function(t){return 0>t?-Math.pow(-t,n):Math.pow(t,n)}}function Qi(n,t){function e(e){return i[((u.get(e)||("range"===t.t?u.set(e,n.push(e)):0/0))-1)%i.length]}function r(t,e){return ta.range(n.length).map(function(n){return t+e*n})}var u,i,o;return e.domain=function(r){if(!arguments.length)return n;n=[],u=new l;for(var i,o=-1,a=r.length;++o<a;)u.has(i=r[o])||u.set(i,n.push(i));return e[t.t].apply(e,t.a)},e.range=function(n){return arguments.length?(i=n,o=0,t={t:"range",a:arguments},e):i},e.rangePoints=function(u,a){arguments.length<2&&(a=0);var c=u[0],l=u[1],s=n.length<2?(c=(c+l)/2,0):(l-c)/(n.length-1+a);return i=r(c+s*a/2,s),o=0,t={t:"rangePoints",a:arguments},e},e.rangeRoundPoints=function(u,a){arguments.length<2&&(a=0);var c=u[0],l=u[1],s=n.length<2?(c=l=Math.round((c+l)/2),0):(l-c)/(n.length-1+a)|0;return i=r(c+Math.round(s*a/2+(l-c-(n.length-1+a)*s)/2),s),o=0,t={t:"rangeRoundPoints",a:arguments},e},e.rangeBands=function(u,a,c){arguments.length<2&&(a=0),arguments.length<3&&(c=a);var l=u[1]<u[0],s=u[l-0],f=u[1-l],h=(f-s)/(n.length-a+2*c);return i=r(s+h*c,h),l&&i.reverse(),o=h*(1-a),t={t:"rangeBands",a:arguments},e},e.rangeRoundBands=function(u,a,c){arguments.length<2&&(a=0),arguments.length<3&&(c=a);var l=u[1]<u[0],s=u[l-0],f=u[1-l],h=Math.floor((f-s)/(n.length-a+2*c));return i=r(s+Math.round((f-s-(n.length-a)*h)/2),h),l&&i.reverse(),o=Math.round(h*(1-a)),t={t:"rangeRoundBands",a:arguments},e},e.rangeBand=function(){return o},e.rangeExtent=function(){return Pi(t.a[0])},e.copy=function(){return Qi(n,t)},e.domain(n)}function no(n,t){function i(){var e=0,r=t.length;for(a=[];++e<r;)a[e-1]=ta.quantile(n,e/r);return o}function o(n){return isNaN(n=+n)?void 0:t[ta.bisect(a,n)]}var a;return o.domain=function(t){return arguments.length?(n=t.map(r).filter(u).sort(e),i()):n},o.range=function(n){return arguments.length?(t=n,i()):t},o.quantiles=function(){return a},o.invertExtent=function(e){return e=t.indexOf(e),0>e?[0/0,0/0]:[e>0?a[e-1]:n[0],e<a.length?a[e]:n[n.length-1]]},o.copy=function(){return no(n,t)},i()}function to(n,t,e){function r(t){return e[Math.max(0,Math.min(o,Math.floor(i*(t-n))))]}function u(){return i=e.length/(t-n),o=e.length-1,r}var i,o;return r.domain=function(e){return arguments.length?(n=+e[0],t=+e[e.length-1],u()):[n,t]},r.range=function(n){return arguments.length?(e=n,u()):e},r.invertExtent=function(t){return t=e.indexOf(t),t=0>t?0/0:t/i+n,[t,t+1/i]},r.copy=function(){return to(n,t,e)},u()}function eo(n,t){function e(e){return e>=e?t[ta.bisect(n,e)]:void 0}return e.domain=function(t){return arguments.length?(n=t,e):n},e.range=function(n){return arguments.length?(t=n,e):t},e.invertExtent=function(e){return e=t.indexOf(e),[n[e-1],n[e]]},e.copy=function(){return eo(n,t)},e}function ro(n){function t(n){return+n}return t.invert=t,t.domain=t.range=function(e){return arguments.length?(n=e.map(t),t):n},t.ticks=function(t){return Xi(n,t)},t.tickFormat=function(t,e){return $i(n,t,e)},t.copy=function(){return ro(n)},t}function uo(){return 0}function io(n){return n.innerRadius}function oo(n){return n.outerRadius}function ao(n){return n.startAngle}function co(n){return n.endAngle}function lo(n){return n&&n.padAngle}function so(n,t,e,r){return(n-e)*t-(t-r)*n>0?0:1}function fo(n,t,e,r,u){var i=n[0]-t[0],o=n[1]-t[1],a=(u?r:-r)/Math.sqrt(i*i+o*o),c=a*o,l=-a*i,s=n[0]+c,f=n[1]+l,h=t[0]+c,g=t[1]+l,p=(s+h)/2,v=(f+g)/2,d=h-s,m=g-f,y=d*d+m*m,M=e-r,x=s*g-h*f,b=(0>m?-1:1)*Math.sqrt(M*M*y-x*x),_=(x*m-d*b)/y,w=(-x*d-m*b)/y,S=(x*m+d*b)/y,k=(-x*d+m*b)/y,E=_-p,A=w-v,N=S-p,C=k-v;return E*E+A*A>N*N+C*C&&(_=S,w=k),[[_-c,w-l],[_*e/M,w*e/M]]}function ho(n){function t(t){function o(){l.push("M",i(n(s),a))}for(var c,l=[],s=[],f=-1,h=t.length,g=Et(e),p=Et(r);++f<h;)u.call(this,c=t[f],f)?s.push([+g.call(this,c,f),+p.call(this,c,f)]):s.length&&(o(),s=[]);return s.length&&o(),l.length?l.join(""):null}var e=Ar,r=Nr,u=Ne,i=go,o=i.key,a=.7;return t.x=function(n){return arguments.length?(e=n,t):e},t.y=function(n){return arguments.length?(r=n,t):r},t.defined=function(n){return arguments.length?(u=n,t):u},t.interpolate=function(n){return arguments.length?(o="function"==typeof n?i=n:(i=El.get(n)||go).key,t):o},t.tension=function(n){return arguments.length?(a=n,t):a},t}function go(n){return n.join("L")}function po(n){return go(n)+"Z"}function vo(n){for(var t=0,e=n.length,r=n[0],u=[r[0],",",r[1]];++t<e;)u.push("H",(r[0]+(r=n[t])[0])/2,"V",r[1]);return e>1&&u.push("H",r[0]),u.join("")}function mo(n){for(var t=0,e=n.length,r=n[0],u=[r[0],",",r[1]];++t<e;)u.push("V",(r=n[t])[1],"H",r[0]);return u.join("")}function yo(n){for(var t=0,e=n.length,r=n[0],u=[r[0],",",r[1]];++t<e;)u.push("H",(r=n[t])[0],"V",r[1]);return u.join("")}function Mo(n,t){return n.length<4?go(n):n[1]+_o(n.slice(1,-1),wo(n,t))}function xo(n,t){return n.length<3?go(n):n[0]+_o((n.push(n[0]),n),wo([n[n.length-2]].concat(n,[n[1]]),t))}function bo(n,t){return n.length<3?go(n):n[0]+_o(n,wo(n,t))}function _o(n,t){if(t.length<1||n.length!=t.length&&n.length!=t.length+2)return go(n);var e=n.length!=t.length,r="",u=n[0],i=n[1],o=t[0],a=o,c=1;if(e&&(r+="Q"+(i[0]-2*o[0]/3)+","+(i[1]-2*o[1]/3)+","+i[0]+","+i[1],u=n[1],c=2),t.length>1){a=t[1],i=n[c],c++,r+="C"+(u[0]+o[0])+","+(u[1]+o[1])+","+(i[0]-a[0])+","+(i[1]-a[1])+","+i[0]+","+i[1];for(var l=2;l<t.length;l++,c++)i=n[c],a=t[l],r+="S"+(i[0]-a[0])+","+(i[1]-a[1])+","+i[0]+","+i[1]}if(e){var s=n[c];r+="Q"+(i[0]+2*a[0]/3)+","+(i[1]+2*a[1]/3)+","+s[0]+","+s[1]}return r}function wo(n,t){for(var e,r=[],u=(1-t)/2,i=n[0],o=n[1],a=1,c=n.length;++a<c;)e=i,i=o,o=n[a],r.push([u*(o[0]-e[0]),u*(o[1]-e[1])]);return r}function So(n){if(n.length<3)return go(n);var t=1,e=n.length,r=n[0],u=r[0],i=r[1],o=[u,u,u,(r=n[1])[0]],a=[i,i,i,r[1]],c=[u,",",i,"L",No(Cl,o),",",No(Cl,a)];for(n.push(n[e-1]);++t<=e;)r=n[t],o.shift(),o.push(r[0]),a.shift(),a.push(r[1]),Co(c,o,a);return n.pop(),c.push("L",r),c.join("")}function ko(n){if(n.length<4)return go(n);for(var t,e=[],r=-1,u=n.length,i=[0],o=[0];++r<3;)t=n[r],i.push(t[0]),o.push(t[1]);for(e.push(No(Cl,i)+","+No(Cl,o)),--r;++r<u;)t=n[r],i.shift(),i.push(t[0]),o.shift(),o.push(t[1]),Co(e,i,o);return e.join("")}function Eo(n){for(var t,e,r=-1,u=n.length,i=u+4,o=[],a=[];++r<4;)e=n[r%u],o.push(e[0]),a.push(e[1]);for(t=[No(Cl,o),",",No(Cl,a)],--r;++r<i;)e=n[r%u],o.shift(),o.push(e[0]),a.shift(),a.push(e[1]),Co(t,o,a);return t.join("")}function Ao(n,t){var e=n.length-1;if(e)for(var r,u,i=n[0][0],o=n[0][1],a=n[e][0]-i,c=n[e][1]-o,l=-1;++l<=e;)r=n[l],u=l/e,r[0]=t*r[0]+(1-t)*(i+u*a),r[1]=t*r[1]+(1-t)*(o+u*c);return So(n)}function No(n,t){return n[0]*t[0]+n[1]*t[1]+n[2]*t[2]+n[3]*t[3]}function Co(n,t,e){n.push("C",No(Al,t),",",No(Al,e),",",No(Nl,t),",",No(Nl,e),",",No(Cl,t),",",No(Cl,e))}function zo(n,t){return(t[1]-n[1])/(t[0]-n[0])}function qo(n){for(var t=0,e=n.length-1,r=[],u=n[0],i=n[1],o=r[0]=zo(u,i);++t<e;)r[t]=(o+(o=zo(u=i,i=n[t+1])))/2;return r[t]=o,r}function Lo(n){for(var t,e,r,u,i=[],o=qo(n),a=-1,c=n.length-1;++a<c;)t=zo(n[a],n[a+1]),ga(t)<Ca?o[a]=o[a+1]=0:(e=o[a]/t,r=o[a+1]/t,u=e*e+r*r,u>9&&(u=3*t/Math.sqrt(u),o[a]=u*e,o[a+1]=u*r));for(a=-1;++a<=c;)u=(n[Math.min(c,a+1)][0]-n[Math.max(0,a-1)][0])/(6*(1+o[a]*o[a])),i.push([u||0,o[a]*u||0]);return i}function To(n){return n.length<3?go(n):n[0]+_o(n,Lo(n))}function Ro(n){for(var t,e,r,u=-1,i=n.length;++u<i;)t=n[u],e=t[0],r=t[1]-Ra,t[0]=e*Math.cos(r),t[1]=e*Math.sin(r);return n}function Do(n){function t(t){function c(){v.push("M",a(n(m),f),s,l(n(d.reverse()),f),"Z")}for(var h,g,p,v=[],d=[],m=[],y=-1,M=t.length,x=Et(e),b=Et(u),_=e===r?function(){return g}:Et(r),w=u===i?function(){return p}:Et(i);++y<M;)o.call(this,h=t[y],y)?(d.push([g=+x.call(this,h,y),p=+b.call(this,h,y)]),m.push([+_.call(this,h,y),+w.call(this,h,y)])):d.length&&(c(),d=[],m=[]);return d.length&&c(),v.length?v.join(""):null}var e=Ar,r=Ar,u=0,i=Nr,o=Ne,a=go,c=a.key,l=a,s="L",f=.7;return t.x=function(n){return arguments.length?(e=r=n,t):r},t.x0=function(n){return arguments.length?(e=n,t):e},t.x1=function(n){return arguments.length?(r=n,t):r
},t.y=function(n){return arguments.length?(u=i=n,t):i},t.y0=function(n){return arguments.length?(u=n,t):u},t.y1=function(n){return arguments.length?(i=n,t):i},t.defined=function(n){return arguments.length?(o=n,t):o},t.interpolate=function(n){return arguments.length?(c="function"==typeof n?a=n:(a=El.get(n)||go).key,l=a.reverse||a,s=a.closed?"M":"L",t):c},t.tension=function(n){return arguments.length?(f=n,t):f},t}function Po(n){return n.radius}function Uo(n){return[n.x,n.y]}function jo(n){return function(){var t=n.apply(this,arguments),e=t[0],r=t[1]-Ra;return[e*Math.cos(r),e*Math.sin(r)]}}function Fo(){return 64}function Ho(){return"circle"}function Oo(n){var t=Math.sqrt(n/qa);return"M0,"+t+"A"+t+","+t+" 0 1,1 0,"+-t+"A"+t+","+t+" 0 1,1 0,"+t+"Z"}function Io(n){return function(){var t,e;(t=this[n])&&(e=t[t.active])&&(--t.count?delete t[t.active]:delete this[n],t.active+=.5,e.event&&e.event.interrupt.call(this,this.__data__,e.index))}}function Yo(n,t,e){return ya(n,Pl),n.namespace=t,n.id=e,n}function Zo(n,t,e,r){var u=n.id,i=n.namespace;return Y(n,"function"==typeof e?function(n,o,a){n[i][u].tween.set(t,r(e.call(n,n.__data__,o,a)))}:(e=r(e),function(n){n[i][u].tween.set(t,e)}))}function Vo(n){return null==n&&(n=""),function(){this.textContent=n}}function Xo(n){return null==n?"__transition__":"__transition_"+n+"__"}function $o(n,t,e,r,u){var i=n[e]||(n[e]={active:0,count:0}),o=i[r];if(!o){var a=u.time;o=i[r]={tween:new l,time:a,delay:u.delay,duration:u.duration,ease:u.ease,index:t},u=null,++i.count,ta.timer(function(u){function c(e){if(i.active>r)return s();var u=i[i.active];u&&(--i.count,delete i[i.active],u.event&&u.event.interrupt.call(n,n.__data__,u.index)),i.active=r,o.event&&o.event.start.call(n,n.__data__,t),o.tween.forEach(function(e,r){(r=r.call(n,n.__data__,t))&&v.push(r)}),h=o.ease,f=o.duration,ta.timer(function(){return p.c=l(e||1)?Ne:l,1},0,a)}function l(e){if(i.active!==r)return 1;for(var u=e/f,a=h(u),c=v.length;c>0;)v[--c].call(n,a);return u>=1?(o.event&&o.event.end.call(n,n.__data__,t),s()):void 0}function s(){return--i.count?delete i[r]:delete n[e],1}var f,h,g=o.delay,p=ec,v=[];return p.t=g+a,u>=g?c(u-g):void(p.c=c)},0,a)}}function Bo(n,t,e){n.attr("transform",function(n){var r=t(n);return"translate("+(isFinite(r)?r:e(n))+",0)"})}function Wo(n,t,e){n.attr("transform",function(n){var r=t(n);return"translate(0,"+(isFinite(r)?r:e(n))+")"})}function Jo(n){return n.toISOString()}function Go(n,t,e){function r(t){return n(t)}function u(n,e){var r=n[1]-n[0],u=r/e,i=ta.bisect(Vl,u);return i==Vl.length?[t.year,Vi(n.map(function(n){return n/31536e6}),e)[2]]:i?t[u/Vl[i-1]<Vl[i]/u?i-1:i]:[Bl,Vi(n,e)[2]]}return r.invert=function(t){return Ko(n.invert(t))},r.domain=function(t){return arguments.length?(n.domain(t),r):n.domain().map(Ko)},r.nice=function(n,t){function e(e){return!isNaN(e)&&!n.range(e,Ko(+e+1),t).length}var i=r.domain(),o=Pi(i),a=null==n?u(o,10):"number"==typeof n&&u(o,n);return a&&(n=a[0],t=a[1]),r.domain(Fi(i,t>1?{floor:function(t){for(;e(t=n.floor(t));)t=Ko(t-1);return t},ceil:function(t){for(;e(t=n.ceil(t));)t=Ko(+t+1);return t}}:n))},r.ticks=function(n,t){var e=Pi(r.domain()),i=null==n?u(e,10):"number"==typeof n?u(e,n):!n.range&&[{range:n},t];return i&&(n=i[0],t=i[1]),n.range(e[0],Ko(+e[1]+1),1>t?1:t)},r.tickFormat=function(){return e},r.copy=function(){return Go(n.copy(),t,e)},Yi(r,n)}function Ko(n){return new Date(n)}function Qo(n){return JSON.parse(n.responseText)}function na(n){var t=ua.createRange();return t.selectNode(ua.body),t.createContextualFragment(n.responseText)}var ta={version:"3.5.5"},ea=[].slice,ra=function(n){return ea.call(n)},ua=this.document;if(ua)try{ra(ua.documentElement.childNodes)[0].nodeType}catch(ia){ra=function(n){for(var t=n.length,e=new Array(t);t--;)e[t]=n[t];return e}}if(Date.now||(Date.now=function(){return+new Date}),ua)try{ua.createElement("DIV").style.setProperty("opacity",0,"")}catch(oa){var aa=this.Element.prototype,ca=aa.setAttribute,la=aa.setAttributeNS,sa=this.CSSStyleDeclaration.prototype,fa=sa.setProperty;aa.setAttribute=function(n,t){ca.call(this,n,t+"")},aa.setAttributeNS=function(n,t,e){la.call(this,n,t,e+"")},sa.setProperty=function(n,t,e){fa.call(this,n,t+"",e)}}ta.ascending=e,ta.descending=function(n,t){return n>t?-1:t>n?1:t>=n?0:0/0},ta.min=function(n,t){var e,r,u=-1,i=n.length;if(1===arguments.length){for(;++u<i;)if(null!=(r=n[u])&&r>=r){e=r;break}for(;++u<i;)null!=(r=n[u])&&e>r&&(e=r)}else{for(;++u<i;)if(null!=(r=t.call(n,n[u],u))&&r>=r){e=r;break}for(;++u<i;)null!=(r=t.call(n,n[u],u))&&e>r&&(e=r)}return e},ta.max=function(n,t){var e,r,u=-1,i=n.length;if(1===arguments.length){for(;++u<i;)if(null!=(r=n[u])&&r>=r){e=r;break}for(;++u<i;)null!=(r=n[u])&&r>e&&(e=r)}else{for(;++u<i;)if(null!=(r=t.call(n,n[u],u))&&r>=r){e=r;break}for(;++u<i;)null!=(r=t.call(n,n[u],u))&&r>e&&(e=r)}return e},ta.extent=function(n,t){var e,r,u,i=-1,o=n.length;if(1===arguments.length){for(;++i<o;)if(null!=(r=n[i])&&r>=r){e=u=r;break}for(;++i<o;)null!=(r=n[i])&&(e>r&&(e=r),r>u&&(u=r))}else{for(;++i<o;)if(null!=(r=t.call(n,n[i],i))&&r>=r){e=u=r;break}for(;++i<o;)null!=(r=t.call(n,n[i],i))&&(e>r&&(e=r),r>u&&(u=r))}return[e,u]},ta.sum=function(n,t){var e,r=0,i=n.length,o=-1;if(1===arguments.length)for(;++o<i;)u(e=+n[o])&&(r+=e);else for(;++o<i;)u(e=+t.call(n,n[o],o))&&(r+=e);return r},ta.mean=function(n,t){var e,i=0,o=n.length,a=-1,c=o;if(1===arguments.length)for(;++a<o;)u(e=r(n[a]))?i+=e:--c;else for(;++a<o;)u(e=r(t.call(n,n[a],a)))?i+=e:--c;return c?i/c:void 0},ta.quantile=function(n,t){var e=(n.length-1)*t+1,r=Math.floor(e),u=+n[r-1],i=e-r;return i?u+i*(n[r]-u):u},ta.median=function(n,t){var i,o=[],a=n.length,c=-1;if(1===arguments.length)for(;++c<a;)u(i=r(n[c]))&&o.push(i);else for(;++c<a;)u(i=r(t.call(n,n[c],c)))&&o.push(i);return o.length?ta.quantile(o.sort(e),.5):void 0},ta.variance=function(n,t){var e,i,o=n.length,a=0,c=0,l=-1,s=0;if(1===arguments.length)for(;++l<o;)u(e=r(n[l]))&&(i=e-a,a+=i/++s,c+=i*(e-a));else for(;++l<o;)u(e=r(t.call(n,n[l],l)))&&(i=e-a,a+=i/++s,c+=i*(e-a));return s>1?c/(s-1):void 0},ta.deviation=function(){var n=ta.variance.apply(this,arguments);return n?Math.sqrt(n):n};var ha=i(e);ta.bisectLeft=ha.left,ta.bisect=ta.bisectRight=ha.right,ta.bisector=function(n){return i(1===n.length?function(t,r){return e(n(t),r)}:n)},ta.shuffle=function(n,t,e){(i=arguments.length)<3&&(e=n.length,2>i&&(t=0));for(var r,u,i=e-t;i;)u=Math.random()*i--|0,r=n[i+t],n[i+t]=n[u+t],n[u+t]=r;return n},ta.permute=function(n,t){for(var e=t.length,r=new Array(e);e--;)r[e]=n[t[e]];return r},ta.pairs=function(n){for(var t,e=0,r=n.length-1,u=n[0],i=new Array(0>r?0:r);r>e;)i[e]=[t=u,u=n[++e]];return i},ta.zip=function(){if(!(r=arguments.length))return[];for(var n=-1,t=ta.min(arguments,o),e=new Array(t);++n<t;)for(var r,u=-1,i=e[n]=new Array(r);++u<r;)i[u]=arguments[u][n];return e},ta.transpose=function(n){return ta.zip.apply(ta,n)},ta.keys=function(n){var t=[];for(var e in n)t.push(e);return t},ta.values=function(n){var t=[];for(var e in n)t.push(n[e]);return t},ta.entries=function(n){var t=[];for(var e in n)t.push({key:e,value:n[e]});return t},ta.merge=function(n){for(var t,e,r,u=n.length,i=-1,o=0;++i<u;)o+=n[i].length;for(e=new Array(o);--u>=0;)for(r=n[u],t=r.length;--t>=0;)e[--o]=r[t];return e};var ga=Math.abs;ta.range=function(n,t,e){if(arguments.length<3&&(e=1,arguments.length<2&&(t=n,n=0)),(t-n)/e===1/0)throw new Error("infinite range");var r,u=[],i=a(ga(e)),o=-1;if(n*=i,t*=i,e*=i,0>e)for(;(r=n+e*++o)>t;)u.push(r/i);else for(;(r=n+e*++o)<t;)u.push(r/i);return u},ta.map=function(n,t){var e=new l;if(n instanceof l)n.forEach(function(n,t){e.set(n,t)});else if(Array.isArray(n)){var r,u=-1,i=n.length;if(1===arguments.length)for(;++u<i;)e.set(u,n[u]);else for(;++u<i;)e.set(t.call(n,r=n[u],u),r)}else for(var o in n)e.set(o,n[o]);return e};var pa="__proto__",va="\x00";c(l,{has:h,get:function(n){return this._[s(n)]},set:function(n,t){return this._[s(n)]=t},remove:g,keys:p,values:function(){var n=[];for(var t in this._)n.push(this._[t]);return n},entries:function(){var n=[];for(var t in this._)n.push({key:f(t),value:this._[t]});return n},size:v,empty:d,forEach:function(n){for(var t in this._)n.call(this,f(t),this._[t])}}),ta.nest=function(){function n(t,o,a){if(a>=i.length)return r?r.call(u,o):e?o.sort(e):o;for(var c,s,f,h,g=-1,p=o.length,v=i[a++],d=new l;++g<p;)(h=d.get(c=v(s=o[g])))?h.push(s):d.set(c,[s]);return t?(s=t(),f=function(e,r){s.set(e,n(t,r,a))}):(s={},f=function(e,r){s[e]=n(t,r,a)}),d.forEach(f),s}function t(n,e){if(e>=i.length)return n;var r=[],u=o[e++];return n.forEach(function(n,u){r.push({key:n,values:t(u,e)})}),u?r.sort(function(n,t){return u(n.key,t.key)}):r}var e,r,u={},i=[],o=[];return u.map=function(t,e){return n(e,t,0)},u.entries=function(e){return t(n(ta.map,e,0),0)},u.key=function(n){return i.push(n),u},u.sortKeys=function(n){return o[i.length-1]=n,u},u.sortValues=function(n){return e=n,u},u.rollup=function(n){return r=n,u},u},ta.set=function(n){var t=new m;if(n)for(var e=0,r=n.length;r>e;++e)t.add(n[e]);return t},c(m,{has:h,add:function(n){return this._[s(n+="")]=!0,n},remove:g,values:p,size:v,empty:d,forEach:function(n){for(var t in this._)n.call(this,f(t))}}),ta.behavior={},ta.rebind=function(n,t){for(var e,r=1,u=arguments.length;++r<u;)n[e=arguments[r]]=M(n,t,t[e]);return n};var da=["webkit","ms","moz","Moz","o","O"];ta.dispatch=function(){for(var n=new _,t=-1,e=arguments.length;++t<e;)n[arguments[t]]=w(n);return n},_.prototype.on=function(n,t){var e=n.indexOf("."),r="";if(e>=0&&(r=n.slice(e+1),n=n.slice(0,e)),n)return arguments.length<2?this[n].on(r):this[n].on(r,t);if(2===arguments.length){if(null==t)for(n in this)this.hasOwnProperty(n)&&this[n].on(r,null);return this}},ta.event=null,ta.requote=function(n){return n.replace(ma,"\\$&")};var ma=/[\\\^\$\*\+\?\|\[\]\(\)\.\{\}]/g,ya={}.__proto__?function(n,t){n.__proto__=t}:function(n,t){for(var e in t)n[e]=t[e]},Ma=function(n,t){return t.querySelector(n)},xa=function(n,t){return t.querySelectorAll(n)},ba=function(n,t){var e=n.matches||n[x(n,"matchesSelector")];return(ba=function(n,t){return e.call(n,t)})(n,t)};"function"==typeof Sizzle&&(Ma=function(n,t){return Sizzle(n,t)[0]||null},xa=Sizzle,ba=Sizzle.matchesSelector),ta.selection=function(){return ta.select(ua.documentElement)};var _a=ta.selection.prototype=[];_a.select=function(n){var t,e,r,u,i=[];n=N(n);for(var o=-1,a=this.length;++o<a;){i.push(t=[]),t.parentNode=(r=this[o]).parentNode;for(var c=-1,l=r.length;++c<l;)(u=r[c])?(t.push(e=n.call(u,u.__data__,c,o)),e&&"__data__"in u&&(e.__data__=u.__data__)):t.push(null)}return A(i)},_a.selectAll=function(n){var t,e,r=[];n=C(n);for(var u=-1,i=this.length;++u<i;)for(var o=this[u],a=-1,c=o.length;++a<c;)(e=o[a])&&(r.push(t=ra(n.call(e,e.__data__,a,u))),t.parentNode=e);return A(r)};var wa={svg:"http://www.w3.org/2000/svg",xhtml:"http://www.w3.org/1999/xhtml",xlink:"http://www.w3.org/1999/xlink",xml:"http://www.w3.org/XML/1998/namespace",xmlns:"http://www.w3.org/2000/xmlns/"};ta.ns={prefix:wa,qualify:function(n){var t=n.indexOf(":"),e=n;return t>=0&&(e=n.slice(0,t),n=n.slice(t+1)),wa.hasOwnProperty(e)?{space:wa[e],local:n}:n}},_a.attr=function(n,t){if(arguments.length<2){if("string"==typeof n){var e=this.node();return n=ta.ns.qualify(n),n.local?e.getAttributeNS(n.space,n.local):e.getAttribute(n)}for(t in n)this.each(z(t,n[t]));return this}return this.each(z(n,t))},_a.classed=function(n,t){if(arguments.length<2){if("string"==typeof n){var e=this.node(),r=(n=T(n)).length,u=-1;if(t=e.classList){for(;++u<r;)if(!t.contains(n[u]))return!1}else for(t=e.getAttribute("class");++u<r;)if(!L(n[u]).test(t))return!1;return!0}for(t in n)this.each(R(t,n[t]));return this}return this.each(R(n,t))},_a.style=function(n,e,r){var u=arguments.length;if(3>u){if("string"!=typeof n){2>u&&(e="");for(r in n)this.each(P(r,n[r],e));return this}if(2>u){var i=this.node();return t(i).getComputedStyle(i,null).getPropertyValue(n)}r=""}return this.each(P(n,e,r))},_a.property=function(n,t){if(arguments.length<2){if("string"==typeof n)return this.node()[n];for(t in n)this.each(U(t,n[t]));return this}return this.each(U(n,t))},_a.text=function(n){return arguments.length?this.each("function"==typeof n?function(){var t=n.apply(this,arguments);this.textContent=null==t?"":t}:null==n?function(){this.textContent=""}:function(){this.textContent=n}):this.node().textContent},_a.html=function(n){return arguments.length?this.each("function"==typeof n?function(){var t=n.apply(this,arguments);this.innerHTML=null==t?"":t}:null==n?function(){this.innerHTML=""}:function(){this.innerHTML=n}):this.node().innerHTML},_a.append=function(n){return n=j(n),this.select(function(){return this.appendChild(n.apply(this,arguments))})},_a.insert=function(n,t){return n=j(n),t=N(t),this.select(function(){return this.insertBefore(n.apply(this,arguments),t.apply(this,arguments)||null)})},_a.remove=function(){return this.each(F)},_a.data=function(n,t){function e(n,e){var r,u,i,o=n.length,f=e.length,h=Math.min(o,f),g=new Array(f),p=new Array(f),v=new Array(o);if(t){var d,m=new l,y=new Array(o);for(r=-1;++r<o;)m.has(d=t.call(u=n[r],u.__data__,r))?v[r]=u:m.set(d,u),y[r]=d;for(r=-1;++r<f;)(u=m.get(d=t.call(e,i=e[r],r)))?u!==!0&&(g[r]=u,u.__data__=i):p[r]=H(i),m.set(d,!0);for(r=-1;++r<o;)m.get(y[r])!==!0&&(v[r]=n[r])}else{for(r=-1;++r<h;)u=n[r],i=e[r],u?(u.__data__=i,g[r]=u):p[r]=H(i);for(;f>r;++r)p[r]=H(e[r]);for(;o>r;++r)v[r]=n[r]}p.update=g,p.parentNode=g.parentNode=v.parentNode=n.parentNode,a.push(p),c.push(g),s.push(v)}var r,u,i=-1,o=this.length;if(!arguments.length){for(n=new Array(o=(r=this[0]).length);++i<o;)(u=r[i])&&(n[i]=u.__data__);return n}var a=Z([]),c=A([]),s=A([]);if("function"==typeof n)for(;++i<o;)e(r=this[i],n.call(r,r.parentNode.__data__,i));else for(;++i<o;)e(r=this[i],n);return c.enter=function(){return a},c.exit=function(){return s},c},_a.datum=function(n){return arguments.length?this.property("__data__",n):this.property("__data__")},_a.filter=function(n){var t,e,r,u=[];"function"!=typeof n&&(n=O(n));for(var i=0,o=this.length;o>i;i++){u.push(t=[]),t.parentNode=(e=this[i]).parentNode;for(var a=0,c=e.length;c>a;a++)(r=e[a])&&n.call(r,r.__data__,a,i)&&t.push(r)}return A(u)},_a.order=function(){for(var n=-1,t=this.length;++n<t;)for(var e,r=this[n],u=r.length-1,i=r[u];--u>=0;)(e=r[u])&&(i&&i!==e.nextSibling&&i.parentNode.insertBefore(e,i),i=e);return this},_a.sort=function(n){n=I.apply(this,arguments);for(var t=-1,e=this.length;++t<e;)this[t].sort(n);return this.order()},_a.each=function(n){return Y(this,function(t,e,r){n.call(t,t.__data__,e,r)})},_a.call=function(n){var t=ra(arguments);return n.apply(t[0]=this,t),this},_a.empty=function(){return!this.node()},_a.node=function(){for(var n=0,t=this.length;t>n;n++)for(var e=this[n],r=0,u=e.length;u>r;r++){var i=e[r];if(i)return i}return null},_a.size=function(){var n=0;return Y(this,function(){++n}),n};var Sa=[];ta.selection.enter=Z,ta.selection.enter.prototype=Sa,Sa.append=_a.append,Sa.empty=_a.empty,Sa.node=_a.node,Sa.call=_a.call,Sa.size=_a.size,Sa.select=function(n){for(var t,e,r,u,i,o=[],a=-1,c=this.length;++a<c;){r=(u=this[a]).update,o.push(t=[]),t.parentNode=u.parentNode;for(var l=-1,s=u.length;++l<s;)(i=u[l])?(t.push(r[l]=e=n.call(u.parentNode,i.__data__,l,a)),e.__data__=i.__data__):t.push(null)}return A(o)},Sa.insert=function(n,t){return arguments.length<2&&(t=V(this)),_a.insert.call(this,n,t)},ta.select=function(t){var e;return"string"==typeof t?(e=[Ma(t,ua)],e.parentNode=ua.documentElement):(e=[t],e.parentNode=n(t)),A([e])},ta.selectAll=function(n){var t;return"string"==typeof n?(t=ra(xa(n,ua)),t.parentNode=ua.documentElement):(t=n,t.parentNode=null),A([t])},_a.on=function(n,t,e){var r=arguments.length;if(3>r){if("string"!=typeof n){2>r&&(t=!1);for(e in n)this.each(X(e,n[e],t));return this}if(2>r)return(r=this.node()["__on"+n])&&r._;e=!1}return this.each(X(n,t,e))};var ka=ta.map({mouseenter:"mouseover",mouseleave:"mouseout"});ua&&ka.forEach(function(n){"on"+n in ua&&ka.remove(n)});var Ea,Aa=0;ta.mouse=function(n){return J(n,k())};var Na=this.navigator&&/WebKit/.test(this.navigator.userAgent)?-1:0;ta.touch=function(n,t,e){if(arguments.length<3&&(e=t,t=k().changedTouches),t)for(var r,u=0,i=t.length;i>u;++u)if((r=t[u]).identifier===e)return J(n,r)},ta.behavior.drag=function(){function n(){this.on("mousedown.drag",i).on("touchstart.drag",o)}function e(n,t,e,i,o){return function(){function a(){var n,e,r=t(h,v);r&&(n=r[0]-M[0],e=r[1]-M[1],p|=n|e,M=r,g({type:"drag",x:r[0]+l[0],y:r[1]+l[1],dx:n,dy:e}))}function c(){t(h,v)&&(m.on(i+d,null).on(o+d,null),y(p&&ta.event.target===f),g({type:"dragend"}))}var l,s=this,f=ta.event.target,h=s.parentNode,g=r.of(s,arguments),p=0,v=n(),d=".drag"+(null==v?"":"-"+v),m=ta.select(e(f)).on(i+d,a).on(o+d,c),y=W(f),M=t(h,v);u?(l=u.apply(s,arguments),l=[l.x-M[0],l.y-M[1]]):l=[0,0],g({type:"dragstart"})}}var r=E(n,"drag","dragstart","dragend"),u=null,i=e(b,ta.mouse,t,"mousemove","mouseup"),o=e(G,ta.touch,y,"touchmove","touchend");return n.origin=function(t){return arguments.length?(u=t,n):u},ta.rebind(n,r,"on")},ta.touches=function(n,t){return arguments.length<2&&(t=k().touches),t?ra(t).map(function(t){var e=J(n,t);return e.identifier=t.identifier,e}):[]};var Ca=1e-6,za=Ca*Ca,qa=Math.PI,La=2*qa,Ta=La-Ca,Ra=qa/2,Da=qa/180,Pa=180/qa,Ua=Math.SQRT2,ja=2,Fa=4;ta.interpolateZoom=function(n,t){function e(n){var t=n*y;if(m){var e=rt(v),o=i/(ja*h)*(e*ut(Ua*t+v)-et(v));return[r+o*l,u+o*s,i*e/rt(Ua*t+v)]}return[r+n*l,u+n*s,i*Math.exp(Ua*t)]}var r=n[0],u=n[1],i=n[2],o=t[0],a=t[1],c=t[2],l=o-r,s=a-u,f=l*l+s*s,h=Math.sqrt(f),g=(c*c-i*i+Fa*f)/(2*i*ja*h),p=(c*c-i*i-Fa*f)/(2*c*ja*h),v=Math.log(Math.sqrt(g*g+1)-g),d=Math.log(Math.sqrt(p*p+1)-p),m=d-v,y=(m||Math.log(c/i))/Ua;return e.duration=1e3*y,e},ta.behavior.zoom=function(){function n(n){n.on(q,f).on(Oa+".zoom",g).on("dblclick.zoom",p).on(R,h)}function e(n){return[(n[0]-k.x)/k.k,(n[1]-k.y)/k.k]}function r(n){return[n[0]*k.k+k.x,n[1]*k.k+k.y]}function u(n){k.k=Math.max(N[0],Math.min(N[1],n))}function i(n,t){t=r(t),k.x+=n[0]-t[0],k.y+=n[1]-t[1]}function o(t,e,r,o){t.__chart__={x:k.x,y:k.y,k:k.k},u(Math.pow(2,o)),i(d=e,r),t=ta.select(t),C>0&&(t=t.transition().duration(C)),t.call(n.event)}function a(){b&&b.domain(x.range().map(function(n){return(n-k.x)/k.k}).map(x.invert)),w&&w.domain(_.range().map(function(n){return(n-k.y)/k.k}).map(_.invert))}function c(n){z++||n({type:"zoomstart"})}function l(n){a(),n({type:"zoom",scale:k.k,translate:[k.x,k.y]})}function s(n){--z||n({type:"zoomend"}),d=null}function f(){function n(){f=1,i(ta.mouse(u),g),l(a)}function r(){h.on(L,null).on(T,null),p(f&&ta.event.target===o),s(a)}var u=this,o=ta.event.target,a=D.of(u,arguments),f=0,h=ta.select(t(u)).on(L,n).on(T,r),g=e(ta.mouse(u)),p=W(u);Dl.call(u),c(a)}function h(){function n(){var n=ta.touches(p);return g=k.k,n.forEach(function(n){n.identifier in d&&(d[n.identifier]=e(n))}),n}function t(){var t=ta.event.target;ta.select(t).on(x,r).on(b,a),_.push(t);for(var e=ta.event.changedTouches,u=0,i=e.length;i>u;++u)d[e[u].identifier]=null;var c=n(),l=Date.now();if(1===c.length){if(500>l-M){var s=c[0];o(p,s,d[s.identifier],Math.floor(Math.log(k.k)/Math.LN2)+1),S()}M=l}else if(c.length>1){var s=c[0],f=c[1],h=s[0]-f[0],g=s[1]-f[1];m=h*h+g*g}}function r(){var n,t,e,r,o=ta.touches(p);Dl.call(p);for(var a=0,c=o.length;c>a;++a,r=null)if(e=o[a],r=d[e.identifier]){if(t)break;n=e,t=r}if(r){var s=(s=e[0]-n[0])*s+(s=e[1]-n[1])*s,f=m&&Math.sqrt(s/m);n=[(n[0]+e[0])/2,(n[1]+e[1])/2],t=[(t[0]+r[0])/2,(t[1]+r[1])/2],u(f*g)}M=null,i(n,t),l(v)}function a(){if(ta.event.touches.length){for(var t=ta.event.changedTouches,e=0,r=t.length;r>e;++e)delete d[t[e].identifier];for(var u in d)return void n()}ta.selectAll(_).on(y,null),w.on(q,f).on(R,h),E(),s(v)}var g,p=this,v=D.of(p,arguments),d={},m=0,y=".zoom-"+ta.event.changedTouches[0].identifier,x="touchmove"+y,b="touchend"+y,_=[],w=ta.select(p),E=W(p);t(),c(v),w.on(q,null).on(R,t)}function g(){var n=D.of(this,arguments);y?clearTimeout(y):(v=e(d=m||ta.mouse(this)),Dl.call(this),c(n)),y=setTimeout(function(){y=null,s(n)},50),S(),u(Math.pow(2,.002*Ha())*k.k),i(d,v),l(n)}function p(){var n=ta.mouse(this),t=Math.log(k.k)/Math.LN2;o(this,n,e(n),ta.event.shiftKey?Math.ceil(t)-1:Math.floor(t)+1)}var v,d,m,y,M,x,b,_,w,k={x:0,y:0,k:1},A=[960,500],N=Ia,C=250,z=0,q="mousedown.zoom",L="mousemove.zoom",T="mouseup.zoom",R="touchstart.zoom",D=E(n,"zoomstart","zoom","zoomend");return Oa||(Oa="onwheel"in ua?(Ha=function(){return-ta.event.deltaY*(ta.event.deltaMode?120:1)},"wheel"):"onmousewheel"in ua?(Ha=function(){return ta.event.wheelDelta},"mousewheel"):(Ha=function(){return-ta.event.detail},"MozMousePixelScroll")),n.event=function(n){n.each(function(){var n=D.of(this,arguments),t=k;Tl?ta.select(this).transition().each("start.zoom",function(){k=this.__chart__||{x:0,y:0,k:1},c(n)}).tween("zoom:zoom",function(){var e=A[0],r=A[1],u=d?d[0]:e/2,i=d?d[1]:r/2,o=ta.interpolateZoom([(u-k.x)/k.k,(i-k.y)/k.k,e/k.k],[(u-t.x)/t.k,(i-t.y)/t.k,e/t.k]);return function(t){var r=o(t),a=e/r[2];this.__chart__=k={x:u-r[0]*a,y:i-r[1]*a,k:a},l(n)}}).each("interrupt.zoom",function(){s(n)}).each("end.zoom",function(){s(n)}):(this.__chart__=k,c(n),l(n),s(n))})},n.translate=function(t){return arguments.length?(k={x:+t[0],y:+t[1],k:k.k},a(),n):[k.x,k.y]},n.scale=function(t){return arguments.length?(k={x:k.x,y:k.y,k:+t},a(),n):k.k},n.scaleExtent=function(t){return arguments.length?(N=null==t?Ia:[+t[0],+t[1]],n):N},n.center=function(t){return arguments.length?(m=t&&[+t[0],+t[1]],n):m},n.size=function(t){return arguments.length?(A=t&&[+t[0],+t[1]],n):A},n.duration=function(t){return arguments.length?(C=+t,n):C},n.x=function(t){return arguments.length?(b=t,x=t.copy(),k={x:0,y:0,k:1},n):b},n.y=function(t){return arguments.length?(w=t,_=t.copy(),k={x:0,y:0,k:1},n):w},ta.rebind(n,D,"on")};var Ha,Oa,Ia=[0,1/0];ta.color=ot,ot.prototype.toString=function(){return this.rgb()+""},ta.hsl=at;var Ya=at.prototype=new ot;Ya.brighter=function(n){return n=Math.pow(.7,arguments.length?n:1),new at(this.h,this.s,this.l/n)},Ya.darker=function(n){return n=Math.pow(.7,arguments.length?n:1),new at(this.h,this.s,n*this.l)},Ya.rgb=function(){return ct(this.h,this.s,this.l)},ta.hcl=lt;var Za=lt.prototype=new ot;Za.brighter=function(n){return new lt(this.h,this.c,Math.min(100,this.l+Va*(arguments.length?n:1)))},Za.darker=function(n){return new lt(this.h,this.c,Math.max(0,this.l-Va*(arguments.length?n:1)))},Za.rgb=function(){return st(this.h,this.c,this.l).rgb()},ta.lab=ft;var Va=18,Xa=.95047,$a=1,Ba=1.08883,Wa=ft.prototype=new ot;Wa.brighter=function(n){return new ft(Math.min(100,this.l+Va*(arguments.length?n:1)),this.a,this.b)},Wa.darker=function(n){return new ft(Math.max(0,this.l-Va*(arguments.length?n:1)),this.a,this.b)},Wa.rgb=function(){return ht(this.l,this.a,this.b)},ta.rgb=mt;var Ja=mt.prototype=new ot;Ja.brighter=function(n){n=Math.pow(.7,arguments.length?n:1);var t=this.r,e=this.g,r=this.b,u=30;return t||e||r?(t&&u>t&&(t=u),e&&u>e&&(e=u),r&&u>r&&(r=u),new mt(Math.min(255,t/n),Math.min(255,e/n),Math.min(255,r/n))):new mt(u,u,u)},Ja.darker=function(n){return n=Math.pow(.7,arguments.length?n:1),new mt(n*this.r,n*this.g,n*this.b)},Ja.hsl=function(){return _t(this.r,this.g,this.b)},Ja.toString=function(){return"#"+xt(this.r)+xt(this.g)+xt(this.b)};var Ga=ta.map({aliceblue:15792383,antiquewhite:16444375,aqua:65535,aquamarine:8388564,azure:15794175,beige:16119260,bisque:16770244,black:0,blanchedalmond:16772045,blue:255,blueviolet:9055202,brown:10824234,burlywood:14596231,cadetblue:6266528,chartreuse:8388352,chocolate:13789470,coral:16744272,cornflowerblue:6591981,cornsilk:16775388,crimson:14423100,cyan:65535,darkblue:139,darkcyan:35723,darkgoldenrod:12092939,darkgray:11119017,darkgreen:25600,darkgrey:11119017,darkkhaki:12433259,darkmagenta:9109643,darkolivegreen:5597999,darkorange:16747520,darkorchid:10040012,darkred:9109504,darksalmon:15308410,darkseagreen:9419919,darkslateblue:4734347,darkslategray:3100495,darkslategrey:3100495,darkturquoise:52945,darkviolet:9699539,deeppink:16716947,deepskyblue:49151,dimgray:6908265,dimgrey:6908265,dodgerblue:2003199,firebrick:11674146,floralwhite:16775920,forestgreen:2263842,fuchsia:16711935,gainsboro:14474460,ghostwhite:16316671,gold:16766720,goldenrod:14329120,gray:8421504,green:32768,greenyellow:11403055,grey:8421504,honeydew:15794160,hotpink:16738740,indianred:13458524,indigo:4915330,ivory:16777200,khaki:15787660,lavender:15132410,lavenderblush:16773365,lawngreen:8190976,lemonchiffon:16775885,lightblue:11393254,lightcoral:15761536,lightcyan:14745599,lightgoldenrodyellow:16448210,lightgray:13882323,lightgreen:9498256,lightgrey:13882323,lightpink:16758465,lightsalmon:16752762,lightseagreen:2142890,lightskyblue:8900346,lightslategray:7833753,lightslategrey:7833753,lightsteelblue:11584734,lightyellow:16777184,lime:65280,limegreen:3329330,linen:16445670,magenta:16711935,maroon:8388608,mediumaquamarine:6737322,mediumblue:205,mediumorchid:12211667,mediumpurple:9662683,mediumseagreen:3978097,mediumslateblue:8087790,mediumspringgreen:64154,mediumturquoise:4772300,mediumvioletred:13047173,midnightblue:1644912,mintcream:16121850,mistyrose:16770273,moccasin:16770229,navajowhite:16768685,navy:128,oldlace:16643558,olive:8421376,olivedrab:7048739,orange:16753920,orangered:16729344,orchid:14315734,palegoldenrod:15657130,palegreen:10025880,paleturquoise:11529966,palevioletred:14381203,papayawhip:16773077,peachpuff:16767673,peru:13468991,pink:16761035,plum:14524637,powderblue:11591910,purple:8388736,rebeccapurple:6697881,red:16711680,rosybrown:12357519,royalblue:4286945,saddlebrown:9127187,salmon:16416882,sandybrown:16032864,seagreen:3050327,seashell:16774638,sienna:10506797,silver:12632256,skyblue:8900331,slateblue:6970061,slategray:7372944,slategrey:7372944,snow:16775930,springgreen:65407,steelblue:4620980,tan:13808780,teal:32896,thistle:14204888,tomato:16737095,turquoise:4251856,violet:15631086,wheat:16113331,white:16777215,whitesmoke:16119285,yellow:16776960,yellowgreen:10145074});Ga.forEach(function(n,t){Ga.set(n,yt(t))}),ta.functor=Et,ta.xhr=At(y),ta.dsv=function(n,t){function e(n,e,i){arguments.length<3&&(i=e,e=null);var o=Nt(n,t,null==e?r:u(e),i);return o.row=function(n){return arguments.length?o.response(null==(e=n)?r:u(n)):e},o}function r(n){return e.parse(n.responseText)}function u(n){return function(t){return e.parse(t.responseText,n)}}function i(t){return t.map(o).join(n)}function o(n){return a.test(n)?'"'+n.replace(/\"/g,'""')+'"':n}var a=new RegExp('["'+n+"\n]"),c=n.charCodeAt(0);return e.parse=function(n,t){var r;return e.parseRows(n,function(n,e){if(r)return r(n,e-1);var u=new Function("d","return {"+n.map(function(n,t){return JSON.stringify(n)+": d["+t+"]"}).join(",")+"}");r=t?function(n,e){return t(u(n),e)}:u})},e.parseRows=function(n,t){function e(){if(s>=l)return o;if(u)return u=!1,i;var t=s;if(34===n.charCodeAt(t)){for(var e=t;e++<l;)if(34===n.charCodeAt(e)){if(34!==n.charCodeAt(e+1))break;++e}s=e+2;var r=n.charCodeAt(e+1);return 13===r?(u=!0,10===n.charCodeAt(e+2)&&++s):10===r&&(u=!0),n.slice(t+1,e).replace(/""/g,'"')}for(;l>s;){var r=n.charCodeAt(s++),a=1;if(10===r)u=!0;else if(13===r)u=!0,10===n.charCodeAt(s)&&(++s,++a);else if(r!==c)continue;return n.slice(t,s-a)}return n.slice(t)}for(var r,u,i={},o={},a=[],l=n.length,s=0,f=0;(r=e())!==o;){for(var h=[];r!==i&&r!==o;)h.push(r),r=e();t&&null==(h=t(h,f++))||a.push(h)}return a},e.format=function(t){if(Array.isArray(t[0]))return e.formatRows(t);var r=new m,u=[];return t.forEach(function(n){for(var t in n)r.has(t)||u.push(r.add(t))}),[u.map(o).join(n)].concat(t.map(function(t){return u.map(function(n){return o(t[n])}).join(n)})).join("\n")},e.formatRows=function(n){return n.map(i).join("\n")},e},ta.csv=ta.dsv(",","text/csv"),ta.tsv=ta.dsv("	","text/tab-separated-values");var Ka,Qa,nc,tc,ec,rc=this[x(this,"requestAnimationFrame")]||function(n){setTimeout(n,17)};ta.timer=function(n,t,e){var r=arguments.length;2>r&&(t=0),3>r&&(e=Date.now());var u=e+t,i={c:n,t:u,f:!1,n:null};Qa?Qa.n=i:Ka=i,Qa=i,nc||(tc=clearTimeout(tc),nc=1,rc(qt))},ta.timer.flush=function(){Lt(),Tt()},ta.round=function(n,t){return t?Math.round(n*(t=Math.pow(10,t)))/t:Math.round(n)};var uc=["y","z","a","f","p","n","\xb5","m","","k","M","G","T","P","E","Z","Y"].map(Dt);ta.formatPrefix=function(n,t){var e=0;return n&&(0>n&&(n*=-1),t&&(n=ta.round(n,Rt(n,t))),e=1+Math.floor(1e-12+Math.log(n)/Math.LN10),e=Math.max(-24,Math.min(24,3*Math.floor((e-1)/3)))),uc[8+e/3]};var ic=/(?:([^{])?([<>=^]))?([+\- ])?([$#])?(0)?(\d+)?(,)?(\.-?\d+)?([a-z%])?/i,oc=ta.map({b:function(n){return n.toString(2)},c:function(n){return String.fromCharCode(n)},o:function(n){return n.toString(8)},x:function(n){return n.toString(16)},X:function(n){return n.toString(16).toUpperCase()},g:function(n,t){return n.toPrecision(t)},e:function(n,t){return n.toExponential(t)},f:function(n,t){return n.toFixed(t)},r:function(n,t){return(n=ta.round(n,Rt(n,t))).toFixed(Math.max(0,Math.min(20,Rt(n*(1+1e-15),t))))}}),ac=ta.time={},cc=Date;jt.prototype={getDate:function(){return this._.getUTCDate()},getDay:function(){return this._.getUTCDay()},getFullYear:function(){return this._.getUTCFullYear()},getHours:function(){return this._.getUTCHours()},getMilliseconds:function(){return this._.getUTCMilliseconds()},getMinutes:function(){return this._.getUTCMinutes()},getMonth:function(){return this._.getUTCMonth()},getSeconds:function(){return this._.getUTCSeconds()},getTime:function(){return this._.getTime()},getTimezoneOffset:function(){return 0},valueOf:function(){return this._.valueOf()},setDate:function(){lc.setUTCDate.apply(this._,arguments)},setDay:function(){lc.setUTCDay.apply(this._,arguments)},setFullYear:function(){lc.setUTCFullYear.apply(this._,arguments)},setHours:function(){lc.setUTCHours.apply(this._,arguments)},setMilliseconds:function(){lc.setUTCMilliseconds.apply(this._,arguments)},setMinutes:function(){lc.setUTCMinutes.apply(this._,arguments)},setMonth:function(){lc.setUTCMonth.apply(this._,arguments)},setSeconds:function(){lc.setUTCSeconds.apply(this._,arguments)},setTime:function(){lc.setTime.apply(this._,arguments)}};var lc=Date.prototype;ac.year=Ft(function(n){return n=ac.day(n),n.setMonth(0,1),n},function(n,t){n.setFullYear(n.getFullYear()+t)},function(n){return n.getFullYear()}),ac.years=ac.year.range,ac.years.utc=ac.year.utc.range,ac.day=Ft(function(n){var t=new cc(2e3,0);return t.setFullYear(n.getFullYear(),n.getMonth(),n.getDate()),t},function(n,t){n.setDate(n.getDate()+t)},function(n){return n.getDate()-1}),ac.days=ac.day.range,ac.days.utc=ac.day.utc.range,ac.dayOfYear=function(n){var t=ac.year(n);return Math.floor((n-t-6e4*(n.getTimezoneOffset()-t.getTimezoneOffset()))/864e5)},["sunday","monday","tuesday","wednesday","thursday","friday","saturday"].forEach(function(n,t){t=7-t;var e=ac[n]=Ft(function(n){return(n=ac.day(n)).setDate(n.getDate()-(n.getDay()+t)%7),n},function(n,t){n.setDate(n.getDate()+7*Math.floor(t))},function(n){var e=ac.year(n).getDay();return Math.floor((ac.dayOfYear(n)+(e+t)%7)/7)-(e!==t)});ac[n+"s"]=e.range,ac[n+"s"].utc=e.utc.range,ac[n+"OfYear"]=function(n){var e=ac.year(n).getDay();return Math.floor((ac.dayOfYear(n)+(e+t)%7)/7)}}),ac.week=ac.sunday,ac.weeks=ac.sunday.range,ac.weeks.utc=ac.sunday.utc.range,ac.weekOfYear=ac.sundayOfYear;var sc={"-":"",_:" ",0:"0"},fc=/^\s*\d+/,hc=/^%/;ta.locale=function(n){return{numberFormat:Pt(n),timeFormat:Ot(n)}};var gc=ta.locale({decimal:".",thousands:",",grouping:[3],currency:["$",""],dateTime:"%a %b %e %X %Y",date:"%m/%d/%Y",time:"%H:%M:%S",periods:["AM","PM"],days:["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],shortDays:["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],months:["January","February","March","April","May","June","July","August","September","October","November","December"],shortMonths:["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]});ta.format=gc.numberFormat,ta.geo={},ce.prototype={s:0,t:0,add:function(n){le(n,this.t,pc),le(pc.s,this.s,this),this.s?this.t+=pc.t:this.s=pc.t
},reset:function(){this.s=this.t=0},valueOf:function(){return this.s}};var pc=new ce;ta.geo.stream=function(n,t){n&&vc.hasOwnProperty(n.type)?vc[n.type](n,t):se(n,t)};var vc={Feature:function(n,t){se(n.geometry,t)},FeatureCollection:function(n,t){for(var e=n.features,r=-1,u=e.length;++r<u;)se(e[r].geometry,t)}},dc={Sphere:function(n,t){t.sphere()},Point:function(n,t){n=n.coordinates,t.point(n[0],n[1],n[2])},MultiPoint:function(n,t){for(var e=n.coordinates,r=-1,u=e.length;++r<u;)n=e[r],t.point(n[0],n[1],n[2])},LineString:function(n,t){fe(n.coordinates,t,0)},MultiLineString:function(n,t){for(var e=n.coordinates,r=-1,u=e.length;++r<u;)fe(e[r],t,0)},Polygon:function(n,t){he(n.coordinates,t)},MultiPolygon:function(n,t){for(var e=n.coordinates,r=-1,u=e.length;++r<u;)he(e[r],t)},GeometryCollection:function(n,t){for(var e=n.geometries,r=-1,u=e.length;++r<u;)se(e[r],t)}};ta.geo.area=function(n){return mc=0,ta.geo.stream(n,Mc),mc};var mc,yc=new ce,Mc={sphere:function(){mc+=4*qa},point:b,lineStart:b,lineEnd:b,polygonStart:function(){yc.reset(),Mc.lineStart=ge},polygonEnd:function(){var n=2*yc;mc+=0>n?4*qa+n:n,Mc.lineStart=Mc.lineEnd=Mc.point=b}};ta.geo.bounds=function(){function n(n,t){M.push(x=[s=n,h=n]),f>t&&(f=t),t>g&&(g=t)}function t(t,e){var r=pe([t*Da,e*Da]);if(m){var u=de(m,r),i=[u[1],-u[0],0],o=de(i,u);Me(o),o=xe(o);var c=t-p,l=c>0?1:-1,v=o[0]*Pa*l,d=ga(c)>180;if(d^(v>l*p&&l*t>v)){var y=o[1]*Pa;y>g&&(g=y)}else if(v=(v+360)%360-180,d^(v>l*p&&l*t>v)){var y=-o[1]*Pa;f>y&&(f=y)}else f>e&&(f=e),e>g&&(g=e);d?p>t?a(s,t)>a(s,h)&&(h=t):a(t,h)>a(s,h)&&(s=t):h>=s?(s>t&&(s=t),t>h&&(h=t)):t>p?a(s,t)>a(s,h)&&(h=t):a(t,h)>a(s,h)&&(s=t)}else n(t,e);m=r,p=t}function e(){b.point=t}function r(){x[0]=s,x[1]=h,b.point=n,m=null}function u(n,e){if(m){var r=n-p;y+=ga(r)>180?r+(r>0?360:-360):r}else v=n,d=e;Mc.point(n,e),t(n,e)}function i(){Mc.lineStart()}function o(){u(v,d),Mc.lineEnd(),ga(y)>Ca&&(s=-(h=180)),x[0]=s,x[1]=h,m=null}function a(n,t){return(t-=n)<0?t+360:t}function c(n,t){return n[0]-t[0]}function l(n,t){return t[0]<=t[1]?t[0]<=n&&n<=t[1]:n<t[0]||t[1]<n}var s,f,h,g,p,v,d,m,y,M,x,b={point:n,lineStart:e,lineEnd:r,polygonStart:function(){b.point=u,b.lineStart=i,b.lineEnd=o,y=0,Mc.polygonStart()},polygonEnd:function(){Mc.polygonEnd(),b.point=n,b.lineStart=e,b.lineEnd=r,0>yc?(s=-(h=180),f=-(g=90)):y>Ca?g=90:-Ca>y&&(f=-90),x[0]=s,x[1]=h}};return function(n){g=h=-(s=f=1/0),M=[],ta.geo.stream(n,b);var t=M.length;if(t){M.sort(c);for(var e,r=1,u=M[0],i=[u];t>r;++r)e=M[r],l(e[0],u)||l(e[1],u)?(a(u[0],e[1])>a(u[0],u[1])&&(u[1]=e[1]),a(e[0],u[1])>a(u[0],u[1])&&(u[0]=e[0])):i.push(u=e);for(var o,e,p=-1/0,t=i.length-1,r=0,u=i[t];t>=r;u=e,++r)e=i[r],(o=a(u[1],e[0]))>p&&(p=o,s=e[0],h=u[1])}return M=x=null,1/0===s||1/0===f?[[0/0,0/0],[0/0,0/0]]:[[s,f],[h,g]]}}(),ta.geo.centroid=function(n){xc=bc=_c=wc=Sc=kc=Ec=Ac=Nc=Cc=zc=0,ta.geo.stream(n,qc);var t=Nc,e=Cc,r=zc,u=t*t+e*e+r*r;return za>u&&(t=kc,e=Ec,r=Ac,Ca>bc&&(t=_c,e=wc,r=Sc),u=t*t+e*e+r*r,za>u)?[0/0,0/0]:[Math.atan2(e,t)*Pa,tt(r/Math.sqrt(u))*Pa]};var xc,bc,_c,wc,Sc,kc,Ec,Ac,Nc,Cc,zc,qc={sphere:b,point:_e,lineStart:Se,lineEnd:ke,polygonStart:function(){qc.lineStart=Ee},polygonEnd:function(){qc.lineStart=Se}},Lc=Le(Ne,Pe,je,[-qa,-qa/2]),Tc=1e9;ta.geo.clipExtent=function(){var n,t,e,r,u,i,o={stream:function(n){return u&&(u.valid=!1),u=i(n),u.valid=!0,u},extent:function(a){return arguments.length?(i=Ie(n=+a[0][0],t=+a[0][1],e=+a[1][0],r=+a[1][1]),u&&(u.valid=!1,u=null),o):[[n,t],[e,r]]}};return o.extent([[0,0],[960,500]])},(ta.geo.conicEqualArea=function(){return Ye(Ze)}).raw=Ze,ta.geo.albers=function(){return ta.geo.conicEqualArea().rotate([96,0]).center([-.6,38.7]).parallels([29.5,45.5]).scale(1070)},ta.geo.albersUsa=function(){function n(n){var i=n[0],o=n[1];return t=null,e(i,o),t||(r(i,o),t)||u(i,o),t}var t,e,r,u,i=ta.geo.albers(),o=ta.geo.conicEqualArea().rotate([154,0]).center([-2,58.5]).parallels([55,65]),a=ta.geo.conicEqualArea().rotate([157,0]).center([-3,19.9]).parallels([8,18]),c={point:function(n,e){t=[n,e]}};return n.invert=function(n){var t=i.scale(),e=i.translate(),r=(n[0]-e[0])/t,u=(n[1]-e[1])/t;return(u>=.12&&.234>u&&r>=-.425&&-.214>r?o:u>=.166&&.234>u&&r>=-.214&&-.115>r?a:i).invert(n)},n.stream=function(n){var t=i.stream(n),e=o.stream(n),r=a.stream(n);return{point:function(n,u){t.point(n,u),e.point(n,u),r.point(n,u)},sphere:function(){t.sphere(),e.sphere(),r.sphere()},lineStart:function(){t.lineStart(),e.lineStart(),r.lineStart()},lineEnd:function(){t.lineEnd(),e.lineEnd(),r.lineEnd()},polygonStart:function(){t.polygonStart(),e.polygonStart(),r.polygonStart()},polygonEnd:function(){t.polygonEnd(),e.polygonEnd(),r.polygonEnd()}}},n.precision=function(t){return arguments.length?(i.precision(t),o.precision(t),a.precision(t),n):i.precision()},n.scale=function(t){return arguments.length?(i.scale(t),o.scale(.35*t),a.scale(t),n.translate(i.translate())):i.scale()},n.translate=function(t){if(!arguments.length)return i.translate();var l=i.scale(),s=+t[0],f=+t[1];return e=i.translate(t).clipExtent([[s-.455*l,f-.238*l],[s+.455*l,f+.238*l]]).stream(c).point,r=o.translate([s-.307*l,f+.201*l]).clipExtent([[s-.425*l+Ca,f+.12*l+Ca],[s-.214*l-Ca,f+.234*l-Ca]]).stream(c).point,u=a.translate([s-.205*l,f+.212*l]).clipExtent([[s-.214*l+Ca,f+.166*l+Ca],[s-.115*l-Ca,f+.234*l-Ca]]).stream(c).point,n},n.scale(1070)};var Rc,Dc,Pc,Uc,jc,Fc,Hc={point:b,lineStart:b,lineEnd:b,polygonStart:function(){Dc=0,Hc.lineStart=Ve},polygonEnd:function(){Hc.lineStart=Hc.lineEnd=Hc.point=b,Rc+=ga(Dc/2)}},Oc={point:Xe,lineStart:b,lineEnd:b,polygonStart:b,polygonEnd:b},Ic={point:We,lineStart:Je,lineEnd:Ge,polygonStart:function(){Ic.lineStart=Ke},polygonEnd:function(){Ic.point=We,Ic.lineStart=Je,Ic.lineEnd=Ge}};ta.geo.path=function(){function n(n){return n&&("function"==typeof a&&i.pointRadius(+a.apply(this,arguments)),o&&o.valid||(o=u(i)),ta.geo.stream(n,o)),i.result()}function t(){return o=null,n}var e,r,u,i,o,a=4.5;return n.area=function(n){return Rc=0,ta.geo.stream(n,u(Hc)),Rc},n.centroid=function(n){return _c=wc=Sc=kc=Ec=Ac=Nc=Cc=zc=0,ta.geo.stream(n,u(Ic)),zc?[Nc/zc,Cc/zc]:Ac?[kc/Ac,Ec/Ac]:Sc?[_c/Sc,wc/Sc]:[0/0,0/0]},n.bounds=function(n){return jc=Fc=-(Pc=Uc=1/0),ta.geo.stream(n,u(Oc)),[[Pc,Uc],[jc,Fc]]},n.projection=function(n){return arguments.length?(u=(e=n)?n.stream||tr(n):y,t()):e},n.context=function(n){return arguments.length?(i=null==(r=n)?new $e:new Qe(n),"function"!=typeof a&&i.pointRadius(a),t()):r},n.pointRadius=function(t){return arguments.length?(a="function"==typeof t?t:(i.pointRadius(+t),+t),n):a},n.projection(ta.geo.albersUsa()).context(null)},ta.geo.transform=function(n){return{stream:function(t){var e=new er(t);for(var r in n)e[r]=n[r];return e}}},er.prototype={point:function(n,t){this.stream.point(n,t)},sphere:function(){this.stream.sphere()},lineStart:function(){this.stream.lineStart()},lineEnd:function(){this.stream.lineEnd()},polygonStart:function(){this.stream.polygonStart()},polygonEnd:function(){this.stream.polygonEnd()}},ta.geo.projection=ur,ta.geo.projectionMutator=ir,(ta.geo.equirectangular=function(){return ur(ar)}).raw=ar.invert=ar,ta.geo.rotation=function(n){function t(t){return t=n(t[0]*Da,t[1]*Da),t[0]*=Pa,t[1]*=Pa,t}return n=lr(n[0]%360*Da,n[1]*Da,n.length>2?n[2]*Da:0),t.invert=function(t){return t=n.invert(t[0]*Da,t[1]*Da),t[0]*=Pa,t[1]*=Pa,t},t},cr.invert=ar,ta.geo.circle=function(){function n(){var n="function"==typeof r?r.apply(this,arguments):r,t=lr(-n[0]*Da,-n[1]*Da,0).invert,u=[];return e(null,null,1,{point:function(n,e){u.push(n=t(n,e)),n[0]*=Pa,n[1]*=Pa}}),{type:"Polygon",coordinates:[u]}}var t,e,r=[0,0],u=6;return n.origin=function(t){return arguments.length?(r=t,n):r},n.angle=function(r){return arguments.length?(e=gr((t=+r)*Da,u*Da),n):t},n.precision=function(r){return arguments.length?(e=gr(t*Da,(u=+r)*Da),n):u},n.angle(90)},ta.geo.distance=function(n,t){var e,r=(t[0]-n[0])*Da,u=n[1]*Da,i=t[1]*Da,o=Math.sin(r),a=Math.cos(r),c=Math.sin(u),l=Math.cos(u),s=Math.sin(i),f=Math.cos(i);return Math.atan2(Math.sqrt((e=f*o)*e+(e=l*s-c*f*a)*e),c*s+l*f*a)},ta.geo.graticule=function(){function n(){return{type:"MultiLineString",coordinates:t()}}function t(){return ta.range(Math.ceil(i/d)*d,u,d).map(h).concat(ta.range(Math.ceil(l/m)*m,c,m).map(g)).concat(ta.range(Math.ceil(r/p)*p,e,p).filter(function(n){return ga(n%d)>Ca}).map(s)).concat(ta.range(Math.ceil(a/v)*v,o,v).filter(function(n){return ga(n%m)>Ca}).map(f))}var e,r,u,i,o,a,c,l,s,f,h,g,p=10,v=p,d=90,m=360,y=2.5;return n.lines=function(){return t().map(function(n){return{type:"LineString",coordinates:n}})},n.outline=function(){return{type:"Polygon",coordinates:[h(i).concat(g(c).slice(1),h(u).reverse().slice(1),g(l).reverse().slice(1))]}},n.extent=function(t){return arguments.length?n.majorExtent(t).minorExtent(t):n.minorExtent()},n.majorExtent=function(t){return arguments.length?(i=+t[0][0],u=+t[1][0],l=+t[0][1],c=+t[1][1],i>u&&(t=i,i=u,u=t),l>c&&(t=l,l=c,c=t),n.precision(y)):[[i,l],[u,c]]},n.minorExtent=function(t){return arguments.length?(r=+t[0][0],e=+t[1][0],a=+t[0][1],o=+t[1][1],r>e&&(t=r,r=e,e=t),a>o&&(t=a,a=o,o=t),n.precision(y)):[[r,a],[e,o]]},n.step=function(t){return arguments.length?n.majorStep(t).minorStep(t):n.minorStep()},n.majorStep=function(t){return arguments.length?(d=+t[0],m=+t[1],n):[d,m]},n.minorStep=function(t){return arguments.length?(p=+t[0],v=+t[1],n):[p,v]},n.precision=function(t){return arguments.length?(y=+t,s=vr(a,o,90),f=dr(r,e,y),h=vr(l,c,90),g=dr(i,u,y),n):y},n.majorExtent([[-180,-90+Ca],[180,90-Ca]]).minorExtent([[-180,-80-Ca],[180,80+Ca]])},ta.geo.greatArc=function(){function n(){return{type:"LineString",coordinates:[t||r.apply(this,arguments),e||u.apply(this,arguments)]}}var t,e,r=mr,u=yr;return n.distance=function(){return ta.geo.distance(t||r.apply(this,arguments),e||u.apply(this,arguments))},n.source=function(e){return arguments.length?(r=e,t="function"==typeof e?null:e,n):r},n.target=function(t){return arguments.length?(u=t,e="function"==typeof t?null:t,n):u},n.precision=function(){return arguments.length?n:0},n},ta.geo.interpolate=function(n,t){return Mr(n[0]*Da,n[1]*Da,t[0]*Da,t[1]*Da)},ta.geo.length=function(n){return Yc=0,ta.geo.stream(n,Zc),Yc};var Yc,Zc={sphere:b,point:b,lineStart:xr,lineEnd:b,polygonStart:b,polygonEnd:b},Vc=br(function(n){return Math.sqrt(2/(1+n))},function(n){return 2*Math.asin(n/2)});(ta.geo.azimuthalEqualArea=function(){return ur(Vc)}).raw=Vc;var Xc=br(function(n){var t=Math.acos(n);return t&&t/Math.sin(t)},y);(ta.geo.azimuthalEquidistant=function(){return ur(Xc)}).raw=Xc,(ta.geo.conicConformal=function(){return Ye(_r)}).raw=_r,(ta.geo.conicEquidistant=function(){return Ye(wr)}).raw=wr;var $c=br(function(n){return 1/n},Math.atan);(ta.geo.gnomonic=function(){return ur($c)}).raw=$c,Sr.invert=function(n,t){return[n,2*Math.atan(Math.exp(t))-Ra]},(ta.geo.mercator=function(){return kr(Sr)}).raw=Sr;var Bc=br(function(){return 1},Math.asin);(ta.geo.orthographic=function(){return ur(Bc)}).raw=Bc;var Wc=br(function(n){return 1/(1+n)},function(n){return 2*Math.atan(n)});(ta.geo.stereographic=function(){return ur(Wc)}).raw=Wc,Er.invert=function(n,t){return[-t,2*Math.atan(Math.exp(n))-Ra]},(ta.geo.transverseMercator=function(){var n=kr(Er),t=n.center,e=n.rotate;return n.center=function(n){return n?t([-n[1],n[0]]):(n=t(),[n[1],-n[0]])},n.rotate=function(n){return n?e([n[0],n[1],n.length>2?n[2]+90:90]):(n=e(),[n[0],n[1],n[2]-90])},e([0,0,90])}).raw=Er,ta.geom={},ta.geom.hull=function(n){function t(n){if(n.length<3)return[];var t,u=Et(e),i=Et(r),o=n.length,a=[],c=[];for(t=0;o>t;t++)a.push([+u.call(this,n[t],t),+i.call(this,n[t],t),t]);for(a.sort(zr),t=0;o>t;t++)c.push([a[t][0],-a[t][1]]);var l=Cr(a),s=Cr(c),f=s[0]===l[0],h=s[s.length-1]===l[l.length-1],g=[];for(t=l.length-1;t>=0;--t)g.push(n[a[l[t]][2]]);for(t=+f;t<s.length-h;++t)g.push(n[a[s[t]][2]]);return g}var e=Ar,r=Nr;return arguments.length?t(n):(t.x=function(n){return arguments.length?(e=n,t):e},t.y=function(n){return arguments.length?(r=n,t):r},t)},ta.geom.polygon=function(n){return ya(n,Jc),n};var Jc=ta.geom.polygon.prototype=[];Jc.area=function(){for(var n,t=-1,e=this.length,r=this[e-1],u=0;++t<e;)n=r,r=this[t],u+=n[1]*r[0]-n[0]*r[1];return.5*u},Jc.centroid=function(n){var t,e,r=-1,u=this.length,i=0,o=0,a=this[u-1];for(arguments.length||(n=-1/(6*this.area()));++r<u;)t=a,a=this[r],e=t[0]*a[1]-a[0]*t[1],i+=(t[0]+a[0])*e,o+=(t[1]+a[1])*e;return[i*n,o*n]},Jc.clip=function(n){for(var t,e,r,u,i,o,a=Tr(n),c=-1,l=this.length-Tr(this),s=this[l-1];++c<l;){for(t=n.slice(),n.length=0,u=this[c],i=t[(r=t.length-a)-1],e=-1;++e<r;)o=t[e],qr(o,s,u)?(qr(i,s,u)||n.push(Lr(i,o,s,u)),n.push(o)):qr(i,s,u)&&n.push(Lr(i,o,s,u)),i=o;a&&n.push(n[0]),s=u}return n};var Gc,Kc,Qc,nl,tl,el=[],rl=[];Or.prototype.prepare=function(){for(var n,t=this.edges,e=t.length;e--;)n=t[e].edge,n.b&&n.a||t.splice(e,1);return t.sort(Yr),t.length},Qr.prototype={start:function(){return this.edge.l===this.site?this.edge.a:this.edge.b},end:function(){return this.edge.l===this.site?this.edge.b:this.edge.a}},nu.prototype={insert:function(n,t){var e,r,u;if(n){if(t.P=n,t.N=n.N,n.N&&(n.N.P=t),n.N=t,n.R){for(n=n.R;n.L;)n=n.L;n.L=t}else n.R=t;e=n}else this._?(n=uu(this._),t.P=null,t.N=n,n.P=n.L=t,e=n):(t.P=t.N=null,this._=t,e=null);for(t.L=t.R=null,t.U=e,t.C=!0,n=t;e&&e.C;)r=e.U,e===r.L?(u=r.R,u&&u.C?(e.C=u.C=!1,r.C=!0,n=r):(n===e.R&&(eu(this,e),n=e,e=n.U),e.C=!1,r.C=!0,ru(this,r))):(u=r.L,u&&u.C?(e.C=u.C=!1,r.C=!0,n=r):(n===e.L&&(ru(this,e),n=e,e=n.U),e.C=!1,r.C=!0,eu(this,r))),e=n.U;this._.C=!1},remove:function(n){n.N&&(n.N.P=n.P),n.P&&(n.P.N=n.N),n.N=n.P=null;var t,e,r,u=n.U,i=n.L,o=n.R;if(e=i?o?uu(o):i:o,u?u.L===n?u.L=e:u.R=e:this._=e,i&&o?(r=e.C,e.C=n.C,e.L=i,i.U=e,e!==o?(u=e.U,e.U=n.U,n=e.R,u.L=n,e.R=o,o.U=e):(e.U=u,u=e,n=e.R)):(r=n.C,n=e),n&&(n.U=u),!r){if(n&&n.C)return void(n.C=!1);do{if(n===this._)break;if(n===u.L){if(t=u.R,t.C&&(t.C=!1,u.C=!0,eu(this,u),t=u.R),t.L&&t.L.C||t.R&&t.R.C){t.R&&t.R.C||(t.L.C=!1,t.C=!0,ru(this,t),t=u.R),t.C=u.C,u.C=t.R.C=!1,eu(this,u),n=this._;break}}else if(t=u.L,t.C&&(t.C=!1,u.C=!0,ru(this,u),t=u.L),t.L&&t.L.C||t.R&&t.R.C){t.L&&t.L.C||(t.R.C=!1,t.C=!0,eu(this,t),t=u.L),t.C=u.C,u.C=t.L.C=!1,ru(this,u),n=this._;break}t.C=!0,n=u,u=u.U}while(!n.C);n&&(n.C=!1)}}},ta.geom.voronoi=function(n){function t(n){var t=new Array(n.length),r=a[0][0],u=a[0][1],i=a[1][0],o=a[1][1];return iu(e(n),a).cells.forEach(function(e,a){var c=e.edges,l=e.site,s=t[a]=c.length?c.map(function(n){var t=n.start();return[t.x,t.y]}):l.x>=r&&l.x<=i&&l.y>=u&&l.y<=o?[[r,o],[i,o],[i,u],[r,u]]:[];s.point=n[a]}),t}function e(n){return n.map(function(n,t){return{x:Math.round(i(n,t)/Ca)*Ca,y:Math.round(o(n,t)/Ca)*Ca,i:t}})}var r=Ar,u=Nr,i=r,o=u,a=ul;return n?t(n):(t.links=function(n){return iu(e(n)).edges.filter(function(n){return n.l&&n.r}).map(function(t){return{source:n[t.l.i],target:n[t.r.i]}})},t.triangles=function(n){var t=[];return iu(e(n)).cells.forEach(function(e,r){for(var u,i,o=e.site,a=e.edges.sort(Yr),c=-1,l=a.length,s=a[l-1].edge,f=s.l===o?s.r:s.l;++c<l;)u=s,i=f,s=a[c].edge,f=s.l===o?s.r:s.l,r<i.i&&r<f.i&&au(o,i,f)<0&&t.push([n[r],n[i.i],n[f.i]])}),t},t.x=function(n){return arguments.length?(i=Et(r=n),t):r},t.y=function(n){return arguments.length?(o=Et(u=n),t):u},t.clipExtent=function(n){return arguments.length?(a=null==n?ul:n,t):a===ul?null:a},t.size=function(n){return arguments.length?t.clipExtent(n&&[[0,0],n]):a===ul?null:a&&a[1]},t)};var ul=[[-1e6,-1e6],[1e6,1e6]];ta.geom.delaunay=function(n){return ta.geom.voronoi().triangles(n)},ta.geom.quadtree=function(n,t,e,r,u){function i(n){function i(n,t,e,r,u,i,o,a){if(!isNaN(e)&&!isNaN(r))if(n.leaf){var c=n.x,s=n.y;if(null!=c)if(ga(c-e)+ga(s-r)<.01)l(n,t,e,r,u,i,o,a);else{var f=n.point;n.x=n.y=n.point=null,l(n,f,c,s,u,i,o,a),l(n,t,e,r,u,i,o,a)}else n.x=e,n.y=r,n.point=t}else l(n,t,e,r,u,i,o,a)}function l(n,t,e,r,u,o,a,c){var l=.5*(u+a),s=.5*(o+c),f=e>=l,h=r>=s,g=h<<1|f;n.leaf=!1,n=n.nodes[g]||(n.nodes[g]=su()),f?u=l:a=l,h?o=s:c=s,i(n,t,e,r,u,o,a,c)}var s,f,h,g,p,v,d,m,y,M=Et(a),x=Et(c);if(null!=t)v=t,d=e,m=r,y=u;else if(m=y=-(v=d=1/0),f=[],h=[],p=n.length,o)for(g=0;p>g;++g)s=n[g],s.x<v&&(v=s.x),s.y<d&&(d=s.y),s.x>m&&(m=s.x),s.y>y&&(y=s.y),f.push(s.x),h.push(s.y);else for(g=0;p>g;++g){var b=+M(s=n[g],g),_=+x(s,g);v>b&&(v=b),d>_&&(d=_),b>m&&(m=b),_>y&&(y=_),f.push(b),h.push(_)}var w=m-v,S=y-d;w>S?y=d+w:m=v+S;var k=su();if(k.add=function(n){i(k,n,+M(n,++g),+x(n,g),v,d,m,y)},k.visit=function(n){fu(n,k,v,d,m,y)},k.find=function(n){return hu(k,n[0],n[1],v,d,m,y)},g=-1,null==t){for(;++g<p;)i(k,n[g],f[g],h[g],v,d,m,y);--g}else n.forEach(k.add);return f=h=n=s=null,k}var o,a=Ar,c=Nr;return(o=arguments.length)?(a=cu,c=lu,3===o&&(u=e,r=t,e=t=0),i(n)):(i.x=function(n){return arguments.length?(a=n,i):a},i.y=function(n){return arguments.length?(c=n,i):c},i.extent=function(n){return arguments.length?(null==n?t=e=r=u=null:(t=+n[0][0],e=+n[0][1],r=+n[1][0],u=+n[1][1]),i):null==t?null:[[t,e],[r,u]]},i.size=function(n){return arguments.length?(null==n?t=e=r=u=null:(t=e=0,r=+n[0],u=+n[1]),i):null==t?null:[r-t,u-e]},i)},ta.interpolateRgb=gu,ta.interpolateObject=pu,ta.interpolateNumber=vu,ta.interpolateString=du;var il=/[-+]?(?:\d+\.?\d*|\.?\d+)(?:[eE][-+]?\d+)?/g,ol=new RegExp(il.source,"g");ta.interpolate=mu,ta.interpolators=[function(n,t){var e=typeof t;return("string"===e?Ga.has(t)||/^(#|rgb\(|hsl\()/.test(t)?gu:du:t instanceof ot?gu:Array.isArray(t)?yu:"object"===e&&isNaN(t)?pu:vu)(n,t)}],ta.interpolateArray=yu;var al=function(){return y},cl=ta.map({linear:al,poly:ku,quad:function(){return _u},cubic:function(){return wu},sin:function(){return Eu},exp:function(){return Au},circle:function(){return Nu},elastic:Cu,back:zu,bounce:function(){return qu}}),ll=ta.map({"in":y,out:xu,"in-out":bu,"out-in":function(n){return bu(xu(n))}});ta.ease=function(n){var t=n.indexOf("-"),e=t>=0?n.slice(0,t):n,r=t>=0?n.slice(t+1):"in";return e=cl.get(e)||al,r=ll.get(r)||y,Mu(r(e.apply(null,ea.call(arguments,1))))},ta.interpolateHcl=Lu,ta.interpolateHsl=Tu,ta.interpolateLab=Ru,ta.interpolateRound=Du,ta.transform=function(n){var t=ua.createElementNS(ta.ns.prefix.svg,"g");return(ta.transform=function(n){if(null!=n){t.setAttribute("transform",n);var e=t.transform.baseVal.consolidate()}return new Pu(e?e.matrix:sl)})(n)},Pu.prototype.toString=function(){return"translate("+this.translate+")rotate("+this.rotate+")skewX("+this.skew+")scale("+this.scale+")"};var sl={a:1,b:0,c:0,d:1,e:0,f:0};ta.interpolateTransform=Hu,ta.layout={},ta.layout.bundle=function(){return function(n){for(var t=[],e=-1,r=n.length;++e<r;)t.push(Yu(n[e]));return t}},ta.layout.chord=function(){function n(){var n,l,f,h,g,p={},v=[],d=ta.range(i),m=[];for(e=[],r=[],n=0,h=-1;++h<i;){for(l=0,g=-1;++g<i;)l+=u[h][g];v.push(l),m.push(ta.range(i)),n+=l}for(o&&d.sort(function(n,t){return o(v[n],v[t])}),a&&m.forEach(function(n,t){n.sort(function(n,e){return a(u[t][n],u[t][e])})}),n=(La-s*i)/n,l=0,h=-1;++h<i;){for(f=l,g=-1;++g<i;){var y=d[h],M=m[y][g],x=u[y][M],b=l,_=l+=x*n;p[y+"-"+M]={index:y,subindex:M,startAngle:b,endAngle:_,value:x}}r[y]={index:y,startAngle:f,endAngle:l,value:(l-f)/n},l+=s}for(h=-1;++h<i;)for(g=h-1;++g<i;){var w=p[h+"-"+g],S=p[g+"-"+h];(w.value||S.value)&&e.push(w.value<S.value?{source:S,target:w}:{source:w,target:S})}c&&t()}function t(){e.sort(function(n,t){return c((n.source.value+n.target.value)/2,(t.source.value+t.target.value)/2)})}var e,r,u,i,o,a,c,l={},s=0;return l.matrix=function(n){return arguments.length?(i=(u=n)&&u.length,e=r=null,l):u},l.padding=function(n){return arguments.length?(s=n,e=r=null,l):s},l.sortGroups=function(n){return arguments.length?(o=n,e=r=null,l):o},l.sortSubgroups=function(n){return arguments.length?(a=n,e=null,l):a},l.sortChords=function(n){return arguments.length?(c=n,e&&t(),l):c},l.chords=function(){return e||n(),e},l.groups=function(){return r||n(),r},l},ta.layout.force=function(){function n(n){return function(t,e,r,u){if(t.point!==n){var i=t.cx-n.x,o=t.cy-n.y,a=u-e,c=i*i+o*o;if(c>a*a/d){if(p>c){var l=t.charge/c;n.px-=i*l,n.py-=o*l}return!0}if(t.point&&c&&p>c){var l=t.pointCharge/c;n.px-=i*l,n.py-=o*l}}return!t.charge}}function t(n){n.px=ta.event.x,n.py=ta.event.y,a.resume()}var e,r,u,i,o,a={},c=ta.dispatch("start","tick","end"),l=[1,1],s=.9,f=fl,h=hl,g=-30,p=gl,v=.1,d=.64,m=[],M=[];return a.tick=function(){if((r*=.99)<.005)return c.end({type:"end",alpha:r=0}),!0;var t,e,a,f,h,p,d,y,x,b=m.length,_=M.length;for(e=0;_>e;++e)a=M[e],f=a.source,h=a.target,y=h.x-f.x,x=h.y-f.y,(p=y*y+x*x)&&(p=r*i[e]*((p=Math.sqrt(p))-u[e])/p,y*=p,x*=p,h.x-=y*(d=f.weight/(h.weight+f.weight)),h.y-=x*d,f.x+=y*(d=1-d),f.y+=x*d);if((d=r*v)&&(y=l[0]/2,x=l[1]/2,e=-1,d))for(;++e<b;)a=m[e],a.x+=(y-a.x)*d,a.y+=(x-a.y)*d;if(g)for(Ju(t=ta.geom.quadtree(m),r,o),e=-1;++e<b;)(a=m[e]).fixed||t.visit(n(a));for(e=-1;++e<b;)a=m[e],a.fixed?(a.x=a.px,a.y=a.py):(a.x-=(a.px-(a.px=a.x))*s,a.y-=(a.py-(a.py=a.y))*s);c.tick({type:"tick",alpha:r})},a.nodes=function(n){return arguments.length?(m=n,a):m},a.links=function(n){return arguments.length?(M=n,a):M},a.size=function(n){return arguments.length?(l=n,a):l},a.linkDistance=function(n){return arguments.length?(f="function"==typeof n?n:+n,a):f},a.distance=a.linkDistance,a.linkStrength=function(n){return arguments.length?(h="function"==typeof n?n:+n,a):h},a.friction=function(n){return arguments.length?(s=+n,a):s},a.charge=function(n){return arguments.length?(g="function"==typeof n?n:+n,a):g},a.chargeDistance=function(n){return arguments.length?(p=n*n,a):Math.sqrt(p)},a.gravity=function(n){return arguments.length?(v=+n,a):v},a.theta=function(n){return arguments.length?(d=n*n,a):Math.sqrt(d)},a.alpha=function(n){return arguments.length?(n=+n,r?r=n>0?n:0:n>0&&(c.start({type:"start",alpha:r=n}),ta.timer(a.tick)),a):r},a.start=function(){function n(n,r){if(!e){for(e=new Array(c),a=0;c>a;++a)e[a]=[];for(a=0;s>a;++a){var u=M[a];e[u.source.index].push(u.target),e[u.target.index].push(u.source)}}for(var i,o=e[t],a=-1,l=o.length;++a<l;)if(!isNaN(i=o[a][n]))return i;return Math.random()*r}var t,e,r,c=m.length,s=M.length,p=l[0],v=l[1];for(t=0;c>t;++t)(r=m[t]).index=t,r.weight=0;for(t=0;s>t;++t)r=M[t],"number"==typeof r.source&&(r.source=m[r.source]),"number"==typeof r.target&&(r.target=m[r.target]),++r.source.weight,++r.target.weight;for(t=0;c>t;++t)r=m[t],isNaN(r.x)&&(r.x=n("x",p)),isNaN(r.y)&&(r.y=n("y",v)),isNaN(r.px)&&(r.px=r.x),isNaN(r.py)&&(r.py=r.y);if(u=[],"function"==typeof f)for(t=0;s>t;++t)u[t]=+f.call(this,M[t],t);else for(t=0;s>t;++t)u[t]=f;if(i=[],"function"==typeof h)for(t=0;s>t;++t)i[t]=+h.call(this,M[t],t);else for(t=0;s>t;++t)i[t]=h;if(o=[],"function"==typeof g)for(t=0;c>t;++t)o[t]=+g.call(this,m[t],t);else for(t=0;c>t;++t)o[t]=g;return a.resume()},a.resume=function(){return a.alpha(.1)},a.stop=function(){return a.alpha(0)},a.drag=function(){return e||(e=ta.behavior.drag().origin(y).on("dragstart.force",Xu).on("drag.force",t).on("dragend.force",$u)),arguments.length?void this.on("mouseover.force",Bu).on("mouseout.force",Wu).call(e):e},ta.rebind(a,c,"on")};var fl=20,hl=1,gl=1/0;ta.layout.hierarchy=function(){function n(u){var i,o=[u],a=[];for(u.depth=0;null!=(i=o.pop());)if(a.push(i),(l=e.call(n,i,i.depth))&&(c=l.length)){for(var c,l,s;--c>=0;)o.push(s=l[c]),s.parent=i,s.depth=i.depth+1;r&&(i.value=0),i.children=l}else r&&(i.value=+r.call(n,i,i.depth)||0),delete i.children;return Qu(u,function(n){var e,u;t&&(e=n.children)&&e.sort(t),r&&(u=n.parent)&&(u.value+=n.value)}),a}var t=ei,e=ni,r=ti;return n.sort=function(e){return arguments.length?(t=e,n):t},n.children=function(t){return arguments.length?(e=t,n):e},n.value=function(t){return arguments.length?(r=t,n):r},n.revalue=function(t){return r&&(Ku(t,function(n){n.children&&(n.value=0)}),Qu(t,function(t){var e;t.children||(t.value=+r.call(n,t,t.depth)||0),(e=t.parent)&&(e.value+=t.value)})),t},n},ta.layout.partition=function(){function n(t,e,r,u){var i=t.children;if(t.x=e,t.y=t.depth*u,t.dx=r,t.dy=u,i&&(o=i.length)){var o,a,c,l=-1;for(r=t.value?r/t.value:0;++l<o;)n(a=i[l],e,c=a.value*r,u),e+=c}}function t(n){var e=n.children,r=0;if(e&&(u=e.length))for(var u,i=-1;++i<u;)r=Math.max(r,t(e[i]));return 1+r}function e(e,i){var o=r.call(this,e,i);return n(o[0],0,u[0],u[1]/t(o[0])),o}var r=ta.layout.hierarchy(),u=[1,1];return e.size=function(n){return arguments.length?(u=n,e):u},Gu(e,r)},ta.layout.pie=function(){function n(o){var a,c=o.length,l=o.map(function(e,r){return+t.call(n,e,r)}),s=+("function"==typeof r?r.apply(this,arguments):r),f=("function"==typeof u?u.apply(this,arguments):u)-s,h=Math.min(Math.abs(f)/c,+("function"==typeof i?i.apply(this,arguments):i)),g=h*(0>f?-1:1),p=(f-c*g)/ta.sum(l),v=ta.range(c),d=[];return null!=e&&v.sort(e===pl?function(n,t){return l[t]-l[n]}:function(n,t){return e(o[n],o[t])}),v.forEach(function(n){d[n]={data:o[n],value:a=l[n],startAngle:s,endAngle:s+=a*p+g,padAngle:h}}),d}var t=Number,e=pl,r=0,u=La,i=0;return n.value=function(e){return arguments.length?(t=e,n):t},n.sort=function(t){return arguments.length?(e=t,n):e},n.startAngle=function(t){return arguments.length?(r=t,n):r},n.endAngle=function(t){return arguments.length?(u=t,n):u},n.padAngle=function(t){return arguments.length?(i=t,n):i},n};var pl={};ta.layout.stack=function(){function n(a,c){if(!(h=a.length))return a;var l=a.map(function(e,r){return t.call(n,e,r)}),s=l.map(function(t){return t.map(function(t,e){return[i.call(n,t,e),o.call(n,t,e)]})}),f=e.call(n,s,c);l=ta.permute(l,f),s=ta.permute(s,f);var h,g,p,v,d=r.call(n,s,c),m=l[0].length;for(p=0;m>p;++p)for(u.call(n,l[0][p],v=d[p],s[0][p][1]),g=1;h>g;++g)u.call(n,l[g][p],v+=s[g-1][p][1],s[g][p][1]);return a}var t=y,e=ai,r=ci,u=oi,i=ui,o=ii;return n.values=function(e){return arguments.length?(t=e,n):t},n.order=function(t){return arguments.length?(e="function"==typeof t?t:vl.get(t)||ai,n):e},n.offset=function(t){return arguments.length?(r="function"==typeof t?t:dl.get(t)||ci,n):r},n.x=function(t){return arguments.length?(i=t,n):i},n.y=function(t){return arguments.length?(o=t,n):o},n.out=function(t){return arguments.length?(u=t,n):u},n};var vl=ta.map({"inside-out":function(n){var t,e,r=n.length,u=n.map(li),i=n.map(si),o=ta.range(r).sort(function(n,t){return u[n]-u[t]}),a=0,c=0,l=[],s=[];for(t=0;r>t;++t)e=o[t],c>a?(a+=i[e],l.push(e)):(c+=i[e],s.push(e));return s.reverse().concat(l)},reverse:function(n){return ta.range(n.length).reverse()},"default":ai}),dl=ta.map({silhouette:function(n){var t,e,r,u=n.length,i=n[0].length,o=[],a=0,c=[];for(e=0;i>e;++e){for(t=0,r=0;u>t;t++)r+=n[t][e][1];r>a&&(a=r),o.push(r)}for(e=0;i>e;++e)c[e]=(a-o[e])/2;return c},wiggle:function(n){var t,e,r,u,i,o,a,c,l,s=n.length,f=n[0],h=f.length,g=[];for(g[0]=c=l=0,e=1;h>e;++e){for(t=0,u=0;s>t;++t)u+=n[t][e][1];for(t=0,i=0,a=f[e][0]-f[e-1][0];s>t;++t){for(r=0,o=(n[t][e][1]-n[t][e-1][1])/(2*a);t>r;++r)o+=(n[r][e][1]-n[r][e-1][1])/a;i+=o*n[t][e][1]}g[e]=c-=u?i/u*a:0,l>c&&(l=c)}for(e=0;h>e;++e)g[e]-=l;return g},expand:function(n){var t,e,r,u=n.length,i=n[0].length,o=1/u,a=[];for(e=0;i>e;++e){for(t=0,r=0;u>t;t++)r+=n[t][e][1];if(r)for(t=0;u>t;t++)n[t][e][1]/=r;else for(t=0;u>t;t++)n[t][e][1]=o}for(e=0;i>e;++e)a[e]=0;return a},zero:ci});ta.layout.histogram=function(){function n(n,i){for(var o,a,c=[],l=n.map(e,this),s=r.call(this,l,i),f=u.call(this,s,l,i),i=-1,h=l.length,g=f.length-1,p=t?1:1/h;++i<g;)o=c[i]=[],o.dx=f[i+1]-(o.x=f[i]),o.y=0;if(g>0)for(i=-1;++i<h;)a=l[i],a>=s[0]&&a<=s[1]&&(o=c[ta.bisect(f,a,1,g)-1],o.y+=p,o.push(n[i]));return c}var t=!0,e=Number,r=pi,u=hi;return n.value=function(t){return arguments.length?(e=t,n):e},n.range=function(t){return arguments.length?(r=Et(t),n):r},n.bins=function(t){return arguments.length?(u="number"==typeof t?function(n){return gi(n,t)}:Et(t),n):u},n.frequency=function(e){return arguments.length?(t=!!e,n):t},n},ta.layout.pack=function(){function n(n,i){var o=e.call(this,n,i),a=o[0],c=u[0],l=u[1],s=null==t?Math.sqrt:"function"==typeof t?t:function(){return t};if(a.x=a.y=0,Qu(a,function(n){n.r=+s(n.value)}),Qu(a,Mi),r){var f=r*(t?1:Math.max(2*a.r/c,2*a.r/l))/2;Qu(a,function(n){n.r+=f}),Qu(a,Mi),Qu(a,function(n){n.r-=f})}return _i(a,c/2,l/2,t?1:1/Math.max(2*a.r/c,2*a.r/l)),o}var t,e=ta.layout.hierarchy().sort(vi),r=0,u=[1,1];return n.size=function(t){return arguments.length?(u=t,n):u},n.radius=function(e){return arguments.length?(t=null==e||"function"==typeof e?e:+e,n):t},n.padding=function(t){return arguments.length?(r=+t,n):r},Gu(n,e)},ta.layout.tree=function(){function n(n,u){var s=o.call(this,n,u),f=s[0],h=t(f);if(Qu(h,e),h.parent.m=-h.z,Ku(h,r),l)Ku(f,i);else{var g=f,p=f,v=f;Ku(f,function(n){n.x<g.x&&(g=n),n.x>p.x&&(p=n),n.depth>v.depth&&(v=n)});var d=a(g,p)/2-g.x,m=c[0]/(p.x+a(p,g)/2+d),y=c[1]/(v.depth||1);Ku(f,function(n){n.x=(n.x+d)*m,n.y=n.depth*y})}return s}function t(n){for(var t,e={A:null,children:[n]},r=[e];null!=(t=r.pop());)for(var u,i=t.children,o=0,a=i.length;a>o;++o)r.push((i[o]=u={_:i[o],parent:t,children:(u=i[o].children)&&u.slice()||[],A:null,a:null,z:0,m:0,c:0,s:0,t:null,i:o}).a=u);return e.children[0]}function e(n){var t=n.children,e=n.parent.children,r=n.i?e[n.i-1]:null;if(t.length){Ni(n);var i=(t[0].z+t[t.length-1].z)/2;r?(n.z=r.z+a(n._,r._),n.m=n.z-i):n.z=i}else r&&(n.z=r.z+a(n._,r._));n.parent.A=u(n,r,n.parent.A||e[0])}function r(n){n._.x=n.z+n.parent.m,n.m+=n.parent.m}function u(n,t,e){if(t){for(var r,u=n,i=n,o=t,c=u.parent.children[0],l=u.m,s=i.m,f=o.m,h=c.m;o=Ei(o),u=ki(u),o&&u;)c=ki(c),i=Ei(i),i.a=n,r=o.z+f-u.z-l+a(o._,u._),r>0&&(Ai(Ci(o,n,e),n,r),l+=r,s+=r),f+=o.m,l+=u.m,h+=c.m,s+=i.m;o&&!Ei(i)&&(i.t=o,i.m+=f-s),u&&!ki(c)&&(c.t=u,c.m+=l-h,e=n)}return e}function i(n){n.x*=c[0],n.y=n.depth*c[1]}var o=ta.layout.hierarchy().sort(null).value(null),a=Si,c=[1,1],l=null;return n.separation=function(t){return arguments.length?(a=t,n):a},n.size=function(t){return arguments.length?(l=null==(c=t)?i:null,n):l?null:c},n.nodeSize=function(t){return arguments.length?(l=null==(c=t)?null:i,n):l?c:null},Gu(n,o)},ta.layout.cluster=function(){function n(n,i){var o,a=t.call(this,n,i),c=a[0],l=0;Qu(c,function(n){var t=n.children;t&&t.length?(n.x=qi(t),n.y=zi(t)):(n.x=o?l+=e(n,o):0,n.y=0,o=n)});var s=Li(c),f=Ti(c),h=s.x-e(s,f)/2,g=f.x+e(f,s)/2;return Qu(c,u?function(n){n.x=(n.x-c.x)*r[0],n.y=(c.y-n.y)*r[1]}:function(n){n.x=(n.x-h)/(g-h)*r[0],n.y=(1-(c.y?n.y/c.y:1))*r[1]}),a}var t=ta.layout.hierarchy().sort(null).value(null),e=Si,r=[1,1],u=!1;return n.separation=function(t){return arguments.length?(e=t,n):e},n.size=function(t){return arguments.length?(u=null==(r=t),n):u?null:r},n.nodeSize=function(t){return arguments.length?(u=null!=(r=t),n):u?r:null},Gu(n,t)},ta.layout.treemap=function(){function n(n,t){for(var e,r,u=-1,i=n.length;++u<i;)r=(e=n[u]).value*(0>t?0:t),e.area=isNaN(r)||0>=r?0:r}function t(e){var i=e.children;if(i&&i.length){var o,a,c,l=f(e),s=[],h=i.slice(),p=1/0,v="slice"===g?l.dx:"dice"===g?l.dy:"slice-dice"===g?1&e.depth?l.dy:l.dx:Math.min(l.dx,l.dy);for(n(h,l.dx*l.dy/e.value),s.area=0;(c=h.length)>0;)s.push(o=h[c-1]),s.area+=o.area,"squarify"!==g||(a=r(s,v))<=p?(h.pop(),p=a):(s.area-=s.pop().area,u(s,v,l,!1),v=Math.min(l.dx,l.dy),s.length=s.area=0,p=1/0);s.length&&(u(s,v,l,!0),s.length=s.area=0),i.forEach(t)}}function e(t){var r=t.children;if(r&&r.length){var i,o=f(t),a=r.slice(),c=[];for(n(a,o.dx*o.dy/t.value),c.area=0;i=a.pop();)c.push(i),c.area+=i.area,null!=i.z&&(u(c,i.z?o.dx:o.dy,o,!a.length),c.length=c.area=0);r.forEach(e)}}function r(n,t){for(var e,r=n.area,u=0,i=1/0,o=-1,a=n.length;++o<a;)(e=n[o].area)&&(i>e&&(i=e),e>u&&(u=e));return r*=r,t*=t,r?Math.max(t*u*p/r,r/(t*i*p)):1/0}function u(n,t,e,r){var u,i=-1,o=n.length,a=e.x,l=e.y,s=t?c(n.area/t):0;if(t==e.dx){for((r||s>e.dy)&&(s=e.dy);++i<o;)u=n[i],u.x=a,u.y=l,u.dy=s,a+=u.dx=Math.min(e.x+e.dx-a,s?c(u.area/s):0);u.z=!0,u.dx+=e.x+e.dx-a,e.y+=s,e.dy-=s}else{for((r||s>e.dx)&&(s=e.dx);++i<o;)u=n[i],u.x=a,u.y=l,u.dx=s,l+=u.dy=Math.min(e.y+e.dy-l,s?c(u.area/s):0);u.z=!1,u.dy+=e.y+e.dy-l,e.x+=s,e.dx-=s}}function i(r){var u=o||a(r),i=u[0];return i.x=0,i.y=0,i.dx=l[0],i.dy=l[1],o&&a.revalue(i),n([i],i.dx*i.dy/i.value),(o?e:t)(i),h&&(o=u),u}var o,a=ta.layout.hierarchy(),c=Math.round,l=[1,1],s=null,f=Ri,h=!1,g="squarify",p=.5*(1+Math.sqrt(5));
return i.size=function(n){return arguments.length?(l=n,i):l},i.padding=function(n){function t(t){var e=n.call(i,t,t.depth);return null==e?Ri(t):Di(t,"number"==typeof e?[e,e,e,e]:e)}function e(t){return Di(t,n)}if(!arguments.length)return s;var r;return f=null==(s=n)?Ri:"function"==(r=typeof n)?t:"number"===r?(n=[n,n,n,n],e):e,i},i.round=function(n){return arguments.length?(c=n?Math.round:Number,i):c!=Number},i.sticky=function(n){return arguments.length?(h=n,o=null,i):h},i.ratio=function(n){return arguments.length?(p=n,i):p},i.mode=function(n){return arguments.length?(g=n+"",i):g},Gu(i,a)},ta.random={normal:function(n,t){var e=arguments.length;return 2>e&&(t=1),1>e&&(n=0),function(){var e,r,u;do e=2*Math.random()-1,r=2*Math.random()-1,u=e*e+r*r;while(!u||u>1);return n+t*e*Math.sqrt(-2*Math.log(u)/u)}},logNormal:function(){var n=ta.random.normal.apply(ta,arguments);return function(){return Math.exp(n())}},bates:function(n){var t=ta.random.irwinHall(n);return function(){return t()/n}},irwinHall:function(n){return function(){for(var t=0,e=0;n>e;e++)t+=Math.random();return t}}},ta.scale={};var ml={floor:y,ceil:y};ta.scale.linear=function(){return Ii([0,1],[0,1],mu,!1)};var yl={s:1,g:1,p:1,r:1,e:1};ta.scale.log=function(){return Ji(ta.scale.linear().domain([0,1]),10,!0,[1,10])};var Ml=ta.format(".0e"),xl={floor:function(n){return-Math.ceil(-n)},ceil:function(n){return-Math.floor(-n)}};ta.scale.pow=function(){return Gi(ta.scale.linear(),1,[0,1])},ta.scale.sqrt=function(){return ta.scale.pow().exponent(.5)},ta.scale.ordinal=function(){return Qi([],{t:"range",a:[[]]})},ta.scale.category10=function(){return ta.scale.ordinal().range(bl)},ta.scale.category20=function(){return ta.scale.ordinal().range(_l)},ta.scale.category20b=function(){return ta.scale.ordinal().range(wl)},ta.scale.category20c=function(){return ta.scale.ordinal().range(Sl)};var bl=[2062260,16744206,2924588,14034728,9725885,9197131,14907330,8355711,12369186,1556175].map(Mt),_l=[2062260,11454440,16744206,16759672,2924588,10018698,14034728,16750742,9725885,12955861,9197131,12885140,14907330,16234194,8355711,13092807,12369186,14408589,1556175,10410725].map(Mt),wl=[3750777,5395619,7040719,10264286,6519097,9216594,11915115,13556636,9202993,12426809,15186514,15190932,8666169,11356490,14049643,15177372,8077683,10834324,13528509,14589654].map(Mt),Sl=[3244733,7057110,10406625,13032431,15095053,16616764,16625259,16634018,3253076,7652470,10607003,13101504,7695281,10394312,12369372,14342891,6513507,9868950,12434877,14277081].map(Mt);ta.scale.quantile=function(){return no([],[])},ta.scale.quantize=function(){return to(0,1,[0,1])},ta.scale.threshold=function(){return eo([.5],[0,1])},ta.scale.identity=function(){return ro([0,1])},ta.svg={},ta.svg.arc=function(){function n(){var n=Math.max(0,+e.apply(this,arguments)),l=Math.max(0,+r.apply(this,arguments)),s=o.apply(this,arguments)-Ra,f=a.apply(this,arguments)-Ra,h=Math.abs(f-s),g=s>f?0:1;if(n>l&&(p=l,l=n,n=p),h>=Ta)return t(l,g)+(n?t(n,1-g):"")+"Z";var p,v,d,m,y,M,x,b,_,w,S,k,E=0,A=0,N=[];if((m=(+c.apply(this,arguments)||0)/2)&&(d=i===kl?Math.sqrt(n*n+l*l):+i.apply(this,arguments),g||(A*=-1),l&&(A=tt(d/l*Math.sin(m))),n&&(E=tt(d/n*Math.sin(m)))),l){y=l*Math.cos(s+A),M=l*Math.sin(s+A),x=l*Math.cos(f-A),b=l*Math.sin(f-A);var C=Math.abs(f-s-2*A)<=qa?0:1;if(A&&so(y,M,x,b)===g^C){var z=(s+f)/2;y=l*Math.cos(z),M=l*Math.sin(z),x=b=null}}else y=M=0;if(n){_=n*Math.cos(f-E),w=n*Math.sin(f-E),S=n*Math.cos(s+E),k=n*Math.sin(s+E);var q=Math.abs(s-f+2*E)<=qa?0:1;if(E&&so(_,w,S,k)===1-g^q){var L=(s+f)/2;_=n*Math.cos(L),w=n*Math.sin(L),S=k=null}}else _=w=0;if((p=Math.min(Math.abs(l-n)/2,+u.apply(this,arguments)))>.001){v=l>n^g?0:1;var T=null==S?[_,w]:null==x?[y,M]:Lr([y,M],[S,k],[x,b],[_,w]),R=y-T[0],D=M-T[1],P=x-T[0],U=b-T[1],j=1/Math.sin(Math.acos((R*P+D*U)/(Math.sqrt(R*R+D*D)*Math.sqrt(P*P+U*U)))/2),F=Math.sqrt(T[0]*T[0]+T[1]*T[1]);if(null!=x){var H=Math.min(p,(l-F)/(j+1)),O=fo(null==S?[_,w]:[S,k],[y,M],l,H,g),I=fo([x,b],[_,w],l,H,g);p===H?N.push("M",O[0],"A",H,",",H," 0 0,",v," ",O[1],"A",l,",",l," 0 ",1-g^so(O[1][0],O[1][1],I[1][0],I[1][1]),",",g," ",I[1],"A",H,",",H," 0 0,",v," ",I[0]):N.push("M",O[0],"A",H,",",H," 0 1,",v," ",I[0])}else N.push("M",y,",",M);if(null!=S){var Y=Math.min(p,(n-F)/(j-1)),Z=fo([y,M],[S,k],n,-Y,g),V=fo([_,w],null==x?[y,M]:[x,b],n,-Y,g);p===Y?N.push("L",V[0],"A",Y,",",Y," 0 0,",v," ",V[1],"A",n,",",n," 0 ",g^so(V[1][0],V[1][1],Z[1][0],Z[1][1]),",",1-g," ",Z[1],"A",Y,",",Y," 0 0,",v," ",Z[0]):N.push("L",V[0],"A",Y,",",Y," 0 0,",v," ",Z[0])}else N.push("L",_,",",w)}else N.push("M",y,",",M),null!=x&&N.push("A",l,",",l," 0 ",C,",",g," ",x,",",b),N.push("L",_,",",w),null!=S&&N.push("A",n,",",n," 0 ",q,",",1-g," ",S,",",k);return N.push("Z"),N.join("")}function t(n,t){return"M0,"+n+"A"+n+","+n+" 0 1,"+t+" 0,"+-n+"A"+n+","+n+" 0 1,"+t+" 0,"+n}var e=io,r=oo,u=uo,i=kl,o=ao,a=co,c=lo;return n.innerRadius=function(t){return arguments.length?(e=Et(t),n):e},n.outerRadius=function(t){return arguments.length?(r=Et(t),n):r},n.cornerRadius=function(t){return arguments.length?(u=Et(t),n):u},n.padRadius=function(t){return arguments.length?(i=t==kl?kl:Et(t),n):i},n.startAngle=function(t){return arguments.length?(o=Et(t),n):o},n.endAngle=function(t){return arguments.length?(a=Et(t),n):a},n.padAngle=function(t){return arguments.length?(c=Et(t),n):c},n.centroid=function(){var n=(+e.apply(this,arguments)+ +r.apply(this,arguments))/2,t=(+o.apply(this,arguments)+ +a.apply(this,arguments))/2-Ra;return[Math.cos(t)*n,Math.sin(t)*n]},n};var kl="auto";ta.svg.line=function(){return ho(y)};var El=ta.map({linear:go,"linear-closed":po,step:vo,"step-before":mo,"step-after":yo,basis:So,"basis-open":ko,"basis-closed":Eo,bundle:Ao,cardinal:bo,"cardinal-open":Mo,"cardinal-closed":xo,monotone:To});El.forEach(function(n,t){t.key=n,t.closed=/-closed$/.test(n)});var Al=[0,2/3,1/3,0],Nl=[0,1/3,2/3,0],Cl=[0,1/6,2/3,1/6];ta.svg.line.radial=function(){var n=ho(Ro);return n.radius=n.x,delete n.x,n.angle=n.y,delete n.y,n},mo.reverse=yo,yo.reverse=mo,ta.svg.area=function(){return Do(y)},ta.svg.area.radial=function(){var n=Do(Ro);return n.radius=n.x,delete n.x,n.innerRadius=n.x0,delete n.x0,n.outerRadius=n.x1,delete n.x1,n.angle=n.y,delete n.y,n.startAngle=n.y0,delete n.y0,n.endAngle=n.y1,delete n.y1,n},ta.svg.chord=function(){function n(n,a){var c=t(this,i,n,a),l=t(this,o,n,a);return"M"+c.p0+r(c.r,c.p1,c.a1-c.a0)+(e(c,l)?u(c.r,c.p1,c.r,c.p0):u(c.r,c.p1,l.r,l.p0)+r(l.r,l.p1,l.a1-l.a0)+u(l.r,l.p1,c.r,c.p0))+"Z"}function t(n,t,e,r){var u=t.call(n,e,r),i=a.call(n,u,r),o=c.call(n,u,r)-Ra,s=l.call(n,u,r)-Ra;return{r:i,a0:o,a1:s,p0:[i*Math.cos(o),i*Math.sin(o)],p1:[i*Math.cos(s),i*Math.sin(s)]}}function e(n,t){return n.a0==t.a0&&n.a1==t.a1}function r(n,t,e){return"A"+n+","+n+" 0 "+ +(e>qa)+",1 "+t}function u(n,t,e,r){return"Q 0,0 "+r}var i=mr,o=yr,a=Po,c=ao,l=co;return n.radius=function(t){return arguments.length?(a=Et(t),n):a},n.source=function(t){return arguments.length?(i=Et(t),n):i},n.target=function(t){return arguments.length?(o=Et(t),n):o},n.startAngle=function(t){return arguments.length?(c=Et(t),n):c},n.endAngle=function(t){return arguments.length?(l=Et(t),n):l},n},ta.svg.diagonal=function(){function n(n,u){var i=t.call(this,n,u),o=e.call(this,n,u),a=(i.y+o.y)/2,c=[i,{x:i.x,y:a},{x:o.x,y:a},o];return c=c.map(r),"M"+c[0]+"C"+c[1]+" "+c[2]+" "+c[3]}var t=mr,e=yr,r=Uo;return n.source=function(e){return arguments.length?(t=Et(e),n):t},n.target=function(t){return arguments.length?(e=Et(t),n):e},n.projection=function(t){return arguments.length?(r=t,n):r},n},ta.svg.diagonal.radial=function(){var n=ta.svg.diagonal(),t=Uo,e=n.projection;return n.projection=function(n){return arguments.length?e(jo(t=n)):t},n},ta.svg.symbol=function(){function n(n,r){return(zl.get(t.call(this,n,r))||Oo)(e.call(this,n,r))}var t=Ho,e=Fo;return n.type=function(e){return arguments.length?(t=Et(e),n):t},n.size=function(t){return arguments.length?(e=Et(t),n):e},n};var zl=ta.map({circle:Oo,cross:function(n){var t=Math.sqrt(n/5)/2;return"M"+-3*t+","+-t+"H"+-t+"V"+-3*t+"H"+t+"V"+-t+"H"+3*t+"V"+t+"H"+t+"V"+3*t+"H"+-t+"V"+t+"H"+-3*t+"Z"},diamond:function(n){var t=Math.sqrt(n/(2*Ll)),e=t*Ll;return"M0,"+-t+"L"+e+",0 0,"+t+" "+-e+",0Z"},square:function(n){var t=Math.sqrt(n)/2;return"M"+-t+","+-t+"L"+t+","+-t+" "+t+","+t+" "+-t+","+t+"Z"},"triangle-down":function(n){var t=Math.sqrt(n/ql),e=t*ql/2;return"M0,"+e+"L"+t+","+-e+" "+-t+","+-e+"Z"},"triangle-up":function(n){var t=Math.sqrt(n/ql),e=t*ql/2;return"M0,"+-e+"L"+t+","+e+" "+-t+","+e+"Z"}});ta.svg.symbolTypes=zl.keys();var ql=Math.sqrt(3),Ll=Math.tan(30*Da);_a.transition=function(n){for(var t,e,r=Tl||++Ul,u=Xo(n),i=[],o=Rl||{time:Date.now(),ease:Su,delay:0,duration:250},a=-1,c=this.length;++a<c;){i.push(t=[]);for(var l=this[a],s=-1,f=l.length;++s<f;)(e=l[s])&&$o(e,s,u,r,o),t.push(e)}return Yo(i,u,r)},_a.interrupt=function(n){return this.each(null==n?Dl:Io(Xo(n)))};var Tl,Rl,Dl=Io(Xo()),Pl=[],Ul=0;Pl.call=_a.call,Pl.empty=_a.empty,Pl.node=_a.node,Pl.size=_a.size,ta.transition=function(n,t){return n&&n.transition?Tl?n.transition(t):n:ta.selection().transition(n)},ta.transition.prototype=Pl,Pl.select=function(n){var t,e,r,u=this.id,i=this.namespace,o=[];n=N(n);for(var a=-1,c=this.length;++a<c;){o.push(t=[]);for(var l=this[a],s=-1,f=l.length;++s<f;)(r=l[s])&&(e=n.call(r,r.__data__,s,a))?("__data__"in r&&(e.__data__=r.__data__),$o(e,s,i,u,r[i][u]),t.push(e)):t.push(null)}return Yo(o,i,u)},Pl.selectAll=function(n){var t,e,r,u,i,o=this.id,a=this.namespace,c=[];n=C(n);for(var l=-1,s=this.length;++l<s;)for(var f=this[l],h=-1,g=f.length;++h<g;)if(r=f[h]){i=r[a][o],e=n.call(r,r.__data__,h,l),c.push(t=[]);for(var p=-1,v=e.length;++p<v;)(u=e[p])&&$o(u,p,a,o,i),t.push(u)}return Yo(c,a,o)},Pl.filter=function(n){var t,e,r,u=[];"function"!=typeof n&&(n=O(n));for(var i=0,o=this.length;o>i;i++){u.push(t=[]);for(var e=this[i],a=0,c=e.length;c>a;a++)(r=e[a])&&n.call(r,r.__data__,a,i)&&t.push(r)}return Yo(u,this.namespace,this.id)},Pl.tween=function(n,t){var e=this.id,r=this.namespace;return arguments.length<2?this.node()[r][e].tween.get(n):Y(this,null==t?function(t){t[r][e].tween.remove(n)}:function(u){u[r][e].tween.set(n,t)})},Pl.attr=function(n,t){function e(){this.removeAttribute(a)}function r(){this.removeAttributeNS(a.space,a.local)}function u(n){return null==n?e:(n+="",function(){var t,e=this.getAttribute(a);return e!==n&&(t=o(e,n),function(n){this.setAttribute(a,t(n))})})}function i(n){return null==n?r:(n+="",function(){var t,e=this.getAttributeNS(a.space,a.local);return e!==n&&(t=o(e,n),function(n){this.setAttributeNS(a.space,a.local,t(n))})})}if(arguments.length<2){for(t in n)this.attr(t,n[t]);return this}var o="transform"==n?Hu:mu,a=ta.ns.qualify(n);return Zo(this,"attr."+n,t,a.local?i:u)},Pl.attrTween=function(n,t){function e(n,e){var r=t.call(this,n,e,this.getAttribute(u));return r&&function(n){this.setAttribute(u,r(n))}}function r(n,e){var r=t.call(this,n,e,this.getAttributeNS(u.space,u.local));return r&&function(n){this.setAttributeNS(u.space,u.local,r(n))}}var u=ta.ns.qualify(n);return this.tween("attr."+n,u.local?r:e)},Pl.style=function(n,e,r){function u(){this.style.removeProperty(n)}function i(e){return null==e?u:(e+="",function(){var u,i=t(this).getComputedStyle(this,null).getPropertyValue(n);return i!==e&&(u=mu(i,e),function(t){this.style.setProperty(n,u(t),r)})})}var o=arguments.length;if(3>o){if("string"!=typeof n){2>o&&(e="");for(r in n)this.style(r,n[r],e);return this}r=""}return Zo(this,"style."+n,e,i)},Pl.styleTween=function(n,e,r){function u(u,i){var o=e.call(this,u,i,t(this).getComputedStyle(this,null).getPropertyValue(n));return o&&function(t){this.style.setProperty(n,o(t),r)}}return arguments.length<3&&(r=""),this.tween("style."+n,u)},Pl.text=function(n){return Zo(this,"text",n,Vo)},Pl.remove=function(){var n=this.namespace;return this.each("end.transition",function(){var t;this[n].count<2&&(t=this.parentNode)&&t.removeChild(this)})},Pl.ease=function(n){var t=this.id,e=this.namespace;return arguments.length<1?this.node()[e][t].ease:("function"!=typeof n&&(n=ta.ease.apply(ta,arguments)),Y(this,function(r){r[e][t].ease=n}))},Pl.delay=function(n){var t=this.id,e=this.namespace;return arguments.length<1?this.node()[e][t].delay:Y(this,"function"==typeof n?function(r,u,i){r[e][t].delay=+n.call(r,r.__data__,u,i)}:(n=+n,function(r){r[e][t].delay=n}))},Pl.duration=function(n){var t=this.id,e=this.namespace;return arguments.length<1?this.node()[e][t].duration:Y(this,"function"==typeof n?function(r,u,i){r[e][t].duration=Math.max(1,n.call(r,r.__data__,u,i))}:(n=Math.max(1,n),function(r){r[e][t].duration=n}))},Pl.each=function(n,t){var e=this.id,r=this.namespace;if(arguments.length<2){var u=Rl,i=Tl;try{Tl=e,Y(this,function(t,u,i){Rl=t[r][e],n.call(t,t.__data__,u,i)})}finally{Rl=u,Tl=i}}else Y(this,function(u){var i=u[r][e];(i.event||(i.event=ta.dispatch("start","end","interrupt"))).on(n,t)});return this},Pl.transition=function(){for(var n,t,e,r,u=this.id,i=++Ul,o=this.namespace,a=[],c=0,l=this.length;l>c;c++){a.push(n=[]);for(var t=this[c],s=0,f=t.length;f>s;s++)(e=t[s])&&(r=e[o][u],$o(e,s,o,i,{time:r.time,ease:r.ease,delay:r.delay+r.duration,duration:r.duration})),n.push(e)}return Yo(a,o,i)},ta.svg.axis=function(){function n(n){n.each(function(){var n,l=ta.select(this),s=this.__chart__||e,f=this.__chart__=e.copy(),h=null==c?f.ticks?f.ticks.apply(f,a):f.domain():c,g=null==t?f.tickFormat?f.tickFormat.apply(f,a):y:t,p=l.selectAll(".tick").data(h,f),v=p.enter().insert("g",".domain").attr("class","tick").style("opacity",Ca),d=ta.transition(p.exit()).style("opacity",Ca).remove(),m=ta.transition(p.order()).style("opacity",1),M=Math.max(u,0)+o,x=Ui(f),b=l.selectAll(".domain").data([0]),_=(b.enter().append("path").attr("class","domain"),ta.transition(b));v.append("line"),v.append("text");var w,S,k,E,A=v.select("line"),N=m.select("line"),C=p.select("text").text(g),z=v.select("text"),q=m.select("text"),L="top"===r||"left"===r?-1:1;if("bottom"===r||"top"===r?(n=Bo,w="x",k="y",S="x2",E="y2",C.attr("dy",0>L?"0em":".71em").style("text-anchor","middle"),_.attr("d","M"+x[0]+","+L*i+"V0H"+x[1]+"V"+L*i)):(n=Wo,w="y",k="x",S="y2",E="x2",C.attr("dy",".32em").style("text-anchor",0>L?"end":"start"),_.attr("d","M"+L*i+","+x[0]+"H0V"+x[1]+"H"+L*i)),A.attr(E,L*u),z.attr(k,L*M),N.attr(S,0).attr(E,L*u),q.attr(w,0).attr(k,L*M),f.rangeBand){var T=f,R=T.rangeBand()/2;s=f=function(n){return T(n)+R}}else s.rangeBand?s=f:d.call(n,f,s);v.call(n,s,f),m.call(n,f,f)})}var t,e=ta.scale.linear(),r=jl,u=6,i=6,o=3,a=[10],c=null;return n.scale=function(t){return arguments.length?(e=t,n):e},n.orient=function(t){return arguments.length?(r=t in Fl?t+"":jl,n):r},n.ticks=function(){return arguments.length?(a=arguments,n):a},n.tickValues=function(t){return arguments.length?(c=t,n):c},n.tickFormat=function(e){return arguments.length?(t=e,n):t},n.tickSize=function(t){var e=arguments.length;return e?(u=+t,i=+arguments[e-1],n):u},n.innerTickSize=function(t){return arguments.length?(u=+t,n):u},n.outerTickSize=function(t){return arguments.length?(i=+t,n):i},n.tickPadding=function(t){return arguments.length?(o=+t,n):o},n.tickSubdivide=function(){return arguments.length&&n},n};var jl="bottom",Fl={top:1,right:1,bottom:1,left:1};ta.svg.brush=function(){function n(t){t.each(function(){var t=ta.select(this).style("pointer-events","all").style("-webkit-tap-highlight-color","rgba(0,0,0,0)").on("mousedown.brush",i).on("touchstart.brush",i),o=t.selectAll(".background").data([0]);o.enter().append("rect").attr("class","background").style("visibility","hidden").style("cursor","crosshair"),t.selectAll(".extent").data([0]).enter().append("rect").attr("class","extent").style("cursor","move");var a=t.selectAll(".resize").data(v,y);a.exit().remove(),a.enter().append("g").attr("class",function(n){return"resize "+n}).style("cursor",function(n){return Hl[n]}).append("rect").attr("x",function(n){return/[ew]$/.test(n)?-3:null}).attr("y",function(n){return/^[ns]/.test(n)?-3:null}).attr("width",6).attr("height",6).style("visibility","hidden"),a.style("display",n.empty()?"none":null);var c,f=ta.transition(t),h=ta.transition(o);l&&(c=Ui(l),h.attr("x",c[0]).attr("width",c[1]-c[0]),r(f)),s&&(c=Ui(s),h.attr("y",c[0]).attr("height",c[1]-c[0]),u(f)),e(f)})}function e(n){n.selectAll(".resize").attr("transform",function(n){return"translate("+f[+/e$/.test(n)]+","+h[+/^s/.test(n)]+")"})}function r(n){n.select(".extent").attr("x",f[0]),n.selectAll(".extent,.n>rect,.s>rect").attr("width",f[1]-f[0])}function u(n){n.select(".extent").attr("y",h[0]),n.selectAll(".extent,.e>rect,.w>rect").attr("height",h[1]-h[0])}function i(){function i(){32==ta.event.keyCode&&(C||(M=null,q[0]-=f[1],q[1]-=h[1],C=2),S())}function v(){32==ta.event.keyCode&&2==C&&(q[0]+=f[1],q[1]+=h[1],C=0,S())}function d(){var n=ta.mouse(b),t=!1;x&&(n[0]+=x[0],n[1]+=x[1]),C||(ta.event.altKey?(M||(M=[(f[0]+f[1])/2,(h[0]+h[1])/2]),q[0]=f[+(n[0]<M[0])],q[1]=h[+(n[1]<M[1])]):M=null),A&&m(n,l,0)&&(r(k),t=!0),N&&m(n,s,1)&&(u(k),t=!0),t&&(e(k),w({type:"brush",mode:C?"move":"resize"}))}function m(n,t,e){var r,u,i=Ui(t),c=i[0],l=i[1],s=q[e],v=e?h:f,d=v[1]-v[0];return C&&(c-=s,l-=d+s),r=(e?p:g)?Math.max(c,Math.min(l,n[e])):n[e],C?u=(r+=s)+d:(M&&(s=Math.max(c,Math.min(l,2*M[e]-r))),r>s?(u=r,r=s):u=s),v[0]!=r||v[1]!=u?(e?a=null:o=null,v[0]=r,v[1]=u,!0):void 0}function y(){d(),k.style("pointer-events","all").selectAll(".resize").style("display",n.empty()?"none":null),ta.select("body").style("cursor",null),L.on("mousemove.brush",null).on("mouseup.brush",null).on("touchmove.brush",null).on("touchend.brush",null).on("keydown.brush",null).on("keyup.brush",null),z(),w({type:"brushend"})}var M,x,b=this,_=ta.select(ta.event.target),w=c.of(b,arguments),k=ta.select(b),E=_.datum(),A=!/^(n|s)$/.test(E)&&l,N=!/^(e|w)$/.test(E)&&s,C=_.classed("extent"),z=W(b),q=ta.mouse(b),L=ta.select(t(b)).on("keydown.brush",i).on("keyup.brush",v);if(ta.event.changedTouches?L.on("touchmove.brush",d).on("touchend.brush",y):L.on("mousemove.brush",d).on("mouseup.brush",y),k.interrupt().selectAll("*").interrupt(),C)q[0]=f[0]-q[0],q[1]=h[0]-q[1];else if(E){var T=+/w$/.test(E),R=+/^n/.test(E);x=[f[1-T]-q[0],h[1-R]-q[1]],q[0]=f[T],q[1]=h[R]}else ta.event.altKey&&(M=q.slice());k.style("pointer-events","none").selectAll(".resize").style("display",null),ta.select("body").style("cursor",_.style("cursor")),w({type:"brushstart"}),d()}var o,a,c=E(n,"brushstart","brush","brushend"),l=null,s=null,f=[0,0],h=[0,0],g=!0,p=!0,v=Ol[0];return n.event=function(n){n.each(function(){var n=c.of(this,arguments),t={x:f,y:h,i:o,j:a},e=this.__chart__||t;this.__chart__=t,Tl?ta.select(this).transition().each("start.brush",function(){o=e.i,a=e.j,f=e.x,h=e.y,n({type:"brushstart"})}).tween("brush:brush",function(){var e=yu(f,t.x),r=yu(h,t.y);return o=a=null,function(u){f=t.x=e(u),h=t.y=r(u),n({type:"brush",mode:"resize"})}}).each("end.brush",function(){o=t.i,a=t.j,n({type:"brush",mode:"resize"}),n({type:"brushend"})}):(n({type:"brushstart"}),n({type:"brush",mode:"resize"}),n({type:"brushend"}))})},n.x=function(t){return arguments.length?(l=t,v=Ol[!l<<1|!s],n):l},n.y=function(t){return arguments.length?(s=t,v=Ol[!l<<1|!s],n):s},n.clamp=function(t){return arguments.length?(l&&s?(g=!!t[0],p=!!t[1]):l?g=!!t:s&&(p=!!t),n):l&&s?[g,p]:l?g:s?p:null},n.extent=function(t){var e,r,u,i,c;return arguments.length?(l&&(e=t[0],r=t[1],s&&(e=e[0],r=r[0]),o=[e,r],l.invert&&(e=l(e),r=l(r)),e>r&&(c=e,e=r,r=c),(e!=f[0]||r!=f[1])&&(f=[e,r])),s&&(u=t[0],i=t[1],l&&(u=u[1],i=i[1]),a=[u,i],s.invert&&(u=s(u),i=s(i)),u>i&&(c=u,u=i,i=c),(u!=h[0]||i!=h[1])&&(h=[u,i])),n):(l&&(o?(e=o[0],r=o[1]):(e=f[0],r=f[1],l.invert&&(e=l.invert(e),r=l.invert(r)),e>r&&(c=e,e=r,r=c))),s&&(a?(u=a[0],i=a[1]):(u=h[0],i=h[1],s.invert&&(u=s.invert(u),i=s.invert(i)),u>i&&(c=u,u=i,i=c))),l&&s?[[e,u],[r,i]]:l?[e,r]:s&&[u,i])},n.clear=function(){return n.empty()||(f=[0,0],h=[0,0],o=a=null),n},n.empty=function(){return!!l&&f[0]==f[1]||!!s&&h[0]==h[1]},ta.rebind(n,c,"on")};var Hl={n:"ns-resize",e:"ew-resize",s:"ns-resize",w:"ew-resize",nw:"nwse-resize",ne:"nesw-resize",se:"nwse-resize",sw:"nesw-resize"},Ol=[["n","e","s","w","nw","ne","se","sw"],["e","w"],["n","s"],[]],Il=ac.format=gc.timeFormat,Yl=Il.utc,Zl=Yl("%Y-%m-%dT%H:%M:%S.%LZ");Il.iso=Date.prototype.toISOString&&+new Date("2000-01-01T00:00:00.000Z")?Jo:Zl,Jo.parse=function(n){var t=new Date(n);return isNaN(t)?null:t},Jo.toString=Zl.toString,ac.second=Ft(function(n){return new cc(1e3*Math.floor(n/1e3))},function(n,t){n.setTime(n.getTime()+1e3*Math.floor(t))},function(n){return n.getSeconds()}),ac.seconds=ac.second.range,ac.seconds.utc=ac.second.utc.range,ac.minute=Ft(function(n){return new cc(6e4*Math.floor(n/6e4))},function(n,t){n.setTime(n.getTime()+6e4*Math.floor(t))},function(n){return n.getMinutes()}),ac.minutes=ac.minute.range,ac.minutes.utc=ac.minute.utc.range,ac.hour=Ft(function(n){var t=n.getTimezoneOffset()/60;return new cc(36e5*(Math.floor(n/36e5-t)+t))},function(n,t){n.setTime(n.getTime()+36e5*Math.floor(t))},function(n){return n.getHours()}),ac.hours=ac.hour.range,ac.hours.utc=ac.hour.utc.range,ac.month=Ft(function(n){return n=ac.day(n),n.setDate(1),n},function(n,t){n.setMonth(n.getMonth()+t)},function(n){return n.getMonth()}),ac.months=ac.month.range,ac.months.utc=ac.month.utc.range;var Vl=[1e3,5e3,15e3,3e4,6e4,3e5,9e5,18e5,36e5,108e5,216e5,432e5,864e5,1728e5,6048e5,2592e6,7776e6,31536e6],Xl=[[ac.second,1],[ac.second,5],[ac.second,15],[ac.second,30],[ac.minute,1],[ac.minute,5],[ac.minute,15],[ac.minute,30],[ac.hour,1],[ac.hour,3],[ac.hour,6],[ac.hour,12],[ac.day,1],[ac.day,2],[ac.week,1],[ac.month,1],[ac.month,3],[ac.year,1]],$l=Il.multi([[".%L",function(n){return n.getMilliseconds()}],[":%S",function(n){return n.getSeconds()}],["%I:%M",function(n){return n.getMinutes()}],["%I %p",function(n){return n.getHours()}],["%a %d",function(n){return n.getDay()&&1!=n.getDate()}],["%b %d",function(n){return 1!=n.getDate()}],["%B",function(n){return n.getMonth()}],["%Y",Ne]]),Bl={range:function(n,t,e){return ta.range(Math.ceil(n/e)*e,+t,e).map(Ko)},floor:y,ceil:y};Xl.year=ac.year,ac.scale=function(){return Go(ta.scale.linear(),Xl,$l)};var Wl=Xl.map(function(n){return[n[0].utc,n[1]]}),Jl=Yl.multi([[".%L",function(n){return n.getUTCMilliseconds()}],[":%S",function(n){return n.getUTCSeconds()}],["%I:%M",function(n){return n.getUTCMinutes()}],["%I %p",function(n){return n.getUTCHours()}],["%a %d",function(n){return n.getUTCDay()&&1!=n.getUTCDate()}],["%b %d",function(n){return 1!=n.getUTCDate()}],["%B",function(n){return n.getUTCMonth()}],["%Y",Ne]]);Wl.year=ac.year.utc,ac.scale.utc=function(){return Go(ta.scale.linear(),Wl,Jl)},ta.text=At(function(n){return n.responseText}),ta.json=function(n,t){return Nt(n,"application/json",Qo,t)},ta.html=function(n,t){return Nt(n,"text/html",na,t)},ta.xml=At(function(n){return n.responseXML}),"function"==typeof define&&define.amd?define(ta):"object"==typeof module&&module.exports&&(module.exports=ta),this.d3=ta}();



"function"!=typeof Object.create&&(Object.create=function(t){function o(){}return o.prototype=t,new o}),function(t,o,i,s){"use strict";var n={_positionClasses:["bottom-left","bottom-right","top-right","top-left","bottom-center","top-center","mid-center"],_defaultIcons:["success","error","info","warning"],init:function(o,i){this.prepareOptions(o,t.toast.options),this.process()},prepareOptions:function(o,i){var s={};"string"==typeof o||o instanceof Array?s.text=o:s=o,this.options=t.extend({},i,s)},process:function(){this.setup(),this.addToDom(),this.position(),this.bindToast(),this.animate()},setup:function(){var o="";if(this._toastEl=this._toastEl||t("<div></div>",{"class":"jq-toast-single"}),o+='<span class="jq-toast-loader"></span>',this.options.allowToastClose&&(o+='<span class="close-jq-toast-single">&times;</span>'),this.options.text instanceof Array){this.options.heading&&(o+='<h2 class="jq-toast-heading">'+this.options.heading+"</h2>"),o+='<ul class="jq-toast-ul">';for(var i=0;i<this.options.text.length;i++)o+='<li class="jq-toast-li" id="jq-toast-item-'+i+'">'+this.options.text[i]+"</li>";o+="</ul>"}else this.options.heading&&(o+='<h2 class="jq-toast-heading">'+this.options.heading+"</h2>"),o+=this.options.text;this._toastEl.html(o),this.options.bgColor!==!1&&this._toastEl.css("background-color",this.options.bgColor),this.options.textColor!==!1&&this._toastEl.css("color",this.options.textColor),this.options.textAlign&&this._toastEl.css("text-align",this.options.textAlign),this.options.icon!==!1&&(this._toastEl.addClass("jq-has-icon"),-1!==t.inArray(this.options.icon,this._defaultIcons)&&this._toastEl.addClass("jq-icon-"+this.options.icon)),this.options["class"]!==!1&&this._toastEl.addClass(this.options["class"])},position:function(){"string"==typeof this.options.position&&-1!==t.inArray(this.options.position,this._positionClasses)?"bottom-center"===this.options.position?this._container.css({left:t(o).outerWidth()/2-this._container.outerWidth()/2,bottom:20}):"top-center"===this.options.position?this._container.css({left:t(o).outerWidth()/2-this._container.outerWidth()/2,top:20}):"mid-center"===this.options.position?this._container.css({left:t(o).outerWidth()/2-this._container.outerWidth()/2,top:t(o).outerHeight()/2-this._container.outerHeight()/2}):this._container.addClass(this.options.position):"object"==typeof this.options.position?this._container.css({top:this.options.position.top?this.options.position.top:"auto",bottom:this.options.position.bottom?this.options.position.bottom:"auto",left:this.options.position.left?this.options.position.left:"auto",right:this.options.position.right?this.options.position.right:"auto"}):this._container.addClass("bottom-left")},bindToast:function(){var t=this;this._toastEl.on("afterShown",function(){t.processLoader()}),this._toastEl.find(".close-jq-toast-single").on("click",function(o){o.preventDefault(),"fade"===t.options.showHideTransition?(t._toastEl.trigger("beforeHide"),t._toastEl.fadeOut(function(){t._toastEl.trigger("afterHidden")})):"slide"===t.options.showHideTransition?(t._toastEl.trigger("beforeHide"),t._toastEl.slideUp(function(){t._toastEl.trigger("afterHidden")})):(t._toastEl.trigger("beforeHide"),t._toastEl.hide(function(){t._toastEl.trigger("afterHidden")}))}),"function"==typeof this.options.beforeShow&&this._toastEl.on("beforeShow",function(){t.options.beforeShow()}),"function"==typeof this.options.afterShown&&this._toastEl.on("afterShown",function(){t.options.afterShown()}),"function"==typeof this.options.beforeHide&&this._toastEl.on("beforeHide",function(){t.options.beforeHide()}),"function"==typeof this.options.afterHidden&&this._toastEl.on("afterHidden",function(){t.options.afterHidden()})},addToDom:function(){var o=t(".jq-toast-wrap");if(0===o.length?(o=t("<div></div>",{"class":"jq-toast-wrap"}),t("body").append(o)):(!this.options.stack||isNaN(parseInt(this.options.stack,10)))&&o.empty(),o.find(".jq-toast-single:hidden").remove(),o.append(this._toastEl),this.options.stack&&!isNaN(parseInt(this.options.stack),10)){var i=o.find(".jq-toast-single").length,s=i-this.options.stack;s>0&&t(".jq-toast-wrap").find(".jq-toast-single").slice(0,s).remove()}this._container=o},canAutoHide:function(){return this.options.hideAfter!==!1&&!isNaN(parseInt(this.options.hideAfter,10))},processLoader:function(){if(!this.canAutoHide()||this.options.loader===!1)return!1;var t=this._toastEl.find(".jq-toast-loader"),o=(this.options.hideAfter-400)/1e3+"s",i=this.options.loaderBg,s=t.attr("style")||"";s=s.substring(0,s.indexOf("-webkit-transition")),s+="-webkit-transition: width "+o+" ease-in;                       -o-transition: width "+o+" ease-in;                       transition: width "+o+" ease-in;                       background-color: "+i+";",t.attr("style",s).addClass("jq-toast-loaded")},animate:function(){var t=this;if(this._toastEl.hide(),this._toastEl.trigger("beforeShow"),"fade"===this.options.showHideTransition.toLowerCase()?this._toastEl.fadeIn(function(){t._toastEl.trigger("afterShown")}):"slide"===this.options.showHideTransition.toLowerCase()?this._toastEl.slideDown(function(){t._toastEl.trigger("afterShown")}):this._toastEl.show(function(){t._toastEl.trigger("afterShown")}),this.canAutoHide()){var t=this;o.setTimeout(function(){"fade"===t.options.showHideTransition.toLowerCase()?(t._toastEl.trigger("beforeHide"),t._toastEl.fadeOut(function(){t._toastEl.trigger("afterHidden")})):"slide"===t.options.showHideTransition.toLowerCase()?(t._toastEl.trigger("beforeHide"),t._toastEl.slideUp(function(){t._toastEl.trigger("afterHidden")})):(t._toastEl.trigger("beforeHide"),t._toastEl.hide(function(){t._toastEl.trigger("afterHidden")}))},this.options.hideAfter)}},reset:function(o){"all"===o?t(".jq-toast-wrap").remove():this._toastEl.remove()},update:function(t){this.prepareOptions(t,this.options),this.setup(),this.bindToast()}};t.toast=function(t){var o=Object.create(n);return o.init(t,this),{reset:function(t){o.reset(t)},update:function(t){o.update(t)}}},t.toast.options={text:"",heading:"",showHideTransition:"fade",allowToastClose:!0,hideAfter:3e3,loader:!0,loaderBg:"#9EC600",stack:5,position:"bottom-left",bgColor:!1,textColor:!1,textAlign:"left",icon:!1,beforeShow:function(){},afterShown:function(){},beforeHide:function(){},afterHidden:function(){}}}(jQuery,window,document);

<%
}
%>
