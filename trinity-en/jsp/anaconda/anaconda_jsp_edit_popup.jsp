<%@ page contentType="text/html; charset=utf-8"  pageEncoding="utf-8" %>

<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.action.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.webeditor.file.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>

<%
 
        BusinessCollection bcFile = RequestHelper.getBusinessCollection(request,"FileList");


	String strPath = request.getParameter("path");
	String strContents = "";	
	if(strPath == null || strPath.equals("")){
                strPath = "";
		strContents = "";
	}
	
%>

<script language="javascript"> 

var jsp_path = '<%=strPath%>';

function fnSave()
{
         
	var ctnt = $( "#summernote" ).summernote('code');
	var enc = $( "#encode" ).val();
        var p = $( "#file_path" ).val();
        
        if(p == '') {
           alert('파일 경로를 입력해 주세요');
           return;
        }
        
        if('<%=strPath%>'.trim() != '' && '<%=strPath%>' != p) {
          if(!confirm('처음에 열었던 파일과 다릅니다.\n 처음 연 파일: [<%=strPath%>] vs 현재 파일 : ['+p+']\n 계속할까요?' )){
              return;
          }
        }

        if(!p || p == '' || p.trim() == '') {
              alert('파일 경로가 비어 있습니다!!!!');
              return;
        }
	var d = {CMD:'CMD_SEQ_104913855441287801302856', GUBUN:'S', path: p , contents : ctnt }
	$.ajax({
			  url:"/Anaconda.do",
			  type:"POST",
			  headers: { 
				"Accept" : "application/json; charset=" + enc , "charset" : enc
			  },
			  data:d,
			  dataType:"json",
			  success: function (data) {
				if(data.status != '200') alert('오류 발생\n' + JSON.stringify(data));
                                talert('Success');
				fnFileLoad(p);
			  },
                          error: function(data){
                              if(data.status != '200') alert('오류 발생\n' + JSON.stringify(data));
                              talert('Success');
			      fnFileLoad(p);
                          }
			});

}

function fnGulp(){
 var d = {CMD:'CMD_SEQ_101834834501562247402017', exec: "/bin/sh;-c;/home/kronos/kanban/gulp_pack.sh" };
	$.ajax({
  	  url:"/Anaconda.do",
	  type:"POST",
	  headers: { 
		"Accept" : "application/json; charset=UTF-8"
	  },
	  data:d,
	  success: function (data) {
             alert($.trim(data));
	  },
          error: function(data){
             alert($.trim(data));
          }
	});   
}

function fnFileLoad(p)
{
        if(p == null || p == 'null' || p == '') return;
        with(frmLoad)
        {
           path.value = p;
        }
	callAjaxByForm('load','frmLoad');
}

function fnDelete()
{
	if(confirm("Really delete?"))
	{
	with(frmView)
	{
		GUBUN.value = "M";
        }
	callAjaxByForm('delete','frmView');
	}
}
function doRun(callerName , REQ)
{

   if(callerName == 'save'){
      alert("Applied successfully.");
      var p = $( "#file_path" ).val();
      fnFileLoad(p);
   }
   else if(callerName == 'load'){
      var object = null;
      if(REQ.responseXML != null) object = parseAnacondaAJAXFromBusinessCollection(REQ.responseXML);
      else {
          console.log(REQ.responseText);
          object = JSON.stringify(REQ.responseText);
      }

      if(object != null && object.response != null && object.response.replace){
         talert('Success!!! File will be loaded....'); //  alert($('#summernote')); 
         $('#summernote').summernote('code',object.response.trim());
      }else {
         var response = extractInnerCDATA(REQ.responseText);  // $($.parseXML(REQ.responseText)).find("Response").text();
         talert('Fail!!! Original response  will be loaded....');
         $('#summernote').summernote('code',response);
      }
   }

}

function extractInnerCDATA(x){
    var rStart = '<Response>';
    var rEnd = '</Response>';
    var cStart = '<![CDATA[';
    var cEnd = ']]>';

    var response = x;
    var prePiece = '';
    var midPiece = '';
    var postPiece = '';
    var start = 0;
    var i = x.indexOf(rStart,start);
    if(i >= 0){
       i = x.indexOf(rStart+cStart,i);
       // occured
       if(i >= 0){	
            start = i;
            i = x.indexOf(cStart,i+1);
            if( i >= 0) {
              var j = x.indexOf(cEnd,i+1);
              var y  = x.lastIndexOf(cEnd);
              if(y > j){
                 if( x.indexOf(cEnd+rEnd,y) >= 0) {
                    response = x.substring(start+(rStart+cStart).length,y);
                 }
              } 
           }
       }
    }
    return response;
}

