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
if(rule_group != null) pattern_group = rule_group;

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

 <div class="container-fluid">

<h3 class="page-header"><img src="/jsp/sp/img/pattern.png" width="40px">&nbsp; 패턴 정보 관리 </h3>

<%=kind%> > <%=pattern_group%>

<div id="div_save_pattern" style="width:1000px;position:absolute;display:block;background-color:white;border: 2px double #CCCCCC;padding: 10px 10px;z-index:200;">
	<form name="frmPattern" method="post" action="/Anaconda.do">
		<input type="hidden" name="CMD" value=""></input>
		<input type="hidden" name="seq" value=""></input>
		<input type="hidden" name="kind" value="<%=kind%>"></input>
		<input type="hidden" name="x" value=""></input>
		<input type="hidden" name="y" value=""></input>
                <input type="hidden" name="pattern_group" value="<%=rule_group%>"></input>
		<table class="table" width="100%">
			<colgroup>
				<col width="200px"></col>
				<col></col>
			</colgroup>
			<tbody>
				<tr>
					<td>패턴 이름</td>
					<td><input type="text" name="pattern_name" class="styled" size="100" ></input></td>
				</tr>
				<tr>
					<td>패턴 유형</td>
					<td><%=rule_group%></td>
				</tr>
				<tr>
					<td>문제점</td>
					<td><textarea class="form-control" rows="5" name="problem"></textarea></td>
				</tr>
				<tr>
					<td>상황</td>
					<td><textarea class="form-control" rows="5" name="context"></textarea></td>
				</tr>
				<tr>
					<td>해결책</td>
					<td><textarea class="form-control" rows="5" name="solution"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="button" class="btn btn-primary" style="font: bold 13px 돋움체;margin-left: 5px;margin-top: 5px;" value=" 패턴 저장 " onClick="javascript:savePattern();"></input>
					<input type="button" class="btn btn-primary" style="font: bold 13px 돋움체;margin-left: 5px;margin-top: 5px;" value=" 패턴 수정 " onClick="javascript:updatePattern();"></input>
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
										<th>패턴이름</th>
										<th>문제점</th>
										<th>상황</th>
										<th>해결책</th>
                                                                                <th>삭제</th> 
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                   <th>번호</th>
										<th>패턴이름</th>
										<th>문제점</th>
										<th>상황</th>
										<th>해결책</th>
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
		<td><a href="javascript:fnSet('<%=bc.getBusinessData(i).getFieldValue("seq")%>','<%=BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("pattern_name"))%>','<%=BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("problem"))%>','<%=BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("context"))%>','<%=BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("solution"))%>')"><%=bc.getBusinessData(i).getFieldValue("seq")%></a></td>
		<td><%=bc.getBusinessData(i).getFieldValue("pattern_name")%></td>
		<td><%=bc.getBusinessData(i).getFieldValue("problem")%></td>
		<td><%=bc.getBusinessData(i).getFieldValue("context")%></td>
		<td><%=bc.getBusinessData(i).getFieldValue("solution")%></td>
                <td><input type="button" class="btn btn-primary" value="삭제" onclick="javascript:deletePattern('<%=bc.getBusinessData(i).getFieldValue("seq")%>')"></td>
	</tr>
   <%
}
   %>
   </tbody>
	</table>

</div>
</div>
	


<script language="javascript">

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

function fnSet(s,n,p,c,sol){
	with(frmPattern){
           seq.value = s;
           pattern_name.value = n;
           problem.value = p;
           context.value = c;
           solution.value = sol;
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
		window.location.href = window.location.href + '&rn=' + t;
}
</script>














