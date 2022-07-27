<%@ page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.business.BusinessData"%>
<%@ page import="com.stuko.anaconda.business.BusinessItem"%>
<%@ page import="com.stuko.anaconda.business.BusinessCollection"%>

<%
   
      RequestHelper helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
      String strUserId = "";
      Object objEmail = helper.getSession("Email");
      if(objEmail != null){
          strUserId = (String)objEmail;
      }

//공통 파라미터
	String strCode 			= request.getParameter("code");
	String strColBizName	= request.getParameter("colbizname");
        //String strColBizName    = URLDecoder.decode(request.getParameter("colbizname"),"UTF-8");
	String strCount	        = request.getParameter("count");
//등록시 사용하는 파라미터
	String strColKorBizName	= request.getParameter("colKorbizname");
        //String strColKorBizName = URLDecoder.decode(request.getParameter("colKorbizname"),"UTF-8");
	strColKorBizName = (strColKorBizName == null || strColKorBizName.equals("null") ? "" : 	strColKorBizName);


	String strBizName[] 	= request.getParameterValues("bizname");
	String strDesc[] 	= request.getParameterValues("desc");
//수정시 사용하는 파라미터
	String strFieldName[] 		= request.getParameterValues("field_name");
	String strFieldType[] 		= request.getParameterValues("field_type");
	String strFieldValue[] 		= request.getParameterValues("field_value");	
	String str_BizName			= request.getParameter("business_name");	
	String str_class_intercepter			= request.getParameter("class_intercepter");
	str_class_intercepter  = str_class_intercepter == null ? "" : str_class_intercepter;
	String str_aft_intercepter		= request.getParameter("aft_intercepter");
	str_aft_intercepter  = str_aft_intercepter == null ? "" : str_aft_intercepter;
	String str_bef_intercepter	= request.getParameter("bef_intercepter");
	str_bef_intercepter  = str_bef_intercepter == null ? "" : str_bef_intercepter;	
	String str_DataSource		= request.getParameter("data_datasource");
	String str_EjbMethod		= request.getParameter("ejbcreatemethod");
	String str_Factory			= request.getParameter("factory");
	String str_JndiName			= request.getParameter("jndiname");
	String str_JnpInter			= request.getParameter("jnpinterface");
	String str_PojoCls			= request.getParameter("pojo_class");
	String str_ServiceName		= request.getParameter("service_name");

    str_ServiceName = (str_ServiceName == null || str_ServiceName.equals("null") ? "" : 	str_ServiceName);

	String str_BizType			= request.getParameter("biz_type");	
	String str_Url				= request.getParameter("biz_url");
	String strejbhome_interface	= request.getParameter("ejbhome_interface");
	String strejbcreate_method  = request.getParameter("ejbcreate_method");
//캐쉬타임  셋팅하는것	
    String strCacheText  = request.getParameter("cacheText");
	String owner = request.getParameter("owner");

        if(!"".equals(strUserId)) owner = strUserId;

	long long_Cache		= Long.parseLong((strCacheText == null ? "0" : strCacheText));	
%>

