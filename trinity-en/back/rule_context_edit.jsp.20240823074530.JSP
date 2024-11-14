<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%
// String rule_group = request.getParameter("rule_group");
String kind = request.getParameter("kind");
String kind_ctnt = "대화 실행";
if(!"MSG".equals(kind)) kind_ctnt = "대화 완료";
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

 <div class="container-fluid">
	<h3 class="page-header"><img src="/jsp/sp/img/context.png" width="40px">&nbsp; Intent Management</h3>
	<div class="row">
		<div class="col-lg-12">

<div id="div_save_rule_context" >
	<form name="frmRuleContext" method="post" action="/Anaconda.do">
		<input type="hidden" name="CMD" value=""></input>
		<input type="hidden" name="seq" value=""></input>
		<input type="hidden" name="x" value=""></input>
		<input type="hidden" name="y" value=""></input>
                <input type="hidden" name="rule_group" value=""></input>
		<div class="table-responsive">
                        <table class="table" width="100%" id="dataTable">
			<colgroup>
				<col width="200px"></col>
				<col></col>
			</colgroup>
			<tbody>
				<tr>
					<td>의도 이름</td>
					<td><input type="text" id="context_name" name="context_name" class="styled" size="100" ></input></td>
				</tr>
				<tr>
					<td>의도 룰</td>
					<td><input type="text" name="rule" id="rule" class="styled" size="100" ></input></td>
				</tr>

				<tr style="display:none;">
					<td>유형</td>
					<td><select name="kind">
						<option value="MSG" <% if(kind.equals("MSG"))out.print("selected");%>>Message</option>
						<option value="STORE" <% if(kind.equals("STORE"))out.print("selected");%>>Save</option>
<!--
						<option value="ALARM" <% if(kind.equals("ALARM"))out.print("selected");%>>Alarm</option>
						<option value="SCHEDULE" <% if(kind.equals("SCHEDULE"))out.print("selected");%>>Schedule</option>
						<option value="DECIDE" <% if(kind.equals("DECIDE"))out.print("selected");%>>Decision</option>
-->
						</select></td>
				</tr>
				<!--tr>
					<td>룰 그룹</td>
					<td><input type="text" name="rule_group" class="styled" size="100" ></input></td>
				</tr-->
				<tr>
					<td colspan="2">
					<h5><input type="button" class="btn btn-lg btn-success" value="의도정보 저장" onClick="javascript:saveRuleContext();"></input></h5>
					</td>
				</tr>
			</tbody>
		</table>
           </div>
	</form>

<script>
function setIntent(it){
   $('#context_name').val(it);
   $('#rule').val('intentLike("'+ it + '",30)');
}
</script>
<h4>의도 목록</h4>
<%
BusinessCollection intents = RequestHelper.getBusinessCollection(request,"intentList");
if(intents != null && intents.size() > 0){
   for(int i = 0; i < intents.size() ;i++){
%>
<button type="button" class="btn btn-secondary btn-sm" style="margin-top:3px;" onClick="javascript:setIntent('<%=intents.getBusinessData(i).getFieldValue("IT_NAME")%>')"><%=intents.getBusinessData(i).getFieldValue("IT_NAME")%></button>
<%
  }
}
%>

<br>
	<br>

 
 <div class="card-block">
                    <div class="table-responsive">
                        <table class="table table-bordered" width="100%" id="dataTable">
                            <thead>
                                <tr>
                                    	<th>No</th>
										<th>의도 이름</th>
										<th>룰 유형</th>
										<th>의도 그룹 이름</th>
										<th>삭제</th>
                                </tr>
                            </thead>
                           
		<tbody>
	<%
  // /Anaconda.do?CMD=CMD_SEQ_102845955711497757688090&rule_group=BUSINESS&kind=PATTERN&pattern_group=BUSINESS&page=0

BusinessCollection bcCount = RequestHelper. getBusinessCollection(request,"totalCount");
String count = bcCount.getBusinessData(0).getFieldValue("count");
int intCount = Integer.parseInt(count);

