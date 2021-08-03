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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"selectIntentGroup");
%>
<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
<i class="fas fa-cubes"></i>&nbsp;대화 의도 그룹 정보 수정
    </h3>	
  <span style="text-align:right">
   <button class="btn btn-primary" id="backToList"><< 목록으로 돌아가기</button>
  </span>
  <span style="text-align:right">
   <button class="btn btn-info" id="intentList" onClick="javascript:fnIntentList('<%=bc.getBusinessData(0).getFieldValue("IG_KEY")%>');">의도목록</button>
  </span>
  <span style="text-align:right">
   <button class="btn btn-secondary" id="save">저장하기</button>
  </span>

  </div>
  <form name="frmIntentGroup" id="frmIntentGroup" method="POST" action="/Anaconda.json?CMD=CMD_SEQ_105647724561580253307574">
  <input type="hidden" name="IG_KEY" id="IG_KEY" value="<%=bc.getBusinessData(0).getFieldValue("IG_KEY")%>" />
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">이름</th>
        <th scope="col">값</th>
      </tr>
      </thead>
      <tr><td>대화 의도 이름</td><td><input type="text" name="IG_NAME" id="IG_NAME" size="70" class="styled" value='<%=bc.getBusinessData(0).getFieldValue("IG_NAME")%>'></td></tr>
      <tr><td>대화 의도 태그</td><td><input type="text" name="IG_TAG" id="IG_TAG" size="70" class="styled" value='<%=bc.getBusinessData(0).getFieldValue("IG_TAG")%>'></td></tr>
      <tbody>
      <tr>
      </tr>
      </tbody>
    </table>
  </div>
  </form>
</div>

<script>

$('#save').on('click', function(event) {
  save();
});

$('#backToList').on('click',function(event){
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_108015592941580175502168';
  return false;
});
function fnIntentList(seq){
   document.location.href = '/Anaconda.do?CMD=CMD_SEQ_106158749731580254604919&IG_KEY=' + seq;
}
function save(){
  with(frmIntentGroup){
    if(IG_NAME.value == '' || IG_TAG.value == ''){
       alert("Please check input field");
       return;
    }
  }
  var d = {IG_KEY: $('#IG_KEY').val() , IG_NAME : $('#IG_NAME').val(), IG_TAG : $('#IG_TAG').val()};
  post(d,'CMD_SEQ_105647724561580253307574',(data)=>{
        alert(JSON.stringify(data)); 
        showPopup('Success', 'Congratulation Your request was succeed',"/Anaconda.do?CMD=CMD_SEQ_108015592941580175502168");
        // document.location.href="/Anaconda.do?CMD=CMD_SEQ_108015592941580175502168";
      },()=>{
        showPopup("Sorry", "Your request was failed","");
  });


/*
    $.ajax({
      url: "/Anaconda.json?CMD=CMD_SEQ_105647724561580253307574",
      data: d,
      contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
      type : "POST",
      dataType: "json",
      success : function (data) {
        alertPopup('Success', 'Congratulation Your request was succeed');
        document.location.href="/Anaconda.do?CMD=CMD_SEQ_108015592941580175502168";
      },error : function (err) {
        alertPopup("Sorry", "Your request was failed");        
      }
    });
*/

}
</script>
