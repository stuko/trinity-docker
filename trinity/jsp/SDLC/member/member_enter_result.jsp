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

<!-- MSG View component -->
<jsp:include page="/jsp/common/default-message.jsp">
	<jsp:param name="title" value="회원가입 완료" />
	<jsp:param name="code" value="0000" />
	<jsp:param name="message" value="회원가입이 완료 되었습니다." />
	<jsp:param name="return_link" value="/Anaconda.do?CMD=CMD_SEQ_100937963281288324762498" />
	<jsp:param name="return_message" value="돌아가기" />
	<jsp:param name="alert_message" value="회원가입을 축하합니다." />
	<jsp:param name="redirect_link" value="" />
</jsp:include>