<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	int MAX_COL = 2000;
	int MAX_PRC = 2000;
%>
<script language="javascript">
function doRuning(callerName)
{
showRunning(callerName);

}

function doRun(callerName,REQ)
{
	if(REQ != null)
	{
		opener.frmCMManage.cm_list.value = opener.frmCMManage.cm_list.value + REQ.responseText;
		self.close();
	}
}


function fnSelect()
{
	with(frmSelectList)
	{
		for(var i = 0; i < wac_check_list.length ; i++)
		{
		   if(wac_check_list[i].checked == true)
           {
				var hidden = createElement("input","strActionName","checkbox");
				hidden.value = wac_check_list[i].value;
				appendChild(hidden);
		   }
		}
		callAjaxByForm("searchAction", "frmSelectList");
		//submit();
	}
}
</script>
<p><h1>반영 목록 선택</h1></p>
<button type="button" class="button white" name="button1" value="선택" onClick="javascript:fnSelect();">선택</button>
<p></p>
<form name="frmSelectList" id="frmSelectList" method="post" action="/Anaconda.do">
<input type="hidden" name="type" value="searchAction"></input>
<input type="hidden" name="CMD" value="CMD_SEQ_105809171451296883289982"></input>
		<table>
		<caption>액션 리스트</caption>
		<colgroup>
		<col width="80%">
		<col>
		</colgroup>
		<thead >
		<tr>
		<th scope="col">액션 그룹</th>
		<th scope="col">선택</th>
		</tr>
		</thead>
		<tbody >
		<%
			try
			{
				WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();
				Iterator it = xmlResource.getWebActionCollection();
				WebActionCollection webActionCollection = null;
				WebAction action = null;
 
				for (int ii = 0 ;it.hasNext() && ii <= MAX_COL+1 ; ii++)
				{
					webActionCollection = (WebActionCollection)it.next();
					String strRowClass = "left";
					out.println("<tr>");
					out.println("<td align=\"left\" > "+ webActionCollection.getWEBACTION_KOR_NAME() +"</td>");
					out.println("<td align=\"center\" > <input type='checkbox' name='wac_check_list' value='" + webActionCollection.getWEBACTION_NAME() + "'></input></td>");
					out.println("</tr>");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
		</tbody>
		</table>
</form>
<!----------------------------------------- 리스트 보여주는 테이블 끝----------------------------------------->

<p></p>

<button type="button" class="button white" name="button1" value="선택" onClick="javascript:fnSelect();">선택</button>
<p></p>
<p></p>
