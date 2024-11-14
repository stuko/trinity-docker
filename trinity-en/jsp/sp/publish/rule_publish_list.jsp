<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%
// String rule_group = request.getParameter("rule_group");
String kind = request.getParameter("kind");

BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"getMyRuleContext");
BusinessCollection bc2 = RequestHelper.getBusinessCollection(request,"getMyPublishedScenario");
BusinessCollection bc3 = RequestHelper.getBusinessCollection(request,"totalCount");
String count = bc3.getBusinessData(0).getFieldValue("count");
int intCount = Integer.parseInt(count);
String UploadFolder = InitClass.getInstance().getData("UploadFolder");
%>

 <div class="container-fluid">
	<h3 class="page-header"><img src="/jsp/sp/img/context.png" width="40px">&nbsp; Public Rule <i class="fas fa-certificate fa-2x" style="color:#FF5733;"></i></h3>
        <p>
        직접 만드신 대화 시나리오를 <a href="http://www.socialproject.net/" target="_new" style="color:blue;font-weight:bold;font-size:17px">외부</a>에 공개하여 여러 사람들이 사용할 수 있도록 설정하는 화면입니다. 공개시 유/무료를 설정하실 수 있으며, <a href="/Anaconda.do?CMD=CMD_SEQ_100391472611595976177715" style="color:blue;font-weight:bold;font-size:17px">유료로 설정하실 경우</a> 필요한 <a href="/Anaconda.do?CMD=CMD_SEQ_100391472611595976177715" style="color:blue;font-weight:bold;font-size:17px">여기</a>로 이동하여 가격과 입금 방식을 설정해 주시기 바랍니다. 유료로 설정하실 경우 사이트 정책에 따른 <a href="/Anaconda.do?CMD=CMD_SEQ_104066038791595977316903" style="color:blue;font-weight:bold;font-size:17px">수수료 정책</a>을 참고해주시기 바랍니다.
        </p>
	<div class="row">
	    <div class="col-lg-12">

               <div id="div_save_rule_context" >
	         <div class="table-responsive">
                        <table class="table" width="100%" id="dataTable">
			<colgroup>
				<col width="200px"></col>
				<col></col>
			</colgroup>
			<tbody>
				<tr>
				  <td colspan="2"  style="text-align:right">
				    <button type="button" class="btn btn-lg btn-success" 
                                      onClick="javascript:publishScenario();">
                                      저장하기
                                    </button>
                                    <button type="button" class="btn btn-lg btn-notify" 
                                      onClick="javascript:reset();">
                                      새로입력
                                    </button>
			          </td>
				</tr>

                               <form name="frmScenario" method="post" action="/Anaconda.do">
		                  <input type="hidden" name="CMD" value=""></input>
		                  <input type="hidden" name="PS_KEY" id="PS_KEY" value=""></input>
			        <tr>
				  <td>대화 시나리오 이름</td>
				  <td><input type="text" name="PS_NAME" id="PS_SUBJECT" size="100"  style="width:90%;"></input></td>
				</tr>
				<tr>
				  <td>대화 시나리오 설명</td>
				  <td><textarea name="PS_DESC" id="PS_DESC" style="width:90%;height:200px;"></textarea></td>
				</tr>
                                <tr>
				  <td>대화 시나리오 룰</td>
				  <td>
                                    <select name="PS_RULE_CONTEXT_SEQ" id="PS_RULE_CONTEXT_SEQ" style="width:90%;">
                                       <option value="" >Select</option>
                                       <% for(int i = 0; i < bc1.size() ; i++){ %>
				         <option value="<%=bc1.getBusinessData(i).getFieldValue("seq")%>" >
                                          <%=bc1.getBusinessData(i).getFieldValue("context_name")%>[<%=bc1.getBusinessData(i).getFieldValue("seq")%>]
                                         </option>
                                       <% } %>
				     </select>
                                  </td>
				</tr>
                                <tr>
				  <td>대표 이미지<br> (/jsp/sp/img/duna_chat_bg.png)</td>
				  <td><input type="text" name="PS_NAME" id="PS_IMAGE" size="100"  style="width:90%;" placeholder="input image path"
                                       value="/jsp/sp/img/duna_chat_bg.png"></input>
                                 </td>
				</tr>

				
                                </form>

                                <tr id='image_upload_tr' style='display:none'>
                                  <td>파일 업로드 하기</td>
                                  <td>
                                    <table style="border:0;">
                                     <tr>
                                       <td>
                                        <div>
                                          <form id="frmUpload" name="frmUpload" enctype="multipart/form-data" accept-charset="UTF-8" 
                                            action="/ext/Anaconda.do?CMD=CMD_SEQ_106920212691594648079203" method="POST" onSubmit="return false">
                                           <input type="hidden" name="FileUploadSubmit" value="true">
                                           <input type="hidden" name="FILE_KEY" id="FILE_KEY" value="">
                                           <input type="hidden" name="FILE_NAME" id="FILE_NAME" value="">   
                                           <input name="fileTest" id="fileTest" type="file" />
                                         </form>
                                       </div>
                                     </td>
                                     <td>
                                      <div> <input type="button" class="btn btn-primary" 
                                         onClick="upload();return false;" value="업로드" /></div>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
			</tbody>
		</table>
           </div>
	

