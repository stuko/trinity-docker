<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.util.*"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.front.WebActionMapper"%>

<%@ page import="com.stuko.anaconda.business.BusinessCollection"%>
<%@ page import="com.stuko.anaconda.business.BusinessHelper"%>

<%
//	request.setCharacterEncoding("EUC-KR");
//공통 파라미터
	String strCode 			= request.getParameter("code");
	String strActColName	= request.getParameter("ActColName");	
	String strActColKorName	= request.getParameter("ActColKorName");
	String strLayoutName	= request.getParameter("Layout");
	String strLayoutKorName	= request.getParameter("LayoutKorName");
	
//등록시 사용하는 파라미터
//	System.out.println("strCode="+strCode);
//	System.out.println("strActColName="+strActColName);
	String strContext = request.getParameter("Context");

	String strActName = "";
	String strActKorName[] 	= request.getParameterValues("ActKorName");
	String strAct_Name[] 	= request.getParameterValues("ActName");

	String strOneActionName = request.getParameter("name");
	String strOneActionKorName = "";
	if(strActKorName == null || strActKorName.length == 1) strOneActionKorName	= request.getParameter("korname");	

	String command = request.getParameter("command");
	String isauth = request.getParameter("isauth");
	String default_parameter = request.getParameter("default_parameter");
	String validation_class = request.getParameter("validation_class");
	String forward = request.getParameter("forward");
	String action_class = request.getParameter("action_class");
	String type = request.getParameter("type");
	String desc = request.getParameter("desc");
	String strActDesc[] = request.getParameterValues("ActDesc");
	String nextaction = request.getParameter("nextaction");
	String bizservice = request.getParameter("bizservice");
	String aop_intercepter = request.getParameter("aop_intercepter");
	String aop_pointclass = request.getParameter("aop_point_class");
	String aop_pointmethod = request.getParameter("aop_point_method");
	String korname = request.getParameter("korname");
	String filter_ignore = request.getParameter("filter_ignore");
	String forward_type = request.getParameter("forward_type");
	String error_page = request.getParameter("error_page");
	String error_type = request.getParameter("error_type");
	String owner = request.getParameter("owner");
	//out.println("Forward Type is ==> " + forward_type);
	String RTN_CODE = "";
%>

