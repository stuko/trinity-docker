<%@ page contentType="text/xml; charset=UTF-8" %><%@page pageEncoding="UTF-8" %><%@ page import="java.util.*"%><%@ page import="com.stuko.anaconda.XmlConfig.*"%><%@ page import="com.stuko.anaconda.business.*"%><%@ page import="com.stuko.anaconda.value.*"%><%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%><%@ page import="com.stuko.anaconda.util.InitClass"%><%
	String strCode 	= request.getParameter("code");
	String strPath	= request.getParameter("page_path");
	String strName	= request.getParameter("name");
	String strRtn = "";
	try
	{
		BusinessData businessData = (BusinessData)request.getAttribute(InitClass.getBusinessDataValue());
		if(strCode.equals("delete"))
		{
			DefaultXmlResource res = DefaultXmlResource.getInstance();
			res.remove(strName);
			res.save();
			strRtn = res.simpleXmlData("Anaconda","100");
			
		}
		else if(strCode.equals("create"))
		{
			PageXmlResource resource = new PageXmlResource();
			resource.create("Anaconda","",strPath,"");
			strRtn = resource.simpleXmlData("Anaconda","200");
		}
		else if(strCode.equals("find"))
		{
			PageXmlResource resource = new PageXmlResource();
			DefaultXmlDataCollection dxdc = resource.find(strName);
			strRtn = resource.httpXmlData(businessData,dxdc);
		}
		out.print(strRtn);
	} 
	catch (Exception e) 
	{
		ExceptionCenter.catchException(e);
	}
%>
