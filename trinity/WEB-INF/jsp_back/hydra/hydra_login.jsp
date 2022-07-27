<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style type="text/css">
.btn{background-image:url(http://i.kthimg.com/TOP/new/bt_01.gif);background-position:0 0;background-repeat:no-repeat;text-indent:-3000px;overflow:hidden;}
</style>
<script language="javascript">
function login()
{
	with(fmLogin)
	{
		if(id.value == null || id.value == '')
		{
			alert("아이디를 입력하시기 바랍니다");
			return;
		}

		if(passwd.value == null || passwd.value == '')
		{
			alert("패스워드를 입력하시기 바랍니다");
			return;
		}
		AnacondaSubmit(document.fmLogin);
	}
}

</script>
<div class="post">
	<div class="title-right">
	<h2><b>로그인</b></h2>
	</div>
	<div class="entry">
	<br></br>
		<form name="fmLogin" method="post" action="/Anaconda.do?CMD=CMD_SEQ_102841923881289891235806">
		<p>
			<div align="center">
			<fieldset style="width:400px;height:140px;">
			<legend><h1>&nbsp;&nbsp;&nbsp;&nbsp;<b style="font-family:Verdana,sans-serif;font-weight:bold;">Hydra/Anaconda 사용자 로그인</b>&nbsp;&nbsp;&nbsp;</h1></legend>
			<p></p>
			<table>
				<tr>
					<td width="100" style="color:#000000">아이디</td><td align="left"><input type="text" class="styled" name="id" size="20" tabindex="1"/></td><td rowspan="2" width="10"></td><td rowspan="2"><input type="button" class="button white" value="로그인" style="width:60px;height:50px;" onClick="javascript:login();"></input></td>
				</tr>
				<tr>
					<td width="100" style="color:#000000">비밀번호</td><td align="left"><input type="password" class="styled" name="passwd"  size="20" tabindex="2" onKeyPress="javascript:fnEnterEvent('login')"/></td>
				</tr>
			</table>
			<p>
			<ul>
			<li style="font-family:Verdana,sans-serif;">Anaconda 프레임워크 사용자 등록은  관리자에게 문의 바람. </li>
			</ul>
			</p>
			</fieldset>
			</div>
		</p>
		</form>	
	</div>
</div>
		
<script language="javascript">
fmLogin.id.focus();
</script>