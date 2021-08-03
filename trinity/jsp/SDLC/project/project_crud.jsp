<%@ page contentType="text/html; charset=UTF-8" %><%@page pageEncoding="UTF-8" %><%@ page import="java.util.*"%><%@ page import="java.net.*"%><%@ page import="com.stuko.anaconda.XmlConfig.*"%><%@ page import="com.stuko.anaconda.business.*"%><%@ page import="com.stuko.anaconda.value.*"%><%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%><%@ page import="com.stuko.anaconda.util.*"%><%
	
	String dfdx_name = (String)request.getAttribute("dfdx_name");
	String dfdx_type = (String)request.getAttribute("dfdx_type");
	String subject_name = (String)request.getAttribute("subject_name");
	String[][] array_data_list = (String[][])request.getAttribute("array_data_list");
	String[][] array_link = (String[][])request.getAttribute("array_link");
	String[] array_link_delim = (String[])request.getAttribute("array_link_delim");
	String[] array_insert_cols = (String[])request.getAttribute("array_insert_cols");
	String[] array_insert_datas = (String[])request.getAttribute("array_insert_datas");
	String[][] array_insert_form = (String[][])request.getAttribute("array_insert_form");
	
	String strCode 	= request.getParameter("code");
	String strSearch	= request.getParameter("search");
	String strKey = request.getParameter("key");
	String strRtn = "";
	try
	{
		BusinessData businessData = (BusinessData)request.getAttribute(InitClass.getBusinessDataValue());
		DefaultXmlResource res = DefaultXmlResource.getInstance();
		if(strCode.equals("remove"))
		{
			DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(dfdx_name);
			if(col != null)
			{
				col.removeDefaultXmlData(strKey);
			}
			res.save(col);
			strRtn = res.httpXmlData(businessData,col);
		}
		else if(strCode.equals("create"))
		{
			DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(dfdx_name);
			if(col == null)
			{
				col = new DefaultXmlDataCollection(dfdx_name);
			}
			res.addDefaultXmlDataCollection(col);
			DefaultXmlData dxd = new DefaultXmlData();
			dxd.setTYPE(dfdx_type);
			for(int i = 0; i < array_insert_form.length ; i++)
			{
				String[] arr_data = array_insert_form[i];
				dxd.set(arr_data[2],request.getParameter(arr_data[2]));
			}
			
			col.addDefaultXmlData(dxd);
			res.save(col);
			strRtn = res.httpXmlData(businessData,col);
		}
		else if(strCode.equals("update"))
		{
			DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(dfdx_name);
			if(col != null)
			{
				DefaultXmlData dxd = col.getDefaultXmlData(strKey);
				dxd.setTYPE(dfdx_type);
				for(int i = 0; i < array_insert_form.length ; i++)
				{
					String[] arr_data = array_insert_form[i];
					dxd.set(arr_data[2],request.getParameter(arr_data[2]));
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
			dxdc = resource.getDefaultXmlDataCollection(dfdx_name);
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
		else if(strCode.equals("search"))
		{
			String searchKey = request.getParameter("search_key_word");
			DefaultXmlResource resource = DefaultXmlResource.getInstance();
			DefaultXmlDataCollection dxdc = null;
			dxdc = resource.searchUI(searchKey);
			strRtn = resource.httpXmlData(businessData,dxdc);			
		}
		// out.print(strRtn);
	} 
	catch (Exception e) 
	{
		ExceptionCenter.catchException(e);
	}
%>
<html>
<body>
<script language="javascript">
document.location.href = "/Anaconda.do?CMD=CMD_SEQ_103268080161277556302281";
</script>
</body>
</html>
