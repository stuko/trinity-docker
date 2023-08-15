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
String entity_name = request.getParameter("entity_name");

EntityMaker emaker = new EntityMaker();
DefaultXmlData dxd = (DefaultXmlData)emaker.getEntity(entity_name);

EntityManager emanager = new EntityManager();
DefaultXmlDataCollection dxdc = (DefaultXmlDataCollection)emanager.getList(entity_name);

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
function create()
{
	with(entity_form)
	{
		if(entity_name.value == '' || entity_name.value == '')
		{
			alert("값을 입력해 주시기 바랍니다.");
			return;
		}
		action = "/Anaconda.do?CMD=CMD_SEQ_100036087971371303492527";
		callAjaxByForm("create", "entity_form");
	}
}
function update()
{
	with(entity_form)
	{
		if(entity_name.value == '' || entity_name.value == '')
		{
			alert("값을 입력해 주시기 바랍니다.");
			return;
		}
		action = "/Anaconda.do?CMD=CMD_SEQ_105246335991371303499037";
		callAjaxByForm("update", "entity_form");
	}
}
function remove()
{
	with(entity_form)
	{
		if(entity_name.value == '' || entity_name.value == '')
		{
			alert("값을 입력해 주시기 바랍니다.");
			return;
		}
		action = "/Anaconda.do?CMD=CMD_SEQ_104736477111371303505638";
		callAjaxByForm("remove", "entity_form");
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
function fnSetColumn(row,i,col_value)
{
	var obj = document.getElementsByName('column_value');
	obj[parseInt(i)].value = col_value;
	entity_form.idx.value = row;
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

</script>
<div class="post">
<form name="entity_form" action="" method="post">
<input type="hidden" name="idx">
<input type="hidden" name="entity_name" value="<%=entity_name%>">
<div class="title-right">
<h2><font><b><%=entity_name%></b></font></h2>
</div>
<br>
<div>
<input type="button" class="button white" name="" value="등록" onClick="javascript:create();">
<input type="button" class="button white" name="" value="수정" onClick="javascript:update();">
<input type="button" class="button white" name="" value="삭제" onClick="javascript:remove();">
</div>

<div>
<%
Set key = dxd.keySet();

%>
<table class="table_hydra" cellspacing="1" cellpadding="1">
<colgroup>
<%
for(int i = 0; i < key.size(); i++)
{
%>
<col/>
<%
}
%>
</colgroup>
<thead>
<tr>
<%
String[] cols = new String[key.size()];
Iterator it = key.iterator();
for (int i = 0;it.hasNext();i++)
{
	String col = dxd.getData((String)it.next());
	cols[i] = col;
%>
	<th scope="col"><%=col%></th>
<%
}
%>
</tr>
</thead>
<tbody>
<tr>
<%
	for(int i = 0;i < cols.length;i++)
	{
%>
<td>
<input type="hidden" class="styled" name="column_name" value="<%=cols[i]%>" size="20">
<input type="text" class="styled" name="column_value" value="" size="20">
</td>
<%
	}
%>
</tr>
<%
it = dxdc.iterator();
for(int row=0;it.hasNext();row++)
{
	%>
	<tr>
	<%
	dxd = (DefaultXmlData)it.next();
	for(int i = 0;i < cols.length;i++)
	{
%>
	<td>
	<a href="javascript:fnSetColumn('<%=row%>','<%=i%>','<%=dxd.getData(cols[i])%>');"><%=dxd.getData(cols[i])%></a>
	</td>
<%
	}
	%>
	</tr>
	<%
}
%>
</tbody>
</table>
</div>
</form>
</div>


