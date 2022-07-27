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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getDBInfo");

String url = "";
String driver = "";
String id = "";
String password = "";
String jndi = "";
String max = "";
String idle = "";
String seq = "";
String validate = "";

if(bc != null && bc.size() > 0){
   url = bc.getBusinessData(0).getFieldValue("URL");
   driver = bc.getBusinessData(0).getFieldValue("DRIVER");
   id = bc.getBusinessData(0).getFieldValue("ID");
   password = bc.getBusinessData(0).getFieldValue("PASSWORD");
   jndi = bc.getBusinessData(0).getFieldValue("JNDI");
   max = bc.getBusinessData(0).getFieldValue("TOTAL");
   idle = bc.getBusinessData(0).getFieldValue("IDLE");
   seq = bc.getBusinessData(0).getFieldValue("SEQ");
   validate = bc.getBusinessData(0).getFieldValue("VALIDATE");
}

String member_id = "";
if(session.getAttribute(InitClass.getSESSION_DOMAIN()) != null)
{
	Object object = session.getAttribute(InitClass.getSESSION_DOMAIN());
	IAuth auth = (IAuth)object;
	member_id = auth.getAuthItem(("MEMBER_NAME"));
}

%>
<script language="javascript">
function fnList(){
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_103530981101559962079937";
}
function fnSave(){
  ajaxConda('frmDataBase','CMD_SEQ_107654466701559979600649',null);
}
$(function(){
    $("form").validate();
})
$(document).ready(function() {
   $(".numberOnly").keyup(function(){$(this).val( $(this).val().replace(/[^0-9]/g,"") );} );
});


</script>

<div>
 <div class="content-module-heading cf">
  <h3 class="fl">
  Modify database connection
  </h3>	
  <span class="fr">
   <button type="button" class="btn btn-primary" name="Register" value="Save" onClick="javascript:fnSave();">Save</button>
   <button type="button" class="btn btn-secondary" name="Register" value="Back" onClick="javascript:fnList();">Back</button>
  </span>
 </div>
</div>


<form name="frmDataBase" id="frmDataBase">
  <input type="hidden" name="seq" value="<%=seq%>">
<table class="table-neo">
   <thead>
    <col width="20%" />
    <col width="80%" />
   </thead>
   <tbody>
      <tr><td>Connection name</td><td><input class="styled"  required="required" type="text" size="50" name="jndi" id="jndi" placeholder="Enter the connection name" value="<%=jndi%>"> * java:comp/env/jdbc/{name}</td></tr>     
     <tr><td>Connection URL</td><td><input class="styled"   required="required"  type="text" size="50" name="url" id="url" placeholder="Enter the connection URL" value="<%=url%>"> * jdbc:{vendor}://{ip}:{port}/{db}</td></tr>
     <tr><td>Driver class name</td><td><input class="styled"   required="required"  type="text" size="50" name="driver" id="driver" placeholder="Enter the driver class name" value="<%=driver%>"></td></tr>
     <tr><td>Account</td><td><input class="styled"   required="required"  type="text" size="50" name="id" id="id" placeholder="Enter the database account" value="<%=id%>"></td></tr>
     <tr><td>Password</td><td><input class="styled"   required="required"  type="text" size="50" name="password" id="password" placeholder="Enter the database password" value="<%=password%>"></td></tr>
     <tr><td>Max</td><td><input class="styled numberOnly"   required="required"  type="text" size="50" name="max" id="max" placeholder="Enter the max count of connection" value="<%=max%>"> * Only number</td></tr>
     <tr><td>Min</td><td><input class="styled numberOnly"   required="required"  type="text" size="50" name="idle" id="idle" placeholder="Enter the min count of connection" value="<%=idle%>"> * Only number</td></tr>
     <tr><td>SQL Validation query </td><td><input class="styled"   required="required"  type="text" size="50" name="validate" id="validate" placeholder="Enter the validation qurey" value="<%=validate%>"></td></tr>
   </tbody>
</table>
</form>
