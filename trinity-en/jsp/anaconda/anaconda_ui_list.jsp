<%@ page contentType="text/xml; charset=UTF-8" %><%@page pageEncoding="UTF-8" %><%@ page import="java.util.*"%><%@ page import="com.stuko.anaconda.XmlConfig.*"%><%@ page import="com.stuko.anaconda.business.*"%><%@ page import="com.stuko.anaconda.value.*"%><%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%><%@ page import="com.stuko.anaconda.util.InitClass"%><%

%>
<script language="javascript">
function copyUI()
{
	with(frmUI)
	{
		if(ui_name.value == '' || ui_value.value == '')
		{
			alert("Please input name of UI");
			return;
		}
		code.value = "copy";
		callAjaxByForm("copy", "frmUI");
	}
}
function saveUI()
{
	with(frmUI)
	{
		if(ui_name.value == '' || ui_value.value == '')
		{
			alert("Please input name of UI");
			return;
		}
		code.value = "create";
		callAjaxByForm("create", "frmUI");
	}
}
function updateUI()
{
	with(frmUI)
	{
		if(ui_name.value == '' || ui_value.value == '')
		{
			alert("Please input name of UI");
			return;
		}
		code.value = "update";
		callAjaxByForm("update", "frmUI");
	}
}
function removeUI()
{
    if(confirm("Really delete?")){
	with(frmUI)
	{
		if(ui_key.value == '' || ui_value.value == '')
		{
			alert("Please input name of UI");
			return;
		}
		code.value = "remove";
		callAjaxByForm("remove", "frmUI");
	}
   }
}
function setData(key,type,nm,value,row,col)
{
	with(frmUI)
	{
		ui_name.value = nm;
		ui_value.value = value;
		ui_key.value = key;
		panel_row.value = row;
		panel_col.value = col;
		setSelectBox("ui_type", type)
	}
}
function doRuning(action)
{
}

