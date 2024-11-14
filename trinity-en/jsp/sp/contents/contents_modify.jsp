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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getContents");
String CTNT_TYPE = bc.getBusinessData(0).getFieldValue("CTNT_TYPE");
CTNT_TYPE = CTNT_TYPE == null ? "I" : CTNT_TYPE;
String CTNT = "이미지";
if("I".equals(CTNT_TYPE)) CTNT = "이미지";
else if("T".equals(CTNT_TYPE)) CTNT = "텍스트";
else if("B".equals(CTNT_TYPE)) CTNT = "배너";
else if("H".equals(CTNT_TYPE)) CTNT = "HTML(5)";

%>

<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
대화 컨텐츠(<%=CTNT%>) 정보 입력
    </h3>	
  <span style="text-align:right">
   <button class="btn btn-primary" id="backToList"><< 목록으로 돌아가기</button>
  </span>
  <span style="text-align:right">
   <button class="btn btn-secondary" id="save"">저장하기</button>
  </span>

  </div>

  <form name="frmContentsImage" id="frmContentsImage" method="POST">
   <input type="hidden" id="CTNT_KEY" name="CTNT_KEY" value="<%=bc.getBusinessData(0).getFieldValue("CTNT_KEY")%>">
   <input type="hidden" id="CTNT_TYPE" name="CTNT_TYPE" value="<%=bc.getBusinessData(0).getFieldValue("CTNT_TYPE")%>">
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">이름</th>
        <th scope="col">값</th>
      </tr>
      </thead>
      <tr><td><%=CTNT%> 이름</td><td><input type="text" name="CTNT_NAME" id="CTNT_NAME" size="70" class="styled"  value="<%=bc.getBusinessData(0).getFieldValue("CTNT_NAME")%>" placeholder="Input name of contents ex) LOGO_IMAGE"></td></tr>
      <tr><td><%=CTNT%> 넓이</td><td><input type="text" name="CTNT_WIDTH" id="CTNT_WIDTH" size="50" class="styled" style="margin-right:5px;"  value="<%=bc.getBusinessData(0).getFieldValue("CTNT_WIDTH")%>" placeholder="Input width(number) of contents ex) 100 ">px</td></tr>
      <tr><td><%=CTNT%> 높이</td><td><input type="text" name="CTNT_HEIGHT" id="CTNT_HEIGHT" size="50" class="styled" style="margin-right:5px;"  value="<%=bc.getBusinessData(0).getFieldValue("CTNT_HEIGHT")%>" placeholder="Input height(number) of contents ex) 100 ">px</td></tr>
      <tr><td><%=CTNT%> 경로 or<%=CTNT%> 내용</td><td><textarea type="text" name="CTNT_PATH" id="CTNT_PATH"  cols="50" rows="3"  class="styled" placeholder="Input path or text of contents ex) http://aaa/img/aa.jpg or DUNA LOGO "><%=bc.getBusinessData(0).getFieldValue("CTNT_PATH")%></textarea></td></tr>
      <tr><td><%=CTNT%> CSS Class</td><td><input type="text" name="CTNT_CSS" id="CTNT_CSS" size="50" class="styled" value="<%=bc.getBusinessData(0).getFieldValue("CTNT_CSS")%>" placeholder="just css class name"></td></tr>
      <tr><td><%=CTNT%> Style</td><td><input type="text" name="CTNT_STYLE" id="CTNT_STYLE" size="70" class="styled" value="<%=bc.getBusinessData(0).getFieldValue("CTNT_STYLE")%>" placeholder="just cas style"></td></tr>
      <tr><td><%=CTNT%> Link</td><td><input type="text" name="CTNT_LINK" id="CTNT_LINK" size="70" class="styled" value="<%=bc.getBusinessData(0).getFieldValue("CTNT_LINK")%>" placeholder="Input a link of thie contents "></td></tr>
      <tr><td><%=CTNT%> Event name</td><td><input type="text" name="CTNT_EVENT" id="CTNT_EVENT" size="70" class="styled" value="<%=bc.getBusinessData(0).getFieldValue("CTNT_EVENT")%>" placeholder="Input javascript event name"></td></tr>
      <tr><td><%=CTNT%> Event function</td><td><input type="text" name="CTNT_EVTNT_FUNC" id="CTNT_EVTNT_FUNC" size="70" class="styled" value="<%=bc.getBusinessData(0).getFieldValue("CTNT_EVTNT_FUNC")%>" placeholder="Input javascript event function"></td></tr>
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
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_109750458441581635633586&CTNT_TYPE=<%=CTNT_TYPE%>';
  return false;
});

$('#save').on('click', function(event) {
  save();
});

function save(){
  with(frmContentsImage){
    if(CTNT_NAME.value == ''
    || CTNT_TYPE.value == ''
<% if(!"T".equals(CTNT_TYPE)) { %>
    || CTNT_WIDTH.value == ''
    || CTNT_HEIGHT.value == ''
<% } %>
    || CTNT_PATH.value == ''
    ){
       alert("Please check input field");
       return;
    }
<% if(!"T".equals(CTNT_TYPE)) { %>
    if(isNaN($('#CTNT_WIDTH').val()) || isNaN($('#CTNT_HEIGHT').val())){
      alert("Please input number in width or height");
      return;   
    }
<% }else{ %>
   $('#CTNT_WIDTH').val('0');
   $('#CTNT_HEIGHT').val('0');
<% } %>
    var d = {CTNT_NAME: $('#CTNT_NAME').val()
           ,CTNT_KEY : $('#CTNT_KEY').val()           
           ,CTNT_TYPE : $('#CTNT_TYPE').val()
           ,CTNT_WIDTH : $('#CTNT_WIDTH').val()
           ,CTNT_HEIGHT : $('#CTNT_HEIGHT').val()
           ,CTNT_PATH : $('#CTNT_PATH').val()
           ,CTNT_CSS : $('#CTNT_CSS').val()
           ,CTNT_STYLE : $('#CTNT_STYLE').val()
           ,CTNT_LINK : $('#CTNT_LINK').val()
           ,CTNT_EVENT : $('#CTNT_EVENT').val()
           ,CTNT_EVENT_FUNC : $('#CTNT_EVENT_FUNC').val()
            };

    $.ajax({
      url: "/Anaconda.json?CMD=CMD_SEQ_107956260261581814470651",
      data: d,
      type : "POST",
      dataType: "json",
      success : function (data) {
        alertPopup('Success', 'Congratulation Your request was succeed');
        document.location.href="/Anaconda.do?CMD=CMD_SEQ_109750458441581635633586&CTNT_TYPE=<%=CTNT_TYPE%>";
      },error : function (err) {
        alertPopup("Sorry", "Your request was failed");        
      }
    });
  }
}
</script>
