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
  String strBody = request.getAttribute(BlankField.VIEW_BODY) == null ? "" : (String)request.getAttribute(BlankField.VIEW_BODY);
  String strFooter = request.getAttribute(BlankField.VIEW_FOOTER) == null ? "" : (String)request.getAttribute(BlankField.VIEW_FOOTER); 
  String strLeft = request.getAttribute(BlankField.VIEW_LEFT) == null ? "" : (String)request.getAttribute(BlankField.VIEW_LEFT); 
  String strRight = request.getAttribute(BlankField.VIEW_RIGHT) == null ? "" : (String)request.getAttribute(BlankField.VIEW_RIGHT); 
  String strTop = request.getAttribute(BlankField.VIEW_TOP) == null ? "" : (String)request.getAttribute(BlankField.VIEW_TOP); 
  String currentPath = "Please Input";
%>
<!DOCTYPE html>
<html lang="en">
    
<head>
     <title>TRINITY 3.1</title><meta charset="UTF-8" />
       <meta name="viewport" content="width=device-width, initial-scale=1.0" />


<script src="/jsp/summernote/jquery-3.3.1.js"></script>
<script src="/jsp/trinity2/js/jquery.min.js"></script>
<script src="/jsp/trinity2/js/bootstrap.min.js"></script>
<script src="/jsp/summernote/summernote-bs4.min.js"></script>
<link href="/jsp/trinity2/css/bootstrap.min.css" rel="stylesheet" />
<!--<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">-->
<link href="/jsp/summernote/summernote-bs4.min.css" rel="stylesheet" />

        <link rel="stylesheet" href="/jsp/trinity2/css/bootstrap-responsive.min.css" />
        <!--link rel="stylesheet" href="/jsp/trinity2/css/maruti-login.css" /-->
        <link rel="stylesheet" href="/jsp/trinity2/css/fullcalendar.css" />
        <link rel="stylesheet" href="/jsp/trinity2/css/maruti-style.css" />
        <link rel="stylesheet" href="/jsp/trinity2/css/maruti-media.css" class="skin-color" />
        <link href="/bt/admin-v2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="/jsp/Neo/css/style.css">
        <link rel="stylesheet" href="/bt/jquery-ui/1.12.1/jquery-ui.theme.css" />
        <link rel="stylesheet" href="/bt/jquery-ui/1.12.1/jquery-ui.css" />
        <link rel="stylesheet" href="/bt/jquery-ui/1.12.1/jquery-ui.structure.css" />
        <link rel="stylesheet" href="/jsp/API/css/my.css">

<script src="/jsp/trinity2/js/excanvas.min.js"></script>
<!--script src="/jsp/trinity2/js/jquery.ui.custom.js"></script-->

<!--script src="/jsp/trinity2/js/jquery.flot.min.js"></script-->
<!--script src="/jsp/trinity2/js/jquery.flot.resize.min.js"></script-->
<script src="/jsp/trinity2/js/jquery.peity.min.js"></script>
<script src="/jsp/trinity2/js/fullcalendar.min.js"></script>
<!--script src="/jsp/trinity2/js/maruti.js"></script-->
<!--script src="/jsp/trinity2/js/maruti.dashboard.js"></script-->
<script src="/jsp/trinity2/js/maruti.chat.js"></script>
<script src="/bt/jquery-ui/1.12.1/jquery-ui.js"></script>

<script src="/jsp/anaconda/js/default.js"></script>
<script src="/jsp/summernote/paper-1.14.5.js"></script>
<script src="/jsp/API/js/process.js"></script>

<link rel="stylesheet" href="/bt/css/toggle.css">
   <script src="/bt/js/toggle.js"></script> 

<!--
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
-->

