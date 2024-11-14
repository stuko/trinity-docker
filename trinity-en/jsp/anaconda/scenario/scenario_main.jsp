<%@ page contentType="text/xml; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%

%>
<script language="javascript">

function checkScenario(title){
  if(!confirm('Really request?')){
    return;
  }
  if(frmSCENARIO.scenario_title.value == '' || frmSCENARIO.scenario_object.value == ''){
    alert("Please input requirement's title or select requirements");
    return;
  }
  var d = {scenario_title : title};
  var cmd = "CMD_SEQ_105767097611580169030294";
  $.ajax({
    url: "/Anaconda.do?CMD=CMD_SEQ_105767097611580169030294",
    data: d,
    type: "GET",
    dataType: "json",
    success : function (data) {
      if(data.searchResult && data.searchResult.result && "true" == data.searchResult.result){
        requestSCENARIO();
      }else{
        showCanNotRequestScenario();
      }
    },error: function (err) {
      showCanNotRequestScenario(); 
    }
  });

}

function showCanNotRequestScenario(){
   alert("You're request scenarion has a error or Already request scenarion, therefore YOU MUST CREATE ANOTHER NAME OF SCENARIO");
}

function requestSCENARIO()
{
        if(!confirm('Really request?')){
           return;
        }
	with(frmSCENARIO)
	{
		if(scenario_title.value == '' || scenario_object.value == '')
		{
			alert("Please input requirement's title or select requirements");
			return;
		}
		code.value = "request";
		callAjaxByForm("request", "frmSCENARIO");
	}
}

function requestAnalysis()
{
	if(confirm("Really create analysis entity model?"))
	{
		with(frmSCENARIO)
		{	
			if(scenario_title.value == '' || scenario_object.value == '')
			{
				alert("Please input requirement's title or select requirements");
				return;
			}
			code.value = "analysis";
			callAjaxByForm("analysis", "frmSCENARIO");
		}
	}
}
function resetSCENARIO(){
  with(frmSCENARIO){
    scenario_title.value = '';
    scenario_object.value = '';
    scenario_key.value = '';
  }
}

