<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page import="com.stuko.anaconda.Auth.*"%>
 <%
  String strBody = request.getAttribute(BlankField.VIEW_BODY) == null ? "" : (String)request.getAttribute(BlankField.VIEW_BODY);
  String strFooter = request.getAttribute(BlankField.VIEW_FOOTER) == null ? "" : (String)request.getAttribute(BlankField.VIEW_FOOTER); 
  String strLeft = request.getAttribute(BlankField.VIEW_LEFT) == null ? "" : (String)request.getAttribute(BlankField.VIEW_LEFT); 
  String strRight = request.getAttribute(BlankField.VIEW_RIGHT) == null ? "" : (String)request.getAttribute(BlankField.VIEW_RIGHT); 
  String strTop = request.getAttribute(BlankField.VIEW_TOP) == null ? "" : (String)request.getAttribute(BlankField.VIEW_TOP); 

Object sessionObject = request.getAttribute(InitClass.getSessionValue());
Object account = session.getAttribute("Account");
String jndi = (String)session.getAttribute("jndi");

int intPoint = 0;
if(sessionObject != null){
   BusinessRecord record = (BusinessRecord)sessionObject;
   String point = record.getFieldValue("Point");
   if(point != null){
      intPoint = Integer.parseInt(point);
   }
}

String chatbot_level = "0";
if(account == null) chatbot_level = "-1";


String clientId = "";
String secretKey = "";
Object ocid = session.getAttribute("clientId");
Object osk = session.getAttribute("secretKey");
clientId = ocid == null ? "" : (String)ocid;
secretKey = osk == null ? "" : (String)osk;

String sIp = InitClass.getInstance().getData("ENGINE_IP");
String sPort = InitClass.getInstance().getData("ENGINE_PORT");
String sProtocol = InitClass.getInstance().getData("ENGINE_PROTOCOL");
String wsocket = InitClass.getInstance().getData("WEBSOCKET"); 
String iIp = getLocalIpAddress(); // InetAddress.getLocalHost().getHostAddress();
String iPort = "8081";
String iProtocol = "http";
String ip = BusinessHelper.checkBusinessNull(sIp) ? sIp : iIp;
String port = BusinessHelper.checkBusinessNull(sPort) ? sPort : iPort;
String protocol = BusinessHelper.checkBusinessNull(sProtocol) ? sProtocol : iProtocol ;


 %>
<%!
public String getLocalIpAddress() {
      try {
            for (Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces(); en.hasMoreElements();) {
                  NetworkInterface intf = en.nextElement();
                  for (Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses(); enumIpAddr.hasMoreElements();) {
                        InetAddress inetAddress = enumIpAddr.nextElement();
                        if (!inetAddress.isLoopbackAddress() && inetAddress instanceof Inet4Address) {
                              return inetAddress.getHostAddress();
                        }
                  }
            }
      } catch (SocketException ex) {
            ex.printStackTrace();
      }
      return null;
}

%>

<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="">
    <meta name="author" content="">
    <title>DUNA - Social Project Platform</title>

  <!-- Bootstrap core CSS -->
  <link href="/bt/agency/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <!--link href="/bt/agency/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"-->
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

  <script src="https://d3js.org/d3.v5.min.js"></script>

  <!-- Bootstrap core JavaScript -->
  <script src="/bt/jquery-ui/1.12.4/jquery.js"></script>
  <script src="/bt/agency/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/bt/js/plugins/toastr/toastr.min.js"></script>

  <script src="/bt/chart/2.9.3/Chart.min.js"></script>
  <script src="/bt/chart/2.9.3/Chart.bundle.min.js"></script>
  <link href="/bt/chart/2.9.3/Chart.min.css" rel="stylesheet">


  <script language="javascript" src="/jsp/anaconda/js/default.js"></script>
  <script src="/jsp/API/js/process.js"></script>

  <!-- Custom styles for this template -->
  <link href="/bt/agency/css/agency.css" rel="stylesheet">
  <link rel="stylesheet" href="/bt/css/plugins/toastr/toastr.min.css">
  <link rel="stylesheet" href="/jsp/API/css/my.css">

  <link rel="stylesheet" href="/bt/jquery-ui/1.12.1/jquery-ui.css" />
  <link rel="stylesheet" href="/bt/jquery-ui/1.12.1/jquery-ui.structure.css" />
  <link rel="stylesheet" href="/bt/jquery-ui/1.12.1/jquery-ui.theme.css" /> 
  <script src="/bt/jquery-ui/1.12.1/jquery-ui.js"></script> 
  <link href="https://rawgit.com/summerstyle/jsonTreeViewer/master/libs/jsonTree/jsonTree.css" rel="stylesheet" />
  <script src="https://rawgit.com/summerstyle/jsonTreeViewer/master/libs/jsonTree/jsonTree.js"></script>

<!--
  <script src="/Anaconda.do?CMD=CMD_SEQ_109054734271581239520046&wsocket=<%=wsocket %>"></script> 
  <link rel="stylesheet" href="/Anaconda.do?CMD=CMD_SEQ_108592214221581241906306">
--> 
<SCRIPT LANGUAGE="JAVASCRIPT" SRC="/Anaconda.do?CMD=CMD_SEQ_100697583901583557897409"></SCRIPT>
<link href="/Anaconda.do?CMD=CMD_SEQ_107379266481583583370476" rel="stylesheet" type="text/css">

   <link rel="stylesheet" href="/bt/css/toggle.css">
   <script src="/bt/js/toggle.js"></script> 

<style type="text/css"> 

