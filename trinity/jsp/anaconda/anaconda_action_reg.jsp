<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.util.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
	try
	{
		
	String strActColName	= request.getParameter("ActColName") == null ? "" : request.getParameter("ActColName").trim();
	String strCode			= "";
	String strButtonName    = "Save";
	String strKorName = "";
	String strContext = "";
	String strLayout = "";
	if (strActColName.equals("") || strActColName == null)
	{
		strCode = "ins";
	} else {
		strCode = "upd";
		strButtonName = "Modify";
	}
	WebActionCollection webActionCollection = null;
	WebAction action = null;
	
	WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();		
	webActionCollection = xmlResource.getWebActionCollection(strActColName);		
	if(webActionCollection != null)
	{
		strKorName = webActionCollection.getWEBACTION_KOR_NAME();
		strContext = webActionCollection.getWEB_CONTEXT();
		strLayout = webActionCollection.getLAYOUT_NAME();
	}
	
	RequestHelper helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
	DefaultAuth auth = (DefaultAuth)helper.getSessionObject();
	String strSessionValue = "";
	if(auth != null)
	{
		strSessionValue = auth.getAuthItem(("MEMBER_NAME"));	
	}
	
%>

<script language="javascript">
var fNum = 1; 
function AddFamily(str)
{		
	for( var i=0; i < str; i++ )
	{
    	if( fNum > 100 )
    	{ //10개까지 추가허용.
    		alert("You can not add any more.");
    		return;
   		} else {
		    //웹브라우져에 따른 설정.
		    //익스플로어일때,
    		if(document.getElementById)
    		{
     			var Tbl = document.getElementById('AddChild');
    		} else {
     			var Tbl = document.all['AddChild'];
    		}
    
		    //첫번째row
			var tRow1 = createElement("TR","","");
			Tbl.appendChild(tRow1);
			var skey = _rand();
		    tRow1.setAttribute("id","AddChild_Tr_New_" + skey);
			var tCell1 = createElement("TD","","");
			var tCell2 = createElement("TD","","");
			var tCell3 = createElement("TD","","");
			tRow1.appendChild(tCell1);
			tRow1.appendChild(tCell2);
			tRow1.appendChild(tCell3);
		        
		    tCell1.bgColor = "#F6FCFF";
		    tCell1.align = "center";
		    tCell1.width = "30%";
		    tCell1.innerHTML = 
		     "    <input name='ActKorName' size='50' type='text' class='styled' >";
		     
		    tCell2.bgColor = "#F6FCFF";
		    tCell2.align = "center";
		    tCell2.innerHTML = 
		     "    <input name='ActDesc' size='70' type='text' class='styled' >";
		     
		    tCell3.bgColor = "#F6FCFF";
		    tCell3.align = "center";
		    tCell3.width = "15%";
		    
		    tCell3.innerHTML = "<button name='delete' type='button' class='btn btn-danger' onClick='javascript:delRow(\"AddChild_Tr_New_" + skey + "\")' value='Delete'>Delete</button>";
			    
		     var ele = createElement("INPUT","ActName","hidden");
		     tRow1.appendChild(ele);
		    fNum++;
   		}//end else 
	}//end for
}
function createElement (tagName, name, type)
{
	  var newEle;
	  try {
	    if (type) newEle = document.createElement("<" + tagName + " name='" + name + "' type='" + type + "'>");
	    else newEle = document.createElement("<" + tagName + " name='" + name + "'>");
	  } 
	  catch (e) {
	    newEle = document.createElement("" + tagName + "");
	    newEle.setAttribute("name", name);
	    if (type) newEle.setAttribute("type", type);
	  }
	  return newEle;
}

function chkForm(frm)
{		
	var bAnswer = confirm("Really save?");
	
	if (bAnswer == true) 
	{
		if (document.frm.ActColKorName.value == "")
		{
			alert("input a name!!!.");		
			document.frm.ActColKorName.focus();	
			return;
		}

		if(document.frm.ActKorName == null)
		{
			alert("Please add a action!!!.");		
			return;
		}	
		frm.submit();
	} 
	else 
	{
		alert("Cancelled");
		return;
	}
}
function copyWebActionCollection()
{		
	var bAnswer = confirm("Really copy?");
	with(frm)
	{
		if (bAnswer == true) 
		{
			if (document.frm.ActColKorName.value == "")
			{
				alert("Please input a name!!!.");		
				document.frm.ActColKorName.focus();	
				return false;
			}		
			code.value="ccopy";
			AnacondaSubmit(document.frm);
			return true;
		} else {
			alert("Cancelled");
			return false;
		}
	}
}

function fnAllChangeUser()
{
	if(!confirm("If you change the owner, Your current login id will be used")) return;
	with(frm)
	{
		// var change_user = owner.value;
		code.value = "change_user";
		AnacondaSubmit(document.frm);
	}
}

function fnSearchLayout()
{
	var args = frm.Layout.value;
	window.open("/Anaconda.do?CMD=CMD_SEQ_107571796881288935101238&title=Layout&Object=opener.frm.Layout&search=" + args,"","height=450,width=800,left=200,top=20,status=no, location=no, toolbar=no,resizable=yes, scrollbars=yes");
}
function showAction(div_object)
{
	var obj = _(div_object);
	if(obj.style.display == 'none') obj.style.display = 'block';
	else  obj.style.display = 'none';
}
</script>

<form name="frm" method="post" action="/Anaconda.do?CMD=CMD_SEQ_101546663451287795733194" accept-charset="utf-8">
<input type="hidden" name="code" value="<%=strCode%>">

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Create or Modify Action Group</h3>
					<span class="fr"><button type="button" class="btn btn-secondary" name="Register" value="Copy" onClick="javascript:copyWebActionCollection();">Copy</button></span>
					<% if (strCode.equals("upd")) { %>
					<span class="fr"><button type="button"  id="actionGroupShow1" class="btn btn-primary" name="Register1" value="<%=strButtonName%>" onClick="chkForm(this.form);"><%=strButtonName%></button></span>
					<%}else {%>
					<span class="fr"><button type="button"  id="actionGroupShow2" class="btn btn-info" name="Register2" value="<%=strButtonName%>" onClick="chkForm(this.form);"><%=strButtonName%></button></span>
					<%}%>
					<span class="fr"><button type="button"  id="actionGroupShow3" class="btn btn-secondary" name="Register3" value="Back" onClick="history.back();">Back</button></span>
			</div>
		</div>
	</div>
</div>

<table class="table_hydra" cellspacing="0" cellpadding="0">
		<colgroup>
		<col width="30%">
		<col>
		</colgroup>
		<tbody>
		  <tr>
			<td class="left">&nbsp;Action group name&nbsp;&nbsp;</td>
			<td><input type="hidden" name="ActColName" value="<%=strActColName %>"></input>
			<input type="text" class="styled" name="ActColKorName" size="40" value="<%=strKorName %>"></input> &nbsp;(<%=strActColName%>)</td>
		  </tr>
		  <tr>
			<td class="left">&nbsp;Action group (Context)&nbsp;&nbsp;</td>
			<td><input type="text"  class="styled" name="Context" size="40" value="<%=strContext %>"></input></td>
		  </tr>
		  <tr>
			<td class="left">&nbsp;Layout&nbsp;&nbsp;</td>
			<td><input type="text" name="Layout"  class="styled" size="40" value="<%=strLayout %>"></input>&nbsp;&nbsp;<a href="javascript:fnSearchLayout();" style="color:blue;"><img src="/jsp/anaconda/img/search_result.png" width="10px" height="10px" border="0" align="absmiddle"></img>Search</a></td>
		  </tr>
		  <tr>
			<td class="left">&nbsp;Change owner&nbsp;&nbsp;</td>
			<td><input type="text" name="owner"  class="styled" size="20" value="<%=strSessionValue %>"></input>&nbsp;&nbsp;<button type="button" class="btn btn-primary" value="Change all" onClick="javascript:fnAllChangeUser();">Change all</button></td>
		  </tr>
		</table>


		<table class="table_hydra" cellspacing="1" cellpadding="1">
		<colgroup>
		<col>
		<col>
		<col width="80px">
		</colgroup>
		<thead>
		<tr>
		<th scope="col">Action name</th>
		<th scope="col">Action description</th>
		<th scope="col"><a href='javascript:AddFamily(1)'><img src="/jsp/anaconda/img/plus.png" width="10px" height="10px" border="0" absmiddle></img>Add</a></th>
		</tr>
		</thead>
		<tbody id="AddChild">
 <%	
 	if(strCode.equals("upd")) 
	{
		Iterator iterator = webActionCollection.iterator();
		    
	    for(int i=0;iterator.hasNext();i++)
	    {
			action = (WebAction)iterator.next();				

                        String ajax_tag = "<span style='color:blue'>PAGE</span>";
                        if("".equals(action.getFORWARD()) || "NONE".equals(action.getFORWARD())){
                               ajax_tag = "<span style='color:red'>AJAX</span>";
                        }

			out.println("<tr align=\"center\" id='AddChild_Td_"+i+"'>");						
			out.println("<td width=\"30%\" bgcolor=\"#F6FCFF\">["+ajax_tag+"]<input name='ActKorName' size='50' type='text' class='styled'  value='"+action.getKOR_NAME()+"'><input name='ActName' type='hidden' value='"+action.getNAME()+"'></td>");
			out.println("<td bgcolor=\"#F6FCFF\"><input name='ActDesc' size='60' type='text' class='styled'  value='"+action.getDESC()+"'></td>");
			out.println("<td width=\"15%\" bgcolor=\"#F6FCFF\"><input type='hidden' /><button name='delete' type='button' class='btn btn-danger' onClick='javascript:delRow(\"AddChild_Td_"+i+"\")' value='Delete' >Delete</button><input type='hidden' /></td>");
			out.println("</tr>");
		}	
	}
%>
		
 	    </tbody>
</table>
 </form>
 
 
 <br>
<script> 
//클릭한 행 삭제하기
function delRow(idx)
{
	var objTable = _('AddChild');
	var objTr = _(idx);
	objTable.removeChild(objTr);
}

function getObj()
{
    var obj = event.srcElement
    while (obj.tagName !='TD') //TD가 나올때까지의 Object추출
    {
        obj = obj.parentElement
    }
    return obj
}
</script> 
<p></p>
<%
 	} catch (Exception e) {
		e.printStackTrace();
	}
%>
