<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>

<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page contentType="text/html; charset=utf8" pageEncoding="utf8" %>

<link class="include" rel="stylesheet" type="text/css" href="/jsp/SDLC/js/chart/jquery.jqplot.min.css" />

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
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_100937963281288324762498"; 	
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
<form name="smartFrm" method="post" action="javascript:smartSearch();">
<input type="hidden" name="CMD" value="CMD_SEQ_105264816741288577553725"></input>		
<div class="header-wrap">
		<div id="top">
                         <div id="icons" style="width:100%"> 
                          <div class="container">
                             <div class="row">
                              <div class="col-lg-2">
                              <h5><span style="font-size:34px;color:white;">TRINITY</span></h5>
                              </div>
                              <div class="col-lg-2">
                              <div class="form-group">
                                <input type="search" class="form-control" id="search" name="search" placeholder="Input keyword" onfocus="javascript:fnSelectSearch();">
                              </div>
                              </div>
                              <div class="col-lg-2">
                               <button type="button" class="btn btn-warning" onClick="javascript:smartSearch();">
                                  Search
                               </button>
                               <button type="button" class="btn btn-secondary" onClick="javascript:searchCurrentPage();">
                                  Search Me !!
                               </button>
                              </div>

                              <div class="col-lg-6">
						<% if(!isLogin){ %>
						<a href="javascript:goLogin();"  style="color:yellow" >Log in</a>
						<a href="/Anaconda.do?CMD=CMD_SEQ_101617954751381273902468"  style="color:white" >Sign up</a>
						<span class="header-menu">|</span>
						<%}else{%>
                                                <a href="/Anaconda.do?CMD=CMD_SEQ_108173637391288444301255" style="color:yellow" >Xtreme List</a>
                                                <span class="header-menu">|</span>
                                                <a href="/Anaconda.do?CMD=CMD_SEQ_108164918711286971872119" style="color:yellow" >WAC List</a>
                                                <span class="header-menu">|</span>
                                                <a href="/Anaconda.do?CMD=CMD_SEQ_103456456861583150620923" style="color:yellow" >WAYD generator</a>
                                                <span class="header-menu">|</span>
						<a href="/Anaconda.do?CMD=CMD_SEQ_104757947291319959645242&gubun=1" style="color:white" >Project Board</a>
                                                <span class="header-menu">|</span>
						<a href="/Anaconda.do?CMD=CMD_SEQ_106169144651288332119302"  style="color:white" >Logout</a>
                                                <span class="header-menu">|</span>
						<a href="/Anaconda.do?CMD=CMD_SEQ_107594046521381410883546"  style="color:white" >Modify</a>
                                                <span class="header-menu">|</span>
						<a href="javascript:goSecession();"  style="color:white" >Leave</a>
<%}%>
                              </div>
                              
                           </div>  
                         </div>

                      </div>

		</div>

		<%
					String menu = "WDEV";
					Cookie cookies[] = request.getCookies();
		            if(cookies != null) {
						  for(Cookie cookie : cookies) {
								  if("HMENU".equals(cookie.getName())){
										menu = cookie.getValue();
										break;
								  }
						  }
				  }
				  String include = "/jsp/Neo/top-wdev.jsp";
				  if("PMS".equals(menu)){
					  include = "/jsp/Neo/top-wdev.jsp"; // "/jsp/Neo/top-pms.jsp";
				  }else if("WDEV".equals(menu)){
					  include = "/jsp/Neo/top-wdev.jsp";
				  }else if("WIKI".equals(menu)){
					  include = "/jsp/Neo/top-wiki.jsp";
				  }else if("MYPAGE".equals(menu)){
					  include = "/jsp/Neo/top-mypage.jsp";
				  }else{
					  include = "/jsp/Neo/top-wdev.jsp";
				  }
%>
		<!-- end of the Top part -->

<div>
<%
if(isLogin){
%>
<jsp:include page="<%=include%>" flush="false" />
<%}%>
</div>

</div>


</form>

<!--
<script language="javascript">
/*
var cookie  = getCookie("search-word");
if(cookie != null && cookie != "undefined" && cookie != '')
{
	var obj = document.getElementById("search");
	obj.value =cookie;
}
cookie = getCookie("HMENU");
var m = document.getElementById(cookie);

if(m != null && m != "undefined" && m != '')
{
	m.style.color = '#FFFF00';
}
*/
</script>
-->


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
 $("<iframe id='" + "frame-" + no + "' src='/' class='iframeTab' frameborder='0' ></iframe>").appendTo('#tabs-'+no);
 tabs.tabs("refresh");
}

</script>
  <button type="button" style="margin-top:10px;" class="btn navbar-btn btn-info second-button" name="btn_more_tab" id="btn_more_tab" >+(Tab)</button>

   <div id="tab_div" class="row" style="display:none;margin-left:2px;z-index:9999;">
       <div id="main_tab" style=" width: 99%; z-index:9999;">
         <ul id="tab_head" style=" z-index:9999;">
         </ul>
      </div>
    </div>