.styled {
    display: block;
    width: 100%;
    // height: calc(1.5em + 0.75rem + 2px);
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

a {
  color : #4D4D00;
}
/* The side navigation menu */
.sidenav {
  height: 100%; /* 100% Full-height */
  width: 0; /* 0 width - change this with JavaScript */
  position: fixed; /* Stay in place */
  z-index: 1; /* Stay on top */
  top: 0; /* Stay at the top */
  left: 0;
  background-color: #0d47a1; /* Black*/
  overflow-x: hidden; /* Disable horizontal scroll */
  overflow-y: auto;
  padding-top: 60px; /* Place content 60px from the top */
  transition: 0.5s; /* 0.5 second transition effect to slide in the sidenav */
  margin : 2px 2px 20px 2px;
}

/* The navigation menu links */
.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #FFFFFF;
  display: block;
  transition: 0.3s;
   
}

/* When you mouse over the navigation links, change their color */
.sidenav a:hover {
  color: #f1f1f1;
}

/* Position and style the close button (top right corner) */
.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
  margin-bottom: 20px;
}

/* Style page content - use this if you want to push the page content to the right when you open the side navigation */
#main {
  transition: margin-left .5s;
  padding: 20px;
}

/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}


.navbar {
 background : #4285F4; 
}
.navbar-header{
  width:100%;
  padding:7px 50px 0px 50px;
}

.second-button{
    float:right;
    margin-left:5px; 
    margin-top:1px; 
    background : #FFFFFF; 
    color : #4285F4; 
}
.search{
  float:right;
  padding: 6px;
  border: none;
  margin-top: 1px;
  margin-right: 16px;
  font-size: 17px;
  width:300px
}

.rule_chart{
   background:white;
   top: 10px;
   left: 600px;
   width: 200px;
   height:100px;
   overflow-y: scroll;
   z-index:1000;
}



</style>
<script language="javascript">

function search(){
    var s = $("#keyword").val();
    if(s != ''){
        frmSearch.submit(); 
    }
}

/* Set the width of the side navigation to 250px and the left margin of the page content to 250px */
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}

var open = 'F';
function toggleNav(){
    if(open == 'F') openNav();
    else closeNav();
}

function logout(){
   if(confirm('Do you want to sign out?')){
      location.href='/Anaconda.do?CMD=CMD_SEQ_100466023431495768917557';
   }
}
function join(){
   location.href='/Anaconda.do?CMD=CMD_SEQ_102067498911560650122990 ';
}
function login(){
   location.href='/Anaconda.do?CMD=CMD_SEQ_104939425241510705844856';
}
function forgot(){
   location.href='/Anaconda.do?CMD=CMD_SEQ_109021818091560661076653';
}
function modify(){
   location.href='/Anaconda.do?CMD=CMD_SEQ_105943068391560662902167';
}
function oauth(){
   location.href='/Anaconda.do?CMD=CMD_SEQ_104852409371584337907993';
}

function goHome(){
   document.location.href="/";
}
function goMain(){
   document.location.href='/Anaconda.do?CMD=CMD_SEQ_108656259781500692360523';
}
function getMainUrl(){
  return '/Anaconda.do?CMD=CMD_SEQ_108656259781500692360523';
}
var AUTO_COMPLETE = new Array();
$(document).ready(function() {

<% if(account != null) {%>
    // checkEngineStatus();
<% } %>
 
});
 var stopCheckEngineStatus = true;
 function pauseCheckEngineStatus(){
  stopCheckEngineStatus = true; 
 }
 function startCheckEngineStatus(){
   if(stopCheckEngineStatus){
     stopCheckEngineStatus = false;
     checkEngineStatus();
   }
 }
 function checkEngineStatus(){
   var p = {
            msgType : "DUNA.SAAS"
          , clientId : "<%=clientId%>"
          , secretKey : "<%=secretKey%>"
          , channelId : "<%=clientId%>"
          , message : 'hi'
          , ServiceName:'chat'
          , Level : 'normal'
          , MY_THOUGHT : 'hi'
          , dfp : getCookie("DFP")
         };

   $("#CHECK").show();
   $("#ERR").hide();
   $("#OK").hide();

   // var u = '<%=protocol%>://www.bestmember.net:<%=port%>/rest?msgType=DUNA.SAAS&clientId=<%=clientId%>&secretKey=<%=secretKey%>&channelId=<%=clientId%>&message=hi&ServiceName=chat&Level=normal&MYTHOUGHT=hi&dfp='+getCookie("DFP");
   var u = 'http://49.247.7.108:8081/rest?msgType=DUNA.SAAS&clientId=<%=clientId%>&secretKey=<%=secretKey%>&channelId=<%=clientId%>&message=hi&ServiceName=chat&Level=normal&MYTHOUGHT=hi&dfp='+getCookie("DFP");
   var d = { url : u };
   json(d,"CMD_SEQ_105244110741571009616624",(data)=>{
           console.log(data.refreshRule);
           if(data && data != null && data.refreshRule.contents && data.refreshRule.contents){
             console.log(data.refreshRule.contents);
             $("#CHECK").hide();
             $("#ERR").hide();
             $("#OK").show();
           }else{
             alertPopup('경고','챗봇을 아직 생성하지 않으셨거나, 생성 요청후, 데이터베이스 생성이 지연되는 경우(최대 1시간) 엔진이 정상적으로 작동하지 않을 수 있습니다.');
             $("#CHECK").hide();
             $("#OK").hide();
             $("#ERR").show();
           }
           if(!stopCheckEngineStatus) setTimeout(checkEngineStatus, 300000);
   },(error)=>{
           $("#CHECK").hide();
           $("#OK").hide();
           $("#ERR").show();
           if(!stopCheckEngineStatus) setTimeout(checkEngineStatus, 3000);
   }) ;

/*
   $.ajax({
       type : 'POST',
       url : '<%=protocol%>://<%=ip%>:<%=port%>/rest',
       dataType : 'json',
       data : p,
       success : function(data) {
           $("#CHECK").hide();
           $("#ERR").hide();
           $("#OK").show();
           if(!stopCheckEngineStatus) setTimeout(checkEngineStatus, 3000);
       },
       error : function(data) {
           $("#CHECK").hide();
           $("#OK").hide();
           $("#ERR").show();
           if(!stopCheckEngineStatus) setTimeout(checkEngineStatus, 3000);
       }
  });
*/


 }

