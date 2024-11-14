<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script language="javascript">
function fnCMServerManage()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_103105634661289983608812";
}
function fnCMRegister()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_107335537401289969322212";
}
function fnCMDepoyManage()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_101304559451289996453898";
}
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

function fnDelete(arg1)
{
	with(frmTest)
	{
		if(confirm("정말로 삭제 하시겠습니까?"))
		{
			code.value = "deleteTestDataGroup";
			CMD.value = "CMD_SEQ_102355824491292808316144";
			seq.value = arg1;			
			callAjaxByForm("deleteTestDataGroup","frmTest");
		}
	}
}

function fnDeleteTestDataGroupDetail(arg1)
{
	with(frmDetail)
	{
		if(confirm("정말로 삭제 하시겠습니까?"))
		{
			code.value = "deleteTestDataGroupDetail";
			CMD.value = "CMD_SEQ_102355824491292808316144";
			seq.value = arg1;			
			callAjaxByForm("deleteTestDataGroupDetail","frmDetail");
		}
	}
}



function fnItemSubmit(arg1)
{
	with(frmItem)
	{
		code.value = arg1;
		CMD.value = "CMD_SEQ_102355824491292808316144";
		callAjaxByForm(arg1,"frmItem");
	}
}


function fnGetTestDataGroupDetail(arg1)
{
	with(frmTest)
	{
		code.value = "getTestDataGroupDetail";
		CMD.value = "CMD_SEQ_102355824491292808316144";
		seq.value = arg1;			
		callAjaxByForm("getTestDataGroupDetail","frmTest");
	}
}

function fnReGetTestDataGroupDetail()
{
	with(frmTest)
	{
		code.value = "getTestDataGroupDetail";
		CMD.value = "CMD_SEQ_102355824491292808316144";
		callAjaxByForm("getTestDataGroupDetail","frmTest");
	}
}


function doRuning(callerName)
{
showRunning(callerName);
	
}

