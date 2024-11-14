<%@ page contentType="text/xml; charset=UTF-8" %><%@ page import="java.io.File"%><%@ page import="java.io.FileInputStream"%><%@ page import="java.util.Enumeration"%><%@ page import="java.util.Iterator"%><%@ page import="java.util.Properties"%><%@ page import="com.stuko.anaconda.XmlConfig.*"%><%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%><%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%><%@ page import="com.stuko.anaconda.view.*"%><%@ page import="com.stuko.anaconda.value.*"%><%@ page import="com.stuko.anaconda.business.*"%><%@ page import="com.stuko.anaconda.webeditor.file.*"%><%@ page import="com.stuko.anaconda.util.InitClass"%><%@ page import="java.util.*"%><%@ page import="java.net.*"%><%
	request.setCharacterEncoding("EUC-KR");
	String strColName= request.getParameter("CollectionName");
	String strLayout = request.getParameter("Layout");
	String strLayoutType = request.getParameter("LayoutType");
	String strForward = request.getParameter("Forward");
	String strBody = request.getParameter("Body");
	String strTop = request.getParameter("Top");
	String strLeft = request.getParameter("Left");
	String strRight = request.getParameter("Right");
	String strFooter = request.getParameter("Footer");
	String strDesc = request.getParameter("Desc") != null ? URLDecoder.decode(request.getParameter("Desc"),"UTF-8") : request.getParameter("Desc");
	String strGubun = request.getParameter("GUBUN");
	String strType = request.getParameter("VIEW_TYPE");
	String owner = request.getParameter("owner");
	String strForwardKorName = request.getParameter("ForwardKorName") != null ? URLDecoder.decode(request.getParameter("ForwardKorName"),"UTF-8") : request.getParameter("ForwardKorName");
	String strRtn = "";
	try
	{

		BusinessData businessData = (BusinessData)request.getAttribute(InitClass.getBusinessDataValue());
		ViewXmlResource xmlResource = ViewXmlResource.getInstance();	
		if(strGubun.equals("R"))
		{
			View view = xmlResource.createView  ( strColName
									 ,strForwardKorName
	    							 ,strForward
	    							 ,strForwardKorName
 	    							 ,strLayout
    					             ,strBody
    					             ,strLeft
    					             ,strRight
    					             ,strTop
    					             ,strFooter
    					             ,strDesc
									 ,strType);
			ViewCollection viewCollection = xmlResource.getViewCollection(view.getVIEW_COLLECTION_NAME());
			xmlResource.save(viewCollection);
			xmlResource.release();
		}
		else if(strGubun.equals("U"))
		{
			String strXtremeUseYN = request.getParameter("XtremeUseYN");
			if(!"N".equals(strXtremeUseYN)) strXtremeUseYN = "Y";
                           
			View view = xmlResource.searchView(strForward.trim());
			view.setView(strForward, strLayout, strBody, strLeft, strRight, strTop, strFooter, strDesc);
			view.setVIEW_TYPE(strType);
			view.setViewItem(BlankField.LAYOUT_TYPE,strLayoutType);
			view.setViewItem(InitClass.XTREME_USE_YN,strXtremeUseYN);
			view.setFORWARD_KOR_NAME(strForwardKorName);
			ViewCollection viewCollection = xmlResource.getViewCollection(view.getVIEW_COLLECTION_NAME());
			xmlResource.save(viewCollection);
                        System.out.println("###############-->" + view.toString()); 
			// xmlResource.save();
			xmlResource.release();
		}
		else if(strGubun.equals("D"))
		{
			ViewCollection viewCollection = xmlResource.removeView(strForward);
			xmlResource.save(viewCollection);
			xmlResource.release();
		}
		else if(strGubun.equals("S"))
		{
			FileManager fm = new FileManager();
			//String contents = request.getParameter("contents") != null ? URLDecoder.decode(request.getParameter("contents"),"UTF-8") : request.getParameter("contents");
			//String path = request.getParameter("path") != null ? URLDecoder.decode(request.getParameter("path"),"UTF-8") : request.getParameter("path");
			String contents = request.getParameter("contents");
			String path = request.getParameter("path");
			fm.saveJSPFile(path , contents);
		}
		else if(strGubun.equals("M"))
		{
			FileManager fm = new FileManager();
			String path = request.getParameter("path") != null ? URLDecoder.decode(request.getParameter("path"),"UTF-8") : request.getParameter("path");
			fm.removeJSPFile(path);
		}
		else if(strGubun.equals("C"))
		{
			xmlResource.copyView(strColName,strForward);
			xmlResource.save();
			xmlResource.release();
		}
		else if(strGubun.equals("SE"))
		{
           StringBuffer strContents = new StringBuffer();
			strContents.append(""+"<"+"%"+"@ page import=\"com.stuko.anaconda.value.BlankField\" "+"%"+">"+"\n");
			strContents.append(""+"<"+"%"+"@ page import=\"java.io.File\""+"%"+">"+"\n");
			strContents.append(""+"<"+"%"+"@ page import=\"java.io.FileInputStream\""+"%"+">"+"\n");
			strContents.append(""+"<"+"%"+"@ page import=\"java.util.Enumeration\""+"%"+">"+"\n");
			strContents.append(""+"<"+"%"+"@ page import=\"java.util.Iterator\""+"%"+">"+"\n");
			strContents.append(""+"<"+"%"+"@ page import=\"java.util.Properties\""+"%"+">"+"\n");
			strContents.append(""+"<"+"%"+"@ page import=\"com.stuko.anaconda.XmlConfig.*\""+"%"+">"+"\n");
			strContents.append(""+"<"+"%"+"@ page import=\"com.stuko.anaconda.Exception.ExceptionCenter\""+"%"+">"+"\n");
			strContents.append(""+"<"+"%"+"@ page import=\"com.stuko.anaconda.Exception.XmlProcessingException\""+"%"+">"+"\n");
			strContents.append(""+"<"+"%"+"@ page import=\"com.stuko.anaconda.action.WebAction\""+"%"+">"+"\n");
			strContents.append(""+"<"+"%"+"@ page import=\"com.stuko.anaconda.action.WebActionCollection\""+"%"+">"+"\n");
			strContents.append(""+"<"+"%"+"@ page import=\"com.stuko.anaconda.filter.*\""+"%"+">"+"\n");
			strContents.append(""+"<"+"%"+"@ page import=\"com.stuko.anaconda.front.*\""+"%"+">"+"\n");
			strContents.append(""+"<"+"%"+"@ page import=\"com.stuko.anaconda.value.*\""+"%"+">"+"\n");
			strContents.append(""+"<"+"%"+"@ page import=\"com.stuko.anaconda.business.*\""+"%"+">"+"\n");
			strContents.append(""+"<"+"%"+"@ page import=\"com.stuko.anaconda.action.*\""+"%"+">"+"\n");
			strContents.append(""+"<"+"%"+"@ page import=\"com.stuko.anaconda.xtreme.role.*\""+"%"+">"+"\n");
			strContents.append(""+"<"+"%"+"@ page import=\"com.stuko.anaconda.view.*\""+"%"+">"+"\n");
			strContents.append(""+"<"+"%"+"@ page import=\"com.stuko.anaconda.util.InitClass\""+"%"+">"+"\n");
			strContents.append(""+"<"+"%"+"@ page import=\"java.util.*\""+"%"+">"+"\n");
			strContents.append(""+"<"+"%"+"@ page contentType=\"text/html; charset=UTF-8\" pageEncoding=\"euc-kr\" "+"%"+">"+"\n");
			strContents.append(""+"<"+"%"+"\n");
			strContents.append("/**\n");
			strContents.append("// ---------------------------------------------------------------------------------------\n");
			strContents.append("// JSP 코딩 규칙\n");
			strContents.append("// ---------------------------------------------------------------------------------------\n");
			strContents.append("\n");
			strContents.append("out.println((프로세스결과타입)RequestHelper.getReturnValue(request,\"프로세스 이름\"));\n");
			strContents.append("Object object = request.getAttribute(InitClass.getReturnValue());\n");
			strContents.append("Object session_object = request.getAttribute(InitClass.getSessionValue());\n");
			strContents.append("Object businss_object = request.getAttribute(InitClass.getBusinessDataValue());\n");
			strContents.append("\n");
			strContents.append("out.println((프로세스결과타입)RequestHelper.getReturnValue(request,\"프로세스 이름\");\n");
			strContents.append("BusinessCollection bc = RequestHelper. getBusinessCollection(request,\"프로세스 이름\");\n");
			strContents.append("BusinessCollection bc = RequestHelper. getBusinessCollection(request,\"프로세스 이름\");\n");
			strContents.append("BusinessHelper helper = new BusinessHelper();\n");
			strContents.append("helper.convertToTableRow(bc);\n");
			strContents.append("\n");
			strContents.append("for(int i = 0; i < bc.size(); i++)\n");
			strContents.append("{\n");
			strContents.append("     BusinessData bd = bc.getBusinessData(i);\n");
			strContents.append("}\n");
			strContents.append("\n");
			strContents.append("**/\n");
			strContents.append(""+"%"+">"+"\n");
			strContents.append("\n");
			strContents.append("<div class=\"post\">\n");
			strContents.append("\n");
			strContents.append("<div class=\"title-right\">\n");
			strContents.append("<h2><font><b>제목</b></font>\n");
			strContents.append("</div>\n");
			strContents.append("\n");
			strContents.append("<div>\n");
			strContents.append("<p>소제목</p>\n");
			strContents.append("</div>\n");
			strContents.append("\n");
			strContents.append("<div>\n");
			strContents.append("<table border=\"1\">\n");
			strContents.append("   <tr>\n");
			strContents.append("      <td></td>\n");
			strContents.append("      <td></td>\n");
			strContents.append("   </tr>\n");
			strContents.append("   <tr>\n");
			strContents.append("      <td></td>\n");
			strContents.append("      <td></td>\n");
			strContents.append("   </tr>\n");
			strContents.append("</table>\n");
			strContents.append("</div>\n");
			strContents.append("\n");
			strContents.append("</div>\n");

			String strViewKey = request.getParameter("viewKey");
			String strAreaName = request.getParameter("area_name");
			String strAreaPath = request.getParameter("area_path");
			View view = xmlResource.searchView(strViewKey);
			view.setViewItem(strAreaName,strAreaPath);
			xmlResource.save();
			InitClass mInitClass = InitClass.getInstance();
			FileManager fm = new FileManager();
			fm.saveFile(strContents.toString(),mInitClass.getPath(InitClass.ROOT) + strAreaPath);
			xmlResource.release();
			
		}
		else if(strGubun.equals("RE"))
		{
			String strViewKey = request.getParameter("viewKey");
			String strAreaName = request.getParameter("area_name");
			String strAreaPath = request.getParameter("area_path");
			View view = xmlResource.searchView(strViewKey);

			view.remove(strAreaName);
			xmlResource.save();
			xmlResource.release();			
		}
		else if(strGubun.equals("searchBasicLayout"))
		{
			DefaultXmlResource resource = DefaultXmlResource.getInstance();
			String strSearch = request.getParameter("search") != null ? URLDecoder.decode(request.getParameter("search"),"UTF-8") : request.getParameter("search");
			// String strSearch = request.getParameter("search");
			String strSearchKey = request.getParameter("key");
			//ViewCollection viewCollection = xmlResource.search(strSearchKey,strSearch);
			ViewCollection viewCollection = xmlResource.search(strSearch);
			viewCollection.setVIEWCOLLECTION_NAME("Response");
			strRtn = resource.httpXmlDataOverAll(businessData,viewCollection);
		}
		else if(strGubun.equals("saveAnacondaLayout"))
		{
			String strViewKey = request.getParameter("viewKey");

                        String strXtremeUseYN = request.getParameter("XtremeUseYN");
			if(!"N".equals(strXtremeUseYN)) strXtremeUseYN = "Y";
			
			String s1 = request.getParameter("Layout");
			String s2 = request.getParameter("Body");
			String s3 = request.getParameter("AreaFile");
			View view = xmlResource.searchView(strViewKey);
			// view.setVIEW_TYPE(strType);
			view.setViewItem(BlankField.LAYOUT_TYPE,BlankField.ANACONDA_VIEW);
			view.setViewItem(BlankField.VIEW_LAYOUT,s1);
			view.setViewItem(BlankField.VIEW_BODY,s2);
			view.setViewItem(InitClass.DEFAULT_AREA,s3);
                        view.setViewItem(InitClass.XTREME_USE_YN,strXtremeUseYN);
			xmlResource.save();
			xmlResource.release();
		}
		else if(strGubun.equals("saveHydraLayout"))
		{
			String strViewKey = request.getParameter("viewKey");
                        
                        String strXtremeUseYN = request.getParameter("XtremeUseYN");
			if(!"N".equals(strXtremeUseYN)) strXtremeUseYN = "Y";
			// String s1 = request.getParameter("Layout");
			String s2 = request.getParameter("Body");
			View view = xmlResource.searchView(strViewKey);
			// view.setVIEW_TYPE(BlankField.PARENT_VIEW);
			// view.setVIEW_TYPE(strType);
			view.setViewItem(BlankField.LAYOUT_TYPE,BlankField.PARENT_VIEW);
			// view.setViewItem(BlankField.VIEW_LAYOUT,s1);
			view.setViewItem(BlankField.VIEW_BODY,s2);
                        view.setViewItem(InitClass.XTREME_USE_YN,strXtremeUseYN);

			xmlResource.save();
			xmlResource.release();
		}
		else if(strGubun.equals("change_all_user"))
		{
			xmlResource = ViewXmlResource.getInstance();
			Iterator it =	xmlResource.getViewCollection();
			for(;it.hasNext();)
			{
				ViewCollection vc = (ViewCollection)it.next();
				Iterator iterator = vc.iterator();
				for(;iterator.hasNext();)
				{
					View view = (View)iterator.next();
					view.setOWNER(owner);
				}
			}
			xmlResource.save();
			xmlResource.release();
		}
				
 		if(strRtn != null && strRtn.length() > 0 ) {
                   out.println(strRtn);
                   return;
                }else{
                   out.println("{Result : \"Success\"}");
                }


	} catch (Exception e) {
		ExceptionCenter.catchException(e);
	}
%>

