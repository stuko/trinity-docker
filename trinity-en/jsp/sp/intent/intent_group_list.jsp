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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getIntentGroupList");
%>
<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
<i class="fas fa-cubes"></i>&nbsp;Intent Group
    </h3>	
  <span class="fr">
   <input type="button" class="btn btn-secondary" name="Register" value="대화 의도 그룹 등록하기" onClick="javascript:goRegister();">
  </span>
  <span class="fr">
   <input type="button" class="btn btn-info" id="Search" name="Search" value="의도 검색하기" onClick="javascript:goSearch();"><input type="text" style="margin-left:10px;width:400px;" name="search" size="30" value="">
  </span>

  </div>
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th >번호</th>
        <th >대화 의도 그룹 이름</th>
        <th >대화 의도 갯수</th>
        <th >대화 의도 태그</th>
        <th width="30%">기능</th>
      </tr>
      </thead>
      <tbody>
<%
if(bc != null && bc.size() > 0) {
  for(int i = 0; i < bc.size() ; i++){
     int cnt = Integer.parseInt(bc.getBusinessData(i).getFieldValue("IT_COUNT"));
%>
      <tr>
        <td><%=i+1%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("IG_NAME")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("IT_COUNT")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("IG_TAG")%></td>
        <td>
        <% if(cnt > 0) { %>
        <span style="margin-right:5px"><button class="btn btn-info" id="btnModify" onClick="javascript:fnIntentList('<%=bc.getBusinessData(i).getFieldValue("IG_KEY")%>')">의도목록</button></span>
        <% }else{ %>
        <span style="margin-right:5px"><button class="btn btn-info" id="btnModify" onClick="javascript:fnGoIntentRegister('<%=bc.getBusinessData(i).getFieldValue("IG_KEY")%>','<%=cnt%>')">의도추가</button></span>
        <% } %>
        <span style="margin-right:5px"><button class="btn btn-warning" id="btnModify" onClick="javascript:fnModify('<%=bc.getBusinessData(i).getFieldValue("IG_KEY")%>')">수정</button></span><span  style="margin-right:5px"><button class="btn btn-danger" id="btnDelete" onClick="javascript:fnDelete('<%=bc.getBusinessData(i).getFieldValue("IG_KEY")%>')">삭제</button></span></td>
      </tr>
<%
  }
}else{
%>
      <tr>
        <td colspan="3">대화 의도 그룹 정보가 없습니다.</td>
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
  document.location.href = "/Anaconda.do?CMD=CMD_SEQ_108015592941580175502168&pos=" + seq;
}
$(document).ready(function(){

});
function fnGoIntentRegister(seq,cnt){
  document.location.href = "/Anaconda.do?CMD=CMD_SEQ_100693670051580255608322&IG_KEY=" + seq + "&IT_COUNT=" + cnt;
}

function fnIntentList(seq){
   document.location.href = '/Anaconda.do?CMD=CMD_SEQ_106158749731580254604919&IG_KEY=' + seq;
}
function fnDelete(seq){
  if(!confirm('삭제 하시겠습니까?')) return;
  var d = {IG_KEY : seq};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_102632337481580251801788' ,
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
   document.location.href = '/Anaconda.do?CMD=CMD_SEQ_109776641031580252655135&IG_KEY=' + seq;
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
  document.location.href="/Anaconda.do?CMD=CMD_SEQ_103658193111580192021758";
}

function goSearch(){
  alertPopup('경고','작업 중');
  // document.location.href="/Anaconda.do?CMD=CMD_SEQ_109964257281600901244153&search=" + $('#Search').val();
}
</script>
