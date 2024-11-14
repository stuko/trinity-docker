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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"INTENT_SLOT_QUEST_read");
%>
<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
   <i class="fas fa-question-circle"></i>&nbsp; "<%=bc.getBusinessData(0).getFieldValue("SLOT_NAME")%>" 필수 질문 > 문장 수정
    </h3>	
  <span style="text-align:right">
   <button class="btn btn-primary" id="backToList"><< 필수 질문 목록으로 돌아가기</button>
  </span>
  <span style="text-align:right">
   <button class="btn btn-info" id="backToQuestList"><< 문장 목록으로 돌아가기</button>
  </span>
  <span style="text-align:right">
   <button class="btn btn-secondary" id="save"">수정하기</button>
  </span>

  </div>
  <form name="frmSlotQuest" id="frmSlotQuest" method="POST">
  <input type="hidden" name="QST_KEY" id="QST_KEY" value="<%=bc.getBusinessData(0).getFieldValue("QST_KEY")%>" />
  <input type="hidden" name="SLOT_KEY" id="SLOT_KEY" value="<%=bc.getBusinessData(0).getFieldValue("SLOT_KEY")%>" />
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">이름</th>
        <th scope="col">값</th>
      </tr>
      </thead>
      <tr><td>문장</td><td><textarea rows="3" cols="70" name="QST_SENTENCE" id="QST_SENTENCE" class="styled" size="70" ><%=bc.getBusinessData(0).getFieldValue("QST_SENTENCE")%></textarea></td></tr>
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
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_109919745451582508889092&IT_KEY=<%=bc.getBusinessData(0).getFieldValue("IT_KEY")%>';
});
$('#backToQuestList').on('click',function(event){
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_103180830071582583079388&SLOT_KEY=<%=bc.getBusinessData(0).getFieldValue("SLOT_KEY")%>';
});

$('#save').on('click', function(event) {
  save();
});

function save(){
  with(frmSlotQuest){
    if(QST_SENTENCE.value == ''){
       alert("Please check input field");
       return;
    }

    var d = {QST_KEY: $('#QST_KEY').val(),SLOT_KEY: $('#SLOT_KEY').val(),QST_SENTENCE: $('#QST_SENTENCE').val()};

    $.ajax({
      url: "/Anaconda.json?CMD=CMD_SEQ_102730565491582583595538",
      data: d,
      type : "POST",
      dataType: "json",
      success : function (data) {
        alertPopup('Success', 'Congratulation Your request was succeed');
        document.location.href="/Anaconda.do?CMD=CMD_SEQ_103180830071582583079388&SLOT_KEY=<%=bc.getBusinessData(0).getFieldValue("SLOT_KEY")%>";
      },error : function (err) {
        alertPopup("Sorry", "Your request was failed");        
      }
    });
  }
}
</script>
