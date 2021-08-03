<%@ page contentType="text/xml; charset=UTF-8" %><%@page pageEncoding="UTF-8" %><%@ page import="java.util.*"%><%@ page import="java.net.*"%><%@ page import="com.stuko.anaconda.XmlConfig.*"%><%@ page import="com.stuko.anaconda.business.*"%><%@ page import="com.stuko.anaconda.value.*"%><%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%><%@ page import="com.stuko.anaconda.webeditor.file.*"%><%@ page import="com.stuko.anaconda.util.InitClass"%><%
	String strCode 	= request.getParameter("code");
	String strSearch	= request.getParameter("search");

	String strName	= request.getParameter("ui_name") != null ? URLDecoder.decode(request.getParameter("ui_name"),"UTF-8") : request.getParameter("ui_name");
	String strValue	= request.getParameter("ui_value") != null ? URLDecoder.decode(request.getParameter("ui_value"),"UTF-8") : request.getParameter("ui_value");
	String strType  = request.getParameter("ui_type");
	String strKey  = request.getParameter("ui_key");
	String strStyle  = request.getParameter("ui_style");
	String strClass  = request.getParameter("ui_class");
	String strRtn = "";
	try
	{
		BusinessData businessData = (BusinessData)request.getAttribute(InitClass.getBusinessDataValue());
		DefaultXmlResource res = DefaultXmlResource.getInstance();
		if(strCode.equals("remove"))
		{
			DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_UI);
			if(col != null)
			{
				col.removeDefaultXmlData(strKey);
			}
			res.save(col);
			strRtn = res.httpXmlData(businessData,col);
		}
		else if(strCode.equals("save_page"))
		{
			String filelist = request.getParameter("filelist");
			String path = request.getParameter("path");
			String[] list = filelist.split(",");
			FileManager fm = new FileManager();
			StringBuffer sb = new StringBuffer();
			for(int i = 0; i < list.length; i++)
			{
				String file_name = list[i];
				sb.append("<!------------------------------------------------------------------------>\n");
				sb.append("<!------------------ ANACONDA UI FILE START ------------------------------>\n");
				sb.append("<!------------------------------------------------------------------------>\n");
				sb.append("<!-- FILE PATH : " +file_name+ " -->\n");
				sb.append("<!------------------------------------------------------------------------>\n");
				sb.append(fm.getJSPFile(file_name));
				sb.append("\r\n");
				sb.append("<!-------------------ANACONDA UI FILE END -------------------------------->\n");
				sb.append("\r\n");
				sb.append("\r\n");
			}
			fm.saveJSPFile(path,sb.toString());
		}
		else if(strCode.equals("create"))
		{
			DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_UI);
			if(col == null)
			{
				col = new DefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_UI);
				res.addDefaultXmlDataCollection(col);
			}
			DefaultXmlData dxd = new DefaultXmlData();
			dxd.setTYPE("UI");
			dxd.set("value_type",strType);
			dxd.set("name",strName);
			dxd.set("value",strValue);
			dxd.set("ui_style",strStyle);
			dxd.set("ui_class",strClass);
			if(strType.equals("panel"))
			{
				String strRow = request.getParameter("panel_row");
				String strCol = request.getParameter("panel_col");
				dxd.set("panel_row",strRow);
				dxd.set("panel_col",strCol);
			}
			
			col.addDefaultXmlData(dxd);
			res.save(col);
			strRtn = res.httpXmlData(businessData,col);
		}
		else if(strCode.equals("update"))
		{
			DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_UI);
			if(col != null)
			{
				DefaultXmlData dxd = col.getDefaultXmlData(strKey);
				dxd.setTYPE("UI");
				dxd.set("value_type",strType);
				dxd.set("name",strName);
				dxd.set("value",strValue);
				dxd.set("ui_style",strStyle);
				dxd.set("ui_class",strClass);
				if(strType.equals("panel"))
				{
					String strRow = request.getParameter("panel_row");
					String strCol = request.getParameter("panel_col");
					dxd.set("panel_row",strRow);
					dxd.set("panel_col",strCol);
				}
				res.save(col);
			}
			strRtn = res.httpXmlData(businessData,col);
		}
		else if(strCode.equals("find"))
		{
			DefaultXmlResource resource = DefaultXmlResource.getInstance();
			DefaultXmlData data = null;
			DefaultXmlDataCollection dxdc = null;
			DefaultXmlDataCollection collection = new DefaultXmlDataCollection("Response");
			dxdc = resource.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_UI);
			Iterator subIt = dxdc.iterator();
			for(;subIt.hasNext();)
			{
				data = (DefaultXmlData)subIt.next();
				if(data.toString().indexOf(strSearch) >= 0)
				{
					collection.addDefaultXmlData(data);
				}
			}
			strRtn = resource.httpXmlData(businessData,collection);
		}
		else if(strCode.equals("ui_extend_save"))
		{
			DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_UI);
			if(col != null)
			{
				String strAreaName = request.getParameter("ui_area_name");
				String strAreaValue = request.getParameter("ui_area_value");
				DefaultXmlData dxd = col.getDefaultXmlData(strKey);
				if(dxd != null)
				{
					dxd.set(strAreaName,strAreaValue);
					//dxd.setFieldValue(strAreaName,strAreaValue);
					res.save(col);
				}
			}
			strRtn = res.httpXmlData(businessData,col);
		}
		else if(strCode.equals("ui_extend_remove"))
		{
			DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_UI);
			if(col != null)
			{
				String strAreaName = request.getParameter("ui_area_name");
				String strAreaValue = request.getParameter("ui_area_value");
				DefaultXmlData dxd = col.getDefaultXmlData(strKey);
				if(dxd != null)
				{
					dxd.remove(strAreaName);
					//dxd.getBusinessData().removeBusinessItem(strAreaName);
					res.save(col);
				}
			}	
			strRtn = res.httpXmlData(businessData,col);
		}
		else if(strCode.equals("get_ui_extend"))
		{
			DefaultXmlResource resource = DefaultXmlResource.getInstance();
			DefaultXmlData data = null;
			DefaultXmlDataCollection dxdc = null;
			DefaultXmlDataCollection collection = new DefaultXmlDataCollection("Response");
			dxdc = resource.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_UI);
			data = dxdc.getDefaultXmlData(strKey);
			collection.addDefaultXmlData(data);
			strRtn = resource.httpXmlData(businessData,collection);			
		}
		else if(strCode.equals("search"))
		{
			String searchKey = request.getParameter("search_key_word");
			DefaultXmlResource resource = DefaultXmlResource.getInstance();
			DefaultXmlDataCollection dxdc = null;
			dxdc = resource.searchUI(searchKey);
			// dxdc = resource.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_UI);
			strRtn = resource.httpXmlData(businessData,dxdc);			
		}
		else if(strCode.equals("copy"))
		{
			DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_UI);
			if(col != null)
			{
				DefaultXmlData dxd = col.getDefaultXmlData(strKey);
				if(dxd != null)
				{
					DefaultXmlData tmp = new DefaultXmlData();
					tmp.setTYPE(dxd.getTYPE());
					tmp.setDESC(dxd.getDESC());
					tmp.setCOLLECTION_NAME(dxd.getCOLLECTION_NAME());
					Set set = dxd.keySet();
					Iterator it = set.iterator();
					for(;it.hasNext();)
					{
						String tmpKey = (String)it.next();
						String tmpValue = dxd.getData(tmpKey);
						if(tmpKey.equals("name"))
						{
							tmpValue = "copy of " + tmpValue;
						}
						tmp.set(tmpKey,tmpValue);
					}
					col.addDefaultXmlData(tmp);
					res.save(col);
					strRtn = res.httpXmlData(businessData,col);
				}
			}
		}
		out.print(strRtn);
		ExceptionCenter.debug(strRtn);
	} 
	catch (Exception e) 
	{
		ExceptionCenter.catchException(e);
	}
%>
