<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.openapi.*"%>
<%@ page import="com.stuko.anaconda.util.*"%>

<%
String search = request.getParameter("search") == null ? "" : request.getParameter("search");
BusinessCollection bc = search.equals("") ? RequestHelper.getBusinessCollection(request,"list") : RequestHelper.getBusinessCollection(request,"search");
%>

<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
<i class="fas fa-hands-helping"></i>&nbsp;The Factor of Asset's Recommended Rule
    </h3>	
    <p>
      DUNA가 추천해 줄 항목을 정의합니다.
    </p>
  </div>
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">번호</th>
        <th scope="col">자산 이름</th>
        <th scope="col">항목 이름</th>
        <th scope="col">시작 비율</th>
        <th scope="col">끝 비율</th>
        <th scope="col">유형</th>
        <th scope="col">기능</th>
      </tr>
      </thead>
      <tbody>

      <tr>
        <td>추가/수정</td>
        <td>
          <select id = 'coin_list' name='coin_list' class='styled' style="margin-bottom:5px;">
            <option value=''> 자산을 선택해 주세요</options>
               <option value=''> 전체 </options>
               <option value='all'> all</options>
          <%
             BusinessCollection bc1 = RequestHelper.getBusinessCollection(request, "coin_list");
             if(bc1 != null && bc1.size() > 0) {
               for(int i = 0; i < bc1.size() ; i++){
                String market = bc1.getBusinessData(i).getFieldValue("market");
          %>
                <option value='<%=market%>'> <%=market%></options>
          <%
               }
             }
          %>
          </select>
          <input  class='styled' type="hidden" id="channelId" name="channelId" value="all">
          <input  class='styled' type="text" id="code" name="code" value="<%=search%>" size="40"></td>
        <td>
          <select id = 'factor_list' name='factor_list' class='styled' style="margin-bottom:5px;">
            <option value=''> 항목을 선택해 주세요</options>
          <%
             BusinessCollection bc2 = RequestHelper.getBusinessCollection(request, "factor_list");
             if(bc2 != null && bc2.size() > 0) {
               for(int i = 0; i < bc2.size() ; i++){
                String name = bc2.getBusinessData(i).getFieldValue("name");
          %>
                <option value='<%=name%>'> <%=name%></options>
          <%
               }
             }
          %>
          </select>
          <input  class='styled' type="text" id="name" name="name" value="" size="40">
        </td>
        <td><input  class='styled' type="text" id="from_percent" name="from_percent" value="0" size="10"></td>
        <td><input  class='styled' type="text" id="to_percent" name="to_percent" value="0" size="10"></td>
        <td><select name="meta_type" class='styled' id="meta_type">
           <option value="R">범위</option>
           <option value="S">순서</option>
        </select><br>(R:범위, S:순서)</td>
        <td>
        <span style="margin-right:5px">
         <button class="btn btn-primary" id="btnCreate" onClick="javascript:fnCreate()">
         추가
         </button>
         <button class="btn btn-danger" id="btnCreate" onClick="javascript:fnModify()">
         수정
         </button>

        </span>
        </td>
      </tr>


<%
int intCount = 0;
if(bc != null && bc.size() > 0) {
  intCount = Integer.parseInt(bc.getBusinessData(0).getFieldValue("count"));
  for(int i = 0; i < bc.size() ; i++){
%>
      <tr>
        <td><%=i+1%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("code")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("name")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("from_percent")%> %</td>
        <td><%=bc.getBusinessData(i).getFieldValue("to_percent")%> %</td>
        <td><%=bc.getBusinessData(i).getFieldValue("meta_type")%></td>
        <td>
        <span style="margin-right:5px">
         <button class="btn btn-warning" id="btnModify" onClick="javascript:fnSetData('<%=bc.getBusinessData(i).getFieldValue("channelId")%>','<%=bc.getBusinessData(i).getFieldValue("code")%>','<%=bc.getBusinessData(i).getFieldValue("name")%>','<%=bc.getBusinessData(i).getFieldValue("from_percent")%>','<%=bc.getBusinessData(i).getFieldValue("to_percent")%>','<%=bc.getBusinessData(i).getFieldValue("meta_type")%>')">
         선택
         </button>
        </span>
        <span  style="margin-right:5px">
         <button class="btn btn-danger" id="btnDelete" onClick="javascript:fnDelete('<%=bc.getBusinessData(i).getFieldValue("channelId")%>','<%=bc.getBusinessData(i).getFieldValue("code")%>','<%=bc.getBusinessData(i).getFieldValue("name")%>')">
          삭제
         </button>
        </span>
        </td>
      </tr>
<%
  }
}else{
%>
      <tr>
        <td colspan="6">항목 정보가 없습니다.</td>
      </tr>
<%
}
%>
      </tbody>
    </table>
  </div>
<div>
<%
int cnt = intCount ;
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
    if(search.equals("")) {
%>
  <a href="/Anaconda.do?CMD=CMD_SEQ_107599226821678865995284&pos=<%=i*10 %>"><%=i+1 %></a>
<%	
    }else {
%>
  <a href="/Anaconda.do?CMD=CMD_SEQ_107599226821678865995284&search=<%=request.getParameter("search")%>&pos=<%=i*10 %>"><%=i+1 %></a>
<%
   }
  }
}
%>
</div>

<script language="javascript">
$(document).ready(function(){
  $('#factor_list').change(()=>{
     $('#name').val($("#factor_list option:selected").val());
  }); 
  $('#coin_list').change(()=>{
     // $('#name').val($("#factor_list option:selected").val());
     if($("#coin_list option:selected").val() != '')
        document.location.href='/Anaconda.do?CMD=CMD_SEQ_107599226821678865995284&search='+$("#coin_list option:selected").val();
     else
        document.location.href='/Anaconda.do?CMD=CMD_SEQ_107599226821678865995284';
  }); 
});

function fnDelete(channelId, code, name){
  if(!confirm('삭제 하시겠습니까?')) return;
  var d = {gubun:'delete',code:code,channelId: channelId, name: name};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_108327344621678865596437' ,
    type: 'POST',
    data : d,
    dataType : 'json',
    success : function (data){
       document.location.reload();
    },
    error : function (err) {
       alert(err);
    }
 });
}

function fnSetData(channelId, code, name, from_percent, to_percent , meta_type){
   $('#channelId').val(channelId);   
   $('#code').val(code);
   $('#name').val(name);
   $('#from_percent').val(from_percent);
  $('#to_percent').val(to_percent);
  $('#meta_type').val(meta_type);
}

function fnModify(){
  if(!confirm('수정 하시겠습니까?')) return;
  var d = {gubun:'update',channelId : $('#channelId').val(),code: $('#code').val(),name: $('#name').val(),from_percent: $('#from_percent').val(),to_percent: $('#to_percent').val(),meta_type: $('#meta_type').val()};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_108327344621678865596437' ,
    type: 'POST',
    data : d,
    dataType : 'json',
    success : function (data){
      document.location.reload();
    },
    error : function (err) {
       alert(err);
    }
 });
}

function fnCreate(){
  if(!confirm('추가 하시겠습니까?')) return;
  var d = {gubun:'create',code:$('#code').val(),channelId : $('#channelId').val(),name: $('#name').val(),from_percent: $('#from_percent').val(),to_percent: $('#to_percent').val(),meta_type: $('#meta_type').val()};    
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_108327344621678865596437' ,
    type: 'POST',
    data : d,
    dataType : 'json',
    success : function (data){
      document.location.reload();
    },
    error : function (err) {
       alert(err);
    }
 });
}


</script>
