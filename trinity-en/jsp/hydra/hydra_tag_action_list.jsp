<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.XmlConfig.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script language="javascript">
function fnSelectActionTag(seq)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_103887139671332632677561&seq="+seq;
}
function fnRegisterActionTag()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_107386529521332633574618";
}
function fnPage(page)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_108051816571332631235045&pos="+page;
}
function deleteTag(seq)
{
	if(confirm("정말로 삭제 하시겠습니까?"))
	{
		document.location.href = "/Anaconda.do?CMD=CMD_SEQ_101885741241332631248919&code=delete&seq="+seq;
	}
}
</script>

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Action(Command) Tagging List</h3>
			<span class="fr"><input type="button" class="button white" name="Register" value="Tagging" onClick="javascript:fnRegisterActionTag();"></span>
		</div>
	</div>
</div>




  <table class="table-neo">
   <thead class="th-neo">
   <td>Tag</td>
   <td>Action-Tagging Name</td>
    <td>Action(Command)</td>
	 <td>Func.</td>
   </thead>
 	<%
		BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getTagList");
							
		Iterator it = bc.iterator();
		for(int i = 0;it.hasNext();i++)
		{
			BusinessData bd = (BusinessData)it.next();
	%>
	<tr>
		<td ><!--a href="javascript:fnSelectActionTag('<%=bd.getFieldValue("SEQ") %>');"--><%=bd.getFieldValue("TAG_NAME") %><!--/a--></td>
		<td ><%=bd.getFieldValue("TAG_VALUE")%></td>
		<td ><%=bd.getFieldValue("COMMAND")%></td>
		<td ><input type="button" class="blue button" value="삭제" onClick="javascript:deleteTag('<%=bd.getFieldValue("SEQ")%>')"></td>
	</tr>
<% if(i != (bc.size()-1) && i != 9){%><tr><td colspan="4"><img src="/jsp/hydra/img/analysis_pageview_line3.png" width="600px"></td></tr><%}%>
	<%
	}			 
	%>
</table>
<div style="text-align:center">
<%
	BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"selectTotalCount");
	if(bc1 != null)
	{
		String strCount = bc1.getBusinessData(0).getFieldValue("CNT");
		if(BusinessHelper.checkBusinessNull(strCount))
		{
			int cnt = Integer.parseInt(strCount);
			int page_count = cnt/10;
			int page_mod = cnt%10;
			// if(page_mod > 0) page_count++;
			String seq = request.getParameter("pos");
			if(!BusinessHelper.checkBusinessNull(seq))seq = "0";
			int iseq = Integer.parseInt(seq);
			for(int i = 0; i <= page_count;i++)
			{
				if(iseq == i*10)
				{
				%>
					<%=i+1 %>
				<%
					
				}
				else
				{
				%>
					<a href="#" onclick="javascript:fnPage('<%=i*10 %>');"><%=i+1 %></a>
				<%
					
				}
			}
		}
	}
%>

			