function doRun(action,REQ)
{
	var object = parseAnacondaAJAX(REQ.responseXML);
	if(action == "create")
	{
		alert("Applied successfully");
		with(frmUI)
		{
			code.value = "get_ui_extend";
			callAjaxByForm("get_ui_extend", "frmUI");
		}
		document.location.reload();		
	}
	else if(action == "remove" || action == "ui_extend_remove")
	{
		alert("Deleted successfully");
		with(frmUI)
		{
			code.value = "get_ui_extend";
			callAjaxByForm("get_ui_extend", "frmUI");
		}
		document.location.reload();
	}
	else if(action == "update" || action == 'ui_extend_save')
	{
		alert("Updated successfully");
		with(frmUI)
		{
			code.value = "get_ui_extend";
			callAjaxByForm("get_ui_extend", "frmUI");
		}
		document.location.reload();
	}
	else if(action == "get_ui_extend")
	{
		//alert(REQ.responseText);
		if(object == null)
		{
			alert("ERROR");
			return;
		}
		var tBody = _("tBodyUIExtendPlus");
		removeAllChildNodesById("tBodyUIExtendPlus");

		for(var i = 0; i < object.response.length; i++)
		{
			for(var j = 0; j < object.response_keys.length; j++)
			{
				var ui = object.response[i];
				var tr = createElement("tr","","");
				var id = _rand();
				tr.setAttribute("id",id);

				if(object.response_keys[j] == "ui_style")
				{
					var objStyle = _("ui_style");
					objStyle.value = object.response[i].ui_style;
				}
				else if(object.response_keys[j] == "ui_class")
				{
					var objClass = _("ui_class");
					objClass.value = object.response[i].ui_class;
				}
				else if(object.response_keys[j] == "type"
						|| object.response_keys[j] == "value_type"
						|| object.response_keys[j] == "name"
						|| object.response_keys[j] == "value"
						|| object.response_keys[j] == "panel_row"
						|| object.response_keys[j] == "panel_col"
						)
				{
				}
				else
				{
					var td1 = createElement("td","","");
					var td2 = createElement("td","","");
					tr.appendChild(td1);
					tr.appendChild(td2);
					var input1 = createElementWithStyle ("input","ui_area_name_" + i + "_" + j,"text" ,"styled" , "");
					var input2 = createElementWithStyle ("input","ui_area_value_" + i + "_" + j,"text" ,"styled" , "");
					td1.appendChild(input1);
					td2.appendChild(input2);
					input1.setAttribute("size","25");
					var rnd_input1 = _rand();
					var rnd_input2 = _rand();
					input1.setAttribute("id",rnd_input1);
					input2.setAttribute("size","30");
					input2.setAttribute("id",rnd_input2);
					input1.value = object.response_keys[j];
					input2.value = object.response[i][object.response_keys[j]];

					if(true)
					{
						var td3 = createElement("td","","");
						var input3 = createElementWithStyle ("input","save","button" ,"button" , "");
						var input4 = createElementWithStyle ("input","save","button" ,"button" , "");
						input3.setAttribute("class","button white");
						input4.setAttribute("class","button white");
						td3.appendChild(input3);
						td3.appendChild(input4);

						input3.setAttribute("value","Save");

						input3.onclick= function() {
							if(input1.value == '' || input2.value == '')
							{
								alert("Please input a name of area");
								return;
							}
							var isOK = confirm("Really create?");
							if(isOK)
							{
								with(frmUI)
								{
									code.value = "ui_extend_save";
									ui_area_name.value = input1.value;
									ui_area_value.value = input2.value;
									callAjaxByForm("ui_extend_save", "frmUI");
								}
							}
						}
		
						input4.setAttribute("value","Delete");
						input4.setAttribute("tr_id",id);
						input4.setAttribute("input1_id",rnd_input1);
						input4.setAttribute("input2_id",rnd_input2);		
						input4.onclick= function() {
			
							if(input1.value == '' || input2.value == '')
							{
								alert("Do you wanna delete a line? (Input all of value)");
								var strId = this.getAttribute("tr_id");
								// alert(strId);
								var objTr = _(strId);
								tBody.removeChild(objTr);
								return;
							}			
							var isOK = confirm("Really delete?");
							if(isOK)
							{
								with(frmUI)
								{
									var o1 = _(this.getAttribute("input1_id"));
									var o2 = _(this.getAttribute("input2_id"));
									code.value = "ui_extend_remove";
									ui_area_name.value = o1.value; 
									ui_area_value.value = o2.value;
									callAjaxByForm("ui_extend_remove", "frmUI");
								}
							}
						}
					}
					tr.appendChild(td3);
					tBody.appendChild(tr);
				}
			}
		}

		var objDiv = _('div_ui_extend');
		objDiv.style.display = 'block';
		objDiv = _('div_ui_basic');
		objDiv.style.display = 'block';

	}
	else
	{
		alert("Applied successfully.");
		document.location.reload();	
	}
		
	

}
function fnEditView(path)
{
        document.location.href = '/Anaconda.do?CMD=CMD_SEQ_106594560501498179923551&path=' + path;
        /*
	var url = '/Anaconda.do?CMD=CMD_SEQ_109011583661287796111343&path=' + path;
	window.open(url+"&title=Source","","height=600,width=900,left=200,top=20,status=no, location=no, toolbar=no,resizable=yes,scrollbars=yes");
        */
}

function fnAddRow()
{
	var tBody = _("tBodyUIExtendPlus");
	var tr = createElement("tr","","");
	var id = _rand();
	tr.setAttribute("id",id);
	var td1 = createElement("td","","");
	var td2 = createElement("td","","");
	tr.appendChild(td1);
	tr.appendChild(td2);
	var input1 = createElementWithStyle ("input","ui_area_name_new_","text" ,"styled" , "");
	var input2 = createElementWithStyle ("input","ui_area_value_new_","text" ,"styled" , "");
	td1.appendChild(input1);
	td2.appendChild(input2);
	input1.setAttribute("size","25");
	input2.setAttribute("size","30");
	var td3 = createElement("td","","");
	var input3 = createElementWithStyle ("input","save","button" ,"button" , "");
	var input4 = createElementWithStyle ("input","save","button" ,"button" , "");
	input3.setAttribute("class","button white");
	input4.setAttribute("class","button white");


	td3.appendChild(input3);
	td3.appendChild(input4);

	input3.setAttribute("value","Save");

	input3.onclick= function() {
		if(input1.value == '' || input2.value == '')
		{
			alert("Please input a name of area");
			return;
		}
		var isOK = confirm("Really create?");
		if(isOK)
		{
			with(frmUI)
			{
				code.value = "ui_extend_save";
				ui_area_name.value = input1.value;
				ui_area_value.value = input2.value;
				callAjaxByForm("ui_extend_save", "frmUI");
			}
		}
	}
		
	input4.setAttribute("value","삭제하기");
	input4.onclick= function() {
		if(input1.value == '' || input2.value == '')
		{
			alert("Do you wanna delete a line? (Input all of value)");
			var objTr = _(id);
			tBody.removeChild(objTr);
			return;
		}			
		var isOK = confirm("삭제하시겠습니까?");
		if(isOK)
		{
			with(frmUI)
			{
				code.value = "ui_extend_remove";
				ui_area_name.value = input1.value; 
				ui_area_value.value = input2.value;
				callAjaxByForm("ui_extend_remove", "frmUI");
			}
		}
	}
	tr.appendChild(td3);
	tBody.appendChild(tr);
}
</script>
<form name="frmUI" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_107412743841288767936876"></input>
<input id="ui_key" type="hidden" name="ui_key"></input>
<input type="hidden" name="ui_area_name"></input>
<input type="hidden" name="ui_area_value"></input>
<input type="hidden" name="code"></input>