function doRuning(callerName)
{
   showRunning(callerName);
}

function openFile(f){
	if(event.keyCode == 13) {
        fnFileLoad(f);
    }
}

function setFileName(no,name){
   $('#li-'+ node )
}

function setFile(file){
    with(frmView){
       file_path.value=file;
    }
    fnFileLoad(file);
}

function goWebIDE(url){
   window.open(url,"_blank","");
}

</script>


<form name="frmLoad" method="post" action="/Anaconda.do?CMD=CMD_SEQ_104788180901504567609467">
   <input type="hidden" name="path" value="">
</form>
<div style="margin-top:5px; margin-bottom:20px;">
  <button type="button" class="btn btn-primary" onclick="goWebIDE('https://codepen.io/pen/');">코드팬</button>
  <button type="button" class="btn btn-primary" onclick="goWebIDE('https://jsfiddle.net/');">JSFiddle</button>
  <button type="button" class="btn btn-primary" onclick="goWebIDE('https://stackblitz.com/');">스택블리츠</button>
  <button type="button" class="btn btn-primary" onclick="goWebIDE('https://replit.com/');">레플</button>
  <button type="button" class="btn btn-primary" onclick="goWebIDE('https://ide.goorm.io/');">구름</button>
  <button type="button" class="btn btn-primary" onclick="goWebIDE('https://www.ryugod.com/');">류갓</button>
</div>

<div style="margin-top:10px;>
  <h2>파일 편집 및 웹 개발 툴(* UTF-8 을 추천 합니다.. euc-kr 은 에러가 발생할 수 있습니다.)</h2>  
<form name="frmView" id="frmView" class="form-inline" style="width:100%" method="post" action="/Anaconda.do?CMD=CMD_SEQ_104913855441287801302856">
<input type="hidden" name="GUBUN" value="">
<table>
  <tr>
    <td colspan="2"> 
               파일 인코딩 : 
               <select name="encode" id="encode">
                        <option value="utf-8" selected>utf-8</option>
                        <option value="euc-kr">euc-kr</option>
                        <option value="8859_1">8859_1</option>
                        <option value="ansi">ansi</option>
                </select>
     </td>
     <td>
            파일 경로 : <input type="text" id="file_path" class="styled" name="file_path" value="<%=strPath%>" size="20">
               <button type="button" class="btn btn-primary" id="searchServerFile">
                파일 찾기
                </button>
     </td>
     <td>
                <button type="button" class="btn btn-primary" name="" onClick="javascript:fnFileLoad($('#file_path').val());">파일 열기</button>
                <button type="button" class="btn btn-secondary" name="" onClick="javascript:fnSave();">저장하기</button>
                <button type="button" class="btn btn-info" name="" onClick="javascript:fnGulp();">Gulp : 컴파일</button>
                <button type="button" class="btn btn-danger" name="" onClick="javascript:fnDelete();">삭제하기</button>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#help_trinity">
                도움받기
                </button>
     </td>
   </tr>
   <tr>
     <td colspan="4">
    액션 리스트 : 
    <select name="help_command" id="help_command">
    <%
        WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();
	Iterator it = xmlResource.getWebActionCollection();
	WebActionCollection webActionCollection = null;
	WebAction action = null;
        for(; it.hasNext() ; ){
	  webActionCollection = (WebActionCollection)it.next();
	  Iterator iterator = webActionCollection.iterator();
	  for(; iterator.hasNext() ;){
            action = (WebAction)iterator.next();
    %>
            <option value="<%=action.getCOMMAND()%>">[<%=webActionCollection.getWEBACTION_KOR_NAME()%>]<%=action.getKOR_NAME()%></option>
    <%
          }
        }
    %>

    </select>
    <span id='ref_command' style="margin-left:5px;color:red;font-weight:bold;">"커멘드 찾기"</span>
    <span id='ref_command_javascript' style="margin-left:5px;color:red;font-weight:bold;">"JavaScript"</span>
   </td>
  </tr>
  <tr>
   <td colspan="4">

   <div class="container" style="margin-top:20px">
      <div class="row">
        <div class="col">
           <div id="summernote" name="summernote" style="color:#bfff00;width:100%;height:100%;"></div>
        </div>
      </div>
   <div>
   </td>
  </tr>
  <tr>
   <td colspan="4">
                <button type="button" class="btn btn-primary" name="" onClick="javascript:fnFileLoad($('#file_path').val());">파일 열기</button>
                <button type="button" class="btn btn-secondary" name="" onClick="javascript:fnSave();">저장하기</button>
                <button type="button" class="btn btn-info" name="" onClick="javascript:fnGulp();">Gulp : 컴파일</button>
                <button type="button" class="btn btn-danger" name="" onClick="javascript:fnDelete();">삭제하기</button>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#help_trinity">
                도움받기
                </button>

    </td>
  </tr>