function goProjectManagement(){
  document.location.href="/Anaconda.do?CMD=CMD_SEQ_109503436111588560842324";
}
function goProfileManagement(){
  setCookie('profile');
  document.location.href="/Anaconda.do?CMD=CMD_SEQ_109415681411495891918789&rule_group=PROFILE";
}
function goRuleResult(){
  document.location.href="/Anaconda.do?CMD=CMD_SEQ_107801818351512345921351";
}
function goDbms(){
  document.location.href="/Anaconda.do?CMD=CMD_SEQ_108638750761641366440776";
}


function showAPI(){
  simple_post({},'CMD_SEQ_105949173791662611419125',(data)=>{
    alertPopup('소셜프로젝트 API 목록','<div style="width:1600px;text-align: left;overflow-x: scroll;"><pre>' + data + '</pre></div>');
  }, (error)=>{
    alertPopup('경고','에러가 발생 하였습니다.' + error);
  });
}

</script>

</head>

<body id="page-top" style="overflow-x:scroll;">



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

function fnAddTab() {
 var no = _key() ;
 var tabs = $("#main_tab").tabs();
 var ul = tabs.find("ul");
  
 $("<li id='" + "li-" + no + "' ><a href='#tabs-" + no + "'><i class='fas fa-file-code fa-lg' style='margin:4px;' ></i>" + "<b style='margin-left:5px;'>Click here : Tab No." + no + "</b></a> &nbsp;&nbsp;<a href='javascript:fnDeleteTab(&quot;"+no+"&quot;)' class='fr' style='margin-right:20px;margin-top:4px;'><span id='sp-"+no+"'></span><i class='fas fa-trash-alt fa-lg'></i></a><input type='text' style='width:50%;margin-left:5px;' placeholder='input memos....' /></li>").appendTo(ul);
 $("<div id='" + "tabs-" + no + "'></div>" ).appendTo(tabs);
 $("<iframe id='" + "frame-" + no + "' src='/Anaconda.do?CMD=CMD_SEQ_105943068391560662902167' class='iframeTab' frameborder='0' ></iframe>").appendTo('#tabs-'+no);
 tabs.tabs("refresh");
}

</script>



    <!-- Navigation -->
<form id="frmSearch" name="frmSearch" action="/Anaconda.do" method="POST">
  <input type="hidden" name="CMD" value="CMD_SEQ_104554534451565764984839">
            
     <div class="navbar navbar-top">
        <div class="navbar-header" width="100%">
          <div id="openMenu">
            <H2 style="color:#ffffff">
            <% if(account != null) {%>
            <a id="h_menu" href="javascript:toggleNav()" title="전체 메뉴 보기">
            <img src="/img/h_menu.png" width="40px" />
            </a>
            <% } %>


            <!--<span style="color:#fed136">DUNA<sup style="color:white;font-size:13px;">free</sup></span>-->
            <span style="color:#fed136"><a href="/Anaconda.do"><img src="/jsp/sp/img/duna_logo_3.jpg"  style="width:200px" title="메인화면 이동"></a></span>
             <% if(account != null) {%>

                <% if(BusinessHelper.checkNull(jndi)) {%>

               <span id="CHECK" class="badge badge-warning" style="margin-left:30px;display:none">Check Engine...</span>
               <span id="OK" class="badge badge-primary" style="margin-left:30px;display:none">Engine Status OK</span>
               <span id="ERR" class="badge badge-danger" style="margin-left:30px;display:none">Engine Status Err</span>

              <button type="button" style="margin-top:10px;" class="btn navbar-btn btn-info second-button"
                name="btnLogout" onClick="javascript:logout();" title="로그아웃"><i class="fas fa-sign-out-alt"></i></button>
              <button type="button" style="margin-top:10px;" class="btn navbar-btn btn-info second-button"
                name="btnModify" onClick="javascript:modify();" title="사용자정보 확인"><i class="fas fa-pen-square"></i></button>
<!--              <button type="button" style="margin-top:10px;" class="btn navbar-btn btn-info second-button"
                name="btnModify" onClick="document.location.href='/CMD_SEQ_103947739801607988778909.do';" title="계획 관리"><i class="fas fa-project-diagram"></i></button> -->

             <!-- <button type="button" style="margin-top:10px;" class="btn navbar-btn btn-info second-button"
                name="btnModify" onClick="javascript:oauth();" title="OAuth 정보 관리"><i class="fas fa-lock"></i></button> -->
<!--
              <button type="button" style="margin-top:10px;" class="btn navbar-btn btn-info second-button"
                name="btnProjectList" onClick="javascript:goProjectManagement();" title="프로젝트 관리하기"><i class="fas fa-project-diagram"></i></button>
-->

               <button type="button" style="margin-top:10px;" class="btn navbar-btn btn-info second-button"
                name="btnProjectList" onClick="javascript:showAPI();" title="소셜프로젝트 API"><i class="fas fa-project-diagram"></i></button>

               <button type="button" style="margin-top:10px;" class="btn navbar-btn btn-info second-button"
                name="btnLogout" onClick="document.location.href='/CMD_SEQ_101030486361661815870271.do';" title="차트보기"><i class="fa fa-chart-line"></i></button>

               <button type="button" style="margin-top:10px;" class="btn navbar-btn btn-info second-button"
                name="btnLogout" onClick="javascript:callRefreshes()" title="대화엔진 리프레시하기"><i class="fas fa-redo"></i></button>

               <button type="button" style="margin-top:10px;" class="btn navbar-btn btn-info second-button"
                name="btnLogout" onClick="javascript:document.location.href='/Anaconda.do?CMD=CMD_SEQ_108015592941580175502168'" title="대화 의도 관리"><i class="fas fa-cubes"></i></button>

               <button type="button" style="margin-top:10px;" class="btn navbar-btn btn-info second-button"
                name="btnProfile" onClick="javascript:goProfileManagement();" title="룰 변수 관리"><i class="fab fa-app-store-ios"></i></button>

               <button type="button" style="margin-top:10px;" class="btn navbar-btn btn-info second-button"
                name="btnRuleResult" onClick="javascript:goRuleResult();" title="룰 실행결과보기"><i class="fas fa-list"></i></button>

               <button type="button" style="margin-top:10px;" class="btn navbar-btn btn-info second-button"
                name="btnRuleResult" onClick="javascript:goDbms();" title="DBMS관리하기"><i class="fas fa-database"></i></button>

               <button type="button" style="margin-top:10px;" class="btn navbar-btn btn-info second-button"
                name="btn_share" id="btn_share" title="대화 시나리오 공개하기"><i class="fas fa-share"></i></button>

               <button type="button" style="margin-top:10px;" class="btn navbar-btn btn-info second-button"
                name="btn_function" id="btn_function" title="함수"><i class="fas fa-function"></i></button>

              <button type="button" style="margin-top:10px;" class="btn navbar-btn btn-info second-button"
                name="btn_acma" id="btn_acma" title="자동매매등록">$</button>

              <select id="selRuleGroup2"  style="margin-top:10px;width:150px;" class="btn navbar-btn btn-info second-button"  name="selRuleGroup2" onChange="javascript:selectRuleGroup(this,'CMD_SEQ_104130164211495979227973','STORE');">
             	<option value="">Completion Rule</option>
              </select>
              
    	      <select id="selRuleGroup1_header"  style="margin-top:10px;width:150px;" class="btn navbar-btn btn-info second-button" name="selRuleGroup1_header" onChange="javascript:selectRuleGroup(this,'CMD_SEQ_109170810941496452670436','MSG');">
          	   <option value="">Execution Rule</option>
   	      </select>

               <button type="button" style="margin-top:10px;" class="btn second-button"
                name="btn_more_tab" id="btn_more_tab" title="작업화면 추가로 열기">+(Tab)</button>
               <% } %>


             <% } else {%>
              <button type="button" style="margin-top:10px;" class="btn navbar-btn btn-info second-button"
                name="btnJoin" onClick="javascript:join();" title="가입하기"><i class="fas fa-door-open"></i></button>
              <button type="button" style="margin-top:10px;" class="btn navbar-btn btn-info second-button"
                name="btnLogin" onClick="javascript:login();" title="로그인"><i class="fas fa-sign-in-alt"></i></button>
           
            <% } %>

            <% if(account != null) {%>
              <% if(BusinessHelper.checkNull(jndi)) {%>
             <!-- <i id="searchicon" style="float:right;margin-right:50px;margin-top:12px;" class="fas fa-search text-white"  aria-hidden="true" onClick="javascript:search();"></i> -->
              <input id="keyword" style="margin-top:10px;" name="keyword" class="search form-control" type="text" placeholder="검색..">  
              <% } %>
            <% } %>
             
            </H2>
        </div>
      </div>
     </div>
 </form>

     <div id="tab_div" class="row" style="display:none;margin-left:2px;z-index:9999;">
       <div id="main_tab" style=" width: 99%; z-index:9999;">
         <ul id="tab_head" style=" z-index:9999;">
         </ul>
      </div>
    </div>

