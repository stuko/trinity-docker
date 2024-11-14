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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"OAUTH_TOKEN_read");
%>
<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
OAuth 정보 수정
    </h3>	
  <span style="text-align:right">
   <button class="btn btn-primary" id="backToList"><< 목록으로 돌아가기</button>
  </span>
  <span style="text-align:right">
   <button class="btn btn-secondary" id="save"">저장하기</button>
  </span>

  </div>
  <form name="frmOAuth" id="frmOAuth" method="POST">
  <input type="hidden" id="OT_KEY" name="OT_KEY" value="<%=bc.getBusinessData(0).getFieldValue("OT_KEY")%>">
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">이름</th>
        <th scope="col">값</th>
      </tr>
      </thead>
      <tr><td>사이트 이름</td><td><input type="text" name="OT_SITE" id="OT_SITE" size="40" value="<%=bc.getBusinessData(0).getFieldValue("OT_SITE")%>" class="styled"></td></tr>
      <tr><td>CLIENT ID</td><td><input type="text" name="OT_CLIENTID" id="OT_CLIENTID" size="70"value="<%=bc.getBusinessData(0).getFieldValue("OT_CLIENTID")%>"  class="styled"></td></tr>
      <tr><td>SECRET KEY</td><td><input type="text" name="OT_SECRETKEY" id="OT_SECRETKEY" size="70" value="<%=bc.getBusinessData(0).getFieldValue("OT_SECRETKEY")%>" class="styled"></td></tr>
      <tr><td>인증키</td><td><input type="text" name="OT_TMP_KEY" id="OT_TMP_KEY" size="70" value="<%=bc.getBusinessData(0).getFieldValue("OT_TMP_KEY")%>" class="styled"></td></tr>
      <tr><td>토큰</td><td><input type="text" name="OT_TOKEN" id="OT_TOKEN" size="70" value="<%=bc.getBusinessData(0).getFieldValue("OT_TOKEN")%>" class="styled">&nbsp;<span><%=bc.getBusinessData(0).getFieldValue("OT_ISSUED")%></span></td></tr>
      <tr><td>리프레시 토큰</td><td><input type="text" name="OT_RF_TOKEN" id="OT_RF_TOKEN" size="70" value="<%=bc.getBusinessData(0).getFieldValue("OT_RF_TOKEN")%>" class="styled">
          &nbsp;<span><button type="button" class="btn btn-danger" onClick="javascript:fnRefresh('<%=bc.getBusinessData(0).getFieldValue("OT_KEY")%>')">리프레시 토큰</button></span>
      </td></tr>
      <tr><td>인증요청 URL</td><td><input type="text" name="OT_REQ_AUTH_URL" id="OT_REQ_AUTH_URL" value="<%=bc.getBusinessData(0).getFieldValue("OT_REQ_AUTH_URL")%>" size="100" class="styled">
          <p style="color:blue">{=OT_CLIENTID} : 클라이언트 아이디 ,  {=OT_KEY} : 인증후 검증키 ,  {=OT_REDIRECT_AUTH_URL} : 콜백 URL  </p>
      </td></tr>
      <tr><td>토큰요청 URL</td><td><input type="text" name="OT_REQ_TOKEN_URL" id="OT_REQ_TOKEN_URL" value="<%=bc.getBusinessData(0).getFieldValue("OT_REQ_TOKEN_URL")%>" size="100" class="styled"></td></tr>
      <tr><td>토큰재요청 URL</td><td><input type="text" name="OT_REQ_RF_TOKEN_URL" id="OT_REQ_RF_TOKEN_URL" value="<%=bc.getBusinessData(0).getFieldValue("OT_REQ_RF_TOKEN_URL")%>" size="100" class="styled"></td></tr>
      <tr><td>인증콜백 URL</td><td><input type="text" name="OT_REDIRECT_AUTH_URL" id="OT_REDIRECT_AUTH_URL" value="<%=bc.getBusinessData(0).getFieldValue("OT_REDIRECT_AUTH_URL")%>" size="100" class="styled"></td></tr>
      <tr><td>토큰콜백 URL</td><td><input type="text" name="OT_REDIRECT_TOKEN_URL" id="OT_REDIRECT_TOKEN_URL" value="<%=bc.getBusinessData(0).getFieldValue("OT_REDIRECT_TOKEN_URL")%>" size="100" class="styled"></td></tr>
      <tr><td>토큰 만료시간</td><td><input type="text" name="OT_EXPIRED_HOUR" id="OT_EXPIRED_HOUR" value="<%=bc.getBusinessData(0).getFieldValue("OT_EXPIRED_HOUR")%>" size="10" class="styled">시간</td></tr>
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
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_104852409371584337907993';
  return false;
});

$('#save').on('click', function(event) {
  save();
});
function fnRefresh(k){
  if(confirm('Really refresh token????')){
    document.location.href='/Anaconda.do?CMD=CMD_SEQ_101729364301584396674100&OT_KEY='+$('#OT_KEY').val();
  /*
  var d = {OT_KEY: $('#OT_KEY').val()};
  $.ajax({
    url: "/Anaconda.do?CMD=CMD_SEQ_101729364301584396674100",
    data: d,
    type : "POST",
    dataType: "json",
    success : function (data) {
      alertPopup('Success', 'Congratulation Your request was succeed');
      console.log(data);   
      // document.location.href="/Anaconda.do?CMD=CMD_SEQ_104852409371584337907993";
    },error : function (err) {
      console.log(err);   
      alertPopup("Sorry", "Your request was failed");        
    }
  });
  */
  }
}

function save(){
  with(frmOAuth){
    if(OT_SITE.value == ''
   || OT_CLIENTID.value == ''
   || OT_SECRETKEY.value == ''
 //  || OT_TMP_KEY.value == ''
 //  || OT_TOKEN.value == ''
 //  || OT_RF_TOKEN.value == ''
 //  || OT_REQ_AUTH_URL.value == ''
 //  || OT_REQ_TOKEN_URL.value == ''
   || OT_EXPIRED_HOUR.value == ''
){
       alert("Please check input field");
       return;
    }

    var d = {OT_SITE: $('#OT_SITE').val()
           , OT_CLIENTID: $('#OT_CLIENTID').val()
           , OT_SECRETKEY: $('#OT_SECRETKEY').val()
           , OT_TMP_KEY: $('#OT_TMP_KEY').val()
           , OT_TOKEN: $('#OT_TOKEN').val()
           , OT_RF_TOKEN: $('#OT_RF_TOKEN').val()
           , OT_REQ_AUTH_URL: $('#OT_REQ_AUTH_URL').val()
           , OT_REQ_TOKEN_URL: $('#OT_REQ_TOKEN_URL').val()
           , OT_REQ_RF_TOKEN_URL: $('#OT_REQ_RF_TOKEN_URL').val()
           , OT_REDIRECT_AUTH_URL: $('#OT_REDIRECT_AUTH_URL').val()
           , OT_REDIRECT_TOKEN_URL: $('#OT_REDIRECT_TOKEN_URL').val()
           , OT_EXPIRED_HOUR: $('#OT_EXPIRED_HOUR').val()
           , OT_KEY: $('#OT_KEY').val()
           };

    $.ajax({
      url: "/Anaconda.json?CMD=CMD_SEQ_105147357001584339131564",
      data: d,
      type : "POST",
      dataType: "json",
      success : function (data) {
        alertPopup('Success', 'Congratulation Your request was succeed');
        document.location.href="/Anaconda.do?CMD=CMD_SEQ_104852409371584337907993";
      },error : function (err) {
        alertPopup("Sorry", "Your request was failed");        
      }
    });
  }
}
</script>
