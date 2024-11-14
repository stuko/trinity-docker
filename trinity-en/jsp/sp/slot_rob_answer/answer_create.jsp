<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"INTENT_SLOT_ROB_ANSWER_list");
String next_page = request.getAttribute(InitClass.PRE_URL_4) + "";
String ANS_KEY = "";
String IT_KEY = "";
String IG_KEY = "";
String SLOT_KEY = request.getParameter("SLOT_KEY");
String SLOT_NAME = request.getParameter("SLOT_NAME");
String IT_NAME = "";
if(bc != null && bc.size() > 0){
   ANS_KEY = bc.getBusinessData(0).getFieldValue("ANS_KEY");
   IT_KEY = bc.getBusinessData(0).getFieldValue("IT_KEY");
   IG_KEY = bc.getBusinessData(0).getFieldValue("IG_KEY");
   SLOT_KEY = bc.getBusinessData(0).getFieldValue("SLOT_KEY");
   IT_NAME = bc.getBusinessData(0).getFieldValue("IT_NAME");  
   SLOT_NAME = bc.getBusinessData(0).getFieldValue("SLOT_NAME");  
}
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

function fnSet(s,n){
	with(frmAnswer){
		ANS_KEY.value= s;
		ANS_SENTENCE.value = n;
	}
}

function resetSentence(){
  with(frmSentence){
    ANS_KEY.value = '';
    ANS_SENTENCE.value = '';
  }
}

function fnSaveAnswer(){
  with(frmAnswer){
    if(ANS_SENTENCE.value == '') {
      showPopup("fail","Please enter a sentence.",null);
        return;
      }
      if(ANS_KEY.value == '') {
  	CMD.value = "CMD_SEQ_103333042581582637620371";
      }else{
	CMD.value = "CMD_SEQ_103825503931582637646534";
      }
      callAjaxByForm('fnSaveAnswer',"frmAnswer");	
  }
}
function deleteAnswer(s){
	with(frmSentence){
		ANS_KEY.value = s;
		CMD.value = "CMD_SEQ_103083871571582637668443";
		callAjaxByForm('deleteAnswer',"frmAnswer");	
	}
}

function doRuning(callerName){
}

function doRun(callerName , REQ)
{
	showPopup("success","It has been reflected normally.",null);
	var t = Math.floor(Math.random()*1000);
	window.location.reload();
}

</script>

<div class="container-fluid">
<h3 class="page-header"><i class="fas fa-highlighter"></i>&nbsp; 의도(<%=SLOT_NAME%>) 답변 패턴 관리</h3>

<div id="div_save_sentence">
	<form name="frmSentence" id="frmAnswer" method="post" action="/Anaconda.do">
		<input type="hidden" name="CMD" value=""></input>
                <input type="hidden" name="ANS_KEY" value=""></input>
                <input type="hidden" name="SLOT_KEY" value="<%=SLOT_KEY%>"></input>
                <input type="hidden" name="IT_KEY" value="<%=IT_KEY%>"></input>
		<input type="hidden" name="IT_NAME" value="<%=IT_NAME%>"></input>
		<table  class="table table-condensed" >
			<colgroup>
				<col width="200px"></col>
				<col></col>
			</colgroup>
			<tbody>
				<tr>
					<td>답변</td>
					<td><textarea rows="3" cols="70" name="ANS_SENTENCE" class="styled" size="100" ></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
                                        <% if(bc != null && bc.size() > 0 ) {  %>
                                        <button class="btn btn-primary" id="backToIntentList"><< 대화 의도 질문 목록으로 돌아가기</button>
                                        <% } else {%>
                                        <button class="btn btn-primary" id="backList"><< 처음으로 돌아가기</button>
                                        <% } %>
					<input type="button" class="btn btn-danger" value=" 답변 저장하기 " onClick="fnSaveAnswer();"></input>
					<input type="button" class="btn btn-info" value=" 초기화 " onClick="resetAnswer();"></input>
					</td>
				</tr>
			</tbody>
		</table>
	</form>


 <div class="card mb-3" style="padding-bottom:40px;">
           <div class="card-header">
<h6>&nbsp; Sentence Sample <br><br><br>
<pre>
장소는 XXX 입니다.
가격은 XXX 원입니다.
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
				<th>답변</th>
				<th>삭제</th>
			        </tr>
                          </thead>
	<tbody>
	<%
        if(bc != null && bc.size() > 0 ) { 
        for(int i = 0; i < bc.size(); i++){
	%>
	<tr>
		<td><%=i+1%></td>
		<td><a href="javascript:fnSet('<%=bc.getBusinessData(i).getFieldValue("ANS_KEY")%>','<%=bc.getBusinessData(i).getFieldValue("ANS_SENTENCE")%>')">
		<%=bc.getBusinessData(i).getFieldValue("ANS_SENTENCE")%></a></td>
		<td><input type="button" class="btn btn-danger" value="remove" onClick="javascript:deleteAnswer('<%=bc.getBusinessData(i).getFieldValue("ANS_KEY")%>');"></input></td>
	</tr>
   <%
       }
     }
   %>
   </tbody>
	</table>

</div>
</div>

<script>

$(document).ready(function(){
  $('#backToIntentList').on('click',function(event){
    document.location.href = '/Anaconda.do?CMD=CMD_SEQ_109919745451582508889092&IT_KEY=<%=IT_KEY%>';
    return false;
  });
  $('#backList').on('click',function(event){
    document.location.href = '/Anaconda.do?CMD=CMD_SEQ_108015592941580175502168';
    return false;
  });
});

</script>
