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
  BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getMethodology");
%>


<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
프로젝트 정보 입력
    </h3>	
  <span style="text-align:right">
   <button class="btn btn-primary" id="backToList"><< 목록으로 돌아가기</button>
  </span>
  <span style="text-align:right">
   <button class="btn btn-secondary" id="save"">저장하기</button>
  </span>

  </div>
  <form name="frmProject" id="frmProject" method="POST">
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">이름</th>
        <th scope="col">값</th>
      </tr>
      </thead>
      <tr><td>프로젝트 이름</td><td><input type="text" name="ProjectName" id="ProjectName" size="70" class="styled"></td></tr>
      <tr><td>시작일자</td><td><input type="text" name="StartDateTime" id="StartDateTime" size="10" class="styled"></td></tr>
      <tr><td>종료일자</td><td><input type="text" name="EndDateTime" id="EndDateTime" size="10" class="styled"></td></tr>
      <tr><td>방법론</td><td>
        <select name="Methodology" id="Methodology">
             <option value="">선택해 주세요</option>
          <% if(bc != null && bc.size() > 0) { %>
           <%  for(int i = 0;i < bc.size() ; i++) { %>
             <option value="<%=bc.getBusinessData(i).getFieldValue("MethodologyCode")%>"><%=bc.getBusinessData(i).getFieldValue("MethodologyName")%></option>
           <% } %>
          <% } %>
        </select>
      </td></tr>
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
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_109503436111588560842324';
  return false;
});

$('#save').on('click', function(event) {
  save();
});

function save(){
  with(frmProject){
    if(ProjectName.value == '' || isNaN(StartDateTime.value) || isNaN(EndDateTime.value)){
       alert("Please check input field");
       return;
    }

    var d = {ProjectName: $('#ProjectName').val()
           , StartDateTime: $('#StartDateTime').val()
           , EndDateTime: $('#EndDateTime').val()
           , code : "create"
           };

    $.ajax({
      url: "/Anaconda.json?CMD=CMD_SEQ_101128537211581942262530",
      data: d,
      type : "POST",
      dataType: "json",
      success : function (data) {
        alertPopup('Success', 'Congratulation Your request was succeed');
        document.location.href="/Anaconda.do?CMD=CMD_SEQ_109503436111588560842324";
      },error : function (err) {
        alertPopup("Sorry", "Your request was failed");        
      }
    });
  }
}
</script>
