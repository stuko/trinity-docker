<%@ page contentType="text/xml; charset=UTF-8" %><%@page pageEncoding="UTF-8" %>
<%@ page import="java.net.*"%><%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%
	String strObject = request.getParameter("Object");
	String search = request.getParameter("search");
%>

<script language="javascript">
<!--
function fn_FrmInput(data)
{
	var object = eval(<%=strObject%>);
	object.value = data;
	self.close();
	return;
}
//-->
</script>
<form name="frm" method="POST" action="/Anaconda.do?CMD=CMD_SEQ_107571796881288935101238&title=Layout&Object=<%=strObject%>">
<!----------------------------------------- 검색 조건및 등록 테이블 시작---------------------------------------->	
		<table border="0" cellpadding="0" cellspacing="0" id="list3">
		  <tr>
			<td align="right"><b>Search condition</b>&nbsp;&nbsp;&nbsp;</td>
			<td>
	  		  <input type="text" class="styled" name="search" size="30" value="<%=search%>">
	  		  <input type="hidden" class="styled" name="Object" size="30" value="<%=strObject%>">
	  		  <input type="submit" class="button white" name="" value="Search" onClick="javascript:AnacondaSubmit(document.frm);">			  
	  		</td>
		  </tr>
		</table>
<!----------------------------------------- 검색 조건및 등록 테이블 끝------------------------------------------>
<!----------------------------------------- 리스트 보여주는 테이블 시작----------------------------------------->
		<table class="table_hydra" cellspacing="1" cellpadding="1" >
		<colgroup>
		<col width="30%">
		<col width="40%">
		<col>
		</colgroup>
		<thead>
		<tr>
		<th scope="col">Layout name</th>
		<th scope="col">Layout code</th>
		<th scope="col">Function</th>
		</tr>
		</thead>
		<tbody>
		<%
			try
			{
				DefaultXmlResource res = DefaultXmlResource.getInstance();
				DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_LAYOUT);
				
				if(col != null)
				{
					Iterator it = col.getDefaultXmlDatas();
					for(;it.hasNext();)
					{
						DefaultXmlData dxd = (DefaultXmlData)it.next();
						if(!BusinessHelper.checkBusinessNull(search) || (dxd.getData("name").indexOf(search) >= 0 || dxd.getNAME().indexOf(search) >= 0))
						{
							%>
							<tr>
							<td><%=dxd.getData("name") %></td>
							<td><%=dxd.getNAME() %></td>
							<td><input type="button" class="button white" value="Select" onClick="javascript:fn_FrmInput('<%=dxd.getNAME() %>');"></input></td>
							</tr>
							<%
						}
					}
						
				}
			} catch (Exception e) {
				ExceptionCenter.catchException(e);
			}
		%>
		</tbody>
		</td>
		</tr>
		</table>
</form>
