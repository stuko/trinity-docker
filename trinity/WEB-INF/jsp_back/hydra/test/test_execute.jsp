<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script language="javascript">
function fnDelete(arg1)
{
	with(frmTest)
	{
		if(confirm("정말로 삭제 하시겠습니까?"))
		{
			code.value = "delete";
			CMD.value = "CMD_SEQ_103026553741291023660681";
			seq.value = arg1;			
			callAjaxByForm("delete","frmTest");
		}
	}
}
function doRuning(callerName)
{
showRunning(callerName);
	
}

function doRun(callerName ,REQ)
{
	if(callerName == 'getTestScenarioItem')
	{
		var test_data = parseAnacondaAJAXFromBusinessCollection(REQ.responseXML);
		var div_data = '';
		if(test_data.response != null)
		{
			div_data = '<table class="table-neo">';
			for(var i=0; i < test_data.response.length; i++)
			{
				div_data = div_data + '<tr>';
				div_data = div_data + '<td>' + test_data.response[i].item_url + '</td>';
				div_data = div_data + "<td>" + "<a href='javascript:fnDeleteTestItem("+test_data.response[i].seq+")'>삭제</a></td>";
				div_data = div_data + '</tr>';	
			}
			div_data = div_data + '</table>';
			var div_item = _('test_scenario_detail');
			div_item.innerHTML = div_data;
		}
		
		return;
	}
	else if(callerName == 'addTestScenarioItem' || callerName == 'deleteTestScenarioItem')
	{
		fnGetScenarioItem();
		return;
	}
	else if(callerName == 'executeTest')
	{
		alert("테스트가 실행 되었습니다. 테스트 결과는 테스트 리포트 화면에서 확인 바랍니다.");
		if(confirm("테스트 리포트 화면으로 이동하시겠습니까?"))
		{
			document.location.href="/Anaconda.do?CMD=CMD_SEQ_107730116601290999098215";
		}
		return;
	}
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
	if(gubun == 'create')
	{
		with(frmInputScenario)
		{
			if(scenario_title.value == '')
			{
				alert("시나리오 제목을 입력해 주세요");
				return;
			}
			if(scenario_object.value == '')
			{
				alert("시나리오 달성 목표를 입력해 주세요");
				return;
			}
			callAjaxByForm("create","frmInputScenario");
		}
	}
}

function fnDeleteTestItem(args)
{
	with(frmDetail)
	{
		seq.value = args;
		CMD.value= "CMD_SEQ_103026553741291023660681";
		code.value = "deleteTestScenarioItem";
		callAjaxByForm("deleteTestScenarioItem","frmDetail");
	}
}

function fnItemSubmit(gubun)
{
	if(gubun == 'executeTest')
	{
		with(frmItem)
		{
			/**
			if(user.value == '')
			{
				alert("동시 접속자 수를  입력해 주세요");
				return;
			}
			if(repeat.value == '')
			{
				alert("반복 횟수를  입력해 주세요");
				return;
			}
			if(interval.value == '')
			{
				alert("반복 시간차를  입력해 주세요");
				return;
			}
			**/
			code.value = "executeTest";
			callAjaxByForm("executeTest","frmItem");
		}
	}
}

function fnClose(arg1)
{
	var div_input = _(arg1);
	div_input.style.display = "none";
}
function fnGoTest(arg1,arg2)
{
	var div_input = _("div_item");
	if(div_input.style.display == "none")
	{
		div_input.style.display = "block";
		div_input.style.position = "absolute";
		var div_title = _("div_item_title");
		div_title.innerHTML = arg2;
		with(frmItem)
		{
			scenario_seq.value = arg1;
		}			
	}
	else
	{
		div_input.style.display = "none";
	}
}