BusinessCollection bc = RequestHelper. getBusinessCollection(request,"RuleContextList");
for(int i = 0; i < bc.size(); i++){
	%>
	<tr>
		<td><a href="javascript:fnGet('<%=bc.getBusinessData(i).getFieldValue("seq")%>')"><%=bc.getBusinessData(i).getFieldValue("seq")%></a></td>
		<td><%=bc.getBusinessData(i).getFieldValue("context_name")%></td>
		<td><%=bc.getBusinessData(i).getFieldValue("kind")%></td>
		<td><a href="/Anaconda.do?CMD=CMD_SEQ_109170810941496452670436&rule_group=<%=bc.getBusinessData(i).getFieldValue("rule_group")%>&kind=<%=kind%>&pattern_group=<%=bc.getBusinessData(i).getFieldValue("rule_group")%>&page=0"><%=bc.getBusinessData(i).getFieldValue("rule_group")%></a></td>
		<td><input type="button" class="btn btn-sm btn-success" value="삭제하기" onClick="javascript:deleteRuleContext(<%=bc.getBusinessData(i).getFieldValue("seq")%>)"></input></td>
	</tr>
   <%
}
   %>
   </tbody>
	</table>
</div>
<div>

<%
int cnt = intCount;
int page_count = cnt/10;
int page_mod = cnt%10;
// if(page_mod > 0) page_count++;
String seq = request.getParameter("pos");
if(!BusinessHelper.checkBusinessNull(seq))seq = "0";
int iseq = Integer.parseInt(seq);
for(int i = 0; i <= page_count;i++){
  if(iseq == i*10){
%><%=i+1 %>
<%
  }else{
%>
  <a href="/Anaconda.do?CMD=CMD_SEQ_102001143681499832653385&kind=<%=kind%>&pos=<%=i*10 %>"><%=i+1 %></a>
<%	
  }
}
%>

</div>
</div>



</div>

			
		</div>
	</div>

</div>

	


<script language="javascript">

function fnGet(s){
		var d= {seq : s , CMD:'CMD_SEQ_101274675111495797011194'};
		
		$.ajax({
			  url:"/Anaconda.json",
			  type:"POST",
			  headers: { 
				"Accept" : "application/json; charset=utf-8" , "charset" : "utf-8"
			  },
			  data:d,
			  dataType:"json",
			  success: function (data) {
				  if(data.viewDetail && data.viewDetail.length != 0){
					    with(frmRuleContext){
							seq.value= data.viewDetail[0].seq;
							context_name.value = data.viewDetail[0].context_name;
							rule.value = data.viewDetail[0].rule;
							rule_group.value = data.viewDetail[0].rule_group;
						}
				  }
			  }
			});
}

function deleteRuleContext(s){
	if(confirm("삭제하시겠습니까?")){
	with(frmRuleContext){
		seq.value =s;
		CMD.value = "CMD_SEQ_105207939891499831600689";
		callAjaxByForm('deleteRuleContext',"frmRuleContext");	
	}
	}
}
function saveRuleContext(){
	with(frmRuleContext){
		if(context_name.value == '') {
			showPopup("fail","Please enter a rule name",null);
			return;
		}
		if(seq.value == '') {
			CMD.value = "CMD_SEQ_103769713601499831596557";
		}else{
			CMD.value = "CMD_SEQ_103748609921499831604183";
		}
		callAjaxByForm('saveRuleContext',"frmRuleContext");	
	}
}
function fnCreateRuleContext(k){
	with(frmRuleContext){
                if(context_name.value == '') {
			showPopup("fail","Please enter a rule name",null);
			return;
		}
		CMD.value = "CMD_SEQ_109076939311500686978256";
		callAjaxByForm('createRuleContext',"frmRuleContext");	
	}
}
function doRun(callerName , REQ)
{
		showPopup("fail","It has been reflected normally.",null);
		var t = Math.floor(Math.random()*1000);
		window.location.href = window.location.href + '&rn=' + t;
}
</script>
