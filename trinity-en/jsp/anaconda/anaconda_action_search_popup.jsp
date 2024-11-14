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
<form name="frm" method="POST" action="/Anaconda.do?CMD=CMD_SEQ_109181124291288240727842&title=Search">
<input type="hidden" name="Object" value="<%=strObject %>"></input>
<!----------------------------------------- 검색 조건및 등록 테이블 시작---------------------------------------->	
		<table>
		  <tr>
			<td align="right"><b>Search condition</b>&nbsp;&nbsp;&nbsp;</td>
			<td>
			  <SELECT NAME='srh_param'>
			    <OPTION>Select</OPTION>
			    <OPTION value='Action' <%=strParam.equals("Action")?"selected":""%>>Action name</OPTION>
	  		  </SELECT>
                        </td><td>
	  		  <input type="text" class="styled" name="inputText" size="30" value="<%=strText%>">
                        </td><td>
	  		  <input type="submit" class="button white" name="" value="Search" onClick="javascript:AnacondaSubmit(document.frm);">			  
	  		</td>
		  </tr>
		</table>
		
<!----------------------------------------- 검색 조건및 등록 테이블 끝------------------------------------------>
<!----------------------------------------- 리스트 보여주는 테이블 시작----------------------------------------->
		<table>
		<thead>
		<tr>
		<th scope="col">Actoin name</th>
		<th scope="col">Command</th>
		<th scope="col">Function</th>
		</tr>
		</thead>
		<tbody>
		<%
			try
			{
				WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();
				Iterator it = xmlResource.getWebActionCollection();
				WebActionCollection webActionCollection = null;
				WebAction action = null;

				if (!strText.equals("") && strText!= null && strParam.equals("Action")) {
					it = xmlResource.searchWebActionLikeActionKorName(strText);
				}else{
					it = xmlResource.getWebActionCollection();
				}

				if(it != null)
				{
					for (int i = 0;it.hasNext();i++)
					{    				
						webActionCollection = (WebActionCollection)it.next();
						Iterator iterator = webActionCollection.iterator();
					    // Iterator iterator = businessCollection.iterator();
					    for( int j = 0; iterator.hasNext(); j++)
					    {
					    	WebAction webAction = (WebAction)iterator.next();
						    out.println("<tr align=\"left\">");
						    out.println("<td width=\"30%\" height=\"20\"  bgcolor=\"#FFFFFF\"><b>"+webAction.getKOR_NAME()+ "</b></td>");
						    out.println("<td width=\"60%\" height=\"20\"  bgcolor=\"#FFFFFF\">"+webAction.getCOMMAND()+"</td>");
						    out.println("<td height=\"20\" align=\"center\" bgcolor=\"#FFFFFF\">&nbsp;&nbsp;<input type=\"button\" class=\"button white\" name=\"btn_"+i+ "\" value=\"Select\" onClick=\"javascript:fn_FrmInput('"+webAction.getCOMMAND()+"');\"></td>");
						    out.println("</tr>");
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
<p></p>