<h4>공개된 대화시나리오 목록</h4>
 <div class="card-block">
   <div class="table-responsive">
     <table class="table table-bordered" width="100%" id="dataTable">
       <thead>
         <tr>
           <th>No</th>
	   <th>대화시나리오 이름</th>
	   <th>대화시나리오 대표이지미</th>
	   <th>대화시나리오 룰</th>
	   <th>삭제</th>
         </tr>
       </thead>
       <tbody>
	<% for(int i = 0; i < bc2.size(); i++){ %>
	<tr>
		<td><%=i%></td>
                <td><a href="javascript:fnGet('<%=bc2.getBusinessData(i).getFieldValue("PS_KEY")%>')"><%=bc2.getBusinessData(i).getFieldValue("PS_SUBJECT")%></a></td>
		<td>
                   <% if ( bc2.getBusinessData(i).getFieldValue("PS_IMAGE").endsWith(".mp4") ) {%>
                     <video src="/download/<%=bc2.getBusinessData(i).getFieldValue("PS_IMAGE")%>" type="video/mp4"  width="50"></video>
                   <%} else {%>
                     <img src="/download/<%=bc2.getBusinessData(i).getFieldValue("PS_IMAGE")%>" width="50">
                   <% } %>
                </td>
		<td><%=bc2.getBusinessData(i).getFieldValue("PS_RULE_CONTEXT_SEQ")%></td>
		<td><button type="button" class="btn btn-sm btn-success"
                     onClick="javascript:deleteScenario('<%=bc2.getBusinessData(i).getFieldValue("PS_KEY")%>')">
                    삭제하기
                    </button>
                </td>
	</tr>
        <% } %>
      </tbody>
    </table>
</div>
<div>
<%
int cnt = intCount;
int page_count = cnt/10;
int page_mod = cnt%10;
// if(page_mod > 0) page_count++;
String seq = request.getParameter("pos");
if(!BusinessHelper.checkBusinessNull(seq))seq = "0";
int iseq = Integer.parseInt(seq);
for(int i = 0; i <= page_count;i++){
  if(iseq == i*10){
%><%=i+1 %>
<%
  }else{
%>
  <a href="/Anaconda.do?CMD=CMD_SEQ_108723096481594591078090&kind=<%=kind%>&pos=<%=i*10 %>"><%=i+1 %></a>
<%	
  }
}
%>

</div>
</div>
</div>
</div>
</div>
</div>

	


