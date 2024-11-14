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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getChatBotProjectList");
%>
<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
<i class="fas fa-images"></i>&nbsp;프로젝트 관리 목록
    </h3>	
    <p>

    </p>
    <div class="row">
        <div class="col-sm-12">
           <a href="/Anaconda.do?CMD" style="margin-right:10px;"><i class="fas fa-time-sign"></i>&nbsp; 프로젝트 일정 등록</a>
           <input type="button" class="btn btn-secondary" name="Register" value="프로젝트 등록하기" onClick="javascript:goRegister();">
        </div>
     </div>
  </div>
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">프로젝트 이름</th>
        <th scope="col">팀 이름</th>
        <th scope="col">프로젝트 시작일</th>
        <th scope="col">프로젝트 종료일</th>
        <th scope="col">프로젝트 방법론</th>
        <th scope="col">기능</th>
      </tr>
      </thead>
      <tbody>
<%
if(bc != null && bc.size() > 0) {
  for(int i = 0; i < bc.size() ; i++){
%>
      <tr>
        <td><%=bc.getBusinessData(i).getFieldValue("ProjectName")%><br>(<%=bc.getBusinessData(i).getFieldValue("PMCode")%>)</td>
        <td><%=bc.getBusinessData(i).getFieldValue("ProjectTeamName")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("StartDate")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("EndDate")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("MethodologyName")%></td>
        <td>
        <span style="margin-right:5px">
          <button class="btn btn-warning" id="btnModify" onClick="javascript:fnModify('<%=bc.getBusinessData(i).getFieldValue("PMCode")%>')">수정</button>
        </span>
        <span  style="margin-right:5px">
          <button class="btn btn-danger" id="btnDelete" onClick="javascript:fnDelete('<%=bc.getBusinessData(i).getFieldValue("PMCode")%>')">삭제</button>
        </span>
        </td>
      </tr>
<%
  }
}else{
%>
      <tr>
        <td colspan="5">프로젝트 정보가 없습니다.</td>
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
  document.location.href = "/Anaconda.do?CMD=CMD_SEQ_109503436111588560842324" + "&pos=" + seq;
}
$(document).ready(function(){

 });

function fnDelete(seq){
  if(!confirm('삭제 하시겠습니까?')) return;
  var d = {PRD_KEY : seq};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_108136612821581943763270' ,
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
   document.location.href = '/Anaconda.do?CMD=CMD_SEQ_100670476601581942652571&PRD_KEY=' + seq;
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
  document.location.href="/Anaconda.do?CMD=CMD_SEQ_101497587921588560861919";
}

</script>
