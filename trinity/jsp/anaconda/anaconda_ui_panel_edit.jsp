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
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
try
{
	String strKey = request.getParameter("ui_key");
	String strRow = request.getParameter("panel_row");
	String strCol = request.getParameter("panel_col");
	String sName = request.getParameter("ui_name");
	String sValue = request.getParameter("ui_value");
	String strType = request.getParameter("ui_type");

	BusinessData businessData = (BusinessData)request.getAttribute(InitClass.getBusinessDataValue());
	DefaultXmlResource res = DefaultXmlResource.getInstance();
	
%>
<form name="frmArea" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_109677787461288834256899"></input>
<input type="hidden" name="ui_name"></input>
<input type="hidden" name="code"></input>
<input type="hidden" name="layout_name"></input>
<input type="hidden" name="layout_is_panel" value="true"></input>
<input type="hidden" name="area_name"></input>
<input type="hidden" name="area_style"></input>
<input type="hidden" name="area_class"></input>
<input type="hidden" name="area_key"></input>
<input type="hidden" name="x"></input>
<input type="hidden" name="y"></input>
</form>
<form name="frmLayout" method="post" action="/Anaconda.do">
<input type="hidden" name="layout_span_count" value="0"></input>
<input type="hidden" name="CMD" value="CMD_SEQ_104529980561288665280982"></input>
<input type="hidden" name="layout_name" value="<%=strKey %>"></input>
<input type="hidden" name="layout_type" value="<%=strType %>"></input>
<input type="hidden" name="layout_row" value="<%=strRow %>"></input>
<input type="hidden" name="layout_col" value="<%=strCol %>"></input>
<div>
 <div class="content-module-heading cf">
  <h3 class="fl">
  Create UI area Step 2(Div area)
  </h3>	
  <span class="fr">
<input type="button" class="button white" value="Back" onClick="javascript:history.back();">
  </span>
 </div>
</div>

<table class="table-neo">
		<colgroup>
		<col width="30%">
		<col>
		</colgroup>
		<thead>
		<tr>
		<th scope="col">Attribute</th>
		<th scope="col">Value</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td>UI area name</td>
			<td><%=sName %></td>
		</tr>
		<tr>
			<td>Count of rows</td>
			<td><%=strRow %></td>
		</tr>
		<tr>
			<td>Count of cols</td>
			<td><%=strCol %></td>
		</tr>
		</tbody>
</table>

<fieldset style="padding: 10px 10px 10px 10px;">
<legend style="font-family:돋움체;font-size:12px">UI area layout</legend>
<div id ="div_layout" >
	<%
		DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_AREA);
		DefaultXmlDataCollection layoutCollection = null;
		if(col != null)
		{
			layoutCollection = col.getDefaultXmlData("layout_name",strKey);
		}
		int intRow = Integer.parseInt(strRow);
		int intCol = Integer.parseInt(strCol);
		for(int i  = 0; i < intRow ; i++)
		{
	%>
		<div id="div_row_<%=i %>"  >
			<%

				int intWidth = 95/intCol; 
				for(int j = 0 ; j < intCol ; j++)
				{
					int Color = j % 10;
					String strColor = "0" + Color;
					String strAreaKey  =  "";
					String strAreaName = "";
					String strPath = "";
					String strName = "";
					String strUIName = ""; 
					String strStyle = "";
					String strClass = "";
					if(layoutCollection !=null)
					{
						DefaultXmlDataCollection searchCollection = layoutCollection.getDefaultXmlData("x",""+i);
						if( searchCollection != null && searchCollection.size() > 0)
						{
							searchCollection = searchCollection.getDefaultXmlData("y",""+j);
							if(searchCollection != null && searchCollection.size() > 0)
							{
								DefaultXmlData defaultXmlData = (DefaultXmlData)searchCollection.get(0);
								strAreaKey = defaultXmlData.getNAME();
								strAreaName = defaultXmlData.getData("area_name");
								strUIName = defaultXmlData.getData("ui_name");
								strStyle = defaultXmlData.getData("area_style");
								strClass = defaultXmlData.getData("area_class");
								if(res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_UI) !=null && res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_UI).getDefaultXmlData(strUIName) != null)
								{
									strName = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_UI).getDefaultXmlData(strUIName).getData("name");
									strPath = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_UI).getDefaultXmlData(strUIName).getData("value");
								}
							}
						}
					}
					
					String strHDColor = "#E8E8E8";
					String strBGColor = "#E8E8E8";
					if(BusinessHelper.checkBusinessNull(strAreaName))
					{
						if(strAreaName.equals("BODY")) strHDColor = "#FFCCCC";
						else strHDColor = "#CCFF99";
						strBGColor = "#FFFFFF";	
					}
			%>		
				<div id="div_col_<%=i%>_<%=j %>" style="float:left;width:<%=intWidth%>%;" >
					<input id='element_<%=i%>_<%=j %>_ui_name' type="hidden" name="div_ui_name" value="<%=strUIName %>" ></input>
					<input id='element_<%=i%>_<%=j %>_area_name' type="hidden" name="div_area_name" value="<%=strAreaKey %>" ></input>
					<table>
					<tr>
					<td style="padding: 5px 5px 5px 5px;background-color:<%=strHDColor %>;"><b>Attribute</b></td><td style="padding: 5px 5px 5px 5px;background-color:<%=strHDColor %>;"><b>Value&nbsp;&nbsp;<a href="javascript:fnNull();" onClick="javascript:fnShowOrHideMenu('div_menu_<%=i%>_<%=j %>');"><img src="/jsp/anaconda/img/menu.png" border=0 width="15px" height="15px" align="absmiddle"></img>Menu</a></b></td>
					</tr>
					<tr>
					<td style="padding: 5px 5px 5px 5px;background-color:<%=strBGColor%>;">Area name</td><td style="padding: 5px 5px 5px 5px;background-color:<%=strBGColor%>;"><input id='element_<%=i%>_<%=j %>' type="text" name="div_name" class="styled" value="<%=strAreaName %>" size="10"></input></td>
					</tr>
					<tr>
					<td style="padding: 5px 5px 5px 5px;background-color:<%=strBGColor%>;">Path</td>
					<td style="padding: 5px 5px 5px 5px;background-color:<%=strBGColor%>;"><input id='element_<%=i%>_<%=j %>_file' type="text" name="div_path" class="styled" value="<%=strPath %>" size="10"></input>
					&nbsp;&nbsp;<!-- input id='element_<%=i%>_<%=j %>_is_body' type="radio" name="isBody" onClick="javascript:fnSelectBody('element_<%=i%>_<%=j %>','<%=i %>','<%=j %>');">Main body area</input--></td>
					</tr>
					<tr>
					<td style="padding: 5px 5px 5px 5px;background-color:<%=strBGColor%>;">Style</td>
					<td style="padding: 5px 5px 5px 5px;background-color:<%=strBGColor%>;"><input id='element_<%=i%>_<%=j %>_style' type="text" name="div_style" class="styled" value="<%=strStyle %>" size="10"></input>
					&nbsp;&nbsp;<!-- input id='element_<%=i%>_<%=j %>_is_body' type="radio" name="isBody" onClick="javascript:fnSelectBody('element_<%=i%>_<%=j %>','<%=i %>','<%=j %>');">Main body area</input--></td>
					</tr>
					<tr>
					<td style="padding: 5px 5px 5px 5px;background-color:<%=strBGColor%>;">Class</td>
					<td style="padding: 5px 5px 5px 5px;background-color:<%=strBGColor%>;"><input id='element_<%=i%>_<%=j %>_class' type="text" name="div_class" class="styled" value="<%=strClass %>" size="10"></input>
					&nbsp;&nbsp;<!-- input id='element_<%=i%>_<%=j %>_is_body' type="radio" name="isBody" onClick="javascript:fnSelectBody('element_<%=i%>_<%=j %>','<%=i %>','<%=j %>');">Main body area</input--></td>
					</tr>
					<!-- tr>
					<td style="padding: 5px 5px 5px 5px;background-color:<%=strBGColor%>;" colspan=2><input type="button" class="button white" value="Search file" onClick="javascript:fnFind('element_<%=i%>_<%=j %>');"></input>
					<input type="button" class="button white" value="Save" onClick="javascript:fnSaveArea('element_<%=i%>_<%=j %>','<%=i%>','<%=j%>');"></input></td>
					</tr-->
					</table>
				</div>
				<div id="div_menu_<%=i%>_<%=j %>" class="pop-menu">
				<ul>
					<li><a href='javascript:fnShowOrHide("div_menu_<%=i%>_<%=j %>");'><img src='/jsp/anaconda/img/close.png' width='10px' height='10px' border='0' align='absmiddle' />close</a></li>
					<!--  li><a href="javascript:fnSelectBody('element_<%=i%>_<%=j %>','<%=i %>','<%=j %>');">Select body area</a></li>
					<li><a href="javascript:fnNull();" onClick="javascript:fnFind('element_<%=i%>_<%=j %>');">Search jsp file</a></li>
					<li><a href="javascript:fnNull();" onClick="javascript:fnFindUI('element_<%=i%>_<%=j %>');">Anaconda UI 검색</a></li-->
					<li><a href="javascript:fnSaveArea('element_<%=i%>_<%=j %>','<%=i%>','<%=j%>');">Save</a></li>
					<li><a href="javascript:fnRemoveArea('element_<%=i%>_<%=j %>','<%=i%>','<%=j%>');">Delete</a></li>
				</ul>
				</div>
			<%
				}
			%>
		</div>
	<%
		}
	%>
