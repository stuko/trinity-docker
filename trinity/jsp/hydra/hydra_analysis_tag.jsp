
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
			<h3 class="fl">Analysis-Tagging</h3>
		</div>
	</div>
</div>

 <table class="table-neo">
    <thead class="th-neo">
   <td>번호</td>
   <td>항목</td>
   <td>값</td>
   </thead>
<%
try
{
	BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"Tagging");
	for(int i = 0;i < bc1.size();i++)
	{
		BusinessData bd1 = bc1.getBusinessData(i);
		String tag_key = bd1.getFieldValue("TAG_KEY");
		String tag_value = bd1.getFieldValue("TAG_VALUE");
		String tag_name = bd1.getFieldValue("TAG_NAME");
%>
<tr>
<td ><%=tag_key%></td>
<td ><%=tag_name%>&nbsp;<a href="/Anaconda.do?CMD=CMD_SEQ_103306246871332861165495&seq=<%=tag_key%>&tag_value=<%=tag_name%>"><img src="/jsp/hydra/img/analysis_tag_go.png" align="absmiddle" width="15px" border="0">로그분석</a>
&nbsp;<a href="/Anaconda.do?CMD=CMD_SEQ_102694461481332859909744&seq=<%=tag_key%>&tag_value=<%=tag_name%>"><img src="/jsp/hydra/img/analysis_tag_go.png" align="absmiddle" width="15px" border="0">차이분석</a></td>
<td ><%=tag_value%></td>
</tr>
<%
	
	}
}
catch(Exception e)
{
	e.printStackTrace();
}


%>
 </table>
