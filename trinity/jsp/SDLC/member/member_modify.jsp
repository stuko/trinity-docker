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

<%
	BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getMemberInfo");
	String id = "";
	String email = "";
	String name = "";
	String member_id = "";
	String value = "";
	if(bc != null && bc.size() > 0)
	{
		BusinessData bd = bc.getBusinessData(0);
		member_id = bd.getFieldValue("MEMBER_NAME");
		email = bd.getFieldValue("EMAIL");
		name = bd.getFieldValue("NAME");
		id = bd.getFieldValue("ID");
		value = ",," +name+","+email;
	}
%>


<script language="javascript">
function check_password()
{
	with(member_modify){
		if(pw.value != pw2.value) return false;
	}
	return true;
}
function goSecession()
{
	if(confirm("Really leave?")){
                if(confirm("You can not use you account any more.")){
   		    document.location.href = "/Anaconda.do?CMD=CMD_SEQ_107375260951381444906625";
                }
	}
}
</script>


<jsp:include page="/jsp/common/default-form-modify.jsp">
	<jsp:param name="title" value="Modify my page" />
	<jsp:param name="action" value="/Anaconda.do?CMD=CMD_SEQ_100850839471381461713125" />
	<jsp:param name="form" value="member_modify" />
	<jsp:param name="footer" value="* If you join a Trinity, you can use Project Management and S/W Development tools." />
	<jsp:param name="header" value="Attribute , value" />
	<jsp:param name="check" value="check_password()" />
	<jsp:param name="check_message" value="Your password does not be same." />
	<jsp:param name="column" value="Password,Confirm password,Name,Email" />
	<jsp:param name="type" value="password,password,text,text" />
	<jsp:param name="css" value="styled,styled,styled,styled" />
	<jsp:param name="name" value="pw,pw2,name,email" />
	<jsp:param name="size" value="60,60,100,100" />
	<jsp:param name="value" value="<%=value%>" />
	<jsp:param name="hidden_name" value="id" />
	<jsp:param name="hidden_value" value="<%=id%>" />
</jsp:include>
