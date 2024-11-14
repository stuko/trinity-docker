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
// BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getDataBaseInfo");
%>
 <div id="page-wrapper" class="gray-bg">

  <%@ include file="/jsp/API/sub_top_common.jsp" %>

<div class="wrapper wrapper-content animated fadeInRight">

             <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        
                       <div class="ibox-title">
                            <button id="save" name="save" class="btn btn-primary" type="button" onClick="javascript:fnGoServiceList();"><< 서비스 목록으로 돌아가기</button>
                            <h3 style="font-weight:bold">REST API 서비스 정보</h3>
                            <div class="ibox-content">
                            <form name="frm" id="frmService" method="post" class="form-horizontal" action="/Anaconda.do?CMD=CMD_SEQ_105864769331287842547280">
              <input id="desc" name="count" type="hidden" value="1">
              <input id="desc" name="cacheText" type="hidden" value="">

                               <input type="hidden"  name="return_url" value="/Anaconda.do?CMD=CMD_SEQ_101546461141516501853438">
                               <input type="hidden" name="code" value="ins" />
 
                                <div class="form-group"><label class="col-sm-2 control-label">REST API 서비스 이름</label>
                                    <div class="col-sm-10">
                                           <input type="text" class="form-control" id="colKorbizname" name="colKorbizname" value="">
                                     </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                     <div class="col-md-10">
                                          
                                          <button id="save" name="save" class="btn btn-primary" type="button" onClick="javascript:fnSaveTrinityService();">서비스 저장</button>
                                          
                                    </div> 
                              </div>
                             <div class="hr-line-dashed"></div>
 <div class="ibox-content">
     <button id="add-more" name="add-more" class="btn btn-primary" type="button">+ 프로세스 추가</button>
     <table class="table">
         <thead>
             <tr>
                <th>번호</th>
                <th>프로세스 이름</th>
                <th>기능</th>
             </tr>
         </thead>
         <tbody id="processTable">
 
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


function fnSaveTrinityService(){
    var d = $("#frmService").serialize();

    if($('#colKorbizname').val() == '') {
         showPopup('경고', "서비스 이름을 입력하셔야 합니다.",null);
         return;
    }
    if($('#bizname').val() == '') {
         showPopup('경고', "최소 1개이상의 프로세스를 추가하셔야 합니다.",null);
         return;
    }

    confirmPopup("확인","변경한 내용을 저장하시겠습니까?",()=>{
        post(d,'CMD_SEQ_108126675501516534303266',(json)=>{
                 showPopup('성공', "축하합니다. 요청하신 REST 서비스가 등록되었습니다.","/Anaconda.do?CMD=CMD_SEQ_109602875151516493932720");
            } , 
            ()=>{
                 showPopup('실패', "죄송합니다. 요청하신 REST 서비스가 등록되지 않았습니다.",null);
            } );     

    });

}

function fnGoServiceList(){
   location.href="/Anaconda.do?CMD=CMD_SEQ_109602875151516493932720";
}

function fnRemoveProcess(div_id){
   $('#'+div_id).remove();
}

$(document).ready(function () {

    $("#add-more").click(function(e){
    var row = $('#processTable tr').length + 1;
    var tr  = ' <tr id="field'+row+'">'+
              '<input id="desc" name="desc" type="hidden" value="">' +
              ' <td>'+row+'</td>'+
              '   <td>'+
              '     <div class="form-group"> '+
              '       <input id="bizname" name="bizname" type="text" placeholder="프로세스 이름을 입력하세요 ex) '+
              ' 공백 혹은 특수문자는 사용할 수 없습니다." class="form-control input-md bizname" onBlur="fnCheckBizName(this)"  value=""> '+
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

function fnCheckBizName(object){
  if($.isNumeric($(object).val())){
     simplePopup('경고','프로세스 이름은 숫자를 입력할 수 없습니다.');
     $(object).val('');      
     return false;
  }
  if($(object).val() == ''){
     simplePopup('경고','프로세스 이름은 공백을 입력할 수 없습니다.');
     $(object).val('');      
     return false;
  }
  return true;
}

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
