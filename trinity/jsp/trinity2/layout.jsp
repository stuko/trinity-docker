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
     <title>TRINITY</title><meta charset="UTF-8" />
       <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="/jsp/trinity2/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/jsp/trinity2/css/bootstrap-responsive.min.css" />
        <!--link rel="stylesheet" href="/jsp/trinity2/css/maruti-login.css" /-->
        <link rel="stylesheet" href="/jsp/trinity2/css/fullcalendar.css" />
        <link rel="stylesheet" href="/jsp/trinity2/css/maruti-style.css" />
        <link rel="stylesheet" href="/jsp/trinity2/css/maruti-media.css" class="skin-color" />
        <link href="/bt/admin-v2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link href="/jsp/summernote/summernote-bs4.min.css" rel="stylesheet">
           

<script src="/jsp/trinity2/js/jquery.min.js"></script>  
<script src="/jsp/trinity2/js/excanvas.min.js"></script> 
<script src="/jsp/trinity2/js/jquery.ui.custom.js"></script> 
<script src="/jsp/trinity2/js/bootstrap.min.js"></script> 
<script src="/jsp/trinity2/js/jquery.flot.min.js"></script> 
<script src="/jsp/trinity2/js/jquery.flot.resize.min.js"></script> 
<script src="/jsp/trinity2/js/jquery.peity.min.js"></script> 
<script src="/jsp/trinity2/js/fullcalendar.min.js"></script> 
<script src="/jsp/trinity2/js/maruti.js"></script> 
<script src="/jsp/trinity2/js/maruti.dashboard.js"></script> 
<script src="/jsp/trinity2/js/maruti.chat.js"></script> 

<script src="/jsp/anaconda/js/default.js"></script>
<script src="/jsp/summernote/summernote-bs4.min.js"></script>
<script src="/jsp/summernote/paper-1.14.5.js"></script>
<script src="/jsp/API/js/process.js"></script>
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

<style>
.container{ 
   min-width:100%;} select { font-size: 12px;
   align:center;background:#fff;
   min-height:100%;
   width:100%;
}

</style>

    </head>
    <body>

<!--Header-part-->
<div id="header">
  <h1><a href="/CMD_SEQ_108164918711286971872119.do">Trinity 3.0</a></h1>
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
    <li class=""><a title="Page (Action) List" href="/CMD_SEQ_108164918711286971872119.do"> <span class="text">Page List</span></a></li>
    <li class=""><a title="Site and Domain info List" href="/CMD_SEQ_108173637391288444301255.do"> <span class="text">Site List</span></a></li>
    <li class=""><a title="Create WAYD container for DUNA" href="/CMD_SEQ_103456456861583150620923.do"> <span class="text">Create container</span></a></li>
    <li class=""><a title="Project Board List" href="/CMD_SEQ_104757947291319959645242.do?gubun=1"> <span class="text">Project Board</span></a></li>
    <li class=""><a title="User's profile" href="/CMD_SEQ_107594046521381410883546.do"> <span class="text">My Info.</span></a></li>
    <li class=""><a title="Log out" href="/CMD_SEQ_106169144651288332119302.do"> <span class="text">Log out</span></a></li>
<%}else{%>
    <li class=""><a title="Log out" href="javascript:goLogin();"> <span class="text">Log in</span></a></li>
<%}%>
  </ul>
</div>

<form name="smartFrm" method="post" action="javascript:smartSearch();">
<div id="search">
  <input type="hidden" name="search" value=""></input>
  <input type="hidden" name="CMD" value="CMD_SEQ_105264816741288577553725"></input>	
  <input type="text"  id="keyword" name="keyword" placeholder="Search here..."/>
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
		


		
<div id="content">
  <div id="content-header">
    
    <div id="breadcrumb">
      <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a>
      <a href="#" class="current"><%=currentPath%></a>
    </div>
    

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

  </body>
</html>
