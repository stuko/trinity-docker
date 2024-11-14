<%@ page contentType="text/xml; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<script language="javascript">
<%
String dfdx_name = (String)request.getAttribute("dfdx_name");
String subject_name = (String)request.getAttribute("subject_name");
String page_size = (String)request.getAttribute("page_size");
int int_page_size = Integer.parseInt(page_size);
String[][] array_data_list = (String[][])request.getAttribute("array_data_list");
String[][] array_link = (String[][])request.getAttribute("array_link");
String[] array_link_delim = (String[])request.getAttribute("array_link_delim");
String[] array_insert_cols = (String[])request.getAttribute("array_insert_cols");
String[] array_insert_datas = (String[])request.getAttribute("array_insert_datas");
String[][] array_insert_form = (String[][])request.getAttribute("array_insert_form");

int page_num = 1;
if(BusinessHelper.checkBusinessNull(request.getParameter("page_num")))
{
	page_num = Integer.parseInt(request.getParameter("page_num"));
}
%> 
 

function show_div_create_subject()
{
	fnShowOrHideMenu("div_create_subject");
}
function create_subject()
{
	with(frm_subject)
	{
		submit();
	}
}
function go_subject(key,project_name)
{
	document.location.href="/Anaconda.do?CMD=CMD_SEQ_106507566601303605947939&key=" + key;
}
</script>
<form name="frm_view_subject" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD"></input>
<input type="hidden" name="code"></input>
<input type="hidden" name="key"></input>
</form>
<p><h1><img src="/jsp/anaconda/img/product.png" border="0" width="20px" height="20px"></img>&nbsp;&nbsp;<%=subject_name%>  목록</h1></p>
<p><input type="button" value="<%=subject_name%>  신규" onClick="javascript:show_div_create_subject();"></input></p>
<table cellspacing=0 cellpadding=0 class="styled">
<colgroup>
<col ></col>
<%
String[] array_cols = array_data_list[0];
for(int k = 0; k < array_cols.length; k++)
{
%>	
<col ></col>
<%
}
%>
</colgroup>
<thead>
<th>No</th>
<%
for(int k = 0; k < array_cols.length; k++)
{
%>	
<th><%=array_cols[k] %></th>
<%
}
%>
</thead>
<tbody>
 <%
DefaultXmlResource res = DefaultXmlResource.getInstance();
DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(dfdx_name);

if(col != null)
{
	int iCount = col.size();
	int divide = iCount / 5;
	int modCount = iCount % 5;
	// Iterator it = col.getDefaultXmlDatas();
	for(int i = page_num*int_page_size ;i < iCount && i < (page_num-1)*int_page_size ;i--)
	{
		// DefaultXmlData dxd = (DefaultXmlData)it.next();
		DefaultXmlData dxd = (DefaultXmlData)col.get(i);
		String str_key = "";		

		if(dxd != null)
		{
			str_key = dxd.getNAME();
		}
%>
	<tr>
	<td><%=i %></td>
	
	<%
	String[] array_datas = array_data_list[1];
	for(int j = 0; j < array_datas.length; j++)
	{
		String link_data = "";
		for(int jj = 0; jj < array_link.length; jj++)
		{
			int link_num = Integer.parseInt(array_link[jj][0]);
			if(j == link_num)
			{
				String link_param = array_link_delim[2] + str_key + array_link_delim[4]; 
				for(int xx = 2; xx < array_link[jj].length; xx++)
				{
						link_param = link_param +  array_link_delim[3] + array_link_delim[2] + array_link[jj][xx] + array_link_delim[4];
				}
				link_data = array_link_delim[0] + array_link[jj][1] + array_link_delim[1] + link_param + array_link_delim[5] ;
			}
		}
	%>
		<% if(!link_data.equals("")){%>
		<td><a href="#" onClick="<%=link_data%>"><%=dxd.getData(array_datas[j]) %></a></td>
		<%}else{ %>
		<td><%=dxd.getData(array_datas[j]) %></a></td>
		<%}%>
	<%
	}
	%>
	
	</tr>
<%
	}
}
else
{
%>
	<tr>
	<td colspan="<%=array_cols.length%>">진행중인 <%=subject_name%>가 없습니다. </td>
	</tr>
 <%	
}
 %>
 <tr>
 <td colspan="<%=array_cols.length%>">
  <%
  int total = col.size();
  int page_count = total/int_page_size + 1;
  for(int iPage = 1; iPage <= page_count; iPage++)
  {
  %>
  	<a href="/Anaconda.do?CMD=CMD_SEQ_103268080161277556302281&page_num=<%=iPage%>" ><%=iPage%></a>&nbsp;
  <%
  }
  %>
 </td>
 </tr>
</tbody>
</table>

<div id="div_create_subject" style="display:none;background:white;">
<form name="frm_subject" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_102962562011303546433449"></input>
<input type="hidden" name="code" value="create"></input>
<table>
<colgroup>
<col width="20%"></col>
<col width="80%"></col>
</colgroup>
<thead>
<th>이름</th>
<th>값</th>
</thead>
<tbody>
<%
for(int ins_row = 0; ins_row < array_insert_form.length; ins_row++)
{
	String[] array_frm_data = array_insert_form[ins_row];
	if(array_frm_data[0].equals("textarea"))
	{
		String[] size = array_frm_data[1].split(",");
		String cols = size[0];
		String rows = size[1];
		
%>
<tr><td><%=array_insert_cols[ins_row]%></td><td><<%=array_frm_data[0]%> name="<%=array_frm_data[2]%>" cols="<%=cols%>" rows="<%=rows%>"></<%=array_frm_data[0]%>></td></tr>
<%
	}
	else
	{
%>
<tr><td><%=array_insert_cols[ins_row]%></td><td><input type="<%=array_frm_data[0]%>" name="<%=array_frm_data[2]%>" size="<%=array_frm_data[1]%>"></input></td></tr>
<%
	}
}
%>
<tr><td colspan="2"><input type="button" value="<%=subject_name%> 저장" onClick="javascript:create_subject();"></input></td></tr>
</tbody>
</table>

</form>
</div>
