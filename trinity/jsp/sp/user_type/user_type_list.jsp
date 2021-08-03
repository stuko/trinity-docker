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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"USER_TYPE_list");
%>
<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
<i class="fas fa-user-tag"></i>&nbsp;사용자 유형 목록
    </h3>	
    <p>
      아래에 나와 있는 사용자 유형 정보를 상품 구매 룰 관리 화면에서 사용하시기 바랍니다.
    </p>
    <div class="row">
        <div class="col-sm-12">
           <a href="/Anaconda.do?CMD=CMD_SEQ_109388531441582336801876&code=list" style="margin-right:10px;"><i class="fas fa-won-sign"></i>&nbsp; 사용자 유형 관리</a>
           <a href="/Anaconda.do?CMD=CMD_SEQ_109386074031581898012096&code=list" style="margin-right:10px;"><i class="fas fa-won-sign"></i>&nbsp; 상품 관리</a>
           <a href="/Anaconda.do?CMD=CMD_SEQ_103736959391582064326654&code=list" style="margin-right:10px;"><i class="fas fa-hands-helping"></i>&nbsp;상품 서비스 관리</a>
           <a href="/Anaconda.do?CMD=CMD_SEQ_105366569981582151932063&code=list" style="margin-right:10px;"><i class="fas fa-shopping-cart"></i>&nbsp; 구매 패턴 관리</a>
           <a href="/Anaconda.do?CMD=CMD_SEQ_104533676171581894345412&code=list" style="margin-right:10px;"><i class="fas fa-layer-group"></i>&nbsp; 상품 포트폴리오 관리</a>
            <input type="button" class="btn btn-secondary" name="Register" value="사용자 유형 등록하기" onClick="javascript:goRegister();">
        </div>
     </div>
  </div>
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">번호</th>
        <th scope="col">사용자 유형 이름</th>
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
        <td><%=bc.getBusinessData(i).getFieldValue("USR_TYPE_NAME")%></td>
        <td>
        <span style="margin-right:5px"><button class="btn btn-warning" id="btnModify" onClick="javascript:fnModify('<%=bc.getBusinessData(i).getFieldValue("USR_TYPE_KEY")%>')">수정</button></span><span  style="margin-right:5px"><button class="btn btn-danger" id="btnDelete" onClick="javascript:fnDelete('<%=bc.getBusinessData(i).getFieldValue("USR_TYPE_KEY")%>')">삭제</button></span>
        </td>
      </tr>
<%
  }
}else{
%>
      <tr>
        <td colspan="3">사용자 유형 정보가 없습니다.</td>
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
  document.location.href = "/Anaconda.do?CMD=CMD_SEQ_109388531441582336801876" + "&pos=" + seq;
}
$(document).ready(function(){

 });

function fnDelete(seq){
  if(!confirm('삭제 하시겠습니까?')) return;
  var d = {USR_TYPE_KEY: seq};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_100922857501582337220749' ,
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
   document.location.href = '/Anaconda.do?CMD=CMD_SEQ_106020869641582337276377&USR_TYPE_KEY=' + seq;
}
</script>
<%
int cnt = Integer.parseInt(strCount);
int page_count = cnt/10;
int page_mod = cnt%10;
// if(page_mod > 0) page_count++;
String seq = request.getParameter("pos");
if(!BusinessHelper.checkBusinessNull(seq))seq = "0";
int iseq = Integer.parseInt(seq);
for(int i = 0; i <= page_count;i++){
  if(iseq == i*10){
%><%=i+1 %>
<%
  }else{
%>
  <a href="javascript:fnPage('<%=i*10 %>');"><%=i+1 %></a>
<%	
  }
}
%>
</div>

<script>
function goRegister(){
  document.location.href="/Anaconda.do?CMD=CMD_SEQ_101819428771582337341164";
}
</script>
