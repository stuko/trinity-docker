<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script language="javascript"> 

function fnPage(seq)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_107730116601290999098215&pos=" + seq;
}

</script>

<form name="frmTest" action="/Anaconda.do" method="post">
<input type="hidden" name="code" value=""></input>
<input type="hidden" name="CMD" value=""></input>
<input type="hidden" name="seq" value=""></input>
<input type="hidden" name="status" value=""></input>
</form>
<form name="frmDetail" action="/Anaconda.do" method="post">
<input type="hidden" name="code" value=""></input>
<input type="hidden" name="CMD" value=""></input>
<input type="hidden" name="seq" value=""></input>
<input type="hidden" name="status" value=""></input>
</form>
<script language="javascript">
function goTest(num)
{
	if(num == '1')
		document.location.href = '/Anaconda.do?CMD=CMD_SEQ_105441898731290999091414';
	else if(num == '2')
		document.location.href = '/Anaconda.do?CMD=CMD_SEQ_109616405671292830123563';
	else if(num == '3')
		document.location.href = '/Anaconda.do?CMD=CMD_SEQ_105836770501290999075239';
	else if(num == '4')
		document.location.href = '/Anaconda.do?CMD=CMD_SEQ_107730116601290999098215';
}
</script>
<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">테스트 보고서</h3>
			<span class="fr"><input type="button" class="button white" name="Register" value="테스트 데이터" onClick="javascript:goTest('1');"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="테스트 실행" onClick="javascript:goTest('2');"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="테스트 시나리오" onClick="javascript:goTest('3');"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="테스트 보고서" onClick="javascript:goTest('4');"></span>
			</div>
		</div>
	</div>
</div>
		<div class="post">
				
				<div id="div_parent" class="entry">
							<table class="table_hydra">
							<colgroup>
							<col></col>
							<col></col>
							<col></col>
							<col></col>
							<col></col>
							<col></col>
							<col></col>
							<col></col>
							</colgroup>
							<thead>
							<th scope="col">테스트 실행 번호</th>
							<th scope="col">실행일시</th>
							<th scope="col">전체건수</th>
							<th scope="col">성공건수</th>
							<th scope="col">실패건수</th>
							<th scope="col">평균시간(ms)</th>
							<th scope="col">최대시간(ms)</th>
							<th scope="col">최소시간(ms)</th>
							</thead>
							<tbody>
							<%
							
							BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getTestResultInfo");
							BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"selectTotalCount");
							String strCount = bc1.getBusinessData(0).getFieldValue("CNT");
							Iterator it = bc.iterator();
							for(int i = 0;it.hasNext();i++)
							{
								BusinessData bd = (BusinessData)it.next();
								String strTitle = bd.getFieldValue("RESULT_CODE");
								String strObject = bd.getFieldValue("RESULT_REASON");
								String date = bd.getFieldValue("TEST_DATE").substring(0,4) + "년" +
    										  bd.getFieldValue("TEST_DATE").substring(4,6) + "월" + 
											  bd.getFieldValue("TEST_DATE").substring(6,8) + "일";
							%>
							<tr>
								<td>&nbsp;&nbsp;<%=BusinessHelper.getSubString(bd.getFieldValue("TEST_KEY"),10,"...")  %></td>
								<td>&nbsp;&nbsp;<%=date %></td>
								<td>&nbsp;&nbsp;<%=bd.getFieldValue("CNT") %></a></td>
								<td>&nbsp;&nbsp;<%=bd.getFieldValue("SUCCESS") %></a></td>
								<td>&nbsp;&nbsp;<%=bd.getFieldValue("FAIL") %></a></td>
								<td>&nbsp;&nbsp;<%=bd.getFieldValue("AVERAGE") %></a></td>
								<td>&nbsp;&nbsp;<%=bd.getFieldValue("MAXIMUM") %></a></td>
								<td>&nbsp;&nbsp;<%=bd.getFieldValue("MINIMUM") %></a></td>
							</tr>
							<%
							}
							%>
							<tr>
							<td colspan="8" align="center">
							<%
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
							%>
							</td>
							</tr>
							</tbody>
							</table>
				</div>
		</div>