<script>
(function(){

  $('#btn_share').click(function(){
    window.location = '/Anaconda.do?CMD=CMD_SEQ_108723096481594591078090&kind=MSG';
  });

  $('#btn_more_tab').click(function(){
    $('#tab_div').show();
    fnAddTab();
  });

  $('#btn_function').click(function(){
    window.location = '/Anaconda.do?CMD=CMD_SEQ_107602770161500535873315&kind=MSG';
  });

  $('#btn_acma').click(function(){
    window.location = '/Anaconda.do?CMD=CMD_SEQ_102780578221667267400578';
  });



  $('#main_tab').tabs(); 

})();
</script>




<script>
$("#searchicon")
.mouseenter(()=>{
 })
.mouseleave(()=>{
 });
</script>
 <% if(account != null) {%>
<button type="button" id="floatChatContainerBtn" class="btn btn-success" style="z-index:1000;position: absolute; right: 0px; top: 95px;margin-right:10px;display:none;">통계정보 열기</button>
<div id="floatChatContainer" style="z-index:10; position: absolute; right: 0px; top: 135px;margin-right:10px;border-width:thin ;border-style: dashed;border-color: #6495ED;padding:2px 2px 2px 2px;display:none; ">
  <div style="background:#6495ED;padding:2px 2px 2px 2px;">
  <h6 style="color:white;text-align:center;padding-top:2px;">시스템 통계</h6>
  </div>
  <div id="chartWeekCountContainer" style="width:200px;">
    <canvas id="weekCount" class="rule_chart"></canvas>
  </div>
  <div id="chartNormalCountContainer" style="width:200px;">
    <canvas id="normalCount" class="rule_chart"></canvas>
  </div>
  <div style="margin-top:10px;margin-bottom:10px;background:#6495ED;padding:2px 2px 2px 2px;">
  <h6 style="color:white;text-align:center;padding-top:2px;">사용자 기능</h6>
  </div>
  <div id="div-toggle-check-engine" style="width:200px;">
    <span style="margin-left:30px;">
    <label class="checkbox-inline">
      <input id="toggle-check-engine" type="checkbox" checked data-toggle="toggle"> 엔진상태확인 
    </label>
    </span>
  </div>
  
</div>

<script>
  $(function() {
    /* 
    $('#toggle-check-engine').bootstrapToggle('on')
    $('#toggle-check-engine').change(function() {
      // console.log($(this).prop('checked'));
      if(!$(this).prop('checked')){
         console.log("check engine status will be stopped"); 
         pauseCheckEngineStatus();
      }else{
         console.log("check engine status will be started");
         startCheckEngineStatus();
      }
    });
     */
    $('#floatChatContainerBtn').click(function() {
      $("#floatChatContainer").toggle();
      var $this = $(this);
      if($this.text() == '통계정보 닫기'){
           // sessionStorage.setItem('floatChatContainerOpen' , 'open');
           $this.text('통계정보 열기');         
      } else {
           // sessionStorage.setItem('floatChatContainerOpen' , 'close');
           $this.text('통계정보 닫기');
      }
    });
    
  });
</script>
 <% } %>

    <div style="color:#000000;min-height:800px; padding-top:20px;width:95%;margin-left:40px;justify-content:center;align-items:center;overflow-x:auto;">

	<% 
	 if(!strBody.equals("")) { %><jsp:include page="<%=strBody%>" flush="true" /><%
	 }%>
        <!-- /.container-fluid -->

   


    </div>
    
 <footer class="footer">
    <div class="container">
      <div class="row align-items-center">
          <span class="copyright">
           All right reserved bestmember , since 2017
          </span>
     </div>
    </div>
 </footer>

