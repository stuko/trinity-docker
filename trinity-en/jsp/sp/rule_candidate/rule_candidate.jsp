<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.openapi.*"%>
<%@ page import="com.stuko.anaconda.util.*"%>

<%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"list");
%>

<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
<i class="fas fa-hands-helping"></i>&nbsp;Candidated Rule
    </h3>	
    <p>
      DUNA에서 룰로 만들어 질 후보들을 관리 함.
    </p>
    <code>
      <pre>
       < 룰 후보 >
       "예정일이 지금 보다 5일 크고,
       인원수가 3명 이상"
       < 룰 >
       expected_date > 5 && count_member >= 3
      </pre>
    </code>
  </div>
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th width="10px">키</th>
        <th scope="col">룰 후보 설명</th>
        <th scope="col">사용여부</th>
        <th scope="col">기능</th>
      </tr>
      </thead>
      <tbody>

      <tr>
        <td width="10px">추가/수정</td>
        <input type="hidden" id="rule_key" name="rule_key" value="">
        <td>
           <textarea id="rule_text" name="rule_text" cols="60" rows="10"></textarea>
        </td>
        <td>
          <select name="rule_yn" id="rule_yn">
            <option name="Y" value="Y">사용</option>
            <option name="N" value="N">사용안함</option>
          </select>
        </td>
        <td>
        <span style="margin-right:5px">
         <button class="btn btn-primary" id="btnCreate" onClick="javascript:fnCreate()">
         추가
         </button>
         <button class="btn btn-danger" id="btnCreate" onClick="javascript:fnModify()">
         수정
         </button>

        </span>
        </td>
      </tr>


<%
if(bc != null && bc.size() > 0) {
  for(int i = 0; i < bc.size() ; i++){
%>
      <tr>
        <td><%=bc.getBusinessData(i).getFieldValue("rule_key")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("rule_text")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("rule_yn")%></td>
        <td>
        <span style="margin-right:5px">
         <button class="btn btn-warning" id="btnModify" onClick="javascript:fnSetData('<%=bc.getBusinessData(i).getFieldValue("rule_key")%>')">
         선택
         </button>
        </span>
        <span  style="margin-right:5px">
         <button class="btn btn-danger" id="btnDelete" onClick="javascript:fnDelete('<%=bc.getBusinessData(i).getFieldValue("rule_key")%>')">
          삭제
         </button>
        </span>
        <span  style="margin-right:5px">
         <button class="btn btn-danger" id="btnFactor" onClick="javascript:fnFactor('<%=bc.getBusinessData(i).getFieldValue("rule_key")%>')">
          룰 후보 항목 관리
         </button>
        </span>

        </td>
      </tr>
<%
  }
}else{
%>
      <tr>
        <td colspan="4">룰 후보 정보가 없습니다.</td>
      </tr>
<%
}
%>
      </tbody>
    </table>
  </div>


<script language="javascript">
$(document).ready(function(){

});

function fnFactor(rule_key){

}
function fnDelete(rule_key){
  if(!confirm('삭제 하시겠습니까?')) return;
  var d = {rule_key: rule_key};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_101873343541657239540799' ,
    type: 'POST',
    data : d,
    dataType : 'json',
    success : function (data){
       document.location.reload();
    },
    error : function (err) {
       alert(err);
    }
 });
}

function fnSetData(rule_key){
   $('#rule_key').val(rule_key);
   var d = {rule_key: $('#rule_key').val()};     
   $.ajax({
     url : '/Anaconda.json?CMD=CMD_SEQ_107865714601657239916702' ,
     type: 'POST',
     data : d,
     dataType : 'json',
     success : function (data){
       console.log(data);
       $('#rule_key').val(data.read[0].rule_key);
       $('textarea#rule_text').val(data.read[0].rule_text);
       $('#rule_yn').val(data.read[0].rule_yn);
     },
     error : function (err) {
        alert(err);
     }
  });

}

function fnModify(){
  if(!confirm('수정 하시겠습니까?')) return;
  var d = {rule_key: $('#rule_key').val(),rule_text: $('textarea#rule_text').val(),rule_yn: $('#rule_yn').val()};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_105418526741657239530284' ,
    type: 'POST',
    data : d,
    dataType : 'json',
    success : function (data){
      document.location.reload();
    },
    error : function (err) {
       alert(err);
    }
 });
}

function fnCreate(){
  alert($('textarea#rule_text').val());
  if(!confirm('추가 하시겠습니까?')) return;
  var d = {rule_key: $('#rule_key').val(),rule_text: $('textarea#rule_text').val(),rule_yn: $('#rule_yn').val()};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_102131883511657239499009' ,
    type: 'POST',
    data : d,
    dataType : 'json',
    success : function (data){
      document.location.reload();
    },
    error : function (err) {
       alert(err);
    }
 });
}


</script>
