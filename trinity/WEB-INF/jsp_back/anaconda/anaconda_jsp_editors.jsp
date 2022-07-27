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

<!--
<link href="/bt/css/plugins/codemirror/codemirror.css" rel="stylesheet">
<link href="/bt/css/plugins/codemirror/ambiance.css" rel="stylesheet">
<script src="/bt/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="/bt/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/bt/js/plugins/codemirror/codemirror.js"></script>
<script src="/bt/js/plugins/codemirror/mode/javascript/javascript.js"></script>
<script src="/bt/js/plugins/pace/pace.min.js"></script>
-->


<%
 
        BusinessCollection bcFile = RequestHelper.getBusinessCollection(request,"FileList");


	String strPath = request.getParameter("path");
	String strContents = "";	
	if(strPath == null || strPath.equals("")){
                strPath = "";
		strContents = "";
	}else	
	{
	//	FileManager fm = new FileManager();
	//	strContents = BusinessHelper.convert(fm.getJSPFile(strPath));
		//strContents = new String(strContents.getBytes("8859_1"),"utf-8");
		//strContents = new String(strContents.getBytes(),"utf-8");
		//strContents = new String(strContents.getBytes("utf-8"),"euc-kr");
		//strContents = new String(strContents.getBytes(),"euckr");
		//strContents = new String(strContents.getBytes("euckr"),"utf-8");
	}
	
%>
<style>

