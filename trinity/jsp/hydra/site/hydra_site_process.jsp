<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.xtreme.site.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.front.*"%>

<%@ page import="com.stuko.anaconda.business.BusinessCollection"%>
<%@ page import="com.stuko.anaconda.business.BusinessHelper"%>

<%
	BusinessHelper helper = new BusinessHelper();
	request.setCharacterEncoding("EUC-KR");
//공통 파라미터
	String strCode 			= request.getParameter("code");
	String strActColName	= request.getParameter("ActColName");	
	String strActName	= request.getParameter("ActName");	
	String strActColKorName	= URLDecoder.decode(helper.nullToString(request.getParameter("ActColKorName")),"utf-8");
	String strActKorName	= URLDecoder.decode(helper.nullToString(request.getParameter("ActKorName")),"utf-8");
	String strLayoutName	= request.getParameter("Layout");
	String strLayoutKorName	= request.getParameter("LayoutKorName");

	String RTN_CODE = "";
%>

<%
	try
	{	

		RequestHelper requestHelper = (RequestHelper)request.getAttribute(InitClass.HELPER);
		DefaultAuth auth = (DefaultAuth)requestHelper.getSessionObject();
		String strSessionValue = "";
		
		if(auth != null)
		{
			strSessionValue = auth.getAuthItem(("MEMBER_NAME"));	
		}

		// System.out.println(strSessionValue);

		String application_domain = helper.nullToString(request.getParameter("application_domain"));
		String application_context = helper.nullToString(request.getParameter("application_context"));
		XtremeSiteManager xsm = XtremeSiteManager.getInstance();
		XtremeSite xs = null;

		String application_key = helper.nullToString(request.getParameter("application_key"));
		String application_name = "";
		String application_code = "";
		// String application_domain = "";
		// String application_context  = "";
		String application_vision = "";
		String application_service = "";
		String application_auth = "";
		String application_session  = "";
		String application_crypt = "";
		String application_crypt_level = "";
		String application_notfound = "";
		String application_error = "";
		String application_http = "";
		String application_https = "";
		String application_image = "";
		String application_role = "";
		String application_image_path = "";
		String application_index_page = "";
		//out.println(application_key);
		if(helper.checkBusinessNull(application_key))
		{
			// System.out.println(application_key);
			xs = xsm.getXtremeSite(application_key);
			if(xs != null)
			{
				application_key = xs.getSiteId();
				application_name = xs.getSiteName();
				application_code = xs.getSiteCode();
				application_domain = xs.getDomain();
				application_context  = xs.getContext();
				application_auth = xs.getAuthClass();
				application_session  = xs.getSessionClass();
				application_crypt = xs.getSecurityClass();
				application_crypt_level = xs.getSecurityLevel();
				application_notfound = xs.getPagenotfoundPage();
				application_error = xs.getErrorPage();
				application_http = xs.getSiteWWW();
				application_https = xs.getSiteWWWS();
				application_image = xs.getImageServer();
				application_image_path = xs.getImagePath();
				application_index_page = xs.getIndexPage();
				application_role = xs.getRole();
			}
		}


		WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();	
		BizLogicXmlResource bizXmlResource = BizLogicXmlResource.getInstance();
		AutoSeq autoseq = new AutoSeq();
		ViewXmlResource viewXmlResource = ViewXmlResource.getInstance();
		
		WebActionCollection webActionCollection = null;
		BusinessCollection businessCollection = null;
		
		if (strCode.equals("ins"))
		{		    
		    if(	strCode.equals("ins"))
		    {
				strActColName = autoseq.getWACollectionSeq();	
				webActionCollection = xmlResource.createActionCollection(strActColName);
			}
			else
			{
				webActionCollection = xmlResource.getWebActionCollection(strActColName);
			}
			webActionCollection.setWEBACTION_KOR_NAME(strActColKorName);
			webActionCollection.hasOwner(strSessionValue);
			if(xs != null)
			{
				xs.addWacList(strActColName,null);
				xsm.saveXtremeSite(xs);
				xsm.save(xs);
				xsm.release();
			}
		}
	    else if(strCode.equals("addpage"))
		{
			webActionCollection = xmlResource.getWebActionCollection(strActColName);
			WebAction action = new WebAction();
			action.setNAME(autoseq.getWActionSeq());
			action.setKOR_NAME(strActKorName);
			action.setOWNER(strSessionValue);
			webActionCollection.addWebAction(action);
		}
		else if(strCode.equals("removepage"))
		{
			xmlResource.removeWebActionEqualsActionName(strActColName,strActName);
		}
		xmlResource.save();
		xmlResource.release();


	} catch (Exception e) {
	    e.printStackTrace();
		e.printStackTrace();
		out.println(e.toString());
	}
%>
