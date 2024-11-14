<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<link class="include" rel="stylesheet" type="text/css" href="/jsp/SDLC/js/chart/jquery.jqplot.min.css" />
<link rel="stylesheet" type="text/css" href="/jsp/SDLC/css/chart/examples/examples.min.css" />
<link type="text/css" rel="stylesheet" href="/jsp/SDLC/css/chart/examples/syntaxhighlighter/styles/shCoreDefault.min.css" />
<link type="text/css" rel="stylesheet" href="/jsp/SDLC/css/chart/examples/syntaxhighlighter/styles/shThemejqPlot.min.css" />

<!------[if lt IE 9]><script language="javascript" type="text/javascript" src="/jsp/SDLC/js/chart/excanvas.js"></script><![endif]------->
<script language="javascript" type="text/javascript" src="/jsp/SDLC/js/chart/excanvas.js"></script>
<script class="include" type="text/javascript" src="/jsp/SDLC/js/chart/jquery.min.js"></script>
<script class="include" type="text/javascript" src="/jsp/SDLC/js/chart/jquery.jqplot.min.js"></script>
<script type="text/javascript" src="/jsp/SDLC/css/chart/syntaxhighlighter/scripts/shCore.min.js"></script>
<script type="text/javascript" src="/jsp/SDLC/css/chart/syntaxhighlighter/scripts/shBrushJScript.min.js"></script>
<script type="text/javascript" src="/jsp/SDLC/css/chart/syntaxhighlighter/scripts/shBrushXml.min.js"></script>
<!-- Additional plugins go here -->

<script class="include" type="text/javascript" src="/jsp/SDLC/js/chart/jquery.jqplot.min.js"></script>
<script class="include" type="text/javascript" src="/jsp/SDLC/js/chart/plugins/jqplot.barRenderer.min.js"></script>
<script class="include" type="text/javascript" src="/jsp/SDLC/js/chart/plugins/jqplot.pieRenderer.min.js"></script>
<script class="include" type="text/javascript" src="/jsp/SDLC/js/chart/plugins/jqplot.categoryAxisRenderer.min.js"></script>
<script class="include" type="text/javascript" src="/jsp/SDLC/js/chart/plugins/jqplot.pointLabels.min.js"></script>
<!-- End additional plugins -->
<script type="text/javascript" src="/jsp/SDLC/js/chart/examples/example.min.js"></script>

<script language="javascript">
function fnSelectSearch()
{
	with(smartFrm)
	{
		search.value = '';
	}
}
</script>
<div id="header">
	<h1><!-- img src="/jsp/SDLC/img/Trinity.png" width="200" height="60" align="absmiddle" border="0"></img -->
  	<form name="smartFrm" method="post" action="/Anaconda.do">
  	<input type="hidden" name="CMD" value="CMD_SEQ_105264816741288577553725"></input>
	<a href="/Anaconda.do?CMD=CMD_SEQ_109905046861335064096955" style="color:blue;font-size:30px;font-family:Arial;">
	<img src="/jsp/SDLC/img/sdlc_logo.png" border="0" width="230" align="absmiddle"></img>	
	</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<font size="3" style="font-family:돋움"></font>&nbsp;&nbsp;<input type="text" value="Search" name="search" size="20" class="styled" style="font-weight:bold;height:35px;font-size:23px;line-height:30px;border-color:blue;color:#9900FF;font-family:Arial;" onfocus="javascript:fnSelectSearch();"/>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="/Anaconda.do?CMD=CMD_SEQ_104757947291319959645242&gubun=1" style="color:#CCCCFF;font-size:15px;font-family:Arial 돋움체;"><b style="color:#FFFFFF;">B</b>oard</a>&nbsp;
	<a href="/Anaconda.do?CMD=CMD_SEQ_103899032741292201705418" style="color:#CCCCFF;font-size:15px;font-family:Arial 돋움체;"><b style="color:#FFFFFF;">M</b>emory</a>
	<!--img src="/jsp/SDLC/img/logo_bluewave.png" align="absmiddle" border="0"-->&nbsp;
	<!--a href="/Anaconda.do?CMD=CMD_SEQ_103899032741292201705418" style="font-size:11px;font-family:돋움체;color:yellow;"><img src="/jsp/SDLC/img/dashboard.png" border="0" align="absmiddle" width="50px" />&nbsp;대시보드</a-->&nbsp;
	<!--a href="/Anaconda.do?CMD=CMD_SEQ_102146802191334489600138" style="font-size:11px;font-family:돋움체;color:yellow;"><img src="/jsp/SDLC/img/question.png" border="0" align="absmiddle" width="50px" />&nbsp;처음 시작 하시는 분 </a-->
