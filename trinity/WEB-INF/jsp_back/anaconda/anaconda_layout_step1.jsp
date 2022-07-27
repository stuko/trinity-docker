<%@ page contentType="text/xml; charset=UTF-8" %><%@page pageEncoding="UTF-8" %><%@ page import="java.util.*"%><%@ page import="com.stuko.anaconda.XmlConfig.*"%><%@ page import="com.stuko.anaconda.business.*"%><%@ page import="com.stuko.anaconda.value.*"%><%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%><%@ page import="com.stuko.anaconda.util.InitClass"%>
<%%>
<script language="javascript">
function fnSaveStep1()
{
    if(confirm("Really save?")){
	with(frmLayout)
	{
		if(key.value == '')
		{
			code.value = "create";
		}
		else
		{
			code.value = "update";
		}
		CMD.value = "CMD_SEQ_105205575781288659264502";
		structure.value = getSelectValue('layout_structure');
		AnacondaSubmit(document.frmLayout);
	}
   }
}


function copy()
{
    if(confirm("Really copy?")){
	with(frmLayout)
	{
		if(layout_name.value == '')
		{
			alert("Please input a name of layout.");
			return;
		}
		code.value = "copy";
		structure.value = getSelectValue('layout_structure');
		callAjaxByForm("copy", "frmLayout");
	}
     }
}

function save()
{
    if(confirm("Really save?")){
	with(frmLayout)
	{
		if(layout_name.value == '')
		{
			alert("Please input a name of layout.");
			return;
		}
		code.value = "create";
		structure.value = getSelectValue('layout_structure');
		callAjaxByForm("create", "frmLayout");
	}
    }
}

function update()
{
    if(confirm("Really update?")){
	with(frmLayout)
	{
		if(key.value == '' || layout_name.value == '')
		{
			alert("Please input a name of layout.");
			return;
		}
		code.value = "update";
		structure.value = getSelectValue('layout_structure');
		callAjaxByForm("update", "frmLayout");
	}
    }
}
function remove()
{
    if(confirm("Really remove?")){
	with(frmLayout)
	{
		if(key.value == '')
		{
			alert("Please input a value.");
			return;
		}
		code.value = "remove";
		callAjaxByForm("remove", "frmLayout");
	}
    }
}
function setData(layout,nm,css,row,col,ttl,js,st,cl,str,idValue ,cssContents, jsContents)
{
	with(frmLayout)
	{
		layout_name.value = nm;
		layout_css.value = css.replace(/<BR>/gi,'\n');
                css_contents.value = cssContents.replace(/<BR>/gi,'\n');
		key.value = layout;
		layout_row.value = row;
		layout_col.value = col;
		layout_title.value = ttl;
		layout_js.value = js.replace(/<BR>/gi,'\n');
                js_contents.value = jsContents.replace(/<BR>/gi,'\n');
		layout_style.value = st;
		layout_class.value = cl;
                layout_id.value = idValue;
		setSelectBox('layout_structure',str);
                layout_name.focus();
	}
}
function doRuning(action)
{
}

function doRun(action,REQ)
{
	if(action == "create")
		alert("Applied successfully.");
	else if(action == "remove")
		alert("Applied successfully.");
	else if(action == "update")
		alert("Applied successfully.");
	else if(action == "copy")
		alert("Applied successfully.");
		
	document.location.reload();	
}


</script>
<form name="frm" method="post" action="">
</form>

<div>
 <div class="content-module-heading cf">
  <h3 class="fl">
  Manage layout info.
  </h3>	
  <span class="fr">
   <button type="button" class="btn btn-secondary" value="Copy" onClick="javascript:copy();">Copy</button>&nbsp;
   <button type="button" class="btn btn-primary" value="Create" onClick="javascript:save();">Create</button>&nbsp;
   <button type="button" class="btn btn-info" value="Modify" onClick="javascript:update();">Modify</button>&nbsp;
   <button type="button" class="btn btn-danger" value="Delete" onClick="javascript:remove();">Delete</button>&nbsp;
   <button type="button" class="btn btn-warning" value="Next step" onClick="javascript:fnSaveStep1();">Next step</button>&nbsp;
   <button type="button" class="btn btn-secondary" value="Back" onClick="javascript:history.back();">Back</button>&nbsp;
  </span>
 </div>
</div>

