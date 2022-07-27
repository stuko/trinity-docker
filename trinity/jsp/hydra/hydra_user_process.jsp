<%@ page contentType="text/xml; charset=UTF-8" %><%@page pageEncoding="UTF-8" %><%@ page import="java.util.*"%><%@ page import="java.net.*"%><%@ page import="com.stuko.anaconda.XmlConfig.*"%><%@ page import="com.stuko.anaconda.business.*"%><%@ page import="com.stuko.anaconda.front.*"%><%@ page import="com.stuko.anaconda.value.*"%><%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%><%@ page import="com.stuko.anaconda.util.InitClass"%><%
	String strCode 	= request.getParameter("code");
	String strRtn = "";
	ReturnValue rv = null;
	try
	{
		BusinessData businessData = (BusinessData)request.getAttribute(InitClass.getBusinessDataValue());
		DefaultXmlResource res = DefaultXmlResource.getInstance();
		rv = (ReturnValue)request.getAttribute(InitClass.getReturnValue());
		out.print(rv.mORtn);
		if(strCode.equals("searchid"))
		{
			if(rv.mORtn == null || "null".equals(rv.mORtn) || "".equals(rv.mORtn)) strRtn = "";
			else
			{
				strRtn = "OK";
			}
		}
		out.print(strRtn);
	} 
	catch (Exception e) 
	{
		e.printStackTrace();
		e.printStackTrace();
	}
%>