function saveSCENARIO()
{
        if(!confirm('Really save?')){
           return;
        }
	with(frmSCENARIO)
	{
		if(scenario_title.value == '' || scenario_object.value == '')
		{
			alert("Please input requirement's title");
			return;
		}
		code.value = "create";
		callAjaxByForm("create", "frmSCENARIO");
	}
}
function updateSCENARIO()
{
        if(!confirm('Really modify?')){
           return;
        }
	with(frmSCENARIO)
	{
		if(scenario_title.value == '' || scenario_object.value == '')
		{
			alert("Please input requirement's title");
			return;
		}
                
		code.value = "update";
		callAjaxByForm("update", "frmSCENARIO");
	}
}
function removeSCENARIO()
{
        if(!confirm('Really delete?')){
           return;
        }
	with(frmSCENARIO)
	{
		code.value = "remove";
		callAjaxByForm("remove", "frmSCENARIO");
	}
}
function setData(nodename, korname, desc)
{
	with(frmSCENARIO)
	{
		scenario_key.value = nodename;
		scenario_title.value = korname;
		var v = _(desc);
        var data = v.innerHTML;
        data = data.replace(/&#47;/g,"/").replace(/&gt;/g,">").replace(/&lt;/g,"<").replace(/&quot;/g,"\"").replace(/<BR>/g,"\r\n").replace(/&#39;/g,"\'").replace(/&amp;/g,"&");
		// alert(data);
		scenario_object.value = data;
	}
}
function doRuning(action)
{
}

function doRun(action,REQ){
	if(action == "create"){
		talert("Applied successfully");
	}
	else if(action == "request"){
		talert("Accepted successfully");
	}else if(action == "update"){
                talert("Accepted successfully");
        }
        document.location.reload();
}

</script>
<form name="frmSCENARIO" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_104564816571304664310201"></input>
<input id="scenario_key" type="hidden" name="scenario_key"></input>
<input type="hidden" name="code"></input>

<div>
 <div class="content-module-heading cf">
  <h3 class="fl">
  Requirement Management
  </h3>	
  <span class="fr">
   <button type="button" class="btn btn-warning" value="Reset" onClick="javascript:resetSCENARIO()">Reset</button>&nbsp;
   <button type="button" class="btn btn-primary" value="Create requirements" onClick="javascript:saveSCENARIO()">Create requirements</button>&nbsp;
   <button type="button" class="btn btn-secondary" value="Modify requirements" onClick="javascript:updateSCENARIO()">Modify requirements</button>&nbsp;
   <button type="button" class="btn btn-info" value="Delete requirements" onClick="javascript:removeSCENARIO()">Delete requirements</button>&nbsp;
   <button type="button" class="btn btn-warning" value="Generate requirement to Action" onClick="javascript:checkScenario();">Generate requirements to Action</button>&nbsp;
   <!--input type="button" class="btn btn-secondary" value="Generate requirement to Analysis entity model" onClick="javascript:requestAnalysis()"></input-->

  </span>
 </div>
</div>


<script>
$(document).ready(function() {
    $("#btn_script_code").button().on("click", function(event) {
        $('#script_code').toggle();

    $(this).text(function(i, text){
          return text === "View Sample" ? "Hide Sample" : "View Sample";
      })
   });
});
</script>
<span class="float-xs-right"><button type="button" id="btn_script_code" class="btn btn-primary">View Sample</button></span>

<div id="DIV_SCENARIO" style="display:block">
 <div id="script_code" class="card mb-3" style="padding-bottom:80px;display:none;margin-bottom:40px;">
<pre style="background:white">
=========================================================
1. Category 
  a. sub category		
    - feature or page
    - feature or page
    - feature or page
  b. sub category		
    - feature or page
    - feature or page
    - feature or page
=========================================================
</pre>
</div>

<p style="margin-top:10px;;color:blue;size:12px;font-family:돋움;font-weight:bold;"> * Requirements list</p>

<table class="table-neo">
 <tr><td>
<%
BizTreeXmlResource btxr = BizTreeXmlResource.getInstance();
Iterator it = btxr.getBusinessTree();
int iCount = btxr.size();
int divide = iCount / 5;
int modCount = iCount % 5;
for(int i = 0;it.hasNext();i++)
{
	BusinessTree bt = (BusinessTree)it.next();
	String img_name = "file";
%>
        <div style="float:left;margin:10px;">
	<a id="href_<%=bt.getNodeName()%>" 
	href="javascript:fnNull();" 
	onClick="javascript:setData('<%=bt.getNodeName() %>','<%=bt.getKorName() %>','div_<%=bt.getNodeName() %>');">
	<img src="/jsp/anaconda/img/<%=img_name%>.png" border="0" width="30px" ></img>
	<br></br>
	<%=bt.getBusinessData().getFieldValue("regdate")%>&nbsp;&nbsp;<br/><%=bt.getKorName()%>
        </a></br>
	<div id='div_<%=bt.getNodeName() %>' style="display:none"><%=BusinessHelper.revert(bt.getDesc())%></div>
	</div>
<%
}
%>
</td></tr>
</table>
<div>
	
		<table class="table_hydra">
		<colgroup>
		<col width="30%">
		<col width="70%">
		</colgroup>
		<thead >
		<tr>
		<th scope="col">Requirements title</th>
		<th scope="col">Scenario</th>
		</tr>
		</thead>
		<tbody id="tBodySCENARIO">
		</tbody>
		<tr>
		<td><INPUT type="text" name="scenario_title" class="styled" size="50"></input> </td>
		<td>&nbsp;&nbsp;&nbsp;<textarea name="scenario_object" cols="95" rows="30" wordWrap="true" class="styled code">
1. Category 
  a. sub category		
    - feature or page
    - feature or page
    - feature or page
  b. sub category		
    - feature or page
    - feature or page
    - feature or page
</textarea></td>
		</tr>
		</table>
</div>
</div>

</form>

<script language="javascript">
</script>
