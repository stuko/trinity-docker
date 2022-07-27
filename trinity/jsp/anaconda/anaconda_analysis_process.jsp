<%@ page contentType="text/xml; charset=UTF-8" %><%@page pageEncoding="UTF-8" %><%@ page import="java.util.*"%><%@ page import="java.net.*"%><%@ page import="com.stuko.anaconda.XmlConfig.*"%><%@ page import="com.stuko.anaconda.business.*"%><%@ page import="com.stuko.anaconda.value.*"%><%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%><%@ page import="com.stuko.anaconda.util.InitClass"%><%@ page import="com.stuko.anaconda.business.*"%><%@ page import="com.stuko.anaconda.Exception.*"%><%@ page import="com.stuko.anaconda.util.*"%><%@ page import="com.stuko.anaconda.SQLCommand.*"%><%
	String strCode 	= request.getParameter("code");
	String dxname = request.getParameter("dxname") != null ? URLDecoder.decode(request.getParameter("dxname"),"UTF-8") : request.getParameter("dxname");
	String dxkey = request.getParameter("dxkey") != null ? URLDecoder.decode(request.getParameter("dxkey"),"UTF-8") : request.getParameter("dxkey");
	String strRtn = "";
	try
	{
		DefaultXmlResource res = DefaultXmlResource.getInstance();
		DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANALYSIS_MODEL);
		
		
		if(strCode.equals("remove"))
		{
			if(col != null)
			{
				DefaultXmlData dxd = col.getDefaultXmlData(dxname);
				dxd.remove(dxkey);
			}
			res.save(col);
		}
		else if(strCode.equals("delete_all"))
		{
			if(col != null)
			{
				col.clear();
			}
			res.save(col);
		}
		else if(strCode.equals("create_design_model"))
		{
			col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.DESIGN_MODEL);
			if(col == null)
			{
				col = new DefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.DESIGN_MODEL);
				res.addDefaultXmlDataCollection(col);
			}
			DefaultXmlData dxd = new DefaultXmlData();
			dxd.setTYPE("DESIGN_TABLE");
			dxd.set("entity_name",dxname);
			dxd.set("analysis_name",dxkey);
			col.addDefaultXmlData(dxd);
			res.save(col);
		}

	} 
	catch (Exception e) 
	{
		e.printStackTrace();
	}
%>
