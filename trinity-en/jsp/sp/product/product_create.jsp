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

<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
상품 정보 입력
    </h3>	
  <span style="text-align:right">
   <button class="btn btn-primary" id="backToList"><< 목록으로 돌아가기</button>
  </span>
  <span style="text-align:right">
   <button class="btn btn-secondary" id="save"">저장하기</button>
  </span>

  </div>
  <form name="frmProduct" id="frmProduct" method="POST">
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">이름</th>
        <th scope="col">값</th>
      </tr>
      </thead>
      <tr><td>상품 이름</td><td><input type="text" name="PRD_NAME" id="PRD_NAME" size="70" class="styled"></td></tr>
      <tr><td>가격</td><td><input type="text" name="PRD_FIXED_PRICE" id="PRD_FIXED_PRICE" size="10" class="styled">원</td></tr>
      <tr><td>할인율</td><td><input type="text" name="PRD_FIXED_DC_RATE" id="PRD_FIXED_DC_RATE" size="10" class="styled">%</td></tr>
      <tr><td>소개</td><td><textarea name="PRD_INTRODUCE" id="PRD_INTRODUCE" cols=40 rows=3 class="styled"></textarea></td></tr>
      <tr><td>전시여부</td><td><input type="checkbox" name="PRD_DISPLAY_YN" id="PRD_DISPLAY_YN" class="styled" checked>전시함</td></tr>
      <tr><td>전시내용</td><td><textarea name="PRD_DISPLAY" id="PRD_DISPLAY" cols=40 rows=3 class="styled"></textarea></td></tr>
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
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_109386074031581898012096';
  return false;
});

$('#save').on('click', function(event) {
  save();
});

function save(){
  with(frmProduct){
    if(PRD_NAME.value == '' || PRD_FIXED_PRICE.value == '' || isNaN(PRD_FIXED_PRICE.value) || isNaN(PRD_FIXED_DC_RATE.value)){
       alert("Please check input field");
       return;
    }

    var d = {PRD_NAME: $('#PRD_NAME').val()
           , PRD_FIXED_PRICE: $('#PRD_FIXED_PRICE').val()
           , PRD_FIXED_DC_RATE: $('#PRD_FIXED_DC_RATE').val()
           , PRD_INTRODUCE: $('#PRD_INTRODUCE').val()
           , PRD_DISPLAY_YN: $('#PRD_DISPLAY_YN').is(":checked") == true ? 'Y' : 'N'
           , PRD_DISPLAY: $('#PRD_DISPLAY').val()
           , code : "create"
           };

    $.ajax({
      url: "/Anaconda.json?CMD=CMD_SEQ_101128537211581942262530",
      data: d,
      type : "POST",
      dataType: "json",
      success : function (data) {
        alertPopup('Success', 'Congratulation Your request was succeed');
        document.location.href="/Anaconda.do?CMD=CMD_SEQ_109386074031581898012096";
      },error : function (err) {
        alertPopup("Sorry", "Your request was failed");        
      }
    });
  }
}
</script>