function doRun(callerName ,REQ)
{
	if(callerName == 'getTestDataGroupDetail')
	{
		var test_data = parseAnacondaAJAXFromBusinessCollection(REQ.responseXML);
		var div_data = '';
		if(test_data.response != null)
		{
			div_data = '<table class="table-neo">';
			for(var i=0; i < test_data.response.length; i++)
			{
				div_data = div_data + '<tr>';
				div_data = div_data + '<td>' + test_data.response[i].DATA_NAME + '</td><td>' + test_data.response[i].DATA_DESC + '</td>';
				div_data = div_data + "<td>" + "<a href='javascript:fnDeleteTestDataGroupDetail("+test_data.response[i].SEQ+")'>삭제</a></td>";
				div_data = div_data + '</tr>';	
			}
			div_data = div_data + '</table>';
			var div_item = _('div_data_group_detail');
			div_item.innerHTML = div_data;
		}
		return;
	}
	else if(callerName == 'addTestDataGroup' || callerName == 'deleteTestDataGroupDetail')
	{
		fnReGetTestDataGroupDetail();
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
	if(gubun == 'createTestData')
	{
		with(frmInputData)
		{
			if(data_name.value == '')
			{
				alert("데이터 이름을 입력해 주세요");
				return;
			}
			if(data_value.value == '')
			{
				alert("데이터 값을 입력해 주세요");
				return;
			}
			callAjaxByForm("createTestData","frmInputData");
		}
	}
	else if(gubun == 'createTestDataGroup')
	{
		with(frmInputDataGroup)
		{
			if(data_group_name.value == '')
			{
				alert("데이터 그룹 이름을 입력해 주세요");
				return;
			}
			callAjaxByForm("createTestDataGroup","frmInputDataGroup");
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
	var div_item = _('div_data_group_detail');
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
			seq.value = arg1;
			fnGetTestDataGroupDetail(arg1);
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
			<h3 class="fl">테스트 데이터</h3>
			<span class="fr"><input type="button" class="button white" name="Register" value="테스트 데이터" onClick="javascript:goTest('1');"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="테스트 실행" onClick="javascript:goTest('2');"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="테스트 시나리오" onClick="javascript:goTest('3');"></span>
			<span class="fr"><input type="button" class="button white" name="Register" value="테스트 보고서" onClick="javascript:goTest('4');"></span>
			<span class="fr"><input id="btn_input" type="button" style="font-size:12px" class="button white" value="데이터 그룹 생성" onClick="javascript:fnInput('div_parent','div_group_input');"></span>
			<span class="fr"><input id="btn_input" type="button" style="font-size:12px" class="button white" value="데이터 생성" onClick="javascript:fnInput('div_parent','div_input');"></span>
			</div>
		</div>
	</div>
</div>
				<div class="post">
				
				<div id="div_parent" class="entry">
				<div id="div_group_input" style="width:450px;height:300px;display:none;position:absolute;background-color:white;border: 1px double #BF95FF;padding: 10px 10px 10px 10px;">
				<p style="font:bold 12px 돋움체;color:black;">테스트 데이터 그룹 입력</p>
				<form name="frmInputDataGroup" method="post" action="/Anaconda.do">
				<input type="hidden" name="CMD" value="CMD_SEQ_102355824491292808316144"></input>
				<input type="hidden" name="code" value="createTestDataGroup"></input>
							<table>
							<caption>테스트 데이터 그룹 등록</caption>
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
							<td>데이터 그룹 이름</td>
							<td><input type="text" class="styled" name="data_group_name" size="20"></input></td>
							</tr>
							<tr>
							<td class="td-neo" colspan="2">
							<input type="button" style="font-size:12px" class="button white" value="저장" onClick="fnSubmit('createTestDataGroup');"></input>
							<input type="button" style="font-size:12px" class="button white" value="닫기" onClick="fnClose('div_group_input');"></input>
							</td>
							</tr>
							</tbody>							
							</table>
				</form>
				</div>
				<div id="div_input" style="width:450px;display:none;position:absolute;background-color:white;border: 1px double #BF95FF;padding: 10px 10px 10px 10px;z-index:10;">
				<p style="font:bold 12px 돋움체;color:black;">테스트 데이터 입력</p>
				<form name="frmInputData" method="post" action="/Anaconda.do">
				<input type="hidden" name="CMD" value="CMD_SEQ_102355824491292808316144"></input>
				<input type="hidden" name="code" value="createTestData"></input>
							<table>
							<caption>테스트 데이터 등록</caption>
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
							<td>데이터 이름</td>
							<td><input type="text" class="styled" name="data_name" size="40"></input></td>
							</tr>
							<tr>
							<td>데이터 설명</td>
							<td><input type="text" class="styled" name="data_desc" size="40"></input></td>
							</tr>
							<tr>
							<td>데이터 값</td>
							<td><input type="text" class="styled" name="data_value" size="40"></input></td>
							</tr>
							<tr>
							<td>데이터 타입</td>
							<td><select name="data_type">
							<option value="String">String</option>
							<option value="Integer">Integer</option>
							<option value="Date">Date</option>
							</select></td>
							</tr>
							<tr>
							<td class="td-neo" colspan="2">
							<input type="button" style="font-size:12px" class="button white" value="저장" onClick="fnSubmit('createTestData');"></input>
							<input type="button" style="font-size:12px" class="button white" value="닫기" onClick="fnClose('div_input');"></input>
							</td>
							</tr>
							</tbody>							
							</table>
				</form>
				</div>
				<div id="div_item" style="width:600px;display:none;position:absolute;background-color:white;border: 1px double #BF95FF;padding: 10px 10px 10px 10px;">
				<p style="font:none 12px 돋움체;color:black;"><div id="div_item_title" style="font:bold 12px 돋움체;color:black;"> </div></p>
				<p>테스트 자동화를 위한 테스트 데이터 그룹과 테스트 데이터의 관계를 추가해 주시기 바랍니다..</p>
				<form name="frmItem" method="post" action="/Anaconda.do">
				<input type="hidden" name="CMD" value="CMD_SEQ_102355824491292808316144"></input>
				<input type="hidden" name="code" value="addTestDataGroup"></input>
				<input type="hidden" name="seq" value=""></input>
							<table>
							<caption>테스트 데이터 추가</caption>
							<colgroup>
							<col></col>
							<col></col>
							</colgroup>
							<thead>
							<th scope="col">테스트 데이터</th>
							<th scope="col">기능</th>
							</thead>
							<tbody>
							<tr>
							<td><select class="styled" name="data_seq">
							<%
							BusinessCollection bcData = RequestHelper.getBusinessCollection(request,"getData");
							Iterator itData = bcData.iterator();
							for(;itData.hasNext();)
							{
								BusinessData testData = (BusinessData)itData.next();
							%>
							<option value="<%=testData.getFieldValue("SEQ") %>"><%=testData.getFieldValue("DATA_DESC") %>&nbsp;(<%=testData.getFieldValue("DATA_NAME") %>)</option>
							<%
							}
							%>
							</select></td><td>
							&nbsp;&nbsp;
							<input type="button" style="font-size:12px" class="button white" value="추가" onClick="fnItemSubmit('addTestDataGroup');"></input>
							<input type="button" style="font-size:12px" class="button white" value="닫기" onClick="fnClose('div_item');"></input>
							<input id="btn_input" type="button" style="font-size:12px" class="button white" value="데이터 생성" onClick="javascript:fnInput('div_parent','div_input');">
							</td>
							</tr>
							<tr>
							<td class="td-neo" height="10px" colspan="2">* 테스트 데이터 그룹 상세 내용</td>
							</tr>
							<tr>
							<td class="td-neo" height="10px" colspan="2"><hr></hr></td>
							</tr>
							<tr>
							<td class="td-neo" colspan="2">
							<div id="div_data_group_detail">
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
							<col width="60%"></col>
							<col ></col>
							</colgroup>
							<thead>
							<th scope="col">번호</th>
							<th scope="col">테스트 데이터 그룹 이름</th>
							<th scope="col">기능</th>
							</thead>
							<tbody>
							<%
							BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getTestDataInfo");
							BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"selectTotalCount");
							String strCount = bc1.getBusinessData(0).getFieldValue("CNT");
							Iterator it = bc.iterator();
							for(int i = 0;it.hasNext();i++)
							{
								BusinessData bd = (BusinessData)it.next();
								String strTitle = BusinessHelper.getSubString(bd.getFieldValue("DATA_GROUP_NAME"),30,"...");
							%>
							<tr>
								<td><%=i+1 %></td>
								<td><a href="javascript:fnNull();" onClick="javascript:fnShowOrHideMenu('cm_<%=i %>');"><%=strTitle %></a></td>
								<div id="cm_<%=i %>" style="display:none;position:absolute;background-color:white;border: 1px double #BF95FF;padding: 10px 10px 10px 10px;">
								<%=bd.getFieldValue("DATA_GROUP_NAME") %>
								</div>
								<td>
								<input type="button" class="button white" value="삭제" onClick="javascript:fnDelete('<%=bd.getFieldValue("SEQ") %>');"></input>
								<input type="button" class="button white" value="테스트 데이터 추가" onClick="javascript:fnGoItem('<%=bd.getFieldValue("SEQ") %>','<%=bd.getFieldValue("DATA_GROUP_NAME") %>');"></input>
								</td>
							</tr>
							<%
							}
							%>
							<tr>
							<td colspan="3" align="center">
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
