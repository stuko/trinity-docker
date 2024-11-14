<%@ page contentType="text/xml; charset=UTF-8" %>

<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.SQLCommand.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%
try
{
	BusinessCollection businessCollection = null;
	ReturnValue returnValue = (ReturnValue)request.getAttribute(InitClass.getReturnValue());	

	if(returnValue.mBRtn == true)
	{
		businessCollection = (BusinessCollection)((ReturnValue)returnValue.getReturnObject("SqlExecService")).mORtn;
	}

%>
<%if(businessCollection != null)out.println(businessCollection.toXString());%>
<%
}
catch(Exception e)
{
	out.println(e.toString());
}
%>
