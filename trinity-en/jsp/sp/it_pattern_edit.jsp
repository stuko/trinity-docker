<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%
String rule_group = request.getParameter("rule_group");
String pattern_group = request.getParameter("pattern_group");
// if(rule_group != null) pattern_group = rule_group;
String kind = request.getParameter("kind");
rule_group = rule_group == null ? "FREE" : rule_group;
pattern_group = pattern_group == null ? "IT" : pattern_group;
kind = kind == null ? "GENERAL" : kind;
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
<script>
function goPG(pg){
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_102845955711497757688090&pattern_group=' + pg;
}
</script>
 <div class="container-fluid">

<h3 class="page-header"><img src="/jsp/sp/img/pattern.png" width="40px">&nbsp; Quiz Type 2 </h3>
<span style="margin-left:20px;">
퀴즈 유형 : 
<%
BusinessCollection bcPG = RequestHelper.getBusinessCollection(request,"selectPatternGroup");
for(int i = 0; i < bcPG .size(); i++){
%>
  <button type="button" class="btn btn-primary fs-it-btn" onClick="javascript:goPG('<%=bcPG.getBusinessData(i).getFieldValue("pattern_group")%>')">
<%=bcPG.getBusinessData(i).getFieldValue("pattern_group")%></button>
<%
}
%>
</span>
<div id="div_save_pattern" style="width:95%;position:absolute;display:block;background-color:white;padding: 10px 10px;z-index:200;">
	<form name="frmPattern" method="post" action="/Anaconda.do">
		<input type="hidden" name="CMD" value=""></input>
		<input type="hidden" name="seq" value=""></input>
		<input type="hidden" name="kind" value="<%=kind%>"></input>
		<input type="hidden" name="x" value=""></input>
		<input type="hidden" name="y" value=""></input>
                <!--input type="hidden" name="pattern_group" value="<%=pattern_group%>"></input-->
		<table class="table" width="100%">
			<colgroup>
				<col width="200px"></col>
				<col></col>
			</colgroup>
			<tbody>
                                 <tr>
					<td colspan="2">
					<button id="btn1" type="button" class="btn btn-lg btn-primary" onClick="javascript:savePattern();">
                                        <span>😊😊😊 추가<br><small>퀴즈를 추가해 주세요</small></span>
                                        </button>
					<button id="btn2" type="button"  class="btn btn-lg btn-info" onClick="javascript:updatePattern();">
                                        <span>😁😁😁 수정<br><small>퀴즈를 수정해 주세요</small></span>
                                        </button>
					</td>

				</tr>
				<tr>
					<td>퀴즈 정답</td>
					<td><input type="text" name="pattern_name" class="form-control" size="100" ></input></td>
				</tr>
                                 <tr>
					<td>퀴즈 유형</td>
					<td><input type="text" name="pattern_group" class="form-control" size="20" value="<%=pattern_group%>"></input></td>
				</tr>

				<tr style="display:none;">
					<td>정의유형 / 피드백 / 스티커 / 이미지 : <br> * 선택사항들</td>
					<td>
                                   <div style="margin-bottom:2px;"><input type="text" name="method" class="styled" style="margin-bottom=2px;" size="20" value=""></input> (정의유형 : CHOICE)</div>
                                   <div style="margin-bottom:2px;"><input type="text" name="range" class="styled" style="margin-bottom=2px;" size="10" value=""></input> (범위 : 1,4)</div>
                                   <div style="margin-bottom:2px;"><input type="text" name="feedback" class="styled" style="margin-bottom=2px;"  size="50" value=""></input> (피드백 : URL )</div>
                                   <div style="margin-bottom:2px;"><input type="text" name="sticker" class="styled" style="margin-bottom=2px;"  size="50" value=""></input> (스티커 : URL )</div>
                                   <div style="margin-bottom:2px;"><input type="text" name="image" class="styled" style="margin-bottom=2px;"  size="50" value=""></input> (이미지 : URL )</div>

                                        </td>
				</tr>
                                
				<tr>
					<td>퀴즈 문제</td>
					<td><textarea class="form-control" rows="5" name="problem"></textarea></td>
				</tr>
				<tr style="display:none;">
					<td>상황</td>
					<td><textarea class="form-control" rows="5" name="context"></textarea></td>
				</tr>
				<tr style="display:none;">
					<td>해결책</td>
					<td><textarea class="form-control" rows="5" name="solution"></textarea></td>
				</tr>
				<tr style="display:none;">
					<td colspan="2">
					<button id="btn3" type="button"  class="btn btn-primary" value=" 패턴 저장 " onClick="javascript:savePattern();">개념 및 패턴 추가</button>
					<button id="btn4" type="button"  class="btn btn-secondary" value=" 패턴 수정 " onClick="javascript:updatePattern();">개념 및 패턴 수정</button>
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
                                    	<th>번호</th>
										<th>정답</th>
										<th>문제</th>
                                                                                <th>삭제</th> 
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    	<th>번호</th>
										<th>정답</th>
										<th>문제</th>
                                                                                <th>삭제</th> 
                                </tr>
                            </tfoot>
	<tbody>
	<%
  // /Anaconda.do?CMD=CMD_SEQ_102845955711497757688090&rule_group=BUSINESS&kind=PATTERN&pattern_group=BUSINESS&page=0

