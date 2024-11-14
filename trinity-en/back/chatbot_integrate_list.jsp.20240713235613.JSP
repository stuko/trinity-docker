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
/**
// ---------------------------------------------------------------------------------------
// JSP 코딩 규칙
// ---------------------------------------------------------------------------------------

out.println((프로세스결과타입)RequestHelper.getReturnValue(request,"프로세스 이름"));
Object object = request.getAttribute(InitClass.getReturnValue());
Object session_object = request.getAttribute(InitClass.getSessionValue());
Object businss_object = request.getAttribute(InitClass.getBusinessDataValue());

out.println((프로세스결과타입)RequestHelper.getReturnValue(request,"프로세스 이름");
BusinessCollection bc = RequestHelper. getBusinessCollection(request,"프로세스 이름");
BusinessCollection bc = RequestHelper. getBusinessCollection(request,"프로세스 이름");
BusinessHelper helper = new BusinessHelper();
helper.convertToTableRow(bc);

for(int i = 0; i > bc.size(); i++)
{
     BusinessData bd = bc.getBusinessData(i);
}

**/

BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getMyChatBotList");
%>

<div class="container-fluid" style="z-index:10;padding-top:20px;">
     <div class="card mb-3" style="padding-bottom:40px;">
           <div class="card-header">
             <h3>External SNS</h3>
           </div>
           <p style="color:blue">현재는 Telegram Messanger만 연동이 가능합니다. 다른 메신저와의 연동도 현재 확장 개발중에 있습니다.</p>
      </div>

<form id="frmChatbot" name="frmChatbot" method="POST" action="/Anaconda.do?CMD=">
  <div class="form-group">
   <label for="select">외부 메신저 벤더:</label>
   <select class="selectpicker" data-style="btn-primary" data-live-search="true" id="chatbot" onchange="javascript:getToken(this)">
     <option data-tokens="" value="">외부 메신저 벤더를 선택해 주세요</option>
     <option data-tokens="telegram" value="telegram">Telegram</option>
     <option data-tokens="slack" value="slack">Slack</option>
     <option data-tokens="kakao" value="kakao">Kakao</option>
<!--
     <option data-tokens="facebook" value="facebook">Facebook</option>
     <option data-tokens="twitter" value="twitter">Twitter</option>
-->
   </select>
  </div>

  <div class="form-group">
    <label for="text">챗봇 이름:</label>
    <input type="text" class="form-control" id="name" name="name">
  </div>
  <div class="form-group">
    <label for="text">챗봇 토큰 (* 카카오톡은 '봇 ID'):</label>
    <input type="text" class="form-control" id="token" name="token">
  </div>
  <button type="button" id="btn_save" class="btn btn-primary btn-lg" onclick="javascript:saveToken();">저장</button>
  <button type="button" id="btn_delete" class="btn btn-info btn-lg" onclick="javascript:deleteToken();">삭제</button>
</form>
</div>

<script>
function getToken(sel){
  if($('#chatbot').val() == '') return;
  var d = {chatbot : $('#chatbot').val()};
  post(d,"CMD_SEQ_108351953631563837065428",(json)=>{
     /*
     showPopup("success","Congratulation, You own ChatBot D/B was created",null);
     confirmPopup('success','New chatbot db was created, so You have to re-login', ()=>{
        document.location.href='/Anaconda.do?CMD=CMD_SEQ_100466023431495768917557';
     });
     */
     console.log(JSON.stringify(json));
     if(json.getMyChatBot && json.getMyChatBot.length > 0){
       if(json.getMyChatBot[0].name == '' || json.getMyChatBot[0].token == ''){
         alertPopup("fail","sorry, you don't have a chatbot for the " + $('#chatbot').val());
       }else{
         $('#name').val(json.getMyChatBot[0].name);
         $('#token').val(json.getMyChatBot[0].token);
       }
     }else{
       alertPopup("fail","sorry, you don't have a chatbot for the " + $('#chatbot').val());
     }
  },()=>{
     alertPopup("fail","Sorry. We were unable to retrieve the requested information.");
  });

}
function saveToken(){
  if($('#chatbot').val() == ''){
    showPopup("fail","Sorry, please select a chatbot vendor",null);
    return;
  }
  if($('#token').val() == ''){
    showPopup("fail","Sorry, please enter a chatbot token",null);
    return;
  }
  if($('#name').val() == ''){
    showPopup("fail","Sorry, please enter a chatbot name",null);
    return;
  }
  confirmPopup('success','Do you want to save the entered chatbot information?', ()=>{

    var d = {chatbot : $('#chatbot').val() , token : $('#token').val(), name : $('#name').val()};
    post(d,"CMD_SEQ_105579028771563839657163",(json)=>{
       showPopup("success","Congratulation, You ChatBot was saved",null);
    },()=>{
       showPopup("fail","Sorry. We were unable to retrieve the requested information.",null);
    });

  });

}
function deleteToken(){

  if($('#chatbot').val() == '') return;

  confirmPopup('success','Do you want to save the entered chatbot information?', ()=>{

    var d = {chatbot : $('#chatbot').val() , token : $('#token').val(), name : $('#name').val()};
    post(d,"CMD_SEQ_102422224321563837092584",(json)=>{
       showPopup("success","Congratulation, You ChatBot was deleted",null);
    },()=>{
       showPopup("fail","Sorry. We were unable to retrieve the requested information.",null);
    });

  });

}
</script>
