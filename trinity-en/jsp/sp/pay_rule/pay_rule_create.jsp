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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"SERVICE_list");
BusinessCollection bc2 = RequestHelper.getBusinessCollection(request,"USER_TYPE_list");
%>
<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
구매 룰 정보 입력
    </h3>	
  <span style="text-align:right">
   <button class="btn btn-primary" id="backToList"><< 목록으로 돌아가기</button>
  </span>
  <span style="text-align:right">
   <button class="btn btn-secondary" id="save"">저장하기</button>
  </span>

  </div>
  <form name="frmPayRule" id="frmPayRule" method="POST">
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">이름</th>
        <th scope="col">값</th>
      </tr>
      </thead>
      <tr><td>서비스</td><td>
          <select id="SVC_KEY" name="SVC_KEY" class="styled">
              <option value="*">모두</option>
          <%
             if(bc.size() > 0){
               for(int i = 0; i < bc.size(); i++){
          %>
              <option value="<%=bc.getBusinessData(i).getFieldValue("SVC_KEY")%>"><%=bc.getBusinessData(i).getFieldValue("SVC_NAME")%></option>
          <%
              }
            }
          %>
          </select>
      </td></tr>
      <tr><td>고객 유형</td><td>
          <select id="USR_TYPE_KEY" name="USR_TYPE_KEY" class="styled">
              <option value="*">모두</option>
          <%
             if(bc2.size() > 0){
               for(int i = 0; i < bc2.size(); i++){
          %>
              <option value="<%=bc2.getBusinessData(i).getFieldValue("USR_TYPE_KEY")%>"><%=bc2.getBusinessData(i).getFieldValue("USR_TYPE_NAME")%></option>
          <%
              }
            }
          %>
          </select>

      </td></tr>
      <tr><td>사이트 유형</td><td>
          <select id="SITE_KEY" name="SITE_KEY" class="styled">
              <option value="*">모두</option>
              <option value="DUNA.SAAS">챗봇 SAAS</option>
          </select>
      </td></tr>
      <tr><td>멤버십 기간</td><td><input type="text" name="MSHP_PERIOD" id="MSHP_PERIOD" value="" size="10"> 일</td></tr>
      <tr><td>멤버십 횟수</td><td><input type="text" name="MSHP_COUNT" id="MSHP_COUNT" value="" size="10"> 회</td></tr>
      <tr><td>사용여부</td><td><input type="checkbox" name="MSHP_YN" id="MSHP_YN" class="styled" checked>사용함</td></tr>
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
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_105366569981582151932063';
  return false;
});

$('#save').on('click', function(event) {
  save();
});

function save(){
  with(frmPayRule){
    if(SVC_KEY.value == '' || USR_TYPE_KEY.value == '' || SITE_KEY.value == '' || (isNaN(MSHP_PERIOD.value) && isNaN(MSHP_COUNT.value))){
       alert("Please check input field");
       return;
    }

    var d = {SVC_KEY: $('#SVC_KEY').val()
           , USR_TYPE_KEY: $('#USR_TYPE_KEY').val()
           , SITE_KEY: $('#SITE_KEY').val()
           , MSHP_PERIOD: $('#MSHP_PERIOD').val()
           , MSHP_YN: $('#MSHP_YN').is(":checked") == true ? 'Y' : 'N'
           , MSHP_COUNT: $('#MSHP_COUNT').val()
           , code : "create"
           };

    $.ajax({
      url: "/Anaconda.json?CMD=CMD_SEQ_109209733671582152078140",
      data: d,
      type : "POST",
      dataType: "json",
      success : function (data) {
        alertPopup('Success', 'Congratulation Your request was succeed');
        document.location.href="/Anaconda.do?CMD=CMD_SEQ_105366569981582151932063";
      },error : function (err) {
        alertPopup("Sorry", "Your request was failed");        
      }
    });
  }
}
</script>