<div>
 <div class="content-module-heading cf">
  <h3 class="fl">
  UI Component Info.
  </h3>	
  <span class="fr">
   <button type="button" class="btn btn-secondary" value="Copy UI" onClick="javascript:copyUI()">Copy UI</button>&nbsp;
   <button type="button" class="btn btn-primary" value="Create UI" onClick="javascript:saveUI()">Create UI</button>&nbsp;
   <button type="button" class="btn btn-info" value="Modify UI" onClick="javascript:updateUI()">Modify UI</button>&nbsp;
   <button type="button" class="btn btn-danger" value="Delete UI" onClick="javascript:removeUI()">Delete UI</button>&nbsp;
  </span>
 </div>
</div>

<div id="DIV_UI" style="display:block">
		<table class="table_hydra">
		<colgroup>
		<col width="20%">
		<col width="20%">
		<col>
		</colgroup>
		<thead >
		<tr>
		<th scope="col">Name</th>
		<th scope="col">Type</th>
		<th scope="col">Contents</th>
		</tr>
		</thead>
		<tbody id="tBodyUI">
		</tbody>
		<tr>
		<td><INPUT type="text" name="ui_name" class="styled" size=15></input> </td>
		<td><select id="ui_type" name="ui_type" onChange="javascript:selectLayoutType('ui_type',this.selectedIndex);"><option value="file">File path</option><option value="ref">Anaconda UI</option><option value="panel">Anaconda Area</option></select> 
		</td>
		<td><input type="text" class="styled" name="ui_value" size="40"></input> &nbsp;&nbsp;<a href="javascript:fnNull();" onClick="javascript:fnEditView(frmUI.ui_value.value);"><img src="/jsp/anaconda/img/trinity_icon.gif" border=0>&nbsp;Open file</a></td>
		</tr>
		</table>
</div>

<div id="div_ui_panel" style="display:none;">

		<p><h3>UI area</h3></p>
		<table class="table_hydra">
		<colgroup>
		<col width="30%">
		<col>
		</colgroup>
		<thead >
		<tr>
		<th scope="col">Name</th>
		<th scope="col">Value &nbsp;&nbsp;<button type="button" class="btn btn-primary" value="Edit UI area" onClick="javascript:panelNext();">Edit UI area</button></th>
		</tr>
		</thead>
		<tbody id="tBodyUIExtendBasic">
		<tr>
		</tr>
		</tbody>
		<tr>
		<td>Count of rows</td>
		<td><INPUT type="text" id="panel_row" name="panel_row" class="styled" size=40></input></td>
		</tr>
		<tr>
		<td>Count of cols</td>
		<td><INPUT type="text" id="panel_col" name="panel_col" class="styled" size=40></input></td>
		</tr>
		</table>
		
</div>	

