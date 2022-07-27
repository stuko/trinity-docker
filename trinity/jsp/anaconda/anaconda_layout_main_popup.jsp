<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>

<%
	boolean isRegister = true;
	String strColName= request.getParameter("Col");
	String strView= request.getParameter("View");
	String strLayout = "";	
	String strForward = "";
	String strForwardKorName = "";
	String strBody = "";
	String strTop = "";
	String strLeft = "";
	String strRight = "";
	String strFooter = "";
	String strDesc = "";
	String strType = "";
	String strLayoutType = "";
	String strAreaFile = "";
	String strXtremeUseYN = "";
	String strSelectY = "";
	String strSelectN = "";
	View view = null;
	
	
	try
	{
		if(strView != null)
		{

			ViewXmlResource xmlResource = ViewXmlResource.getInstance();	
			if(strColName != null) view = xmlResource.searchView(strColName,strView);	
			else
			{
				view = xmlResource.searchView(strView);	
				strColName = view.getVIEW_COLLECTION_NAME();
			}
					
			strLayout 	= view.getLAYOUT();
			strForward 	= view.getFORWARD_NAME();
			strBody     = view.getBODY();
			strTop	    = view.getTOP();
			strLeft	    = view.getLEFT();
			strRight	= view.getRIGHT();
			strFooter 	= view.getFOOTER();		
			strDesc 	= view.getDESC();		
			strType 	= view.getVIEW_TYPE();	
			strLayoutType = view.getViewItem(BlankField.LAYOUT_TYPE);
			strAreaFile = view.getViewItem(InitClass.DEFAULT_AREA);
			strXtremeUseYN = view.getViewItem(InitClass.XTREME_USE_YN);
			
// System.out.println("#######-->" + strXtremeUseYN );

			if(!"N".equals(strXtremeUseYN))
			{
				strSelectY = "selected";
				strSelectN = "";
				strXtremeUseYN = "Y";
			}
			else
			{
				strSelectN = "selected";
				strSelectY = "";
				strXtremeUseYN = "N";
			}
			
			if(!BusinessHelper.checkBusinessNull(strLayoutType))
			{
				strLayoutType = BlankField.BASIC_PATH;
			}
			strForwardKorName = view.getFORWARD_KOR_NAME();
			if(strType == null || strType.equals("null")) strType = "FORWARD";
			
			isRegister = false;
			
		}
		else
		{
			strColName= "";
			strView= "";
			isRegister = true;
		}


%>
<script>
function go(url){
  document.location.href = url;
}
</script>

	<form name="frmSearch" method="post" action="/Anaconda.do">
	<input type="hidden" name="search"></input>
	<input type="hidden" name="key"></input>
	<input type="hidden" name="x"></input>
	<input type="hidden" name="y"></input>
	<input type="hidden" name="CMD"></input>
	<input type="hidden" name="GUBUN" value="">
	</form>

	<form name="frmDirectElement" method="post" action="/Anaconda.do">
	<input type="hidden" name="CMD" value=""></input>
	<input type="hidden" name="GUBUN" value="">
	<input type="hidden" name="viewKey" value=""></input>
	<input type="hidden" name="area_name" value=""></input>
	<input type="hidden" name="area_path" value=""></input>
	</form>

	<form name="frmView" method="post" action="/Anaconda.do">
	<input type="hidden" name="CMD" value="CMD_SEQ_104913855441287801302856">
	<input type="hidden" name="GUBUN" value="">
	<input type="hidden" name="XtremeUseYN" value="<%=strXtremeUseYN %>">

	<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">View layout info.</h3>
			<span class="fr"><button type="button" class="btn btn-primary" name="Register" value="Copy a layout" onClick="javascript:fnViewCopy();">Copy a layout</button></span>
			<%if(isRegister){ %>
			<span class="fr"><button type="button" class="btn btn-secondary" name="Register" value="Create a layout" onClick="javascript:fnViewCreate();">Create a layout</button></span>
			<%}else{ %>
			<span class="fr"><button type="button" class="btn btn-info" name="Register" value="Modify a layout" onClick="javascript:fnViewUpdate();">Save a layout</button></span>
			<%} %>
			<span class="fr"><button type="button" class="btn btn-danger" name="Register" value="Delete a layout" onClick="javascript:fnViewDelete();">Delete a layout</button></span>
			<span class="fr"><button type="button" class="btn btn-warning" name="Register" value="Back" onClick="javascript:history.back();">Back</button></span>
											
			</div>
		</div>
	</div>
</div>
	

	  <table class="table_hydra" cellspacing="0" cellpadding="0">
		<colgroup>
		<col width="30%">
		<col>
		</colgroup>
		<thead >
		<tr>
		<th scope="col">Attribute</th>
		<th scope="col">Value</th>
		</tr>
		</thead>
		<tbody >
		<tr>
		  <td class="list_top"  width="250">View name</td>
		  <td>&nbsp;<input type="text" class="styled" name="ForwardKorName" size="60" value="<%=strForwardKorName%>"></td>	
  		</tr>
  		<!-- 
  		<tr>
		  <td class="list_top"  width="250">New View group or not ?</td>
		  <td>&nbsp;<input type="checkbox" name="chkCol" checked onClick="javascript:checkCol();">&nbsp;(If you want create, don't check)</td>	
  		</tr>
  		<tr>
		  <td class="list_top" width="250">New view or not?</td>
		  <td><input type="checkbox" name="chkView" checked onClick="javascript:checkView();">&nbsp;(If you want create, don't check)</td>	
  		</tr>
  		 -->
  	   <%if(!isRegister){ %>
  		<tr>
		  <td class="list_top"  width="250">View group code</td>
		  <!-- >td>&nbsp;<input type="text" class="styled" name="CollectionName" size="60" value=""></td-->
		  <td>&nbsp;<%=strColName%><input type="hidden" name="CollectionName" value="<%=strColName%>"></td>
  		</tr>
	  <%} %>
  	   <%if(!isRegister){ %>
  		<tr>
		  <td class="list_top" width="250">View code</td>
		  <td>&nbsp;<%=strView%><input type="hidden" name="Forward" value="<%=strView%>"></td>	
  		</tr>
	  <%} %>
		<tr>
		  <td class="list_top" width="250">Forward or not</td>
		  <td>&nbsp;
	  		<SELECT NAME='VIEW_TYPE'>
			  <OPTION value='FORWARD' <%=strType.equals("FORWARD")?"selected":""%>>Forward</OPTION>
			  <OPTION value='REDIRECT' <%=strType.equals("REDIRECT")?"selected":""%>>Redirec </OPTION>
	  		</SELECT>
		  </td>	
		</tr>
		<tr>
		  <td class="list_top" width="250">Xtreme or not</td>
		  <td>&nbsp;
	  		<SELECT id="SelectXtremeUseYN" NAME='SelectXtremeUseYN'>
			  <OPTION value='Y' <%=strSelectY %>>Use Xtreme</OPTION>
			  <OPTION value='N' <%=strSelectN %>>Not use Xtreme</OPTION>
	  		</SELECT>
		  </td>	
		</tr>
		<tr>
		  <td class="list_top" width="250">Layout type</td>
		  <td>&nbsp;
	  		<SELECT id="LayoutTypeObject" NAME='LayoutType' onChange="javascript:selectLayoutType(this.selectedIndex);">
			  <OPTION value='BASIC_PATH' >top, left, right, bottom</OPTION>
			  <OPTION value='DIRECT_PATH' >create layout' area</OPTION>
			  <OPTION value='ANACONDA_VIEW' >Anaconda special layout</OPTION>
			  <OPTION value='PARENT_VIEW' >Action group's layout</OPTION>
	  		</SELECT>
		  </td>	
		</tr>
		</tbody>
		</table>
		
		<div id="div_search_layout" class="styled" style="display:none;position:absolute;background-color:#FFFFFF;width:500px;overflow-x:scroll;height:300px;overflow-y:scroll;">
			<ul id="ul_search_layout">
			</ul>
		</div>

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Detail info.</h3>	
			</div>
		</div>
	</div>
</div>

		<div id="div_basic" style="display:none;">
  		<table class="table_hydra" cellspacing="0" cellpadding="0">
		<colgroup>
		<col width="30%">
		<col>
		</colgroup>
		<thead >
		<tr>
		<th scope="col">Area</th>
		<th scope="col">File path</th>
		</tr>
		</thead>
		<tbody>
		<tr>
		  <td class="list_top" width="250">Layout&nbsp;&nbsp;<a href="javascript:fnNull();" onClick="javascript:fnSearchBasicLayout('Layout');" style="color:blue;"><img src="/jsp/anaconda/img/search_result.png" width="10px" height="10px" border="0" align="absmiddle"></img>Search</a></td>
		  <td><input type="text" class="styled" name="Layout" value="<%=strLayout%>" size="60">&nbsp;<button type="button" class="btn btn-primary" value="Save" onClick="javascript:fnSaveDirectElement('VIEW_LAYOUT',document.frmView.Layout.value);">Save</button>&nbsp;
<button type="button" class="btn btn-secondary" value="Open file" onClick="go('/Anaconda.do?CMD=CMD_SEQ_106594560501498179923551&path=<%=strLayout%>')">Open a file</button>
		  </td>	
  		</tr>
  		<tr>
    	  <td class="list_top" width="250">Body&nbsp;&nbsp;<a href="javascript:fnNull();" onClick="javascript:fnSearchBasicLayout('Body');" style="color:blue;"><img src="/jsp/anaconda/img/search_result.png" width="10px" height="10px" border="0" align="absmiddle"></img>Search</a></td>
		  <td><input type="text" class="styled" name="Body" value="<%=strBody%>" size="60">&nbsp;<button type="button" class="btn btn-primary" value="Save" onClick="javascript:fnSaveDirectElement('VIEW_BODY',document.frmView.Body.value);">Save</button>&nbsp;
<button type="button" class="btn btn-secondary" value="Open file" onClick="go('/Anaconda.do?CMD=CMD_SEQ_106594560501498179923551&path=<%=strBody%>')">Open a file</button>
		  </td>	
  		</tr>
  		<tr>
    	  <td class="list_top" width="250">Top&nbsp;&nbsp;<a href="javascript:fnNull();" onClick="javascript:fnSearchBasicLayout('Top');" style="color:blue;"><img src="/jsp/anaconda/img/search_result.png" width="10px" height="10px" border="0" align="absmiddle"></img>Search</a></td>
		  <td><input type="text" class="styled" name="Top" value="<%=strTop%>" size="60">&nbsp;<button type="button" class="btn btn-primary" value="Save" onClick="javascript:fnSaveDirectElement('VIEW_TOP',document.frmView.Top.value);">Save</button>&nbsp;
<button type="button" class="btn btn-secondary" value="Open file" onClick="go('/Anaconda.do?CMD=CMD_SEQ_106594560501498179923551&path=<%=strTop%>')">Open a file</button>
		  </td>	
  		</tr>
  		<tr>
		  <td class="list_top" width="250">Left&nbsp;&nbsp;<a href="javascript:fnNull();" onClick="javascript:fnSearchBasicLayout('Left');" style="color:blue;"><img src="/jsp/anaconda/img/search_result.png" width="10px" height="10px" border="0" align="absmiddle"></img>Search</a></td>
		  <td><input type="text" class="styled" name="Left" value="<%=strLeft%>" size="60">&nbsp;<button type="button" class="btn btn-primary" value="Save" onClick="javascript:fnSaveDirectElement('VIEW_LEFT',document.frmView.Left.value);">Save</button>&nbsp;
<button  type="button" class="btn btn-secondary" value="Open file" onClick="go('/Anaconda.do?CMD=CMD_SEQ_106594560501498179923551&path=<%=strLeft%>')">Open a file</button>
		  </td>	
  		</tr>
  		<tr>
    	  <td class="list_top" width="250">Right&nbsp;&nbsp;<a href="javascript:fnNull();" onClick="javascript:fnSearchBasicLayout('Right');" style="color:blue;"><img src="/jsp/anaconda/img/search_result.png" width="10px" height="10px" border="0" align="absmiddle"></img>Search</a></td>
		  <td><input type="text" class="styled" name="Right" value="<%=strRight%>" size="60">&nbsp;<button type="button" class="btn btn-primary" value="Save" onClick="javascript:fnSaveDirectElement('VIEW_RIGHT',document.frmView.Right.value);">Save</button>&nbsp;

<button type="button" class="btn btn-secondary" value="Open file" onClick="go('/Anaconda.do?CMD=CMD_SEQ_106594560501498179923551&path=<%=strRight%>')">Open a file</button>
		  </td>	
  		</tr>
  		<tr>
		  <td class="list_top" width="250">Footer&nbsp;&nbsp;<a href="javascript:fnNull();" onClick="javascript:fnSearchBasicLayout('Footer');" style="color:blue;"><img src="/jsp/anaconda/img/search_result.png" width="10px" height="10px" border="0" align="absmiddle"></img>Search</a></td>
		  <td><input type="text" class="styled" name="Footer" value="<%=strFooter%>" size="60">&nbsp;<button type="button" class="btn btn-primary" value="Save" onClick="javascript:fnSaveDirectElement('VIEW_FOOTER',document.frmView.Footer.value);">Save</button>&nbsp;
<button type="button" class="btn btn-secondary" value="Open file" onClick="go('/Anaconda.do?CMD=CMD_SEQ_106594560501498179923551&path=<%=strFooter%>')">Open a file</button>
		  </td>	
  		</tr>
  		<tr>
		  <td class="list_bottom" width="250">Desc.</td>
		  <td><input type="text" class="styled" name="Desc" value="<%=strDesc%>" size="60"></td>	
  		</tr>
  		</tbody>
  		</table>
  		</div>
 	
</form>

		<div id="div_direct" style="display:none;">
		<form name="frm_direct" method="post" action="">
		<br>
		<h4>Create Layout's area</h4>
  		<table class="table_hydra" cellspacing="0" cellpadding="0">
  		<colgroup>
		<col width="30%">
		<col width="30%">
		<col>
		</colgroup>
		<thead >
		<tr>
		<th scope="col">Area name(ex:TOP)</th>
		<th scope="col">File path</th>
		<th scope="col">Function 
<button type="button" class="btn btn-secondary" value="Add row" onClick="fnAddRow('tbl_direct')">Add row</button>
                </th>
		</tr>
		</thead>
		<tbody id="tbl_direct">
  		<tr>
		  <td class="list_top" width="250">Layout&nbsp;&nbsp;<a href="javascript:fnNull();" onClick="javascript:fnSearchBasicLayoutInDirect('VIEW_LAYOUT');" style="color:blue;"><img src="/jsp/anaconda/img/search_result.png" width="10px" height="10px" border="0" align="absmiddle"></img>Search</a></td>
		  <td><input type="text" class="styled" name="Layout" value="<%=strLayout%>" size="40"></td>
		  <td><button type="button" class="btn btn-primary" value="Save" onClick="javascript:fnSaveDirectElement('VIEW_LAYOUT',document.frm_direct.Layout.value);">Save</button><!-- input type="button" class="button white" value="Delete" onClick="javascript:fnDelRow('tbl_direct');"></input -->&nbsp;

<button type="button" class="btn btn-secondary" value="Open file" onClick="go('/Anaconda.do?CMD=CMD_SEQ_106594560501498179923551&path=<%=strLayout%>')">Open a file</button>
</td>
  		</tr>
  		<%
  			if(view != null) 
  			{
  				String strFilterKeyList = "VIEW_FORWARD_KOR_NAME,VIEW_TYPE,VIEW_LAYOUT,VIEW_DESC,VIEW_FORWARD_NAME,VIEW_COLLECTION_NAME,LAYOUT_TYPE,DEFAULT_AREA,OWNER";
  				Set key = view.keySet();
  				Iterator it = key.iterator();
  				for(int i = 0 ;it.hasNext(); i++)
  				{
  					String strKey = (String)it.next();
  					String strValue = view.getViewItem(strKey);
  					if(strFilterKeyList.indexOf(strKey) < 0)
  					{
  		%>
  		<tr>
  		<td><input type="text" name="direct_item_key_<%=i %>" class="styled" size="25" value="<%=strKey %>"></input></td>
  		<td><input type="text" name="direct_item_value_<%=i %>" class="styled" size="40" value="<%=strValue %>"></input></td>
  		<td><button type="button" class="btn btn-primary" value="Save" onClick="javascript:fnSaveDirectElement('<%=strKey %>',document.frm_direct.direct_item_value_<%=i %>.value);">Save</button>&nbsp;<button type="button" class="btn btn-secondary" value="Delete" onClick="javascript:fnRemoveDirectElement('<%=strKey %>',document.frm_direct.direct_item_value_<%=i %>.value);">Delete</button></td>
  		</tr>
  		<%
  					}
  				}
  			}
  		%>
  		</tbody>
  		</table>
  		
  		</form>
  		</div>
  		<div id="div_anaconda" style="display:none;">
  		<form name="frm_anaconda" method="post" action="/Anaconda.do">
  		<input type="hidden" name="CMD"></input>
  		<input type="hidden" name="GUBUN" value=""></input>
  		<input type="hidden" name="viewKey" value=""></input>
  		<br>
		<h4>* Anaconda Special Layout</h4>
  		<table class="table_hydra" cellspacing="0" cellpadding="0">
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
		<tbody >
  		<tr>
		  <td class="list_top" width="250">Anaconda Layout&nbsp;&nbsp;<a href="javascript:fnSearchLayout();" style="color:blue;"><img src="/jsp/anaconda/img/search_result.png" width="10px" height="10px" border="0" align="absmiddle"></img>Search</a></td>
		  <td><input type="text" class="styled" name="Layout" value="<%=strLayout%>" size="60"> &nbsp;&nbsp;<button type="button" class="btn btn-primary" value="Save anaconda layout" onClick="javascript:fnSaveAnacondaLayout();">Save anaconda layout</button></td>	
  		</tr>
		<tr>
		  <td class="list_top" width="250">Select Area File&nbsp;&nbsp;<a href="javascript:fnSearchLayout();" style="color:blue;"><img src="/jsp/anaconda/img/search_result.png" width="10px" height="10px" border="0" align="absmiddle"></img>Search</a></td>
		  <td><input type="text" class="styled" name="AreaFile" value="<%=strAreaFile%>" size="60"></td>	
  		</tr>
  		<tr>
		  <td class="list_top" width="250">Body area&nbsp;</td>
		  <td><input type="text" class="styled" name="Body" value="<%=strBody%>" size="60">&nbsp;
<button type="button" class="btn btn-primary" value="Open file" onClick="go('/Anaconda.do?CMD=CMD_SEQ_106594560501498179923551&path=<%=strBody%>')">Open a file</button>
                </td>	
  		</tr>
  		</table>
  		</form>
  		
  		</div>
  		<div id="div_parent" style="display:none;">
  		<form name="frm_parent" method="post" action="/Anaconda.do">
   		<input type="hidden" name="CMD"></input>
  		<input type="hidden" name="GUBUN" value=""></input>
  		<input type="hidden" name="viewKey" value=""></input>
		<br>
		<h4>* Anaconda or Hydra Framework Basic layout</h4>
  		<table class="table_hydra" cellspacing="0" cellpadding="0">
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
		<tbody >
  		<tr>
		  <td class="list_top" width="250">Body area&nbsp;</td>
		  <td><input type="text" class="styled" name="Body" value="<%=strBody%>" size="60">&nbsp;
<input type="text" class="styled" name="Body" value="<%=strBody%>" size="60">&nbsp;
<button type="button" class="btn btn-primary" value="Open file" onClick="go('/Anaconda.do?CMD=CMD_SEQ_106594560501498179923551&path=<%=strBody%>')">Open a file</button>
</td>	
  		</tr>	
  		</table>
  		
  		</form>
  		
 		</div> 
<br>  		
<script language="javascript">

function fnViewUpdate()
{
	with(frmView)
	{
		GUBUN.value = 'U';
		if(confirm("Really update?"))
		{
			for(var i = 0; i < SelectXtremeUseYN.length; i++)
			{
				if(i == SelectXtremeUseYN.selectedIndex)
				{
					XtremeUseYN.value = SelectXtremeUseYN.options[i].value;
					break;
				}
			}
			alert("XtremeUseYN  = N,  Does not use Xtreme(Y/N : " + XtremeUseYN.value + ")");
			CollectionName.disabled = false;
			Forward.disabled = false;
			//submit();
			callAjaxByForm("fnViewUpdate", "frmView");
		}
	}
	

}
function fnViewCreate()
{
	with(frmView)
	{
		GUBUN.value = 'R';
		if(confirm("Create view?"))
		{
			CollectionName.disabled = false;
			Forward.disabled = false;
			//submit();
			callAjaxByForm("fnViewCreate", "frmView");
		}
	}
	
}
function fnViewCopy()
{
	with(frmView)
	{
		GUBUN.value = 'C';
		if(confirm("Copy layout?"))
		{
			CollectionName.disabled = false;
			Forward.disabled = false;
			//submit();
			callAjaxByForm("fnViewCopy", "frmView");
		}
	}
	
}
function fnViewDelete()
{
	with(frmView)
	{
		GUBUN.value = 'D';
		if(confirm("Delete layout?"))
		{
			CollectionName.disabled = false;
			Forward.disabled = false;
			//submit();
			callAjaxByForm("fnViewDelete", "frmView");
		}
	}
	
}
function checkCol()
{
	with(frmView)
	{
		if(chkCol.checked == true) CollectionName.disabled = true;
	    else CollectionName.disabled = false;
	}
}
function checkView()
{
	with(frmView)
	{
		if(chkView.checked == true) Forward.disabled = true;
	    else Forward.disabled = false;
	}
}

function fnEditView(url)
{
	window.open(url+"&title=Edit","","height=800,width=1200,left=10,top=20,status=no, location=no, toolbar=no,resizable=yes,scrollbars=yes");
}


function fnSearchLayout()
{
	var args = frmView.Layout.value;
	window.open("/Anaconda.do?CMD=CMD_SEQ_107571796881288935101238&title=Layout&Object=opener.frm_anaconda.Layout&search=" + args,"","height=450,width=800,left=200,top=20,status=no, location=no, toolbar=no,resizable=yes, scrollbars=yes");
}

function selectLayoutType(idx)
{
	var oDiv = new Array();
	var oDiv1 = _("div_basic");
	var oDiv2 = _("div_direct");
	var oDiv3 = _("div_anaconda");
	var oDiv4 = _("div_parent");

	oDiv.push(oDiv1);
	oDiv.push(oDiv2);
	oDiv.push(oDiv3);
	oDiv.push(oDiv4);
	
	for(var i = 0; i < oDiv.length ; i++)
	{
		if(i == idx)
		{
			 oDiv[i].style.display = 'block';
		}	
		else oDiv[i].style.display = 'none';
	} 
}

function doRuning(callerName)
{
showRunning(callerName);
	
}
function fnDelRow(object)
{
	var obj = _(object);
	if(obj != null)
	{
		var trList = obj.getElementsByTagName("tr");
		if(trList.length > 0)
		{
	        	var objTr = trList.item(trList.length-1);
			obj.removeChild(objTr);			
		}
	}
}
function fnAddRow(object)
{
	var obj = _(object);
	if(obj != null)
	{
		var tr = createElement("tr","","");
		var id = _rand();
		tr.setAttribute("id",id);
		var input1 = createElementWithStyle ("input","area_name","text" ,"styled" , "");
		//input1.setAttribute("class","styled");
		var input2 = createElementWithStyle ("input","area_path","text" ,"styled" , "");
		//input2.setAttribute("class","styled");
		var input3 = createElementWithStyle ("input","save","button" ,"button" , "");
		var input4 = createElementWithStyle ("input","save","button" ,"button" , "");
		input1.setAttribute("size","25");
		input2.setAttribute("size","40");
		input3.setAttribute("value","Save");

		input3.onclick= function() {
			if(input1.value == '')
			{
				alert("Enter a area name");
				return;
			}
			var isOK = confirm("Really save?");
			if(isOK)
			{
				with(frmDirectElement)
				{
					CMD.value = "CMD_SEQ_104913855441287801302856";
					GUBUN.value = "SE";
					viewKey.value ="<%=strForward%>";
					area_name.value = input1.value;
					area_path.value = input2.value;
					callAjaxByForm("saveElement", "frmDirectElement");
				}
			}
		}
		
		input4.setAttribute("value","Delete");
		input4.onclick= function() {
			
			if(input2.value == '')
			{
				alert("Really delete a current line? You have to enter a path");
				var objTable = _('tbl_direct');
				var objTr = _(id);
				objTable.removeChild(objTr);
				return;
			}			
			var isOK = confirm("Really delete?");
			if(isOK)
			{
				with(frmDirectElement)
				{
					CMD.value = "CMD_SEQ_104913855441287801302856";
					GUBUN.value = "RE";
					viewKey.value ="<%=strForward%>";
					area_name.value = input1.value;
					area_path.value = input2.value;
					callAjaxByForm("removeElement", "frmDirectElement");
				}
			}
		}

		var td1 = createElement("td","","");
		td1.appendChild(input1);
		var td2 = createElement("td","","");
		td2.appendChild(input2);
		var td3 = createElement("td","","");
		td3.appendChild(input3);
		td3.appendChild(input4);
		
		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		obj.appendChild(tr);
	}
}
function fnSearchBasicLayout(search_key)
{
	with(frmView)
	{
		var pos = getCurrentPosition();
		document.frmSearch.x.value = pos.x;
		document.frmSearch.y.value = pos.y;
		// document.frmSearch.key.value = search_key;
		// document.frmSearch.key.value = search_key.value;
		// alert(eval(search_key + '.value'))
		document.frmSearch.search.value = eval(search_key + '.value');
		document.frmSearch.CMD.value = "CMD_SEQ_104913855441287801302856";
		document.frmSearch.GUBUN.value = "searchBasicLayout";
		callAjaxByForm("fnSearchBasicLayout", "frmSearch");
	}
}

function fnSearchBasicLayoutInDirect(search_key)
{
	with(frm_direct)
	{
		var pos = getCurrentPosition();
		document.frmSearch.x.value = pos.x;
		document.frmSearch.y.value = pos.y;
		document.frmSearch.key.value = search_key;
		document.frmSearch.search.value = Layout.value;
		document.frmSearch.CMD.value = "CMD_SEQ_104913855441287801302856";
		document.frmSearch.GUBUN.value = "searchBasicLayout";
		callAjaxByForm("fnSearchBasicLayoutInDirect", "frmSearch");
	}
}


function doRun(callerName, REQ)
{
	if(callerName == 'saveElement')
	{
		alert("Applied successfully.");
		document.location.reload();
	}
	else if(callerName == 'removeElement')
	{
		alert("Deleted.");
		document.location.reload();
	}
	else if(callerName == 'fnSearchBasicLayout')
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
			var view = object.response[i];
			var li = createElement("li","","");
			var a = createElement("a","","");
			a.setAttribute("href","javascript:fnSetSearchLayoutData('"+view.VIEW_LAYOUT+"','"+view.VIEW_TOP+"','"+view.VIEW_LEFT+"','"+view.VIEW_BODY+"','"+view.VIEW_RIGHT+"','"+view.VIEW_FOOTER+"');");
			a.innerHTML = view['VIEW_BODY'] + '&nbsp;&nbsp;&nbsp;(' + view.VIEW_DESC + ')';
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
	else if(callerName == 'fnSearchBasicLayoutInDirect')
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
			var view = object.response[i];
			var li = createElement("li","","");
			var a = createElement("a","","");
			a.setAttribute("href","javascript:fnSetSearchLayoutDataInDirect('"+view.VIEW_LAYOUT+"');");
			a.innerHTML = view[object.request.key] + '&nbsp;&nbsp;&nbsp;(' + view.VIEW_DESC + ')';
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
	else
	{
		alert("Applied successfully.");
		document.location.reload();
	}
}

function fnSetSearchLayoutData(layout,t,l,b,r,f)
{
	with(frmView)
	{
		Layout.value = layout;
		Top.value = t;
		// Body.value = b;
		Right.value = r;
		Left.value = l;
		Footer.value = f;
	}
	fnShowOrHide("div_search_layout");
}

function fnSetSearchLayoutDataInDirect(layout)
{
	with(frm_direct)
	{
		Layout.value = layout;
	}
	fnShowOrHide("div_search_layout");
}


function fnSaveDirectElement(v1,v2)
{
        alert('sorry, this function can not be use any more...');
       return;
	with(frmDirectElement)
	{
		CMD.value = "CMD_SEQ_104913855441287801302856";
		GUBUN.value = "SE";
		viewKey.value ="<%=strForward%>";
		area_name.value = v1;
		area_path.value = v2;
		callAjaxByForm("saveElement", "frmDirectElement");
	}
}

function fnRemoveDirectElement(v1,v2)
{
	with(frmDirectElement)
	{
		CMD.value = "CMD_SEQ_104913855441287801302856";
		GUBUN.value = "RE";
		viewKey.value ="<%=strForward%>";
		area_name.value = v1;
		area_path.value = v2;
		callAjaxByForm("removeElement", "frmDirectElement");
	}
}

function fnSaveAnacondaLayout()
{
	with(frm_anaconda)
	{
		CMD.value = "CMD_SEQ_104913855441287801302856";
		GUBUN.value = "saveAnacondaLayout";
		viewKey.value ="<%=strForward%>";
		callAjaxByForm("saveAnacondaLayout", "frm_anaconda");
	}
}


function fnSaveHydraLayout()
{
	with(frm_parent)
	{
		CMD.value = "CMD_SEQ_104913855441287801302856";
		GUBUN.value = "saveHydraLayout";
		viewKey.value ="<%=strForward%>";
		callAjaxByForm("saveAnacondaLayout", "frm_parent");
	}
}
</script>

<script language="javascript">
setSelectBox('LayoutTypeObject', '<%=strLayoutType%>');
</script>
<%
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
