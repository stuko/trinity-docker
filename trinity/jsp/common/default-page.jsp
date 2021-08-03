<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.XmlConfig.*" %>
<%@ page import="com.stuko.anaconda.service.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<table>
<tfoot>
<td align="center">
<%

// String view_col_name = request.getParameter("view_col_name");
// String view_proc_name = request.getParameter("view_proc_name");
String strCount = request.getParameter("total_count");
String page_name = request.getParameter("page_name");
String page_size = request.getParameter("page_size");
// String[] view_parameter_name = request.getParameter("view_parameter_name").split(",");
// String[] view_parameter_value = request.getParameter("view_parameter_value").split(",");
// String[] view_parameter_type = request.getParameter("view_parameter_type").split(",");
String seq = request.getParameter(page_name);
int size = Integer.parseInt(page_size);
String link = request.getParameter("link");
link = link.indexOf("?") >= 0 ? link + "&" + page_name+"=" : link + "?" + page_name + "=" ;

/**
BusinessData param = new BusinessData();
for(int i = 0; i < view_parameter_name.length; i++){
	param.setFieldValue(view_parameter_name[i],view_parameter_type[i],view_parameter_value[i]);
}

BizLogicXmlResource biz = BizLogicXmlResource.getInstance();
BusinessData process = biz.searchBusinessDataEqualsServiceName(view_col_name,view_proc_name);
TrinityService service = new TrinityService();
ReturnValue rv = service.invokeDirectly(process,param);

if(rv.mBRtn){
	bc = (BusinessCollection)rv.mORtn;
}

if(bc != null)
{
	String strCount = bc1.getBusinessData(0).getFieldValue("CNT");
	if(BusinessHelper.checkBusinessNull(strCount))
	{
**/	
		
		int cnt = Integer.parseInt(strCount);
		int page_count = cnt/size;
		int page_mod = cnt%size;
		// if(page_mod > 0) page_count++;

		if(!BusinessHelper.checkBusinessNull(seq))seq = "0";
		int iseq = Integer.parseInt(seq);
		for(int i = 0; i <= page_count;i++)
		{
			if(iseq == i*size)
			{
			%><%=i+1 %><%
			}
			else
			{
			%><a href="<%=link%><%=i*size%>"><%=i+1 %></a><%
			}
		}


//	}

// }
%>
</td>
</tfoot>
</table>