<script language="javascript">
function showUpload(){
 if($('#PS_KEY').val() == '') {
   $('#image_upload_tr').hide();
 }else{
   $('#image_upload_tr').show();
 }
}
function upload(){
   if($('#PS_KEY').val() == '') {
     alert('시나리오를 선택해 주세요');
     return;
   }
   with(frmUpload){
      if(fileTest.value == ''){
        alert('파일을 선택해 주세요');
        return;
      } 
      // FILE_KEY.value = $('#PS_KEY').val();
      // submit();
   }


   $('#FILE_KEY').val($('#PS_KEY').val());
   $('#FILE_NAME').val($('#fileTest').val());

   var form = $('#frmUpload');
   var formData = new FormData(form[0]);
   formData.append("FILE_KEY", $('#PS_KEY').val());
   formData.append("FILE_NAME", $('#fileTest').val());


    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/Anaconda.json?CMD=CMD_SEQ_106920212691594648079203",
        data: formData,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function (data) {
            console.log("SUCCESS : ", data);
            // updateImagePath();
            if(confirm('업로드 하였습니다. 화면을 리프레시 할까요?')){
              window.location.reload();
            }
        },
        error: function (e) {
            console.log("ERROR : ", e);
            alert("error : " + e);
        }
    });

}

function updateImagePath(){
   if($('#PS_KEY').val() == '') {
     alert('시나리오를 선택해 주세요');
     return;
   }
   with(frmUpload){
      if(fileTest.value == ''){
        alert('파일을 선택해 주세요');
        return;
      } 
   }
   var fileValue = $("#fileTest").val().split("\\");
   var fileName = '<%=UploadFolder%>' + fileValue[fileValue.length-1];

   var d = {FILE_KEY:$('#PS_KEY').val() ,FILE_NAME:fileName };
   post(d,'CMD_SEQ_102804902871594854187340'
     ,(json)=>{
       console.log("SUCCESS : ", json);
       if(confirm('업로드 하였습니다. 화면을 리프레시 할까요?')){
         window.location.reload();
       }
     },(err)=>{
       alert("error");
     });

}
function reset(){
  $('#PS_KEY').val('');
  $('#PS_SUBJECT').val('');
  $('#PS_DESC').val('');
  $('#PS_IMAGE').val('');
  $('#PS_RULE_CONTEXT_SEQ').val('');
  showUpload();
}

function fnGet(s){
  var d= {PS_KEY : s};
  post(d,'CMD_SEQ_100341278871594616929362'
     ,(json)=>{
       $('#PS_KEY').val(json.read[0].PS_KEY);
       $('#PS_SUBJECT').val(json.read[0].PS_SUBJECT);
       $('#PS_DESC').val(json.read[0].PS_DESC);
       $('#PS_IMAGE').val(json.read[0].PS_IMAGE);
       $('#PS_RULE_CONTEXT_SEQ').val(json.read[0].PS_RULE_CONTEXT_SEQ);
       showUpload();
     },(err)=>{
       alert("error");
     });
}

function deleteScenario(s){
  if(confirm("삭제하시겠습니까?")){
     var d= {PS_KEY : s};
     post(d,'CMD_SEQ_100614935051594615399155'
     ,(json)=>{
       window.location.reload();
     },(err)=>{
       alert("error");
     });     
  }
}


function publishScenario(){
  if($('#PS_SUBJECT').val() == '' || $('#PS_RULE_CONTEXT_SEQ').val() == ''){
    alert('Please check input value');
    return;
  }

  if(confirm("저장하시겠습니까?")){
     if($('#PS_KEY').val() == ''){
       var d= {
         PS_SUBJECT : $('#PS_SUBJECT').val(),
         PS_RULE_CONTEXT_SEQ : $('#PS_RULE_CONTEXT_SEQ').val(),
         PS_IMAGE : $('#PS_IMAGE').val(),
         PS_DESC : $('#PS_DESC').val()
       };
       post(d,'CMD_SEQ_101079152311594615376057'
       ,(json)=>{
         window.location.reload();
       },(err)=>{
         alert("error");
       });     
     }else{
       var d= {
         PS_KEY : $('#PS_KEY').val(),
         PS_SUBJECT : $('#PS_SUBJECT').val(),
         PS_RULE_CONTEXT_SEQ : $('#PS_RULE_CONTEXT_SEQ').val(),
         PS_IMAGE : $('#PS_IMAGE').val(),
         PS_DESC : $('#PS_DESC').val()
       };
       post(d,'CMD_SEQ_108145954261594615450263'
       ,(json)=>{
         window.location.reload();
       },(err)=>{
         alert("error");
       });     
     }
  }
}


</script>
