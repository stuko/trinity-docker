<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<script language="javascript">
function searchSmartContents()
{
	with(smartFrm)
	{
		if(search.value == '')
		{
			alert("검색어를 입력해 주세요");
			return;
		}
		AnacondaSubmit(document.smartFrm);
	}
}
</script>
	<!-- start ads -->
			<h1><img src="/jsp/anaconda/img/search_result.png" width="20" height="20" border="0" align="absmiddle"></img>&nbsp;&nbsp;스마트 검색</h1>
			<form name="smartFrm" method="post" action="/Anaconda.do">
			<input type="hidden" name="CMD" value="CMD_SEQ_105264816741288577553725" />
			<div>
				<input type="text" name="search" class="styled" /> <input type="button" value="검색" class="button white" onClick="javascript:searchSmartContents();" />
			</div>
			</form>
			
			<h1><img src="/jsp/anaconda/img/user.png" width="20" height="20" border="0" align="absmiddle"></img>&nbsp;&nbsp;사용자 정보</h1>
			<ul>
			
			<%
			if(session.getAttribute(InitClass.getSESSION_DOMAIN()) == null){
			%>
				<li><a href="/Anaconda.do?CMD=CMD_SEQ_100937963281288324762498">로그인</a></li>
			<%}else{%>
				<li><a href="/Anaconda.do?CMD=CMD_SEQ_106169144651288332119302">로그아웃</a></li>
			<%} %>
			</ul>


			<h1><img src="/jsp/anaconda/img/config.png" width="20" height="20" border="0" align="absmiddle"></img>&nbsp;&nbsp;설정</h1>
			<ul>
				<li><a href="/Anaconda.do?CMD=CMD_SEQ_100956963071288316656736">최대 동시 사용자 수 설정</a></li>
				<li><a href="/Anaconda.do?CMD=CMD_SEQ_100956963071288316656736">사용자 큐 설정</a></li>
				<li><a href="/Anaconda.do?CMD=CMD_SEQ_100956963071288316656736">로그 디렉토리 설정</a></li>
				<li><a href="/Anaconda.do?CMD=CMD_SEQ_100956963071288316656736">백업 디렉토리 설정</a></li>
			</ul>

			<h1><img src="/jsp/anaconda/img/matrix.png" width="20" height="20" border="0" align="absmiddle"></img>&nbsp;&nbsp;액션 매트릭스</h1>
			<ul>
				<li><a href="/Anaconda.do?CMD=CMD_SEQ_101383688701288585627625">액션 &amp; 서비스 매트릭스</a></li>
				<li><a href="/Anaconda.do?CMD=CMD_SEQ_101226596321288594030291">액션 &amp; 화면 매트릭스</a></li>
			</ul>

			<h1><img src="/jsp/anaconda/img/matrix.png" width="20" height="20" border="0" align="absmiddle"></img>&nbsp;&nbsp;서비스 매트릭스</h1>
			<ul>
				<li><a href="/Anaconda.do?CMD=CMD_SEQ_100956963071288316656736">서비스 &amp; 액션 매트릭스</a></li>
				<li><a href="/Anaconda.do?CMD=CMD_SEQ_100956963071288316656736">서비스 &amp; 화면 매트릭스</a></li>
			</ul>

			<h1><img src="/jsp/anaconda/img/matrix.png" width="20" height="20" border="0" align="absmiddle"></img>&nbsp;&nbsp;화면 매트릭스</h1>
			<ul>
				<li><a href="/Anaconda.do?CMD=CMD_SEQ_100956963071288316656736">화면 &amp; 액션 매트릭스</a></li>
				<li><a href="/Anaconda.do?CMD=CMD_SEQ_100956963071288316656736">화면 &amp; 서비스 매크릭스</a></li>
			</ul>
	<!-- end ads -->
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>

	
	