<%
	try
	{	
		
		WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();	
		BizLogicXmlResource bizXmlResource = BizLogicXmlResource.getInstance();
		AutoSeq autoseq = new AutoSeq();
		ViewXmlResource viewXmlResource = ViewXmlResource.getInstance();
		
		WebActionCollection webActionCollection = null;
		BusinessCollection businessCollection = null;
		
		if (strCode.equals("ins") || strCode.equals("upd") )
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
			System.out.println(strActColName);
		    webActionCollection.setWEB_CONTEXT(strContext);
		    webActionCollection.setLAYOUT_NAME(strLayoutName);
		    
			WebAction webAction = null;
			boolean Found = false;
			ArrayList foundData = new ArrayList();

			if(strCode.equals("upd"))
			{	
				if(strAct_Name == null)
				{
					// xmlResource.removeWebActionCollection(strActColName);
				}
				else
				{
					Iterator iterator = webActionCollection.iterator();

					for(;iterator.hasNext();)
					{
						webAction = (WebAction)iterator.next();
						for (int i=0; i<strAct_Name.length; i++)
						{
							if(webAction.getNAME().equals((strAct_Name[i] == null  || strAct_Name[i] == "" ? "" : strAct_Name[i])))
							{
								Found = true;							
								break;
							}
							else
							{
								Found = false;
							}
						}
						if(!Found) foundData.add(webAction);
					}	
					iterator = foundData.iterator();
			
					for(;iterator.hasNext();)
					{
						webAction = (WebAction)iterator.next();
						xmlResource.removeWebActionEqualsActionName(strActColName,webAction.getNAME());
					}
				}
			}

			if(strActKorName != null)
			{
				for (int i=0; i<strActKorName.length; i++)
				{	
					if(	strAct_Name[i] == null || strAct_Name[i].equals("null") || strAct_Name[i].equals(""))
					{	
						strActName = autoseq.getWActionSeq();
					}
					else
					{
						strActName = strAct_Name[i];
					}
	
					webAction = xmlResource.createAction(strActColName
											 , strActColKorName										 
											 , strActName
											 , strActKorName[i]
											 , command
											 , strActDesc[i]
											 );
					webAction.setOWNER(owner);
				}
			}			
			xmlResource.save(webActionCollection);
			RTN_CODE ="100";

		}	
		else if(strCode.equals("mod"))
		{
				if(	command == null || command.equals("null") || command.equals(""))
				{	
					command = autoseq.getCommandSeq();
				}
				if( bizservice == null || bizservice.equals("null") || bizservice.equals(""))
				{	
					bizservice = autoseq.getBCollectionSeq();
				}
				if( forward == null || forward.equals("null") || forward.equals("") || forward.trim().length() == 0)
				{	
ExceptionCenter.debug(this,"---- forward is null -------");					
ExceptionCenter.debug(this,"forward : ["+forward+"]");
ExceptionCenter.debug(this,"---- forward is null -------");					
					
					forward = autoseq.getViewSeq();
ExceptionCenter.debug(this,"---- forward is created -------");					
ExceptionCenter.debug(this,"forward : ["+forward+"]");
ExceptionCenter.debug(this,"---- forward is created  -------");					


				}else{
ExceptionCenter.debug(this,"---- forward is Not null -------");					
ExceptionCenter.debug(this,"forward : ["+forward+"]");
ExceptionCenter.debug(this,"---- forward is Not null -------");					

                                }
		
				WebAction webActionUpd = xmlResource.updateAction( strActColName
									     , strActColKorName
										 , strOneActionName
										 , strOneActionKorName
										 , command
										 , isauth
										 , default_parameter
										 , validation_class
										 , forward
										 , action_class
										 , type
										 , desc
										 , nextaction
										 , bizservice
										 , aop_intercepter
										 , aop_pointclass
										 , aop_pointmethod
										 , filter_ignore
										 , forward_type);
				webActionUpd.setERROR_PAGE(error_page);
				webActionUpd.setERROR_TYPE(error_type);
				webActionUpd.setOWNER(owner);
				
				if(!"NONE".equals(bizservice) && ( bizXmlResource.getBusinessCollection(bizservice) == null ))
				{
					bizXmlResource.createBusinessData(bizservice
												,webActionUpd.getKOR_NAME()
												,"ChangeIt"
												,webActionUpd.getKOR_NAME()
												,null
												,null
												,null
												,null
												,null
												,null
												,null
												,null
												,null
												,null
												,null
												,null
											   );
					bizXmlResource.save(bizXmlResource.getBusinessCollection(bizservice));
					bizXmlResource.release();

				}
    		                       
			   if(!"NONE".equals(forward) && ( viewXmlResource.searchView(forward) == null 
			   	|| viewXmlResource.searchView(forward).equals("null") 
			   	|| viewXmlResource.searchView(forward).equals("") ))
			   {
					viewXmlResource.createView( strActColName
										 ,strActColKorName
										 ,forward
										 ,strOneActionKorName
										 ,null
										 ,null
										 ,null
										 ,null
										 ,null
										 ,null
										 ,strOneActionKorName
										 );
					viewXmlResource.save(viewXmlResource.getViewCollection(strActColName));
					viewXmlResource.release();

			   }
				xmlResource.save(xmlResource.getWebActionCollection(strActColName));
				RTN_CODE = "300";
		}
		else if(strCode.equals("all"))
		{
			String strCols = request.getParameter("default_act_col_name");
			String strActs = request.getParameter("default_act_name");
			WebAction action = xmlResource.searchWebActionEqualsName(strActs);
			String strKorCols = xmlResource.getWebActionCollection(strCols).getWEBACTION_KOR_NAME();
			action.setACTION_CLASS("com.stuko.anaconda.action.XCAction");
			action.setCOMMAND(autoseq.getCommandSeq());
			action.setFORWARD_TYPE("VIEW");
			action.setISAUTH("N");
			action.setFILTER_IGNORE("N");
			String bseq = autoseq.getBCollectionSeq();
			String vseq = autoseq.getViewSeq();
			action.setBIZ_SERVICE(bseq);
			action.setFORWARD(vseq);
			
			bizXmlResource.createBusinessData(bseq
					,action.getKOR_NAME()
					,"ChangeIt"
					,action.getKOR_NAME()
					,null
					,null
					,null
					,null
					,null
					,null
					,null
					,null
					,null
					,null
					,null
					,null
					);
			bizXmlResource.save(bizXmlResource.getBusinessCollection(bseq));
			bizXmlResource.release();
				
			viewXmlResource.createView( strCols
					 ,strKorCols
					 ,vseq
					 ,action.getKOR_NAME()
					 ,null
					 ,null
					 ,null
					 ,null
					 ,null
					 ,null
					 ,action.getKOR_NAME()
					 );
			viewXmlResource.save(viewXmlResource.getViewCollection(strCols));
			viewXmlResource.release();
			xmlResource.save(xmlResource.getWebActionCollection(strCols));
		}
		else if(strCode.equals("action_service"))
		{
			
			String strCols = request.getParameter("default_act_col_name");
			String strActs = request.getParameter("default_act_name");
			WebAction action = xmlResource.searchWebActionEqualsName(strActs);
			String strKorCols = xmlResource.getWebActionCollection(strCols).getWEBACTION_KOR_NAME();
			action.setACTION_CLASS("com.stuko.anaconda.action.XCAction");
			action.setCOMMAND(autoseq.getCommandSeq());
			// action.setFORWARD_TYPE("VIEW");
			action.setISAUTH("N");
			action.setFILTER_IGNORE("N");
			String bseq = autoseq.getBCollectionSeq();
			// String vseq = autoseq.getViewSeq();
			action.setBIZ_SERVICE(bseq);
			action.setFORWARD("NONE");
			bizXmlResource.createBusinessData(bseq
					,action.getKOR_NAME()
					,"ChangeIt"
					,action.getKOR_NAME()
					,null
					,null
					,null
					,null
					,null
					,null
					,null
					,null
					,null
					,null
					,null
					,null
					);
			bizXmlResource.save(bizXmlResource.getBusinessCollection(bseq));
			bizXmlResource.release();
			/**	
			viewXmlResource.createView( strCols
					 ,strKorCols
					 ,vseq
					 ,action.getKOR_NAME()
					 ,null
					 ,null
					 ,null
					 ,null
					 ,null
					 ,null
					 ,action.getKOR_NAME()
					 );
			viewXmlResource.save();
			viewXmlResource.release();
			**/

			xmlResource.save(xmlResource.getWebActionCollection(strCols));
			
		}
		else if(strCode.equals("action_page"))
		{
			String strCols = request.getParameter("default_act_col_name");
			String strActs = request.getParameter("default_act_name");
			WebAction action = xmlResource.searchWebActionEqualsName(strActs);
			String strKorCols = xmlResource.getWebActionCollection(strCols).getWEBACTION_KOR_NAME();
			action.setACTION_CLASS("com.stuko.anaconda.action.XCAction");
			action.setCOMMAND(autoseq.getCommandSeq());
			action.setFORWARD_TYPE("VIEW");
			action.setBIZ_SERVICE("NONE");
			action.setISAUTH("N");
			action.setFILTER_IGNORE("N");
			// String bseq = autoseq.getBCollectionSeq();
			String vseq = autoseq.getViewSeq();
			// action.setBIZ_SERVICE(bseq);
			action.setFORWARD(vseq);
			/**
			bizXmlResource.createBusinessData(bseq
					,action.getKOR_NAME()
					,"ChangeIt"
					,action.getKOR_NAME()
					,null
					,null
					,null
					,null
					,null
					,null
					,null
					,null
					,null
					,null
					,null
					,null
					);
			bizXmlResource.save();
			bizXmlResource.release();
			**/	
			viewXmlResource.createView( strCols
					 ,strKorCols
					 ,vseq
					 ,action.getKOR_NAME()
					 ,null
					 ,null
					 ,null
					 ,null
					 ,null
					 ,null
					 ,action.getKOR_NAME()
					 );
			viewXmlResource.save(viewXmlResource.getViewCollection(strCols));
			viewXmlResource.release();
			xmlResource.save(xmlResource.getWebActionCollection(strCols));
		}
		else if(strCode.equals("del"))
		{
				RTN_CODE = "400";
				xmlResource.removeWebAction(strActColName, command);
				xmlResource.save(xmlResource.getWebActionCollection(strActColName));
		}
		else if (strCode.equals("copy"))
		{	
			String viewCopy = request.getParameter("viewCopy");
			WebAction sourceAction = xmlResource.searchWebAction(command);
			if(sourceAction != null)
			{
				WebAction targetAction = xmlResource.copyWebAction(sourceAction);
				targetAction.setCOMMAND(autoseq.getCommandSeq());
				targetAction.setNAME(autoseq.getWActionSeq());
				targetAction.setKOR_NAME("copy of " + sourceAction.getKOR_NAME());
				webActionCollection = xmlResource.getWebActionCollection(strActColName);
				if(webActionCollection != null)
					webActionCollection.addWebAction(targetAction);
				if("Y".equals(viewCopy))
				{
					ExceptionCenter.debug("#####################New View################");
					ViewXmlResource viewResource = ViewXmlResource.getInstance();	
					View view = viewResource.copyView(null,targetAction.getFORWARD());
					viewResource.save(viewXmlResource.createViewCollection(view.getVIEW_COLLECTION_NAME()));
					viewResource.release();
					targetAction.setFORWARD(view.getFORWARD_NAME());
				}
				else
				{
					ExceptionCenter.debug("#####################" + viewCopy +"################");
				}
				xmlResource.save(webActionCollection);
			}
		}
		else if (strCode.equals("ccopy"))
		{	
			webActionCollection = xmlResource.getWebActionCollection(strActColName);
			if(webActionCollection != null)
			{
				WebActionCollection targetWAC = xmlResource.createActionCollection(autoseq.getWACollectionSeq());
				// WebActionCollection targetWAC = new WebActionCollection(autoseq.getWACollectionSeq());
				targetWAC.setWEBACTION_KOR_NAME("copy of " + webActionCollection.getWEBACTION_KOR_NAME());
				targetWAC.setWEB_CONTEXT(webActionCollection.getWEB_CONTEXT());
				Iterator it = webActionCollection.iterator();
				for(;it.hasNext();)
				{
					targetWAC.add(it.next());
				}
			}
			xmlResource.save(webActionCollection);
		}
		else if(strCode.equals("change_user"))
		{
			webActionCollection = xmlResource.getWebActionCollection(strActColName);
			if(webActionCollection != null)
			{
				Iterator it = webActionCollection.iterator();
				for(;it.hasNext();)
				{
					WebAction webAction = (WebAction)it.next();
					webAction.setOWNER(owner);
				}
			}
			xmlResource.save(webActionCollection);

		}

		xmlResource.release();

	} catch (Exception e) {
	    e.printStackTrace();
		ExceptionCenter.catchException(e);
		out.println(e.toString());
	}