<%
boolean isLogin = false;
if(session.getAttribute(InitClass.getSESSION_DOMAIN()) == null){
	 isLogin = false;
}else{
	isLogin = true;
	RequestHelper helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
	DefaultAuth auth = (DefaultAuth)helper.getSessionObject();
	String strSessionValue = "";
	if(auth != null)
	{
		strSessionValue = auth.getAuthItem(("MEMBER_NAME"));	
	}
}
String cmd = request.getParameter("CMD");
if(!BusinessHelper.checkNull(cmd)){
   cmd = "";
}
%>
<script language="javascript">
function fnSelectSearch()
{
	with(smartFrm)
	{
		search.value = '';
	}
}
function smartSearch()
{
  with(smartFrm)
  {
    search.value = keyword.value;
    if(search.value == '' || search.value == 'Input keyword'){
      if(confirm('Search a current page?')){
	searchCurrentPage();      
      }
    }else{
      setCookie("search-word",search.value,1);
      action = "/Anaconda.do";
      submit();
    }
  }
}
function goPMS()
{
	setCookie("HMENU","PMS",1);
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_104651175361332065328722";
}
function goMyPage()
{
	setCookie("HMENU","PMS",1);
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_101590000581381445705515";
}
function goWDEV()
{
	setCookie("HMENU","WDEV",1);
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_108173637391288444301255";
}
function goWIKI()
{
	setCookie("HMENU","WIKI",1);
	document.location.href = "/	sdlc/Anaconda.do?CMD=CMD_SEQ_104757947291319959645242&gubun=1";
}
function goSecession()
{
	if(confirm("Really leave?")){
            if(confirm("Really?")){
                if(confirm("You can not use you account any more.")){
   		    document.location.href = "/Anaconda.do?CMD=CMD_SEQ_107375260951381444906625";
                }
            }
	}
}
function goLogin()
{
	setCookie("HMENU","PMS",1);
        // CMD_SEQ_100937963281288324762498
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_101883437261289891462965"; 	
}
function searchCurrentPage(){
   var cmd = '<%=cmd%>';
   if( cmd != ''){
     with(smartFrm){
        search.value = cmd;
 	setCookie("search-word",search.value,1);
	action = "/Anaconda.do";
	submit();
     }
   }else{
     alert('Can not find command!!!');  
   }
}
</script>

<style>

/* ---------- CLEARFIX ---------- */
/* For modern browsers */
.cf:before,
.cf:after {
    content: "";
    display: table;
}

.cf:after { clear:both; }

/* For IE 6/7 (trigger hasLayout) */
.cf { zoom: 1; }


body{
  height : 100%;
  min-height:100%;
  background : #fff;   
}
.container{ 
   min-width:95%;
   min-height:100%;
   background : #fff;
}
select { font-size: 12px;
   align:center;background:#fff;
}

table {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
  background: #fff;
}

table td, table th {
  border: 1px solid #ddd;
  padding: 8px;
}

// table tr:nth-child(even){background-color: #f2f2f2;}

//table tr:hover {background-color: #ddd;}

table th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  // background-color: #efefef;
  color: #000000;
}


table {
    float: left;
}
.table_hydra{
    float: none;
}

#search button {
  margin-top : 0px;
}

/*
th {
    display: table-cell;
    vertical-align: center;
    font-weight: bold;
    text-align: left;
    
   padding-left : 8px;
   padding-top : 8px;
   padding-bottom : 8px;
}

td{
   padding-left : 8px;
   padding-top : 8px;
   padding-bottom : 8px;
}
*/
select, textarea, input[type="text"], input[type="password"], input[type="datetime"], input[type="datetime-local"], input[type="date"], input[type="month"], input[type="time"], input[type="week"], input[type="number"], input[type="email"], input[type="url"], input[type="search"], input[type="tel"], input[type="color"], .uneditable-input {
    margin-bottom: 0px;
}
#menuToggle
{
  display: block;
  position: relative;
  top: -41px;
  left: 10px;
  width:400px;
  z-index: 1;
  
  -webkit-user-select: none;
  user-select: none;

  // box-shadow: 5px 5px;
}

#menuToggle a
{
  text-decoration: none;
  color: #232323;
  
  transition: color 0.3s ease;
}

#menuToggle a:hover
{
  color: tomato;
}


#menuToggle input
{
  display: block;
  width: 40px;
  height: 32px;
  position: absolute;
  top: -7px;
  left: -5px;
  
  cursor: pointer;
  
  opacity: 0; /* hide this */
  z-index: 2; /* and place it over the hamburger */
  
  -webkit-touch-callout: none;
}

