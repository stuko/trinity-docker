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

%>
<script language="javascript">
function fnList(){
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_102510211121574893072709";
}
function fnSave(){
  ajaxConda('frmDataBase','CMD_SEQ_108301194481574893098313',true,()=>{
    alertPopup('알림','정상적으로 저장 하였습니다.');
    document.location.href = "/Anaconda.do?CMD=CMD_SEQ_102510211121574893072709";
  });
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
  DB 연결정보 생성하기
  </h3>	
  <span class="fr">
   <input type="button" class="btn btn-primary" name="Register" value="목록으로 가기" onClick="javascript:fnList();">
   <input type="button" class="btn btn-secondary" name="Register" value="생성하기" onClick="javascript:fnSave();">
  </span>
 </div>
</div>

<br>
<form name="frmDataBase" id="frmDataBase">
<table  class="table table-condensed" >
   <tbody>
      <tr><td>DB 연결 이름</td><td><input class="form-control"   required="required" type="text" size="50" name="jndi" id="jndi" placeholder="Enter the connection name" > * java:comp/env/jdbc/{name}</td></tr>     
     <tr><td>DB 연결 URL</td><td><input class="form-control"    required="required"  type="text" size="50" name="url" id="url" placeholder="Enter the connection URL" > * jdbc:{vendor}://{ip}:{port}/{db}</td></tr>
     <tr><td>JDBC 드라이버 클래스 이름</td><td><input class="form-control"    required="required"  type="text" size="50" name="driver" id="driver" placeholder="Enter the driver class name" ></td></tr>
     <tr><td>아이디</td><td><input class="form-control"    required="required"  type="text" size="50" name="id" id="id" placeholder="Enter the database account" ></td></tr>
     <tr><td>비밀번호</td><td><input class="form-control"    required="required"  type="text" size="50" name="password" id="password" placeholder="Enter the database password" ></td></tr>
     <tr><td>최대 연결 갯수</td><td><input class="form-control numberOnly"   required="required"  type="text" size="50" name="max" id="max" placeholder="Enter the max count of connection" > * Only number</td></tr>
     <tr><td>최소 연결 갯수</td><td><input class="form-control numberOnly"   required="required"  type="text" size="50" name="idle" id="idle" placeholder="Enter the min count of connection" > * Only number</td></tr>
     <tr><td>SQL 검증 쿼리</td><td><input class="form-control"    required="required"  type="text" size="50" name="validate" id="validate" placeholder="Enter the validation qurey" ></td></tr>

   </tbody>
</table>
</form>
