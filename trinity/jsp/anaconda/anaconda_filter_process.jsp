<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.util.*"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.filter.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>

<%
  	request.setCharacterEncoding("EUC-KR");
//공통 파라미터
	String strCode 			= request.getParameter("code");
	String strActColName	= request.getParameter("ActColName");
	String strActColKorName	= request.getParameter("ActColKorName");
//등록시 사용하는 파라미터
	String strActName = "";
	String strActFilterKorName[] 	= request.getParameterValues("ActFilterKorName");
	String strAct_Name[] 	= request.getParameterValues("ActName");
	
	String forward[] 		= request.getParameterValues("ActFilterForward");
	String strPattern[] 	= request.getParameterValues("ActFilterPattern");
	String strFrom[] 		= request.getParameterValues("ActFilterFrom");
	String strTo[] 			= request.getParameterValues("ActFilterTo");	
	String type[] 			= request.getParameterValues("ActFilterType");
	
	String RTN_CODE = "";
%>

<%
	try
	{	
		WebActionFilterXmlResource xmlResource = WebActionFilterXmlResource.getInstance();
		WebActionFilterCollection webActionFilterCollection = null;
		WebActionFilter webFilter = null;
		
		AutoSeq autoseq = new AutoSeq();
				
		if (strCode.equals("ins") || strCode.equals("upd") )
		{
			System.out.println("strCode="+strCode);
		    if(	strCode.equals("ins"))
		    {
		    	System.out.println("INS=====");		    	
				strActColName = autoseq.getFilterCollectionSeq();	
				// webActionFilterCollection = xmlResource.createWebActionFilterCollection(strActColName);
				System.out.println("strActColName="+strActColName);
			}
			else
			{
				System.out.println("NOT INS=====");
				webActionFilterCollection = xmlResource.getWebActionFilterCollection(strActColName);
			}
			
			boolean Found = false;
			ArrayList foundData = new ArrayList();

			System.out.println("strActFilterKorName.length=="+strActFilterKorName.length);

			for (int i=0; i<strActFilterKorName.length; i++)
			{	
				if(	strAct_Name[i] == null || strAct_Name[i].equals("null") || strAct_Name[i].equals(""))
				{	
					strActName = autoseq.getFilterSeq();
				}
				else
				{
					strActName = strAct_Name[i];
				}

				System.out.println("strActColName=="+strActColName);
				System.out.println("strActName=="+strActName);
				System.out.println("strActFilterKorName[i]=="+strActFilterKorName[i]);
				System.out.println("forward=="+forward[i]);
				
				xmlResource.update(strActColName
										 , strActColKorName
										 , strActName
										 , strActFilterKorName[i]
										 , strFrom[i]
										 , strTo[i]
										 , strPattern[i]
										 , forward[i]
										 , type[i]
										 );
			}
			RTN_CODE ="100";
			xmlResource.save();
		}
		else if(strCode.equals("del") )
		{
			xmlResource.removeWebActionFilterCollectionFile(strActColName);
			RTN_CODE ="100";
		}
		else if(strCode.equals("delOneFilter") )
		{
			xmlResource.remove(strActColName);
			xmlResource.save();
			RTN_CODE ="100";
		}
		// System.out.println("getFILTERCOLLECTION_NAME====="+webActionFilterCollection.getFILTERCOLLECTION_NAME());
		
		
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
	alert("요청하신 필터 정보(<%=strActColName%>)가 반영 되었습니다!");
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_102622610251288248433847";           
}
else if(RTN_CODE == '200') // insert OK
{
	// 없는 경우.
	alert("등록하실수 있는 필터 명 입니다.");
	history.back();
}
else if(RTN_CODE == '300') // insert OK
{
	alert("요청하신 필터 정보가 반영 되었습니다!");
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_102622610251288248433847";           
}
else if(RTN_CODE == '400') // insert OK
{
	alert("요청하신 필터 정보가 반영 되었습니다!");
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_102622610251288248433847";           
}
else if(RTN_CODE == '500') // insert OK
{
	alert("요청하신 필터 정보가 반영 되었습니다!");
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_102622610251288248433847";           
}

</script>
</body>

