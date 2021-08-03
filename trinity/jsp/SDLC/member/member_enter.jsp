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
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script language="javascript">
alert("Access Denied");
history.back();
function check_password()
{
	with(member_enter){
		if(pw.value != pw2.value) return false;
	}
	return true;
}
</script>
<jsp:include page="/jsp/common/default-form.jsp">
	<jsp:param name="title" value="회원 가입" />
	<jsp:param name="action" value="/Anaconda.do?CMD=CMD_SEQ_105765243691381274389484" />
	<jsp:param name="form" value="member_enter" />
	<jsp:param name="footer" value="* Trinity에 가입하시면, Project Management , S/W Development 를 사용하실수 있습니다." />
	<jsp:param name="header" value="항목,값" />
	<jsp:param name="check" value="check_password()" />
	<jsp:param name="check_message" value="비밀번호가 일치하지 않습니다." />
	<jsp:param name="column" value="아이디,비밀번호,비밀번호확인,이름,이메일" />
	<jsp:param name="type" value="text,password,password,text,text" />
	<jsp:param name="css" value="styled,styled,styled,styled,styled" />
	<jsp:param name="name" value="id,pw,pw2,name,email" />
	<jsp:param name="size" value="60,60,60,100,100" />
	<jsp:param name="hidden_name" value="" />
	<jsp:param name="hidden_value" value="" />
</jsp:include>