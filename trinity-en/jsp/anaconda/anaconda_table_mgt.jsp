<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.filter.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.action.*"%>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
/**
// ---------------------------------------------------------------------------------------
// JSP 코딩 규칙
// ---------------------------------------------------------------------------------------

out.println((프로세스결과타입)RequestHelper.getReturnValue(request,"프로세스 이름"));
Object object = request.getAttribute(InitClass.getReturnValue());
Object session_object = request.getAttribute(InitClass.getSessionValue());
Object businss_object = request.getAttribute(InitClass.getBusinessDataValue());

out.println((프로세스결과타입)RequestHelper.getReturnValue(request,"프로세스 이름");
BusinessCollection bc = RequestHelper. getBusinessCollection(request,"프로세스 이름");
BusinessCollection bc = RequestHelper. getBusinessCollection(request,"프로세스 이름");
BusinessHelper helper = new BusinessHelper();
helper.convertToTableRow(bc);

for(int i = 0; i < bc.size(); i++)
{
     BusinessData bd = bc.getBusinessData(i);
}

**/
%>

<script language="javascript">
function fn_FindBiz()
{
	window.open("/Anaconda.do?CMD=CMD_SEQ_109678783811287278764362&title=서비스조회&Object=opener.document.frmAJAX.rule_execute","FindBiz","height=400,width=560,left=200,top=20,status=no, location=no, toolbar=no, resizable=yes, scrollbars=yes");
}
function getRuleList()
{
	with(frmAJAX)
	{
		code.value="list";
		callAjaxByForm("list","frmAJAX");				
	}
}
function read(arg1)
{
	with(frmAJAX)
	{
		key.value = arg1;
		code.value="read";
		callAjaxByForm("read","frmAJAX");				
	}
}
function remove()
{
	if(confirm('정말로 삭제 하시겠습니까?'))
	{
		with(frmAJAX)
		{
			code.value="delete";
			callAjaxByForm("delete","frmAJAX");				
		}
	}
}
function create()
{
	if(confirm('정말로 입력 하시겠습니까?'))
	{

		with(frmAJAX)
		{
			if(from.value == ''){alert('룰정보를 입력해주세요');return;}
			if(to.value == ''){alert('룰정보를 입력해주세요');return;}
			if(factor_name.value == ''){alert('룰정보를 입력해주세요');return;}
			if(alias.value == ''){alert('룰정보를 입력해주세요');return;}
			if(rule_desc.value == ''){alert('룰정보를 입력해주세요');return;}
			if(rule_target.value == ''){alert('룰정보를 입력해주세요');return;}
			if(rule_express.value == ''){alert('룰정보를 입력해주세요');return;}
			if(rule_execute.value == ''){alert('룰정보를 입력해주세요');return;}
			if(rule_class.value == ''){alert('룰정보를 입력해주세요');return;}

			code.value="create";
			callAjaxByForm("create","frmAJAX");				
		}
	}
}
function update()
{
	if(confirm('정말로 수정 하시겠습니까?'))
	{

		with(frmAJAX)
		{
			if(from.value == ''){alert('룰정보를 입력해주세요');return;}
			if(to.value == ''){alert('룰정보를 입력해주세요');return;}
			if(factor_name.value == ''){alert('룰정보를 입력해주세요');return;}
			if(alias.value == ''){alert('룰정보를 입력해주세요');return;}
			if(rule_desc.value == ''){alert('룰정보를 입력해주세요');return;}
			if(rule_target.value == ''){alert('룰정보를 입력해주세요');return;}
			if(rule_express.value == ''){alert('룰정보를 입력해주세요');return;}
			if(rule_execute.value == ''){alert('룰정보를 입력해주세요');return;}
			if(rule_class.value == ''){alert('룰정보를 입력해주세요');return;}

			code.value="update";
			callAjaxByForm("update","frmAJAX");				
		}
	}
}
function doRuning(callerName)
{
	showRunning(callerName);
}

function doRun(callerName , REQ)
{
	if(callerName == "list")
	{
		var object = parseAnacondaAJAX(REQ.responseXML);
		if(object.length == "0")
		{
			var rule_list = _("RuleList");
			rule_list.innerHTML = "데이터가 존재 하지 않습니다";
		}
		else
		{
			var len = parseInt(object.length);
			var list = document.createElement("div");
			var ul = document.createElement("ul");
			list.appendChild(ul);
			var rule_list = _("RuleList");
			rule_list.innerHTML = "";
			for(var i = 0; i < len; i++)
			{
				var li = document.createElement("div");
				li.innerHTML = '<li>&nbsp;&nbsp;<a href="javascript:read(\''+object.response[i].nodeName+'\');">' + object.response[i].RuleAlias +'</a>';
				ul.appendChild(li);
			}
			rule_list.appendChild(list);
		}
	}
	else if(callerName == "create")
	{
		getRuleList();
	}
	else if(callerName == "read")
	{
		var object = parseAnacondaAJAX(REQ.responseXML);
		if(object.length == "0")
		{
			alert('데이터가 존재 하지 않습니다.');
		}
		else
		{
			with(frmAJAX)
			{
				key.value = object.response[0].nodeName;
				from.value = object.response[0].from;
				to.value = object.response[0].to;
				factor_name.value = object.response[0].RuleName;
				alias.value = object.response[0].RuleAlias;
				rule_desc.value = object.response[0].RuleDesc;
				rule_target.value = object.response[0].RuleTarget;
				for(var i = 0 ; i < rule_express.options.length ; i++)
				{
					if(rule_express.options[i].value == object.response[0].express)
						rule_express.options[i].selected = true;
				}
				rule_execute.value = object.response[0].execute;
				rule_class.value = object.response[0].RuleClass;
			}
		}
	}
	else if(callerName == "update")
	{
		alert("룰정보를 수정하였습니다.");
	}
	else if(callerName == "delete")
	{
		alert("룰정보를 삭제하였습니다.");
		getRuleList();
	}
}