</table>
<script language="javascript">

  fnFileLoad(jsp_path);

/*
$('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 120,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
*/



  $('#summernote').summernote({spellCheck: true,disableGrammar: false,disableResize: false,disableResizeEditor: false,resize: true,height:800 });
  $('#summernote').summernote('codeview.toggle');
  $('#summernote').summernote('undo.toggle');
  $('#summernote').summernote('redo.toggle');

 //$('#summernote').summernote('fullscreen.toggle');
  $('.note-codable').css('font-size','16px');


</script>
  </form>
</div>



<div class="modal fade" id="help_trinity" tabindex="-1" role="dialog" aria-labelledby="HELP" aria-hidden="true" style="z-index:9999999999">
  <div class="modal-dialog modal-dialog-centered" role="document" >
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="helpTitle">Trinity Help</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	<div class="modal-body">
	  <h5>Recently used files</h5>
	<table>
	<% for(int i = 0; i < bcFile.size(); i++){%>
	 <tr><td><a href="javascript:setFile('<%=bcFile.getBusinessData(i).getFieldValue("FILEPATH")%>')"><%=bcFile.getBusinessData(i).getFieldValue("FILEPATH")%></a></td></tr>
	<%}%>
	</table>
	  <hr>
	  <h5>Tips</h5>
	  <pre style="background:white;">
	alertPopup(t,m)
	progressPopup(t,m,f)
	confirmPopup(t,m,f)
	simplePopup(t,c) /  showPopup(t,c,l) : toast
	post(d,cmd,fnSuccess,fnError) : json
	doPost(d,cmd,fnSuccess,fnError)
	ajaxConda(frmName,cmd,json , fnSuccess)
	ajaxCondaPlus(frmName,cmd,json,fnSuccess,fnError)
	setCookie(name, value, expire) / getCookie(name)
	highlight(id, text)
	fnShowDiv(div_object) / fnHideDiv(div_object)
	fnCheckHan(str) / isHan(Objectname : Object)  /fnNumberCheck(object : Object)
	createUUID()


<< 포함 시켜야 할 패키지들  >>
<&#37;@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" &#37;>
<&#37;@ page import="java.io.File"&#37;>
<&#37;@ page import="java.util.Iterator"&#37;>
<&#37;@ page import="java.util.*"&#37;>

<&#37;@ page import="com.stuko.anaconda.XmlConfig.*"&#37;>
<&#37;@ page import="com.stuko.anaconda.Exception.ExceptionCenter"&#37;>
<&#37;@ page import="com.stuko.anaconda.front.*"&#37;>
<&#37;@ page import="com.stuko.anaconda.Auth.*"&#37;>
<&#37;@ page import="com.stuko.anaconda.value.*"&#37;>
<&#37;@ page import="com.stuko.anaconda.business.*"&#37;>
<&#37;@ page import="com.stuko.anaconda.openapi.*"&#37;>
<&#37;@ page import="com.stuko.anaconda.util.*"&#37;>

<< 세션을 얻어 오는 방법 >>
if(session.getAttribute(InitClass.getSESSION_DOMAIN()) != null){
  Object object = session.getAttribute(InitClass.getSESSION_DOMAIN());
  IAuth auth = (IAuth)object;
  member_id = auth.getAuthItem(("MEMBER_NAME"));
}

<< 비즈니스 결과를 얻어 오는 방법 >>
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getList");


	  </pre>
	</div>
       <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
</div>

<script>
(function(){

  $("#btn_editor_code").button().on("click", function(event) {

        $('#editor_code').toggle();

        $(this).text(function(i, text){
          if(text === "Edit more files"){
             //$(this).css("color","yellow");
             return "Edit one file";
          }else{
             //$(this).css("color","red");               
             return "Edit more files";
          }
        });
   });

  $('#editor').click(function(){
    fnAddTab();
  });
  $('#trinity').click(function(){
    fnAddTrinityTab();
  });

  $('#main_tab').tabs(); 

  $('#help_command').change(function(){
      $('#ref_command').text($(this).val());
      $('#ref_command_javascript').text('post(param,\'' + $(this).val() + '\', (data)=>{ data.process[idx].field_name } , (err)=>{});');    
  });

  $('#searchServerFile').click(function(){
    window.open('/Anaconda.do?CMD=CMD_SEQ_107509557321581921847292&getFile=true','serverFile', 'top=10, left=10, width=800, height=600, status=no, menubar=no, toolbar=no, resizable=no');
  });

})();
</script>

