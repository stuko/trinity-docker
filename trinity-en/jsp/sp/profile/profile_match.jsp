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
BusinessCollection list = RequestHelper.getBusinessCollection(request,"list");
BusinessCollection factors = RequestHelper.getBusinessCollection(request,"factors");
%>

<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
<i class="fas fa-hands-helping"></i>&nbsp;The Factor's Match Condition Management
    </h3>	
    <p>
      항목을 선택해 주는 조건을 설정하는 화면입니다.
    </p>
  </div>
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">항목 이름</th>
        <th scope="col">매칭 항목 이름</th>
        <th scope="col">매칭 조건</th>
        <th scope="col">매칭 값</th>
        <th scope="col">기능</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td>
           <select id="factor_name" name="factor_name" class="styled">
<%
  if(factors != null && factors.size() > 0) {
    for(int i = 0; i < factors.size() ; i++){
      String factor_name = factors.getBusinessData(i).getFieldValue("factor_name");
 %>
   <option value='<%=factor_name%>'><%=factor_name%></option>
 <%
     }
  }
 %>
           <select>
        </td>

        <td><input type="text" id="match_name" name="match_name" class="styled" ></td>
        <td>
            <select id="equal_yn" name="equal_yn" class="styled">
              <option value='Y'>=</option>
              <option value='N'><></option>
            </select>
        </td>
        <td><input type="text" id="match_value" name="match_value" class="styled" ></td>
        <td><button type="button" class="btn btn-primary" id="add">추가</button>
            <button type="button" class="btn btn-secondary" id="modify">수정</button>
            <button type="button" class="btn btn-danger" id="delete">삭제</button></td>
      </tr>
      </tbody>
    </table>
    <table class="table">
      <thead>
      <tr>
        <th scope="col">항목 이름</th>
        <th scope="col">매칭 항목 이름</th>
        <th scope="col">매칭 조건</th>
        <th scope="col">매칭 값</th>
        <th scope="col">기능</th>
      </tr>
      </thead>
      <tbody>

 <%
  if(list != null && list.size() > 0) {
    for(int i = 0; i < list.size() ; i++){
      String factor_name = list.getBusinessData(i).getFieldValue("factor_name");
      String match_name = list.getBusinessData(i).getFieldValue("match_name");
      String match_value = list.getBusinessData(i).getFieldValue("match_value");
      String equal_yn = list.getBusinessData(i).getFieldValue("equal_yn");
 %>
   <tr>
   <td><%=factor_name%></td><td><%=match_name%></td><td><%=match_value%></td><td><%=equal_yn%></td><td><button type="button" class="btn btn-primary" onClick="fnSetData('<%=factor_name%>','<%=match_name%>','<%=match_value%>','<%=equal_yn%>')">선택</button></td>
   </tr>
 <%
     }
  }
 %>

    </div>
  </div>

<script language="javascript">
$(document).ready(function(){
  $('#select_match_name').change(()=>{
     var v = $("#select_match_name option:selected").val();
     var vs = v.split('|');
     $('#factor_name').val(vs[0]);
     $('#match_name').val(vs[1]);
     $('#match_equal').val(vs[2]);
     $('#match_value').val(vs[3]);
  }); 
  $('#add').click(()=>{
     fnCreate();
  }); 
  $('#modify').click(()=>{
     fnModify();
  }); 
  $('#delete').click(()=>{
     fnDelete();
  }); 


});

function fnDelete(){
  if(!confirm('삭제 하시겠습니까?')) return;
  var d = {factor_name : $('#factor_name').val(), match_name : $('#match_name').val(),match_value: $('#match_value').val(),equal_yn: $('#equal_yn').val()};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_106294255311682145141873' ,
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

function fnSetData(factor_name,match_name,match_value,equal_yn){
   $('#factor_name').val(factor_name);   
   $('#match_name').val(match_name);
   $('#match_value').val(match_value);
   $('#equal_yn').val(equal_yn);
}

function fnModify(){
  if(!confirm('수정 하시겠습니까?')) return;
  var d = {factor_name : $('#factor_name').val(), match_name : $('#match_name').val(),match_value: $('#match_value').val(),equal_yn: $('#equal_yn').val()};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_108797127921682145127611' ,
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
  var d = {factor_name : $('#factor_name').val(), match_name : $('#match_name').val(),match_value: $('#match_value').val(),equal_yn: $('#equal_yn').val()};        
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_101485846841682145098471' ,
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
