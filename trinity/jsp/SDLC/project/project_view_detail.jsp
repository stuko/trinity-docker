<%@ page contentType="text/xml; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%
String dfdx_name = (String)request.getAttribute("dfdx_name");
String subject_name = (String)request.getAttribute("subject_name");
String[][] array_data_list = (String[][])request.getAttribute("array_data_list");
String[][] array_link = (String[][])request.getAttribute("array_link");
String[] array_link_delim = (String[])request.getAttribute("array_link_delim");
String[] array_insert_cols = (String[])request.getAttribute("array_insert_cols");
String[] array_insert_datas = (String[])request.getAttribute("array_insert_datas");
String[][] array_insert_form = (String[][])request.getAttribute("array_insert_form");
%> 

<%
DefaultXmlResource res = DefaultXmlResource.getInstance();
DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(dfdx_name);
String key = request.getParameter("key");
%>
<script language="javascript">
function go_delete_subject(delete_key)
{
	if(confirm("정말로 삭제하시겠습니까?"))
	{
		with(frm_subject)
		{
			CMD.value="CMD_SEQ_102962562011303546433449";
			code.value="remove";
			key.value = delete_key;
			submit();
		}
	}
}
function go_update_subject(update_key)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_109660452001303606971300&key=" + update_key;
}
function go_list_subject()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_103268080161277556302281";
}
 
</script>
<form name="frm_subject" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD"></input>
<input type="hidden" name="code"></input>
<input type="hidden" name="key"></input>
</form>
<p><h1><img src="/jsp/anaconda/img/product.png" border="0" width="20px" height="20px"></img>&nbsp;&nbsp;<%=subject_name%>  상세보기</h1></p>
<p>
<input type="button" value="<%=subject_name%>  목록" onClick="javascript:go_list_subject();"></input>
<input type="button" value="<%=subject_name%>  수정" onClick="javascript:go_update_subject('<%=key %>');"></input>
<input type="button" value="<%=subject_name%>  삭제" onClick="javascript:go_delete_subject('<%=key %>');"></input></p>
<table cellspacing=0 cellpadding=0 class="styled">
<colgroup>
<col widt="20%"></col>
<col widt="80%"></col>
</colgroup>
<thead>
<th>이름</th>
<th>값</th>
</thead>
<tbody>
<%
if(col != null)
{
	DefaultXmlData dxd = col.getDefaultXmlData(key);
	String str_key = "";		

	if(dxd != null)
	{
		str_key = dxd.getNAME();
	}
	
	for(int i = 0; i < array_data_list[0].length; i++)
	{
%>
		<tr>
		<td><%=array_data_list[0][i]%></td><td><%=dxd.getData(array_data_list[1][i]) %></td>
		</tr>
<%		
	}
%>
<%
}
else
{
%>
	<tr>
	<td colspan="2">진행중인 <%=subject_name%>가 없습니다. </td>
	</tr>
<%	
}
%>
</tbody>
</table>
