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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"INTENT_SLOT_list");
%>
<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
<i class="fab fa-elementor"></i>&nbsp;<%=bc.getBusinessData(0).getFieldValue("IG_NAME")%> > <%=bc.getBusinessData(0).getFieldValue("IT_NAME")%> : 대화 의도 필수 질문 목록
   </h3>
 <span style="text-align:right">
   <button class="btn btn-primary" id="backToIntentGroupList"><< 대화 의도 목록으로 돌아가기</button>
  </span>

  <span class="fr">
   <input type="button" class="btn btn-secondary" name="Register" value="대화 의도 필수 질문 등록하기" onClick="javascript:goRegister();">
  </span>

  </div>
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">번호</th>
        <th scope="col">필수 질문 순서 </th> 
        <th scope="col">필수 질문 이름 </th>
        <th scope="col">필수 질문 등록일</th>
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
        <td><%=bc.getBusinessData(i).getFieldValue("SLOT_SEQ")%>&nbsp;번째</td>
        <td><%=bc.getBusinessData(i).getFieldValue("SLOT_NAME")%>&nbsp;(질문 수 : <%=bc.getBusinessData(i).getFieldValue("CNT")%> 건)&nbsp;(답변 수 : <%=bc.getBusinessData(i).getFieldValue("CNT2")%> 건)</td>
        <td><%=bc.getBusinessData(i).getFieldValue("SLOT_REGDATE")%></td>
        <td>
            <span style="margin-right:5px">
            <% if("0".equals(bc.getBusinessData(i).getFieldValue("CNT"))) { %>
              <button class="btn btn-info" id="btnSentence" onClick="javascript:fnQuestCreate('<%=bc.getBusinessData(i).getFieldValue("SLOT_KEY")%>')">문장 추가</button>
            <% } else { %>
              <button class="btn btn-info" id="btnSentence" onClick="javascript:fnQuestList('<%=bc.getBusinessData(i).getFieldValue("SLOT_KEY")%>')">문장 목록</button>
            <% } %>
             <button class="btn btn-warning" id="btnAnswer" onClick="javascript:fnAnswerList('<%=bc.getBusinessData(i).getFieldValue("SLOT_KEY")%>', '<%=bc.getBusinessData(i).getFieldValue("SLOT_NAME")%>')">답변 목록</button>
            </span>
            <span style="margin-right:5px">
              <button class="btn btn-warning" id="btnModify" onClick="javascript:fnModify('<%=bc.getBusinessData(i).getFieldValue("SLOT_KEY")%>')">수정</button>
            </span>
            <span  style="margin-right:5px"><button class="btn btn-danger" id="btnDelete" onClick="javascript:fnDelete('<%=bc.getBusinessData(i).getFieldValue("SLOT_KEY")%>')">삭제</button>
            </span>

        </td>
      </tr>
<%
  }
}else{
%>
      <tr>
        <td colspan="3">대화 의도 필수 질문 정보가 없습니다.</td>
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
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_106158749731580254604919&IG_KEY=<%=bc.getBusinessData(0).getFieldValue("IG_KEY")%>';
  return false;
});

function fnPage(seq){
        seq = seq == null || seq == ''  || seq == 'null' ? '0' : seq;
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_109919745451582508889092&IT_KEY=<%=request.getParameter("IT_KEY")%>&IT_COUNT=<%=strCount%>&pos=" + seq;
}
$(document).ready(function(){

 });
function fnQuestList(seq){
   document.location.href = '/Anaconda.do?CMD=CMD_SEQ_103180830071582583079388&SLOT_KEY=' + seq;
}
function fnAnswerList(seq, n){
   document.location.href = '/Anaconda.do?CMD=CMD_SEQ_100702662481582637093257&SLOT_KEY=' + seq + '&SLOT_NAME=' + n;
}
function fnQuestCreate(seq){
   document.location.href = '/Anaconda.do?CMD=CMD_SEQ_107197558211582583111938&SLOT_KEY=' + seq;
}

function fnDelete(seq){
  if(!confirm('삭제 하시겠습니까?')) return;
  var d = {SLOT_KEY : seq};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_106263242681582509070495' ,
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
   document.location.href = '/Anaconda.do?CMD=CMD_SEQ_108621648021582508977944&SLOT_KEY=' + seq;
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
  document.location.href="/Anaconda.do?CMD=CMD_SEQ_109668521911582508938270&IT_KEY=<%=bc.getBusinessData(0).getFieldValue("IT_KEY")%>";
}
</script>
