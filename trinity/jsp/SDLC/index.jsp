<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.filter.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.action.*"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@page import="com.stuko.anaconda.security.*"%>
<%@page import="java.security.PublicKey"%>
<%@page import="java.security.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	response.setHeader("Pargma", "no-cache");
	response.setHeader("Expires", "-1");
	
	String strSessionValue  = "";
	DefaultAuth auth = null;
	//RequestHelper helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
	//if(helper.getSessionObject() != null){
	//	auth = (DefaultAuth)helper.getSessionObject();
	//}
	if(auth != null)
	{
%>
	<script language="javascript">
		document.location.href = "/Anaconda.do?CMD=CMD_SEQ_101590000581381445705515";
	</script>

<%
	}
	else
	{
%>

<% 
	
	   String rand = "" + System.currentTimeMillis();	
       String pk = "";
	   RSAUtil rsa = new RSAUtil();
	   Object[] keys = rsa.getKey();
	   session.setAttribute("RSA",keys);
	   pk = rsa.getPublicKeyModule((PublicKey)keys[0]);
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> TRINITY </title>
<meta http-equiv="Cache-Control" content="no-cache"/> 
<meta http-equiv="Expires" content="0"/> 
<meta http-equiv="Pragma" content="no-cache"/> 


<script src="/jsp/SDLC/js/default.js" language="javascript" ></script>
<link rel="stylesheet" href="/jsp/Neo/css/reset.css">
<link rel="stylesheet" href="/jsp/Neo/css/animate.css">
<link rel="stylesheet" href="/jsp/Neo/css/styles.css">

<script language="JavaScript" type="text/javascript" src="/jsp/SDLC/js/jsbn.js?key=<%=rand%>"></script>
<script language="JavaScript" type="text/javascript" src="/jsp/SDLC/js/prng4.js?key=<%=rand%>"></script>
<script language="JavaScript" type="text/javascript" src="/jsp/SDLC/js/rng.js?key=<%=rand%>"></script>
<script language="JavaScript" type="text/javascript" src="/jsp/SDLC/js/rsa.js?key=<%=rand%>"></script>
<script language="JavaScript" type="text/javascript" src="/jsp/SDLC/js/base64.js?key=<%=rand%>"></script>
<script src="/jsp/anaconda/js/default.js" language="javascript" ></script>
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

/*
		var before = new Date();
		var rsa = new RSAKey();
		var div_pk = document.getElementById('pk');
		var n = div_pk.innerHTML;
		rsa.setPublic(n, '10001');
		var enc_id = rsa.encrypt(id.value );
		rsa = new RSAKey();
		rsa.setPublic(n, '10001');
		var enc_passwd = rsa.encrypt(passwd.value );
		// alert(enc_id);
		// alert(enc_passwd);
		id.value = enc_id;
		passwd.value = enc_passwd;
*/
		AnacondaSubmit(document.fmLogin);
	}
}
</script>
 </head>

 <body>

<div id="container-login">
		<form name="fmLogin" id='frmLogin' method="post" action="/Anaconda.do?CMD=CMD_SEQ_106932268621288335171509" onSubmit="return false;">
		<input type="hidden" name="ENC.RSA" value="true">
		<label for="name">아이디:</label>
		<input type="name" name="id" id="id">
		<label for="username">비밀번호:</label>
		<!--p><a href="#">Forgot your password?</a-->
		<input type="password" name="passwd" id="passwd">
		<div id="lower">
		<!--input type="checkbox"><label class="check" for="checkbox">Keep me logged in</label-->
		<input type="submit" value="로그인" onClick="javascript:login();">
		</div>
		</form>
	</div>
<script language="javascript">
fmLogin.id.focus();
</script>
<div id="pk" style="display:none;"><%=pk%></div>
</body>
</html>
<%}%>
