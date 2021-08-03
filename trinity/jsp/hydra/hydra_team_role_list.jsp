
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.XmlConfig.*" %>
<%@ page import="com.stuko.anaconda.jstl.util.StringUtil" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script language="javascript">
function fnSelectRole(seq)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_107087403751332063744080&seq="+seq;
}
function fnRegisterRole()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_108093945961332061537354";
}
function fnPage(page)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_105936135081332062289413&pos="+page;
}
</script>


<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Role List</h3>
			<form id="team" name="team" action="/Anaconda.do" method="POST">
			<span class="fr"><input type="button" class="button white" name="Register" value="역할 등록" onClick="javascript:fnRegisterRole();"></span>
			</div>
			</form>
		</div>
	</div>
</div>


 <table class="table-neo">
   <thead class="th-neo">
   <td >역할 이름</td>
   <td>목표</td>
   </thead>
   <tbody>
	<%
		BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getRoleList");
							
		Iterator it = bc.iterator();
		for(int i = 0;it.hasNext();i++)
		{
			BusinessData bd = (BusinessData)it.next();
	%>
	<tr>
		<td class="td-neo"><a href="javascript:fnSelectRole('<%=bd.getFieldValue("SEQ") %>');"><%=bd.getFieldValue("ROLE_NAME") %></a></td>
		<td class="td-neo"><%=StringUtil.getNullString(bd.getFieldValue("ROLE_OBJECTIVE")) %></td>
	</tr>
		<%
		}			 
		%>
	</tbody>
	<tfoot class="tfoot-neo">
	<td colspan="2" class="tfoot-neo">
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
	</td>
	</tfoot>
</table>
			