<!-- /.content-wrapper -->

    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fa fa-chevron-up"></i>
    </a>


    <!-- Bootstrap core JavaScript -->
    <!--<script src="/jsp/sp/vendor/jquery/jquery.min.js"></script>-->
    <script src="/jsp/sp/vendor/tether/tether.min.js"></script>
    <script src="/jsp/sp/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="/jsp/sp/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/jsp/sp/vendor/chart.js/Chart.min.js"></script>
    <script src="/jsp/sp/vendor/datatables/jquery.dataTables.js"></script>
    <script src="/jsp/sp/vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- JQuery Plugin JavaScript -->
<script language="javascript" src="/jsp/sp/cookie/jquery.cookie.js"></script>

<script language="javascript">
<% if(BusinessHelper.checkNull(jndi)) {%>

function showFunctionList(){
  
  if(AUTO_COMPLETE && AUTO_COMPLETE.length){
      var strCtnt = '';
      AUTO_COMPLETE.forEach(e=>{
          strCtnt += '<li style="text-align:left;">' + e+ '</li>';
      });
      alertPopup('함수 목록','<div><ol>' + strCtnt + '</ol></div>');
  }
}



 var c = {CMD : 'CMD_SEQ_104395067821579656639933' };
 $.ajax({
  url:"/Anaconda.json",
  type:"POST",
  headers: { 
	"Accept" : "application/json; charset=utf-8" , "charset" : "utf-8"
  },
  data:c,
  dataType:"json",
  success: function (data) {
             if(data.functionList &&  data.functionList.length){
                  data.functionList.forEach(e=>{
                     AUTO_COMPLETE.push(e.function_name);
                  });
                  // alert(AUTO_COMPLETE[0]); 
                 $("input[type=text]").autocomplete({
                	source: AUTO_COMPLETE
                 });
                 $("textarea").autocomplete({
                	source: AUTO_COMPLETE
                 });

             }
           }
  });

var d = {CMD:'CMD_SEQ_107168925301579586889149'};
$.ajax({
  url:"/Anaconda.json",
  type:"POST",
  headers: { 
	"Accept" : "application/json; charset=utf-8" , "charset" : "utf-8"
  },
  data:d,
  dataType:"json",
  success: function (data) {
             drawChart('weekCount','line','7일간의 대화 실행 건수',data.weekCount);
             drawChart('normalCount','bar','7일간의 대화 실행 결과',data.normalCount);
           }
});
function drawChart(id, t, title, dataSet){
   if(dataSet && dataSet.length){
        var l = new Array();
        var d = new Array();
        var i = 7;
        dataSet.forEach(e => {
                  l.push((i--) + '일전');
                  d.push(e.COUNT);
        });
         var ctx = createChart(id,t,title, l,d);
  }
}


// CMD_SEQ_109246742041499839614850
var d = {CMD:'CMD_SEQ_109246742041499839614850', kind:'MSG'}
$.ajax({
		  url:"/Anaconda.json",
		  type:"POST",
		  headers: { 
			"Accept" : "application/json; charset=utf-8" , "charset" : "utf-8"
		  },
		  data:d,
		  dataType:"json",
		  success: function (data) {
                      if(data.RuleContextGroupList){
			for (i = 0; i < data.RuleContextGroupList.length; i++)
			{ 
				 $('#selRuleGroup1').append($('<option>',
				 {
					value: data.RuleContextGroupList[i].rule_group,
					text : data.RuleContextGroupList[i].context_name
				}));
                                $('#selRuleGroup1_header').append($('<option>',
				 {
					value: data.RuleContextGroupList[i].rule_group,
					text : data.RuleContextGroupList[i].context_name
				}));
			}
                      }
		  }
		});

d = {CMD:'CMD_SEQ_109246742041499839614850', kind:'STORE'}
$.ajax({
		  url:"/Anaconda.json",
		  type:"POST",
		  headers: { 
			"Accept" : "application/json; charset=utf-8" , "charset" : "utf-8"
		  },
		  data:d,
		  dataType:"json",
		  success: function (data) {
            // alert(data.RuleContextGroupList[0].context_name);
                     if(data.RuleContextGroupList){
			for (i = 0; i < data.RuleContextGroupList.length; i++)
			{ 
				 $('#selRuleGroup2').append($('<option>',
				 {
					value: data.RuleContextGroupList[i].rule_group,
					text : data.RuleContextGroupList[i].context_name
				}));
			}
                     }
		  }
		});
d = {CMD:'CMD_SEQ_109246742041499839614850', kind:'ALARM'}
$.ajax({
		  url:"/Anaconda.json",
		  type:"POST",
		  headers: { 
			"Accept" : "application/json; charset=utf-8" , "charset" : "utf-8"
		  },
		  data:d,
		  dataType:"json",
		  success: function (data) {
            //alert(data.RuleContextGroupList[0].context_name);
                     if(data.RuleContextGroupList){ 
			for (i = 0; i < data.RuleContextGroupList.length; i++)
			{ 
				 $('#selRuleGroup3').append($('<option>',
				 {
					value: data.RuleContextGroupList[i].rule_group,
					text : data.RuleContextGroupList[i].context_name
				}));
			}
                     }
		  }
		});
d = {CMD:'CMD_SEQ_109246742041499839614850', kind:'SCHEDULE'}
$.ajax({
		  url:"/Anaconda.json",
		  type:"POST",
		  headers: { 
			"Accept" : "application/json; charset=utf-8" , "charset" : "utf-8"
		  },
		  data:d,
		  dataType:"json",
		  success: function (data) {
            //alert(data.RuleContextGroupList[0].context_name);
                    if(data.RuleContextGroupList){
			for (i = 0; i < data.RuleContextGroupList.length; i++)
			{ 
				 $('#selRuleGroup4').append($('<option>',
				 {
					value: data.RuleContextGroupList[i].rule_group,
					text : data.RuleContextGroupList[i].context_name
				}));
			}
                     }
		  }
		});

d = {CMD:'CMD_SEQ_109246742041499839614850', kind:'DECIDE'}
$.ajax({
		  url:"/Anaconda.json",
		  type:"POST",
		  headers: { 
			"Accept" : "application/json; charset=utf-8" , "charset" : "utf-8"
		  },
		  data:d,
		  dataType:"json",
		  success: function (data) {
            //alert(data.RuleContextGroupList[0].context_name);
                    if(data.RuleContextGroupList){
			for (i = 0; i < data.RuleContextGroupList.length; i++)
			{ 
				 $('#selRuleGroup5').append($('<option>',
				 {
					value: data.RuleContextGroupList[i].rule_group,
					text : data.RuleContextGroupList[i].context_name
				}));
			}
                     }
		  }
		});
 <% } %>
