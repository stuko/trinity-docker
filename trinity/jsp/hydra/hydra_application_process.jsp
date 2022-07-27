<%@ page contentType="text/xml; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.xtreme.site.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%
	BusinessHelper helper = new BusinessHelper();
	AutoSeq seq = new AutoSeq();
	XtremeSiteManager xsm = XtremeSiteManager.getInstance();
	XtremeSite xs = null;
	
	String application_domain = URLDecoder.decode(helper.nullToString(request.getParameter("application_domain")),"utf-8");
	String application_index_page = URLDecoder.decode(helper.nullToString(request.getParameter("application_index_page")),"utf-8");
	String application_context = URLDecoder.decode(helper.nullToString(request.getParameter("application_context")),"utf-8");
	
	String application_key = URLDecoder.decode(helper.nullToString(request.getParameter("application_key")),"utf-8");
	String application_name =  URLDecoder.decode(helper.nullToString(request.getParameter("application_name")),"utf-8");
	String application_code = URLDecoder.decode(helper.nullToString(request.getParameter("application_code")),"utf-8");
	// String application_domain = "";
	// String application_context  = "";
	String application_session  =  URLDecoder.decode(helper.nullToString(request.getParameter("application_session")),"utf-8");
	String application_auth  =  URLDecoder.decode(helper.nullToString(request.getParameter("application_auth")),"utf-8");
	String application_crypt =  URLDecoder.decode(helper.nullToString(request.getParameter("application_crypt")),"utf-8");
	String application_crypt_level =  URLDecoder.decode(helper.nullToString(request.getParameter("application_crypt_level")),"utf-8");
	String application_notfound =  URLDecoder.decode(helper.nullToString(request.getParameter("application_notfound")),"utf-8");
	String application_error = URLDecoder.decode(helper.nullToString(request.getParameter("application_error")),"utf-8");
	String application_http =  URLDecoder.decode(helper.nullToString(request.getParameter("application_http")),"utf-8");
	String application_https =  URLDecoder.decode(helper.nullToString(request.getParameter("application_https")),"utf-8");
	String application_image =  URLDecoder.decode(helper.nullToString(request.getParameter("application_image")),"utf-8");
	String application_image_path = URLDecoder.decode(helper.nullToString(request.getParameter("application_image_path")),"utf-8");
	String application_role = URLDecoder.decode(helper.nullToString(request.getParameter("application_role")),"utf-8");
	String code = URLDecoder.decode(helper.nullToString(request.getParameter("code")),"utf-8");
	String strRtn = "";
	try
	{
                String me = "Default";
                // System.out.println("#### CODE #####");
                // System.out.println(code);
                // System.out.println("#### CODE #####");
		BusinessData businessData = (BusinessData)request.getAttribute(InitClass.getBusinessDataValue());
		if(code.equals("save"))
		{
                        me = "save";
			xs = xsm.getSite(application_domain,application_context);
			if(xs == null) xs = new XtremeSite(seq.getXtremeSeq());
			xs.setSiteName(application_name);
			xs.setSiteCode(application_code);
			xs.setDomain(application_domain);
			xs.setIndexPage(application_index_page);
			xs.setContext(application_context);
			xs.setSessionClass(application_session);
			xs.setAuthClass(application_auth);
			xs.setSecurityClass(application_crypt);
			xs.setSecurityLevel(application_crypt_level);
			xs.setPagenotfoundPage(application_notfound);
			xs.setErrorPage(application_error);
			xs.setSiteWWW(application_http);
			xs.setSiteWWWS(application_https);
			xs.setImageServer(application_image);
			xs.setImagePath(application_image_path);
			xs.setRole(application_role);
			xsm.saveXtremeSite(xs);
			xsm.save(xs);
		}
		else if(code.equals("update"))
		{
                        me = "update";
			xs = xsm.getXtremeSite(application_key);
			//xs = xsm.getSite(application_domain,application_context);
			if(xs != null)
			{
				xs.setSiteName(application_name);
				xs.setSiteCode(application_code);
				xs.setDomain(application_domain);
				xs.setIndexPage(application_index_page);
				xs.setContext(application_context);
				xs.setSessionClass(application_session);
				xs.setAuthClass(application_auth);
				xs.setSecurityClass(application_crypt);
				xs.setSecurityLevel(application_crypt_level);
				xs.setPagenotfoundPage(application_notfound);
				xs.setErrorPage(application_error);
				xs.setSiteWWW(application_http);
				xs.setSiteWWWS(application_https);
				xs.setImageServer(application_image);
				xs.setImagePath(application_image_path);
				xs.setRole(application_role);
				// xsm.saveXtremeSite(xs);
				xsm.save(xs);
			}
		}
		else if(code.equals("save_wac"))
		{
                        me = "save_wac";
			// System.out.println("###### SAVE WAC " + application_domain + "/" + application_context + " ######");
			xs = xsm.getSite(application_domain,application_context);
			if(xs != null)
			{
				// System.out.println("############ XS IS NOT NULL ###############");
				String[] wacList = request.getParameterValues("wac_checked_values");
				if(wacList != null)
				{
					HashMap hm = xs.getWacList();
					if(hm == null) 
					{
						hm = new HashMap();
						xs.setWacList(hm);
					}
					// System.out.println("############ WAC IS NOT NULL ###############");
					Set keys = hm.keySet();
					Object[] arrKey = keys.toArray();
					//---------------------------------------------------------------------
					// 1. REMOVE
					//---------------------------------------------------------------------					
 					// 기존 컨텐츠 리스트 기준	
					for(int k=0; k < arrKey.length; k++)
					{
						String strKey = ((String)arrKey[k]).trim();
						boolean isFind = false;
						String strLayout = "";
						// 선택한 컨텐츠 리스트
						for(int i = 0; i < wacList.length; i++)
						{
							ExceptionCenter.debug("WAC="+wacList[i] + strKey);
							// 발견하면, 그대로 놔둠.
							if(strKey.equals(wacList[i].trim()))
							{
								ExceptionCenter.debug("WAC="+wacList[i]);
								isFind = true;
								break;
							}
							// 없으면, 삭제 해야 함.
							else
							{
								isFind = false;
							}
						}
						if(!isFind)
						{
							xs.removeWacList(strKey);
						}
					}
					//---------------------------------------------------------------------
					// 2. ADD
					//---------------------------------------------------------------------	
					// 선택한 컨텐츠 기준
					for(int i = 0; i < wacList.length; i++)
					{
						boolean isFind = false;
						String strLayout = "";
						// 기존 컨텐츠
						for(int k=0; k < arrKey.length; k++)
						{
							String strKey = ((String)arrKey[k]).trim();
							// 존재하면, 놔둠.
							if(strKey.equals(wacList[i].trim()))
							{
								isFind = true;
								break;
							}
							// 없으면, 추가해야 함.
							else
							{
								isFind = false;
							}
						}
						if(!isFind)
						{
							xs.addWacList(wacList[i].trim(),"");
						}
					}
                                              xsm.save(xs);
				}
				else
				{
					xsm.saveXtremeSite(xs);
					xsm.save(xs);
				}
			}
		}
		else if(code.equals("save_layout"))
		{
                        me = "layout";
			// System.out.println("#### SAVE WAC " + application_domain + "/" + application_context + " #####");
			xs = xsm.getSite(application_domain,application_context);
			if(xs != null)
			{
                                me = "xm is not null";
				// System.out.println("############ XS IS NOT NULL ###############");
				String wac_name = request.getParameter("application_wac_name");
				String layout_name = request.getParameter("application_layout");
				xs.addWacList(wac_name,layout_name);
				xsm.saveXtremeSite(xs);
				xsm.save(xs);
			}else{
                           me = "xm is null";
                        }   
		}	
		else if(code.equals("remove"))
		{
                        me = "remove";
			xs = xsm.getXtremeSite(application_key);
			// xs = xsm.getSite(application_domain,application_context);
			if(xs != null)
			{
				xsm.removeXtremeSite(xs);
				xsm.removeXtremeFile(xs.getSiteId());
                                xsm.release();
			}
		}
		out.print("[" + code + "]["+me+"]=" + strRtn);
	} 
	catch (Exception e) 
	{
		e.printStackTrace();
	}
%>
