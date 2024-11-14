<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.webeditor.file.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>

<%
	String strPath = request.getParameter("path");
	String strContents = "";	
	if(strPath == null || strPath.equals(""))
		strContents = "";
	else	
	{
		FileManager fm = new FileManager();
		strContents = BusinessHelper.convert(fm.getJSPFile(strPath));
	}
	
%>
<script type="text/javascript" src="/js/HuskyEZCreator.js" charset="utf-8"></script>
<script language="javascript">
function fnSave()
{
	with(frmView)
	{
		GUBUN.value = "S";
		AnacondaSubmit(document.frmView);
	}
}
function fnDelete()
{
	if(confirm("Really Delete?"))
	{
	with(frmView)
	{
		GUBUN.value = "M";
		AnacondaSubmit(document.frmView);
	}
	}
}

</script>
<script>
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "contents",
	sSkinURI: "SEditorSkin.html",
	fCreator: "createSEditorInIFrame"
});

// 복수개의 에디터를 생성하고자 할 경우, 아래와 같은 방식으로 호출하고 oEditors.getById["ir2"]이나 oEditors[1]을 이용해 접근하면 됩니다.
/*
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir2",
	sSkinURI: "SEditorSkin.html",
	fCreator: "createSEditorInIFrame"
});
*/

function pasteHTMLDemo(){
	sHTML = "<span style='color:#FF0000'>You can insert images like this.</span>";
	oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
}

function showHTML(){
	alert(oEditors.getById["ir1"].getIR());
}

function _onSubmit(elClicked){
	// 에디터의 내용을 에디터 생성시에 사용했던 textarea에 넣어 줍니다.
	oEditors.getById["ir1"].exec("UPDATE_IR_FIELD", []);
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

	try{
		elClicked.form.submit();
	}catch(e){}
}
</script>

<p>
		<h1>▣ JSP Editor</h1>
</p>
<form name="frmView" method="post" action="/Anaconda.do?CMD=CMD_SEQ_104913855441287801302856">
<input type="hidden" name="GUBUN" value="">
<table class="table_hydra" cellspacing="1" cellpadding="1">
		<colgroup>
		<col width="20%">
		<col>
		</colgroup>
		<thead>
		<tr>
		<th scope="col">File Path</th>
		<th scope="col">&nbsp;<input type="text" class="styled" name="path" value="<%=strPath%>" size="80"></th>
		</tr>
		</thead>
		<tbody>
		<tr>
		  <td>Source</td>
		  <td>&nbsp;<textarea name="contents" id="contents" style="width:725px; height:300px; display:none;"><%=strContents%></textarea></td>
  		</tr>
  		</tbody>
</table>
<table>
	<tr>
    <td align="center">
		<input type="button" class="button white" name="" value="SAVE" colspan="2" onClick="javascript:fnSave();">
		<input type="button" class="button white" name="" value="REMOVE" colspan="2" onClick="javascript:fnDelete();">
		<input type="button" class="button white" name="" value="CLOSE" colspan="2" onClick="javascript:window.close();">
	</td>
  	</tr>
</table>
</form>