</script>

	<script language="javascript">
	function setCookie(n){
		var menu = $.cookie('menu');
		if(menu != undefined) {
			$('#' + menu).removeClass('active');
		}
		$.cookie('menu',n);
	}

	var menu = $.cookie('menu');
    if(menu == undefined) {
		$('#rule').addClass('active');        
    }else{

		$('#' + menu).addClass('active');
	}

	function ruleListHandler(){
		var object;
		var doRun;
	}

	ruleListHandler.prototype.doRun = function(action,REQ){
	}

	function goRuleContext(sel,cmd){
		with(frmRuleGroup){
		   location.href = '/Anaconda.do?CMD='+cmd+'&kind=' + sel.options[sel.selectedIndex].value;
		}
	}


	function selectRuleGroup(sel,cmd,kind){

		with(frmRuleGroup){
				location.href = '/Anaconda.do?CMD='+cmd+'&rule_group=' + sel.options[sel.selectedIndex].value+'&kind='+kind+'&pattern_group=' + sel.options[sel.selectedIndex].value+'&page=0';
		}
	}
	<% String k = request.getParameter("rule_group"); %>

function callRefreshes(){
   confirmPopup('룰(Rule) 적용하기','현재 저장된 룰(Rule)을 적용할까요? 적용중에 오류가 발생하면 새로운 룰(Rule)은 적용되지 않습니다.',()=>{
        callRefresh('<%=protocol%>://49.247.7.108:<%=port%>/rest?container=DunaRuleContainer&ruleRefresh=true&clientId=<%=clientId%>&secretKey=<%=secretKey%>&channelId=<%=clientId%>');
        callRefresh('<%=protocol%>://49.247.7.108:<%=port%>/rest?container=StoreContainer&ruleRefresh=true&clientId=<%=clientId%>&secretKey=<%=secretKey%>&channelId=<%=clientId%>');
        callRefresh('<%=protocol%>://49.247.4.98:<%=port%>/rest?container=DunaRuleContainer&ruleRefresh=true&clientId=<%=clientId%>&secretKey=<%=secretKey%>&channelId=<%=clientId%>');
        callRefresh('<%=protocol%>://49.247.4.98:<%=port%>/rest?container=StoreContainer&ruleRefresh=true&clientId=<%=clientId%>&secretKey=<%=secretKey%>&channelId=<%=clientId%>');

        // callRefresh('<%=protocol%>://www.bestmember.net:<%=port%>/rest?container=DunaRuleContainer&ruleRefresh=true&clientId=<%=clientId%>&secretKey=<%=secretKey%>&channelId=<%=clientId%>');
        // callRefresh('<%=protocol%>://www.bestmember.net:<%=port%>/rest?container=StoreContainer&ruleRefresh=true&clientId=<%=clientId%>&secretKey=<%=secretKey%>&channelId=<%=clientId%>');
        // callRefresh('<%=protocol%>://db.bestmember.net:<%=port%>/rest?container=DunaRuleContainer&ruleRefresh=true&clientId=<%=clientId%>&secretKey=<%=secretKey%>&channelId=<%=clientId%>');
   });

}

function callRefresh(u){
     var d = { url : u };
     json(d,"CMD_SEQ_105244110741571009616624",(data)=>{
        showPopup("success","Rule will be applied successfully ["+u+"]",null);
     },(error)=>{
        showPopup("error","Sorry Rule does not be applied",null);
     }) ;
}

	</script>





<div id="mySidenav" class="sidenav" style="z-index:99999;" >
    
	 <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>


	<form name="frmRuleGroup" id="frmRuleGroup" method="POST">
