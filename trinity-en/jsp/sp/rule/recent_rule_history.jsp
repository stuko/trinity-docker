<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.filter.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.action.*"%>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getRecentRuleHistory");
String rule_seq = request.getParameter("rule_seq")==null?"":request.getParameter("rule_seq");
String from_date = request.getParameter("from_date")==null?"":request.getParameter("from_date");
String to_date = request.getParameter("to_date")==null?"":request.getParameter("to_date");
String from_time = request.getParameter("from_time")==null?"":request.getParameter("from_time");
String to_time = request.getParameter("to_time")==null?"":request.getParameter("to_time");
String search_keyword = request.getParameter("search_keyword")==null?"":request.getParameter("search_keyword");
String until_rule = request.getParameter("until_rule")==null?"":request.getParameter("until_rule");
%>
<style>
#wrapper li {
  list-style:none;
}
</style>

<script language="javascript">
function fnClick(TeamCode,TeamName){
   frmTeamBridge.TeamCode.value = TeamCode;
   frmTeamBridge.TeamName.value = TeamName;
   frmTeamBridge.submit();
}

function fnAjaxSearch(){
   var d = {rule_seq:$('#rule_seq').val()
           ,from_date:$('#from_date').val()
           ,to_date:$('#to_date').val()
           ,from_time:$('#from_time').val()
           ,to_time:$('#to_time').val()
           ,search_keyword:$('#search_keyword').val()
           };
}

function fnSearch(){
   with(frmRuleSearch){
      if(from_date.value == '') from_date.value = getToday();
      if(to_date.value == '') to_date.value = getToday();
      if(from_time.value == '') from_time.value = '000000';
      if(to_time.value == '') to_time.value = '235959';
      if(rule_seq.value == '' || rule_seq.value == '0') {
        rule_seq.value = 0;
        until_rule.value = 999999999;
      }else{
        until_rule.value = rule_seq.value;
      }

   }
   frmRuleSearch.submit();
   return false;
}

function getToday(){
    var date = new Date();
    var year = date.getFullYear();
    var month = ("0" + (1 + date.getMonth())).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);

    return year + month + day;
}

</script>
<form name="frmTeamBridge" id="frmTeamBridge" action="/Anaconda.do" method="POST">
  <input type="hidden" name="CMD" value="CMD_SEQ_103063019771510655619158">
  <input type="hidden" name="TeamCode">
  <input type="hidden" name="TeamName">
  <input type="hidden" name="rule_group" value="PROFILE">
