<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>

<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
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
</style>
<nav role="navigation">
  <div id="menuToggle">
    <input type="checkbox" />
    <span></span>
    <span></span>
    <span></span>
    <ul id="menu">
      <li id="topactive"><a href="javascript:fnOpenMenu('menu-domain');" id="topcurrent"><i class="fas fa-home"></i>&nbsp;멀티 사이트</a>
	<ul style="z-index:1000000;display:none" id='menu-domain'>
	  <li><a href="/Anaconda.do?CMD=CMD_SEQ_108173637391288444301255" ><i class="fas fa-circle"></i>&nbsp;사이트 리스트</a></li>
	  <li><a href="/Anaconda.do?CMD=CMD_SEQ_107365064121289636666401" ><i class="fas fa-circle"></i>&nbsp;사이트 생성하기</a></li>
	  <li><a href="/Anaconda.do?CMD=CMD_SEQ_102622610251288248433847" ><i class="fas fa-circle"></i>&nbsp;필터 리스트</a></li>
	  <li><a href="/Anaconda.do?CMD=CMD_SEQ_106855886431288257600525" ><i class="fas fa-circle"></i>&nbsp;필터 생성하기</a></li>
	</ul>
      </li>
      <li><a href="javascript:fnOpenMenu('menu-requirements');"><i class="fas fa-list-ul"></i>&nbsp;요구사항 관리</a>
        <ul style="z-index:1000000;display:none" id='menu-requirements'>
	  <li><a href="/Anaconda.do?CMD=CMD_SEQ_107171455261304663724702" ><i class="fas fa-circle"></i>&nbsp;요구사항 생성하기</a></li>
  	</ul>
      </li>
      <li><a href="javascript:fnOpenMenu('menu-analysis');"><i class="fas fa-project-diagram"></i>&nbsp;분석과 설계</a>
	<ul style="z-index:1000000;display:none"  id='menu-analysis'>
	  <li><a href="/Anaconda.do?CMD=CMD_SEQ_104378450531288765663303" ><i class="fas fa-circle"></i>&nbsp;UI 컴포넌트</a></li>
	  <li><a href="/Anaconda.do?CMD=CMD_SEQ_103558081791305006657614" ><i class="fas fa-circle"></i>&nbsp;UI 컴포넌트 생성하기</a></li>
	  <li><a href="/Anaconda.do?CMD=CMD_SEQ_105856396481288658408572" ><i class="fas fa-circle"></i>&nbsp;레이아웃 관리</a></li>
	  <li><a href="/Anaconda.do?CMD=CMD_SEQ_103530981101559962079937" ><i class="fas fa-circle"></i>&nbsp;데이터베이스 연결</a></li>
	  <!--li><a href="/Anaconda.do?CMD=CMD_SEQ_101383688701288585627625" >Matrix</a></li-->
        </ul>
      </li>
	<li><a href="javascript:fnOpenMenu('menu-development');"><i class="far fa-file-code"></i>&nbsp;웹 개발 관리</a>
	  <ul style="z-index:1000000;display:none"  id='menu-development'>
            <li><a href="/Anaconda.do?CMD=CMD_SEQ_101666004731562248869595" ><i class="fas fa-circle"></i>&nbsp;명령어 실행</a></li>
	    <li><a href="/Anaconda.do?CMD=CMD_SEQ_107581931011562108379033" ><i class="fas fa-circle"></i>&nbsp;서버 파일 탐색</a></li>
	    <li><a href="/Anaconda.do?CMD=CMD_SEQ_106594560501498179923551" ><i class="fas fa-circle"></i>&nbsp;프런트 개발</a></li>
	    <li><a href="/Anaconda.do?CMD=CMD_SEQ_108164918711286971872119" ><i class="fas fa-circle"></i>&nbsp;액션 관리</a></li>
	    <li><a href="/Anaconda.do?CMD=CMD_SEQ_106123592361287269752055" ><i class="fas fa-circle"></i>&nbsp;액션 생성하기</a></li>
	    <li><a href="/Anaconda.do?CMD=CMD_SEQ_103615773161287821449749" ><i class="fas fa-circle"></i>&nbsp;서비스 관리</a></li>
	    <li><a href="/Anaconda.do?CMD=CMD_SEQ_107211261401287822755707" ><i class="fas fa-circle"></i>&nbsp;서비스 생성하기</a></li>
	    <li><a href="/Anaconda.do?CMD=CMD_SEQ_107239804791288227326088" ><i class="fas fa-circle"></i>&nbsp;권한 관리</a></li>
	    <li><a href="/Anaconda.do?CMD=CMD_SEQ_108710360611288228206258" ><i class="fas fa-circle"></i>&nbsp;권한 생성하기</a></li>
	    <li><a href="/Anaconda.do?CMD=CMD_SEQ_106557688651298705108710" ><i class="fas fa-circle"></i>&nbsp;권한 할당하기</a></li>
	    <li><a href="/Anaconda.do?CMD=CMD_SEQ_108037707931289267322444" ><i class="fas fa-circle"></i>&nbsp;데이터베이스 리소스 관리</a></li>
	    <li><a href="/Anaconda.do?CMD=CMD_SEQ_103935205231230567381328" ><i class="fas fa-circle"></i>&nbsp;SQL 테스트</a></li>
	    <li><a href="/Anaconda.do?CMD=CMD_SEQ_105269752731345259248970" ><i class="fas fa-circle"></i>&nbsp;SQL 캐시 관리</a></li>
	    <li><a href="/Anaconda.do?CMD=CMD_SEQ_109567308931345345981920" ><i class="fas fa-circle"></i>&nbsp;배치 관리</a></li>
	    <li><a href="/Anaconda.do?CMD=CMD_SEQ_103213425031360588235009" ><i class="fas fa-circle"></i>&nbsp;룰 관리</a></li>
            <li><a href="/Anaconda.do?CMD=CMD_SEQ_104740062431578035448248" ><i class="fas fa-circle"></i>&nbsp;디버깅</a></li>
	    <!--li><a href="/Anaconda.do?CMD=CMD_SEQ_108773320751371349718547" ><i class="fas fa-circle"></i>&nbsp;Manager anaconda entity</a></li-->
	  </ul>				
	</li>