</div>
</fieldset>
</form>
<p></p>
<br></br><br></br>
<div id="div_search_layout" class="styled" style="display:none;position:absolute;background-color:#FFFFFF;width:300px;overflow-x:scroll;height:100px;overflow-y:scroll;">
	<ul id="ul_search_layout">
	</ul>
</div>
<div id="searchResult" style="display:none;position:absolute;width=100px;">
<form name="frmSearchResult" method="post">
<table>
		<caption></caption>
		<colgroup>
		<col width="100px">
		<col width="100px">
		</colgroup>
		<thead>
		<tr>
		<th scope="col">Name</th>
		<th scope="col">Path</th>
		</tr>
		</thead>
		<tbody id="tBodySearchResult">
		</tbody>
</table>
</form>
</div>

<!----------------------------------------- 리스트 보여주는 테이블 끝----------------------------------------->
<script language="javascript">

function fnFind(args)
{
	var data = _(args).value;
	var action = null;
	if(action == null || action == '')action = 'find';
	var pos = getCurrentPosition();
	var ac = new ajaxInteraction(action, "/Anaconda.do?CMD=CMD_SEQ_107412743841288767936876&searchField="+args+"&code=find&search="+data+"&x="+pos.x+"&y="+pos.y, '');
	ac.doPost();
}
function fnFindUI(args)
{
	var data = _(args).value;
	var action = null;
	if(action == null || action == '')action = 'search';
	var pos = getCurrentPosition();
	var ac = new ajaxInteraction(action, "/Anaconda.do?CMD=CMD_SEQ_107412743841288767936876&search_key_word="+data+"&searchField="+args+"&code=search&x="+pos.x+"&y="+pos.y, '');
	ac.doPost();
}
function fnSaveArea(args,arg1,arg2)
{
    if(confirm("Really save?")){
	var data = _(args).value;
	var ui = _(args +'_ui_name').value;
	var area = _(args +'_area_name').value;
	var strStyle = _(args +'_style').value;
	var strClass = _(args +'_class').value;
	if(data == null || data == '')
	{
		alert("Please input a name of area (ex:footer)");
		return;
	}

	with(frmArea)
	{
		layout_name.value = '<%=strKey %>';
		ui_name.value = ui;
		area_name.value = data;
		area_key.value = area;
		area_style.value = strStyle;
		area_class.value = strClass;
		x.value = arg1;
		y.value = arg2;
		code.value = 'saveLayoutAndUI';
	}

	callAjaxByForm("saveLayoutAndUI", "frmArea");
    }

}

