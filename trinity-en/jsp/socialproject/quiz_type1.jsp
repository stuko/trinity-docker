<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%
%>
<script language="javascript">
function fnPage(seq){
  seq = seq == null || seq == ''  || seq == 'null' ? '0' : seq;
  document.location.href = "/Anaconda.do?CMD=<%=request.getParameter("CMD")%>&PAGE=" + seq;
}

function save(){
  with(frm){
    if(QUEST.value == '') {
      alert("문제 이름을 입력해 주세요");
      return;
    }
    CMD.value = "CMD_SEQ_105662516161627725507315";
    callAjaxByForm('save',"frm");	
  }
}

function fnSet(V_SEQ,V_QUEST,V_CATE,V_ANSWER,V_CHOICE,V_FEEDBACK,V_STICKER,V_IMAGE){
  with(frm){
    SEQ.value = V_SEQ;
    QUEST.value = V_QUEST;
    CATE.value = V_CATE;
    ANSWER.value = V_ANSWER;
    CHOICE.value = V_CHOICE;
    FEEDBACK.value = V_FEEDBACK;
    STICKER.value = V_STICKER;
    IMAGE.value = V_IMAGE;
  }
}

function update(){
  with(frm){
    if(!confirm('정말로 수정하시겠습니까?')) {
      return;
    }
    CMD.value = "CMD_SEQ_109618703351627725523213";
    callAjaxByForm('update',"frm");	
  }
}

function remove(s){
  with(frm){
    if(!confirm('정말로 삭제하시겠습니까?')) {
      return;
    }
    SEQ.value = s;
    CMD.value = "CMD_SEQ_102375045451627725538912";
    callAjaxByForm('delete',"frm");	
  }
}

function doRun(callerName , REQ){
  alert("정상적으로 반영 되었습니다.");
  var t = Math.floor(Math.random()*1000);
  // window.location.href = window.location.href;
  go();
}
</script>

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
function go(){
  document.location.href = '/Anaconda.do?CMD=<%=request.getParameter("CMD")%>';
}
</script>
 <div class="container-fluid">
  <h3 class="page-header"><img src="/jsp/sp/img/pattern.png" width="40px">&nbsp; Quiz Type 1 </h3>
    <div id="div_save_pattern" style="width:95%;position:absolute;display:block;background-color:white;padding: 10px 10px;z-index:200;">
	<form name="frm" method="post" action="/Anaconda.do">
		<input type="hidden" name="CMD" value=""></input>
		<input type="hidden" name="PAGE" value=""></input>
                <input type="hidden" name="SEQ" value=""></input>
		<input type="hidden" name="x" value=""></input>
		<input type="hidden" name="y" value=""></input>
		<table class="table" width="100%">
	          <colgroup>
		    <col width="200px"></col>
		    <col></col>
		  </colgroup>
		  <tbody>
                   <tr>
		    <td colspan="2">
		      <button id="btn1" type="button" class="btn btn-primary" value=" 저장 " onClick="javascript:save();">신규 저장</button>
 		      <button id="btn2" type="button"  class="btn btn-secondary" value=" 수정 " onClick="javascript:update();"> 수정 </button>
		    </td>
		   </tr>
		   <tr>
		    <td>퀴즈 문제</td>
		    <td><input type="text" name="QUEST" class="form-control" size="100" ></input></td>
   	   	   </tr>
                   <tr>
		    <td>문제 유형</td>
		    <td>
                        <input type="text" name="CATE" class="form-control" size="100" ></input>
                        <select name="CATE_SEL" class="form-control">
                            <option>SOCIETY</option>
                            <option>ENGLISH</option>
                            <option>KOREAN</option>
                            <option>MATH</option>
                            <option>HISTORY</option>
                            <option>SCIENCE</option>
                        </select>
                    </td>
   	   	   </tr>
                   <tr>
		    <td>정답</td>
 		    <td><input type="text" name="ANSWER" class="form-control" size="20" value=""></input></td>
		   </tr>
		   <tr>
		    <td>객관식 범위(EX:1,4)</td>
		    <td><input type="text" name="CHOICE" class="form-control" size="20" value="1,5"></input></td>
		   </tr>
		   <tr>
		    <td>피드백 URL</td>
		    <td><input type="text" name="FEEDBACK" class="form-control" size="20" value=""></input></td>
		   </tr>
		   <tr>
		    <td>스티커 정보</td>
		    <td><input type="text" name="STICKER" class="form-control" size="20" value=""></input></td>
		   </tr>
		   <tr>
		    <td>이미지 정보</td>
		    <td><input type="text" name="IMAGE" class="form-control" size="20" value=""></input></td>
		   </tr>
		   <tr>
		    <td colspan="2">
		     <button id="btn3" type="button"  class="btn btn-primary" value=" 저장 " onClick="javascript:save();">신규저장</button>
  		     <button id="btn4" type="button"  class="btn btn-secondary" value=" 수정 " onClick="javascript:update();"> 수정 </button>
                    </td>
                   </tr>
	         </tbody>
	      </table>
	    </form>
          <hr/>
           <div class="card-block">
            <div class="table-responsive">
              <table class="table table-bordered" width="100%" id="dataTable" cellspacing="0">
                <thead>
                  <tr>
                    <th>키</th>
		    <th>퀴즈 문제</th>
		    <th>문제 과목</th>
	 	    <th>정답</th>
	 	    <th>객관식 범위</th>
                    <th>피드백 URL</th>
                    <th>삭제</th> 
                 </tr>
              </thead>
              <tfoot>
                <tr>
                    <th>키</th>
		    <th>퀴즈 문제</th>
		    <th>문제 과목</th>
	 	    <th>정답</th>
	 	    <th>객관식 범위</th>
                    <th>피드백 URL</th>
                    <th>삭제</th> 
               </tr>
            </tfoot>
	    <tbody>
