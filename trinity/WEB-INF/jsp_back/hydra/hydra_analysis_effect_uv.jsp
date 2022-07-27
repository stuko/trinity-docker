<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.bi.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.Exception.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="com.stuko.anaconda.jstl.util.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Analysis-Logging</h3>
		</div>
	</div>
</div>


 <table class="table-neo">
    <thead class="th-neo">
   <td>날짜</td>
   <td>금주 Unique Visitor</td>
   <td>전주 Unique Visitor</td>
   <td>증/감율</td>
   </thead>
<%
try
{
	BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"uniquevisitor-now");
	BusinessCollection bc2 = RequestHelper.getBusinessCollection(request,"uniquevisitor-before");
	if(bc1.size() > 0 && bc2.size() > 0)
	{
	for(int i = 0;i < 7;i++)
	{
		BusinessData bd1 = bc1.getBusinessData(i);
		BusinessData bd2 = bc2.getBusinessData(i);
		String yyyymmdd = bd1.getFieldValue("YYYYMMDD");
		yyyymmdd = yyyymmdd.substring(0,4) +"-"+yyyymmdd.substring(4,6)+"-"+yyyymmdd.substring(6,8);
		String pv1 = bd1.getFieldValue("CNT");
		String pv2 = bd2.getFieldValue("CNT");
		double irop = Math.round(((Double.parseDouble(pv1) - Double.parseDouble(pv2))/Double.parseDouble(pv2))*10000)/100;
		String arrow = (irop >= 0) ? "up" : "down";
        String star = (Math.abs(irop) >= 10) ? "star" : "";
%>
<tr>
<td ><%=yyyymmdd%></td>
<td><%=pv1%></td>
<td ><%=pv2%></td>
<td ><%=irop%>&nbsp%
&nbsp<img src="/jsp/hydra/img/analysis_pageview_<%=arrow%>.png" width="20px" align="absmiddle">
<% if(!"".equals(star)){%>&nbsp<img src="/jsp/hydra/img/analysis_pageview_<%=star%>.png" width="15px"  align="absmiddle"><%}
else{%>&nbsp;&nbsp;&nbsp;&nbsp;<%}%>
</td>
</tr>
<%
	
	}
	}
}
catch(Exception e)
{
	e.printStackTrace();
}


%>
 </table>
 <br>
</div>

</div>

