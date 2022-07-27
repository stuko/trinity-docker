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

function setFile(file){
    frmView.file_path.value=file;
    //simplePopup('파일',frmView.file_path.value);
    fnFileLoad(file);
}
</script>
<form name="frmLoad" method="post" action="/Anaconda.do?CMD=CMD_SEQ_104788180901504567609467">
   <input type="hidden" name="path" value="">
</form>

<div style="width:100%">

<form name="frmView" class="form-inline" style="width:100%" method="post" action="/Anaconda.do?CMD=CMD_SEQ_104913855441287801302856">
<input type="hidden" name="GUBUN" value="">

   <div class="container" style="margin-top:20px">
     <div class="row">
        <div class="col">
	<h4>▣ Edit JSP file (* We recommend the UTF-8 type. if euc-kr type , the file may have error.)
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#help">
                Help 
                </button>
        </h4>
        </div>
     </div>
   </div>


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
        </div>
        <div class="col-sm-3">
                <input type="button" class="button white" name="" value="Open" onClick="javascript:fnFileLoad(frmView.file_path.value);">
                <input type="button" class="button white" name="" value="Save" onClick="javascript:fnSave();">
                <input type="button" class="button gray" name="" value="Gulp" onClick="javascript:fnGulp();">
                <input type="button" class="button red" name="" value="Delete" onClick="javascript:fnDelete();">
        </div>
     </div>
   </div>

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
                <input type="button" class="button white" name="" value="Save" onClick="javascript:fnSave();">
                <input type="button" class="button gray" name="" value="Gulp" onClick="javascript:fnGulp();">
                <input type="button" class="button red" name="" value="Delete" onClick="javascript:fnDelete();">

        </div>
     </div>
  </div>

<script language="javascript">

  fnFileLoad(jsp_path);

  $('#summernote').summernote({spellCheck: true,disableGrammar: false,disableResize: false,disableResizeEditor: false,resize: true,height:600});
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



















