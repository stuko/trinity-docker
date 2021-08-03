<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="com.stuko.anaconda.bi.*"%>
<%
try
{
	RequestQueue q = RequestQueue.getInstance();
	Object[] obj = q.getMemoryQueue();
	%>
			<h1 style="font-size:12px;">&nbsp;메모리 사용량(<%=Math.round(Double.parseDouble(((String[])obj[9])[1])) %>MB)</h1>
				<table>
				<tr>
				<td valign="bottom">
				<table height="15px" width="150px" cellpadding=1 cellspacing=1 border=0>
				<%
				for (int k = 0; k < 15; k++)
				{
				%>
					<tr>
					<%
					for(int i = 0; i < obj.length ; i++)
					{	
						Object tmp = obj[i];
						double total = 0;	
						double free = 0;
						double max = 0;
						String strTime = "";
						if(tmp != null)
						{
							String[] tmp1 = (String[])tmp;
							strTime = tmp1[0];
							total = Double.parseDouble(tmp1[1]);
							free = Double.parseDouble(tmp1[2]);
							max = Double.parseDouble(tmp1[3]);
						}
						long x1 = Math.round((15 * total / max));
						long x2 = Math.round((15 * free / max));
						String strBG = "";
						if(k >= 15 - x1) strBG = "red";
						else strBG = "white";
					%>
						<td style="height:1px;width:1px;background-color:<%=strBG %>;"></td>
					<%
						if(k >= 15 - x2) strBG = "blue";
						else strBG = "white";
					%>
						<td style="height:1px;width:1px;background-color:<%=strBG %>;"></td>
					<%
					}
					%>	
					</tr>
				<%
				}
				%>
				<tr><td colspan=20 style="height:10px;background-color:white;font-faminl:돋움체;font-size:10px;color:white;" align="center">(<b style="color:red">total</b><b style="color:blue">free</b>)</td></tr>
				</table>
				</td>
				</tr>
				</table>
<%
}catch(Exception e)
{
	out.println(e.toString());
}

%>
