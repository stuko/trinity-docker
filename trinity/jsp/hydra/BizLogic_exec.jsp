<!--
BUSINESS, BUSINESS_NAME, SQL 의 항목은 TYPE에 따라서 추후에 바뀌어야 한다
EJB = SERVICE_NAME, SOAP = SERVICE, SQL = SQL
-->
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.mediator.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.business.BusinessData"%>
<%@ page import="com.stuko.anaconda.business.BusinessCollection"%>
<%@ page import="com.stuko.anaconda.business.BusinessHelper"%>
<%@ page import="com.stuko.anaconda.SQLCommand.*"%>
<script language="javascript">
function fn_select_jndi(select_object_index)
{
	with(frmSQL)
	{
		if(DATASOURCE != null)  DATASOURCE.value=select_jndi[select_object_index].value;
	}
}
</script>
<%

%>
<form name="frmSQL" target="_new" method="POST" action="/Anaconda.do?CMD=CMD_SEQ_109548337141230722859312">
<div class="post">

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">SQL Executer</h3>
			<span class="fr">( JNDI List : 
		<select name="select_jndi" id="select_jndi" onChange="javascript:fn_select_jndi(this.selectedIndex);">
        <%
			Object[] jndis = ServiceLocator.getInstance().getJndis("java:comp/env");
		    for(int idx_jndis = 0; idx_jndis < jndis.length; idx_jndis++)
		   {
		%>
		   <option name="<%=jndis[idx_jndis]+""%>" value="<%=jndis[idx_jndis]+""%>"><%=jndis[idx_jndis]+""%></option>
		<%
           }
		%>
		</select>)</span>
			</div>
		</div>
	</div>
</div>



<div class="entry">
<p></p><p></p>

<table class="table_hydra">
  <caption></caption>
  <colgroup>
  <col width="20%"></col>
  <col></col>
  </colgroup>
  <thead>
  <th scope="col">Name</th>
  <th scope="col">Value</th>
  </thead>
  <tbody>
  <tr>
    <td align="center" >
    Data Source
    </td>
    <td>
	<INPUT type="text" class="styled" NAME="DATASOURCE" id="DATASOURCE" size="60" value="java:comp/env/jdbc/hsql">
    </td>
  </tr>
  <tr>
    <td align="center" >
    SQL
    </td>
    <td>
	<textarea name="SQL" id="SQL" style="width:540px;height:200px;"></textarea>
    </td>
  </tr>
  <tr>
    <td align="left" colspan="2">
      <button type="button" class="btn navbar-btn btn-info second-button"
       name="execute" onClick="javascript:executeSql();return false;">Execute SQL</button>
	<input type="button" class="button white" name="" value="Back" onClick="javascript:history.back();"></td>
  </tr>
  <tr>
    <td align="center" >
    RESULT
    </td>
    <td>
	<textarea name="SQL_RESULT" id="SQL_RESULT" style="width:540px;height:200px;"></textarea>
    </td>
  </tr>
  </tbody>
</table>

</div>
</div>
</form>

<script>
function executeSql(){
  with(frmSQL){
    select_jndi.value = $('#select_jndi').val();
    DATASOURCE.value = $('#DATASOURCE').val();
    SQL.value = $('#SQL').val();
    submit();
  }
}
function ajaxSql(){
   var d = {select_jndi:$('#select_jndi').val(),DATASOURCE:$('#DATASOURCE').val(),SQL:$('#SQL').val()};
   doJson(JSON.stringify(d),'CMD_SEQ_109548337141230722859312'
   ,(json)=>{
     // alert(json);
     var result = JSON.responseText.replaceAll("><",">\n<");
     $('#SQL_RESULT').val(result);
   },(error)=>{
     $('#SQL_RESULT').val(JSON.stringify(error));
   });
}
</script>
