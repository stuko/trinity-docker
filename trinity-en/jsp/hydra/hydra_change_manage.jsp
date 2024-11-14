<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script language="javascript">

function fnAccept(arg1, arg2)
{
	with(frmCM)
	{
		if(confirm("승인 하시겠습니까?"))
		{
			seq.value = arg2;
			status.value = arg1;
			code.value = "accept";
			CMD.value = "CMD_SEQ_107580660391290409373734";
			callAjaxByForm("accept","frmCM");
		}
	}
}
function fnUnDo(arg1, arg2)
{
	with(frmCM)
	{
		if(confirm("승인 하시겠습니까?"))
		{
			seq.value = arg2;
			status.value = arg1;
			code.value = "recover";
			CMD.value = "CMD_SEQ_107384295811290474989529";
			callAjaxByForm("recover","frmCM");
		}
	}
}
function fnInit(arg1, arg2)
{
	with(frmCM)
	{
		if(confirm("승인 하시겠습니까?"))
		{
			seq.value = arg2;
			status.value = arg1;
			code.value = "init";
			CMD.value = "CMD_SEQ_101030612041360298528019";
			callAjaxByForm("init","frmCM");
		}
	}
}
function fnMakePreStatus(arg1, arg2)
{
	with(frmCM)
	{
		if(confirm("승인 하시겠습니까?"))
		{
			seq.value = arg2;
			// status.value = arg1;
			code.value = "makePreStatus";
			CMD.value = "CMD_SEQ_107948146001360547530311";
			callAjaxByForm("makePreStatus","frmCM");
		}
	}
}



function fnDelete(arg1, arg2)
{
	with(frmCM)
	{
		if(confirm("정말로 삭제 하시겠습니까?"))
		{
			code.value = "delete";
			CMD.value = "CMD_SEQ_106717650171289983356127";
			seq.value = arg2;
			status.value = arg1;
			callAjaxByForm("delete","frmCM");
		}
	}
}
function doRuning(callerName)
{
showRunning(callerName);
	
}

function doRun(callerName ,REQ)
{
	alert("정상적으로 반영되었습니다.")
	document.location.reload();
}
function fnPage(seq)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_100333381081289029921460&pos=" + seq;
}
</script>
<form name="frmCM" action="/Anaconda.do" method="post">
<input type="hidden" name="code" value=""></input>
<input type="hidden" name="CMD" value=""></input>
<input type="hidden" name="seq" value=""></input>
<input type="hidden" name="status" value=""></input>
</form>
		<div class="post">
				
<jsp:include page="/jsp/hydra/hydra_cm_menu.jsp" />				

				
				

				<div class="entry">
							<table>
							<colgroup>
							<col width="5%"></col>
							<col width="20%"></col>
							<col></col>
							<col width="10%"></col>
							<col width="10%"></col>
							<col width="30%"></col>
							</colgroup>
							<thead>
							<th scope="col">번호</th>
							<th scope="col">등록일시</th>
							<th scope="col">변경내역</th>
							<th scope="col">변경요청자</th>
							<th scope="col">배포상태</th>
							<th scope="col">기능</th>
							</thead>
							<tbody>
							<%
							BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getChangeList");
							BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"selectTotalCount");
							String strCount = bc1.getBusinessData(0).getFieldValue("CNT");
							Iterator it = bc.iterator();
							for(int i = 0;it.hasNext();i++)
							{
								BusinessData bd = (BusinessData)it.next();
								String strStatus = "반영요청";
								if(bd.getFieldValue("CM_STATUS").equals("0")) strStatus = "반영요청";
								else if(bd.getFieldValue("CM_STATUS").equals("1")) strStatus = "SRC";
								else if(bd.getFieldValue("CM_STATUS").equals("2")) strStatus = "SIT";
								else if(bd.getFieldValue("CM_STATUS").equals("3")) strStatus = "UAT";
								else if(bd.getFieldValue("CM_STATUS").equals("4")) strStatus = "PRD";
								else if(bd.getFieldValue("CM_STATUS").equals("4")) strStatus = "원복";
								String strTitle = BusinessHelper.getSubString(bd.getFieldValue("CM_TITLE"),13,"...");
							%>
							<tr>
								<td><%=i+1 %></td>
								<td><%=DateUtil.getDateFormat(bd.getFieldValue("CM_REG_DATE")) %></td>
								<td><a href="javascript:fnNull();" onClick="javascript:fnShowOrHideMenu('cm_<%=i %>');"><%=strTitle %></a></td>
								<div id="cm_<%=i %>" style="display:none;position:absolute;background-color:white;border: 1px double #BF95FF;padding: 10px 10px 10px 10px;">
								<%=bd.getFieldValue("CM_LIST").replaceAll("\n","<li>") %>
								</div>
								<td><%=bd.getFieldValue("CM_USER") %></td>
								<td><%=strStatus %></td>
								<%
								String strButton = "";
								if(bd.getFieldValue("CM_STATUS").equals("0")) strButton = "소스압축 실행";
								else if(bd.getFieldValue("CM_STATUS").equals("1")) strButton = "개발서버 반영";
								else if(bd.getFieldValue("CM_STATUS").equals("2")) strButton = "UAT서버 반영";
								else if(bd.getFieldValue("CM_STATUS").equals("3")) strButton = "리얼서버 반영";
								%>
								<td>
								<%if(!strButton.equals("")){ %><input type="button" class="button white" value="<%=strButton %>" onClick="javascript:fnAccept('<%=bd.getFieldValue("CM_STATUS") %>','<%=bd.getFieldValue("SEQ") %>');"></input><%} %>
								<%if(strStatus.equals("PRD")){ %>
								<input type="button" class="button white" value="원복" onClick="javascript:fnUnDo('<%=bd.getFieldValue("CM_STATUS") %>','<%=bd.getFieldValue("SEQ") %>');"></input>
								 <input type="button" class="button white" value="초기화" onClick="javascript:fnInit('<%=bd.getFieldValue("CM_STATUS") %>','<%=bd.getFieldValue("SEQ") %>');"></input>
								<%} %>
								<input type="button" class="button white" value="삭제" onClick="javascript:fnDelete('<%=bd.getFieldValue("CM_STATUS") %>','<%=bd.getFieldValue("SEQ") %>');"></input>
								<%if(!strStatus.equals("반영요청")){ %>
								<input type="button" class="button white" value="BACK" onClick="javascript:fnMakePreStatus('<%=bd.getFieldValue("CM_STATUS") %>','<%=bd.getFieldValue("SEQ") %>');"></input><%} %>
								</td>
							</tr>
							<%
							}
							%>
							<tr>
							<td colspan="6" align="center">
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
