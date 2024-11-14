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
	with(frmAlgorithm){
		seq.value= s;
		algorithm_name.value = n;
		var rc = document.getElementById(r);
		algorithm_script.value = TextToHtml((rc.innerHTML).trim());
	}
}

function resetAlgorithm(){
	with(frmAlgorithm){
		seq.value= '';
		algorithm_name.value = '';
		algorithm_script.value = '';
	}
}

function fnSaveRuleAlgorithm(){
	with(frmAlgorithm){
		if(algorithm_name.value == '') {
                        showPopup("fail","Please enter a algorithm name.",null);
			return;
		}
		if(algorithm_script.value == '') {
			showPopup("fail","Please enter a algorithm name.",null);
			return;
		}
		if(seq.value == '') {
			CMD.value = "CMD_SEQ_106752320981500422361060";
		}else{
			CMD.value = "CMD_SEQ_101811940291500422371845";
		}
		callAjaxByForm('fnSaveRuleAlgorithm',"frmAlgorithm");	
	}
}
function deleteAlgorithm(s){
  confirmPopup('경고','알고리즘을 삭제하시겠습니까?',()=>{
	with(frmAlgorithm){
		seq.value = s;
		CMD.value = "CMD_SEQ_108829703221500422364729";
		callAjaxByForm('deleteAlgorithm',"frmAlgorithm");	
	}
  });
}

function purgeAlgorithm(f){
  confirmPopup('경고','알고리즘를 적용하시겠습니까?',()=>{
	with(frmAlgorithm){
		algorithm_name.value = f;
		CMD.value = "CMD_SEQ_100536440221606261543188";
		callAjaxByForm('purgeAlgorithm',"frmAlgorithm");	
	}
  });
}

function applyCommonRuleAlgorithm(){
     confirmPopup('경고','공통 알고리즘들을 적용하시겠습니까?',()=>{
        ajaxConda('frmAlgorithm','CMD_SEQ_106917082611574833668785',true, ()=>{
            alertPopup('성공','공통 알고리즘들이 회원님의 알고리즘들에 포함되었습니다.');
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

<h3 class="page-header"><img src="/jsp/sp/img/function.png" width="40px">&nbsp; Algorithm </h3>

<div id="div_save_function">
	<form name="frmAlgorithm" id="frmAlgorithm" method="post" action="/Anaconda.do">
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
					<td>알고리즘 이름</td>
					<td><input type="text" name="algorithm_name" class="styled" size="100" ></input></td>
				</tr>
				<tr>
					<td>알고리즘 내용</td>
					<td><textarea class="form-control" rows="5" name="algorithm_script"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="button" class="btn btn-primary" value=" 알고리즘 저장하기 " onClick="fnSaveRuleAlgorithm();"></input>
					<input type="button" class="btn btn-info" value=" 초기화 " onClick="resetAlgorithm();"></input>
					</td>
				</tr>
			</tbody>
		</table>
	</form>


 <div class="card mb-3" style="padding-bottom:40px;">
           <div class="card-header">
<h6>&nbsp; Code Sample <br><br>
<pre>
def xgboost(X_train, X_test, y_train, y_test):
    import xgboost
    xgb_model = xgboost.XGBRegressor(n_estimators=100, learning_rate=0.08, gamma=0, subsample=0.75,colsample_bytree=1, max_depth=7)
    xgb_model.fit(X_train,y_train)
    return xgb_model
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
										<th>알고리즘 이름</th>
										<th>알고리즘 내용</th>
										<th>삭제</th>
								</tr>
                            </thead>

	<tbody>
	<%
          BusinessCollection bc = RequestHelper.getBusinessCollection(request,"list");
          for(int i = 0; i < bc.size(); i++){
	%>
	<tr>
		<td><%=bc.getBusinessData(i).getFieldValue("seq")%></td>
		<td><a href="javascript:fnSet('<%=bc.getBusinessData(i).getFieldValue("seq")%>','<%=bc.getBusinessData(i).getFieldValue("algorithm_name")%>','r-<%=i%>')">
		<%=bc.getBusinessData(i).getFieldValue("algorithm_name")%></a></td>
		<td><div id='r-<%=i%>'>
		<%=bc.getBusinessData(i).getFieldValue("script")%></div></td>
		<td>
           <div>
           <input type="button" class="btn btn-danger" value="remove" onClick="javascript:deleteAlgorithm('<%=bc.getBusinessData(i).getFieldValue("seq")%>');"></input>
           <br><br>
           <input type="button" class="btn btn-primary" value="publish" onClick="javascript:purgeAlgorithm('<%=bc.getBusinessData(i).getFieldValue("algorithm_name")%>');"></input>
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
