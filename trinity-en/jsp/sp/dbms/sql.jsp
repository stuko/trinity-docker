<%@ page contentType="text/xml; charset=UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.mediator.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.business.BusinessData"%>
<%@ page import="com.stuko.anaconda.business.BusinessCollection"%>
<%@ page import="com.stuko.anaconda.business.BusinessHelper"%>
<%@ page import="com.stuko.anaconda.SQLCommand.*"%>

<%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"get_sql_history");
%>
 <div class="container-fluid">
	<h3 class="page-header"><i class="fas fa-database"></i>&nbsp; DBMS SQL Management<i class="fas fa-certificate fa-2x" style="color:#FF5733;"></i></h3>
        <p>
        직접 DBMS를 사용 하실 수 있도록 SQL 쿼리를 실행 하실 수 있는 기능입니다. SQL 실행 결과에 대한 어떠한 책임도 지지 않으므로, 신중하게 관리해 주시기 바랍니다.
        </p>
        <p>
        특수문자나 이모티콘을 입력하고자 하실 경우 아래 명령어를 실행 해 주세요.
         <ul>
            <li>ALTER TABLE table_name CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci</li>
            <li>ALTER TABLE table_name CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci</li>
            <li>ALTER TABLE table_name CHANGE column_name TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci</li>

         </ul>
        </p>

	<div class="row">
	    <div class="col-lg-12">

<form name="frmSQL" target="_new" method="POST" action="/Anaconda.do?CMD=CMD_SEQ_106568336971641366500061">
<div class="entry">
<table class="table_hydra">
  <caption></caption>
  <colgroup>
  <col width="20%"></col>
  <col></col>
  </colgroup>
  <tbody>
  <tr>
    <td align="center" >
    SQL
    </td>
    <td>
	<textarea name="SQL" id="SQL" style="width:840px;height:400px;"></textarea>
    </td>
  </tr>
  <tr>
    <td align="left" colspan="2">
      <button type="button" class="btn navbar-btn btn-info second-button"
       name="execute" onClick="javascript:executeSql();return false;">Execute SQL</button></td>
  </tr>
  </tbody>
</table>
</div>
</div>
</form>
<div>
  <h5>최근에 사용한 SQL</h5>
  <ul style="width:1000px;">
    <%
    if(bc.size() > 0) {
      for(int i = 0; i < bc.size() ; i++){
        String statement = bc.getBusinessData(i).getFieldValue("statement");
    %>
    <li><pre><%=statement%></pre></li>
    <%
      }
    }
    %>
  </ul>
</div>
<script>
function executeSql(){
  if($('#SQL').val().trim() == ''){
     alertPopup('경고','SQL 문장을 입력해 주세요');
     return;
  }
  // alertPopup('경고','SQL : ' + $('#SQL').val());
  with(frmSQL){
    SQL.value = $('#SQL').val();
    submit();
  }
}
function ajaxSql(){
   var d = {SQL:$('#SQL').val()};
   doJson(JSON.stringify(d),'CMD_SEQ_106568336971641366500061'
   ,(json)=>{
     // alert(json);
     var result = JSON.responseText.replaceAll("><",">\n<");
     $('#SQL_RESULT').val(result);
   },(error)=>{
     $('#SQL_RESULT').val(JSON.stringify(error));
   });
}
function fnPage(seq){
  seq = seq == null || seq == ''  || seq == 'null' ? '0' : seq;
  document.location.href = "/Anaconda.do?CMD=<%=request.getParameter("CMD")%>&PAGE=" + seq;
}
</script>
</div>
</div>
</div>
<div style="margin-left:5px;margin-right:5px">
<%
BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"get_sql_history_total");
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
