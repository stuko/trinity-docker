<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.stuko.anaconda.security.*"%>
<%@page import="java.security.PublicKey"%>
<%@page import="java.security.*"%>
<% 
	response.setHeader("Pargma", "no-cache");
	response.setHeader("Expires", "-1");
%>
<script src="/jsp/anaconda/js/default.js" language="javascript" ></script>
<script language="javascript">
function login()
{
	with(fmLogin)
	{
		if(id.value == null || id.value == '')
		{
			alert("Please Input a your ID");
			return;
		}

		if(passwd.value == null || passwd.value == '')
		{
			alert("Please Input your password");
			return;
		}
		AnacondaSubmit(document.fmLogin);
	}
}

$(document).ready(function(){

  $("#passwd").keydown(function(key) {
    if (key.keyCode == 13) {
       login();
    }
  });


$("#id").keydown(function(key) {
  if (key.keyCode == 13) {
    login();
  }
});
});


</script>

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl"><i class="fas fa-sign-in-alt" style="margin-right:20px;"></i>LOGIN</h3>
			</div>
		</div>
	</div>
</div>
<br>
<table class="table-neo">
<thead>
  <col width="20%" />
  <col width="80%" />
</thead>
<tbody>
		<form name="fmLogin" id='frmLogin' method="post" action="/Anaconda.do?CMD=CMD_SEQ_106932268621288335171509" onSubmit="return false;">
		<input type="hidden" name="ENC.RSA" value="true">
<tr><td width="30%"><i class="fas fa-id-card" style="margin-right:20px;"></i><label for="name">ID</label></td><td width="70%" style="text-align:left"><div style="text-align:left"><input type="name" name="id"  class="styled" id="id" ></div></td></tr>
<tr><td width="30%"><i class="fas fa-key" style="margin-right:20px;"></i><label for="username">PASSWORD</label></td><td width="70%" style="text-align:left"><div style="text-align:left"><input type="password" name="passwd" class="styled" id="passwd"></div></td></tr>
<tr><td colspan="2" width="100%"><button type="button" class="btn btn-primary" style="margin-left:18px;" onClick="javascript:login();">Login</button></td></tr>
		</form>
</tbody>
</table>
<script language="javascript">
fmLogin.id.focus();
</script>