ul,li { list-style:none; }
a { text-decoration:none; color:#000; }
.tab { border:1px solid #ddd; border-left:none; background:#fff; overflow:hidden; }
.tab li { float:left; width:33.3%; border-left:1px solid #ddd; text-align:center; box-sizing:border-box; }
.tab li { display:inline-block; padding:20px; cursor:pointer; }
.tab li.on { background-color:#eee; color:#f00; }
.tab_con { clear:both; margin-top:5px; border:1px solid #ddd; }
.tab_con div { display:none; height:100px; background:#fff; line-height:100px; text-align:center; }

</style>
<script language="javascript"> 
/*
$(document).ready(function() {
  $('#editor').click(function(){
    fnAddTab();
  });
});
*/
/*
var no = 0;
$(function() {
  $('#main_tab').tabs(); 
});
*/

$(document).ready(function() {
  $('#searchServerFile').click(function(){
    window.open('/Anaconda.do?CMD=CMD_SEQ_107509557321581921847292&getFile=true','serverFile', 'top=10, left=10, width=800, height=600, status=no, menubar=no, toolbar=no, resizable=no');
  });
});



function fnDeleteTab(node){
    $('#li-'+ node ).remove();
    $('#tabs-'+ node ).remove();
    $('#frame-'+ node ).remove();
    var tabs = $("#main_tab").tabs();
    tabs.tabs( "refresh" );
}

function fnAddTab() {
 var no = _key() ;
 var tabs = $("#main_tab").tabs();
 var ul = tabs.find("ul");
  
 $("<li id='" + "li-" + no + "'><a href='#tabs-" + no + "'>" + "Tab No." + no + "</a> &nbsp;&nbsp;<a href='javascript:fnDeleteTab(&quot;"+no+"&quot;)'><i class='fas fa-trash-alt'></i></a></li>").appendTo(ul);
 $("<div id='" + "tabs-" + no + "'></div>" ).appendTo(tabs);
 $("<iframe id='" + "frame-" + no + "' src='/Anaconda.do?CMD=CMD_SEQ_101972097581581899102939' frameborder='0' width='100%' height='100%'></iframe>").appendTo('#tabs-'+no);
 tabs.tabs("refresh");
}

var jsp_path = '<%=strPath%>';

function fnSave()
{
         
	var ctnt = $( "#summernote" ).summernote('code');
	//var ctnt = $( "#summernote" ).val();
        //alert(ctnt);
        //return;
	var enc = $( "#encode" ).val();
        var p = $( "#file_path" ).val();
        
        if(p == '') {
           alert('Please enter the path of file');
           return;
        }
        
        if('<%=strPath%>'.trim() != '' && '<%=strPath%>' != p) {
          if(!confirm('Current edited file does not be same with first opened file.\n[<%=strPath%>]['+p+']\ncontinue?' )){
              return;
          }
        }

        if(!p || p == '' || p.trim() == '') {
              alert('input file path!!!!');
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
				if(data.status != '200') alert('Error\n' + JSON.stringify(data));
                                alertPopup('Success','Success');
				fnFileLoad(p);
			  },
                          error: function(data){
                              if(data.status != '200') alert('Error\n' + JSON.stringify(data));
                              alertPopup('Error','Error');
			      fnFileLoad(p);
                          }
			});


	/*
	with(frmView)
	{
		GUBUN.value = "S";
        }
	*/
	// callAjaxByForm('save','frmView');
	//AnacondaSubmit(document.frmView);
	//self.close();
        //return false;
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
        if(p == null || p == 'null' || p == '') {
          alertPopup('Warning','Please input file name');
          return;
        }
        with(frmLoad)
        {
           path.value = p;
        }
	callAjaxByForm('load','frmLoad');
        //AnacondaSubmit(document.frmView);
        //self.close();
        //return false;
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
   //alert("정상적으로 반영되었습니다.");
   //document.location.reload();

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
         //frmView.summernote.value = object.response.trim();
         alertPopup('Success','Success!!! File will be loaded....'); //  alert($('#summernote')); 
         $('#summernote').summernote('code',object.response.trim());
         //$('#summernote').html(object.response.trim());
      }else {
         var response = extractInnerCDATA(REQ.responseText);  // $($.parseXML(REQ.responseText)).find("Response").text();
         // var parser=new DOMParser();
         // var xmlDoc=parser.parseFromString(REQ.responseText,"text/xml");
         // var response = xmlDoc.getElementsByTagName("Response");
         alertPopup('Fail','Fail!!! Original response  will be loaded....');
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

function setFile(file){
    frmView.file_path.value=file;
    //alertPopup('파일',frmView.file_path.value);
    fnFileLoad(file);
}
</script>
<form name="frmLoad" method="post" action="/Anaconda.do?CMD=CMD_SEQ_104788180901504567609467">
   <input type="hidden" name="path" value="">
</form>

    <div>
	<!-- alert 팝업 -->
		<div id="alert_popup" class="sp_popup s400 alert_popup" style="display:none;" draggable="true">
			<div class="sp_pop_header"><div class="layer_title"></div></div>
			<div class="sp_pop_container">
				<div class="txt_dialog pop_message" style="min-height:200px;height:200px;margin-top:20px; overflow: auto"></div>
				<p class="foot_btn">
					<a href="#" class="btn_n bg_red modal_alert_confirm">OK</a>
				</p>
			</div>
			<a href="#" class="sp_popup_close modal_alert_close">Close</a>
		</div>

		<!-- confirm 팝업 -->
		<div id="confirm_popup"  class="sp_popup s400 confirm_popup" style="display:none;" draggable="true">
			<div class="sp_pop_header"><div class="layer_title"></div></div>
			<div class="sp_pop_container">
				<div class="txt_dialog pop_message" style="min-height:200px;height:200px;margin-top:20px; overflow: auto"></div>
				<p class="foot_btn">
					<a href="#" class="btn_n bg_red modal_alert_confirm">OK</a>
					<a href="#" class="btn_n bg_gray modal_alert_close">Cancel</a>
				</p>
			</div>
			<a href="#" class="sp_popup_close modal_alert_close">Close</a>
		</div>

		<!-- 상태 진행중 팝업 -->
		<div id="progress_popup"  class="sp_popup s400 status_progress_popup" style="display:none;" draggable="true">
			<div class="sp_pop_header"><div class="layer_title"></div></div>
			<div class="sp_pop_container">
				<div class="txt_dialog">
					<div class="ajax_loader"><div id="circularG_1" class="circularG"></div><div id="circularG_2" class="circularG"></div><div id="circularG_3" class="circularG"></div><div id="circularG_4" class="circularG"></div><div id="circularG_5" class="circularG"></div><div id="circularG_6" class="circularG"></div><div id="circularG_7" class="circularG"></div><div id="circularG_8" class="circularG"></div></div>
					<p class="txt_dialog3 pop_message" style="min-height:200px;height:200px;margin-top:20px; overflow: auto"></p>
				</div>
			</div>
			<a href="#" class="sp_popup_close modal_progress_close">Close</a>
		</div>
    </div>

<div style="width:100%">

<form name="frmView" class="form-inline" style="width:100%" method="post" action="/Anaconda.do?CMD=CMD_SEQ_104913855441287801302856">
<input type="hidden" name="GUBUN" value="">
<!--
   <div class="container" style="margin-top:20px">
     <div class="row">
        <div class="col">
	<h4>▣ Edit JSP file (* We recommend the UTF-8 type. if euc-kr type , the file may have error.)
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#help">
                Help 
                </button>

                <button type="button" class="btn btn-danger" id="editor">
                Open New Editor 
                </button>
        </h4>
        </div>
     </div>
   </div>
   <div class="container" style="margin-top:30px;">
     <div class="row">
      <div class="col-sm-12">    
       <div id="main_tab">
         <ul id="tab_head">
         </ul>
      </div>
      </div>
     </div>
   </div>
-->

   <div class="container" style="margin-top:30px;">
     <div class="row">
        <div class="col-sm-3">
               Encoding : 
               <select name="encode" id="encode">
                        <option value="utf-8" selected>utf-8</option>
                        <option value="euc-kr">euc-kr</option>
                        <option value="8859_1">8859_1</option>
                        <option value="ansi">ansi</option>
                </select>
        </div>
        <div class="col-sm-6">
            Path : <input type="text" id="file_path" class="styled" name="file_path" value="<%=strPath%>" size="20"> 
               <button type="button" class="btn btn-primary" id="searchServerFile">
                Open File
                </button>
        </div>
        <div class="col-sm-3">
                <button type="button" class="btn btn-primary" name="" onClick="javascript:fnFileLoad(frmView.file_path.value);">Open</button>
                <button type="button" class="btn btn-secondary" name="" onClick="javascript:fnSave();">Save</button>
                <button type="button" class="btn btn-info" name="" onClick="javascript:fnGulp();">Gulp : compile</button>
                <button type="button" class="btn btn-danger" name="" onClick="javascript:fnDelete();">Delete</button>
        </div>
     </div>
   </div>

  <div class="container">
    WebAction List : 
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
    <span id='ref_command' style="margin-left:5px;color:red;font-weight:bold;">"Select a webaction to find Trinity command"</span>
  </div>

<script>
$(function(){
    $('#help_command').change(function(){
        $('#ref_command').text($(this).val());    
    });
});
</script>

   <div class="container" style="margin-top:20px">
      <div class="row">
        <div class="col">
           <div id="summernote" name="summernote" style="color:#bfff00;width:100%;height:100%;"></div>
        </div>
      </div>
   <div>


  <div class="container" style="margin-top:20px">
     <div class="row">
        <div class="col">
                <button type="button" class="btn btn-primary" name="" onClick="javascript:fnFileLoad(frmView.file_path.value);">Open</button>
                <button type="button" class="btn btn-secondary" name="" onClick="javascript:fnSave();">Save</button>
                <button type="button" class="btn btn-info" name="" onClick="javascript:fnGulp();">Gulp : compile</button>
                <button type="button" class="btn btn-danger" name="" onClick="javascript:fnDelete();">Delete</button>

        </div>
     </div>
  </div>

<script language="javascript">

  fnFileLoad(jsp_path);

  $('#summernote').summernote({spellCheck: true,disableGrammar: false,disableResize: false,disableResizeEditor: false,resize: true,height:800});
  $('#summernote').summernote('codeview.toggle');
  $('#summernote').summernote('undo.toggle');
  $('#summernote').summernote('redo.toggle');

 //$('#summernote').summernote('fullscreen.toggle');
 $('.note-codable').css('font-size','16px');
</script>
  </form>
</div>

<div class="modal fade" id="help" tabindex="-1" role="dialog" aria-labelledby="HELP" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document" >
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="helpTitle">Help</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	<div class="modal-body">
	  <h5>Recently used files</h5>
	<div class="container" style="min-height:200px;height:200px;margin-top:20px; overflow: auto">
	<% for(int i = 0; i < bcFile.size(); i++){%>
	 <div class="row"><div class="col"><a href="javascript:setFile('<%=bcFile.getBusinessData(i).getFieldValue("FILEPATH")%>')"><%=bcFile.getBusinessData(i).getFieldValue("FILEPATH")%></a></div></div>
	<%}%>
	</div>
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
</div>




















