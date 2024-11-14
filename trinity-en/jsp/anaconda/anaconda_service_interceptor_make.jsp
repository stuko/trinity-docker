<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.action.*"%>
<%@ page import="com.stuko.anaconda.emergency.source.*"%>

<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="com.stuko.anaconda.business.BusinessData"%>
<%@ page import="com.stuko.anaconda.business.BusinessHelper"%>
<%@ page import="com.stuko.anaconda.business.BusinessItem"%>
<%@ page import="com.stuko.anaconda.business.BusinessCollection"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<title>
</title>
<script>
<!--
-->
</script>
</head>
<body bgcolor="#ffffff">

<%
 out.println("<pre>");
	
	String strBizCol = request.getParameter("BizCol");
	String strBizProc = request.getParameter("BizProc");

    String strCompileResult  = "";
	String strBefore = "";
	String strAfter = "";
	String strIC = "";
	String strPKG = "";

    BizLogicXmlResource xmlResource = BizLogicXmlResource.getInstance();
	BusinessCollection bc = null;
	AutoSeq autoseq = new AutoSeq();
	boolean IsStandardIntercepter = false;
	String strICType = BlankField.INTERCEPTER_BIZCOLLECTION;
	BusinessData bd = null;
	boolean isBP = false;
	try
	{		
		bc = xmlResource.getBusinessCollection(strBizCol);
		
		if(BusinessHelper.checkBusinessNull(strBizProc))
		{
			isBP = true;
			bd = bc.getBusinessData(strBizProc);	
			strICType = BlankField.INTERCEPTER_BIZPROCESS;
			strAfter	=	BusinessHelper.revert(bd.getAOP_POINT_CLASS());
			strBefore	=	BusinessHelper.revert(bd.getAOP_POINT_METHOD());
			strIC = bd.getAOP_INTERCEPTER();
		}
		else
		{
			strAfter	=	BusinessHelper.revert(bc.getAOP_POINT_CLASS());
			strBefore	=	BusinessHelper.revert(bc.getAOP_POINT_METHOD());
			strIC = bc.getAOP_INTERCEPTER();
		}

		if(strIC.equals(BlankField.BC_CONDITIONAL_INTERCEPTER_CLASS)
	   || strIC.equals(BlankField.BC_SIMPLE_INTERCEPTER_CLASS)
	   || strIC.equals(BlankField.BP_CONDITIONAL_INTERCEPTER_CLASS)
	   || strIC.equals(BlankField.BP_SIMPLE_INTERCEPTER_CLASS)	)
		{
			IsStandardIntercepter = true;
		}

		out.println("Original Class = " + strIC);
		if(strIC.equals(BlankField.BC_CONDITIONAL_INTERCEPTER_CLASS)) strICType = BlankField.INTERCEPTER_COND_BUSINESS_COLLECTION;
		if(strIC.equals(BlankField.BC_SIMPLE_INTERCEPTER_CLASS)) strICType = BlankField.INTERCEPTER_SIMPLE_BUSINESS_COLLECTION;
		
		if(strIC.equals(BlankField.BP_CONDITIONAL_INTERCEPTER_CLASS)) strICType = BlankField.INTERCEPTER_COND_BIZPROCESS;
		if(strIC.equals(BlankField.BP_SIMPLE_INTERCEPTER_CLASS)) strICType = BlankField.INTERCEPTER_SIMPLE_BIZPROCESS;
		
		out.println(strBizCol);
		out.println(strBizProc);
		// out.println(bc.size());
		
		
		out.println("Original Class Name = " + strIC);
		out.println(strAfter);
		out.println(strBefore);
		//out.println(BlankField.BC_CONDITIONAL_INTERCEPTER_CLASS);
		//out.println(BlankField.BC_SIMPLE_INTERCEPTER_CLASS);

		out.println(strICType);
		// Package 가 있는 경우.

		IntercepterSourceXmlResource res = IntercepterSourceXmlResource.getInstance();

		if(strIC.lastIndexOf(".") >= 0)
		{
			strPKG = strIC.substring(0,strIC.lastIndexOf("."));
			strIC = strIC.substring(strIC.lastIndexOf(".")+1);
			
			out.println("Full Name = " + strPKG + "." + strIC);
			out.println("Package Name = " + strPKG);
			out.println("Java Name = " + strIC);


			IntercepterSource src = res.getIntercepterSource(strPKG, strIC);
			
			if(BusinessHelper.checkBusinessNull(strIC) && src == null)
			{
				
				strIC = autoseq.getIntercepterSeq();
				out.println("New Class Name = " + strIC);
			}
		}

		out.println("Class Name = " + strIC);


		if(strPKG.length() > 0)
		{
			
			out.println(strPKG + "." + strIC + ".java");
			out.println(strBefore);
			out.println(strAfter);

			res.register(strPKG
						,strIC
						,BlankField.INTERCEPTER
						,strBefore
						,strAfter
						,strICType);
			res.save();

			if(res.getIntercepterSourceCollection(strPKG) == null)
			{
				out.println("getIntercepterSourceCollection is NULL");
			}
			else
			{
				out.println("getIntercepterSourceCollection is NOT NULL");
			}

			out.println("<textarea cols='150' rows='30'><![CDATA[" + res.toIntercepterLogicXml() +"]]></textarea>");

			// Package + Class Name 으로 Build
			strCompileResult = res.build(strPKG,strIC);
			// BizData 에는 Package 와 Class Name 이 연결되어 저장.
			
			//strCompileResult = BusinessHelper.revert(strCompileResult);
			if(strCompileResult.equals(""))
			{
				strCompileResult  =  "정상";
				if(isBP)
				{
					bd.setAOP_INTERCEPTER(strPKG + "."+strIC);
				}
				else
				{
					bc.setAOP_INTERCEPTER(strPKG + "."+strIC);
				}
				xmlResource.save(bc);

			}
			
		}
		else
		{
			strCompileResult = "There is no Package...";
		}
	} 
	catch (Exception e) 
	{
		e.printStackTrace();
		strCompileResult = e.getMessage() + "===>" + e.toString();
	}

out.println("</pre>");

%>

<TABLE board="1">
<TR>
	<TD>컴파일 결과</TD>
</TR>
<TR>
	<TD><%=strCompileResult%></TD>
</TR>
<TR>
	<TD><a href="javascript:self.close();">닫기</a></TD>
</TR>
</TABLE>
</body>
</html>