<form name="frmLayout" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_109677787461288834256899"></input>
<input type="hidden" name="key"></input>
<input type="hidden" name="code"></input>
<input type="hidden" name="structure"></input>
<table class="table_hydra" cellspacing="1" cellpadding="1">
		<thead>
		<col width="20%"></col>
		<col width="80%"></col>
		</thead>
		<tbody>
		<tr>
			<td>Layout name</td>
			<td><input type="text" class="styled" size="40" name="layout_name"></input></td>
		</tr>
		<tr>
			<td>Path of style css file</td>
			<td><textarea class="styled" rows="5" cols="80" name="layout_css"></textarea></td>
		</tr>
		<tr>
			<td>Path of javascript file</td>
			<td><textarea class="styled" rows="5" cols="80" name="layout_js"></textarea></td>
		</tr>

		<tr>
			<td>CSS</td>
			<td><textarea class="styled" rows="5" cols="80" name="css_contents"></textarea></td>
		</tr>
		<tr>
			<td>JavaScript</td>
			<td><textarea class="styled" rows="5" cols="80" name="js_contents"></textarea></td>
		</tr>

		<tr>
			<td>Title</td>
			<td><input type="text" class="styled" size="40" name="layout_title"></input></td>
		</tr>
		<tr>
			<td>Body (Container) style </td>
			<td><input type="text" class="styled" size="40" name="layout_style"></input></td>
		</tr>
		<tr>
			<td>Body (Container) id </td>
			<td><input type="text" class="styled" size="40" name="layout_id"></input></td>
		</tr>
		<tr>
			<td>Body (Container) class </td>
			<td><input type="text" class="styled" size="40" name="layout_class"></input></td>
		</tr>
		<tr>
			<td>Count of rows</td>
			<td><input type="text" class="styled" size="20" name="layout_row"></input></td>
		</tr>
		<tr>
			<td>Count of cols</td>
			<td><input type="text" class="styled" size="20" name="layout_col"></input></td>
		</tr>
		<tr>
			<td>Method of layout (Table or Div)</td>
			<td>
			<select id="layout_structure" name="layout_structure">
			<option name="div" value="div">DIV</option>
			<option name="table" value="table">TABLE</option>
			</select>
			</td>
		</tr>
		</tbody>
</table>
</form>
<!----------------------------------------- 리스트 보여주는 테이블 끝----------------------------------------->
<p></p>
<p>
<h5 class="fl">Lyaouts list</h5>
</p>
<table>
<tr>
<td>
<%
DefaultXmlResource res = DefaultXmlResource.getInstance();
DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_LAYOUT);
if(col != null)
{
	int iCount = col.size();
	int divide = iCount / 5;
	int modCount = iCount % 5;
	Iterator it = col.getDefaultXmlDatas();
	for(int i = 0;it.hasNext();i++)
	{
		DefaultXmlData dxd = (DefaultXmlData)it.next();
		String strName = dxd.getData("name");
                strName = strName.trim().length() == 0 ? "NONE" : strName;
		// strName = strName.length() > 15 ? strName.substring(0,15) + "..." : strName;
                strName = strName + "<br><span class='font-weight-bold'>" + dxd.getNAME() + "</span>";
%>
         <div style="float:left;width:140px;margin:10px;word-wrap:break-word">	
           <a href="javascript:setData('<%=dxd.getNAME() %>','<%=dxd.getData("name") %>','<%=dxd.getData("css").replace("\"","&quot;").replace("'","&quot;").replace("<","&lt;").replace(">","&gt;").replace("\n","<BR>") %>','<%=dxd.getData("row") %>','<%=dxd.getData("col") %>','<%=dxd.getData("title") %>','<%=dxd.getData("js").replace("\"","&quot;").replace("'","&quot;").replace("<","&lt;").replace(">","&gt;").replace("\n","<BR>") %>','<%=dxd.getData("style") %>','<%=dxd.getData("class") %>','<%=dxd.getData("structure") %>','<%=dxd.getData("id") %>','<%=dxd.getData("cssContents").replace("\"","&quot;").replace("'","&quot;").replace("<","&lt;").replace(">","&gt;").replace("\n","<BR>") %>','<%=dxd.getData("jsContents").replace("\"","&quot;").replace("'","&quot;").replace("<","&lt;").replace(">","&gt;").replace("\n","<BR>") %>');"><img src="/jsp/anaconda/img/ui.png" border="0"  width="20px"><br><%=strName %></a><br></div>
<%
	}
}
%>
</td>
</tr>
</table>

<br><br><br>