function fnRemoveArea(args,arg1,arg2)
{
	if(!confirm("Really delete?"))
	{
		return;
	}
	var data = _(args).value;
	var ui = _(args +'_ui_name').value;
	var area = _(args +'_area_name').value;
	var strStyle = _(args +'_style').value;
	var strClass = _(args +'_class').value;

	with(frmArea)
	{
		layout_name.value = '<%=strKey %>';
		ui_name.value = ui;
		area_name.value = data;
		area_key.value = area;
		area_style.value = strStyle;
		area_class.value = strClass;
		x.value = arg1;
		y.value = arg2;
		code.value = 'removeLayoutAndUI';
	}

	callAjaxByForm("removeLayoutAndUI", "frmArea");

}

function fnSave(args)
{
  if(confirm("Really save?")){
	var data = eval('frmLayout.' + args + '_file.value');
	var action = null;
	if(action == null || action == '')action = 'save';
	var ac = new ajaxInteraction(action, "/Anaconda.do?CMD=CMD_SEQ_106917781791288678076070&code=create&page_path="+data, '');
	ac.doPost();
  }
}

function fnRemove(args)
{
   if(confirm("Really delete?")){
	var data = eval('frmLayout.' + args + '_file.value');
	var action = null;
	if(action == null || action == '')action = 'remove';
	var ac = new ajaxInteraction(action, "/Anaconda.do?CMD=CMD_SEQ_106917781791288678076070&code=remove&name="+data, '');
	ac.doPost();
    }
}

