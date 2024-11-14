<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.*"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%
// 크기
String parameter = request.getParameter(BlankField.ANACONDA_AREA_UI);
String strTableClass = "";
if(parameter != null)
{
	DefaultXmlData dxd = (DefaultXmlData)request.getAttribute(parameter);
	if(dxd != null)
	{
		strTableClass = dxd.getData("table.class");
	}
}
//BusinessCollection businessCollection = RequestHelper.getBusinessCollection(request,"table.class");
%>
<style> 
table
{
	background-color:red;
	letter-spacing: 1px;
	border-spacing: 0px;
	border-collapse:separate;
	font-size: 12px;
	font-family:돋움체;
	padding:0px;
	margin:0px;
}
table thead tr th
{
	padding:5px;
	font-size:12px;
	color:#CCFF66;
	background-color:gray;

}
table tbody
{
	padding:5px;
	font-size:12px;
	background-color:green;
	color:#000000;
}
table tbody tr
{
	padding:5px;
	background-color:yellow;
	color:#000000;
	margin:2px;
}

table tbody tr td
{
	padding:5px;
	font-size:12px;
	margin:1px;
	background-color:blue;
	color:#000000;
	border-color:blue;
	border:1px;
}
</style>

<script language="javascript">
</script>

<table id="table1" style="height:50px;overflow-y:scroll">
<thead>
    <tr>       
      <th>Col 0</th>
      <th>Col 1</th>
      <th>Col 2</th>
      <th>Col 3</th>
    </tr>
  </thead>
<tbody style="overflow: auto">
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
<tr><td>static col 1</td><td>static col 2</td><td>static col 3</td><td>static col 4</td></tr>
</tbody>
</table>