function fnGetScenarioItem()
{
	with(frmItem)
	{
		code.value = "getTestScenarioItem";
		callAjaxByForm("getTestScenarioItem","frmItem");
	}	
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
			<h3 class="fl">테스트 실행</h3>
			<span class="fr"><input type="button" class="button white" name="Register" value="테스트 데이터" onClick="javascript:goTest('1');"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="테스트 실행" onClick="javascript:goTest('2');"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="테스트 시나리오" onClick="javascript:goTest('3');"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="테스트 보고서" onClick="javascript:goTest('4');"></span>
			</div>
		</div>
	</div>
</div>
		<div class="post">
				
				<div id="div_item" style="width:700px;display:none;position:absolute;background-color:white;border: 1px double #BF95FF;padding: 10px 10px 10px 10px;">
				<p style="font:none 12px 돋움체;color:black;"><div id="div_item_title" style="font:bold 12px 돋움체;color:black;"></div></p>
				<p>테스트 시나리오를 실행 하실 수 있습니다.<br>테스트 시나리오 실행 버튼을 눌러주시기 바랍니다.<br><!-- (현재 버전에서는 다른 기능 지원 안함) --></p>
				
				<form name="frmItem" method="post" action="/Anaconda.do">
				<input type="hidden" name="CMD" value="CMD_SEQ_103026553741291023660681"></input>
				<input type="hidden" name="code" value="create"></input>
				<input type="hidden" name="scenario_seq" value=""></input>
				<input type="hidden" name="called_method" value=""></input>
							<table>
							<caption>테스트 시나리오 실행</caption>
							<colgroup>
							<col width="20%"></col>
							<col width="20%"></col>
							<col width="20%"></col>
							<col></col>
							</colgroup>
							<thead>
							<th scope="col">테스트종류</th>
							<th scope="col">동시 접속자 수</th>
							<th scope="col">반복 횟수</th>
							<th scope="col">반복 시간 차(ms)</th>
							</thead>
							<tbody>
							<tr>
							<td>&nbsp;&nbsp;성능테스트<!-- select name="call_method"><option value="post">POST</option><option value="get">GET</option></select --></td>
							<td>&nbsp;&nbsp;<input type="text" class="styled" name="user" size="5" ></input>&nbsp;명</td>
							<td>&nbsp;&nbsp;<input type="text" class="styled" name="repeat" size="5" ></input>&nbsp;회</td>
							<td>&nbsp;&nbsp;<input type="text" class="styled" name="interval" size="5" ></input>&nbsp;초(ms)</td>
							</tr>
							<tr>
							<td colspan="4">
							<input type="button" style="font-size:12px" class="button white" value="테스트 시나리오 실행" onClick="fnItemSubmit('executeTest');"></input>
							<input type="button" style="font-size:12px" class="button white" value="닫기" onClick="fnClose('div_item');"></input>
							</td>
							</tbody>							
							</table>
				</form>
				</div>




				
				
							<table>
							<colgroup>
							<col width="10%"></col>
							<col width="20%"></col>
							<col></col>
							<col></col>
							<col width="25%"></col>
							</colgroup>
							<thead>
							<th scope="col">번호</th>
							<th scope="col">등록일시</th>
							<th scope="col">시나리오 제목</th>
							<th scope="col">시나리오 목적</th>
							<th scope="col">기능</th>
							</thead>
							<tbody>
							<%
							BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getScenarioInfo");
							BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"selectTotalCount");
							String strCount = bc1.getBusinessData(0).getFieldValue("CNT");
							Iterator it = bc.iterator();
							for(int i = 0;it.hasNext();i++)
							{
								BusinessData bd = (BusinessData)it.next();
								String strTitle = BusinessHelper.getSubString(bd.getFieldValue("SCENARIO_TITLE"),13,"...");
								String strObject = BusinessHelper.getSubString(bd.getFieldValue("SCENARIO_OBJECT"),13,"...");
							%>
							<tr>
								<td><%=i+1 %></td>
								<td><%=DateUtil.getDateFormat(bd.getFieldValue("SCENARIO_REGDATE")) %></td>
								<td><a href="javascript:fnNull();" onClick="javascript:fnShowOrHideMenu('cm_<%=i %>');"><%=strTitle %></a></td>
								<div id="cm_<%=i %>" style="display:none;position:absolute;background-color:white;border: 1px double #BF95FF;padding: 10px 10px 10px 10px;">
								<%=bd.getFieldValue("SCENARIO_TITLE") %>
								</div>
								<td><a href="javascript:fnNull();" onClick="javascript:fnShowOrHideMenu('cm_obj_<%=i %>');"><%=strObject %></a></td>
								<div id="cm_obj_<%=i %>" style="display:none;position:absolute;background-color:white;border: 1px double #BF95FF;padding: 10px 10px 10px 10px;">
								<%=bd.getFieldValue("SCENARIO_OBJECT") %>
								</div>
								<td>
								<input type="button" class="button white" value="테스트 실행" onClick="javascript:fnGoTest('<%=bd.getFieldValue("SEQ") %>','<%=bd.getFieldValue("SCENARIO_TITLE") %>');"></input>
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
