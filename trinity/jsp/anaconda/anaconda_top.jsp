<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
     	<table width="940px" border=0 cellpadding=0 cellspacing=0>
     	<tr>
     	<td>
		<div class="title">
			<a href="/Anaconda.do?CMD=CMD_SEQ_108164918711286971872119"><img src="/jsp/anaconda/img/snake.png" width=60 height=60 border=0 align="absmiddle"></img><font size="5" color="#660066" style="font-family:Verdana,sans-serif;font-weight:bold;">Anaconda</font></a>
	 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%
			if(session.getAttribute(InitClass.getSESSION_DOMAIN()) == null){
			%>
				<a href="/Anaconda.do?CMD=CMD_SEQ_100937963281288324762498">로그인</a> 하시겠습니까?
			<%}else{%>
				<a href="/Anaconda.do?CMD=CMD_SEQ_106169144651288332119302">로그아웃</a> 하시겠습니까?
			<%} %>
	
			<input type="hidden" name="CMD" value="CMD_SEQ_105264816741288577553725" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		</div>
 		</td>
 		<td valign="top" style="padding-top:5px;">
&nbsp;<a href="/Anaconda.do?CMD=CMD_SEQ_108173637391288444301255" style="font-size:18px;font-family:Verdana,sans-serif;font-weight:bold;"><img src="/jsp/hydra/img/dragon.png" width=30 height=30 border=0 align="absmiddle"></img>Hydra</a>
		</td>
		<td>
		<div id="div_memory" style="display:none;float:left;">
		<h1>&nbsp;정보 가져오는 중 ...</h1>
		</div>
		</td>
		</tr>
		</table>
  	<form name="smartFrm" method="post" action="/Anaconda.do">
  	<input type="hidden" name="CMD" value="CMD_SEQ_105264816741288577553725"></input>
     <table width="940px" border="0" cellpadding="0" cellspacing="0"  style="background: url(/jsp/anaconda/img/img03.jpg) repeat-x;">
	<tr>
	  <td valign="top">  
		<div class="navigation">
			<a href="/Anaconda.do?CMD=CMD_SEQ_107171455261304663724702" style="color:#FFFFFF"><div id="navi_action" onmouseover="javascript:showSubMenu(this);" onmouseout="javascript:hideSubMenu(this);"><!--img src="/jsp/anaconda/img/action.png" width="13px" height="13px" border="0" align="absmiddle"></img--></img-->기획</div></a>
			<a href="/Anaconda.do?CMD=CMD_SEQ_108164918711286971872119" style="color:#FFFFFF"><div id="navi_action" onmouseover="javascript:showSubMenu(this);" onmouseout="javascript:hideSubMenu(this);"><!--img src="/jsp/anaconda/img/action.png" width="13px" height="13px" border="0" align="absmiddle"></img--></img-->화면</div></a>
			<a href="/Anaconda.do?CMD=CMD_SEQ_103615773161287821449749" style="color:#FFFFFF"><div id="navi_business" onmouseover="javascript:showSubMenu(this);" onmouseout="javascript:hideSubMenu(this);"><!--img src="/jsp/anaconda/img/service.png" width="13px" height="13px" border="0" align="absmiddle"></img--></img-->서비스</div></a>
			<a href="/Anaconda.do?CMD=CMD_SEQ_100600677051287893203559" style="color:#FFFFFF"><div id="navi_view" onmouseover="javascript:showSubMenu(this);" onmouseout="javascript:hideSubMenu(this);"><!--img src="/jsp/anaconda/img/view.png" width="13px" height="13px" border="0" align="absmiddle"></img--></img-->화면</div></a>
			<a href="/Anaconda.do?CMD=CMD_SEQ_101383688701288585627625" style="color:#FFFFFF"><div id="navi_matrix" onmouseover="javascript:showSubMenu(this);" onmouseout="javascript:hideSubMenu(this);"><!--img src="/jsp/anaconda/img/filter.png" width="13px" height="13px" border="0" align="absmiddle"></img--></img-->매트릭스</div></a>
			<a href="/Anaconda.do?CMD=CMD_SEQ_107239804791288227326088" style="color:#FFFFFF"><div id="navi_role" onmouseover="javascript:showSubMenu(this);" onmouseout="javascript:hideSubMenu(this);"><!--img src="/jsp/anaconda/img/role.png" width="13px" height="13px" border="0" align="absmiddle"></img--></img-->권한</div></a>
			<a href="/Anaconda.do?CMD=CMD_SEQ_102622610251288248433847" style="color:#FFFFFF"><div id="navi_filter" onmouseover="javascript:showSubMenu(this);" onmouseout="javascript:hideSubMenu(this);"><!--img src="/jsp/anaconda/img/filter.png" width="13px" height="13px" border="0" align="absmiddle"></img--></img-->필터</div></a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<font style="color:#FF00FF">검색</font>&nbsp;&nbsp;<input type="text" name="search" size="20" class="styled" style="margin-top:10px;"/>
			<div class="clearer"><span></span></div>
		</div>
    </td>
  </tr>
  </table>	
  </form>
	<p></p>
