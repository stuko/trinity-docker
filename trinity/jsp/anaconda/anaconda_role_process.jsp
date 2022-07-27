<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.action.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>

<%
	request.setCharacterEncoding("EUC-KR");
	String strColName= request.getParameter("RoleCollection");
	String strColKorName= request.getParameter("RoleCollectionKorName");
	String strRoleName = request.getParameter("RoleName");	
	String strRoleType = request.getParameter("RoleType");
	String strRoleUrl = request.getParameter("RoleUrl");
	String strRoleValue = request.getParameter("RoleValue");
	String strParent = request.getParameter("RoleParent");
	String strExpression = request.getParameter("Expression");
	String strRoleFieldName = request.getParameter("RoleFieldName");
	String strRoleKorName = request.getParameter("RoleKorName");
	String strRoleUrlType = request.getParameter("RoleUrlType");
	String strGubun = request.getParameter("GUBUN");
	String strRoleClickMessage= request.getParameter("RoleClickMessage");
	//String strNameSpace = request.getParameter("NameSpace");
	
	// System.out.println(strColName);
	// System.out.println(strRoleName);
	// System.out.println(strRoleType);
	// System.out.println(strRoleUrl);
	// System.out.println(strRoleValue);
	// System.out.println(strParent);
	// System.out.println(strExpression);
	// System.out.println(strRoleFieldName);
	// System.out.println(strRoleUrlType);
	// System.out.println(strRoleClickMessage);
	
	
	try
	{
		WebActionXmlResource actionResource = WebActionXmlResource.getInstance();
		XtremeRoleManager xmlResource = XtremeRoleManager.getInstance();
		if(strGubun.equals("R"))
		{
			strRoleName = new AutoSeq().getRoleSeq();
			XtremeRole role = xmlResource.create(strColName,
					           strRoleName,
					           strRoleValue,
					           strRoleUrl,
					           strParent,
					           strRoleType,
					           strExpression,
					           strRoleFieldName,
					           strRoleKorName);
			role.setRole_url_type(strRoleUrlType);
			role.setRole_click_message(strRoleClickMessage);
		}
		else if(strGubun.equals("U"))
		{
			XtremeRole role = xmlResource.update(strColName,
			           strRoleName,
			           strRoleValue,
			           strRoleUrl,
			           strParent,
			           strRoleType,
			           strExpression,
			           strRoleFieldName,
			           strRoleKorName);
			role.setRole_url_type(strRoleUrlType);
			role.setRole_click_message(strRoleClickMessage);
		}
		else if(strGubun.equals("copy"))
		{
			ExceptionCenter.debug("=================== copy rolecollection ======================");
			ExceptionCenter.debug("NameSpace : " + strColName);
			ExceptionCenter.debug("Kor Name  : " + strColKorName);
			ExceptionCenter.debug("=================== copy rolecollection ======================");
			XtremeRoleCollection xrc = xmlResource.copyRoleCollection(strColName,strColKorName);
			strColName = xrc.getROLLECTION_NAMESPACE();
			
		}
		else if(strGubun.equals("DC"))
		{
			ExceptionCenter.debug("=================== delete rolecollection ======================");
			ExceptionCenter.debug("NameSpace : " + strColName);
			ExceptionCenter.debug("Kor Name  : " + strColKorName);
			ExceptionCenter.debug("=================== delete rolecollection ======================");
			xmlResource.removeRoleCollectionFile(strColName);
		}
		else if(strGubun.equals("D"))
		{
			xmlResource.remove(strColName,strRoleName);
		}
		else if(strGubun.equals("mapping"))
		{
			if(request.getParameter("anaconda_role") != null)
			{
				String strRole = request.getParameter("anaconda_role");
				XtremeRole role = xmlResource.getXtremeRole(strColName,strRole);
				if(role != null)
				{
					String[] arrCheck = request.getParameterValues("check");
					if(arrCheck != null)
					{
						Iterator it = actionResource.getWebActionCollection();
						for(;it.hasNext();)
						{
							WebActionCollection wac = (WebActionCollection)it.next();
							Iterator it2 = wac.iterator();
							for(;it2.hasNext();)
							{
								WebAction wa = (WebAction)it2.next();
								// 이전에 롤이 있었다가, 해제 된 경우.
								if(strRole.equals(wa.getISAUTH()))
								{
									for(int i = 0; i<arrCheck.length;i++)
									{
										if(!wa.getCOMMAND().equals(arrCheck[i]))
										{
											wa.setISAUTH("");
											//out.println(arrCheck[i] + " set null<br>");
										}
									}
								}
							}
						}
						
						for(int i = 0; i<arrCheck.length;i++)
						{
							//out.println(arrCheck[i] + "<br>");
							WebAction action = actionResource.searchWebAction(arrCheck[i]);
							if(!action.getISAUTH().equals(strRole))
							{
								action.setISAUTH(strRole);
								//out.println(arrCheck[i] + " is changed<br>");
							}
						}
					}
					else
					{
						Iterator it = actionResource.getWebActionCollection();
						for(;it.hasNext();)
						{
							WebActionCollection wac = (WebActionCollection)it.next();
							Iterator it2 = wac.iterator();
							for(;it2.hasNext();)
							{
								WebAction wa = (WebAction)it2.next();
								if(strRole.equals(wa.getISAUTH()))
								{
									wa.setISAUTH("");
									//out.println(wa.getCOMMAND() + " set null<br>");
								}
							}
						}
					}
				}
			}
			actionResource.save();
			actionResource.release();
		}		
		xmlResource.save(xmlResource.getRoleCollection(strColName));
		xmlResource.release();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<script>
alert("요청하신 권한 정보가 저장 되었습니다.");
if('<%=strGubun%>' == 'mapping')
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_106557688651298705108710";
else
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_107239804791288227326088";

</script>