<!--	<a href="/Anaconda.do?CMD=CMD_SEQ_103899032741292201705418"><font size="2" style="font-family:돋움;color:white;">홈</font></a>
	<font size="2" style="font-family:돋움;color:white;">|</font>
	<a href="javascript:alert('준비중');"><font size="2" style="font-family:돋움;color:white;">도움말</font></a>&nbsp;&nbsp;-->
	
	<!-- img src="/jsp/SDLC/img/bug.png" border="0" width="30" height="30" align="absmiddle"></img><a href="javascript:fnNull();" onClick="javascript:fnShowBug();"><span class="small-segment-box">Bug Killer</span></a-->
  	</form>
  	
	<div id="bug-input">
		<!-- form name="bugFrm" id="bugFrm" method="post" action="/Anaconda.do">
		<input type="hidden" name="CMD" value="CMD_SEQ_105264816741288577553725"></input>
		<div id="bug-input-style-box">
		<p>
			<h1>버그 정보 입력</h1>
			<div>
				<table>
					<tr>
					<td>Bug Description :</td>
					<td><textarea name="bug_desc" cols="40" rows="4"></textarea></td>
					</tr>
					<tr>
					<td>Bug Solution :</td>
					<td><textarea name="bug_solution" cols="40" rows="4"></textarea></td>
					</tr>
				</table>
			</div>
			<div>
				<input type="button" value="저장" onClick="javascript:fnSaveBug();">
			</div>
		</p>
		</div>
		</form -->
	</div>
	</h1>
 
</div>
 
<div id="navcontainer">
 <ul id="navlist">
