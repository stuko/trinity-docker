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
<i class="fas fa-hands-helping"></i>&nbsp;Message Template
    </h3>	
    <p>
      DUNA에서 결과로 보낼 최종 메시지 모양을 만들어 줌.
    </p>
    <code>
      <pre>
     {
	 "version": "1.0",
	    "data": {
	    "msg":"{=contents}"
	    }
      }

     // 금수저 DUNA 샘플
     {
       "buy_method" : "{=buy_method}",
       "sell_method" : "{=sell_method}",
       "sell_yn" : "{=sell_yn}",
       "buy_yn" : "{=buy_yn}",
       "test_mode":"{=test_mode}",
       "real_mode":"{=real_mode}"
     } 
      </pre>

    </code>
  </div>
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th width="10px">키</th>
        <th scope="col">선택자 이름</th>
        <th scope="col">선택자 값</th>   
        <th scope="col">템플릿</th>
        <th scope="col">사용여부</th>
        <th scope="col">기능</th>
      </tr>
      </thead>
      <tbody>

      <tr>
        <td width="10px">추가/수정</td>
        <input type="hidden" id="SEQ" name="SEQ" value="">
        <td>
           <input type id="CASE_NAME" name="CASE_NAME"/>
        </td>
        <td>
           <input type id="CASE_VALUE" name="CASE_VALUE"/>
        </td>
        <td>
           <textarea id="TEMPLATE" name="TEMPLATE" cols="60" rows="10"></textarea>
        </td>
        <td>
          <select name="USE_YN" id="USE_YN">
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
        <td><%=bc.getBusinessData(i).getFieldValue("SEQ")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("CASE_NAME")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("CASE_VALUE")%></td>        
        <td><%=bc.getBusinessData(i).getFieldValue("TEMPLATE")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("USE_YN")%></td>
        <td>
        <span style="margin-right:5px">
         <button class="btn btn-warning" id="btnModify" onClick="javascript:fnSetData('<%=bc.getBusinessData(i).getFieldValue("SEQ")%>')">
         선택
         </button>
        </span>
        <span  style="margin-right:5px">
         <button class="btn btn-danger" id="btnDelete" onClick="javascript:fnDelete('<%=bc.getBusinessData(i).getFieldValue("SEQ")%>')">
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
        <td colspan="4">매핑 변수 정보가 없습니다.</td>
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

function fnDelete(SEQ){
  if(!confirm('삭제 하시겠습니까?')) return;
  var d = {SEQ: SEQ};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_108491606311630717274255' ,
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

function fnSetData(SEQ){
   $('#SEQ').val(SEQ);
   var d = {SEQ: $('#SEQ').val()};     
   $.ajax({
     url : '/Anaconda.json?CMD=CMD_SEQ_102797653751630718642684' ,
     type: 'POST',
     data : d,
     dataType : 'json',
     success : function (data){
       console.log(data);
       $('#SEQ').val(data.read[0].SEQ);
       $('#CASE_NAME').val(data.read[0].CASE_NAME);
       $('#CASE_VALUE').val(data.read[0].CASE_VALUE);
       $('textarea#TEMPLATE').val(data.read[0].TEMPLATE);
       $('#USE_YN').val(data.read[0].USE_YN);
     },
     error : function (err) {
        alert(err);
     }
  });

}

function fnModify(){
  if(!confirm('수정 하시겠습니까?')) return;
  var d = {SEQ: $('#SEQ').val(),CASE_NAME: $('#CASE_NAME').val(),CASE_VALUE: $('#CASE_VALUE').val(),TEMPLATE: $('textarea#TEMPLATE').val(),USE_YN: $('#USE_YN').val()};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_102168165741630717266637' ,
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
  alert($('textarea#TEMPLATE').val());
  if(!confirm('추가 하시겠습니까?')) return;
  var d = {SEQ: $('#SEQ').val(),CASE_NAME: $('#CASE_NAME').val(),CASE_VALUE: $('#CASE_VALUE').val(),TEMPLATE: $('textarea#TEMPLATE').val(),USE_YN: $('#USE_YN').val()};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_108719002591630717260761' ,
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
