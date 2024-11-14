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
  BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getCompleteRuleEdit");
%>

<div class="container-fluid">

  <h2 class="pb-3 pt-2 border-bottom mb-5"><i class="far fa-calendar-alt"></i> 룰 편집하기
<button class="btn btn-danger mr-sm-2" onClick="javascript:document.location.href='/CMD_SEQ_103021811521618034457272.do'">미완성 룰 완성하기</button></h2>
  <h4><i class="fas fa-chevron-right"></i><strong style="margin-left:10px;">아래 완성된 룰을 변경해 주세요</strong> <br/></h4><br/>
  <%
    if(bc != null && bc.size() > 0 ) {
      for(int i = 0; i < bc.size() ; i++ ){
  %>
  <div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<!-- Start form -->
                    <h5><%= i+1 %>. <%=bc.getBusinessData(i).getFieldValue("context_name")%> (<%=bc.getBusinessData(i).getFieldValue("seq")%>)                  
                    <button class="btn btn-secondary mr-sm-2" onClick="javascript:saveInsufficientRule('form_<%=i%>')">저장</button></h5>
                    <form id='form_<%=i%>'>
                      <input type="hidden" name="seq" class="seq" value="<%=bc.getBusinessData(i).getFieldValue("seq")%>">
                      <div class="form-group">
                        <label for="exampleInputTitle">룰</label>
                        <textarea class="form-control rule" placeholder="룰을 입력해 주세요"><%=bc.getBusinessData(i).getFieldValue("rule")%></textarea>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputTitle">메시지</label>
                        <textarea class="form-control msg" placeholder="메시지를 입력해 주세요"><%=bc.getBusinessData(i).getFieldValue("msg")%></textarea>
                      </div>
                    </form>
                 </div>
  </div>
  <%
       }
     }
  %> 
</div>

<script>
function saveInsufficientRule(object){
    if($('#'+object).find('.rule').val() == '' || $('#'+object).find('.msg').val() == ''){
      alertPopup('경고','입력값을 확인해 주세요'); 
      return;
    }
    var d = { seq: $('#'+object).find('.seq').val()
             ,rule: $('#'+object).find('.rule').val()
             ,msg: $('#'+object).find('.msg').val()
           };
    console.log(d); 
    json(d,'CMD_SEQ_100601599431618036617778'
         ,(data)=>{
             simplePopup('성공','요청하신 정보를 저장하였습니다');
         },(err)=>{
             simplePopup('실패','요청하신 정보를 가져올수 없습니다.['+err+']');
    });
}
</script>