<li><a id="integration"  style="font-family:arial" href="#" onmouseover="javascript:showSubMenu1('integration','SubMenu_integration');" onmouseout="javascript:hideSubMenu('SubMenu_integration');">Web Site</a></li>
<!-- li><a id="initiation" href="#" onmouseover="javascript:showSubMenu(this);" onmouseout="javascript:hideSubMenu(this);">Initiation</a></li -->
<li><a id="definition" style="font-family:arial" href="#" onmouseover="javascript:showSubMenu1('definition','SubMenu_requirements');" onmouseout="javascript:hideSubMenu('SubMenu_requirements');">Request</a></li>
<li><a id="design" style="font-family:arial"  href="#" onmouseover="javascript:showSubMenu1('design','SubMenu_design');" onmouseout="javascript:hideSubMenu('SubMenu_design');">Design</a></li>
<li><a id="construction" style="font-family:arial" href="#" onmouseover="javascript:showSubMenu1('construction','SubMenu_construction');" onmouseout="javascript:hideSubMenu('SubMenu_construction');">Development</a></li>
<li><a id="test" style="font-family:arial" href="#" onmouseover="javascript:showSubMenu1('test','SubMenu_test');" onmouseout="javascript:hideSubMenu('SubMenu_test');">Test</a></li>
<li><a id="deploy" style="font-family:arial" href="#" onmouseover="javascript:showSubMenu1('deploy','SubMenu_deploy');" onmouseout="javascript:hideSubMenu('SubMenu_deploy');">Deploy</a></li>
<li><a id="user" style="font-family:arial" href="#" onmouseover="javascript:showSubMenu1('user','SubMenu_user');" onmouseout="javascript:hideSubMenu('SubMenu_user');" >User</a></li>
<li><a id="debug" style="font-family:arial" href="#" onmouseover="javascript:showSubMenu1('debug','SubMenu_debug');" onmouseout="javascript:hideSubMenu('SubMenu_debug');">Log</a></li>
<li><a id="analysis" style="font-family:arial" href="#" onmouseover="javascript:showSubMenu1('analysis','SubMenu_analysis');" onmouseout="javascript:hideSubMenu('SubMenu_analysis');">Tracking</a></li>
<li><a id="help" style="font-family:arial" href="#" onmouseover="javascript:showSubMenu1('help','SubMenu_help');" onmouseout="javascript:hideSubMenu('SubMenu_help');">Help</a></li>
<!--li><a id="post" href="#" onmouseover="javascript:showSubMenu('SubMenu_issue');" onmouseout="javascript:hideSubMenu('SubMenu_issue');">이슈관리</a></li-->
</ul>
</div>
	<div id="SubMenu_integration" style="top:118px ; left:260px; display:none;position:absolute;padding: 8px 16px;background-color:#FFFFFF;border: 1px double #BF95FF;z-index:99; " onmouseover="javascript:mouseOverSubMenu('SubMenu_integration');" onmouseout="javascript:mouseOutSubMenu('SubMenu_integration');">
	<table class="table_menu" cellspacing="0" cellpadding="0">
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_108173637391288444301255" style="font-size:11px;font-family:돋움체;">웹사이트 리스트&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><!--img src="/jsp/SDLC/img/question.png" border="0" align="absmiddle" width="40px" />&nbsp;--><a href="/Anaconda.do?CMD=CMD_SEQ_102146802191334489600138" style="font-size:11px;font-family:돋움체;">웹사이트 관리</a>&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_107365064121289636666401" style="font-size:11px;font-family:돋움체;">웹사이트 등록&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_102622610251288248433847" style="font-size:11px;font-family:돋움체;">웹사이트 필터 리스트&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_106855886431288257600525" style="font-size:11px;font-family:돋움체;">웹사이트 필터 추가&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		
		<!--tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_103899032741292201705418" style="font-size:11px;font-family:돋움체;">대시 보드&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr-->
	</table>
	</div>		
	<div id="SubMenu_requirements" style="top:118px; left:350px; display:none;position:absolute;padding: 8px 16px;background-color:#FFFFFF;border: 1px double #BF95FF;z-index:99;" onmouseover="javascript:mouseOverSubMenu('SubMenu_requirements');" onmouseout="javascript:mouseOutSubMenu('SubMenu_requirements');">
	<table class="table_menu" cellspacing="0" cellpadding="0">
		<!--tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_107171455261304663724702" style="font-size:11px;font-family:돋움체;"><a href="javascript:alert('준비중...');">스토리보드 리스트&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr-->
		<!--tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_108266287551373077388573" style="font-size:11px;font-family:돋움체;">문제 관리&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_106225825171373077400794" style="font-size:11px;font-family:돋움체;">문제해결방안 관리&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_107476007101373078915511" style="font-size:11px;font-family:돋움체;">영향도 분석&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr-->
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_107171455261304663724702" style="font-size:11px;font-family:돋움체;">요구사항명세 & 스토리보드 작성&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<!--tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_104624318231360565082737&code=list" style="font-size:11px;font-family:돋움체;">유즈케이스 작성&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr-->
	</table>
	</div>	
	<div id="SubMenu_design" style="top:118px; left:390px; display:none;position:absolute;padding: 8px 16px;background-color:#FFFFFF;border: 1px double #BF95FF;z-index:99;" onmouseover="javascript:mouseOverSubMenu('SubMenu_design');" onmouseout="javascript:mouseOutSubMenu('SubMenu_design');">
	<table class="table_menu" cellspacing="0" cellpadding="0">
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_104378450531288765663303" style="font-size:11px;font-family:돋움체;">UI 컴포넌트 리스트&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_103558081791305006657614" style="font-size:11px;font-family:돋움체;">UI 컴포넌트 개발&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_105856396481288658408572" style="font-size:11px;font-family:돋움체;">레이아웃 컴포넌트 리스트&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_101383688701288585627625" style="font-size:11px;font-family:돋움체;">화면 vs 서비스 매트릭스&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>

		<!--tr><td>CSS 파일 리스트 (준비중)<a href="/Anaconda.do?CMD=CMD_SEQ_108991873191314539993664" style="font-size:11px;font-family:돋움체;">CSS 파일 리스트&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td>CSS 파일 추가 (준비중)<a href="/Anaconda.do?CMD=CMD_SEQ_108991873191314539993664" style="font-size:11px;font-family:돋움체;">CSS 파일 추가&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr-->
		<!--tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_108991873191314539993664" style="font-size:11px;font-family:돋움체;">분석모델 관리&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr-->
		<!--tr><td><a href="javascript:alert('중비중입니다.');" style="font-size:11px;font-family:돋움체;">설계모델 관리&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr-->
		<!-- tr><td><a href="#" style="font-size:11px;font-family:돋움체;">설계 모델 관리&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr -->
	</table>
	</div>				
	<div id="SubMenu_construction" style="top:118px; left:520px; display:none;position:absolute;padding: 8px 16px;background-color:#FFFFFF;border: 1px double #BF95FF;z-index:99;" onmouseover="javascript:mouseOverSubMenu('SubMenu_construction');" onmouseout="javascript:mouseOutSubMenu('SubMenu_construction');">
	<table class="table_menu" cellspacing="0" cellpadding="0">
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_106594560501498179923551" style="font-size:11px;font-family:돋움체;">화면 개발&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_108164918711286971872119" style="font-size:11px;font-family:돋움체;">화면 리스트&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_106123592361287269752055" style="font-size:11px;font-family:돋움체;">화면 등록&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_103615773161287821449749" style="font-size:11px;font-family:돋움체;">서비스 리스트&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_107211261401287822755707" style="font-size:11px;font-family:돋움체;">서비스 등록&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<!--tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_100600677051287893203559" style="font-size:11px;font-family:돋움체;">화면 관리&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr-->
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_107239804791288227326088" style="font-size:11px;font-family:돋움체;">화면 접근 권한 리스트&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_108710360611288228206258" style="font-size:11px;font-family:돋움체;">화면 접근 권한 추가&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_106557688651298705108710" style="font-size:11px;font-family:돋움체;">화면 접근 권한 할당&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<!--tr><td><hr/></td></tr>
		<!--tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_101226596321288594030291" style="font-size:11px;font-family:돋움체;">화면 & 화면 매트릭스&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_106640442321288597229277" style="font-size:11px;font-family:돋움체;">서비스 & 화면 매트릭스&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr-->
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_108037707931289267322444" style="font-size:11px;font-family:돋움체;">D/B Explorer&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_103935205231230567381328" style="font-size:11px;font-family:돋움체;">SQL Executer&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_105269752731345259248970" style="font-size:11px;font-family:돋움체;">SQL 캐쉬  관리&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_109567308931345345981920" style="font-size:11px;font-family:돋움체;">배치 관리&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_103213425031360588235009" style="font-size:11px;font-family:돋움체;">Anaconda Rule 관리&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_108773320751371349718547" style="font-size:11px;font-family:돋움체;">Anaconda Entity 관리&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		
		<!--tr><td><hr/></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_105766439651350088925183" style="font-size:11px;font-family:돋움체;">Rule 관리&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_103584022891350176076698" style="font-size:11px;font-family:돋움체;">Rule Factor 관리&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr-->
	</table>
	</div>
	<div id="SubMenu_test" style="top:118px; left:600px; display:none;position:absolute;padding: 8px 16px;background-color:#FFFFFF;border: 1px double #BF95FF;z-index:99;" onmouseover="javascript:mouseOverSubMenu('SubMenu_test');" onmouseout="javascript:mouseOutSubMenu('SubMenu_test');">
	<table class="table_menu" cellspacing="0" cellpadding="0">
		<!--tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_100983143401289029952979" style="font-size:11px;font-family:돋움체;">테스트  관리&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr-->
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_105836770501290999075239" style="font-size:11px;font-family:돋움체;">테스트 시나리오 관리&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_105441898731290999091414" style="font-size:11px;font-family:돋움체;">테스트 데이터 관리&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_109616405671292830123563" style="font-size:11px;font-family:돋움체;">테스트 실행 관리&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_107730116601290999098215" style="font-size:11px;font-family:돋움체;">테스트 리포트 관리&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
	</table>
	</div>	
	<div id="SubMenu_deploy" style="top:118px; left:680px; display:none;position:absolute;padding: 8px 16px;background-color:#FFFFFF;border: 1px double #BF95FF;z-index:99;" onmouseover="javascript:mouseOverSubMenu('SubMenu_deploy');" onmouseout="javascript:mouseOutSubMenu('SubMenu_deploy');">
	<table class="table_menu" cellspacing="0" cellpadding="0">
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_100333381081289029921460" style="font-size:11px;font-family:돋움체;">배포 리스트&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_103105634661289983608812" style="font-size:11px;font-family:돋움체;">서버 리스트&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_101304559451289996453898" style="font-size:11px;font-family:돋움체;">배포 그룹 관리&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_107335537401289969322212" style="font-size:11px;font-family:돋움체;">반영 요청서 등록&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
	</table>
	</div>		
	<div id="SubMenu_user" style="top:118px; left:750px; display:none;position:absolute;padding: 8px 16px;background-color:#FFFFFF;border: 1px double #BF95FF;z-index:99;" onmouseover="javascript:mouseOverSubMenu('SubMenu_user');" onmouseout="javascript:mouseOutSubMenu('SubMenu_user');">
	<table class="table_menu" cellspacing="0" cellpadding="0">
		<!-- tr><td><a href="#" style="font-size:11px;font-family:돋움체;">프로젝트 후기&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr -->
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_106992440181289030150305" style="font-size:11px;font-family:돋움체;">사용자 리스트&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_100302139341289866742976" style="font-size:11px;font-family:돋움체;">사용자 등록&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<!--tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_105010315761332038107557" style="font-size:11px;font-family:돋움체;">팀 리스트&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_101716048121332039130676" style="font-size:11px;font-family:돋움체;">팀 등록&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_105936135081332062289413" style="font-size:11px;font-family:돋움체;">역할 리스트&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_108093945961332061537354" style="font-size:11px;font-family:돋움체;">역할 등록&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_104651175361332065328722" style="font-size:11px;font-family:돋움체;">프로젝트 리스트&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_105884107961332066065383" style="font-size:11px;font-family:돋움체;">프로젝트 등록&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr-->
		<!--tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_104757947291319959645242&gubun=1" style="font-size:11px;font-family:돋움체;">프로젝트 게시판&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr-->
	</table>
	</div>
	<div id="SubMenu_debug" style="top:118px; left:850px; display:none;position:absolute;padding: 8px 16px;background-color:#FFFFFF;border: 1px double #BF95FF;z-index:99;" onmouseover="javascript:mouseOverSubMenu('SubMenu_debug');" onmouseout="javascript:mouseOutSubMenu('SubMenu_debug');">
	<table class="table_menu" cellspacing="0" cellpadding="0">
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_101787643881289806558558" style="font-size:11px;font-family:돋움체;">오류보기&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_105921919581303528883523" style="font-size:11px;font-family:돋움체;">로그보기&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_100859473711361075217648" style="font-size:11px;font-family:돋움체;">백업 및 원복&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
	</table>
	</div>
	<div id="SubMenu_analysis" style="top:118px; left:850px; display:none;position:absolute;padding: 8px 16px;background-color:#FFFFFF;border: 1px double #BF95FF;z-index:99;" onmouseover="javascript:mouseOverSubMenu('SubMenu_analysis');" onmouseout="javascript:mouseOutSubMenu('SubMenu_analysis');">
	<table class="table_menu" cellspacing="0" cellpadding="0">
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_101028711941332595665858" style="font-size:11px;font-family:돋움체;">태그 리스트&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_104396011971332595681993" style="font-size:11px;font-family:돋움체;">태그 등록&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_108051816571332631235045" style="font-size:11px;font-family:돋움체;">화면 태깅 리스트&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_107386529521332633574618" style="font-size:11px;font-family:돋움체;">화면 태깅 달기&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_107291362561332680678476" style="font-size:11px;font-family:돋움체;">로그 분석&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_102001223141355919656757" style="font-size:11px;font-family:돋움체;">화면 랭킹&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_101774301931332685570129" style="font-size:11px;font-family:돋움체;">차이 분석-Page View&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_103857358931332858590201" style="font-size:11px;font-family:돋움체;">차이 분석-Unique Visitor&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
		<tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_105386351881332858600505" style="font-size:11px;font-family:돋움체;">Tagging 분석&nbsp;&nbsp;&nbsp;&nbsp;</a></td></tr>
	</table>
	</div>
	<div id="SubMenu_help" style="top:118px; left:850px; display:none;position:absolute;padding: 8px 16px;background-color:#FFFFFF;border: 1px double #BF95FF;z-index:99;" onmouseover="javascript:mouseOverSubMenu('SubMenu_help');" onmouseout="javascript:mouseOutSubMenu('SubMenu_help');">
	<table class="table_menu" cellspacing="0" cellpadding="0">
		<tr><td><img src="/jsp/SDLC/img/dashboard.png" border="0" align="absmiddle" width="40px" />&nbsp;<a href="/Anaconda.do?CMD=CMD_SEQ_109905046861335064096955" style="font-size:11px;font-family:돋움체;">Trinity ?</a>&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
		<!--tr><td><a href="/Anaconda.do?CMD=CMD_SEQ_103899032741292201705418" style="font-size:11px;font-family:돋움체;">대시 보드</a></td></tr-->
	</table>
	</div>

	<!--div id="SubMenu_issue" style="top:118px; left:930px; display:none;position:absolute;padding: 8px 16px;background-color:#FFFFFF;border: 1px double #BF95FF;z-index:99;" onmouseover="javascript:mouseOverSubMenu('SubMenu_issue');" onmouseout="javascript:mouseOutSubMenu('SubMenu_issue');">
	<table class="table_menu" cellspacing="0" cellpadding="0">
		<tr><td>이슈 리스트(준비중)&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
		<tr><td>이슈 등록(준비중)&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
	</table>
	</div-->
		
