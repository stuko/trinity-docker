<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>

<%
	String strActCol 	= request.getParameter("actCol");

	try
	{			
		WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();	
		//System.out.println("strActCol============================="+strActCol);
		xmlResource.removeWebActionCollectionFile(strActCol);
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
<script language="javascript">
	alert("정상적으로 삭제되었습니다!");
	location.href = "/Anaconda.do?CMD=CMD_SEQ_108164918711286971872119";
</script>
</body>

