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

<script language="javascript"> 


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
                                talert('Success');
				fnFileLoad(p);
			  },
                          error: function(data){
                              if(data.status != '200') alert('Error\n' + JSON.stringify(data));
                              talert('Success');
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
        if(p == null || p == 'null' || p == '') return;
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
         talert('Success!!! File will be loaded....'); //  alert($('#summernote')); 
         $('#summernote').summernote('code',object.response.trim());
         //$('#summernote').html(object.response.trim());
      }else {
         var response = extractInnerCDATA(REQ.responseText);  // $($.parseXML(REQ.responseText)).find("Response").text();
         // var parser=new DOMParser();
         // var xmlDoc=parser.parseFromString(REQ.responseText,"text/xml");
         // var response = xmlDoc.getElementsByTagName("Response");
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
       //simplePopup('파일',file_path.value);
    }
    fnFileLoad(file);
}
</script>


<style>
// .iframeTab {display: block;   border-width:5px; border-color:red; border-style:solid; height: 85vh; width: 92vw }
</style>


<script>
/*
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
  
 $("<li id='" + "li-" + no + "' ><a href='#tabs-" + no + "'><i class='fas fa-file-code fa-lg' style='margin:4px;' ></i>" + "<b style='margin-left:5px;'>Click here : Tab No." + no + "</b></a> &nbsp;&nbsp;<a href='javascript:fnDeleteTab(&quot;"+no+"&quot;)' class='fr' style='margin-right:20px;margin-top:4px;'><span id='sp-"+no+"'></span><i class='fas fa-trash-alt fa-lg'></i></a></li>").appendTo(ul);
 $("<div id='" + "tabs-" + no + "'></div>" ).appendTo(tabs);
 $("<iframe id='" + "frame-" + no + "' src='/Anaconda.do?CMD=CMD_SEQ_101972097581581899102939' class='iframeTab' frameborder='0' ></iframe>").appendTo('#tabs-'+no);
 tabs.tabs("refresh");
}

function fnAddTrinityTab() {
 var no = _key() ;
 var tabs = $("#main_tab").tabs();
 var ul = tabs.find("ul");
  
 $("<li id='" + "li-" + no + "' ><a href='#tabs-" + no + "'><i class='fas fa-window-restore fa-lg'  style='margin:4px;'></i><b  style='margin-left:5px;'>Click here : " + "Tab No." + no + "</b></a> &nbsp;&nbsp;<a href='javascript:fnDeleteTab(&quot;"+no+"&quot;)' class='fr' style='margin-right:20px;margin-top:4px;'><span id='sp-"+no+"'><i class='fas fa-trash-alt fa-lg'></i></a></li>").appendTo(ul);
 $("<div id='" + "tabs-" + no + "'></div>" ).appendTo(tabs);
 $("<iframe id='" + "frame-" + no + "' src='/Anaconda.do?CMD=CMD_SEQ_108164918711286971872119' class='iframeTab' frameborder='0' ></iframe>").appendTo('#tabs-'+no);
 tabs.tabs("refresh");
}
*/
</script>


<form name="frmLoad" method="post" action="/Anaconda.do?CMD=CMD_SEQ_104788180901504567609467">
   <input type="hidden" name="path" value="">
</form>
<div style="margin-top:10px;>
  <h2>Edit JSP file (* We recommend the UTF-8 type. if euc-kr type , the file may have error.)</h2>  

<form name="frmView" id="frmView" class="form-inline" style="width:100%" method="post" action="/Anaconda.do?CMD=CMD_SEQ_104913855441287801302856">
<input type="hidden" name="GUBUN" value="">
<!--
<table style="width:800px">
   <tr>
     <td>

                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#help_trinity">
                Help 
                </button>
                <button type="button" class="btn btn-danger" id="editor">
                Open New Editor 
                </button>
                <button type="button" class="btn btn-info" id="trinity">
                Open New Trinity in Tab 
                </button>
                <button type="button"  id="btn_editor_code"  class="btn btn-danger">Edit more files</button>
     </td>
   </td>
</table>
<table>
  <tr>
   <td>
     <div id="editor_code" class="row" style="display:none;margin-left:2px;z-index:9999;">
       <div id="main_tab" style="width: 99%; z-index:9999;">
         <ul id="tab_head" style="z-index:9999;">
         </ul>
      </div>
    </div>
   </td>
  </tr>
</table>
-->
<table>
  <tr>
    <td colspan="2"> 
               Encoding : 
               <select name="encode" id="encode">
                        <option value="utf-8" selected>utf-8</option>
                        <option value="euc-kr">euc-kr</option>
                        <option value="8859_1">8859_1</option>
                        <option value="ansi">ansi</option>
                </select>
     </td>
     <td>
            Path : <input type="text" id="file_path" class="styled" name="file_path" value="<%=strPath%>" size="20">
               <button type="button" class="btn btn-primary" id="searchServerFile">
                Find a file
                </button>
     </td>
     <td>
                <button type="button" class="btn btn-primary" name="" onClick="javascript:fnFileLoad($('#file_path').val());">Open</button>
                <button type="button" class="btn btn-secondary" name="" onClick="javascript:fnSave();">Save</button>
                <button type="button" class="btn btn-info" name="" onClick="javascript:fnGulp();">Gulp : compile</button>
                <button type="button" class="btn btn-danger" name="" onClick="javascript:fnDelete();">Delete</button>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#help_trinity">
                Help 
                </button>
     </td>
   </tr>
   <tr>
     <td colspan="4">
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
   </td>
  </tr>
  <tr>
   <td colspan="4">

   <div class="container" style="margin-top:20px;margin-left:25px">
      <div class="row">
        <div class="col">
           <div id="summernote" name="summernote" style="color:#bfff00;width:90%;height:90%;"></div>
        </div>
      </div>
   <div>
   </td>
  </tr>
  <tr>
   <td colspan="4">
      <button type="button" class="btn btn-primary" name="" onClick="javascript:fnFileLoad(frmView.file_path.value);">Open</button>
      <button type="button" class="btn btn-secondary" name="" onClick="javascript:fnSave();">Save</button>
      <button type="button" class="btn btn-info" name="" onClick="javascript:fnGulp();">Gulp : compile</button>
      <button type="button" class="btn btn-danger" name="" onClick="javascript:fnDelete();">Delete</button>
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
  });

  $('#searchServerFile').click(function(){
    window.open('/Anaconda.do?CMD=CMD_SEQ_107509557321581921847292&getFile=true','serverFile', 'top=10, left=10, width=800, height=600, status=no, menubar=no, toolbar=no, resizable=no');
  });

})();
</script>

