/*
 * Just a quick hamburger
 */
#menuToggle span
{
  display: block;
  width: 33px;
  height: 4px;
  margin-bottom: 5px;
  position: relative;
  
  background: #cdcdcd;
  border-radius: 3px;
  
  z-index: 1;
  
  transform-origin: 4px 0px;
  
  transition: transform 0.5s cubic-bezier(0.77,0.2,0.05,1.0),
              background 0.5s cubic-bezier(0.77,0.2,0.05,1.0),
              opacity 0.55s ease;
}

#menuToggle span:first-child
{
  transform-origin: 0% 0%;
}

#menuToggle span:nth-last-child(2)
{
  transform-origin: 0% 100%;
}

/* 
 * Transform all the slices of hamburger
 * into a crossmark.
 */
#menuToggle input:checked ~ span
{
  opacity: 1;
  transform: rotate(45deg) translate(-2px, -1px);
  background: #232323;
}

/*
 * But let's hide the middle one.
 */
#menuToggle input:checked ~ span:nth-last-child(3)
{
  opacity: 0;
  transform: rotate(0deg) scale(0.2, 0.2);
}

/*
 * Ohyeah and the last one should go the other direction
 */
#menuToggle input:checked ~ span:nth-last-child(2)
{
  transform: rotate(-45deg) translate(0, -1px);
}

/*
 * Make this absolute positioned
 * at the top left of the screen
 */
#menu
{
  position: absolute;
  width: 350px;
  margin: -100px 0 0 -50px;
  padding: 50px;
  padding-top: 125px;
  
  background: #ededed;
  list-style-type: none;
  -webkit-font-smoothing: antialiased;
  /* to stop flickering of text in safari */
  
  transform-origin: 0% 0%;
  transform: translate(-100%, 0);
  
  transition: transform 0.5s cubic-bezier(0.77,0.2,0.05,1.0);
}

#menu li a
{
  // padding: 10px 0;
  font-size: 20px;
}
#menu li a i
{
  font-size: 15px;
}

#menu li ul li a
{
  // padding: 10px 0;
  font-size: 18px;
  font-color:blue;
}

#menu li ul li a i
{
  font-size: 7px;
}

/*
 * And let's slide it in from the left
 */
#menuToggle input:checked ~ ul
{
  transform: none;
}
html,body{
  height:100%;
}

textarea {
   min-width: 98%;
}

/*
#content{
   padding-bottom:0px;
   height:100%;
   min-height:100%;
   background: #fff;
}

#footer {
   width:100%;
   position:relative;
   // bottom:0;
   text-align: center;
}
.row-fluid{
   background : white;
}
*/

/*
// Override
*/

.modal {
  // position: fixed;
  /*
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  */
  z-index: 1050;
  display: none;
  overflow: hidden;
  -webkit-overflow-scrolling: touch;
  outline: 0;
}
.resizable-content {
  //min-height: 30px;
  //min-width: 30px;
  resize: both;
  overflow: auto;
  //max-height: fit-content;
  //max-width: fit-content;
}

</style>

    </head>
    <body>
<style type="text/css">
.popup{
    border: 1px solid #6b6a63;
    width: 400px;
    border-radius :px;
    margin : auto;
    padding : 20px;
    position:fixed;
    display:none;
    z-index:1000;
}
</style>
<div id='message'  class="popup"></div>
<script language="javascript">
$(document).ready(function(){
    var popup_height = document.getElementById('message').offsetHeight;
    var popup_width = document.getElementById('message').offsetWidth;
    $(".popup").css('top',(($(window).height()-popup_height)/2));
    $(".popup").css('left',(($(window).width()-popup_width)/2));
});

function talert(msg){
    $('div#message').html('Current  : ' + getTime() + '<br>' + msg).css('background','yellow');
    $('div#message').fadeIn(1000).delay(1000).fadeOut(1000);
}
function getTime(){
   var currentdate = new Date();
   var datetime = "Last Sync: " + currentdate.getDay() + "/"+currentdate.getMonth()
                + "/" + currentdate.getFullYear() + " @ "
                + currentdate.getHours() + ":"
                + currentdate.getMinutes() + ":" + currentdate.getSeconds();
   return datetime;
}
</script>

