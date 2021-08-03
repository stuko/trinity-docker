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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"OAUTH_TOKEN_list");
%>
<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
<i class="fas fa-images"></i>&nbsp;OAuth 인증 정보 목록
    </h3>	
    <p>
      아래에 나와 있는 OAuth 인증 정보 목록은 각 사이트에서 제공해주는 정보를 저장해 놓은 것입니다.
    </p>
    <div class="row">
        <div class="col-sm-12">
            <input type="button" class="btn btn-secondary" name="Register" value="OAuth 정보 등록하기" onClick="javascript:goRegister();">
        </div>
     </div>
  </div>
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">번호</th>
        <th scope="col">사이트 이름</th>
        <th scope="col">Client ID</th>
        <th scope="col">Secret Key</th>
        <th scope="col">기능</th>
      </tr>
      </thead>
      <tbody>
<%
if(bc != null && bc.size() > 0) {
  for(int i = 0; i < bc.size() ; i++){
%>
      <tr>
        <td><%=i+1%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("OT_SITE")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("OT_CLIENTID")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("OT_SECRETKEY")%></td>
        <td>
        <span style="margin-right:5px">
         <button class="btn btn-info" id="btnModify" onClick="javascript:fnToken('<%=bc.getBusinessData(i).getFieldValue("OT_SITE")%>')">토큰발급</button>
        </span>
        <span style="margin-right:5px">
         <button class="btn btn-warning" id="btnModify" onClick="javascript:fnModify('<%=bc.getBusinessData(i).getFieldValue("OT_KEY")%>')">수정</button>
        </span>
        <span  style="margin-right:5px">
          <button class="btn btn-danger" id="btnDelete" onClick="javascript:fnDelete('<%=bc.getBusinessData(i).getFieldValue("OT_KEY")%>')">삭제</button>
        </span>
        </td>
      </tr>
<%
  }
}else{
%>
      <tr>
        <td colspan="3">OAuth 인증 정보가 없습니다.</td>
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
function fnToken(site){
   if(confirm('토큰을 재발급 하시겠습니까?')){
     var s = "/Anaconda.do?CMD=CMD_SEQ_102168100051583965110408&site="+site;
     document.location.href = s;
   }
}
function fnPage(seq){
  seq = seq == null || seq == ''  || seq == 'null' ? '0' : seq;
  document.location.href = "/Anaconda.do?CMD=CMD_SEQ_104852409371584337907993" + "&pos=" + seq;
}
$(document).ready(function(){

 });

function fnDelete(seq){
  if(!confirm('삭제 하시겠습니까?')) return;
  var d = {OT_KEY : seq};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_108150767431584339177609' ,
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
   document.location.href = '/Anaconda.do?CMD=CMD_SEQ_103398552631584339079545&OT_KEY=' + seq;
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
  document.location.href="/Anaconda.do?CMD=CMD_SEQ_108435171901584339025321";
}

</script>
