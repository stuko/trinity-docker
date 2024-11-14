<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%
String IG_KEY = request.getParameter("IG_KEY");
String IT_KEY = request.getParameter("IT_KEY");
String IT_NAME = request.getParameter("IT_NAME");
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"selectIntent");
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
	with(frmSentence){
		IS_KEY.value= s;
		IS_SENTENCE.value = n;
	}
}

function resetSentence(){
  with(frmSentence){
    IS_KEY.value = '';
    IS_SENTENCE.value = '';
  }
}

function fnSaveSentence(){
  with(frmSentence){
    if(IS_SENTENCE.value == '') {
      showPopup("fail","Please enter a sentence.",null);
        return;
      }
      if(IS_KEY.value == '') {
  	CMD.value = "CMD_SEQ_102523063901580427282219";
      }else{
	CMD.value = "CMD_SEQ_104497247011580430243960";
      }
      callAjaxByForm('fnSaveSentence',"frmSentence");	
  }
}
function deleteSentence(s){
	with(frmSentence){
		IS_KEY.value = s;
		CMD.value = "CMD_SEQ_101637117381580430253291";
		callAjaxByForm('deleteSentence',"frmSentence");	
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
<h3 class="page-header"><i class="fas fa-highlighter"></i>&nbsp; Intent(<%=IT_NAME%>) > Sentence</h3>

<div id="div_save_sentence">
	<form name="frmSentence" id="frmSentence" method="post" action="/Anaconda.do">
		<input type="hidden" name="CMD" value=""></input>
		<input type="hidden" name="IS_KEY" value=""></input>
                <input type="hidden" name="IT_KEY" value="<%=IT_KEY%>"></input>
		<input type="hidden" name="IT_NAME" value="<%=IT_NAME%>"></input>
		<table  class="table table-condensed" >
			<colgroup>
				<col width="200px"></col>
				<col></col>
			</colgroup>
			<tbody>
				<tr>
					<td>문장</td>
					<td><textarea rows="3" cols="70" name="IS_SENTENCE" class="styled" size="100" ></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
                                        <button class="btn btn-primary" id="backToIntentGroupList"><< 대화 의도 그룹 목록으로 돌아가기</button>
                                        <% if(bc != null && bc.size() > 0) { %>
                                        <button class="btn btn-primary" id="backToIntentList"><< 대화 의도 목록으로 돌아가기</button>
                                        <% } %>
					<input type="button" class="btn btn-danger" value=" 문장 저장하기 " onClick="fnSaveSentence();"></input>
					<input type="button" class="btn btn-info" value=" 초기화 " onClick="resetSentence();"></input>
					</td>
				</tr>
			</tbody>
		</table>
	</form>


 <div class="card mb-3" style="padding-bottom:40px;">
           <div class="card-header">
<h6>&nbsp; Sentence Sample <br><br><br>
<pre>
안녕하세요 XXX님
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
				<th>문장</th>
				<th>삭제</th>
			        </tr>
                          </thead>
	<tbody>
	<%
        for(int i = 0; i < bc.size(); i++){
	%>
	<tr>
		<td><%=i+1%></td>
		<td><a href="javascript:fnSet('<%=bc.getBusinessData(i).getFieldValue("IS_KEY")%>','<%=bc.getBusinessData(i).getFieldValue("IS_SENTENCE")%>')">
		<%=bc.getBusinessData(i).getFieldValue("IS_SENTENCE")%></a></td>
		<td><input type="button" class="btn btn-danger" value="remove" onClick="javascript:deleteSentence('<%=bc.getBusinessData(i).getFieldValue("IS_KEY")%>');"></input></td>
	</tr>
   <%
}
   %>
   </tbody>
	</table>

</div>
</div>


<p height="20px">&nbsp;</p>
<div align="center">
<%
BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"selectTotalCount");
String strCount = bc1.getBusinessData(0).getFieldValue("CNT");
%>
<script language="javascript">
<% if(bc != null && bc.size() > 0) { %>
function fnPage(seq){
        seq = seq == null || seq == ''  || seq == 'null' ? '0' : seq;
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_108483648151580427270542&IG_KEY=<%=bc.getBusinessData(0).getFieldValue("IG_KEY")%>&IT_KEY=<%=IT_KEY%>&IT_NAME=<%=IT_NAME%>&pos=" + seq;
}
<% } %>
</script>
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



<script>
$(document).ready(function(){
  $('#backToIntentGroupList').on('click',function(event){
    document.location.href = '/Anaconda.do?CMD=CMD_SEQ_108015592941580175502168';
    return false;
  });
<% if(bc != null && bc.size() > 0) { %>
  $('#backToIntentList').on('click',function(event){
    document.location.href = '/Anaconda.do?CMD=CMD_SEQ_106158749731580254604919&IG_KEY=<%=bc.getBusinessData(0).getFieldValue("IG_KEY")%>';
    return false;
  });
<% } %>
});

</script>
