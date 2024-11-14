<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.filter.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.action.*"%>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
/**
// ---------------------------------------------------------------------------------------
// JSP 코딩 규칙
// ---------------------------------------------------------------------------------------

out.println((프로세스결과타입)RequestHelper.getReturnValue(request,"프로세스 이름"));
Object object = request.getAttribute(InitClass.getReturnValue());
Object session_object = request.getAttribute(InitClass.getSessionValue());
Object businss_object = request.getAttribute(InitClass.getBusinessDataValue());

out.println((프로세스결과타입)RequestHelper.getReturnValue(request,"프로세스 이름");
BusinessCollection bc = RequestHelper. getBusinessCollection(request,"프로세스 이름");
BusinessCollection bc = RequestHelper. getBusinessCollection(request,"프로세스 이름");
BusinessHelper helper = new BusinessHelper();
helper.convertToTableRow(bc);

for(int i = 0; i < bc.size(); i++)
{
     BusinessData bd = bc.getBusinessData(i);
}

**/
%>

<div class="post">
<div class="title-right">
<h2><font><b>요구사항 관리</b></font>
</div>
<div>
<ul>
<li>"요구사항 관리 단계에서는 문제를 해결할 KSF를 찾아내고 요구사항을 등록하는 과정입니다."</li>
<li>문제 -> KSF(Key Success Factor) -> 요구사항</li>
<li>문제 -> KSF(Key Success Factor) -> 요구사항</li>
</ul>
</div>
<div class="post_contents">
<div>
<form name="frm" id="frm" action="/Anaconda.do">
<input type="hidden" name="CMD" value="">
<div>

<fieldset>
<legend>Key Success Factor 등록</legend>
<table class="table_hydra" cellspacing="1" cellpadding="1">
<tr><td>
문제</td>
<td>&nbsp;&nbsp;
" 아나콘다는 무엇이 문제인가? " 
</td></tr>
<tr><td>
KSF</td>
<td>&nbsp;&nbsp;
<input type="text" class="styled" name="ksf" size="30"> &nbsp;
<input type="button" class="button white" value="  추가  " onClick="javascript:go()">
</td></tr>
</table>
</fieldset>

</div>
</form>
</div>

<div style="padding-top:20px;">
<fieldset>
<legend>Key Success Factor 리스트</legend>
   <p>
   <input type="checkbox" name="ksf_checkbox">&nbsp;&nbsp;전체선택&nbsp;&nbsp;
   <input type="checkbox" name="ksf_checkbox">&nbsp;&nbsp;전체해제&nbsp;&nbsp;
   <input type="button" class="button white" value="요구사항등록" onClick="javascript:go()">
	</p>
	<table class="table_hydra" cellspacing="1" cellpadding="1">
		<tr><td><input type="checkbox" name="ksf_checkbox">&nbsp;&nbsp;KSF : 요구사항 관리 시스템을 만든다.</td></tr>
		<tr><td><input type="checkbox" name="ksf_checkbox">&nbsp;&nbsp;KSF : 요구사항 관리 시스템을 만든다.</td></tr>
		<tr><td><input type="checkbox" name="ksf_checkbox">&nbsp;&nbsp;KSF : 요구사항 관리 시스템을 만든다.</td></tr>
		<tr><td><input type="checkbox" name="ksf_checkbox">&nbsp;&nbsp;KSF : 요구사항 관리 시스템을 만든다.</td></tr>
		<tr><td><input type="checkbox" name="ksf_checkbox">&nbsp;&nbsp;KSF : 요구사항 관리 시스템을 만든다.</td></tr>
		<tr><td><input type="checkbox" name="ksf_checkbox">&nbsp;&nbsp;KSF : 요구사항 관리 시스템을 만든다.</td></tr>
		<tr><td><input type="checkbox" name="ksf_checkbox">&nbsp;&nbsp;KSF : 요구사항 관리 시스템을 만든다.</td></tr>
		<tr><td><input type="checkbox" name="ksf_checkbox">&nbsp;&nbsp;KSF : 요구사항 관리 시스템을 만든다.</td></tr>
		<tr><td><input type="checkbox" name="ksf_checkbox">&nbsp;&nbsp;KSF : 요구사항 관리 시스템을 만든다.</td></tr>
	</table>
</fieldset>
</div>

</div>



</div>




<div id="div_problem" style="display:none">
<div>
<div><h3 style="color:#000000;font-family:돋움체,Verdana,sans-serif;">
문제 : <input type="text" class="styled" name="problem" size="50">
<input type="button" class="button gray" value="상위문제등록" onclick="javascript:fnClickParentProblem();"></h3>
</div>
<table style="padding:5px 5px 5px 5px;">
<tr>
<td></td>
</tr>
</table>
</div>
</div>
<script language="javascript">
function fnClickParentProblem()
{
	var root = document.getElementById("root_problem");
	var problem = document.getElementById("div_problem");
	var src = root.innerHTML;
	var dest = problem.innerHTML;
	root.innerHTML = dest;
	var divs = root.getElementsByTagName("td");
	//divs[0].style.paddingLeft = (divs[0].style.paddingLeft + 4) + 'px';
	//alert(divs[0].style.paddingLeft);
	divs[0].innerHTML = src;
}
</script>
