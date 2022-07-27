<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%
	String strText = request.getParameter("inputText") == null ? "" : request.getParameter("inputText").trim();	
	String strParam = request.getParameter("srh_param") == null ? "" : request.getParameter("srh_param").trim();
	String strViewColName = request.getParameter("col_name") == null ? "" : request.getParameter("col_name").trim();
	
%>

<script language="javascript">
	function fn_FrmInput(args){
		opener.document.frm.forward.value  = args;	
		self.close();
		return;
	}
</script>
<form name="frm" method="POST" action="/Anaconda.do?CMD=CMD_SEQ_107594712551287278742442&title=화면조회">
	<table>
		<tr>
			<td align="left"><b>조회조건</b>&nbsp;</td>
		<td>
			<SELECT NAME='srh_param'>
				<OPTION>선택</OPTION>
				<OPTION value='FORWARD_NAME' <%=strParam.equals("FORWARD_NAME")?"selected":""%>>화면코드</OPTION>			    
			</SELECT>
		</td>
		<td>
			<input type="text" class="styled" name="inputText" width="100px" value="<%=strText%>">
		</td>
		<td>
			<input type="submit" class="button white" name="" value="검색" onClick="javascript:AnacondaSubmit(document.frm);">			  
		</td>
		</tr>
	</table>
	<table>
		<colgroup>
			<col width="20%">
			<col width="20%">
			<col width="30%">
			<col>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">화면 명</th>
				<th scope="col">화면 코드</th>
				<th scope="col">설명</th>
				<th scope="col">기능</th>
			</tr>
		</thead>
		<tbody>
		<%
			try{
				ViewXmlResource xmlResource = ViewXmlResource.getInstance();					
				Iterator iterator = null;
				Iterator it = null;
				ViewCollection viewCollection = null;				
				View view = null;								
				it 	=	xmlResource.getViewCollection();
				if (!strText.equals("") && strText!= null && strParam.equals("FORWARD_NAME")) {
					iterator = xmlResource.searchViewLikeForward(strText);
				}
				for (;it.hasNext();){    				
					viewCollection = (ViewCollection)it.next();					
					iterator = viewCollection.getViews();

					for(int i =0 ;iterator.hasNext();i++){
						view = (View)iterator.next();				
						out.println("<tr align=\"left\">");
						out.println("<td width=\"30%\" height=\"20\"  bgcolor=\"#FFFFFF\"><b>"+view.getFORWARD_KOR_NAME()+ "</b></td>");		 				
						out.println("<td width=\"30%\" height=\"20\"  bgcolor=\"#FFFFFF\"><b>"+view.getFORWARD_NAME()+ "</b></td>");
						out.println("<td width=\"40%\" height=\"20\"  bgcolor=\"#FFFFFF\"></td>");
						out.println("<td height=\"20\" align=\"center\" bgcolor=\"#FFFFFF\"><input type=\"button\"  class=\"button white\" name=\"btn_"+i+ "\" value=\"선택\" onClick=\"javascript:fn_FrmInput('"+view.getFORWARD_NAME()+"');\"></td>");
						out.println("</tr>");
					}
				}
				xmlResource.release();
				} catch (Exception e) {e.printStackTrace();}
		%>
		</tbody>
	</table>
</form>
