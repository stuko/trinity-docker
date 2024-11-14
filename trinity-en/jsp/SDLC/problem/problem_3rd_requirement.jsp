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
<h2><font><b>요구사항 분석</b></font>
</div>
<div>
<ul>
<li>"요구사항 분석 단계에서는 요구사항에 대한 영향을 분석하고, 요구사항 명세(스토리보드)를 작성하는 단계입니다."</li>
<li>문제 -> KSF(Key Success Factor) -> 요구사항 -> 요구사항 분석 -> 스토리보드</li>
</ul>
</div>
<div class="post_contents">
<div>
<form name="frm" id="frm" action="/Anaconda.do">
<input type="hidden" name="CMD" value="">
<div>

<fieldset>
<legend>요구사항 영향도분석</legend>
<div> " 관리시스템을 만든다. " </div>
<table class="table_hydra" cellspacing="1" cellpadding="1">
<tr><td rowspan="2">
중요도분석</td>
<td>비즈니스</td>
<td>H/w</td>
<td>N/W</td>
<td>D/B</td>
<td>디자인</td>
<td>개발</td>
<td>테스트</td>
<td>이행</td>
</tr>
<tr>
<td>
<select>
	<option value="">선택</option>
	<option value="">상</option>
	<option value="">중</option>
	<option value="">하</option>
</select>
</td>
<td>
<select>
	<option value="">선택</option>
	<option value="">상</option>
	<option value="">중</option>
	<option value="">하</option>
</select>
</td>
<td>
<select>
	<option value="">선택</option>
	<option value="">상</option>
	<option value="">중</option>
	<option value="">하</option>
</select>
</td>
<td>
<select>
	<option value="">선택</option>
	<option value="">상</option>
	<option value="">중</option>
	<option value="">하</option>
</select>
</td>
<td>
<select>
	<option value="">선택</option>
	<option value="">상</option>
	<option value="">중</option>
	<option value="">하</option>
</select>
</td>
<td>
<select>
	<option value="">선택</option>
	<option value="">상</option>
	<option value="">중</option>
	<option value="">하</option>
</select>
</td>
<td>
<select>
	<option value="">선택</option>
	<option value="">상</option>
	<option value="">중</option>
	<option value="">하</option>
</select>
</td>
<td>
<select>
	<option value="">선택</option>
	<option value="">상</option>
	<option value="">중</option>
	<option value="">하</option>
</select>
</td>
</tr>
<tr><td rowspan="2">
복잡도분석</td>
<td>비즈니스</td>
<td>H/w</td>
<td>N/W</td>
<td>D/B</td>
<td>디자인</td>
<td>개발</td>
<td>테스트</td>
<td>이행</td>
</tr>
<tr>
<td>
<select>
	<option value="">선택</option>
	<option value="">상</option>
	<option value="">중</option>
	<option value="">하</option>
</select>
</td>
<td>
<select>
	<option value="">선택</option>
	<option value="">상</option>
	<option value="">중</option>
	<option value="">하</option>
</select>
</td>
<td>
<select>
	<option value="">선택</option>
	<option value="">상</option>
	<option value="">중</option>
	<option value="">하</option>
</select>
</td>
<td>
<select>
	<option value="">선택</option>
	<option value="">상</option>
	<option value="">중</option>
	<option value="">하</option>
</select>
</td>
<td>
<select>
	<option value="">선택</option>
	<option value="">상</option>
	<option value="">중</option>
	<option value="">하</option>
</select>
</td>
<td>
<select>
	<option value="">선택</option>
	<option value="">상</option>
	<option value="">중</option>
	<option value="">하</option>
</select>
</td>
<td>
<select>
	<option value="">선택</option>
	<option value="">상</option>
	<option value="">중</option>
	<option value="">하</option>
</select>
</td>
<td>
<select>
	<option value="">선택</option>
	<option value="">상</option>
	<option value="">중</option>
	<option value="">하</option>
</select>
</td>
</tr>
</table>
<div>영향도 분석 결과 : 90점</div>
</fieldset>

</div>
</form>
</div>

<div style="padding-top:20px;">
<fieldset>
<legend>요구사항 리스트</legend>
	<table class="table_hydra" cellspacing="1" cellpadding="1">
		<tr><td width="50px">&nbsp;REQ-1 </td><td> <a href="javascript:prepare_impact_analysis();">요구사항 관리 시스템을 만든다.</a></td><td><input type="button" class="button white" value="스토리보드작성" onClick="javascript:go();"></td></tr>
		<tr><td width="50px">&nbsp;REQ-1 </td><td> <a href="javascript:prepare_impact_analysis();">요구사항 관리 시스템을 만든다.</a></td><td><input type="button" class="button white" value="스토리보드작성" onClick="javascript:go();"></td></tr>
		<tr><td width="50px">&nbsp;REQ-1 </td><td> <a href="javascript:prepare_impact_analysis();">요구사항 관리 시스템을 만든다.</a></td><td><input type="button" class="button white" value="스토리보드작성" onClick="javascript:go();"></td></tr>
		<tr><td width="50px">&nbsp;REQ-1 </td><td> <a href="javascript:prepare_impact_analysis();">요구사항 관리 시스템을 만든다.</a></td><td><input type="button" class="button white" value="스토리보드작성" onClick="javascript:go();"></td></tr>
		<tr><td width="50px">&nbsp;REQ-1 </td><td> <a href="javascript:prepare_impact_analysis();">요구사항 관리 시스템을 만든다.</a></td><td><input type="button" class="button white" value="스토리보드작성" onClick="javascript:go();"></td></tr>
		<tr><td width="50px">&nbsp;REQ-1 </td><td> <a href="javascript:prepare_impact_analysis();">요구사항 관리 시스템을 만든다.</a></td><td><input type="button" class="button white" value="스토리보드작성" onClick="javascript:go();"></td></tr>
		<tr><td width="50px">&nbsp;REQ-1 </td><td> <a href="javascript:prepare_impact_analysis();">요구사항 관리 시스템을 만든다.</a></td><td><input type="button" class="button white" value="스토리보드작성" onClick="javascript:go();"></td></tr>
		<tr><td width="50px">&nbsp;REQ-1 </td><td> <a href="javascript:prepare_impact_analysis();">요구사항 관리 시스템을 만든다.</a></td><td><input type="button" class="button white" value="스토리보드작성" onClick="javascript:go();"></td></tr>
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
