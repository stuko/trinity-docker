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
	String str_AopInter			= request.getParameter("aop_intercepter");
	str_AopInter  = str_AopInter == null ? "" : str_AopInter;
	//str_AopInter                = new String(str_AopInter.getBytes("8859_1"),"euc-kr");
	String str_AopPointCls		= request.getParameter("aop_point_class");
	str_AopPointCls  = str_AopPointCls == null ? "" : str_AopPointCls;
	//str_AopPointCls             = new String(str_AopPointCls.getBytes("8859_1"),"euc-kr");
	String str_AopPointMethod	= request.getParameter("aop_point_method");
	str_AopPointMethod  = str_AopPointMethod == null ? "" : str_AopPointMethod;	
	//str_AopPointMethod          = new String(str_AopPointMethod.getBytes("8859_1"),"euc-kr");
	String str_DataSource		= request.getParameter("data_datasource");
	String str_EjbMethod		= request.getParameter("ejbcreatemethod");
	String str_Factory			= request.getParameter("factory");
	String str_JndiName			= request.getParameter("jndiname");
	String str_JnpInter			= request.getParameter("jnpinterface");
	String str_PojoCls			= request.getParameter("pojo_class");
	String str_ServiceName		= request.getParameter("service_name");

    str_ServiceName = (str_ServiceName == null || str_ServiceName.equals("null") ? "" : 	str_ServiceName);

//	String str_Service			= request.getParameter("service");
//	String str_SQL				= request.getParameter("biz_sql");
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
			//businessCollection.setBIZ_COLLECTION_KOR_NAME(strColKorBizName);
			//cache time 셋팅			
			businessCollection.setCACHE_TIME(long_Cache);
			businessCollection.setCOUNT(strCount);
			bizdata = businessCollection.getBusinessData(str_BizName);			

			bizdata.setAOP_INTERCEPTER(str_AopInter);
			bizdata.setAOP_POINT_CLASS(str_AopPointCls);
			bizdata.setAOP_POINT_METHOD(str_AopPointMethod);			
			bizdata.setDATA_DATASOURCE(str_DataSource);
			bizdata.setEJBCreateMethod(str_EjbMethod);			
			bizdata.setFACTORY(str_Factory);
			bizdata.setJNDINAME(str_JndiName);
			bizdata.setJNPINTERFACE(str_JnpInter);
			bizdata.setPOJO_CLASS(str_PojoCls);
			bizdata.setSERVICE_NAME(str_ServiceName);
//			bizdata.setSERVICE(str_Service);			
//			bizdata.setSQL(str_SQL);
			bizdata.setTYPE(str_BizType);
			bizdata.setURL(str_Url);
			bizdata.setEJBHOME_INTERFACE(strejbhome_interface);
			bizdata.setEJBCreateMethod(strejbcreate_method);
			
//			한줄만 남았을경우도 삭제 하기 위해서 아래 IF 문 주석처리하고 122라인, 143라인 IF문 처리했음
//			if (strFieldName != null)
//			{
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
//			}
			
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
			tmpBusinessCollection.setAOP_INTERCEPTER(request.getParameter("aop_intercepter"));
			tmpBusinessCollection.setAOP_POINT_METHOD(request.getParameter("aop_point_method"));
			tmpBusinessCollection.setAOP_POINT_CLASS(request.getParameter("aop_point_class"));

			tmpBusinessCollection.setAnacondaRule(request.getParameter("anaconda_rule"));
			//ExceptionCenter.debug("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
			ExceptionCenter.debug(tmpBusinessCollection.getAOP_INTERCEPTER());
			ExceptionCenter.debug(tmpBusinessCollection.getAOP_POINT_CLASS());
			ExceptionCenter.debug(tmpBusinessCollection.getAOP_POINT_METHOD());
			ExceptionCenter.debug(tmpBusinessCollection.getAnacondaRule());
			//ExceptionCenter.debug("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
			//System.out.println("----------------------------------------------------" + request.getParameter("aop_point_method"));

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



			/**
			-----------------------------------------------------------------------------
			-- 2008-04-07 프로세스 순서를 유지하기 위해 수정됨.
			-----------------------------------------------------------------------------
			for(;iterator.hasNext();)
			{
				bizdata = (BusinessData)iterator.next();
				String strName = bizdata.getBusinessName();				
				boolean isFound = false;
				for (int i=0; i<strBizName.length; i++)
				{
					if(strName.equals(strBizName[i]))
					{
					    isFound = true;
						break;
					}				
				}	
				if(!isFound)arrData.add(strName);
			}
			
			iterator = arrData.iterator();
			for(;iterator.hasNext();)
			{
				String strName = (String)iterator.next();
				businessCollection.removeBusinessData(strName);
			}
			
			for (int i=0; i<strBizName.length; i++)
			{
				bizdata = businessCollection.createBusinessData(strBizName[i]);				

				if(strDesc[i] != null)
				{
					bizdata.setDESC(new String(strDesc[i].getBytes("8859_1"),"euc-kr"));				
				}
			}	

			**/

			
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
		ExceptionCenter.catchException(e);
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
