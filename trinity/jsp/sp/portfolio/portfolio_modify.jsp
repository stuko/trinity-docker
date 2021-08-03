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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"PRODUCT_PORTFOLIO_read");
BusinessCollection bc2 = RequestHelper.getBusinessCollection(request,"PRODUCT_ALL");
BusinessCollection bc3 = RequestHelper.getBusinessCollection(request,"PRODUCT_PORT");
BusinessCollection bc4 = RequestHelper.getBusinessCollection(request,"PORT_SVC_REL_selected");
BusinessCollection bc5 = RequestHelper.getBusinessCollection(request,"ref_SERVICE_list");

String display = "Y".equals(bc.getBusinessData(0).getFieldValue("PORT_DISPLAY_YN")) ? "checked" : "";
%>
<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
상품 포트폴리오 정보 수정
    </h3>	
  <span style="text-align:right">
   <button class="btn btn-primary" id="backToList"><< 목록으로 돌아가기</button>
  </span>
  <span style="text-align:right">
   <button class="btn btn-secondary" id="save"">저장하기</button>
  </span>

  </div>
  <form name="frmProductPortfolio" id="frmProductPortfolio" method="POST">
  <input type="hidden" name="PORT_KEY" id="PORT_KEY" value="<%=bc.getBusinessData(0).getFieldValue("PORT_KEY")%>">
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">이름</th>
        <th scope="col">값</th>
      </tr>
      </thead>
      <tr><td>상품 포트폴리오 이름</td><td><input type="text" name="PORT_NAME" id="PORT_NAME" size="70" class="styled"   value="<%=bc.getBusinessData(0).getFieldValue("PORT_NAME")%>"></td></tr>
      <tr><td>포트폴리오 가격</td><td><input type="text" name="PORT_FIXED_PRICE" id="PORT_FIXED_PRICE" size="10" class="styled"  value="<%=bc.getBusinessData(0).getFieldValue("PORT_FIXED_PRICE")%>">원</td></tr>
      <tr><td>상품 포트폴리오 할인율</td><td><input type="text" name="PORT_FIXED_DC_RATE" id="PORT_FIXED_DC_RATE" size="10" class="styled"  value="<%=bc.getBusinessData(0).getFieldValue("PORT_FIXED_DC_RATE")%>">%</td></tr>
      <tr><td>상품 포트폴리오 소개</td><td><textarea name="PORT_INTRODUCE" id="PORT_INTRODUCE" cols=40 rows=3 class="styled"><%=bc.getBusinessData(0).getFieldValue("PORT_INTRODUCE")%></textarea></td></tr>
      <tr><td>상품 포트폴리오 전시여부</td><td><input type="checkbox" name="PORT_DISPLAY_YN" id="PORT_DISPLAY_YN" class="styled" <%=display%>>전시함</td></tr>
      <tr><td>상품 포트폴리오 전시내용</td><td><textarea name="PORT_DISPLAY" id="PORT_DISPLAY" cols=40 rows=3 class="styled"><%=bc.getBusinessData(0).getFieldValue("PORT_DISPLAY")%></textarea></td></tr>
      <tbody>
      <tr>
      </tr>
      </tbody>
    </table>
  </div>
  <div class="table-responsive">
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


  <div class="table-responsive">
    <div>
  <span style="text-align:right">
   서비스 정보
  </span>

  <span style="text-align:right">
   <select name="SVC_KEY" id="SVC_KEY">
     <option value="NA">추가할 서비스를 선택해 주세요</option>
   <% for(int i = 0; i < bc5.size() ; i++){ %>
      <option value="<%=bc5.getBusinessData(i).getFieldValue("SVC_KEY")%>"><%=bc5.getBusinessData(i).getFieldValue("SVC_NAME")%></option>
   <% } %>
   </select>
  </span>

  <span style="text-align:right">
   <button class="btn btn-secondary" id="add_svc">추가하기</button>
  </span>

    </div>
    <table class="table">
      <thead>
      <tr>
        <th scope="col">서비스명</th>
        <th scope="col">삭제</th>
      </tr>
      </thead>
      <tbody>
<% if(bc4 != null && bc4.size() > 0) { %>
   <% for(int i = 0; i < bc4.size() ; i++){ %>
      <tr><td><%=bc4.getBusinessData(i).getFieldValue("SVC_NAME")%></td><td><button class="btn btn-danger" onClick="javascript:del_svc('<%=bc4.getBusinessData(i).getFieldValue("SVC_KEY")%>')">삭제하기</button></td></tr>
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

$('#add').on('click', function(event) {
  if($('#PRD_KEY').val() == 'NA'){
    alert("Please selecte a product");
    return false;
  }
  add();
});
$('#add_svc').on('click', function(event) {
  if($('#SVC_KEY').val() == 'NA'){
    alert("Please selecte a service");
    return false;
  }
  add_svc();
});


function save(){

  with(frmProductPortfolio){
    if(PORT_NAME.value == '' || PORT_FIXED_PRICE.value == '' || isNaN(PORT_FIXED_PRICE.value) || isNaN(PORT_FIXED_DC_RATE.value)){
       alert("Please check input field");
       return;
    }

    var d = {PORT_NAME: $('#PORT_NAME').val()
           , PORT_KEY: $('#PORT_KEY').val()           
           , PORT_FIXED_PRICE: $('#PORT_FIXED_PRICE').val()
           , PORT_FIXED_DC_RATE: $('#PORT_FIXED_DC_RATE').val()
           , PORT_INTRODUCE: $('#PORT_INTRODUCE').val()
           , PORT_DISPLAY_YN: $('#PORT_DISPLAY_YN').is(":checked") == true ? 'Y' : 'N'
           , PORT_DISPLAY: $('#PORT_DISPLAY').val()
           , code : "update"
           };

    $.ajax({
      url: "/Anaconda.json?CMD=CMD_SEQ_104238711601582003849640",
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

function add_svc(){

  with(frmProductPortfolio){

    var d = {
             PORT_KEY: $('#PORT_KEY').val()           
           , SVC_KEY: $('#SVC_KEY').val()           
           , code : "create"
           };

    $.ajax({
      url: "/Anaconda.json?CMD=CMD_SEQ_104869749331582238626925",
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

function del_svc(S){

  with(frmProductPortfolio){

    var d = {
             PORT_KEY: $('#PORT_KEY').val()           
           , SVC_KEY: S           
           , code : "delete"
           };

    $.ajax({
      url: "/Anaconda.json?CMD=CMD_SEQ_104694920191582238602326",
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
