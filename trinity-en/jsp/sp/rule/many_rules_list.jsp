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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"GetManyRules");
%>


<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
      <i class="fas fa-hands-helping"></i>&nbsp;Multi Rule
    </h3>	
    <p>
      <div class="card mb-3" style="padding-left:5px;padding-bottom:5px;margin-bottom:5px;margin-top:20px;">
       <div class="card-header">
      DUNA에 룰을 한꺼번에 여러개를 등록할 때 사용하는 기능입니다.아래 예제를 참고해 주시기 바랍니다.
       </div>
        <pre>
{
   "rules":[
      {
        "ruleId" : "-100001",
        "ruleContext" : [
            {
              "intent" : "테스트의도",
              "intentStatements" : ["하이","안영","반가워요","인하자"],
              "responses" : ["나두요","하이","ㅎㅎ"],
              "next" : "",
              "buttons" : ["",""],
              "buttonQuestion" : "" 
            }
          ]
       }
    ]
}
       </pre>
    </div>
    </p>
  </div>
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">키</th>
        <th scope="col">등록일</th>
        <th scope="col">등록여부</th>
        <th scope="col">내용</th>
        <th scope="col">기능</th>
      </tr>
      </thead>
      <tbody>

      <tr>
        <td colspan="2">추가/수정</td>
        <input type="hidden" id="rule_key" name="rule_key">
        <td><input type="text" id="rule_yn" name="rule_yn" value="N" size="2"> * 아직 등록되지 않은 경우 'N'</td>
        <td><textarea id="rule_text" name="rule_text" cols="100" rows="4"></textarea></td>
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
        <td><%=bc.getBusinessData(i).getFieldValue("rule_date")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("rule_yn")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("rule_text_short")%>
        <div style="display:none;" id="div_<%=bc.getBusinessData(i).getFieldValue("rule_key")%>">
          <%=bc.getBusinessData(i).getFieldValue("rule_text")%>
        </div>
        </td>
        <td>
        <span style="margin-right:5px">
         <button class="btn btn-warning" id="btnModify" onClick="javascript:fnSetData('<%=bc.getBusinessData(i).getFieldValue("rule_key")%>','<%=bc.getBusinessData(i).getFieldValue("rule_yn")%>','div_<%=bc.getBusinessData(i).getFieldValue("rule_key")%>')">
         선택
         </button>
        </span>
        <span  style="margin-right:5px">
         <button class="btn btn-danger" id="btnDelete" onClick="javascript:fnDelete('<%=bc.getBusinessData(i).getFieldValue("rule_key")%>')">
          삭제
         </button>
        </span>
        </td>
      </tr>
<%
  }
}else{
%>
      <tr>
        <td colspan="5">정보가 없습니다.</td>
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

function fnDelete(rule_key){
  if(!confirm('삭제 하시겠습니까?')) return;
  var d = {rule_key: rule_key, code:"delete"};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_104569998931613947509504' ,
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

function fnSetData(rule_key,rule_yn,rule_div_id){
   $('#rule_key').val(rule_key);
   $('#rule_yn').val(rule_yn);
   $('#rule_text').val($('#' + rule_div_id).html());
}

function fnModify(){
  if(!confirm('수정 하시겠습니까?')) return;
  var d = {rule_key: $('#rule_key').val(),rule_yn: $('#rule_yn').val(),rule_text: $('#rule_text').val(), code:"update"};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_104569998931613947509504' ,
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
  if(!confirm('추가 하시겠습니까?')) return;
  var d = {rule_yn: $('#rule_yn').val(),rule_text: $('#rule_text').val(), code:"create"};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_104569998931613947509504' ,
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