<%
BusinessCollection bc = RequestHelper. getBusinessCollection(request,"LIST");
for(int i = 0; i < bc.size(); i++){
  String SEQ = bc.getBusinessData(i).getFieldValue("SEQ");
  String QUEST = BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("QUEST"));
  String ANSWER = BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("ANSWER"));
  String CATE = bc.getBusinessData(i).getFieldValue("CATE");
  String CHOICE = bc.getBusinessData(i).getFieldValue("CHOICE");
  String FEEDBACK = bc.getBusinessData(i).getFieldValue("FEEDBACK");
  String STICKER = bc.getBusinessData(i).getFieldValue("STICKER");
  String IMAGE = bc.getBusinessData(i).getFieldValue("IMAGE");
%>
	      <tr>
		<td><a href="javascript:fnSet('<%=SEQ%>','<%=QUEST%>','<%=CATE%>','<%=ANSWER%>','<%=CHOICE%>','<%=FEEDBACK%>','<%=STICKER%>','<%=IMAGE%>')"><%=SEQ%></a></td>
		<td><%=QUEST.replace("\n","<br>")%></td>
		<td><%=CATE.replace("\n","<br>")%></td>
		<td><%=ANSWER.replace("\n","<br>")%></td>
		<td><%=CHOICE%></td>
		<td><%=FEEDBACK%></td>
                <td><input type="button" class="btn btn-primary" value="삭제" onclick="javascript:remove('<%=SEQ%>')"></td>
	     </tr>
<%
}
%>
   </tbody>
  </table>
 </div>
</div>
<%
BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"TOTAL");
String strCount = bc1.getBusinessData(0).getFieldValue("CNT");
int cnt = Integer.parseInt(strCount);
int page_count = cnt/20;
int page_mod = cnt%20;
String seq = request.getParameter("PAGE");
if(!BusinessHelper.checkBusinessNull(seq)) seq = "0";
int iseq = Integer.parseInt(seq);
for(int i = 0; i <= page_count;i++){
 if(iseq == i*20){
%>
 <%=i+1 %>
<%
  }else{
%>
 <a href="javascript:fnPage('<%=i*20 %>');"><%=i+1 %></a>
<%	
  }
}
%>
</div>