<!--Header-part-->
<div id="NavBar" style="display:block">
<div id="header">
  <h1><a href="/CMD_SEQ_108164918711286971872119.do" style="color:#1d8539;"><img src="/img/trinity.png"></a></h1>
</div>
<!--close-Header-part--> 



<!--top-Header-messaages-->
<div class="btn-group rightzero">
 <a class="top_message tip-left" title="Manage Files"><i class="icon-file"></i></a>
 <a class="top_message tip-bottom" title="Manage Users"><i class="icon-user"></i></a>
 <a class="top_message tip-bottom" title="Manage Comments"><i class="icon-comment"></i><span class="label label-important">5</span></a>
 <a class="top_message tip-bottom" title="Manage Orders"><i class="icon-shopping-cart"></i></a>
</div>
<!--close-top-Header-messaages--> 

<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
<% if(isLogin){ %>
    <li class=""><a href="/CMD_SEQ_108037707931289267322444.do" title="데이터베이스 탐색하기"> <span class="fas fa-database"></span></a></li>
    <li class=""><a href="/CMD_SEQ_103935205231230567381328.do" title="SQL 실행하기"> <span class="fas fa-running"></span></a></li>
    <li class=""><a href="/CMD_SEQ_101666004731562248869595.do" title="Shell 실행하기"> <span class="fas fa-play-circle"></span></a></li>
    <li class=""><a href="/CMD_SEQ_107581931011562108379033.do" title="파일 탐색하기"> <span class="fas fa-folder-open"></span></a></li>
    <li class=""><a href="/CMD_SEQ_106594560501498179923551.do" title="파일 수정하기"> <span class="fas fa-edit"></span ></a></li>
    <li class=""><a href="/CMD_SEQ_104740062431578035448248.do" title="서버 로그 확인하기"> <span class="fas fa-desktop"></span ></a></li>

    <li class=""><a href="/CMD_SEQ_108173637391288444301255.do" title="사이트 도메인 관리하기"> <span class="fas fa-sitemap"></span></a></li>
    <li class=""><a href="/CMD_SEQ_108164918711286971872119.do" title="웹 화면 목록 보기"> <span class="fas fa-file"></span></a></li>
    <li class=""><a href="/CMD_SEQ_103456456861583150620923.do" target="_project" title="WAYD 프로젝트 생성하기"> <span class="far fa-plus-square"></span></a></li>
    <li class=""><a href="/CMD_SEQ_104757947291319959645242.do?gubun=1" title="게시판"> <span class="fas fa-table"></span></a></li>
    <li class=""><a href="/CMD_SEQ_107594046521381410883546.do" title="사용자정보 확인"> <span class="fas fa-user"></span></a></li>
    <li class=""><a href="/CMD_SEQ_106169144651288332119302.do" title="로그아웃"> <span class="fas fa-sign-out-alt"></span></a></li>
<%}else{%>
    <li class=""><a href="javascript:goLogin();" title="로그인"> <span class="text">Log in</span></a></li>
<%}%>
  </ul>
</div>
</div>
<form name="smartFrm" method="post" action="javascript:smartSearch();">
<div id="search" style="display:block">
  <input type="hidden" name="search" value=""></input>
  <input type="hidden" name="CMD" value="CMD_SEQ_105264816741288577553725"></input>	
  <input type="text"  id="keyword" name="keyword" placeholder="Search here..." style="width:200px;" />
  <button type="button" class="tip-left" title="Search" onClick="javascript:smartSearch();"><i class="icon-search icon-white"></i></button>
</div>
</form>
<!--close-top-Header-menu-->



<div id="sidebar">
  <a href="#" class="visible-phone"><i class="icon icon-th-list"></i> Grid Layout</a>
