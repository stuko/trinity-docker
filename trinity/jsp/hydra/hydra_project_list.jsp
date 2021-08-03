<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.XmlConfig.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script language="javascript">
function fnSelectProject(seq)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_108320538591332067728630&seq="+seq;
}
function fnRegisterProject()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_105884107961332066065383";
}
function fnProjectMethodlology()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_105918899811381018422406";
}

function fnPage(page)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_105010315761332038107557&pos="+page;
}
</script>


<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Project List</h3>
			<form id="team" name="team" action="/Anaconda.do" method="POST">
			<span class="fr"><input type="button" class="button white" name="Register" value="Register" onClick="javascript:fnRegisterProject();"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="Project Methodology" onClick="javascript:fnProjectMethodlology();"></span>
			</div>
			</form>
		</div>
	</div>
</div>

  <table class="table-neo">
   <thead class="th-neo">
   <td>프로젝트명</td>
   <td>프로젝트 시작일</td>
   <td>프로젝트 종료일</td>
   <td>프로젝트 상태</td>
   </thead>
   <tbody>

	<%
		BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getProjectList");
							
		Iterator it = bc.iterator();
		for(int i = 0;it.hasNext();i++)
		{
			BusinessData bd = (BusinessData)it.next();
			String yyyymmdd = bd.getFieldValue("PROJECT_START_DATE");
		    yyyymmdd = yyyymmdd.substring(0,4) +"-"+yyyymmdd.substring(4,6)+"-"+yyyymmdd.substring(6,8);
			String yyyymmdd1 = bd.getFieldValue("PROJECT_END_DATE");
		    yyyymmdd1 = yyyymmdd1.substring(0,4) +"-"+yyyymmdd1.substring(4,6)+"-"+yyyymmdd1.substring(6,8);
			String status = "시작전";
			if("0".equals(bd.getFieldValue("PROJECT_STATUS"))) status = "시작전";
			else if("1".equals(bd.getFieldValue("PROJECT_STATUS"))) status = "진행중";
			else if("2".equals(bd.getFieldValue("PROJECT_STATUS"))) status = "종료";
	%>
	<tr>
		<td class="td-neo"><a href="javascript:fnSelectProject('<%=bd.getFieldValue("SEQ") %>');"><%=bd.getFieldValue("PROJECT_TITLE") %></a></td>
		<td class="td-neo"><%=yyyymmdd%></td>
		<td class="td-neo"><%=yyyymmdd1%></td>
		<td class="td-neo"><%=status%></td>
	</tr>
	<%}%>
	</tbody>
	<tfoot>
		<td colspan="4" class="tfoot-neo">
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
</div>
<div style="text-align:center">


			