<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%
String kind = request.getParameter("kind");
%>

<style> 

.div_keyword_true
{
	background:#FFFFCC; 
	font:none 12px dotum,Arial,Sanserif;
	color:#333333;
	margin:2px 0 2px 0;
	padding:6px 6px 6px 6px;border: 1px double #CCCCCC;
}

.div_keyword_false
{
	background:#FFFFCC; 
	font:none 12px dotum,Arial,Sanserif;
	color:#333333;
	margin:2px 0 2px 0;
	padding:6px 6px 6px 6px;border: 1px double #CCCCCC;
}

.div_keyword_home 
{
	background:#CCFFFF; 
	font:none 12px dotum,Arial,Sanserif;
	color:#333333;
	margin:2px 0 2px 0;
	padding:6px 6px 6px 6px;border: 1px double #CCCCCC;
}

.table_keyword
{
	border:0px;
	margin:0px 0px 0px 0px;
}
.td_keyword
{
	border:0px;
	margin:0px 0px 0px 0px;
	width:18px;
	font-size:12px;
}
.td_keyword2
{
	border:0px;
	margin:0px 0px 0px 0px;
	font-size:12px;
}
.td_keyword_img
{
	border:0px;
	margin:0px 0px 0px 0px;
	width:18px;
	background:url(/jsp/bestmember/img/tree-branch.gif) repeat-y;
}
.a_keyword
{
	text-decoration:none;
}
</style>


<script language="javascript">

function fnSet(s,n,r){
	with(frmRuleSchedule){
		seq.value= s;
		schedule_name.value = n;
		var rc = document.getElementById(r);
		schedule_contents.value = TextToHtml((rc.innerHTML).trim());
	}
}

function reset(s,n,r){
	with(frmRuleSchedule){
		seq.value= '';
		schedule_name.value = '';
		schedule_contents.value = '';
	}
}

function fnSaveRuleSchedule(){
	with(frmRuleSchedule){
		if(schedule_name.value == '') {
			alert("Please enter a function name");
			return;
		}
		if(schedule_contents.value == '') {
			alert("Please enter a function name");
			return;
		}
		if(seq.value == '') {
			CMD.value = "CMD_SEQ_109156229581500559337975";
		}else{
			CMD.value = "CMD_SEQ_104698375281500559341512";
		}
		callAjaxByForm('fnSaveRuleSchedule',"frmRuleSchedule");	
	}
}
function deleteRuleSchedule(s){
	with(frmRuleSchedule){
		seq.value = s;
		CMD.value = "CMD_SEQ_104938072521500559346292";
		callAjaxByForm('deleteRuleSchedule',"frmRuleSchedule");	
	}
}
function doRun(callerName , REQ)
{
		alert("Reflected normally.");
		var t = Math.floor(Math.random()*1000);
		window.location.href = window.location.href + '&rn=' + t;
}
</script>




 <div class="container-fluid">

<h3 class="page-header"><img src="/jsp/sp/img/schedule.png" width="40px">&nbsp; Rule Schedule Management </h3>
<p>The rule schedule information below executes target information obtained through 'rule schedule SQL' at intervals of a certain time (about 2 hours).</p>
<div id="div_save_function" style="width:1000px;position:absolute;display:block;background-color:white;border: 2px double #CCCCCC;padding: 10px 10px 10px 10px;z-index:200;">
	<form name="frmRuleSchedule" method="post" action="/Anaconda.do">
		<input type="hidden" name="CMD" value=""></input>
		<input type="hidden" name="seq" value=""></input>
		<input type="hidden" name="kind" value="<%=kind%>"></input>
		<input type="hidden" name="x" value=""></input>
		<input type="hidden" name="y" value=""></input>
		<table class="table" border="0" cellpadding="5px" cellspacing="5px" width="100%">
			<colgroup>
				<col width="200px"></col>
				<col></col>
			</colgroup>
			<tbody>
				<tr>
					<td>Rule Schedule Name</td>
					<td><input type="text" name="schedule_name" class="styled" size="100" ></input></td>
				</tr>
				<tr>
					<td>Rule Schedule SQL</td>
					<td><textarea class="form-control" rows="5" name="schedule_contents"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="button" class="btn btn-primary" style="font: bold 13px 돋움체;margin-left: 5px;margin-top: 5px;" value=" 룰 스케줄 저장 " onClick="fnSaveRuleSchedule();"></input>
					<input type="button" class="btn btn-primary" style="font: bold 13px 돋움체;margin-left: 5px;margin-top: 5px;" value=" 초기화 " onClick="reset();"></input>
					</td>
				</tr>
			</tbody>
		</table>
	</form>

	<br>
	<br>

	 <div class="card-block">
                    <div class="table-responsive">
                        <table class="table table-bordered" width="100%" id="dataTable" cellspacing="0">
                            <thead>
                                <tr>
                                    	<th>No</th>
										<th>Rule schedule name</th>
										<th>Rule schedule SQL</th>
										<th>Delete</th>
								</tr>
                            </thead>
                            <tfoot>
                                <tr>
                                  <th>No</th>
										<th>Rule schedule name</th>
										<th>Rule schedule SQL</th>
										<th>Delete</th>
                                </tr>
                            </tfoot>
	<tbody>
	<%
  // /Anaconda.do?CMD=CMD_SEQ_102845955711497757688090&rule_group=BUSINESS&kind=PATTERN&pattern_group=BUSINESS&page=0
BusinessCollection bc = RequestHelper. getBusinessCollection(request,"RuleScheduleList");
for(int i = 0; i < bc.size(); i++){
	%>
	<tr>
		<td><%=bc.getBusinessData(i).getFieldValue("seq")%></td>
		<td><a href="javascript:fnSet('<%=bc.getBusinessData(i).getFieldValue("seq")%>','<%=bc.getBusinessData(i).getFieldValue("scheduled_name")%>','r-<%=i%>')">
		<%=bc.getBusinessData(i).getFieldValue("scheduled_name")%></a></td>
		<td><div id='r-<%=i%>'>
		<%=bc.getBusinessData(i).getFieldValue("scheduled_contents")%></div></td>
		<td><input type="button" class="btn btn-danger" style="font: bold 13px 돋움체;margin-left: 5px;margin-top: 5px;" value="삭제" onClick="javascript:deleteRuleSchedule('<%=bc.getBusinessData(i).getFieldValue("seq")%>');"></input></td>
	</tr>
   <%
}
   %>
   </tbody>
	</table>

</div>
</div>