<%
    if(sessionObject == null || account == null) out.println("No Session");
    else{

%>

<a href="javascript:closeNav()" ><h5 class="subheading" style="color:#fed136">&nbsp;DUNA</h5></a>


<div>
<a href="javascript:logout();"><h6 class="subheading"><i class="fas fa-sign-out-alt"></i>&nbsp; Log out</h6></a>


<% if(BusinessHelper.checkNull(jndi)) {%>

<!--a href="/Anaconda.do?CMD=CMD_SEQ_102510211121574893072709" style="color:#fed136"><h6 class="subheading"><i class="fa fa-link" aria-hidden="true"></i>
&nbsp; DB 연결 관리</h6></a-->
<a href="/Anaconda.do?CMD=CMD_SEQ_106210427031563835316590"><h6 class="subheading"><i class="fab fa-facebook-messenger"></i>&nbsp; External SNS</h6></a>

<a href="/Anaconda.do?CMD=CMD_SEQ_102510211121574893072709"><h6 class="subheading"><i class="fas fa-database"></i>
&nbsp; DB</h6></a>
<a href="javascript:callRefreshes()"><h6 class="subheading"><i class="fas fa-redo"></i>&nbsp; Apply Rule</h6></a>
<a href="/Anaconda.do?CMD=CMD_SEQ_103619595881577970340128"><h6 class="subheading"><i class="fas fa-check"></i>&nbsp; API Test</h6></a>
<a href="/Anaconda.do?CMD=CMD_SEQ_107801818351512345921351"><h6 class="subheading"><i class="fas fa-list"></i>&nbsp; Rule Execution Log</h6></a>

<a href="/Anaconda.do?CMD=CMD_SEQ_105719724701613100433509"><h6 class="subheading"><i class="fas fa-code"></i>&nbsp; Input Variables</h6></a>
<a href="/Anaconda.do?CMD=CMD_SEQ_107579190741681444380818"><h6 class="subheading"><i class="fas fa-code"></i>&nbsp; Input Variables Condition</h6></a>

<a href="/Anaconda.do?CMD=CMD_SEQ_109667441101630710406063"><h6 class="subheading"><i class="fas fa-code"></i>&nbsp; Output Variables</h6></a>
<a href="/Anaconda.do?CMD=CMD_SEQ_102104835221657238583456"><h6 class="subheading"><i class="fas fa-code"></i>&nbsp; Candidated Variables</h6></a>

<a onClick="javascript:setCookie('profile')" href="/Anaconda.do?CMD=CMD_SEQ_109415681411495891918789&rule_group=PROFILE"><h6 class="subheading"><i class="fab fa-app-store-ios"></i>&nbsp; Variables</h6></a>

<a href="/Anaconda.do?CMD=CMD_SEQ_100233531401630717255270"><h6 class="subheading"><i class="fas fa-code"></i>&nbsp; Message Template</h6></a>
<a href="/Anaconda.do?CMD=CMD_SEQ_104852409371584337907993"><h6 class="subheading"><i class="fas fa-key"></i>&nbsp; OAuth Key </h6></a>

<a href="/Anaconda.do?CMD=CMD_SEQ_103212887641698705275219"><h6 class="subheading"><i class="fas fa-code"></i>&nbsp; Rule Hit List</h6></a>

<a href="/Anaconda.do?CMD=CMD_SEQ_109353073071566694693040"><h6 class="subheading"><i class="fas fa-code"></i>&nbsp; Container Script</h6></a>
<% if(intPoint > 5000) {%>
<a href="/Anaconda.do?CMD=CMD_SEQ_106634915891574809092406"><h6 class="subheading"><i class="fas fa-function"></i>&nbsp; Common Function</h6></a>
<%}%>
<a href="/Anaconda.do?CMD=CMD_SEQ_107602770161500535873315"><h6 class="subheading"><i class="fas fa-function"></i>&nbsp; Function</h6></a>

<a href="/Anaconda.do?CMD=CMD_SEQ_108015592941580175502168"><h6 class="subheading"><i class="fas fa-cubes"></i>&nbsp; Intent Group</h6></a>
<a href="/Anaconda.do?CMD=CMD_SEQ_109750458441581635633586"><h6 class="subheading"><i class="fas fa-images"></i>&nbsp; Contents</h6></a>

<a href="/Anaconda.do?CMD=CMD_SEQ_102001143681499832653385&kind=MSG"><h6 class="subheading"><i class="fas fa-layer-group"></i>&nbsp; Intent</h6></a>

<a href="/Anaconda.do?CMD=CMD_SEQ_107179571921613946874863&kind=MSG"><h6 class="subheading"><i class="fas fa-layer-group"></i>&nbsp; Multi Rule</h6></a>

<a href="/Anaconda.do?CMD=CMD_SEQ_102780578221667267400578"><h6 class="subheading"><i class="fas fa-layer-group"></i>&nbsp; ACMA</h6></a>
<a href="/Anaconda.do?CMD=CMD_SEQ_107599226821678865995284"><h6 class="subheading"><i class="fas fa-layer-group"></i>&nbsp; ACMA's Recommended Factors</h6></a>

<a href="/Anaconda.do?CMD=CMD_SEQ_109015309331665531689767&code=list"><h6 class="subheading"><i class="far fa-calendar-alt"></i>&nbsp; Social Project</h6></a>
<a href="/Anaconda.do?CMD=CMD_SEQ_103947739801607988778909&kind=MSG"><h6 class="subheading"><i class="far fa-calendar-alt"></i>&nbsp; Plan</h6></a>
<a href="/Anaconda.do?CMD=CMD_SEQ_103021811521618034457272&kind=MSG"><h6 class="subheading"><i class="far fa-calendar-alt"></i>&nbsp; Imperfect Rule</h6></a>

<a href="/Anaconda.do?CMD=CMD_SEQ_108707152261658099555132"><h6 class="subheading"><i class="far fa-calendar-alt"></i>&nbsp; TrainerBot</h6></a>
<a href="/Anaconda.do?CMD=CMD_SEQ_103199489551627725500476"><h6 class="subheading"><i class="far fa-calendar-alt"></i>&nbsp; Quiz Type 1</h6></a>
<a href="/Anaconda.do?CMD=CMD_SEQ_102845955711497757688090"><h6 class="subheading"><i class="far fa-calendar-alt"></i>&nbsp; Quiz Type 2</h6></a>

<a href="/Anaconda.do?CMD=CMD_SEQ_108723096481594591078090&kind=MSG"><h6 class="subheading"><i class="fas fa-share"></i>&nbsp; Public Rule</h6></a>
<a href="/Anaconda.do?CMD=CMD_SEQ_108638750761641366440776&kind=MSG"><h6 class="subheading"><i class="fas fa-database"></i>&nbsp;DBMS SQL</h6></a>
<a href="/Anaconda.do?CMD=CMD_SEQ_109386074031581898012096&code=list"><h6 class="subheading"><i class="fas fa-won-sign"></i>&nbsp; Product<sup>BETA</sup></h6></a>
<!--
<a href="/Anaconda.do?CMD=CMD_SEQ_104533676171581894345412&code=list"><h6 class="subheading"><i class="fas fa-layer-group"></i>&nbsp; Product Portfolio<sup>BETA</sup></h6></a>
<a href="/Anaconda.do?CMD=CMD_SEQ_103736959391582064326654&code=list"><h6 class="subheading"><i class="fas fa-hands-helping"></i>&nbsp; Product Service<sup>BETA</sup></h6></a>
<a href="/Anaconda.do?CMD=CMD_SEQ_105366569981582151932063&code=list"><h6 class="subheading"><i class="fas fa-shopping-cart"></i>&nbsp; Consumer Pattern<sup>BETA</sup></h6></a>
-->
<a href="#"><h6 class="subheading"><i class="fas fa-code-branch"></i>&nbsp;Rule</h6></a>
  <div style="margin-left:30px;margin-right:10px;">
    <select class="form-control select-small" name="selRuleGroup5" onChange="javascript:goRuleContext(this,'CMD_SEQ_102001143681499832653385');">
	<option value="">Select</option>
	<option value="MSG">Execution Rule</option>
	<option value="STORE">Completion Rule</option>
   </select>
  </div>


<a href="#"><h6 class="subheading"><i class="fas fa-code-branch"></i>&nbsp;Execution Rule</h6></a>
  <div style="margin-left:30px;margin-right:10px;">
    <input type="hidden" name="CMD"  value= "CMD_SEQ_105165994181496448671483">
	<select id="selRuleGroup1"  class="form-control select-small" name="selRuleGroup1" onChange="javascript:selectRuleGroup(this,'CMD_SEQ_109170810941496452670436','MSG');">
      	   <option value="">Select</option>
	</select>
   </div>

<a  href="#"><h6 class="subheading"><i class="fas fa-comments"></i>&nbsp;Completion Rule</h6></a>

<% } %>


<br><br>

     </form>
   </div>
<%}%>

