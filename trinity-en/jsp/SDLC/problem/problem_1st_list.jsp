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
<h2><font><b>문제 관리</b></font>
</div>
<div>
<p>"문제 관리 1단계에서는 문제를 등록하고, 문제의 문제(Root Problem)을 찾아내는 과정입니다."</p>
</div>

<fieldset>
<legend>문제 등록</legend>
<div class="post_contents">
<div>
<form name="frmAJAX" id="frmAJAX" method="POST" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_101266620351373097514439">
<input type="hidden" name="code" value="">
<input type="hidden" name="seq" value="">
<input type="hidden" name="parent_seq" value="">
<input type="hidden" name="problem_contents" value="">
<input type="hidden" name="pos" value="0">
<input type="hidden" name="key" value="">
<div>
<h3>무엇이 문제인가 ?&nbsp;&nbsp;
<input type="button" class="button gray" value="문제저장" onclick="javascript:fnSaveProblem();">
<input type="button" class="button white" value="요구사항관리" onclick="javascript:fnClickProblem();">
</h3>
<table width="600px">
<tr></td>
<div id="root_problem">
<div>
<div><h3 style="color:#000000;font-family:돋움체,Verdana,sans-serif;">
<img src="/jsp/bestmember/img/tree-leaf-end.gif" align="absmiddle">&nbsp;최초문제: <input type="text" class="styled" name="problem" id="problem" size="50">
<input type="button" class="button gray" value="상위문제추가" onclick="javascript:fnClickParentProblem(this);"></h3>
</div>
<span></span>
</div>
</div>
</td></tr>
</table>

</div>
</form>
</div>
</fieldset>

<fieldset>
<legend>문제 리스트</legend>

<div style="padding-top:20px;">
	<ul id='data'>
	</ul>
	<div style="padding-left:20px;">
	<input type="button" class="button white" value="1" onClick="javascript:go()">
	<input type="button" class="button white" value="2" onClick="javascript:go()">
	<input type="button" class="button white" value="3" onClick="javascript:go()">
	<input type="button" class="button white" value="4" onClick="javascript:go()">
	<input type="button" class="button white" value="5" onClick="javascript:go()">
	<input type="button" class="button white" value="6" onClick="javascript:go()">
	
	</div>
</div>
</field>


</div>



</div>




<div id="div_problem" style="display:none">
<div>
<div id="div_contents"><h3 style="color:#000000;font-family:돋움체,Verdana,sans-serif;">
<input type="hidden" name="problem_seq" id="problem_seq">
<img src="/jsp/bestmember/img/tree-leaf-end.gif" align="absmiddle">&nbsp;문제 : <input type="text" class="styled" name="problem"  id="problem" size="50">
<input type="button" class="button gray" value="상위문제추가" onclick="javascript:fnClickParentProblem(this);"></h3>
</div>
<table style="padding:5px 5px 5px 5px;">
<tr>
<td></td>
</tr>
</table>
</div>
</div>
<script language="javascript">
function fnClickParentProblem(click_element)
{
	var root = click_element.parentNode.parentNode.parentNode.parentNode;
	// var root = document.getElementById("root_problem");
	// var problem = click_element.parentNode.parentNode.parentNode.parentNode;
	var problem = document.getElementById("div_problem");
	var src = root.innerHTML;
	var dest = problem.innerHTML;
	root.innerHTML = dest;
	var divs = root.getElementsByTagName("td");
	//divs[0].style.paddingLeft = (divs[0].style.paddingLeft + 4) + 'px';
	//alert(divs[0].style.paddingLeft);
	divs[0].innerHTML = src;
}

function fnSaveProblemByIndex(idx,parent_idx)
{
	with(frmAJAX)
	{
		var div = document.createElement("div");
		div.setAttribute("id","dummy_div");
		var rand_seq = "-1";
		code.value="insertProblem";

		var hidden = document.createElement("input");
		hidden.setAttribute("type","hidden");
		hidden.setAttribute("name","problem_contents");
		hidden.setAttribute("value",problem[idx].value);
		div.appendChild(hidden);
		
		var hidden2 = document.createElement("input");
		hidden2.setAttribute("type","hidden");
		hidden2.setAttribute("name","parent_seq");
		hidden2.setAttribute("value",parent_idx);
		div.appendChild(hidden2);

		rand_seq = _rand();
		
		var hidden3 = document.createElement("input");
		hidden3.setAttribute("type","hidden");
		hidden3.setAttribute("name","seq");
		hidden3.setAttribute("value",rand_seq);
		div.appendChild(hidden3);
		appendChild(div);
		callAjaxByForm(code.value,"frmAJAX");
	}
}

function fnSaveProblem()
{
	with(frmAJAX)
	{
		var rand_seq = "-1";
		if(problem.length != null)
		{
			code.value="insertProblem";
			for(var i = problem.length - 1;i >= 0 ;i--)
			{
				problem_contents.value = problem[i].value;
				parent_seq.value = rand_seq;
				rand_seq = _rand();
				seq.value = rand_seq;
				callAjaxByForm(code.value,"frmAJAX");
			}
		}
		else
		{
			code.value="insertProblem";
			problem_contents.value = problem.value;
			parent_seq.value = rand_seq;
			rand_seq = _rand();
			seq.value = rand_seq;
			callAjaxByForm(code.value,"frmAJAX");
		}
	}

}

