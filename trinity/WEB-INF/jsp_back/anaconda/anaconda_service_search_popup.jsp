<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.business.BusinessData"%>
<%@ page import="com.stuko.anaconda.business.BusinessCollection"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%
	String strObject = request.getParameter("Object");
	String strText = request.getParameter("inputText") == null ? "" : request.getParameter("inputText").trim();	
	String strParam = request.getParameter("srh_param") == null ? "" : request.getParameter("srh_param").trim();
%>

<script language="javascript">
function fn_FrmInput(args){
	var object = eval(<%=strObject%>);
	if(object == null) 	opener.document.frm.bizservice.value  = args;
	else object.value = args;
	self.close();
	return;
}
</script>

<form name="frm" method="POST" action="/Anaconda.do?CMD=CMD_SEQ_109678783811287278764362&title=Search">
	<table>
		<tr>
		<td align="right"><b>조건</b>&nbsp;&nbsp;&nbsp;</td>
		<td>
			<SELECT NAME='srh_param'>
			<OPTION>Select</OPTION>
			<OPTION value='BUSINESS_COLLECTION_NAME' <%=strParam.equals("BUSINESS_COLLECTION_NAME")?"selected":""%>>서비스 그룹 이름</OPTION>
			<OPTION value='SERVICE_NAME' <%=strParam.equals("SERVICE_NAME")?"selected":""%>>서비스 이름</OPTION>
			</SELECT>
		</td>
		<td>
			<input type="text" class="styled" name="inputText" size="30" value="<%=strText%>">
		</td>
		<td>
			<input type="submit" class="button white" name="" value="검색" onClick="javascript:AnacondaSubmit(document.frm);">			  
		</td>
		</tr>
	</table>
	<table>
		<colgroup>
			<col width="40%">
			<col width="30%">
			<col>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">서비스 이름</th>
				<th scope="col">설명</th>
				<th scope="col">기능</th>
			</tr>
		</thead>
		<tbody>
		<%
			try
			{
				BizLogicXmlResource xmlResource = BizLogicXmlResource.getInstance();				
				Iterator it = xmlResource.getBusinessCollection();
				BusinessCollection businessCollection = null;
				BusinessData bizdata = null;   
				
				if (!strText.equals("") && strText!= null && strParam.equals("BUSINESS_COLLECTION_NAME")) {
					it = xmlResource.searchBusinessCollectionLikeName(strText);
				} else if (!strText.equals("") && strText!= null && strParam.equals("SERVICE_NAME")) {
					it = xmlResource.searchBusinessDataLikeServiceName(strText);
				} 			
				
				for (int i = 0;it.hasNext();i++){    				
					businessCollection = (BusinessCollection)it.next();		
					// Iterator iterator = businessCollection.iterator();
					out.println("<tr align=\"left\">");
					out.println("<td width=\"30%\" height=\"20\"  bgcolor=\"#FFFFFF\"><b>"+businessCollection.getBIZ_COLLECTION_KOR_NAME()+ "</b><br>("+businessCollection.getBusinessName()+")</td>");
					out.println("<td width=\"60%\" height=\"20\"  bgcolor=\"#FFFFFF\"></td>");
					out.println("<td height=\"20\" align=\"center\" bgcolor=\"#FFFFFF\"><input type=\"button\"  class=\"button white\" name=\"btn_"+i+ "\" value=\"Select\" onClick=\"javascript:fn_FrmInput('"+businessCollection.getBusinessName()+"');\"></td>");
					out.println("</tr>");				    
				}	
				xmlResource.release();
			} catch (Exception e) {	ExceptionCenter.catchException(e); }
		%>
		</tbody>
	</table>
</form>