</form>
<div class="container-fluid">
  <h2><img src="/jsp/sp/img/select.png" width="40px">&nbsp; Rule Execution Log</h2>

  <form name="frmRuleSearch" id="frmRuleSearch" action="/Anaconda.do" method="POST"> 
  <div>
  <input type="hidden" name="CMD" value="CMD_SEQ_106467653201639088313677">
  <input type="hidden" name="until_rule" value="<%=until_rule%>">
       <span class="margin-right:5px"><input type="text" name="rule_seq" id="rule_seq" value="<%=rule_seq%>" placeholder="룰아이디"></span>
       <span class="margin-right:5px"><input type="text" name="from_date" id="from_date" value="<%=from_date%>"  placeholder="yyyyMMdd">~<input type="text" name="to_date" id="to_date" value="<%=to_date%>" placeholder="yyyyMMdd"></span>
       <span class="margin-right:5px"><input type="text" name="from_time" id="from_time" value="<%=from_time%>"  placeholder="hhmmss">~<input type="text" name="to_time" id="to_time" value="<%=to_time%>"  placeholder="hhmmss"></span>
       <span class="margin-right:5px"><input type="text" name="search_keyword" value="<%=search_keyword%>"  id="search_keyword" placeholder="검색어"></span>
       <span class="margin-right:5px"><button id="search_btn" class="btn btn-success" onClick="fnSearch();">검색하기</button></span>
  </div>
  </form>


  <table class="table table-condensed">
    <thead>
      <tr>
        <th scope="row">룰(Rule)</th>
        <th>룰 입력 / 결과 값</th>
      </tr>
    </thead>
    <tbody>

     <%
     if(bc != null){
       for(int i = 0; i < bc.size() ; i++) {
         String c =  BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("rule_seq"));
         if("-1".equals(c))c = "red";
         else c = "blue";
         String p = bc.getBusinessData(i).getFieldValue("parameter");
         // p = p.replace(",","\n");
         String r = bc.getBusinessData(i).getFieldValue("result");
         // r = r.replace(",","\n");
         String rule_type = "MSG";
         if(r.indexOf("\"kind\":\"STORE\"") > 0) rule_type = "STORE";
     %> 
       <tr>
        <td><a href="/Anaconda.do?CMD=CMD_SEQ_109170810941496452670436&seq=<%=bc.getBusinessData(i).getFieldValue("rule_seq")%>&rule_group=<%=bc.getBusinessData(i).getFieldValue("rule_group")%>&kind=<%=rule_type%>&page=0"><%=bc.getBusinessData(i).getFieldValue("rule_seq")%></a> (<%=rule_type%>)
       <br><%=bc.getBusinessData(i).getFieldValue("channel")%><br><%=bc.getBusinessData(i).getFieldValue("create_datetime")%>
        <td>
           <div class="card">
            <div class="card-body">
             <h5 class="card-title">
               <span>룰 : <%=BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("context_name"))%></span>
               <span><button onClick="javascript:open_close('rule_var_<%=i%>')">변수</button></span>
               <span><button onClick="javascript:open_close('rule_result_<%=i%>')">결과</button></span>
             </h5>
             <p class="card-text" style="max-height: 200px;overflow-y: auto;max-width: 1200px;overflow-x: auto">
               <span><%=BusinessHelper.convert(bc.getBusinessData(i).getFieldValue("rule"))%></span>
             </p>
           </div>
            <div class="card-body" id="rule_var_<%=i%>" style="display:none">
             <h5 class="card-title">룰 변수<!--<button style="margin-left:3px" class="btn btn-sm btn-primary" onClick='javascript:copy("rule_var_<%=i%>")'>copy</button>--></h5>
             <p class="card-text" style="max-height: 200px;overflow-y: auto;max-width: 1200px;overflow-x: auto"/>
               <div id='rule_var_<%=i%>'  style="max-width: 800px;overflow-x: auto" />
             </p>
           </div>
          </div>
         <br>
           <div class="card">
            <div class="card-body"  id="rule_result_<%=i%>" style="display:none">
             <h5 class="card-title">룰 실행 결과 <!--<button style="margin-left:3px" class="btn btn-sm btn-primary" onClick='javascript:copy("rule_result_<%=i%>")'>copy</button>--></h5>
             <p class="card-text" style="max-height: 200px;overflow-y: auto;max-width: 800px;overflow-x: auto"
               onClick='javascript:copy("rule_result_<%=i%>")' />
               <div id='rule_result_<%=i%>' style="max-width: 800px;overflow-x: auto" />
           </div>
          </div>

       </td>
      </tr>
             <script>
               jsonTree.create(<%=p%>, document.getElementById('rule_var_<%=i%>'));
               jsonTree.create(<%=r%>, document.getElementById('rule_result_<%=i%>'));
             </script>
     <% }
      } %>
    </tbody>
  </table>
</div>

<div style="margin-left:5px;margin-right:5px">
<%
BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"getRecentRuleHistoryCnt");
String strCount = bc1.getBusinessData(0).getFieldValue("CNT");
int cnt = Integer.parseInt(strCount);
int page_count = cnt/20;
int page_mod = cnt%20;

String seq = request.getParameter("PAGE");
if(!BusinessHelper.checkBusinessNull(seq)) seq = "0";
int iseq = Integer.parseInt(seq);
for(int i = 0; i <= page_count;i++){
 if(iseq == i*20){
%>
 <%=i+1 %>
<%
  }else{
%>
 <a href="javascript:fnPage('<%=i*20 %>');" style="text-decoration:underline"><%=i+1 %></a>
<%	
  }
%>
 | 
<%
}
%>
</div>

<script>
function fnPage(seq){
  seq = seq == null || seq == ''  || seq == 'null' ? '0' : seq;
  document.location.href = "/Anaconda.do?CMD=<%=request.getParameter("CMD")%>&PAGE=" + seq;
}

function copy(id)  {
  var str = document.getElementById(id).innerHTML;
  const el = document.createElement('textarea');
  el.value = str;
  document.body.appendChild(el);
  el.select();
  document.execCommand('copy');
  document.body.removeChild(el);
}

function open_close(id){
  if($('#' + id).is(':visible')) $("#" + id).hide();
  else  $("#" + id).show();
}
</script>