<% if(isLogin){ %>
    <ul>
      <li class="active"><a href="/CMD_SEQ_108173637391288444301255.do"><i class="icon icon-home"></i> <span>Domain</span></a> 
        <ul>
          <li><a href="/CMD_SEQ_108173637391288444301255.do">Domain List</a></li>
          <li><a href="/CMD_SEQ_107365064121289636666401.do">Register Domain</a></li>
          <li><a href="/CMD_SEQ_102622610251288248433847.do">Filter List</a></li>
          <li><a href="/CMD_SEQ_106855886431288257600525.do">Register Filter</a></li>
        </ul>
      </li>
      <li> <a href="/CMD_SEQ_107171455261304663724702.do"><i class="icon icon-signal"></i> <span>Inception</span></a>
        <ul>
          <li><a href="/CMD_SEQ_107171455261304663724702.do">Write Scenario</a></li>
        </ul>
      </li>
      <li> <a href="/CMD_SEQ_104378450531288765663303.do"><i class="icon icon-inbox"></i> <span>Elaboration</span></a>
        <ul>
          <li><a href="/CMD_SEQ_104378450531288765663303.do">UI List</a></li>
          <li><a href="/CMD_SEQ_103558081791305006657614.do">Register UI</a></li>
          <li><a href="/CMD_SEQ_105856396481288658408572.do">Layout List</a></li>
          <li><a href="/CMD_SEQ_103530981101559962079937.do">Datasource List</a></li>
        </ul>
      </li>
      <li><a href="/CMD_SEQ_108164918711286971872119.do"><i class="icon icon-th"></i> <span>Construction</span></a>
        <ul>
          <li><a href="/CMD_SEQ_108164918711286971872119.do">WebAction List</a></li>
          <li><a href="/CMD_SEQ_106123592361287269752055.do">Register WebAction</a></li>
          <li><a href="/CMD_SEQ_103615773161287821449749.do">Service List</a></li>
          <li><a href="/CMD_SEQ_107211261401287822755707.do">Register Service</a></li>
          <li><a href="/CMD_SEQ_107239804791288227326088.do">Role List</a></li>
          <li><a href="/CMD_SEQ_108710360611288228206258.do">Register Role</a></li>
          <li><a href="/CMD_SEQ_106557688651298705108710.do">Assign Role</a></li>
          <li><a href="/CMD_SEQ_108037707931289267322444.do">Explore database</a></li>
          <li><a href="/CMD_SEQ_103935205231230567381328.do">Execute sql</a></li>
          <li><a href="/CMD_SEQ_105269752731345259248970.do">Cache List</a></li>
          <li><a href="/CMD_SEQ_109567308931345345981920.do">Thread Batch List</a></li>
          <li><a href="/CMD_SEQ_103213425031360588235009.do">Rule List</a></li>
          <li><a href="/CMD_SEQ_101666004731562248869595.do">Execute shell</a></li>
          <li><a href="/CMD_SEQ_107581931011562108379033.do">Explore file</a></li>
          <li><a href="/CMD_SEQ_106594560501498179923551.do">Edit source</a></li>
          <li><a href="/CMD_SEQ_104740062431578035448248.do">View log</a></li>
        </ul>
      </li>
      <li><a href="/CMD_SEQ_100333381081289029921460.do"><i class="icon icon-fullscreen"></i> <span>Transition</span></a>
        <ul>
         <!-- 
          <li><a href="form-wizard.html">Test Scenario List</a></li>
          <li><a href="form-wizard.html">Test Data List</a></li>
          <li><a href="form-wizard.html">Execute Test Scenario</a></li>
          <li><a href="form-wizard.html">View Test Result</a></li>
          --> 
          <li><a href="/CMD_SEQ_100333381081289029921460.do">CR List</a></li>
          <li><a href="/CMD_SEQ_107335537401289969322212.do">Register CR</a></li>
          <li><a href="/CMD_SEQ_101304559451289996453898.do">Register Server Group</a></li>
          <li><a href="/CMD_SEQ_103105634661289983608812.do">Register Server</a></li>
        </ul>
      </li>
      <li class="submenu"> <a href="/CMD_SEQ_106577512821577858709543.do"><i class="icon icon-th-list"></i> <span>Maintain</span></a>
        <ul>
          <li><a href="/CMD_SEQ_106577512821577858709543.do">Backup</a></li>
          <li><a href="/CMD_SEQ_107594046521381410883546.do">Profile</a></li>
          <li><a href="/download/wayd-monitoring-tools.zip">Download Monitoring Tools</a></li>
         <!--
          <li><a href="form-wizard.html">User List</a></li>
          <li><a href="form-wizard.html">Register User</a></li>
          <li><a href="form-wizard.html">View Error Log</a></li>
          <li><a href="form-wizard.html">View Log</a></li>
          <li><a href="form-wizard.html">Tail Log</a></li>
         -->
        </ul>
      </li>
    </ul>
<%}%>
</div>
		
