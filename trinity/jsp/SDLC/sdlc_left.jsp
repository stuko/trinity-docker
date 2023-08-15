<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>

<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 
<h3 style="font-family:arial"><img src="/jsp/SDLC/img/sw.png" width="15px" height="15px" absmiddle>&nbsp;User Info.</h3>
 
<p>
<%
if(session.getAttribute(InitClass.getSESSION_DOMAIN()) == null){
	

	
%>
	<a href="/Anaconda.do?CMD=CMD_SEQ_100937963281288324762498">로그인</a> 하시겠습니까?
<%}else{

	RequestHelper helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
	DefaultAuth auth = (DefaultAuth)helper.getSessionObject();
	String strSessionValue = "";
	if(auth != null)
	{
		strSessionValue = auth.getAuthItem(("MEMBER_NAME"));	
	}
	
    

%>
	<%=strSessionValue %>님 반갑습니다.<br/>
	<a href="/Anaconda.do?CMD=CMD_SEQ_106169144651288332119302">로그아웃</a> 하시겠습니까?
	<br><br>
    <!--a href="javascript:alert('준비중');"><img src="/jsp/anaconda/img/more.png" width="10px" height="10px" absmiddle border="0">&nbsp;마이페이지</a-->
<%} %>
</p>
 <!--p style="color:blue;font-size:12px;">
 프로젝트 관리는 현재 <b style="color:red">"BETA"</b> 버전으로 차기 버전에서 업그레이드 될 예정입니다.
 </p-->
<h3 style="font-family:arial"><img src="/jsp/anaconda/img/link.png" width="15px" height="15px" absmiddle>&nbsp;Hot Link</h3>
 
<div class='featurebox_side'>
<!-- a href="#">Integration</a><br/>
<a href="#">Initiation</a><br/-->
<div style="padding:1px;"><img src="/jsp/SDLC/img/check.png" width="15px" align="absmiddle">&nbsp;<a href="/Anaconda.do?CMD=CMD_SEQ_107365064121289636666401">웹사이트 등록</a></div>
<div style="padding:1px;"><img src="/jsp/SDLC/img/check.png" width="15px" align="absmiddle">&nbsp;<a href="/Anaconda.do?CMD=CMD_SEQ_106123592361287269752055">화면 등록</a></div>
<div style="padding:1px;"><img src="/jsp/SDLC/img/check.png" width="15px" align="absmiddle">&nbsp;<a href="/Anaconda.do?CMD=CMD_SEQ_107211261401287822755707">서비스 등록</a></div>
<div style="padding:1px;"><img src="/jsp/SDLC/img/check.png" width="15px" align="absmiddle">&nbsp;<a href="/Anaconda.do?CMD=CMD_SEQ_105836770501290999075239">테스트 등록</a></div>
<div style="padding:1px;"><img src="/jsp/SDLC/img/check.png" width="15px" align="absmiddle">&nbsp;<a href="/Anaconda.do?CMD=CMD_SEQ_107335537401289969322212">반영 요청서 등록</a></div>
<div style="padding:1px;"><img src="/jsp/SDLC/img/check.png" width="15px" align="absmiddle">&nbsp;<a href="/Anaconda.do?CMD=CMD_SEQ_101787643881289806558558">오류 보기</a></div>
</div>
 
<!--p>
"IT Professional Group"<br/><a href="http://www.bestmember.net/" target="_new">베스트멤버</a> & <a href="http://www.bluewaves.co.kr/" target="_new">블루웨이브</a>
</p-->
 
<!--div class='featurebox_side'>
"기획에서 배포까지"<br/>
Trinity<br/>
Trinity & Anaconda<br/>
</div-->
 

