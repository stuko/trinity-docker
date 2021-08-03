<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>

<%
	request.setCharacterEncoding("EUC-KR");
	String strViewCol 	= request.getParameter("viewCol");

	try
	{
		ViewXmlResource xmlResource = ViewXmlResource.getInstance();
		//System.out.println("strActCol============================="+strViewCol);
		xmlResource.removeViewCollectionFile(strViewCol);
		xmlResource.release();
	} catch (Exception e) {
	    e.printStackTrace();
		ExceptionCenter.catchException(e);
		//System.out.println("===============================>>>"+e.toString());
	}
%>
<html>
<head>
</head>
<body>
<script>
	alert("요청하신 화면(<%=strViewCol%>)이 삭제되었습니다!");
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_100600677051287893203559";
</script>
</body>