<style>
.iframeTab {display: block;   border-width:5px; border-color:red; border-style:solid; height: 85vh;   width: 98vw; }
</style>

<script>
function fnDeleteTab(node){
    $('#li-'+ node ).remove();
    $('#tabs-'+ node ).remove();
    $('#frame-'+ node ).remove();
    var tabs = $("#main_tab").tabs();
    tabs.tabs( "refresh" );
}

function fnDeleteAccordion(node){
  $('#accordion-'+ node ).remove();
  $('#accordion-iframe-'+ node ).remove();
}


function fnAddTab() {
 var no = _key() ;
 var tabs = $("#main_tab").tabs();
 var ul = tabs.find("ul");
  
 $("<li id='" + "li-" + no + "' ><a href='#tabs-" + no + "'><i class='fas fa-file-code fa-lg' style='margin:4px;' ></i>" + "<b style='margin-left:5px;'>Click here : Tab No." + no + "</b></a> &nbsp;&nbsp;<a href='javascript:fnDeleteTab(&quot;"+no+"&quot;)' class='fr' style='margin-right:20px;margin-top:4px;'><span id='sp-"+no+"'></span><i class='fas fa-trash-alt fa-lg'></i></a><input type='text' style='width:50%;margin-left:5px;' placeholder='input memos....' /></li>").appendTo(ul);
 $("<div id='" + "tabs-" + no + "'></div>" ).appendTo(tabs);
 $("<iframe id='" + "frame-" + no + "' src='/Anaconda.do?CMD=CMD_SEQ_108164918711286971872119' class='iframeTab' frameborder='0' ></iframe>").appendTo('#tabs-'+no);
 tabs.tabs("refresh");
}

function fnAddAccordion() {
   var no = _key() ;
   var accordion = $("#main_accordion");
   var iframe = "<iframe id='" + "frame-" + no + "' src='/Anaconda.do?CMD=CMD_SEQ_108164918711286971872119' class='iframeTab resizable-content' frameborder='0' ></iframe>";
   var deleteAccordian = "<a href='javascript:fnDeleteAccordion(&quot;"+no+"&quot;)' class='fr' style='margin-right:20px;margin-top:4px;'><span id='sp-"+no+"'></span><i class='fas fa-trash-alt fa-lg'></i></a>";
   $("<h3 id='" + "accordion-" + no + "' >화면:"+no+deleteAccordian+"</h3><div id='" + "accordion-iframe-" + no + "'>"+iframe +"</div>").appendTo(accordion);
}

function toggleNavBar(){
   $("#NavBar").toggle();
   $("#search").toggle();
}

$( function() {
    $( "#main_accordion" ).accordion();
  } );

