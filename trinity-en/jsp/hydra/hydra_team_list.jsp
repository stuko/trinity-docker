<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.XmlConfig.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script language="javascript">
function fnSelectTeam(seq)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_104335751441332039231239&seq="+seq;
}
function fnRegisterTeam()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_101716048121332039130676";
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
			<h3 class="fl">Team List</h3>
			<span class="fr"><input type="button" class="button white" name="Register" value="팀 등록" onClick="javascript:fnRegisterTeam();"></span>
			</div>
			<form id="team" name="team" action="/Anaconda.do" method="POST">
			</form>
		</div>
	</div>
</div>

 <table class="table-neo">
   <thead class="th-neo">
	<td >팀명</td>
	<td >신청 마감일</td>
	<td >팀 최대 인원</td>
	<td >현재 인원</td>
   </thead>

   <tbody class="table-neo">
		<%
			BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getTeamList");
								
			Iterator it = bc.iterator();
			for(int i = 0;it.hasNext();i++)
			{
				BusinessData bd = (BusinessData)it.next();
				String yyyymmdd = bd.getFieldValue("APPLY_END_DATE");
				yyyymmdd = yyyymmdd.substring(0,4) +"-"+yyyymmdd.substring(4,6)+"-"+yyyymmdd.substring(6,8);
		%>
		<tr>
			<td class="td-neo"><a href="javascript:fnSelectTeam('<%=bd.getFieldValue("SEQ") %>');"><%=bd.getFieldValue("TEAM_NAME") %></a></td>
			<td class="td-neo"><%=yyyymmdd%></td>
			<td class="td-neo"><%=bd.getFieldValue("MAX_MEMBER_COUNT")%>&nbsp;명</td>
			<td class="td-neo"><%=bd.getFieldValue("CUR_MEMBER_COUNT")%>&nbsp;명</td>
		</tr>
		<%
			}
		%>
	</tbody>

   <tfoot class="tfoot-neo">
   <tr>
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
   </tr>
   </tfoot>
</table>

			