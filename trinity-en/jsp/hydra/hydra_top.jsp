<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
		
	<div id="header">
		<div id="logo">
			<h1><a href="/Anaconda.do?CMD=CMD_SEQ_108173637391288444301255"><img src="/jsp/hydra/img/dragon.png" width=60 height=60 border=0 align="absmiddle"></img>Hydra  </a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<font style="font-size:12px;font-color:#660099;">
			<%
			if(session.getAttribute(InitClass.getSESSION_DOMAIN()) == null){
			%>
				<a href="/Anaconda.do?CMD=CMD_SEQ_101883437261289891462965" style="text-decoration:underline;font-family:Verdana,sans-serif;color:#660099;">로그인</a> 하시겠습니까?
			<%}else{%>
				<a href="/Anaconda.do?CMD=CMD_SEQ_100888421801289891677246" style="text-decoration:underline;font-family:Verdana,sans-serif;color:#660099;">로그아웃</a> 하시겠습니까?
			<%} %>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="/Anaconda.do?CMD=CMD_SEQ_100956963071288316656736" ><img src="/jsp/anaconda/img/snake.png" width=20 height=20 border=0 align="absmiddle"></img>ANACONDA</a>
			<!-- a href="http://www.bestmember.net/" style="font-family:Verdana,sans-serif;color:#660099;" >&copy;www.bestmember.net</a></font></h1-->
		</div>
		<div id="search">
		</div>
	</div>
	<!-- end #header -->
	<div id="menu">
		<ul>
			<li class="current_page_item"><a href="/Anaconda.do?CMD=CMD_SEQ_100145587241289633968416">소개</a></li>
			<li><a href="/Anaconda.do?CMD=CMD_SEQ_108173637391288444301255">어플리케이션 관리</a></li>
			<li><a href="/Anaconda.do?CMD=CMD_SEQ_100333381081289029921460">변경관리</a></li>
			<li><a href="javascript:go('CMD_SEQ_100983143401289029952979');">테스트 관리</a></li>
			<li><a href="javascript:go('CMD_SEQ_106992440181289030150305');">사용자 관리</a></li>
			<li></li>
		</ul>
	</div>
<script language="javascript">
function go(cmd)
{
	// /Anaconda.do?CMD=CMD_SEQ_106992440181289030150305
	AnacondaRoleCheck(cmd);
}
</script>
<!-- end menu -->
