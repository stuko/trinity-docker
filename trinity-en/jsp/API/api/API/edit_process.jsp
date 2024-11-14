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
BusinessData businessProcess = (BusinessData)RequestHelper.getReturnValue(request,"getBusinessProcess");
String colBizName = request.getParameter("colBizName");
String bizName = request.getParameter("bizName");
%>

 <div id="page-wrapper" class="gray-bg">

  <%@ include file="/jsp/API/sub_top_common.jsp" %>

<div class="wrapper wrapper-content animated fadeInRight">

             <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        
                       <div class="ibox-title">
<button id="save" name="save" class="btn btn-sm btn-primary" type="button" onClick="javascript:fnGoService();"><< 서비스 편집으로 돌아가기</button>
                            <h3 style="font-weight:bold">REST API 서비스의 하위 프로세스</h3>
                            <div class="ibox-content">
                            <form name="frm" id="frmProcess" method="post" class="form-horizontal">
                               <input type="hidden" name="code" value="mod" >
                               <input type="hidden" name="bizName" value="<%=bizName%>" >
                               <input type="hidden" name="bizColName" value="<%=colBizName%>" >
                                <div class="form-group"><label class="col-sm-2 control-label">프로세스 이름(영문,공백 특수문자 불가)</label>
                                    <div class="col-sm-10">
                                           <h2><%=businessProcess.getBusinessName()%></h2>
                                     </div>
                                </div>
                             <div class="hr-line-dashed"></div>


      <div class="form-group">
               <label class="col-md-2 control-label" for="action_name">프로세스 종류</label> 
                  <div class="col-sm-10">
                         <select class="form-control m-b" name="biz_type" id="biz_type">
                                  <option value="SAAS_SQL" <%=(businessProcess != null && businessProcess.getTYPE().equals("SAAS_SQL") ? "Selected" : "") %>>SQL 문장 실행 </option>
                                  <option value="POJO" <%=(businessProcess != null && businessProcess.getTYPE().equals("POJO") ? "Selected" : "") %>>Class 메서드 실행</option>
                                  <option value="JAVA" <%=(businessProcess != null && businessProcess.getTYPE().equals("JAVA") ? "Selected" : "") %>>JAVA Source 실행</option>
                                  <option value="JAVASCRIPT" <%=(businessProcess != null && businessProcess.getTYPE().equals("JAVASCRIPT") ? "Selected" : "") %>>JAVASCRIPT 실행</option>
                                  <option value="JSON" <%=(businessProcess != null && businessProcess.getTYPE().equals("JSON") ? "Selected" : "") %>>JSON 정보 추가</option>

                         </select>
                </div>
         </div>
    <div class="hr-line-dashed"></div>
   <div  id="pojoClassView">
         <div class="form-group">
                  <label class="col-md-2 control-label" for="action_json">클래스 파일명<br>(패키지명 포함)</label> 
                      <div class="col-md-10">
                             <input type="text" class="form-control m-b"  id="pojoClassName" name="pojoClassName" value="<%=businessProcess.getPOJO_CLASS()%>">
                      </div>
         </div>
    <div class="hr-line-dashed"></div>
    </div>
         <div class="form-group">
                  <label class="col-md-2 control-label" for="action_json"><div id="processContents">SQL 문장</div></label> 
                      <div class="col-md-10">
<textarea class="form-control m-b"  id="service_name" name="service_name" rows="5" cols="30"><%=BusinessHelper.revertBR(businessProcess.getSERVICE_NAME())%></textarea>
                      </div>
         </div>
    <div class="hr-line-dashed"></div>

                    <div class="form-group">
                                     <div class="col-md-10">
                                           
                                          <button id="save" name="save" class="btn btn-sm btn-primary" type="button" onClick="javascript:fnSaveBusinessProcess();">프로세스 저장</button>
                                          
                                    </div> 
                              </div>

  <div class="form-group">
                  <div class="col-sm-12">
                         <h3>입력 변수 정보  <button id="add-more" name="add-more" class="btn btn-sm btn-primary" type="button">+ 입력변수 추가</button></h>
                </div>
 </div>
<div class="form-group" style="margin-bottom:0xp;">
       <div class="col-md-4">변수 이름</div>
       <div class="col-md-2">변수 유형</div>
          <div class="col-md-4">값</div>
         <div class="col-md-2">기능</div>
 </div>

 <div class="hr-line-dashed"></div>
