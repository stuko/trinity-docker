<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.*"%>

<%@ page import="com.stuko.anaconda.xtreme.site.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.action.*"%>
<%@ page import="com.stuko.anaconda.bi.*"%>
<%@ page import="com.stuko.anaconda.queue.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="com.stuko.anaconda.util.DateUtil"%>

<script language="javascript">
function fnViewDebugDetail(sdiv)
{
	fnShowOrHideMenu(sdiv);
}
</script>
		<div class="post">
<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Error </h3>
		</div>
	</div>
</div>
<div class="entry" >
<table cellspacing=0 cellpadding=0 border=0 height="300px">
<tr>
<td valign="top">
<ul>
<%
try
{
WebActionXmlResource war = WebActionXmlResource.getInstance();
RequestQueue q = RequestQueue.getInstance();
Object[] obj = q.getErrorQueue(); 
for(int i = obj.length -1 ; i >= 0 ; i--)
{
	Object tmp_object = obj[i];
	if(tmp_object != null)
	{
		
		if(tmp_object instanceof String[])
		{
			String[] debug = (String[])tmp_object;
			String cmd = "";
			String err = "";
			String desc = "";
			String gap = "";
			if(BusinessHelper.checkBusinessNull(debug[1]))
			{
				cmd = debug[1];
			}
			if(BusinessHelper.checkBusinessNull(debug[2]))
			{
				err = debug[2];
			}
			if(BusinessHelper.checkBusinessNull(debug[3]))
			{
				gap = DateUtil.getDiff(Long.parseLong(debug[3]),System.currentTimeMillis());
			}
			
			WebAction wa = war.searchWebAction(cmd);
			
			if(wa != null)
			{
				desc = wa.getKOR_NAME();
			}
%>
		<li>
		<h2 style="color:#000000;"><b><%=debug[0] %>&nbsp;(<b style="color:red"><%=gap%></b>)&nbsp;버그</b></h2>
		<h1 style="color:#000000;"><a href="javascript:fnNull();" onClick="javascript:fnViewDebugDetail('debug<%=i %>');"><img src="/jsp/hydra/img/view.png" width="15px" height="15px" border="0" align="absmiddle"></img>&nbsp;자세히보기</a>&nbsp;&nbsp; 원인 : <b>
		<% if(wa !=null) {%>
		<a href="/Anaconda.do?CMD=CMD_SEQ_109283388491287276486644&ActColName=||<%=wa.getWEBACTION_COLLECTION_ID()%>||&ActName=<%=wa.getNAME()%>"><%=cmd %></a>
		<% } %>
		</b></h1>
		<p><div  style="width:800px;overflow-x:scroll;"><pre><%=BusinessHelper.getSubString(err,300,"...") %></pre></div></p>
		<div id="debug<%=i %>" style="display:none;border: 1px double #BF95FF;padding: 10px 10px 10px 10px;background-color:#FFFFFF;position:absolute;width=400px;height:300px;overflow-x:scroll;overflow-y:scroll;">
		<pre><%=err %></pre>
		</div>
		</li>
<%
		}
	}
}
}
catch(Exception e)
{
	out.println(e.toString());
}
%>
</ul>
</td>
</tr>
</table>
</div>
</div>