<%
	try
	{	
		BizLogicXmlResource xmlResource = BizLogicXmlResource.getInstance();
		BusinessCollection businessCollection = null;
		AutoSeq autoseq = new AutoSeq();
				
		if (strCode.equals("ins")) //subject,webpage 신규등록
		{	
			BusinessData bizdata = null;
			
			if (strColBizName == null || strColBizName.equals("null") || strColBizName.equals(""))
			{
				strColBizName = autoseq.getBCollectionSeq();
			}
			
			businessCollection = new BusinessCollection(strColBizName);			
			businessCollection.setBIZ_COLLECTION_KOR_NAME(strColKorBizName);
			//cache time 셋팅
			businessCollection.setCOUNT(strCount);
			businessCollection.setCACHE_TIME(long_Cache);
			for (int i=0; i<strBizName.length; i++)
			{
				bizdata = new BusinessData();
				bizdata.setBusinessName(strBizName[i]);
				
				if(strDesc[i] != null)
					bizdata.setDESC(strDesc[i]);
			    businessCollection.addBusinessData(bizdata);
			}			
			xmlResource.addBusinessCollection(businessCollection);
			xmlResource.save(businessCollection);
			xmlResource.release();
		} else if (strCode.equals("mod")) {	//subject,webpage 신규등록 후 특정 webpage의 내용들을 변경 및 필드추가 로직
			BusinessData bizdata = null;
			businessCollection = xmlResource.getBusinessCollection(strColBizName);
			businessCollection.setCACHE_TIME(long_Cache);
			businessCollection.setCOUNT(strCount);
			bizdata = businessCollection.getBusinessData(str_BizName);			

			bizdata.setCLASS_INTERCEPTER(str_class_intercepter);
			bizdata.setAFT_INTERCEPTER(str_aft_intercepter);
			bizdata.setBEF_INTERCEPTER(str_bef_intercepter);			
			bizdata.setDATA_DATASOURCE(str_DataSource);
			bizdata.setEJBCreateMethod(str_EjbMethod);			
			bizdata.setFACTORY(str_Factory);
			bizdata.setJNDINAME(str_JndiName);
			bizdata.setJNPINTERFACE(str_JnpInter);
			bizdata.setPOJO_CLASS(str_PojoCls);
			bizdata.setSERVICE_NAME(str_ServiceName);
			bizdata.setTYPE(str_BizType);
			bizdata.setURL(str_Url);
			bizdata.setEJBHOME_INTERFACE(strejbhome_interface);
			bizdata.setEJBCreateMethod(strejbcreate_method);
			
				Iterator iterator = null;
				String strName = "";
				ArrayList arrData = new ArrayList();
				for (int j = 0; j < bizdata.getFieldCount(); j++)
				{				
					boolean isFound = false;
					strName = bizdata.getFieldName(j);					
					if (strFieldName != null)
					{
						for (int i=0; i<strFieldName.length; i++)
						{										
							if (strName.equals(strFieldName[i]))
							{						
								isFound = true;
								break;
							}								
						}
					}
					if(!isFound)arrData.add(strName);					
				}

				iterator = arrData.iterator();
				for(;iterator.hasNext();)
				{
					strName = (String)iterator.next();					
					bizdata.removeBusinessItem(strName);
				}
				if (strFieldName != null)
				{
					for (int i=0; i<strFieldName.length; i++)
					{
						bizdata.setFieldValue(strFieldName[i], strFieldType[i], strFieldValue[i]);
					}		
				} 
			
			xmlResource.save(businessCollection);			
			xmlResource.release();
		} else if (strCode.equals("upd")) {	//subject,webpage 신규등록 후 webpage만 추가하는 로직

			ArrayList arrData = new ArrayList();
			BusinessData bizdata = null;
			businessCollection = xmlResource.getBusinessCollection(strColBizName);
//cache time 셋팅			

			businessCollection.setCOUNT(strCount);
			businessCollection.setCACHE_TIME(long_Cache);
			businessCollection.setBIZ_COLLECTION_KOR_NAME(strColKorBizName);
			Iterator iterator = businessCollection.iterator();

			BusinessData tmpBusinessData = null;

			BusinessCollection tmpBusinessCollection = new BusinessCollection();
			tmpBusinessCollection.setBusinessName(businessCollection.getBusinessName());
			tmpBusinessCollection.setCOLLECTION_INTERCEPTER(businessCollection.getCOLLECTION_INTERCEPTER());
			tmpBusinessCollection.setCACHE_TIME(long_Cache);
			tmpBusinessCollection.setCOUNT(strCount);
			tmpBusinessCollection.setPATH(businessCollection.getPATH());
			tmpBusinessCollection.setBIZ_COLLECTION_KOR_NAME(strColKorBizName);
			tmpBusinessCollection.setCLASS_INTERCEPTER(request.getParameter("class_intercepter"));
			tmpBusinessCollection.setBEF_INTERCEPTER(request.getParameter("bef_intercepter"));
			tmpBusinessCollection.setAFT_INTERCEPTER(request.getParameter("aft_intercepter"));
			tmpBusinessCollection.setAnacondaRule(request.getParameter("anaconda_rule"));

			for (int i=0; i<strBizName.length; i++)
			{
				tmpBusinessData = xmlResource.searchBusinessDataEqualsServiceName(strColBizName,strBizName[i]);
				if(tmpBusinessData == null)
				{
					// 신규
					tmpBusinessData = new BusinessData();
					tmpBusinessData.setBusinessName(strBizName[i]);
					tmpBusinessData.setDESC(strDesc[i]);
					tmpBusinessCollection.addBusinessData(tmpBusinessData);
				}
				else
				{
					// 그대로.
					tmpBusinessCollection.addBusinessData(tmpBusinessData);
				}
			}
			xmlResource.removeBusinessCollection(strColBizName);
			xmlResource.addBusinessCollection(tmpBusinessCollection);
			xmlResource.save(tmpBusinessCollection);			
			xmlResource.release();
		} 
		else if (strCode.equals("copy")) {	//subject,webpage 신규등록 후 webpage만 추가하는 로직
			xmlResource.copyBusinessCollection(strColBizName);			
			xmlResource.save();			
			xmlResource.release();		
		}
		else if(strCode.equals("change_user"))
		{
			businessCollection = xmlResource.getBusinessCollection(strColBizName);
			if(businessCollection != null)
			{
				Iterator it = businessCollection.iterator();
				for(;it.hasNext();)
				{
					BusinessData bd = (BusinessData)it.next();
					bd.setOWNER(owner);
				}
				xmlResource.save(businessCollection);			
				xmlResource.release();		
			}
		}
		else if(strCode.equals("change_all_user"))
		{
			Iterator iterator = xmlResource.getBusinessCollection();
			for(;iterator.hasNext();)
			{
				businessCollection = (BusinessCollection)iterator.next();
				Iterator it = businessCollection.iterator();
				for(;it.hasNext();)
				{
					BusinessData bd = (BusinessData)it.next();
					bd.setOWNER(owner);
				}
			}
			xmlResource.save();			
			xmlResource.release();		
		}

	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<title>
</title>
</head>
<body>
<script>
<%
String return_url = request.getParameter("return_url");
if(return_url != null && !"null".equals(return_url) && !return_url.trim().equals("")){
%>
document.location.href = '<%=return_url%>';
<%}else{%>
document.location.href = "/Anaconda.do?CMD=CMD_SEQ_103615773161287821449749&srh_param=COLLECTION_NAME&inputText=<%=strColBizName%>";
<%}%>
</script>
</body>
</html>
