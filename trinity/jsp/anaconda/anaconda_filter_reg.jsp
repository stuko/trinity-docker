<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.*"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.filter.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>

<%
	try
	{			
		String strActColName	= request.getParameter("ActColName") == null ? "" : request.getParameter("ActColName").trim();
		String strCode			= "";
		
		if (strActColName.equals("") || strActColName == null)
		{
			strCode = "ins";
		} else {
			strCode = "upd";
		}
		
		WebActionFilterCollection webActionFilterCollection = null;
		WebActionFilter webFilter = null;
				
		WebActionFilterXmlResource xmlResource = WebActionFilterXmlResource.getInstance();	
		webActionFilterCollection = xmlResource.getWebActionFilterCollection(strActColName);
%>

<script language="javascript">
function fnDeleteOneFilter(args)
{
	var bAnswer = confirm("Really delete?");
	
	if (bAnswer == true) 
	{
		var action = null;
		if(action == null || action == '')action = 'CMD_SEQ_10602546895128826069607';
		var ac = new ajaxInteraction(action, "/Anaconda.do?CMD=CMD_SEQ_106025468951288260696078&code=delOneFilter&ActColName="+args, '');
		ac.doPost();
	} else {
		alert("Cancelled");
		return;
	}
}
function doRun(callerName, REQ)
{
	if(callerName == 'CMD_SEQ_10602546895128826069607')
	{
		alert('Applied successfully.');
	}
}

function doRuning(callerName)
{
showRunning(callerName);
	if(callerName == 'CMD_SEQ_10602546895128826069607')
	{
		//alert('정상적으로 삭제 되었습니다.');
	}
}

var fNum = 1; 
function AddFamily(str,RowNum)
{		
	for( var i=0; i < str; i++ )
	{
		if(document.getElementById)
		{
 			var Tbl = document.getElementById('AddChild');
		} else {
 			var Tbl = document.all['AddChild'];
		}    
	    //첫번째row
	    var tRow1 = Tbl.insertRow(RowNum);
	    var skey = _rand();
	    tRow1.setAttribute("id","AddChild_Tr_New_" + skey);
	    var tCell1 = tRow1.insertCell();
	    var tCell2 = tRow1.insertCell();
	    var tCell3 = tRow1.insertCell();
	    var tCell4 = tRow1.insertCell();
	    var tCell5 = tRow1.insertCell();
	    var tCell6 = tRow1.insertCell();
	    var tCell7 = tRow1.insertCell();
	        
	    tCell1.bgColor = "#F6FCFF";
	    tCell1.align = "center";
	    tCell1.innerHTML = 
	     "    <input name='ActFilterKorName' type='text' class='styled'  size='12'>";
	     
	    tCell2.bgColor = "#F6FCFF";
	    tCell2.align = "center";
	    tCell2.innerHTML = 
	     "    <input name='ActFilterForward' type='text' class='styled'  size='30'>";
	     
	    tCell3.bgColor = "#F6FCFF";
	    tCell3.align = "center";
	    tCell3.innerHTML = 
	     "    <input name='ActFilterPattern' type='text' class='styled'  size='30'>";
	     
	    tCell4.bgColor = "#F6FCFF";
	    tCell4.align = "center";
	    tCell4.innerHTML = 
	     "    <select name='ActFilterType'><option value='FILTER_URL'>URL</option><option value='FILTER_PARAMETER'>Request</option></select>";
	     
	    tCell5.bgColor = "#F6FCFF";
	    tCell5.align = "center";
	    tCell5.innerHTML = 
	     "    <input name='ActFilterFrom' type='text' class='styled'  onClick='javascript:getDateTime();' maxlength='14' size='6'>";
	     
	    tCell6.bgColor = "#F6FCFF";
	    tCell6.align = "center";
	    tCell6.innerHTML = 
	     "    <input name='ActFilterTo' type='text' class='styled'  onClick='javascript:getDateTime();' maxlength='14' size='6'>";
	     
	    tCell7.bgColor = "#F6FCFF";
	    tCell7.align = "center";
	    tCell7.innerHTML = "    <button name='delete' type='button' class='btn btn-danger' onClick='javascript:delRow(\"AddChild_Tr_New_" + skey + "\")' value='Delete'>Delete</button><input name='ActName' type='hidden'>&nbsp;<buttn name='delete' type='button' class='btn btn-primary' onClick='javascript:AddMore()' value='Add'>Add</button>";

	}//end for
}


function getDateTime()
{
	alert("Date format : '20080101121212'");
}

function AddMore()
{		
	var idx = getObj().parentElement.rowIndex;	
	AddFamily(1,idx);
}

function chkForm(frm)
{	
	var bAnswer = confirm("Really create?")
	
	if (bAnswer == true) 
	{
		if (document.frm.ActColKorName.value == "")
		{
			alert("Please input 'Subject Name'");		
			document.frm.ActColKorName.focus();	
			return false;
		}else{
                   ajaxConda('frm','CMD_SEQ_106025468951288260696078',false);
                   return true;
                }		
		
		
	} else {
		alert("Cancelled");
		return false;
	}
}

</script>

<form name="frm" method="post" action="/Anaconda.do?CMD=CMD_SEQ_106025468951288260696078">
<input type="hidden" name="code" value="<%=strCode%>">

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Create filter</h3>	
			<span class="fr"><button type="button" class="btn btn-primary" name="Register" value="Create filter" onClick="return chkForm(this.form);">Create a filter</button></span>
			<span class="fr"><button type="button" class="btn btn-secondary" name="Register" value="Back" onClick="javascript:history.back();">Back</button></span>
			</div>
		</div>
	</div>
</div>
<div style="padding:10px;">
	<ul>
		<%
		if (strCode.equals("upd"))
		{
		%>
		<li> Filter name: &nbsp;&nbsp;&nbsp;<b><%=webActionFilterCollection.getFILTERCOLLECTION_KOR_NAME() %></b>
		<%
			out.println("<input type=\"hidden\" name=\"ActColKorName\" value=\""+webActionFilterCollection.getFILTERCOLLECTION_KOR_NAME()+"\">");
			out.println("<input type=\"hidden\" name=\"ActColName\" value=\""+strActColName+"\">");
		} else {
			out.println("<li> Filter group name : &nbsp;&nbsp;&nbsp;<b><input name=\"ActColKorName\" type=\"text\"  class=\"styled\" size=\"55\"></b>");	
		}
		%>
		</li>
	</ul>
</div>
		<table class="table_hydra" cellspacing="0" cellpadding="0">
		<colgroup>
		<col width="10%">
		<col width="15%">
		<col width="10%">
		<col width="10%">
		<col width="20%">
		<col>
		<col>
		</colgroup>
		<thead >
		<tr>
		<th scope="col">Filter name</th>
		<th scope="col">URL</th>
		<th scope="col">Filter pattern</th>
		<th scope="col">Filter type</th>
		<th scope="col">from</th>
		<th scope="col">to</th>
		<th scope="col"><a href='javascript:AddFamily(1,0)'><img src="/jsp/anaconda/img/plus.png" width="10px" height="10px" border="0" absmiddle></img>Add</a></th>
		</tr>
		</thead>
		<tbody id="AddChild">
<%	
		if(strCode.equals("upd") && webActionFilterCollection != null)
		{
			Iterator iterator = webActionFilterCollection.iterator();
			    
		    for(int i = 0;iterator.hasNext();i++)
		    {
				webFilter = (WebActionFilter)iterator.next();				
				out.println("<tr  id='"+webFilter.getFilter_name()+"' align=\"center\">");						
				out.println("<td ><input name='ActFilterKorName' type='text' class='styled'  size='12' value='"+webFilter.getFileter_kor_name()+"'><input name='ActName' type='hidden' value='"+webFilter.getFilter_name()+"'></td>");
				out.println("<td ><input name='ActFilterForward' type='text' class='styled'  size='30' value='"+webFilter.getFilter_forward()+"'></td>");
				out.println("<td ><input name='ActFilterPattern' type='text' class='styled'  size='30' value='"+webFilter.getUrlpattern()+"'></td>");
%>
<td >
				<select name="ActFilterType">
					<option value="FILTER_URL" <%=webFilter.getFilter_type().equals("FILTER_URL") ? "selected" : "" %>>URL</option>
					<option value="FILTER_PARAMETER" <%=webFilter.getFilter_type().equals("FILTER_PARAMETER") ? "selected" : "" %>>Request</option>
				</select>
</td>
<%
				// out.println("<td ><input name='ActFilterType' type='text' class='styled'  size='10' value='"+webFilter.getFilter_type()+"'></td>");
				out.println("<td ><input name='ActFilterFrom' type='text' class='styled'  size='6' value='"+webFilter.getFrom_yyyymmddhhmmssSSS()+"'></td>");
				out.println("<td ><input name='ActFilterTo' type='text' class='styled'  size='6' value='"+webFilter.getTo_yyyymmddhhmmssSSS()+"'></td>");			
				out.println("<td ><button name='delete' type='button' class='btn btn-danger' onClick='javascript:delRow(\""+webFilter.getFilter_name()+"\")' value='Delete'>Delete</button>&nbsp;<button name='delete' type='button' class='btn btn-primary' onClick='javascript:AddMore()' value='Add'>Add</button></td>");
				out.println("</tr>");
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
		    </tbody>	  
		  </table>
</form>

<script> 
//클릭한 행 삭제하기
function delRow(filterName)
{
	if( confirm("Really delete a line?"))
	{
		if(filterName.indexOf('AddChild_Tr_New_') < 0)
		{
			fnDeleteOneFilter(filterName);
		}

		var objTable = _('AddChild');
		var objTr = _(filterName);
		objTable.removeChild(objTr);

	}
}

function getObj()
{
    var obj = event.srcElement;
    while (obj.tagName !='TD') //TD가 나올때까지의 Object추출
    {
        obj = obj.parentElement;
    }
    return obj;
}
</script>