BusinessCollection bc = RequestHelper. getBusinessCollection(request,"patternList");
for(int i = 0; i < bc.size(); i++){
	%>
	<tr>
		<td><a href="javascript:fnSet('<%=bc.getBusinessData(i).getFieldValue("seq")%>','<%=BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("pattern_name"))%>','<%=BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("method"))%>','<%=BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("range"))%>','<%=BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("feedback"))%>','<%=BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("sticker"))%>','<%=BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("image"))%>','<%=bc.getBusinessData(i).getFieldValue("problem")%>','<%=BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("context"))%>','<%=BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("solution"))%>')"><%=bc.getBusinessData(i).getFieldValue("seq")%></a></td>
		<td><%=bc.getBusinessData(i).getFieldValue("pattern_name")%></td>
		<td><%=bc.getBusinessData(i).getFieldValue("problem").replace("\n","<br>")%></td>
<!--		<td><%=bc.getBusinessData(i).getFieldValue("context")%></td>
		<td><%=bc.getBusinessData(i).getFieldValue("solution")%></td> -->
                <td><input type="button" class="btn btn-primary" value="삭제" onclick="javascript:deletePattern('<%=bc.getBusinessData(i).getFieldValue("seq")%>')"></td>
	</tr>
   <%
}
   %>
   </tbody>
	</table>


</div>
<%
BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"selectTotalCount");
String strCount = bc1.getBusinessData(0).getFieldValue("CNT");
%>
<%
int cnt = Integer.parseInt(strCount);
int page_count = cnt/20;
int page_mod = cnt%20;
// if(page_mod > 0) page_count++;
String seq = request.getParameter("pos");
if(!BusinessHelper.checkBusinessNull(seq))seq = "0";
int iseq = Integer.parseInt(seq);
for(int i = 0; i <= page_count;i++){
  if(iseq == i*20){
%><%=i+1 %>
<%
  }else{
%>
  <a href="javascript:fnPage('<%=i*20 %>');"><%=i+1 %></a>
<%	
  }
}
%>
</div>
	


<script language="javascript">
function fnPage(seq){
  seq = seq == null || seq == ''  || seq == 'null' ? '0' : seq;
  document.location.href = "/Anaconda.do?CMD=CMD_SEQ_102845955711497757688090&pattern_group=<%=pattern_group%>&pos=" + seq;
}
function savePattern(){
	with(frmPattern){
		if(pattern_name.value == '') {
			alert("패턴 이름을 입력해 주세요");
			return;
		}
		CMD.value = "CMD_SEQ_109513579451497757695725";
		callAjaxByForm('savePattern',"frmPattern");	
	}
}

function fnSet(v_seq,v_name,v_method,v_range, v_feedback, v_sticker, v_image, v_problem,v_context,v_solution){
	with(frmPattern){
           seq.value = v_seq;
           pattern_name.value = v_name;
           method.value = v_method;
           range.value = v_range;
           feedback.value = v_feedback;
           sticker.value = v_sticker;
           image.value = v_image;
           problem.value = v_problem;
           context.value = v_context;
           solution.value = v_solution;
	}
}


function updatePattern(){
	with(frmPattern){
		if(!confirm('정말로 수정하시겠습니까?')) {
			return;
		}
		CMD.value = "CMD_SEQ_107003392321512522494169";
		callAjaxByForm('updatePattern',"frmPattern");	
	}
}

function deletePattern(s){
	with(frmPattern){
		if(!confirm('정말로 삭제하시겠습니까?')) {
			return;
		}
                seq.value = s;
		CMD.value = "CMD_SEQ_100488412611512521181442";
		callAjaxByForm('deletePattern',"frmPattern");	
	}
}

function doRun(callerName , REQ)
{
		alert("정상적으로 반영 되었습니다.");
		var t = Math.floor(Math.random()*1000);
		window.location.href = window.location.href;
}
</script>
