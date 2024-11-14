<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.net.*"%><%@ page import="java.util.*"%><%@ page import="java.net.*"%><%@ page import="com.stuko.anaconda.XmlConfig.*"%><%@ page import="com.stuko.anaconda.business.*"%><%@ page import="com.stuko.anaconda.value.*"%><%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%><%@ page import="com.stuko.anaconda.util.InitClass"%>
<%
	DefaultXmlResource res = DefaultXmlResource.getInstance();
	String strLayoutName = (String)request.getAttribute(InitClass.DEFAULT_LAYOUT_NAME);
	String strAreaFile = (String)request.getAttribute(InitClass.DEFAULT_AREA);
	String strBody = (String)request.getAttribute(InitClass.LAYOUT_BODY);
	System.out.println("[Layout]----->" + strLayoutName);	
	System.out.println("[AreaFile]--->" + strAreaFile);	
	System.out.println("[Body]------->" + strBody);	
	DefaultXmlDataCollection col_area = res.getDefaultXmlDataCollection(BlankField.ANACONDA_AREA);
	DefaultXmlDataCollection col_ui = res.getDefaultXmlDataCollection(BlankField.ANACONDA_UI);
	DefaultXmlDataCollection col_layout = res.getDefaultXmlDataCollection(BlankField.ANACONDA_LAYOUT);
	 
	DefaultXmlData dxd = col_layout.getDefaultXmlData(strLayoutName);
	String strTitle = dxd.getData("title");
	String strJs = dxd.getData("js");
	String strJsContents = dxd.getData("jsContents");
	String strCss = dxd.getData("css");
	String strCssContents = dxd.getData("cssContents");

	String strContainerStyle = dxd.getData("style");
	String strContainerClass = dxd.getData("class");
	
	strContainerStyle = BusinessHelper.checkBusinessNull(strContainerStyle) == false ? "" : strContainerStyle;
	strContainerClass = BusinessHelper.checkBusinessNull(strContainerClass) == false ? "" : strContainerClass;
	
	DefaultXmlDataCollection col_result = col_area.getDefaultXmlData("layout_name", dxd.getNAME());
	
	//out.println(col_result.toString());
	
	InitClass mInitClass = InitClass.getInstance();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="google-signin-scope" content="profile email"/>
<meta name="google-signin-client_id" content="942271135678-rvhbvsuf5277ro26j8d57g8idle3olqg.apps.googleusercontent.com"/>
<title><%=strTitle %></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<%
if(BusinessHelper.checkNull(strJs)){
	if(strJs.indexOf(';') >=0){
		String[] arrJs = strJs.split(";");
		for(String js : arrJs){
                        js = js.trim();
			if(js.startsWith("<script") || js.startsWith("<meta")){
				%><%=js %><%				
			}else{		
				%><script type="text/javascript" src="<%=js %>"  charset="euc-kr"></script><%
			}
		}
	}else{
		if(strJs.startsWith("<script") || strJs.startsWith("<meta")){
			%><%=strJs %><%				
		}else{
			%><script type="text/javascript" src="<%=strJs %>"  charset="utf-8"></script><%
		}
	}
}
if(BusinessHelper.checkNull(strCss)){
	if(strCss.indexOf(';') >=0){
		String[] arrCss = strCss.split(";");
		for(String css : arrCss){
                        css = css.trim();
			if(css.startsWith("<link") || css.startsWith("<meta")){
			%><%=css %><%				
			}else{				
			%><link href="<%=css %>" rel="stylesheet" type="text/css" media="screen"  charset="utf-8" /><%
			}
		}
	}else{
		if(strCss.startsWith("<link") || strCss.startsWith("<meta")){
			%><%=strCss %><%				
		}else{				
			%><link href="<%=strCss %>" rel="stylesheet" type="text/css" media="screen"  charset="utf-8"/><%
		}
	}
}
%>
<script>
<%
if(BusinessHelper.checkNull(strJsContents)){
     out.println(strJsContents);
}
%>
</script>
<style>
<%
if(BusinessHelper.checkNull(strCssContents)){
     out.println(strCssContents);
}
%>
</style>
</head>
<body>
<% // 사용할 아나콘다 레이아웃 이름 %>
<% 
// 사용할 몸체 파일  
// IsPanel = true --> Anaconda UI
// AreaFile 는 지정하지 않으면 Default가 지정됨.
%>
<%
try
{
%>
<jsp:include page="<%=strAreaFile %>" flush="true" >
	<jsp:param value="<%=strLayoutName %>" name="anaconda.area.name"/>
	<jsp:param value="<%=strBody %>" name="anaconda.area.body"/>
</jsp:include>
<%
}
catch(Exception e)
{
	out.println(e.toString());
}
%>
</body>
</html>
