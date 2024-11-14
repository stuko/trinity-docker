<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script language="javascript">
function fnClose(arg1)
{
	var div_input = _(arg1);
	div_input.style.display = "none";
}

function fnDelete(arg1)
{
	with(frmTest)
	{
		if(confirm("정말로 삭제 하시겠습니까?"))
		{
			code.value = "deleteTestItem";
			CMD.value = "CMD_SEQ_104511287591291024736778";
			seq.value = arg1;			
			callAjaxByForm("deleteTestItem","frmTest");
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
function fnInput(div1, div2)
{
	var div_parent = _(div1);
	var div_input = _(div2);
	// var bt = _("btn_input");
	if(div_input.style.display == "none")
	{
		div_input.style.display = "block";
		div_input.style.position = "absolute";
		// div_input.style.left = window.screen.availwith - div_input.style.width;
		// div_input.style.top = widow.screen.availheight - div_input.style.height;
		// bt.style.value = "입력창 닫기";
		//bt.setAttribute("value","입력창 닫기"); 
	}
	else
	{
		div_input.style.display = "none";
		// bt.style.value = "시나리오 입력";
		//bt.setAttribute("value","시나리오 입력");
	}
}

function fnSubmit(gubun)
{
	if(gubun == 'createTestItem')
	{
		with(frmInputItem)
		{
			if(title.value == '')
			{
				alert("시나리오 항목의 제목을 입력해 주세요");
				return;
			}
			if(url.value == '')
			{
				alert("시나리오 항목의 URL을 입력해 주세요");
				return;
			}
			code.value = "createTestItem";
			callAjaxByForm("createTestItem","frmInputItem");
		}
	}
}

function fnGoItem(arg1,arg2)
{
	
}
</script>
<form name="frmTest" action="/Anaconda.do" method="post">
<input type="hidden" name="code" value=""></input>
<input type="hidden" name="CMD" value=""></input>
<input type="hidden" name="seq" value=""></input>
<input type="hidden" name="status" value=""></input>
</form>
		<div class="post">
				<div class="title-right">
				<h2><font><b>테스트 시나리오 항목 관리</b></font>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;
				<input id="btn_input" type="button" style="font-size:12px" class="button white" value="시나리오 입력" onClick="javascript:fnInput('div_parent','div_input');">
				</h2>
				</div>
				<div id="div_parent" class="entry">
				<div id="div_input" style="width:450px;height:300px;display:none;position:absolute;background-color:white;border: 1px double #BF95FF;padding: 10px 10px 10px 10px;">
				<p style="font:bold 12px 돋움체;color:black;">테스트 시나리오 항목 입력</p>
				<form name="frmInputItem" method="post" action="/Anaconda.do">
				<input type="hidden" name="CMD" value="CMD_SEQ_104511287591291024736778"></input>
				<input type="hidden" name="code" value="create"></input>
							<table class="table_hydra">
							<caption>테스트 시나리오 항목 등록</caption>
							<colgroup>
							<col width="30%"></col>
							<col></col>
							</colgroup>
							<thead>
							<th scope="col">이름</th>
							<th scope="col">값</th>
							</thead>
							<tbody>
							<tr>
							<td>시나리오 항목 제목</td>
							<td><input type="text" class="styled" name="title" size="40"></input></td>
							</tr>
							<tr>
							<td>시나리오 항목 URL</td>
							<td><input type="text" class="styled" name="url" size="40"></input></td>
							</tr>
							<tr>
							<td colspan="2">
							<input type="button" style="font-size:12px" class="button white" value="저장" onClick="fnSubmit('createTestItem');"></input>
							<input type="button" style="font-size:12px" class="button white" value="닫기" onClick="fnClose('div_input');"></input>
							</td>
							</tr>
							</tbody>							
							</table>
				</form>
				</div>
							<table class="table_hydra">
							<caption>테스트 시나리오 항목 리스트</caption>
							<colgroup>
							<col width="10%"></col>
							<col width="15%"></col>
							<col></col>
							<col></col>
							<col width="25%"></col>
							</colgroup>
							<thead>
							<th scope="col">번호</th>
							<th scope="col">등록일시</th>
							<th scope="col">시나리오 항목 이름</th>
							<th scope="col">시나리오 URL</th>
							<th scope="col">기능</th>
							</thead>
							<tbody>
							<%
							BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getItemInfo");
							BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"selectTotalCount");
							String strCount = bc1.getBusinessData(0).getFieldValue("CNT");
							Iterator it = bc.iterator();
							for(int i = 0;it.hasNext();i++)
							{
								BusinessData bd = (BusinessData)it.next();
								String strTitle = BusinessHelper.getSubString(bd.getFieldValue("ITEM_TITLE"),13,"...");
								String strObject = BusinessHelper.getSubString(bd.getFieldValue("ITEM_URL"),13,"...");
							%>
							<tr>
								<td><%=i+1 %></td>
								<td><%=bd.getFieldValue("ITEM_REGDATE") %></td>
								<td><a href="javascript:fnNull();" onClick="javascript:fnShowOrHideMenu('cm_<%=i %>');"><%=strTitle %></a></td>
								<div id="cm_<%=i %>" style="display:none;position:absolute;background-color:white;border: 1px double #BF95FF;padding: 10px 10px 10px 10px;">
								<%=bd.getFieldValue("ITEM_TITLE") %>
								</div>
								<td><a href="javascript:fnNull();" onClick="javascript:fnShowOrHideMenu('cm_obj_<%=i %>');"><%=strObject %></a></td>
								<div id="cm_obj_<%=i %>" style="display:none;position:absolute;background-color:white;border: 1px double #BF95FF;padding: 10px 10px 10px 10px;">
								<%=bd.getFieldValue("ITEM_URL") %>
								</div>
								<td>
								<input type="button" class="button white" value="삭제" onClick="javascript:fnDelete('<%=bd.getFieldValue("SEQ") %>');"></input>
								<!-- input type="button" class="button white" value="테스트 항목 관리" onClick="javascript:fnGoItem('<%=bd.getFieldValue("SEQ") %>','<%=bd.getFieldValue("ITEM_TITLE") %>');"></input -->
								</td>
							</tr>
							<%
							}
							%>
							<tr>
							<td colspan="5" align="center">
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