<script language="javascript">
function fnSaveBug()
{
	
}
function fnShowBug()
{
	fnShowOrHideMenu('bug-input-style-box');
}
function closeMenu(object)
{
	var submenu = _(object.id);
	submenu.style.display = "none";
}
function showSubMenu(object)
{
	mouseOverSubMenu(object)
}
function mouseOverSubMenu(object)
{
	var submenu = _(object);
	submenu.style.display = "block";
}
function mouseOutSubMenu(object)
{
	var submenu = _(object);
	submenu.style.display = "none";
}
function hideSubMenu(object)
{
	 mouseOutSubMenu(object)
}
    var SelectedObject = '';

function fnShowSubMenu(object)
{
	getCumulativeOffset(element) 
	
	if(SelectedObject != '')
	{
		fnShowOrHideMenu(SelectedObject);
	}
	 fnShowOrHideMenu(object);
	SelectedObject = object;
}
function showSubMenu1(source, object)
{
	mouseOverSubMenu1(source, object)
}
function mouseOverSubMenu1(source, object)
{
	var p = getCumulativeOffset(_(source)) 
	var submenu = _(object);
	submenu.style.display = "block";
	submenu.style.left = p[0] + 'px';
	submenu.style.top = (p[1] + 27) + 'px';
	
}

</script>


<!-- end menu -->