<form id="frmMemory" name="frmMemory" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_100161289571289445436065"></input>
</form>

	<script language="javascript">

	function showSubMenu(object)
	{
		if(object.id == 'navi_action')
		{
			var submenu = _('viewSubMenu');
			submenu.style.display = "none";
			
			var submenu = _('matrixSubMenu');
			submenu.style.display = "none";

			var submenu = _('serviceSubMenu');
			submenu.style.display = "none";
			
			var submenu = _('roleSubMenu');
			submenu.style.display = "none";
		}
		else if(object.id == 'navi_business')
		{
			var submenu = _('viewSubMenu');
			submenu.style.display = "none";
			var submenu = _('matrixSubMenu');
			submenu.style.display = "none";

			var submenu = _('roleSubMenu');
			submenu.style.display = "none";

			
			var submenu = _('serviceSubMenu');
			submenu.style.display = "block";
			submenu.style.position = "absolute";
			var pos = getCurrentPosition();
			submenu.style.left = pos.x;
			submenu.style.top = pos.y;

		}
		else if(object.id == 'navi_view')
		{
			var submenu = _('matrixSubMenu');
			submenu.style.display = "none";

			var submenu = _('serviceSubMenu');
			submenu.style.display = "none";


			var submenu = _('roleSubMenu');
			submenu.style.display = "none";

			
			var submenu = _('viewSubMenu');
			submenu.style.display = "block";
			submenu.style.position = "absolute";
			var pos = getCurrentPosition();
			submenu.style.left = pos.x;
			submenu.style.top = pos.y;
			
		}
		else if(object.id == 'navi_role')
		{
			var submenu = _('matrixSubMenu');
			submenu.style.display = "none";

			var submenu = _('serviceSubMenu');
			submenu.style.display = "none";
						
			var submenu = _('viewSubMenu');
			submenu.style.display = "none";



			var submenu = _('roleSubMenu');
			submenu.style.display = "block";
			submenu.style.position = "absolute";
			var pos = getCurrentPosition();
			submenu.style.left = pos.x;
			submenu.style.top = pos.y;
			
		}
		else if(object.id == 'navi_filter')
		{
			var submenu = _('matrixSubMenu');
			submenu.style.display = "none";
			var submenu = _('serviceSubMenu');
			submenu.style.display = "none";
						
			var submenu = _('viewSubMenu');
			submenu.style.display = "none";

			var submenu = _('roleSubMenu');
			submenu.style.display = "none";
			
		}
		else if(object.id == 'navi_matrix')
		{

			var submenu = _('serviceSubMenu');
			submenu.style.display = "none";
						
			var submenu = _('viewSubMenu');
			submenu.style.display = "none";

			var submenu = _('roleSubMenu');
			submenu.style.display = "none";

			
			var submenu = _('matrixSubMenu');
			submenu.style.display = "block";
			var pos = getCurrentPosition();
			//alert( pos.x);
			//alert(pos.y);
			submenu.style.left = pos.x;
			submenu.style.top = pos.y;
			
		}
	}
	function hideSubMenu(object)
	{
		if(object.id == 'navi_action')
		{
		}
		else if(object.id == 'navi_business')
		{
		}
		else if(object.id == 'navi_view')
		{
		}
		else if(object.id == 'navi_role')
		{
		}
		else if(object.id == 'navi_filter')
		{
		}
	}
	</script>
	<div id="viewSubMenu" style="display:none;position:absolute;padding: 0px 16px;">
	<p><h1></h1>
	<ul>
		<li><a href="/Anaconda.do?CMD=CMD_SEQ_104378450531288765663303" style="font-size:12px;font-family:돋움체;">UI 요소 목록화면</a></li>
		<li><a href="/Anaconda.do?CMD=CMD_SEQ_105856396481288658408572" style="font-size:12px;font-family:돋움체;">레이아웃 목록화면</a></li>
		<li><a href="/Anaconda.do?CMD=CMD_SEQ_103558081791305006657614" style="font-size:12px;font-family:돋움체;">화면 편집</a></li>
	</ul>
	</p>
	</div>
	<div id="matrixSubMenu" style="display:none;position:absolute;padding: 0px 16px;">
	<p><h1></h1>
	<ul>
		<li><a href="/Anaconda.do?CMD=CMD_SEQ_101383688701288585627625" style="font-size:12px;font-family:돋움체;">화면 & 서비스 매트릭스</a></li>
		<li><a href="/Anaconda.do?CMD=CMD_SEQ_101226596321288594030291" style="font-size:12px;font-family:돋움체;">화면 & 화면 매트릭스</a></li>
		<li><a href="/Anaconda.do?CMD=CMD_SEQ_106640442321288597229277" style="font-size:12px;font-family:돋움체;">서비스 & 화면 매트릭스</a></li>
	</ul>
	</p>
	</div>
	
	<div id="serviceSubMenu" style="display:none;position:absolute;padding: 0px 16px;">
	<p><h1></h1>
	<ul>
		<li><a href="/Anaconda.do?CMD=CMD_SEQ_108037707931289267322444" style="font-size:12px;font-family:돋움체;">서비스 리소스 목록화면</a></li>
	</ul>
	</p>
	</div>

	<div id="roleSubMenu" style="display:none;position:absolute;padding: 0px 16px;">
	<p><h1></h1>
	<ul>
		<li><a href="/Anaconda.do?CMD=CMD_SEQ_107239804791288227326088" style="font-size:12px;font-family:돋움체;">권한 목록화면</a></li>
		<li><a href="/Anaconda.do?CMD=CMD_SEQ_106557688651298705108710" style="font-size:12px;font-family:돋움체;">권한 매핑화면</a></li>
	</ul>
	</p>
	</div>
		
<form id="frmMemory" name="frmMemory" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_100161289571289445436065"></input>
</form>	
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
function clickSecondVersion(strCmd)
{
	alert("다음 버전에서 제공예정입니다.");
}

function fnGetMemory()
{
	callAjaxByFormAndHandler("getMemory", "frmMemory" ,new CallBackMemory());

}
function CallBackMemory()
{
	var object;
}
CallBackMemory.prototype.doRun = function(request)
{
	var div = _('div_memory');
	div.innerHTML = this.object.responseText;
	div.style.display = "block";
}
function fnLoad()
{
  setInterval(fnGetMemory,5000);
}

//document.onload =fnLoad();

</script>
<!-- end menu -->


