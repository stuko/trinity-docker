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
<i class="fas fa-cubes"></i>&nbsp;대화 의도 그룹 정보 입력
    </h3>	
  <span style="text-align:right">
   <button class="btn btn-primary" id="backToList"><< 목록으로 돌아가기</button>
  </span>
  <span style="text-align:right">
   <button class="btn btn-secondary" id="save"">저장하기</button>
  </span>

  </div>
  <form name="frmIntentGroup" id="frmIntentGroup" method="POST">
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">이름</th>
        <th scope="col">값</th>
      </tr>
      </thead>
      <tr><td>대화 의도 이름</td><td><input type="text" name="IG_NAME" id="IG_NAME" size="70" class="styled"></td></tr>
      <tr><td>대화 의도 태그</td><td><input type="text" name="IG_TAG" id="IG_TAG" size="70" class="styled"></td></tr>
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
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_108015592941580175502168';
  return false;
});

$('#save').on('click', function(event) {
  save();
});

function save(){
  with(frmIntentGroup){
    if(IG_NAME.value == '' || IG_TAG.value == ''){
       alert("Please check input field");
       return;
    }

    var d = {IG_NAME : $('#IG_NAME').val(), IG_TAG : $('#IG_TAG').val()};

    $.ajax({
      url: "/Anaconda.json?CMD=CMD_SEQ_103069927251580192670958",
      data: d,
      type : "POST",
      dataType: "json",
      success : function (data) {
        alertPopup('Success', 'Congratulation Your request was succeed');
        document.location.href="/Anaconda.do?CMD=CMD_SEQ_108015592941580175502168";
      },error : function (err) {
        alertPopup("Sorry", "Your request was failed");        
      }
    });
  }
}
</script>
