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
				div_data = div_data + '<td>' + test_data.response[i].ITEM_URL + '</td>';
				div_data = div_data + '<td>' + test_data.response[i].DATA_GROUP_NAME + '</td>';
				div_data = div_data + "<td>" + "<a href='javascript:fnDeleteTestItem("+test_data.response[i].SEQ+")'>삭제</a></td>";
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
	if(gubun == 'addTestScenarioItem')
	{
		with(frmItem)
		{
			if(item_url.value == '')
			{
				alert("시나리오 항목의 URL을 입력해 주세요");
				return;
			}
			code.value = "addTestScenarioItem";
			callAjaxByForm("addTestScenarioItem","frmItem");
		}
	}
}

function fnClose(arg1)
{
	var div_input = _(arg1);
	div_input.style.display = "none";
}
function fnGoItem(arg1,arg2)
{
	var div_input = _("div_item");
	var div_item = _('test_scenario_detail');
	div_item.innerHTML = '';
	// var bt = _("btn_input");
	if(div_input.style.display == "none")
	{
		div_input.style.display = "block";
		div_input.style.position = "absolute";
		var div_title = _("div_item_title");
		div_title.innerHTML = arg2;
		with(frmItem)
		{
			scenario_seq.value = arg1;
			fnGetScenarioItem();
		}			
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

function fnGetScenarioItem()
{
	with(frmItem)
	{
		code.value = "getTestScenarioItem";
		callAjaxByForm("getTestScenarioItem","frmItem");
	}	
}

function searchCMD()
{
	window.open("/Anaconda.do?CMD=CMD_SEQ_109181124291288240727842&title=액션조회&Object=opener.document.frmItem.item_url","","height=500,width=650,left=200,top=20,status=no, location=no, toolbar=no,resizable=yes,scrollbars=yes");	
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
			<h3 class="fl">테스트 시나리오</h3>
			<span class="fr"><input type="button" class="button white" name="Register" value="테스트 데이터" onClick="javascript:goTest('1');"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="테스트 실행" onClick="javascript:goTest('2');"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="테스트 시나리오" onClick="javascript:goTest('3');"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="테스트 보고서" onClick="javascript:goTest('4');"></span>
			<span class="fr"><input id="btn_input" type="button" style="font-size:12px" class="button white" value="테스트 등록" onClick="javascript:fnInput('div_parent','div_input');"></span>
			
			</div>
		</div>
	</div>
</div>
		<div class="post">
				
				<div id="div_parent" class="entry">
				<div id="div_input" style="width:450px;height:300px;display:none;position:absolute;background-color:white;border: 1px double #BF95FF;padding: 10px 10px 10px 10px;">
				<p style="font:bold 12px 돋움체;color:black;">테스트 시나리오 입력</p>
				<form name="frmInputScenario" method="post" action="/Anaconda.do">
				<input type="hidden" name="CMD" value="CMD_SEQ_103026553741291023660681"></input>
				<input type="hidden" name="code" value="create"></input>
							<table>
							<caption>테스트 시나리오 등록</caption>
							<colgroup>
							<col width="40%"></col>
							<col></col>
							</colgroup>
							<thead>
							<th scope="col">이름</th>
							<th scope="col">값</th>
							</thead>
							<tbody>
							<tr>
							<td>시나리오 제목</td>
							<td><input type="text" class="styled" name="scenario_title" size="20"></input></td>
							</tr>
							<tr>
							<td>시나리오 달성 목표</td>
							<td><input type="text" class="styled" name="scenario_object" size="20"></input></td>
							</tr>
							<tr>
							<td class="td-neo" colspan="2">
							<input type="button" style="font-size:12px" class="button white" value="저장" onClick="fnSubmit('create');"></input>
							<input type="button" style="font-size:12px" class="button white" value="닫기" onClick="fnClose('div_input');"></input>
							</td>
							</tr>
							</tbody>							
							</table>
				</form>
				</div>
				<div id="div_item" style="width:600px;display:none;position:absolute;background-color:white;border: 1px double #BF95FF;padding: 10px 10px 10px 10px;z-index:10;">
				<p style="font:none 12px 돋움체;color:black;"><div id="div_item_title" style="font:bold 12px 돋움체;color:black;"></div></p>
				<p>테스트 시나리오 항목은 액션과 테스트 데이터그룹을  함께 등록을 하실 수 있습니다.</p>
				<form name="frmItem" method="post" action="/Anaconda.do">
				<input type="hidden" name="CMD" value="CMD_SEQ_103026553741291023660681"></input>
				<input type="hidden" name="code" value="create"></input>
				<input type="hidden" name="scenario_seq" value=""></input>
							<table>
							<caption>테스트 항목 등록</caption>
							<colgroup>
							<col width="50%"></col>
							<col></col>
							</colgroup>
							<thead>
							<th scope="col">테스트 항목 이름(액션,URL)</th>
							<th scope="col">테스트 데이터 그룹</th>
							</thead>
							<tbody>
							<tr>
							<td><input type="text" class="styled" name="item_url" size="20"></input>
							&nbsp;&nbsp;
							<a href="javascript:fnNull();" onclick="javascript:searchCMD();"><img src="/jsp/anaconda/img/search_result.png" width="10px" height="10px" border="0" align="absmiddle"></img>찾기</a></td>
							<td>
							<select class="styled" name="data_group_seq">
							<%
							BusinessCollection bcData = RequestHelper.getBusinessCollection(request,"getData");
							Iterator itData = bcData.iterator();
							for(;itData.hasNext();)
							{
								BusinessData testData = (BusinessData)itData.next();
							%>
							<option value="<%=testData.getFieldValue("SEQ") %>"><%=testData.getFieldValue("DATA_GROUP_NAME") %></option>
							<%
							}
							%>
							</select>
							</td>
							</tr>
							<tr>
							<td class="td-neo" colspan="2">
							<input type="button" style="font-size:12px" class="button white" value="시나리오 항목 추가" onClick="fnItemSubmit('addTestScenarioItem');"></input>
							<input type="button" style="font-size:12px" class="button white" value="닫기" onClick="fnClose('div_item');"></input>
							</td>
							</tr>
							<tr>
							<td class="td-neo" height="10px" colspan="2">* 테스트 시나리오 항목 상세 내용</td>
							</tr>
							<tr>
							<td class="td-neo" height="10px" colspan="2"><hr></hr></td>
							</tr>
							<tr>
							<td class="td-neo" colspan="2">
							<div id="test_scenario_detail">
							</div>
							</td>
							</tr>
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
								<input type="button" class="button white" value="삭제" onClick="javascript:fnDelete('<%=bd.getFieldValue("SEQ") %>');"></input>
								<input type="button" class="button white" value="시나리오 추가" onClick="javascript:fnGoItem('<%=bd.getFieldValue("SEQ") %>','<%=bd.getFieldValue("SCENARIO_TITLE") %>');"></input>
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
