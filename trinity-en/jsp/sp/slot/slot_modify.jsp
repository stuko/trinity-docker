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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"INTENT_SLOT_read");
%>
<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
  <i class="fab fa-elementor"></i>&nbsp;"<%=bc.getBusinessData(0).getFieldValue("IT_NAME")%>" 의도 : 필수 질문 정보 수정
    </h3>	
  <span style="text-align:right">
   <button class="btn btn-primary" id="backToList"><< 의도 목록으로 돌아가기</button>
  </span>
  <span style="text-align:right">
   <button class="btn btn-info" id="backToSlotList"><< 필수질문목록으로 돌아가기</button>
  </span>
  <span style="text-align:right">
   <button class="btn btn-secondary" id="save"">저장하기</button>
  </span>

  </div>
  <form name="frmSlot" id="frmSlot" method="POST">
  <input type="hidden" name="SLOT_KEY" id="SLOT_KEY" value="<%=bc.getBusinessData(0).getFieldValue("SLOT_KEY")%>" />
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">이름</th>
        <th scope="col">값</th>
      </tr>
      </thead>
      <tr><td>필수 질문 순서</td><td><input type="text" name="SLOT_SEQ" id="SLOT_SEQ" class="styled" size="10" value="<%=bc.getBusinessData(0).getFieldValue("SLOT_SEQ")%>">&nbsp;번째</td></tr>
      <tr><td>필수 질문 항목 명</td><td><input type="text" name="SLOT_NAME" id="SLOT_NAME" class="styled" size="70" value="<%=bc.getBusinessData(0).getFieldValue("SLOT_NAME")%>"></td></tr>
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
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_106158749731580254604919&IG_KEY=<%=bc.getBusinessData(0).getFieldValue("IG_KEY")%>';
});

$('#backToSlotList').on('click',function(event){
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_109919745451582508889092&IT_KEY=<%=bc.getBusinessData(0).getFieldValue("IT_KEY")%>';
});

$('#save').on('click', function(event) {
  save();
});

function save(){
  with(frmSlot){
    if(SLOT_NAME.value == ''){
       alert("Please check input field");
       return;
    }

    var d = {SLOT_SEQ : $('#SLOT_SEQ').val(),SLOT_NAME : $('#SLOT_NAME').val(),SLOT_KEY: $('#SLOT_KEY').val()};

    $.ajax({
      url: "/Anaconda.json?CMD=CMD_SEQ_100943667921582509046636",
      data: d,
      type : "POST",
      dataType: "json",
      success : function (data) {
        alertPopup('Success', 'Congratulation Your request was succeed');
        document.location.href="/Anaconda.do?CMD=CMD_SEQ_106158749731580254604919&IG_KEY=<%=bc.getBusinessData(0).getFieldValue("IG_KEY")%>";
      },error : function (err) {
        alertPopup("Sorry", "Your request was failed");        
      }
    });
  }
}
</script>
