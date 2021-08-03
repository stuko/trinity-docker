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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"selectIntentList");
%>
<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
<i class="fas fa-brain"></i>&nbsp;<%=bc.getBusinessData(0).getFieldValue("IG_NAME")%> : 대화 의도 목록
   </h3>
 <span style="text-align:right">
   <button class="btn btn-primary" id="backToIntentGroupList"><< 대화 의도 그룹 목록으로 돌아가기</button>
  </span>

  <span class="fr">
   <input type="button" class="btn btn-secondary" name="Register" value="대화 의도 등록하기" onClick="javascript:goRegister();">
  </span>

  </div>
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th >번호</th>
        <th >대화 의도 </th>
        <th >대화 의도 설명</th>
        <th width="40%">기능</th>
      </tr>
      </thead>
      <tbody>
<%
if(bc != null && bc.size() > 0) {
  for(int i = 0; i < bc.size() ; i++){
%>
      <tr>
        <td><%=i+1%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("IT_NAME")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("IT_DESC")%> (<a href="/Anaconda.do?CMD=CMD_SEQ_108483648151580427270542&IT_KEY=<%=bc.getBusinessData(i).getFieldValue("IT_KEY")%>&IT_NAME=<%=bc.getBusinessData(i).getFieldValue("IT_NAME")%>"><%=bc.getBusinessData(i).getFieldValue("CNT2")%></a> 건 의도 문장)&nbsp;(<a href="/Anaconda.do?CMD=CMD_SEQ_109919745451582508889092&IT_KEY=<%=bc.getBusinessData(i).getFieldValue("IT_KEY")%>"><%=bc.getBusinessData(i).getFieldValue("CNT")%></a> 건 질문 필수)</td>
        <td>
            <span style="margin-right:5px">
              <button class="btn btn-warning" id="btnSentence" onClick="javascript:fnSentenceList('<%=bc.getBusinessData(i).getFieldValue("IT_KEY")%>','<%=bc.getBusinessData(i).getFieldValue("IT_NAME")%>')">문장추가</button>
            </span>
            <span style="margin-right:5px">
           <% if("0".equals(bc.getBusinessData(i).getFieldValue("CNT"))) {%>
              <button class="btn btn-info" id="btnSlot" onClick="javascript:fnSlotCreate('<%=bc.getBusinessData(i).getFieldValue("IT_KEY")%>','<%=bc.getBusinessData(i).getFieldValue("IT_NAME")%>')">유도질문추가 
              </button>
           <% } else { %>
              <button class="btn btn-info" id="btnSlot" onClick="javascript:fnSlotList('<%=bc.getBusinessData(i).getFieldValue("IT_KEY")%>','<%=bc.getBusinessData(i).getFieldValue("IT_NAME")%>')">유도질문목록 
              </button>
           <% } %>
            </span>
            <span style="margin-right:5px">
              <button class="btn btn-warning" id="btnModify" onClick="javascript:fnModify('<%=bc.getBusinessData(i).getFieldValue("IT_KEY")%>')">수정</button>
            </span>
            <span  style="margin-right:5px"><button class="btn btn-danger" id="btnDelete" onClick="javascript:fnDelete('<%=bc.getBusinessData(i).getFieldValue("IT_KEY")%>')">삭제</button>
            </span>

        </td>
      </tr>
<%
  }
}else{
%>
      <tr>
        <td colspan="3">대화 의도 정보가 없습니다.</td>
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
  
$('#backToIntentGroupList').on('click',function(event){
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_108015592941580175502168';
  return false;
});

function fnPage(seq){
        seq = seq == null || seq == ''  || seq == 'null' ? '0' : seq;
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_106158749731580254604919&IG_KEY=<%=request.getParameter("IG_KEY")%>&IT_COUNT=<%=strCount%>&pos=" + seq;
}
$(document).ready(function(){

 });
function fnIntentList(seq){
   document.location.href = '/Anaconda.do?CMD=CMD_SEQ_106158749731580254604919&IG_KEY=' + seq;
}
function fnSentenceList(seq,name){
   document.location.href = '/Anaconda.do?CMD=CMD_SEQ_108483648151580427270542&IG_KEY=<%=request.getParameter("IG_KEY")%>&IT_KEY=' + seq + '&IT_NAME=' + name;
}
function fnSlotList(seq,name){
   document.location.href = '/Anaconda.do?CMD=CMD_SEQ_109919745451582508889092&IG_KEY=<%=request.getParameter("IG_KEY")%>&IT_KEY=' + seq + '&IT_NAME=' + name;
}
function fnSlotCreate(seq,name){
   document.location.href = '/Anaconda.do?CMD=CMD_SEQ_109668521911582508938270&IG_KEY=<%=request.getParameter("IG_KEY")%>&IT_KEY=' + seq + '&IT_NAME=' + name;
}

function fnDelete(seq){
  if(!confirm('삭제 하시겠습니까?')) return;
  var d = {IT_KEY : seq};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_101252295871580280133437' ,
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
   document.location.href = '/Anaconda.do?CMD=CMD_SEQ_108124735141580335370611&IT_KEY=' + seq;
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
  document.location.href="/Anaconda.do?CMD=CMD_SEQ_100693670051580255608322&IG_KEY=<%=request.getParameter("IG_KEY")%>&IT_COUNT=<%=strCount%>";
}
</script>
