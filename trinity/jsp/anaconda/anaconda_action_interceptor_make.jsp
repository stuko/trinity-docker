<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.action.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="com.stuko.anaconda.business.BusinessData"%>
<%@ page import="com.stuko.anaconda.business.BusinessHelper"%>
<%@ page import="com.stuko.anaconda.business.BusinessItem"%>
<%@ page import="com.stuko.anaconda.business.BusinessCollection"%>


<%
    String strBizCol = request.getParameter("BizCol");
	String strBizProc = request.getParameter("BizProc");

    String strCompileResult  = "";
	String strBefore = "";
	String strAfter = "";
	String strIC = "";
	String strPKG = "";

    WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();
	WebAction wa = null;
	WebActionCollection wac = null;
	AutoSeq autoseq = new AutoSeq();
	boolean IsStandardIntercepter = false;
	String strICType = BlankField.INTERCEPTER_WEBACTION;

	try
	{		
		wa = xmlResource.searchWebActionEqualsName(strBizCol,strBizProc);
		strAfter	=	BusinessHelper.convert(wa.getAOP_POINT_CLASS());
		strBefore	=	BusinessHelper.convert(wa.getAOP_POINT_METHOD());
		strIC = wa.getAOP_INTERCEPTER();

		if(strIC.equals(BlankField.AC_CONDITIONAL_INTERCEPTER_CLASS)|| strIC.equals(BlankField.AC_SIMPLE_INTERCEPTER_CLASS))
		{
			IsStandardIntercepter = true;
		}

		if(strIC.equals(BlankField.AC_CONDITIONAL_INTERCEPTER_CLASS)) strICType = BlankField.INTERCEPTER_COND_ACTION;
		if(strIC.equals(BlankField.AC_SIMPLE_INTERCEPTER_CLASS)) strICType = BlankField.INTERCEPTER_SIMPLE_ACTION;

		// Package 가 있는 경우.
		if(strIC.lastIndexOf(".") >= 0)
		{
			strPKG = strIC.substring(0,strIC.lastIndexOf("."));
			strIC = strIC.substring(strIC.lastIndexOf(".")+1);

			if(BusinessHelper.checkBusinessNull(strIC) && IsStandardIntercepter)
			{
				strIC = autoseq.getIntercepterSeq();
			}
		}

		IntercepterSourceXmlResource res = IntercepterSourceXmlResource.getInstance();

		System.out.println(">>>>>>>>>>>>>>>>[" + res.getIntercepterSource(strPKG, strIC) + "]");


		if(strPKG.length() > 0)
		{
			
			System.out.println(strPKG + "/" + strIC);

			res.register(strPKG
						,strIC
						,BlankField.INTERCEPTER
						,strBefore
						,strAfter
						,strICType);
			res.save();

			if(res.getIntercepterSourceCollection(strPKG) == null)
			{
				System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++");
			}
			else
			{
				System.out.println("-------------------------------------------------");
			}

			System.out.println("XML=" + res.toIntercepterLogicXml());

			// Package + Class Name 으로 Build
			strCompileResult = res.build(strPKG,strIC);
			// BizData 에는 Package 와 Class Name 이 연결되어 저장.
			wa.setAOP_INTERCEPTER(strPKG + "."+strIC);
			//strCompileResult = BusinessHelper.convert(strCompileResult);
			strCompileResult = strCompileResult == "" ? "Normal" : strCompileResult;
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
%>
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
<TABLE>
<TR>
	<TD>Compiled Result</TD>
</TR>
<TR>
	<TD><%=strCompileResult%></TD>
</TR>
<TR>
	<TD><a href="javascript:self.close();">Close</a></TD>
</TR>
</TABLE>
</body>
</html>

