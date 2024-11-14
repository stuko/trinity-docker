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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"list");
%>
<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
      <i class="fas fa-cubes"></i>&nbsp;Social Project
    </h3>	
    <p>
<% if(bc != null && bc.size() > 0){ %>
      <li>소셜 프로젝트관리를 해제 하시려면, 아래의 '소셜프로젝트 관리 해제' 버튼을 눌러 주세요
      <li>현재는 소셜프로젝트 관리를 사용하고 계십니다.
<% }else { %>
      <li>소셜 프로젝트를 시작하려면, 아래의 '소셜프로젝트 관리 설정' 버튼을 눌러 주세요
      <li>현재는 소셜프로젝트 관리를 사용하지 않고 계십니다.
<% } %>
    </p>
  <span class="fr">
<% if(bc != null && bc.size() > 0){ %>
   <button class="btn btn-secondary" name="Cancel" onClick="javascript:fnCancel('<%=bc.getBusinessData(0).getFieldValue("push_key")%>');">소셜 프로젝트 관리 해제</button>
<% }else { %>
   <input type="text" name="channel" id="channel" size="50" style="margin-right:10px" placeholder="채널 정보를 입력해 주세요" value=''>
   <button class="btn btn-secondary" name="Register" onClick="javascript:fnRegister();">소셜 프로젝트 관리 설정</button>
<% } %>
  </span>
 
<script language="javascript">
function fnRegister(){
  if($('#channel').val() == '') {
    alertPopup('경고','채널 정보를 입력해 주세요. ex)채팅 아이디');
    return;
  }
  confirmPopup('확인','소셜 프로젝트 일정 관리를 설정할까요?',()=>{
   var d = {code : 'create', channel: $('#channel').val()};     
   post(d,'CMD_SEQ_104313429861665530853335', 
        (data)=>{ 
           alertPopup('성공','소셜 프로젝트 일정 관리를 사용할 수 있도록 설정 하였습니다.');
           document.location.reload(); 
         } , 
        (err)=>{
           alertPopup('실패','오류가 발생 하였습니다.');
         });  
  });


}
function fnCancel(key){
  if(!confirm('해제 하시겠습니까?')) return;
  var d = {code : 'delete' , push_key : key};     
  post(d,'CMD_SEQ_104313429861665530853335', 
        (data)=>{ 
           alertPopup('성공','소셜 프로젝트 일정 관리설정을 해제 하였습니다.');
           document.location.reload();
         } , 
        (err)=>{
           alertPopup('실패','오류가 발생 하였습니다.');
         });

}
</script>
