<%@ page contentType="text/xml; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.scenario.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.action.*"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.analysis.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.util.*"%>
<%
	String strCode 	= request.getParameter("code");
	String strSearch	= request.getParameter("search");
	String strTitle	= request.getParameter("scenario_title") != null ? URLDecoder.decode(request.getParameter("scenario_title"),"UTF-8") : request.getParameter("scenario_title");
	String strObject	= request.getParameter("scenario_object") != null ? URLDecoder.decode(request.getParameter("scenario_object"),"UTF-8") : request.getParameter("scenario_object");
        // System.out.println("#####-->" + strObject);
        strObject = strObject.replace("\n","<BR>");
	String strKey  = request.getParameter("scenario_key");
	String strRtn = "";
	String owner = "";
	RequestHelper helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
	DefaultAuth auth = (DefaultAuth)helper.getSessionObject();
	if(auth != null)
	{
		owner = auth.getAuthItem(("MEMBER_NAME"));	
	}

	try
	{
		BusinessData businessData = (BusinessData)request.getAttribute(InitClass.getBusinessDataValue());
		DefaultXmlResource res = DefaultXmlResource.getInstance();
		if(strCode.equals("remove"))
		{
			BizTreeXmlResource btxr = BizTreeXmlResource.getInstance();
			btxr.removeBusinessTree(strKey);
			btxr.save();
                        btxr.release();
		}
		else if(strCode.equals("create"))
		{
			AutoSeq autoseq = new AutoSeq();
			BizTreeXmlResource btxr = BizTreeXmlResource.getInstance();
			BusinessData node = new BusinessData();	
			node.setBusinessName(autoseq.getBusinessTreeSeq());
			node.setSERVICE_KOR_NAME(strTitle);
			node.setDESC(strObject);
			BusinessData data = new BusinessData();
			data.setFieldValue("regdate",DateUtil.getYYYYMMDD());
			data.setFieldValue("updategdate",DateUtil.getYYYYMMDD());
			btxr.createBusinessTree("", node, data);
			btxr.save();
                        btxr.release();
		}
		else if(strCode.equals("update"))
		{
			BizTreeXmlResource btxr = BizTreeXmlResource.getInstance();
			BusinessTree bt = btxr.getBusinessTree(strKey);
			if(bt != null)
			{
				bt.getNode().setSERVICE_KOR_NAME(strTitle);
				bt.getNode().setDESC(strObject);
				if(!BusinessHelper.checkBusinessNull(bt.getBusinessData().getFieldValue("regdate")))
				{
					bt.getBusinessData().setFieldValue("regdate",DateUtil.getYYYYMMDD());
				}
				bt.getBusinessData().setFieldValue("updatedate",DateUtil.getYYYYMMDD());
				btxr.save();
                                btxr.release();
			}
		}
		else if(strCode.equals("find"))
		{
		}
		else if(strCode.equals("search"))
		{
		}
		else if(strCode.equals("request"))
		{
			Modeler model = new Modeler();
			WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();	
			Scenario scenario = model.parseScenario(strTitle,BusinessHelper.revertBR(strObject));
			AutoSeq autoseq = new AutoSeq();
			String wac_seq = autoseq.getWACollectionSeq();
			//WebActionCollection webActionCollection = xmlResource.createActionCollection(autoseq.getWACollectionSeq());
			//webActionCollection.setWEBACTION_KOR_NAME(strTitle);
			//webActionCollection.setREQUEST_KEY(strKey);
			ExceptionCenter.debug("---------------- Make Anaconda MVC Start------------------------");
			Iterator it = scenario.iterator();
                            WebAction action = null;
			for(;it.hasNext();)
			{
				ScenarioItem scenario_item = (ScenarioItem)it.next();
				if(scenario_item.size() == 0)
				{
					ExceptionCenter.debug("ITEM:" + scenario_item.getItem_title());
					action = xmlResource.createAction(  wac_seq
											 , strTitle										 
											 , autoseq.getWActionSeq()
											 , scenario_item.getItem_title()
											 , ""
											 , scenario_item.getItem_title()
											 );
                                              action.setOWNER(owner);
					continue;
				}
				Iterator subIt = scenario_item.iterator();
				for(;subIt.hasNext();)
				{
					ScenarioItem scenario_case = (ScenarioItem)subIt.next();
					if(scenario_case.size() == 0)
					{
						ExceptionCenter.debug("CASE:" + scenario_item.getItem_title() + " -> " + scenario_case.getItem_title());
						action = xmlResource.createAction(  wac_seq
												 , strTitle										 
												 , autoseq.getWActionSeq()
												 , scenario_item.getItem_title() + " -> " + scenario_case.getItem_title()
												 , ""
												 , scenario_item.getItem_title() + " -> " + scenario_case.getItem_title()
												 );
                                                       action.setOWNER(owner);
						continue;
					}
					Iterator subsubIt = scenario_case.iterator();
					for(;subsubIt.hasNext();)
					{
						ScenarioItem scenario_step = (ScenarioItem)subsubIt.next();
						ExceptionCenter.debug("STEP:" + scenario_item.getItem_title() + " -> " + scenario_case.getItem_title() + " -> " + scenario_step.getItem_title());
						action = xmlResource.createAction(  wac_seq
												 , strTitle										 
												 , autoseq.getWActionSeq()
												 , scenario_item.getItem_title() + " -> " + scenario_case.getItem_title() + " -> " + scenario_step.getItem_title()
												 , ""
												 , scenario_item.getItem_title() + " -> " + scenario_case.getItem_title() + " -> " + scenario_step.getItem_title()
												 );
                                                       action.setOWNER(owner);
					}
				}
			}
			ExceptionCenter.debug("---------------- Make Anaconda MVC End------------------------");
			xmlResource.save();
			xmlResource.release();
		}
		else if(strCode.equals("analysis"))
		{
			Modeler model = new Modeler();
			WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();	
			DefaultXmlDataCollection col = model.parseAnalysis(strTitle,strObject);
			ExceptionCenter.debug(col.toString());
			res.save(col);
		}
		out.print(strRtn);
	} 
	catch (Exception e) 
	{
		e.printStackTrace();
	}
%>

<script language="javascript">
alert('<%=strObject%>');
</script>
