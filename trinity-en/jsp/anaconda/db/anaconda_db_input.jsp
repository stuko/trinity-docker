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
String member_id = "";
if(session.getAttribute(InitClass.getSESSION_DOMAIN()) != null)
{
	Object object = session.getAttribute(InitClass.getSESSION_DOMAIN());
	IAuth auth = (IAuth)object;
	member_id = auth.getAuthItem(("MEMBER_NAME"));
}

%>

<div>
 <div class="content-module-heading cf">
  <h3 class="fl">
  Create database connection
  </h3>	
  <span class="fr">
   <button type="button" class="btn btn-primary" id="btnSave" onClick="javascript:fnSaveDataBase();">Create</button>&nbsp;
   <button type="button" class="btn btn-secondary" onClick="javascript:fnList();">Back</button>
  </span>
 </div>
</div>


<form name="frmDataBase" id="frmDataBase">
<table class="table-neo">
   <tbody>
      <tr><td>Connection name</td><td><input class="styled"  required="required" type="text" size="50" name="jndi" id="jndi" placeholder="Enter the connection name" > * java:comp/env/jdbc/{name}</td></tr>     
     <tr><td>Connection URL</td><td><input class="styled"   required="required"  type="text" size="50" name="url" id="url" placeholder="Enter the connection URL" > * jdbc:{vendor}://{ip}:{port}/{db}</td></tr>
     <tr><td>Driver class name</td><td><input class="styled"   required="required"  type="text" size="50" name="driver" id="driver" placeholder="Enter the driver class name" ></td></tr>
     <tr><td>Account</td><td><input class="styled"   required="required"  type="text" size="50" name="id" id="id" placeholder="Enter the database account" ></td></tr>
     <tr><td>Password</td><td><input class="styled"   required="required"  type="text" size="50" name="password" id="password" placeholder="Enter the database password" ></td></tr>
     <tr><td>Max</td><td><input class="styled numberOnly"   required="required"  type="text" size="50" name="max" id="max" placeholder="Enter the max count of connection" > * Only number</td></tr>
     <tr><td>Min</td><td><input class="styled numberOnly"   required="required"  type="text" size="50" name="idle" id="idle" placeholder="Enter the min count of connection" > * Only number</td></tr>
     <tr><td>SQL Validation query </td><td><input class="styled"   required="required"  type="text" size="50" name="validate" id="validate" placeholder="Enter the validation qurey" ></td></tr>

   </tbody>
</table>
</form>

<script language="javascript">

function fnList(){
   document.location.href = "/Anaconda.do?CMD=CMD_SEQ_103530981101559962079937";
}

function fnSaveDataBase(){
  confirmPopup('경고','저장 하시겠습니까?',()=>{
     ajaxConda('frmDataBase','CMD_SEQ_106605211491559976106028', true, ()=>{
        alertPopup('성공','요청 하신 내용을 저장 하였습니다.');
        fnList();
     });
  });
}

</script>
