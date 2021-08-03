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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"SERVICE_read");
String display = "Y".equals(bc.getBusinessData(0).getFieldValue("SVC_YN")) ? "checked" : "";
%>
<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
서비스 정보 수정
    </h3>	
  <span style="text-align:right">
   <button class="btn btn-primary" id="backToList"><< 목록으로 돌아가기</button>
  </span>
  <span style="text-align:right">
   <button class="btn btn-secondary" id="save"">저장하기</button>
  </span>

  </div>
  <form name="frmService" id="frmService" method="POST">
  <input type="hidden" name="SVC_KEY" id="SVC_KEY" value="<%=bc.getBusinessData(0).getFieldValue("SVC_KEY")%>">
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">이름</th>
        <th scope="col">값</th>
      </tr>
      </thead>
      <tr><td>서비스 이름</td><td><input type="text" name="SVC_NAME" id="SVC_NAME" size="70" class="styled" value="<%=bc.getBusinessData(0).getFieldValue("SVC_NAME")%>"></td></tr>
      <tr><td>서비스 소개</td><td><textarea name="SVC_INTRODUCE" id="SVC_INTRODUCE" cols=40 rows=3 class="styled"><%=bc.getBusinessData(0).getFieldValue("SVC_INTRODUCE")%></textarea></td></tr>
      <tr><td>서비스 사용여부</td><td><input type="checkbox" name="SVC_YN" id="SVC_YN" class="styled" <%=display%>>사용함</td></tr>
      <tr><td>서비스 상세내용</td><td><textarea name="SVC_DESC" id="SVC_DESC" cols=40 rows=3 class="styled"><%=bc.getBusinessData(0).getFieldValue("SVC_DESC")%></textarea></td></tr>
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
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_103736959391582064326654';
  return false;
});

$('#save').on('click', function(event) {
  save();
});

function save(){

  with(frmService){
    if(SVC_NAME.value == ''){
       alert("Please check input field");
       return;
    }

    var d = {SVC_NAME: $('#SVC_NAME').val()
           , SVC_KEY: $('#SVC_KEY').val()
           , SVC_INTRODUCE: $('#SVC_INTRODUCE').val()
           , SVC_YN: $('#SVC_YN').is(":checked") == true ? 'Y' : 'N'
           , SVC_DESC: $('#SVC_DESC').val()
           , code : "update"
           };

    $.ajax({
      url: "/Anaconda.json?CMD=CMD_SEQ_100332352401582066992509",
      data: d,
      type : "POST",
      dataType: "json",
      success : function (data) {
        alertPopup('Success', 'Congratulation Your request was succeed');
        document.location.href="/Anaconda.do?CMD=CMD_SEQ_103736959391582064326654";
      },error : function (err) {
        alertPopup("Sorry", "Your request was failed");        
      }
    });
  }
}


</script>
