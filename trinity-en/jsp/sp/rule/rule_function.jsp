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
	with(frmFunction){
		seq.value= s;
		function_name.value = n;
		var rc = document.getElementById(r);
		rule_function.value = TextToHtml((rc.innerHTML).trim());
	}
}

function resetFunction(){
	with(frmFunction){
		seq.value= '';
		function_name.value = '';
		rule_function.value = '';
	}
}

function fnSaveRuleFunction(){
	with(frmFunction){
		if(function_name.value == '') {
                        showPopup("fail","Please enter a function name.",null);
			return;
		}
		if(rule_function.value == '') {
			showPopup("fail","Please enter a function name.",null);
			return;
		}
		if(seq.value == '') {
			CMD.value = "CMD_SEQ_106752320981500422361060";
		}else{
			CMD.value = "CMD_SEQ_101811940291500422371845";
		}
		callAjaxByForm('fnSaveRuleFunction',"frmFunction");	
	}
}
function deleteFunction(s){
  confirmPopup('경고','룰 함수를 삭제하시겠습니까?',()=>{
	with(frmFunction){
		seq.value = s;
		CMD.value = "CMD_SEQ_108829703221500422364729";
		callAjaxByForm('deleteFunction',"frmFunction");	
	}
  });
}

function purgeFunction(f){
  confirmPopup('경고','룰 함수를 적용하시겠습니까?',()=>{
	with(frmFunction){
		function_name.value = f;
		CMD.value = "CMD_SEQ_100536440221606261543188";
		callAjaxByForm('purgeFunction',"frmFunction");	
	}
  });
}

function applyCommonRuleFunction(){
     confirmPopup('경고','공통 룰 함수들을 적용하시겠습니까?',()=>{
        ajaxConda('frmFunction','CMD_SEQ_106917082611574833668785',true, ()=>{
            alertPopup('성공','공통 룰 함수들이 회원님의 룰 함수들에 포함되었습니다.');
            window.location.reload(); 
        });
     });
}

function doRun(callerName , REQ)
{
	showPopup("success","It has been reflected normally.",null);
	var t = Math.floor(Math.random()*1000);
	window.location.reload();
}
</script>




 <div class="container-fluid">

<h3 class="page-header"><img src="/jsp/sp/img/function.png" width="40px">&nbsp; Function </h3>

<div id="div_save_function">
	<form name="frmFunction" id="frmFunction" method="post" action="/Anaconda.do">
		<input type="hidden" name="CMD" value=""></input>
		<input type="hidden" name="seq" value=""></input>
		<input type="hidden" name="kind" value="<%=kind%>"></input>
		<input type="hidden" name="x" value=""></input>
		<input type="hidden" name="y" value=""></input>
		<table  class="table table-condensed" >
			<colgroup>
				<col width="200px"></col>
				<col></col>
			</colgroup>
			<tbody>
				<tr>
					<td>룰 함수 이름</td>
					<td><input type="text" name="function_name" class="styled" size="100" ></input></td>
				</tr>
				<tr>
					<td>룰 함수 내용</td>
					<td><textarea class="form-control" rows="5" name="rule_function"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="button" class="btn btn-primary" value=" 룰 함수 저장하기 " onClick="fnSaveRuleFunction();"></input>
					<input type="button" class="btn btn-info" value=" 초기화 " onClick="resetFunction();"></input>
                                        <div id="applyCommonFunctionButton" style="margin-top:20px;">
                                        <p style="color:blue">"공통 룰 함수란 DUNA의 중앙 시스템에서 회원님들을 위해 배포해 드리는 편리한 함수들을 말합니다"</p>
                                        <input type="button" class="btn btn-secondary" value="공통 룰 함수들 적용하기" onClick="applyCommonRuleFunction();"></input>
                                        </div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>


 <div class="card mb-3" style="padding-bottom:40px;">
           <div class="card-header">
<h6>&nbsp; Code Sample <br>
<pre>
// Reserved word : ruleParameter, 룰변수
ruleParameter.put('TMP_VAR','I will be saved');
룰변수.put('TMP_VAR','I will be saved');

// creat function
1. define function name : ex) FUN1
2. define function body 

function(){
   return 'i am happy';
}

var x = new Map();
x.put('util1','java.util.ArrayList');

룰변수.put('EXTERNAL_CLASSES',x);

</pre>
   </div>
</div>


	<br>
	<br>

	 <div class="card-block">
                    <div class="table-responsive">
                        <table class="table table-condensed" id="dataTable">
                            <thead>
                                <tr>
                                    	<th>No</th>
										<th>룰 함수 이름</th>
										<th>룰 함수 내용</th>
										<th>삭제</th>
								</tr>
                            </thead>

	<tbody>
	<%
  // /Anaconda.do?CMD=CMD_SEQ_102845955711497757688090&rule_group=BUSINESS&kind=PATTERN&pattern_group=BUSINESS&page=0
BusinessCollection bc = RequestHelper. getBusinessCollection(request,"RuleFunctionList");
for(int i = 0; i < bc.size(); i++){
	%>
	<tr>
		<td><%=bc.getBusinessData(i).getFieldValue("seq")%></td>
		<td><a href="javascript:fnSet('<%=bc.getBusinessData(i).getFieldValue("seq")%>','<%=bc.getBusinessData(i).getFieldValue("function_name")%>','r-<%=i%>')">
		<%=bc.getBusinessData(i).getFieldValue("function_name")%></a></td>
		<td><div id='r-<%=i%>'>
		<%=bc.getBusinessData(i).getFieldValue("rule_function")%></div></td>
		<td>
           <div>
           <input type="button" class="btn btn-danger" value="remove" onClick="javascript:deleteFunction('<%=bc.getBusinessData(i).getFieldValue("seq")%>');"></input>
           <br><br>
           <input type="button" class="btn btn-primary" value="publish" onClick="javascript:purgeFunction('<%=bc.getBusinessData(i).getFieldValue("function_name")%>');"></input>
           </div>
                </td>
	</tr>
   <%
}
   %>
   </tbody>
	</table>

</div>
</div>
<script>
post({},'CMD_SEQ_106023255061574832982709',(data)=>{
            if(data.compareRuleFunction.length > 0){
               simplePopup('알림','공통 룰 함수에서 사용하실 수 있는 함수가 있습니다. 공통 룰 함수 적용하기 버튼을 누르면 해당 함수들을 사용하실 수 있습니다.');
               fnShowDiv('applyCommonFunctionButton');
            }else{
               fnHideDiv('applyCommonFunctionButton');
            }
        },()=>{
          showPopup('에러','공통 룰 함수와 차이여부를 확인하는 도중 에러가 발생하였습니다.','');
        });
</script>
