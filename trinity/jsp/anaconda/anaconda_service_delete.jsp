<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>

<%
	String strBizCol 	= request.getParameter("bizCol");

	try
	{
		BizLogicXmlResource xmlResource = BizLogicXmlResource.getInstance();	
		xmlResource.removeBusinessCollectionFile(strBizCol);
		xmlResource.release();
	} catch (Exception e) {e.printStackTrace();}
%>
<html>
<head>
</head>
<body>
<script>
	alert("서비스(<%=strBizCol%>)가 삭제되었습니다!");
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_103615773161287821449749";
</script>
</body>

