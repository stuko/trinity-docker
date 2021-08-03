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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"mapping_list");
%>

<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
<i class="fas fa-hands-helping"></i>&nbsp;DUNA 변수 매핑 관리
    </h3>	
    <p>
      DUNA에서 사용하는 변수들을 매핑/변환 하여 사용하고자 할 때, 쓰이는 기능입니다.
    </p>
    <code>
      <pre>
        생성할 변수 명 : MY_THOUGHT
        변수 생성 값 : {=userRequest.utterance}
      </pre>
    </code>
  </div>
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">번호</th>
        <th scope="col">생성할 변수명</th>
        <th scope="col">변수 생성 값</th>
        <th scope="col">기능</th>
      </tr>
      </thead>
      <tbody>

      <tr>
        <td>추가/수정</td>
        <td><input type="text" id="M_TGT_NAME" name="M_TGT_NAME" value="" size="40"></td>
        <td><input type="text" id="M_TGT_VALUE" name="M_TGT_VALUE" value="" size="40"></td>
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
        <td><%=i+1%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("M_TGT_NAME")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("M_TGT_VALUE")%></td>
        <td>
        <span style="margin-right:5px">
         <button class="btn btn-warning" id="btnModify" onClick="javascript:fnSetData('<%=bc.getBusinessData(i).getFieldValue("M_TGT_NAME")%>','<%=bc.getBusinessData(i).getFieldValue("M_TGT_VALUE")%>')">
         선택
         </button>
        </span>
        <span  style="margin-right:5px">
         <button class="btn btn-danger" id="btnDelete" onClick="javascript:fnDelete('<%=bc.getBusinessData(i).getFieldValue("M_TGT_NAME")%>')">
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

function fnDelete(M_TGT_NAME){
  if(!confirm('삭제 하시겠습니까?')) return;
  var d = {M_TGT_NAME: M_TGT_NAME};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_109822766361613102039872' ,
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

function fnSetData(name, value){
   $('#M_TGT_NAME').val(name);
   $('#M_TGT_VALUE').val(value);
}

function fnModify(){
  if(!confirm('수정 하시겠습니까?')) return;
  var d = {M_TGT_NAME: $('#M_TGT_NAME').val(),M_TGT_VALUE: $('#M_TGT_VALUE').val()};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_106251697831613102045423' ,
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
  var d = {M_TGT_NAME: $('#M_TGT_NAME').val(),M_TGT_VALUE: $('#M_TGT_VALUE').val()};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_106990202611613102033354' ,
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