%>

<html>
<head>
</head>
<body>
<script>
var RTN_CODE = '<%=RTN_CODE%>';
if(RTN_CODE == '100') // insert OK
{
	alert("화면 정보가 등록되었습니다!");
	//location.href = "/Anaconda.do?CMD=CMD_SEQ_108164918711286971872119";           
	//self.close();	      
}
else if(RTN_CODE == '200') // insert OK
{
	// 없는 경우.
	alert("화면 정보가 정상적으로 등록되었습니다.");
	//history.back();
}
else if(RTN_CODE == '300') // insert OK
{
	alert("화면 정보가 정상적으로 등록되었습니다!");
	//opener.location.href = "/jsp/WebAction/Action_List.jsp";           
	//self.close();	      
}
else if(RTN_CODE == '400') // insert OK
{
	alert("화면 정보가 정상적으로 등록되었습니다!");
	//opener.location.href = "/jsp/WebAction/Action_List.jsp";           
	//self.close();	      
}
else if(RTN_CODE == '500') // insert OK
{
	alert("화면 정보가 정상적으로 등록되었습니다!");
	//opener.location.href = "/jsp/WebAction/Action_List.jsp";           
	//self.close();	      
}
location.href = "/Anaconda.do?CMD=CMD_SEQ_108164918711286971872119&WAC=<%=strActColName%>";   
</script>
</body>
</html>





