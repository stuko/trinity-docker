<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.xtreme.site.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
BusinessCollection bc2 = RequestHelper.getBusinessCollection(request,"PRODUCT_ALL");
BusinessCollection bc3 = RequestHelper.getBusinessCollection(request,"PRODUCT_PORT");
%>
<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
상품 포트폴리오 정보 입력
    </h3>	
  <span style="text-align:right">
   <button class="btn btn-primary" id="backToList"><< 목록으로 돌아가기</button>
  </span>
  <span style="text-align:right">
   <button class="btn btn-secondary" id="save"">저장하기</button>
  </span>

  </div>
  <form name="frmProductPortfolio" id="frmProductPortfolio" method="POST">
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">이름</th>
        <th scope="col">값</th>
      </tr>
      </thead>
      <tr><td>상품 포트폴리오 이름</td><td><input type="text" name="PORT_NAME" id="PORT_NAME" size="70" class="form-control"></td></tr>
      <tr><td>포트폴리오 가격</td><td><input type="text" name="PORT_FIXED_PRICE" id="PORT_FIXED_PRICE" size="10" class="form-control">원</td></tr>
      <tr><td>상품 포트폴리오 할인율</td><td><input type="text" name="PORT_FIXED_DC_RATE" id="PORT_FIXED_DC_RATE" size="10" class="form-control">%</td></tr>
      <tr><td>상품 포트폴리오 소개</td><td><textarea name="PORT_INTRODUCE" id="PORT_INTRODUCE" cols=40 rows=3 class="form-control"></textarea></td></tr>
      <tr><td>상품 포트폴리오 전시여부</td><td><input type="checkbox" name="PORT_DISPLAY_YN" id="PORT_DISPLAY_YN" class="form-control" checked>전시함</td></tr>
      <tr><td>상품 포트폴리오 전시내용</td><td><textarea name="PORT_DISPLAY" id="PORT_DISPLAY" cols=40 rows=3 class="form-control"></textarea></td></tr>
      <tbody>
      <tr>
      </tr>
      </tbody>
    </table>
  </div>

    <div class="table-responsive" style="display:none">
    <div>
  <span style="text-align:right">
   상품 정보
  </span>

  <span style="text-align:right">
   <select name="PRD_KEY" id="PRD_KEY">
     <option value="NA">추가할 상품을 선택해 주세요</option>
   <% for(int i = 0; i < bc2.size() ; i++){ %>
      <option value="<%=bc2.getBusinessData(i).getFieldValue("PRD_KEY")%>"><%=bc2.getBusinessData(i).getFieldValue("PRD_NAME")%></option>
   <% } %>
   </select>
  </span>

  <span style="text-align:right">
   <button class="btn btn-secondary" id="add">추가하기</button>
  </span>

    </div>
    <table class="table">
      <thead>
      <tr>
        <th scope="col">상품명</th>
        <th scope="col">삭제</th>
      </tr>
      </thead>
      <tbody>
<% if(bc3 != null && bc3.size() > 0) { %>
   <% for(int i = 0; i < bc3.size() ; i++){ %>
      <tr><td><%=bc3.getBusinessData(i).getFieldValue("PRD_NAME")%></td><td><button class="btn btn-danger" onClick="javascript:del('<%=bc3.getBusinessData(i).getFieldValue("PRD_KEY")%>')">삭제하기</button></td></tr>
   <% } %>
<% } %>
      <tbody>
      <tr>
      </tr>
      </tbody>
    </table>
  </div>

  </form>
</div>

<script>
$('#backToList').on('click',function(event){
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_104533676171581894345412';
  return false;
});

$('#save').on('click', function(event) {
  save();
});

function save(){

  with(frmProductPortfolio){
    if(PORT_NAME.value == '' || PORT_FIXED_PRICE.value == '' || isNaN(PORT_FIXED_PRICE.value) || isNaN(PORT_FIXED_DC_RATE.value)){
       alert("Please check input field");
       return;
    }

    var d = {PORT_NAME: $('#PORT_NAME').val()
           , PORT_FIXED_PRICE: $('#PORT_FIXED_PRICE').val()
           , PORT_FIXED_DC_RATE: $('#PORT_FIXED_DC_RATE').val()
           , PORT_INTRODUCE: $('#PORT_INTRODUCE').val()
           , PORT_DISPLAY_YN: $('#PORT_DISPLAY_YN').is(":checked") == true ? 'Y' : 'N'
           , PORT_DISPLAY: $('#PORT_DISPLAY').val()
           , code : "create"
           };

    $.ajax({
      url: "/Anaconda.json?CMD=CMD_SEQ_106445277501582001516656",
      data: d,
      type : "POST",
      dataType: "json",
      success : function (data) {
        alertPopup('Success', 'Congratulation Your request was succeed');
        document.location.href="/Anaconda.do?CMD=CMD_SEQ_104533676171581894345412";
      },error : function (err) {
        alertPopup("Sorry", "Your request was failed");        
      }
    });
  }
}


$('#add').on('click', function(event) {
  if($('#PRD_KEY').val() == 'NA'){
    alert("Please selecte a product");
    return false;
  }
  add();
});

function add(){

  with(frmProductPortfolio){

    var d = {
             PORT_KEY: $('#PORT_KEY').val()           
           , PRD_KEY: $('#PRD_KEY').val()           
           , code : "create"
           };

    $.ajax({
      url: "/Anaconda.json?CMD=CMD_SEQ_108612901831582005809722",
      data: d,
      type : "POST",
      dataType: "json",
      success : function (data) {
        alertPopup('Success', 'Congratulation Your request was succeed');
        document.location.href="/Anaconda.do?CMD=CMD_SEQ_108070811561582003672550&PORT_KEY=" + $('#PORT_KEY').val();
      },error : function (err) {
        alertPopup("Sorry", "Your request was failed");        
      }
    });
  }
}

function del(P){

  with(frmProductPortfolio){

    var d = {
             PORT_KEY: $('#PORT_KEY').val()           
           , PRD_KEY: P           
           , code : "delete"
           };

    $.ajax({
      url: "/Anaconda.json?CMD=CMD_SEQ_101771828451582005840701",
      data: d,
      type : "POST",
      dataType: "json",
      success : function (data) {
        alertPopup('Success', 'Congratulation Your request was succeed');
        document.location.href="/Anaconda.do?CMD=CMD_SEQ_108070811561582003672550&PORT_KEY=" + $('#PORT_KEY').val();
      },error : function (err) {
        alertPopup("Sorry", "Your request was failed");        
      }
    });
  }
}

</script>