</script>
 <div>
	<!-- alert 팝업 -->
		<div id="alert_popup" class="sp_popup s600 alert_popup" style="display:none;" draggable="true">
			<div class="sp_pop_header"><div class="layer_title"></div></div>
			<div class="sp_pop_container">
				<div class="txt_dialog pop_message" style="width:600px;min-height:200px;height:200px;margin-top:20px; overflow: auto"></div>
				<p class="foot_btn">
					<a href="#" class="btn_n bg_red modal_alert_confirm">OK</a>
				</p>
			</div>
			<a href="#" class="sp_popup_close modal_alert_close">Close</a>
		</div>

		<!-- confirm 팝업 -->
		<div id="confirm_popup"  class="sp_popup s400 confirm_popup" style="display:none;" draggable="true">
			<div class="sp_pop_header"><div class="layer_title"></div></div>
			<div class="sp_pop_container">
				<div class="txt_dialog pop_message" style="min-height:200px;height:200px;margin-top:20px; overflow: auto"></div>
				<p class="foot_btn">
					<a href="#" class="btn_n bg_red modal_alert_confirm">OK</a>
					<a href="#" class="btn_n bg_gray modal_alert_close">Cancel</a>
				</p>
			</div>
			<a href="#" class="sp_popup_close modal_alert_close">Close</a>
		</div>

		<!-- 상태 진행중 팝업 -->
		<div id="progress_popup"  class="sp_popup s400 status_progress_popup" style="display:none;" draggable="true">
			<div class="sp_pop_header"><div class="layer_title"></div></div>
			<div class="sp_pop_container">
				<div class="txt_dialog">
					<div class="ajax_loader"><div id="circularG_1" class="circularG"></div><div id="circularG_2" class="circularG"></div><div id="circularG_3" class="circularG"></div><div id="circularG_4" class="circularG"></div><div id="circularG_5" class="circularG"></div><div id="circularG_6" class="circularG"></div><div id="circularG_7" class="circularG"></div><div id="circularG_8" class="circularG"></div></div>
					<p class="txt_dialog3 pop_message" style="min-height:200px;height:200px;margin-top:20px; overflow: auto"></p>
				</div>
			</div>
			<a href="#" class="sp_popup_close modal_progress_close">Close</a>
		</div>
    </div>



<div id="content">
  <div id="content-header">
   
    <div id="breadcrumb">
      <a href="javascript:toggleNavBar()"><i class="icon-home"></i> Menu</a>
      <% if(!"CMD_SEQ_106594560501498179923551".equals(request.getParameter("CMD")) || request.getRequestURL().indexOf("CMD_SEQ_106594560501498179923551") < 0 ){ %>
      <button  type="button" style="" class="btn navbar-btn btn-primary" name="btn_more_tab" id="btn_more_tab" >+(Tab)</button>
      <% }%>
    </div>

 <% if(!"CMD_SEQ_106594560501498179923551".equals(request.getParameter("CMD")) || request.getRequestURL().indexOf("CMD_SEQ_106594560501498179923551") < 0 ){ %>

   <div id="tab_div" class="row" style="display:none;margin-left:2px;z-index:9999;">
       <div id="main_accordion" style=" width: 99%; z-index:9999;">
       </div>

       <div id="main_tab" style=" width: 99%; z-index:9999;">
         <ul id="tab_head" style=" z-index:9999;">
         </ul>
      </div>
    </div>

  <% }%>
  
<!--    <h1>Grid Layout (Full width)</h1> --> 
    </div>
      <div class="container">
        <% if(!strBody.equals("")) { %><jsp:include page="<%=strBody%>" flush="true" /><%}%>
      </div>
    </div>
<div class="row-fluid">
   <div id="footer" class="span12"> 2020 &copy; bestmember.net. Trinity 3.0 & Social Project Platform</a> </div>
</div>

</div>


<script type="text/javascript">
  // This function is called from the pop-up menus to transfer to
  // a different page. Ignore if the value returned is a null string:
  function goPage (newURL) {
      // if url is empty, skip the menu dividers and reset the menu selection to default
      if (newURL != "") {
          // if url is "-", it is this page -- reset the menu:
          if (newURL == "-" ) {
              resetMenu();            
          } 
          // else, send page to designated URL            
          else {  
            document.location.href = newURL;
          }
      }
  }

// resets the menu selection upon entry to this page:
function resetMenu() {
   document.gomenu.selector.selectedIndex = 2;
}
</script>
<script>
<% if(!"CMD_SEQ_106594560501498179923551".equals(request.getParameter("CMD")) || request.getRequestURL().indexOf("CMD_SEQ_106594560501498179923551") < 0 ){ %>

(function(){

  $('#btn_more_tab').click(function(){
    $('#tab_div').show();
    fnAddAccordion();
  });

  $('#main_tab').tabs(); 

})();

<% }%>
</script>

  </body>
</html>
