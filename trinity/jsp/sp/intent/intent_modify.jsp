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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"selectIntent");
%>
<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
<i class="fas fa-brain"></i>&nbsp;<%=bc.getBusinessData(0).getFieldValue("IG_NAME")%> : 대화 의도 정보 입력
    </h3>	
  <span style="text-align:right">
   <button class="btn btn-primary" id="backToIntentGroupList"><< 대화 의도 그룹 목록으로 돌아가기</button>
  </span>
  <span style="text-align:right">
   <button class="btn btn-primary" id="backToIntentList");"><< 대화 의도 목록으로 돌아가기</button>
  </span>
  <span style="text-align:right">
   <button class="btn btn-secondary" id="save"">수정하기</button>
  </span>

  </div>
  <form name="frmIntent" id="frmIntent" method="POST">
  <input type="hidden" name="IG_KEY" id="IG_KEY" value="<%=bc.getBusinessData(0).getFieldValue("IG_KEY")%>" />
  <input type="hidden" name="IT_KEY" id="IT_KEY" value="<%=bc.getBusinessData(0).getFieldValue("IT_KEY")%>" />
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">이름</th>
        <th scope="col">값</th>
      </tr>
      </thead>
      <tr><td>의도</td><td><input type="text" name="IT_NAME" id="IT_NAME" class="styled" size="70" value="<%=bc.getBusinessData(0).getFieldValue("IT_NAME")%>"></td></tr>
      <tr><td>설명</td><td><input type="text" name="IT_DESC" id="IT_DESC" class="styled" size="70" value="<%=bc.getBusinessData(0).getFieldValue("IT_DESC")%>"></td></tr>
      <tbody>
      <tr>
      </tr>
      </tbody>
    </table>
  </div>
  </form>
</div>

<script>
$('#backToIntentGroupList').on('click',function(event){
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_108015592941580175502168';
});
$('#backToIntentList').on('click',function(event){
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_106158749731580254604919&IG_KEY=<%=bc.getBusinessData(0).getFieldValue("IG_KEY")%>';
});

$('#save').on('click', function(event) {
  save();
});

function save(){
  with(frmIntent){
    if(IT_NAME.value == '' || IT_DESC.value == ''){
       alert("Please check input field");
       return;
    }

    var d = {IT_NAME : $('#IT_NAME').val(), IT_DESC : $('#IT_DESC').val(), IG_KEY : $('#IG_KEY').val(), IT_KEY : $('#IT_KEY').val()};

    $.ajax({
      url: "/Anaconda.json?CMD=CMD_SEQ_105526929231580335394688",
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
