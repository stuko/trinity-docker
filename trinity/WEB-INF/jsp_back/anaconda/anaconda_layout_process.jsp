<%@ page contentType="text/xml; charset=UTF-8" %><%@page pageEncoding="UTF-8" %><%@ page import="java.net.*"%><%@ page import="java.util.*"%><%@ page import="java.net.*"%><%@ page import="com.stuko.anaconda.XmlConfig.*"%><%@ page import="com.stuko.anaconda.business.*"%><%@ page import="com.stuko.anaconda.value.*"%><%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%><%@ page import="com.stuko.anaconda.util.InitClass"%><%
	String strCode 	= request.getParameter("code");
	String strName	= request.getParameter("layout_name") != null ? URLDecoder.decode(request.getParameter("layout_name"),"UTF-8") : request.getParameter("layout_name");
        String strLayoutID  = request.getParameter("layout_id");
	String strCss	= request.getParameter("layout_css") != null ? URLDecoder.decode(request.getParameter("layout_css"),"UTF-8") : request.getParameter("layout_css");
	String strJs	= request.getParameter("layout_js") != null ? URLDecoder.decode(request.getParameter("layout_js"),"UTF-8") : request.getParameter("layout_js");

	String strCssContents	= request.getParameter("css_contents") != null ? URLDecoder.decode(request.getParameter("css_contents"),"UTF-8") : request.getParameter("css_contents");
	String strJsContents	= request.getParameter("js_contents") != null ? URLDecoder.decode(request.getParameter("js_contents"),"UTF-8") : request.getParameter("js_contents");



	String strStructure = request.getParameter("structure") == null ? "div" : request.getParameter("structure"); 
	String strTitle	= request.getParameter("layout_title") != null ? URLDecoder.decode(request.getParameter("layout_title"),"UTF-8") : request.getParameter("layout_title");
	String strCol  = request.getParameter("layout_col");
	String strRow  = request.getParameter("layout_row");
	String strLayoutStyle  = request.getParameter("layout_style");
	String strLayoutClass  = request.getParameter("layout_class");
	String strKey  = request.getParameter("key");
	String strStyle  = request.getParameter("area_style");
	String strClass  = request.getParameter("area_class");
	String x  = request.getParameter("x");
	String y  = request.getParameter("y");
	String strUseAnacondaUIYN = request.getParameter("area_use_anaconda_ui_yn");
	String strAreaFile = request.getParameter("area_file") != null ? URLDecoder.decode(request.getParameter("area_file"),"UTF-8") : request.getParameter("area_file");
	String strRtn = "";
	try
	{
		BusinessData businessData = (BusinessData)request.getAttribute(InitClass.getBusinessDataValue());
		DefaultXmlResource res = DefaultXmlResource.getInstance();
		if(strCode.equals("remove"))
		{
			DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_LAYOUT);
			if(col != null)
			{
				DefaultXmlData dxd = col.getDefaultXmlData(strKey);
				col.remove(dxd);
				res.save(col);
			}
		}
		else if(strCode.equals("removeLayoutAndUI"))
		{
			String strLayoutName = request.getParameter("layout_name");
			String strUIName = request.getParameter("ui_name");
			String strAreaKey = request.getParameter("area_key");
			String strAreaName = URLDecoder.decode(request.getParameter("area_name"),"UTF-8");
			
			DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_AREA);
			if(col != null)
			{
				DefaultXmlData dxd = null;
				if(BusinessHelper.checkBusinessNull(strAreaKey))
				{
					col.removeDefaultXmlData(strAreaKey);
					res.save(col);
				}
			}
		}
		else if(strCode.equals("saveLayoutAndUI"))
		{
			String strLayoutName = request.getParameter("layout_name");
			String strUIName = request.getParameter("ui_name");
			String strAreaKey = request.getParameter("area_key");
			String strAreaName = URLDecoder.decode(request.getParameter("area_name"),"UTF-8");
			String strLayoutIsPanel = request.getParameter("layout_is_panel");
			String strColSpan = request.getParameter("area_colspan");
			String strID = request.getParameter("area_id");
			
			DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_AREA);
			if(col == null)
			{
				col = new DefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_AREA);
				res.addDefaultXmlDataCollection(col);
			}
			
			DefaultXmlData dxd = null;
			if(BusinessHelper.checkBusinessNull(strAreaKey))
			{
				dxd = col.getDefaultXmlData(strAreaKey);
			}
			else
			{
				dxd = new DefaultXmlData(); 	
				col.addDefaultXmlData(dxd);
			}
			dxd.setTYPE("AREA");
			if(BusinessHelper.checkBusinessNull(strLayoutIsPanel) && strLayoutIsPanel.equals("true"))
				dxd.set("layout_is_panel","true");
			dxd.set("layout_name",strLayoutName);
			dxd.set("ui_name",strUIName);
			dxd.set("area_name",strAreaName);
			dxd.set("area_style",strStyle);
			dxd.set("area_class",strClass);
			dxd.set("x",x);
			dxd.set("y",y);
			dxd.set("value",strAreaFile);
			dxd.set("use_anaconda_ui_yn",strUseAnacondaUIYN);
			dxd.set("area_colspan",strColSpan);
			dxd.set("area_id",strID);
			
			res.save(col);
		}
		else if(strCode.equals("create"))
		{
			DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_LAYOUT);
			if(col == null)
			{
				col = new DefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_LAYOUT);
				res.addDefaultXmlDataCollection(col);
			}
			DefaultXmlData dxd = new DefaultXmlData();
			dxd.setTYPE("LAYOUT");
			dxd.set("css",strCss);
                        dxd.set("cssContents",strCssContents);
                        dxd.set("id",strLayoutID);

			dxd.set("name",strName);
			dxd.set("structure",strStructure);
			dxd.set("js",strJs);
			dxd.set("jsContents",strJsContents);
			dxd.set("title",strTitle);
			dxd.set("style",strLayoutStyle);
			dxd.set("class",strLayoutClass);
			dxd.set("col",strCol);
			dxd.set("row",strRow);
			col.addDefaultXmlData(dxd);
			res.save(col);
		}
		else if(strCode.equals("copy"))
		{
			DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_LAYOUT);
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
		else if(strCode.equals("update"))
		{
			DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_LAYOUT);
			if(col != null)
			{
				DefaultXmlData dxd = col.getDefaultXmlData(strKey);
				dxd.setTYPE("LAYOUT");
				dxd.set("css",strCss);
                                dxd.set("cssContents",strCssContents);
                                dxd.set("id",strLayoutID);
				dxd.set("js",strJs);
                                dxd.set("jsContents",strJsContents);
				dxd.set("title",strTitle);
				dxd.set("style",strLayoutStyle);
				dxd.set("class",strLayoutClass);
				dxd.set("name",strName);
				dxd.set("structure",strStructure);
				dxd.set("col",strCol);
				dxd.set("row",strRow);
				res.save(col);
			}
		}
		else if(strCode.equals("saveBodyArea"))
		{
			String strLayoutName = request.getParameter("layout_name");
			String strUIName = request.getParameter("ui_name");
			String strAreaKey = request.getParameter("area_key");
			String strAreaName = request.getParameter("area_name");

			DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_AREA);
			if(col == null)
			{
				col = new DefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_AREA);
				res.addDefaultXmlDataCollection(col);
			}
			
			DefaultXmlData dxd = null;
			if(BusinessHelper.checkBusinessNull(strAreaKey))
			{
				dxd = col.getDefaultXmlData(strAreaKey);
			}
			else
			{
				dxd = new DefaultXmlData(); 	
				col.addDefaultXmlData(dxd);
			}
			dxd.setTYPE("AREA");
			dxd.set("layout_name",strLayoutName);
			dxd.set("ui_name",strUIName);
			dxd.set("area_name",strAreaName);
			dxd.set("isbody","true");
			dxd.set("area_style",strStyle);
			dxd.set("area_class",strClass);
			dxd.set("x",x);
			dxd.set("y",y);
			dxd.set("value",strAreaFile);
			dxd.set("use_anaconda_ui_yn",strUseAnacondaUIYN);
			res.save(col);
		}
		else if(strCode.equals("find"))
		{
		}
		out.print(strRtn);
	} 
	catch (Exception e) 
	{
		ExceptionCenter.catchException(e);
	}
%>