<%
for(int i = 0; i < businessProcess.size(); i++){
    BusinessItem item = businessProcess.getBusinessItem(i);
%>
     <div class="form-group" id="param<%=i%>" style="margin-bottom:0xp;">
       <div class="col-md-4">
             <input  class="form-control m-b" name='field_name' type='text' size='25' value='<%=item.getFieldName()%>'>
       </div>
       <div class="col-md-2">
        <SELECT NAME='field_type'  class="form-control m-b"  >
              <OPTION value='KEY'  <%=(item.FIELD_TYPE.equals("KEY") ? "Selected" : "") %> >KEY 자동생성</OPTION>
              <OPTION value='CURRENT_DATE'  <%=(item.FIELD_TYPE.equals("CURRENT_DATE") ? "Selected" : "") %>  >현재일시</OPTION>
               <OPTION value='STRING  <%=(item.FIELD_TYPE.equals("STRING  ") ? "Selected" : "") %> '>문자</OPTION>
               <OPTION value='INT'   <%=(item.FIELD_TYPE.equals("INT") ? "Selected" : "") %> >숫자</OPTION>
               <OPTION value='REFERENCE'  <%=(item.FIELD_TYPE.equals("REFERENCE") ? "Selected" : "") %>  >변수참조</OPTION>
               <OPTION value='REFER_ENCRYPT'  <%=(item.FIELD_TYPE.equals("REFER_ENCRYPT") ? "Selected" : "") %>  >암호화</OPTION>
               <OPTION value='REFER_DECRYPT'  <%=(item.FIELD_TYPE.equals("REFER_DECRYPT") ? "Selected" : "") %>  >복호화</OPTION>
          </SELECT>
          </div>
          <div class="col-md-4">
          <input  class="form-control m-b"  name='field_value' type='text' class='styled'  size='25' value='<%=item.getValue()%>'>
           </div>
         <div class="col-md-2">
          <button id="delete" name='delete' type='button'  class="btn btn-sm btn-danger" onClick="javascript:fnDeleteParameter('param<%=i%>')">삭제</button>
         </div>
        </div>
<%
}
%>


            
                                <div class="form-group">
                                     <div class="col-md-10">
                                           <div id="field">  
                                                <div id="field0">
                                                </div>
                                          </div>
                                    </div> 
                              </div>
                             <div class="hr-line-dashed"></div>
                          </form>
                         </div>
                  </div>

                    </div>
               </div>
           </div>

<script>
<%
if(businessProcess != null && businessProcess.getTYPE().equals("POJO")){
%>
    $('#pojoClassView').show();
<%
}else{
%>
    $('#pojoClassView').hide();
<%
}
%>
<%
if(businessProcess != null && businessProcess.getTYPE() != null){
%>
fnShowProcessTitle('<%=businessProcess.getTYPE()%>');
<%
}
%>

$('#biz_type').on('change', function() {
    fnShowProcessTitle($(this).find(":selected").val());
});

function fnGoService(){
  history.back();
}
function fnShowProcessTitle(processType){

      if(processType == 'SAAS_SQL') {
          $('#processContents').html('SQL 문장');
      } else if(processType == 'POJO') {
          $('#processContents').html('Class 메서드');
      } else if(processType == 'JAVA') {
          $('#processContents').html('Java 소스');
      } else if(processType == 'JAVASCRIPT') {
          $('#processContents').html('JavaScript 소스');
      } else if(processType == 'JSON') {
          $('#processContents').html('JSON 데이터');
      }

    if(frmProcess.biz_type.value == 'POJO'){
          $('#pojoClassView').show();
    }else{
          $('#pojoClassView').hide();
    }

}

function fnDeleteParameter(pid){
    $('#'+pid).remove();
}

function fnSaveBusinessProcess(){
    var d = $("#frmProcess").serialize();
    confirmPopup("확인","변경한 내용을 저장하시겠습니까?",()=>{
        post(d,'CMD_SEQ_103361008071516577033366',(json)=>{
                 showPopup('성공', "축하합니다. 요청하신 프로세스 변경사항이 적용되었습니다.",null);
            } , 
            ()=>{
                 showPopup('실패', "죄송합니다. 요청하신 프로세스 변경사항이 적용되지 않았습니다.",null);
            } );     
    });}


$(document).ready(function () {
    var next = 0;
    $("#add-more").click(function(e){
        e.preventDefault();
        var addto = "#field" + next;
        next = next + 1;
        var contents = $('#parameter').html();
        var newIn = '<div id="field'+next+'">' + contents + '</div>';

        var newInput = $(newIn);
        var btn = newInput.find('button');
        var delNum = next;
        btn.bind("click", function(){
              $('#field'+delNum).remove();
        });
        $(addto).after(newInput);
        // $("#field" + next).attr('data-source',$(addto).attr('data-source'));
         // $("#count").val(next);  
    });

});

</script>

</div>
  <%@ include file="/jsp/API/sub_footer_common.jsp" %>
 
</div>


     <div id="parameter" style="display:none">
      <div class="form-group"  style="margin-bottom:0xp;">
       <div class="col-md-4">
             <input  class="form-control m-b" name='field_name' type='text' size='25' value=''>
       </div>
       <div class="col-md-2">
        <SELECT NAME='field_type'  class="form-control m-b"  >
              <OPTION value='KEY' >KEY 자동생성</OPTION>
              <OPTION value='CURRENT_DATE' >현재일시</OPTION>
               <OPTION value='STRING'>문자</OPTION>
               <OPTION value='INT' >숫자</OPTION>
               <OPTION value='REFERENCE' >변수참조</OPTION>
               <OPTION value='REFER_ENCRYPT' >암호화</OPTION>
               <OPTION value='REFER_DECRYPT' >복호화</OPTION>
          </SELECT>
          </div>
          <div class="col-md-4">
          <input  class="form-control m-b"  name='field_value' type='text' size='25' value=''>
           </div>
         <div class="col-md-2">
          <button id="delete" name='delete' type='button'  class="btn btn-sm btn-danger">삭제</button>
         </div>
        </div>
    </div>