function fnLoadList()
{
	with(frmAJAX)
	{
		code.value="list";
		pos.value = ('' == '<%=request.getParameter("pos")%>' 
			        || 'null' == '' == '<%=request.getParameter("pos")%>') ? '0': '<%=request.getParameter("pos")%>';
		pos.value = pos.value == null || pos.value == 'null' ? '0' : pos.value;
		// alert(pos.value);
		callAjaxByForm("list","frmAJAX");				
	}
}

function fnSetProblem(l_seq, l_contents)
{
	with(frmAJAX)
	{
		code.value="readProblem";
		seq.value = l_seq;
		problem_contents.value = l_contents;
		callAjaxByForm("readProblem","frmAJAX");				
	}
	
}

function fnGetParentProblem(l_seq, l_contents)
{
	with(frmAJAX)
	{
		code.value="readParentProblem";
		parent_seq.value = l_seq;
		problem_contents.value = l_contents;
		callAjaxByForm("readParentProblem","frmAJAX");				
	}
	
}

function doRuning(callerName)
{
	showRunning(callerName);
}

function doRun(callerName , REQ)
{
	if(callerName == "list")
	{
		var object = parseAnacondaAJAXFromBusinessCollection(REQ.responseXML);
		var list = _("data");
		if(object.length == "0")
		{
			var list = _("data");
			list.innerHTML = "<li>데이터가 존재 하지 않습니다</li>";
		}
		else
		{
			var len = parseInt(object.length);
			list.innerHTML = '';
			for(var i = 0; i < len; i++)
			{
				var li = document.createElement("li");
				li.innerHTML = '<a href=" javascript:fnSetProblem(\''+object.response[i].SEQ+'\',\''+object.response[i].PROBLEM_CONTENTS+'\');">'+object.response[i].PROBLEM_CONTENTS+'</a>&nbsp;<input type="button" value="삭제" class="button gray" onClick="javascript:fnRemoveProblem(\''+object.response[i].SEQ+'\');">';
				list.appendChild(li);
			}
		}
	}
	else if(callerName == "readProblem")
	{
		var object = parseAnacondaAJAXFromBusinessCollection(REQ.responseXML);
		if(object.length == "0")
		{
			
		}
		else
		{
			var root = _('root_problem');
			var src = '';
			root.innerHTML = '';
			//root.getElementsByTagName("span")[0].innerHTML = '';
			//var click_element = root.getElementsByTagName("input")[0];
			//var root = click_element.parentNode.parentNode.parentNode.parentNode;
			var problem = document.getElementById("div_problem");
			var div = document.createElement("div");
			div.setAttribute("id",object.response[0].SEQ);
			div.innerHTML = problem.innerHTML;

			root.appendChild(div);
			// root.appendChild(problem);
			var divs = root.getElementsByTagName("td");
			
			divs[0].innerHTML = src;
			
			var div2 = document.getElementById(object.response[0].SEQ);
			var input = div2.getElementsByTagName("input");
			input[0].value = object.response[0].SEQ;
			input[1].value = object.response[0].PROBLEM_CONTENTS;			

			//alert(input[0].value);

			fnGetParentProblem(object.response[0].SEQ, object.response[0].PROBLEM_CONTENTS);
		}
	}
	else if(callerName == "readParentProblem")
	{
		var object = parseAnacondaAJAXFromBusinessCollection(REQ.responseXML);
		if(object.length == "0")
		{
		}
		else
		{
			var root = _('root_problem');
			// var src = root.getElementsByTagName("div")[0];
			var src = root.innerHTML;
			var problem = document.getElementById("div_problem");
			var dest = problem.innerHTML;

			var div = document.createElement("div");
			div.setAttribute("id",object.response[0].SEQ);
			div.innerHTML = dest;
			// alert(src);
			var divs = div.getElementsByTagName("td");
			divs[0].innerHTML = src;
			// alert(div.outerHTML);
			root.innerHTML = div.outerHTML;
			
			var div2 = document.getElementById(object.response[0].SEQ);
			// alert(div2.innerHTML);
			var input = div2.getElementsByTagName("input");
			// alert(input[1].name);
			input[0].value = object.response[0].SEQ;
			input[1].value = object.response[0].PROBLEM_CONTENTS;			
			alert(root.innerHTML);
			fnGetParentProblem(object.response[0].SEQ, object.response[0].PROBLEM_CONTENTS);
		}
	}
	else if(callerName == "insertProblem" || callerName == "insertProblems" )
	{
		fnLoadList();
	}
	else if(callerName == "update")
	{
		alert("룰정보를 수정하였습니다.");
	}
	else if(callerName == "delete")
	{
		alert("룰정보를 삭제하였습니다.");
		fnLoadList();
	}
}

fnLoadList();
</script>
