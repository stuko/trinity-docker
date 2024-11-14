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
<%@ page import="com.stuko.anaconda.util.InitClass"%>

 <%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getTrinityService");
%>
 <div id="page-wrapper" class="gray-bg">

  <%@ include file="/jsp/API/sub_top_common.jsp" %>

<div class="wrapper wrapper-content animated fadeInRight">

             <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        
                       <div class="ibox-title">
<button id="list" name="list" class="btn btn-sm btn-primary" type="button" 
       onClick="javascript:fnGoServiceList();"><< 서비스 목록 으로 돌아가기</button>
  
                            <h3 style="font-weight:bold">REST API 서비스</h3>
                            <div class="ibox-content">
                            <form name="frm" id="frmService" method="post" class="form-horizontal" action="/Anaconda.do?CMD=CMD_SEQ_105864769331287842547280">
                               <input type="hidden"  name="return_url" value="/Anaconda.do?CMD=CMD_SEQ_101546461141516501853438">
                               <input type="hidden" name="code" value="ins" />
                               <input type="hidden" name="colBizName" value="<%=bc.getBusinessName()%>" >
 
                                <div class="form-group"><label class="col-sm-2 control-label">REST API 서비스 이름</label>
                                    <div class="col-sm-10">
                                           <input type="text" class="form-control" id="colKorbizname" name="colKorbizname" value="<%=bc.getBIZ_COLLECTION_KOR_NAME()%>">
                                     </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                     <div class="col-md-10">
 
                                          <button id="save" name="save" class="btn btn-sm btn-primary" type="button" onClick="javascript:fnModifyTrinityService();">서비스 저장</button>
                                    </div> 
                              </div>
                             <div class="hr-line-dashed"></div>

<div>
<ul>
<li>아래 프로세스 이름은 공백 혹은 특수문자를 입력할 수 없습니다.</li>
<li>프로세스 이름을 변경하실 경우, 기존 프로세스의 내용이 삭제되므로, 주의해주시기 바랍니다.                                          <button id="add-more" name="add-more" class="btn btn-sm btn-primary" type="button">+ 프로세스 추가하기</button></li>
</ul>
</div>

<div class="ibox-content">

     <table class="table">
         <thead>
             <tr>
                <th>번호</th>
                <th>프로세스 이름</th>
                <th>기능</th>
             </tr>
         </thead>
         <tbody id="processTable">
 <%
   for(int i = 0; i < bc.size(); i++){
           String process_name = bc.getBusinessData(i).getBusinessName();
           String process_desc = bc.getBusinessData(i).getDESC();
%>
<tr id="field<%=i+1%>">
   <input id="desc" name="desc" type="hidden" value=''>
   <td><%=i+1%></td>
   <td>
     <div class="form-group"> 
       <input id="bizname" name="bizname" type="text" onBlur="fnCheckBizName(this)" placeholder="프로세스 이름을 입력하세요 ex) 공백 혹은 특수문자는 사용할 수 없습니다." class="form-control input-md"  value="<%=process_name %>"> 
     </div>
   </td>
   <td>
    <button id="save" name="save" class="btn btn-sm btn-primary" type="button" 
       onClick="javascript:fnModifyBusinessProcess('<%=bc.getBusinessName()%>','<%=process_name %>');">프로세스 편집</button>
    <button id="remove<%=i+1%>" class="btn btn-sm btn-danger remove-me"  type="button" 
       onClick="javascript:fnRemoveProcess('field<%=i+1%>');">프로세스 삭제</button>
  
   </td>
  </tr>
<%
   }
%>
         </tbody>
       </table>
</div>


                             <div class="hr-line-dashed"></div>
                          </form>
                         </div>
                  </div>

                    </div>
               </div>
           </div>

<script>
function fnGoServiceList(){
   history.back();
}
function fnModifyBusinessProcess(colBizName, bizName){
     document.location.href='/Anaconda.do?CMD=CMD_SEQ_106383669491516577026276&colBizName=' + colBizName + '&bizName='+ bizName;
}


function fnRemoveProcess(div_id){
   $('#'+div_id).remove();
}
function fnModifyTrinityService(){
    var d = $("#frmService").serialize();
    confirmPopup("확인","변경한 내용을 저장하시겠습니까?",()=>{
        post(d,'CMD_SEQ_107516969181516549102113',(json)=>{
                 showPopup('성공', "축하합니다. 요청하신 REST 서비스 변경사항이 적용되었습니다.","/Anaconda.do?CMD=CMD_SEQ_109602875151516493932720");
            } , 
            ()=>{
                 showPopup('실패', "죄송합니다. 요청하신 REST 서비스 변경사항이 적용되지 않았습니다.",null);
            } );     
    });
    }


function fnCheckBizName(object){
  if($.isNumeric($(object).val())){
     simplePopup('경고','프로세스 이름은 숫자를 입력할 수 없습니다.');
     $(object).val('');      
     return;
  }
}


$(document).ready(function () {

    $("#add-more").click(function(e){
    var row = $('#processTable tr').length + 1;
    var tr  = ' <tr id="field'+row+'">'+
              '<input id="desc" name="desc" type="hidden" value="">' +
              ' <td>'+row+'</td>'+
              '   <td>'+
              '     <div class="form-group"> '+
              '       <input id="bizname" name="bizname" type="text"  onBlur="fnCheckBizName(this)" placeholder="프로세스 이름을 입력하세요 ex) '+
              ' 공백 혹은 특수문자는 사용할 수 없습니다." class="form-control input-md"  value=""> '+
              '      </div>'+
              '   </td>'+
              '   <td>'+
              '    <button id="remove'+row+'" class="btn btn-sm btn-danger remove-me"  type="button" '+
              '       onClick="javascript:fnRemoveProcess(\'field'+row+'\');">프로세스 삭제</button>'+
              '   </td>'+
              '  </tr>';
     $("#processTable").append(tr);
    });

});

</script>

</div>
  <%@ include file="/jsp/API/sub_footer_common.jsp" %>
 
</div>


     <div id="original" style="display:none">
          <div class="form-group"> 
             <label class="col-md-4 control-label" for="action_id">Process Name</label>
               <div class="col-md-4"> <input id="bizname" name="bizname" type="text" placeholder="input process name ex) do not use space or special character" class="form-control input-md"  value=""> 
               </div>
         </div>
         <div class="hr-line-dashed"></div>
          <div class="form-group"> 
             <label class="col-md-4 control-label" for="action_id">Process Desc.</label>
               <div class="col-md-4"> <input id="desc" name="desc" type="text" placeholder="" class="form-control input-md"  value=""> 
               </div>
         </div>
         <div class="hr-line-dashed"></div>
     <div>