<!--
	<li><a href="javascript:fnOpenMenu('menu-test');"><i class="fas fa-bug"></i>&nbsp;Test</a>
	  <ul style="z-index:1000000;display:none"  id='menu-test'>
	    <li><a href="/Anaconda.do?CMD=CMD_SEQ_105836770501290999075239" ><i class="fas fa-circle"></i>&nbsp;Manage test scenario</a></li>
	    <li><a href="/Anaconda.do?CMD=CMD_SEQ_105441898731290999091414" ><i class="fas fa-circle"></i>&nbsp;Manage test data</a></li>
	    <li><a href="/Anaconda.do?CMD=CMD_SEQ_109616405671292830123563" ><i class="fas fa-circle"></i>&nbsp;Execute test scenario</a></li>
	    <li><a href="/Anaconda.do?CMD=CMD_SEQ_107730116601290999098215" ><i class="fas fa-circle"></i>&nbsp;Test report</a></li>
	  </ul>
-->
	</li>
	<li><a href="javascript:fnOpenMenu('menu-deploy');"><i class="fas fa-server"></i>&nbsp;배포하기</a>
          <ul style="z-index:1000000;display:none"  id='menu-deploy'>
            <li><a href="/Anaconda.do?CMD=CMD_SEQ_100333381081289029921460" ><i class="fas fa-circle"></i>&nbsp;배포 요청 리스트</a></li>
	    <li><a href="/Anaconda.do?CMD=CMD_SEQ_107335537401289969322212" ><i class="fas fa-circle"></i>&nbsp;배포 요청 생성하기</a></li>
	    <li><a href="/Anaconda.do?CMD=CMD_SEQ_101304559451289996453898" ><i class="fas fa-circle"></i>&nbsp;배포 대상 서버 그룹 생성하기</a></li>
	    <li><a href="/Anaconda.do?CMD=CMD_SEQ_103105634661289983608812" ><i class="fas fa-circle"></i>&nbsp;배포 대상 서버 생성하기</a></li></ul>
	  </li>
        <li><a href="/Anaconda.do?CMD=CMD_SEQ_106577512821577858709543" ><i class="fas fa-file-export"></i>&nbsp;백업하기</a></li>
	</li>
        <!--li><a href="/Anaconda.do?CMD=CMD_SEQ_106992440181289030150305"><i class="fas fa-circle"></i>&nbsp;User</a><ul>
	  <li><a href="/Anaconda.do?CMD=CMD_SEQ_106992440181289030150305" ><i class="fas fa-circle"></i>&nbsp;Users list</a></li>
	  <li><a href="/Anaconda.do?CMD=CMD_SEQ_100302139341289866742976" ><i class="fas fa-circle"></i>&nbsp;Create user</a></li></ul>
	</li-->
<!--
	<li><a href="javascript:fnOpenMenu('menu-log');">Log</a>
          <ul style="z-index:1000000;display:none" id='menu-log'>
	  <li><a href="/Anaconda.do?CMD=CMD_SEQ_101787643881289806558558" ><i class="fas fa-circle"></i>&nbsp;Error</a></li>
	  <li><a href="/Anaconda.do?CMD=CMD_SEQ_105921919581303528883523" ><i class="fas fa-circle"></i>&nbsp;Log</a></li>
	  <li><a href="/Anaconda.do?CMD=CMD_SEQ_100859473711361075217648" ><i class="fas fa-circle"></i>&nbsp;Backup or recovery</a></li>-->    
    </ul>
  </div>
</nav>

<script>
function fnOpenMenu(id){
    $('#'+id).toggle();
}
</script>
