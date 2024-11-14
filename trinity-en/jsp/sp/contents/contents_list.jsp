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

String CTNT_TYPE = request.getParameter("CTNT_TYPE");
CTNT_TYPE = CTNT_TYPE == null ? "I" : CTNT_TYPE;
String CTNT = "이미지";
if("I".equals(CTNT_TYPE)) CTNT = "이미지";
else if("T".equals(CTNT_TYPE)) CTNT = "텍스트";
else if("B".equals(CTNT_TYPE)) CTNT = "배너";
else if("H".equals(CTNT_TYPE)) CTNT = "HTML(5)";

BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getChatContentsList");

%>
<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
<i class="fas fa-images"></i>&nbsp;Contents(<%=CTNT%>)
    </h3>	
    <p>
      아래에 나와 있는 '대화 컨텐츠 이름'을 룰 편집 화면에서 {=대화 컨텐츠 이름} 로 사용하시기 바랍니다.
    </p>
    <div class="row">
        <div class="col-sm-3">
         <select class="form-control select-small" name="CTNT_TYPE" id="CTNT_TYPE" onChange="javascript:changeContentsType();">
           <option value="I" selected>이미지</option>
           <option value="T">텍스트</option>
           <option value="B">배너</option>
           <option value="H">HTML(5)</option>
         </select>
        </div>
        <div class="col-sm-9">
            <input type="button" class="btn btn-secondary" name="Register" value="대화 컨텐츠 등록하기" onClick="javascript:goRegister();">
        </div>
     </div>
  </div>
  <div class="table-responsive">
    <table class="table" style="table-layout:fixed;">
      <thead>
      <tr>
        <th width="5%">번호</th>
        <th width="10%">컨텐츠 이름</th>
        <th width="10%">컨텐츠 유형</th>
        <th width="55%">컨텐츠 경로</th>
        <th width="20%">기능</th>
      </tr>
      </thead>
      <tbody>
<%
if(bc != null && bc.size() > 0) {
  for(int i = 0; i < bc.size() ; i++){
    String type = bc.getBusinessData(i).getFieldValue("CTNT_TYPE");
    // TEXT, IMG, BANNER, HTML
    if("T".equals(type)) type = "텍스트문장";
    else if("I".equals(type)) type = "이미지<img src='"+bc.getBusinessData(i).getFieldValue("CTNT_PATH")+"' width='50px'>";
    else if("B".equals(type)) type = "배너";
    else if("H".equals(type)) type = "HTML";
    else type = "텍스트문장";
%>
      <tr>
        <td><%=i+1%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("CTNT_NAME")%></td>
        <td><%=type%></td>
        <td style="text-overflow: ellipsis;overflow: hidden;"><%=bc.getBusinessData(i).getFieldValue("CTNT_PATH")%></td>
        <td>
        <span style="margin-right:5px"><button class="btn btn-warning" id="btnModify" onClick="javascript:fnModify('<%=bc.getBusinessData(i).getFieldValue("CTNT_KEY")%>')">수정</button></span><span  style="margin-right:5px"><button class="btn btn-danger" id="btnDelete" onClick="javascript:fnDelete('<%=bc.getBusinessData(i).getFieldValue("CTNT_KEY")%>')">삭제</button></span>
        </td>
      </tr>
<%
  }
}else{
%>
      <tr>
        <td colspan="3">대화 컨텐츠 정보가 없습니다.</td>
      </tr>
<%
}
%>
      </tbody>
    </table>
  </div>


<p height="20px">&nbsp;</p>
<p align="center">
<%
BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"selectTotalCount");
String strCount = bc1.getBusinessData(0).getFieldValue("CNT");
%>
<script language="javascript">
function fnPage(seq){
  seq = seq == null || seq == ''  || seq == 'null' ? '0' : seq;
  document.location.href = "/Anaconda.do?CMD=CMD_SEQ_109750458441581635633586&CTNT_TYPE=" + $('#CTNT_TYPE').val() + "&pos=" + seq;
}
$(document).ready(function(){

 });

function fnDelete(seq){
  if(!confirm('삭제 하시겠습니까?')) return;
  var d = {CTNT_KEY : seq};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_103036594611581815618892' ,
    type: 'POST',
    data : d,
    dataType : 'json',
    success : function (data){
       fnPage('<%=request.getParameter("pos")%>');
    },
    error : function (err) {
       alert(err);
    }
 });

}
function fnModify(seq){
   document.location.href = '/Anaconda.do?CMD=CMD_SEQ_108731221011581814052424&CTNT_TYPE=' + $('#CTNT_TYPE').val() +'&CTNT_KEY=' + seq;
}
</script>
<%
int cnt = Integer.parseInt(strCount);
int page_count = cnt/20;
int page_mod = cnt%20;
// if(page_mod > 0) page_count++;
String seq = request.getParameter("pos");
if(!BusinessHelper.checkBusinessNull(seq))seq = "0";
int iseq = Integer.parseInt(seq);
for(int i = 0; i <= page_count;i++){
  if(iseq == i*20){
%><%=i+1 %>
<%
  }else{
%>
  <a href="javascript:fnPage('<%=i*20 %>');"><%=i+1 %></a>
<%	
  }
}
%>
</div>

<script>
function goRegister(){
  document.location.href="/Anaconda.do?CMD=CMD_SEQ_104397232541581660411238&CTNT_TYPE=" + $('#CTNT_TYPE').val();
}
function changeContentsType(){
  document.location.href="/Anaconda.do?CMD=CMD_SEQ_109750458441581635633586&CTNT_TYPE=" + $('#CTNT_TYPE').val();

}
$('#CTNT_TYPE').val('<%=CTNT_TYPE%>');
</script>