function doRun(callerName, REQ)
{
	var root = null;
	
	if(callerName == 'save')
	{
		root = REQ.responseXML.documentElement;
	}
	else if(callerName == 'saveLayoutAndUI')
	{
		alert("Applied successfully.");
		document.location.reload();
		return;
	}
	else if(callerName == 'saveBodyArea')
	{
		alert("Applied successfully.");
		document.location.reload();
		return;
	}
	else if(callerName == 'removeLayoutAndUI')
	{
		alert("Applied successfully.");
		document.location.reload();
		return;
	}
	else if(callerName == 'remove')
	{
		root = REQ.responseXML.documentElement;
	}
	else if(callerName == 'findOld')
	{
		var tBody = _("tBodySearchResult");
		removeAllChildNodesById("tBodySearchResult");
		root = REQ.responseXML.documentElement;
		var object = parseAnacondaAJAX(REQ.responseXML);
		if(object == null)
		{
			alert("ERROR");
			return;
		}
		
		for(var i = 0; i < object.response.length; i++)
		{
			var item = object.response[i];
			var tr = createElement("tr","","");
			var td1 = createElement("td","","");
			var td2 = createElement("td","","");
			var a = createElement("a","","");
			a.setAttribute("href","javascript:setPageToLayout('"+object.request.searchField+"','"+item.value+"','" + item.nodeName + "','" + item.name + "');");
			a.innerHTML = item.value;
			tBody.appendChild(tr);
			tr.appendChild(td1);
			tr.appendChild(td2);
			td1.innerHTML =item.name;
			td2.appendChild(a);
		}
		var divResult = document.getElementById("searchResult");
		divResult.style.display = "block";
		// divResult.style.position = "absolute";
		var position = getCurrentPosition();
		divResult.style.left = position.x;
		divResult.style.top = position.y; 
	}
	else if(callerName == 'find' || callerName == 'search' )
	{
		var object = parseAnacondaAJAX(REQ.responseXML);
		if(object == null)
		{
			alert("ERROR");
			return;
		}
		var objUL = _("ul_search_layout");
		removeAllChildNodesById("ul_search_layout");
		var title = createElement("li","","");
		title.innerHTML = "<a href='javascript:fnShowOrHide(" + "\"" + "div_search_layout" + "\");'><img src='/jsp/anaconda/img/close.png' width='10px' height='10px' border='0' align='absmiddle' />close</a>";
		objUL.appendChild(title);
		for(var i = 0; i < object.response.length; i++)
		{
			var item = object.response[i];
			var li = createElement("li","","");
			var a = createElement("a","","");
			a.setAttribute("href","javascript:setPageToLayout('"+object.request.searchField+"','"+item.value+"','" + item.nodeName + "','" + item.name + "');");
			a.innerHTML = item.value;
			/**
			if(object.request.key == 'VIEW_LAYOUT')
			{
				a.innerHTML = view.VIEW_LAYOUT + '&nbsp;&nbsp;&nbsp;(' + view.VIEW_DESC + ')';
			}
			else if (object.request.key == 'VIEW_BODY')
			{
				a.innerHTML = view.VIEW_BODY + '&nbsp;&nbsp;&nbsp;(' + view.VIEW_DESC + ')';
			}
			**/
			li.appendChild(a);
			objUL.appendChild(li);
		}
		var posX = parseInt(object.request.x) + 10;
		var posY = parseInt(object.request.y) + 5;
		fnLocateDivInClickEventNoScroll("div_search_layout",posX,posY );
	}
	
	
	
}

function setPageToLayout(nodeName, path , uiName, name)
{
	var data1 = _(nodeName + '_file');
	var data2 = _(nodeName + '_ui_name');
	var area = _(nodeName);
	area.value = name;
	data1.value = path;
	data2.value = uiName;
	fnShowOrHide('div_search_layout');
}


function doRuning(callerName)
{
showRunning(callerName);
}

function fnSelectBody(body,x1,y1)
{
	with(frmArea)
	{
		var data1 = _(body);
		var data2 = _(body + '_file');
		var strStyle = _(body +'_style').value;
		var strClass = _(body +'_class').value;
		if(data1.value != '' && data2.value != null)
		{
			alert("You can not select UI element in main body area. Initialize this area");
			data1.value = '';
			data2.value = '';
			return;
		}
		var data = _(body).value;
		var ui = _(body +'_ui_name').value;
		var area = _(body +'_area_name').value;
		layout_name.value = '<%=strKey %>';
		area_name.value = 'BODY';
		area_key.value = area;
		area_style.value = strStyle;
		area_class.value = strClass;
		x.value = x1;
		y.value = y1;
		code.value = 'saveBodyArea';
		callAjaxByForm("saveBodyArea", "frmArea");
	}
}

</script>

<%
}
catch(Exception e)
{
	e.printStackTrace();
	out.println(e.getMessage());
}
%>