<div id="div_ui_basic" style="display:none;">

		<p><h1>Default argument value</h1></p>
		<table class="table_hydra">
		<colgroup>
		<col width="30%">
		<col>
		</colgroup>
		<thead >
		<tr>
		<th scope="col">Name</th>
		<th scope="col">Value</th>
		</tr>
		</thead>
		<tbody id="tBodyUIExtendBasic">
		<tr>
		</tr>
		</tbody>
		<tr>
		<td>Style of area</td>
		<td><INPUT type="text" id="ui_style" name="ui_style" class="styled" size=40></input></td>
		</tr>
		<tr>
		<td>Class of area</td>
		<td><INPUT type="text" id="ui_class" name="ui_class" class="styled" size=40></input></td>
		</tr>
		</table>
</div>		

<div id="div_ui_extend" style="display:none;">
		<p><h1>More arguments</h1></p>
		<table class="table_hydra">
		<colgroup>
		<col width="30%">
		<col>
		<col width="30%">
		</colgroup>
		<thead >
		<tr>
		<th scope="col">Name</th>
		<th scope="col">Value</th>
		<th scope="col">Function<a href="javascript:fnNull();" onClick="javascript:fnAddRow();"><img src="/jsp/anaconda/img/plus.png" width="15px" height="15px" border="0" align="absmiddle"></img>Add</a></th>
		</tr>
		</thead>
		<tbody id="tBodyUIExtendPlus">
<%

%>
<%

%>
		</tbody>
		</table>
</div>


</form>

<p></p><p></p>
<p style="color:blue;size:12px;font-weight:bold;">* Select UI component</p>
<table cellspacing=0 cellpadding="10px" border=1>
<tr><td>
<%
DefaultXmlResource res = DefaultXmlResource.getInstance();
DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_UI);
if(col != null)
{
	int iCount = col.size();
	int divide = iCount / 5;
	int modCount = iCount % 5;
	Iterator it = col.getDefaultXmlDatas();
	for(int i = 0;it.hasNext();i++)
	{
		DefaultXmlData dxd = (DefaultXmlData)it.next();
		String img_name = "file";
		if(dxd.getData("value_type").equals("ref")) img_name = "ui";
		else if(dxd.getData("value_type").equals("panel")) img_name = "panel";
%>
		<div style="float:left;width:130px;margin:10px;"><br>
                 <a id="href_<%=dxd.getNAME()%>" href="javascript:fnNull();" onClick="javascript:setData('<%=dxd.getNAME() %>','<%=dxd.getData("value_type") %>','<%=dxd.getData("name") %>','<%=dxd.getData("value") %>','<%=dxd.getData("panel_row") %>','<%=dxd.getData("panel_col") %>');"><img src="/jsp/anaconda/img/<%=img_name%>.png" border="0" width="20px"></img><br><%=dxd.get("name") %></a><br></div>
<%
	}
}
%>
</td></tr>
</table>
<br>
<script language="javascript">
function selectLayoutType(objSelect, idx)
{
	var select = _(objSelect);
	if(select.value == 'ref')
	{

		var objDiv = _('div_ui_panel');		
		objDiv.style.display = 'none';
		objDiv = _('div_ui_extend');
		var ui_key = _('ui_key');
		if(ui_key.value != '')
		{
			with(frmUI)
			{
				code.value = "get_ui_extend";
				callAjaxByForm("get_ui_extend", "frmUI");
			}
		}
		else
		{
			// objDiv.style.display = 'block';
			objDiv = _('div_ui_basic');		
			objDiv.style.display = 'block';
		}
	}
	else if (select.value == 'file')
	{
		var objDiv = _('div_ui_extend');
		objDiv.style.display = 'none';
		objDiv = _('div_ui_basic');		
		objDiv.style.display = 'none';
		objDiv = _('div_ui_panel');		
		objDiv.style.display = 'none';
	} 
	else if (select.value == 'panel')
	{
		var objDiv = _('div_ui_extend');
		objDiv.style.display = 'none';
		objDiv = _('div_ui_basic');		
		objDiv.style.display = 'none';
		objDiv = _('div_ui_panel');		
		objDiv.style.display = 'block';
	}
}

function panelNext()
{
	with(frmUI)
	{
		document.location.href="/Anaconda.do?CMD=CMD_SEQ_108144299441289285595183&ui_key="+ui_key.value+"&ui_type="+ui_type.value+"&ui_name="+ui_name.value+"&ui_value="+ui_value.value+"&panel_row="+panel_row.value+"&panel_col="+panel_col.value;
	}
}
</script>
