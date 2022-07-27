<%@ page contentType="text/html; charset=UTF-8" %><%@ page import="java.io.File"%><%@ page import="java.io.FileInputStream"%><%@ page import="java.util.Enumeration"%><%@ page import="java.util.Iterator"%><%@ page import="java.util.Properties"%><%@ page import="com.stuko.anaconda.xtreme.role.*"%><%@ page import="com.stuko.anaconda.action.*"%><%@ page import="com.stuko.anaconda.front.*"%><%@ page import="com.stuko.anaconda.XmlConfig.*"%><%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%><%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%><%@ page import="com.stuko.anaconda.view.*"%><%@ page import="com.stuko.anaconda.xtreme.site.*"%><%@ page import="com.stuko.anaconda.value.*"%><%@ page import="com.stuko.anaconda.business.*"%><%@ page import="com.stuko.anaconda.webeditor.file.*"%><%@ page import="com.stuko.anaconda.util.InitClass"%><%@ page import="java.util.*"%><%@ page import="java.net.*"%><%
	request.setCharacterEncoding("EUC-KR");
	BusinessHelper helper  = new BusinessHelper();
	String cmd = request.getParameter("TARGET_CMD");
	String role_collection = request.getParameter("RoleCollection");
	role_collection =  helper.getRoleString();
	BusinessData businessData = (BusinessData)request.getAttribute(InitClass.getBusinessDataValue());
	String strRtn = "";
	// http://local.bestmember.net/Anaconda.do?CMD=CMD_SEQ_104838692381307840961514&TARGET_CMD=CMD_SEQ_104838692381307840961514
	try
	{
		if(cmd != null)
		{
			WebAction webAction = BusinessHelper.getWebAction(request,cmd);
			XtremeRoleCollection rolecollection = null;
			String strRoleCollectionName = helper.getRoleString();
			XtremeRoleManager rolemanager = XtremeRoleManager.getInstance();
			rolecollection = rolemanager.getRoleCollection(strRoleCollectionName);
			XtremeRole role = rolecollection.getXtremeRole(webAction.getISAUTH());
			String resultRole = rolecollection.checkRole(role,businessData);
			if(resultRole != null)
			{
				XtremeRoleManager xrm = XtremeRoleManager.getInstance();
				XtremeRole xr = xrm.getXtremeRole(role_collection,webAction.getISAUTH());
				strRtn = xr.getRole_click_message();
			}
		}
		out.print(strRtn);
	} catch (Exception e) {
		// out.println(e.toString());
		e.printStackTrace();
	}
%>