<% if(!BusinessHelper.checkNull(jndi)) {%>
<a href="javascript:modify();"><h6 class="subheading">정보수정 화면에서 채봇을 생성해 주시기 바랍니다</h5></a>
<%}%>

  <!-- Plugin JavaScript -->
  <script src="/bt/agency/vendor/jquery-easing/jquery.easing.min.js"></script>


 

<script>
<% if(BusinessHelper.checkNull(jndi)) {%>
$( document ).ready(function() {
  if($.cookie('level') === null || $.cookie('level') === "" 
    || $.cookie('level') === "null" || $.cookie('level') === undefined){
      checkLevel();
   }

$("#keyword").keyup(function(e){
     if(e.keyCode == 13){
        search(); 
     }
});

});

function checkLevel(){
  post(d,"CMD_SEQ_106583022411565737100780",(json)=>{
     if(json && json.level && json.level[0]){
        var lv = json.level[0].level;
       if(lv == '4') getSaying();
       else checkChatBotDB();
     }
  },()=>{
      showPopup("fail","Sorry. An unknown problem has occurred. Please try again later.",null);
  });
}

function getSaying(){
   post(d,"CMD_SEQ_106909353201565736871814",(json)=>{
     if(json && json.advice && json.advice[0]){
        var saying = json.advice[0].saying;
        var teller = json.advice[0].teller;
        alertPopup('We always support Super Rookie ^^', saying + '<br>' + teller, null);    
        $.cookie('level', 'Y', { expires: 1 });
     }
   },()=>{
      showPopup("fail","Sorry. An unknown problem has occurred. Please try again later.",null);
   });
}


function checkChatBotDB(){

      var d = {}; 
      post(d, 'CMD_SEQ_104245259411561074009146' , (json)=>{
       if(json.checkChatBotSaaSDB && json.checkChatBotSaaSDB.length == 0){
          confirmPopup('Warning','You do not have your own Chatbot D/B Please create your ChatBot D/B', ()=>{
          });
          $('#h_menu').hide();
       }else{
          checkChatBotRule();
       }
      },()=>{
  
      });
}


function checkChatBotRule(){

    if($.cookie('confirm') === null || $.cookie('confirm') === "" 
           || $.cookie('confirm') === "null" || $.cookie('confirm') === undefined)
     {
      //no cookie
       post(d, 'CMD_SEQ_103402640771563147507207' , (json)=>{
       if(json.checkChatBotUseStep){
          if(json.checkChatBotUseStep.length == 1){
              confirmPopup('안내','대단하십니다!!!, DUNA 서비스를 정말 잘 활용하고 계시는 군요. 더 많은 기능들을 활용하시려면 대화규칙을 만들어 보세요.', ()=>{
                  $.cookie('confirm', 'Y', { expires: 1 }); 
              });
          }else{
              confirmPopup('안내','좋습니다!!!. DUNA에게 대화를 가르쳐 보시는 건 어떤가요? 대화의도를 입력해 보세요', ()=>{ 
                $.cookie('confirm', 'Y', { expires: 1 });
              });
          }
       }else{
           
       }
      },()=>{
  
      });

     }
     else
     {
     //have cookie
     }

}



<%}%>
</script>
</body>
</html>
