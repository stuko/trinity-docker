<%@ page contentType="text/xml; charset=UTF-8" %><%@page pageEncoding="UTF-8" %><%@ page import="java.util.*"%><%@ page import="java.net.*"%><%@ page import="com.stuko.anaconda.XmlConfig.*"%><%@ page import="com.stuko.anaconda.business.*"%><%@ page import="com.stuko.anaconda.value.*"%><%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%><%@ page import="com.stuko.anaconda.util.InitClass"%><%
	String strCode 	= request.getParameter("code");
	String strDebug	= request.getParameter("debug");
	String strPeriod = request.getParameter("debug_period");
	String strName	= request.getParameter("session_name");
	String strTime	= request.getParameter("debug_time");
	
	String strRtn = "";
	try
	{
		BusinessData businessData = (BusinessData)request.getAttribute(InitClass.getBusinessDataValue());
		String strUserName = businessData.getFieldValue(strName);
		DefaultXmlResource res = DefaultXmlResource.getInstance();
		if(strCode.equals("save"))
		{
			DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(BlankField.ANACONDA_DEBUG);
			if(col == null)
			{
				col = new DefaultXmlDataCollection(BlankField.ANACONDA_DEBUG);
				res.addDefaultXmlDataCollection(col);
			}
			DefaultXmlData dxd = col.getDefaultXmlData(strUserName);
			if(dxd == null)
			{
				dxd = new DefaultXmlData(strUserName);
				col.addDefaultXmlData(dxd);
			}
			dxd.set("debug",strDebug);
			dxd.set("period",strPeriod);
			dxd.set("session",strName);
			dxd.set("time",strTime);
			res.save(col);
			strRtn = res.httpXmlData(businessData,col);
		}
		out.print(strRtn);
	} 
	catch (Exception e) 
	{
		ExceptionCenter.catchException(e);
	}
%>
