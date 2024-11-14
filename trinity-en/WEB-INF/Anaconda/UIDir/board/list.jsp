<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.net.*"%><%@ page import="java.util.*"%><%@ page import="java.net.*"%><%@ page import="com.stuko.anaconda.XmlConfig.*"%><%@ page import="com.stuko.anaconda.business.*"%><%@ page import="com.stuko.anaconda.value.*"%><%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%><%@ page import="com.stuko.anaconda.util.InitClass"%><%@ page import="com.stuko.anaconda.service.*"%>
<%

/**
< UI Component Interface >
1. PagePosition 
	- Name : pos
	- Type : Integer ( 0 ~ ??? )
	- Desc : 현재 페이지의 위치를 알려줌.
2. CSS Skin Name
    - Name : skin
    - Type : String
	- Desc : 사용할 CSS Skin 이름
3. SKIN Info
    - board_div_skin
	- board_table_skin
	- board_tr_skin
	- board_td_skin
4. Usage
<jsp:include page="XXXXXX" flush="true" >
	<jsp:param value="XXXXXX" name="pos"/>
	<jsp:param value="XXXXXX" name="skin"/>	
</jsp:include>
**/
//------------------------------------------------------
// Interface Parameter
//------------------------------------------------------
String strPos = request.getParameter("pos"); 
String strSkin = request.getParameter("skin"); 
if(!BusinessHelper.checkBusinessNull(strPos))
{
	System.out.println("Parameter is not Setted....");
	BusinessData businessData = (BusinessData)request.getAttribute(InitClass.getBusinessDataValue());
	strPos = businessData.getFieldValue("pos");
	System.out.println("BusinessData's pos is " + strPos);
}
%>

<script language="javascript">
var strCss = document.createElement("link");
strCss.type = "text/css";
strCss.rel = "stylesheet";
strCss.href = "<%=strSkin%>";
document.getElementsByTagName("head").item(0).appendChild(strCss);
</script>

<!--link href="<%=strSkin%>" type="text/css" /-->
<div id="board_list" class="board_div_skin">
<table class="board_table_skin">
<%
if(!BusinessHelper.checkBusinessNull(strPos))
{
	strPos = "0";
}
BizLogicXmlResource bxr = BizLogicXmlResource.getInstance();
TrinityService trinity = new TrinityService();
BusinessData parameter = new BusinessData();
parameter.setFieldValue("pos",strPos);
parameter.setFieldValue("code","list");
BusinessData process = bxr.searchBusinessDataEqualsServiceName("BC_SEQ_102637129171306243004111","notice_list");
ReturnValue rst = trinity.invokeDirectly(process,parameter);
BusinessCollection result = (BusinessCollection)rst.mORtn;
%>
<%
Iterator it = result.iterator();
for(;it.hasNext();)
{
	BusinessData data = (BusinessData)it.next();
%>
<tr class="board_tr_skin">
<%  
	Iterator subIt = data.iterator();
    for(;subIt.hasNext();)
	{
		BusinessItem item = (BusinessItem)subIt.next();
%>
	<td class="board_td_skin"><%=item.getCValue()%></td>
<%
	}
%>
</tr>
<%
}
%>
</div>