</script>
<form name="frmAJAX" id="frmAJAX" method="POST" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_103800779351360588180219">
<input type="hidden" name="code" value="">
<input type="hidden" name="key" value="">

<div class="post">

<div class="title-right">
<h2><font><b>Anaconda Table 관리</b></font>
</div>
<p></p>
<div>
<p style="color:black;">테이블 생성</p>
</div>

<div>
<table class="table_hydra" cellspacing="1" cellpadding="1">
		<caption></caption>
		<colgroup>
		<col width="20%">
		<col>
		</colgroup>
		<thead >
		<tr>
		<th scope="col">이름</th>
		<th scope="col">값</th>
		</tr>
		</thead>
		<tbody id="tBodyRES">
		<tr>
		<td>테이블 이름</td>
		<td><input type="text" class="styled" name="table_name"></td>
		</tr>
		<tr>
		<td>테이블 설명</td>
		<td><input type="text" class="styled" name="table_desc" size="50"></td>
		</tr>
		<tr>
		<td>
		칼럼 정보 <input type="button" class="button white" value="추가" onClick="javascript:fnAdd();">
		</td>
		<td>
			<div class="left_box" id="div_column" style="display:block;">
			   <div>
			   <div class="anaconda_table_column">칼럼명</div>
			   <div class="anaconda_table_column">칼럼타입</div>
			   <div class="anaconda_table_column">길이</div>
			   <div class="anaconda_table_column">필수여부</div>
			   <div class="anaconda_table_column">직접입력</div>
			   <div class="anaconda_table_column">기능</div>
			   </div>
			
			</div>
		</td>
		</tr>

		<tr>
		<td>룰 요소 이름</td>
		<td><input type="text" class="styled" name="factor_name" size="50"></td>
		</tr>
		<tr>
		<td>룰 비교 값</td>
		<td><input type="text" class="styled" name="rule_target" size="50"></td>
		</tr>
		<tr>
		<td>룰 연산자</td>
		<td>
		<SELECT NAME='rule_express'>
			  <OPTION value='='>=</OPTION>
			  <OPTION value='>'>></OPTION>
			  <OPTION value='<'><</OPTION>
			  <OPTION value='>='>=</OPTION>   
 			  <OPTION value='<='><=</OPTION>
			  <OPTION value='!='>!=</OPTION>
			  <OPTION value='reg'>reg</OPTION>
		</SELECT>(ex:=,<,>,!=,reg)
		</tr>
		<tr>
		<td>룰 클래스</td>
		<td><input type="text" class="styled" name="rule_class" size="50">(ex:com.stuko.anaconda.prms.util.SimpleServiceRuler)</td>
		</tr>
		<tr>
		<td>룰 적용시 실행 서비스</td>
		<td><input type="text" class="styled" name="rule_execute" size="50"><input type="button" class="button white" value="서비스 조회"  style="width:200px" onClick="javascript:fn_FindBiz();"></td>
		</tr>
		<tr>
		<td colspan="2"><input type="button" class="button white" value="룰 저장"  style="width:200px" onClick="javascript:create();"><input type="button" class="button white" value="룰 수정"  style="width:200px" onClick="javascript:update();"><input type="button" class="button white" value="룰 삭제"  style="width:200px" onClick="javascript:remove();"></td>
		</tr>
		</tbody>
</table>
</div>
<div id="new_row" style="display:none;padding:0 0 0 0;">
	<div style="display:block;padding:0 0 0 0;">
	<div class="anaconda_table_column"><input type="text" class="styled" name="column_name" size="10"></div>
	<div class="anaconda_table_column">
	<select name="column_type" class="styled" id="column_type">
	<option name="varchar" value="varchar">VARCHAR</option>
	<option name="varchar2" value="varchar2">VARCHAR2</option>
	<option name="char" value="char">CHAR</option>
	<option name="integer" value="integer">INTEGER</option>
	<option name="numeric" value="numeric">NUMERIC</option>
	<option name="date" value="date">DATE</option>
	<option name="datetime" value="datetime">DATETIME</option>
	</select>
	</div>
	<div class="anaconda_table_column">
	<input type="text" class="styled" name="column_size" size="10"> 
	</div>
	<div class="anaconda_table_column">
	<select name="column_null" class="styled" id="column_null">
	<option name="not_null" value="not_null">NOT NULL</option>
	<option name="null" value="null">NULL</option>
	</select> 
	</div>
	<div class="anaconda_table_column" id="div_type_direct_input">
	<input type="text" class="styled"  name="type_direct" size="10">
	</div>
	<div class="anaconda_table_column">
	<input type="button" class="button white" value="추가" onClick="javascript:fnAdd();">
	<input type="button" class="button white" value="삭제" onClick="javascript:fnDel();">
	</div>
	<div  class="anaconda_table_row"></div>
	</div>
</div>
<p></p>
<p style="color:black;">2. 룰 리스트</p>
<div id="RuleList" style="margin-left:5px;margin-top:5px;font:bold 12px 돋움체 ;color:blue;">

</div>
</div>
</form>
<script language="javascript">
function selectType(idx)
{
	with(frmAJAX)
	{
		if(column_type[idx].value == 'direct')
		{
			document.getElementById('div_type_direct_input').style.display = 'block';
		}
		else
		{
			document.getElementById('div_type_direct_input').style.display = 'none';
		}
	}
}
function fnAdd()
{
   document.getElementById('div_column').innerHTML = document.getElementById('div_column').innerHTML 
		                                           + document.getElementById('new_row').innerHTML;
}
getRuleList();



</script>