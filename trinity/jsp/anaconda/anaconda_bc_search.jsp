<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="java.util.*"%>
<%
	String strObject = request.getParameter("Object");
	String strText = request.getParameter("inputText") == null ? "" : request.getParameter("inputText").trim();	
	String strParam = request.getParameter("srh_param") == null ? "" : request.getParameter("srh_param").trim();
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
<p></p>
<form name="frm" method="POST" action="/Anaconda.do?CMD=CMD_SEQ_105987900951290598606770&title=비즈니스서비스조회">
  <input type="hidden" class="styled" name="Object" size="30" value="<%=strObject%>">
<!----------------------------------------- 검색 조건및 등록 테이블 시작---------------------------------------->	
		<table >
		  <tr>
			<td align="right"><b>조회조건</b>&nbsp;&nbsp;&nbsp;</td>
			<td>
			  <SELECT NAME='srh_param'>
			    <OPTION>선택</OPTION>
			    <OPTION value='BC' <%=strParam.equals("BC")?"selected":""%>>비즈니스 서비스 명</OPTION>
	  		  </SELECT>
                        </td>
                        <td>
	  		  <input type="text" class="styled" name="inputText" size="30" value="<%=strText%>">
                       </td>
                       <td>
	  		  <input type="submit" class="button white" name="" value="조회" onClick="javascript:AnacondaSubmit(document.frm);">			  
	  		</td>
		  </tr>
		</table>
		
<!----------------------------------------- 검색 조건및 등록 테이블 끝------------------------------------------>
<!----------------------------------------- 리스트 보여주는 테이블 시작----------------------------------------->
		<table>
		<thead>
		<tr>
		<th scope="col">비즈니스 서비스 명</th>
		<th scope="col">비즈니스 서비스 코드</th>
		<th scope="col">기능</th>
		</tr>
		</thead>
		<tbody>
		<%
			try
			{
				BizLogicXmlResource biz = BizLogicXmlResource.getInstance();
				Iterator it = biz.getBusinessCollection();
				BusinessCollection businessCollection = null;
				if (!strText.equals("") && strText!= null && strParam.equals("BC")) {
					it = biz.searchBusinessCollectionLikeName(strText);
				}else{
					it = biz.getBusinessCollection();
				}

				if(it != null)
				{
					for (int i = 0;it.hasNext();i++)
					{    				
						businessCollection = (BusinessCollection)it.next();
					    out.println("<tr align=\"left\">");
					    out.println("<td width=\"30%\" height=\"20\"  bgcolor=\"#FFFFFF\"><b>"+businessCollection.getBIZ_COLLECTION_KOR_NAME()+ "</b></td>");
					    out.println("<td width=\"60%\" height=\"20\"  bgcolor=\"#FFFFFF\">"+businessCollection.getBusinessName()+"</td>");
					    out.println("<td height=\"20\" align=\"center\" bgcolor=\"#FFFFFF\">&nbsp;&nbsp;<button class=\"button white\" type=\"button\" name=\"btn_"+i+ "\" value=\"확인\" onClick=\"javascript:fn_FrmInput('"+businessCollection.getBusinessName()+"');\">확인</button></td>");
					    out.println("</tr>");
					}	
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
		</tbody>
		</td>
		</tr>
		</table>
</form>
<p></p>
