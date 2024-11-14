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
<%@ page import="com.stuko.anaconda.entity.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
// ---------------------------------------------------------------------------------------
// JSP 코딩 규칙
// ---------------------------------------------------------------------------------------

EntityMaker emaker = new EntityMaker();
String[] table_list = emaker.getEntityList();

%>
<script language="javascript">
function getTable()
{
	with(entity_form)
	{
		action = "/Anaconda.do?CMD=CMD_SEQ_102072225061371303477361";
		callAjaxByForm("getTable", "entity_form");
	}
}
function createTable()
{
	with(entity_form)
	{
		if(entity_name.value == '' || entity_name.value == '')
		{
			alert("값을 입력해 주시기 바랍니다.");
			return;
		}
		action = "/Anaconda.do?CMD=CMD_SEQ_102290081151371303445581";
		callAjaxByForm("createTable", "entity_form");
	}
}
function addColumn()
{
	with(entity_form)
	{
		if(entity_name.value == '' || entity_field.value == '')
		{
			alert("값을 입력해 주시기 바랍니다.");
			return;
		}
		action = "/Anaconda.do?CMD=CMD_SEQ_109083688521371303425229";
		callAjaxByForm("addColumn", "entity_form");
	}
}
function removeColumn()
{
	with(entity_form)
	{
		if(entity_name.value == '' || entity_field.value == '')
		{
			alert("값을 입력해 주시기 바랍니다.");
			return;
		}
		action = "/Anaconda.do?CMD=CMD_SEQ_101536438511371303462333";
		callAjaxByForm("removeColumn", "entity_form");
	}
}

function fnSetIndex(arg1,arg2,arg3)
{
	with(entity_form)
	{
		idx.value = arg1;
		entity_name.value = arg2;
		entity_desc.value = arg3;
	}
}
function fnSetColumn(col)
{
	with(entity_form)
	{
		entity_field.value = col;
	}
}


//------------------------------------------------------------------
// Controller Logic
//------------------------------------------------------------------
function doRuning(action)
{
}

function doRun(action,REQ)
{
	if(action == "getTable")
	{
		var object = parseAnacondaAJAX(REQ.responseXML);
		displayTable(getArrayFromAjaxResult(object), action );
	}
	else
	{
		checkAjaxResult(REQ.responseXML);
	}
}


//------------------------------------------------------------------
// Util
//------------------------------------------------------------------

function checkAjaxResult(object)
{
	var object = parseAnacondaAJAX(object);
	alert(object.response[0].message);
	if(object.response[0].code == '000')
		document.location.reload();
}

function getArrayFromAjaxResult(object)
{
	var result = new Array();
	for(var i = 0; i < object.length; i++)
	{
		var column = new Array();
		for(var property in object.response[i])
		{
			if(property != 'nodeName' && property != object.response[i].nodeName)
			{
				column.push(object.response[i][property]);
			}
		}
		result.push(column);
	}
	return result;
}


//------------------------------------------------------------------
// View Logic
//------------------------------------------------------------------
function displayTable(data, target_div)
{
	var t_div = _(target_div);
	t_div.innerHTML = '';
	for(var i = 0; i < data.length; i++)
	{
		var column = data[i];
		for(var j = 0;j < column.length;j++)
		{
			var d1 = document.createElement('div');
			d1.innerHTML = '<a href="javascript:fnSetColumn(\''+ column[j] +'\');" >' + column[j] + '</a>';
			t_div.appendChild(d1);
		}
	}
	fnShowDiv('column_add_div');
}
function goDataManagement(entity)
{
	document.location.href = '/Anaconda.do?CMD=CMD_SEQ_108822403131371867315639&entity_name='+entity;
}

</script>
<div class="post">
<form name="entity_form" action="" method="post">
<input type="hidden" name="idx">
<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Entity(XML Entity)</h3>
			
			</div>
		</div>
	</div>
</div>
<div>
<table class="table_hydra" cellspacing="1" cellpadding="1">
<colgroup>
<col width="25%">
<col width="25%">
<col width="25%">
<col width="25%">
</colgroup>
<thead>
<tr>
<th scope="col" colspan="4">테이블 관리</th>
</tr>
</thead>
<tbody>
<tr>
<td>테이블 이름</td><td><input type="text" class="styled"  name="entity_name" size="20"></td>
<td>테이블 설명</td><td><input type="text" class="styled"  name="entity_desc" size="20"></td>
</tr>
<tr>
<td colspan="4">
<input type="button" class="button white" name="" value="Table 등록" onClick="javascript:createTable();">
<input type="button" class="button white" name="" value="Column 정보 가져오기" onClick="javascript:getTable();">
</td>
</tr>
</tbody>
</table>

<table class="table_hydra" cellspacing="1" cellpadding="1">
<colgroup>
<col width="50%">
<col width="50%">
</colgroup>
<thead>
<tr>
<th scope="col" colspan="2">Column 관리</th>
</tr>
</thead>
<tbody>
<tr>
	<td colspan="2">
	<div id="column_add_div" style="display:none;">
	<input type="text" class="styled"  name="entity_field" size="20">
	<input type="button" class="button white" name="" value="Column 등록" onClick="javascript:addColumn();">
	<input type="button" class="button white" name="" value="Column 삭제" onClick="javascript:removeColumn();">
	</div>
	</td>
</tr>
</tr>
<tr>
	<td colspan="2">
	<div id='getTable'>
	</div>
	</td>
</tr>
</tbody>
</table>
</div>

<div>
<table class="table_hydra" cellspacing="1" cellpadding="1">
<colgroup>
<col width="50%">
<col width="50%">
</colgroup>
<thead>
<tr>
<th scope="col" colspan="2">테이블 리스트</th>
</tr>
</thead>
<tbody>

<%
for(int i = 0; i < table_list.length; i++)
{
%>
   <tr>
      <td><a href="javascript:fnSetIndex(<%=i%>,'<%=table_list[i]%>','<%=table_list[i]%>');"><%=table_list[i]%></a></td>
	  <td>
		<input type="button" class="button white" name="" value="데이터 관리 바로가기" onClick="javascript:goDataManagement('<%=table_list[i]%>');">
	  </td>
   </tr>
<%
}
%>
</tbody>
</table>
</div>
</form>
</div>


