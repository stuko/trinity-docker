<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
SAInfoXmlResource sxr = new SAInfoXmlResource();
DefaultXmlData dxd = sxr.search(request.getParameter("user_id"));

%>
<script language="javascript">
function fnSaveUser()
{
	with(frmUserManage)
	{
		if(user_pw.value == '')
		{
			alert("비밀번호를 입력해 주시기 바랍니다.");
			return;
		}
		if(user_pw_re.value == '')
		{
			alert("비밀번호 확인을 입력해 주시기 바랍니다.");
			return;
		}
		if(user_pw.value != user_pw_re.value)
		{
			alert("비밀번호와 비밀번호 확인이 일치 하지 않습니다.");
			return;
		}
		code.value = "modify";
		CMD.value = "CMD_SEQ_109528685741289868804044";
		callAjaxByForm("modify", "frmUserManage");
	}
}
function fnSearchId()
{
	with(frmUserManage)
	{
		if(user_id.value == '')
		{
			alert("아이디를 입렵해 주시기 바랍니다.");
			return;
		}
		code.value = "searchid";
		CMD.value = "CMD_SEQ_100782359251289873601324";
		callAjaxByForm("searchid", "frmUserManage");
	}
}
function doRuning(callerName)
{
showRunning(callerName);

}

function doRun(callerName,REQ)
{
	if(callerName == "searchid")
	{
		alert('|' + REQ.responseText + '|');
		var res = REQ.responseText;
		if(res != null && res == 'OK')
		{
			 alert("입력하신 아이디는 중복입니다. 사용하실 수 없습니다.");
		}
		else
		{
			 if(confirm("입력하신 아이디는 사용하실 수 있습니다. 사용하시겠습니까?"))
			 {
				 frmUserManage.user_id.disabled = true;
				 frmUserManage.user_pw.focus();
			 }
		}
	}
	else
	{
		alert("정상적으로 반영되었습니다.");
		document.location.href = "/Anaconda.do?CMD=CMD_SEQ_106992440181289030150305";
	}
}
</script>
		<div class="post">
				<div class="title-right">
				<h2><font><b>사용자 관리</b></font>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;
				</h2>
				</div>
				<div class="entry">
				<form name="frmUserManage" method="post" action="/Anaconda.do">
				<input type="hidden" name="code" value=""></input>
				<input type="hidden" name="CMD" value=""></input> 
				<input type="hidden" name="user_id" value="<%=dxd.getNAME() %>"></input> 
				<table class="table_hydra">
				<caption>사용자 정보 등록</caption>
				<colgroup>
				<col width="30%"></col>
				<col></col>
				</colgroup>
				<thead>
				<th scope="col">이름</th>
				<th scope="col">값</th>
				</thead>
				<tbody>
				<tr>
				<td>사용자 계정 명</td>
				<td><%=dxd.getNAME() %></td>
				</tr>
				<tr>
				<td>사용자 비밀번호</td>
				<td><input type="password" class="styled" size="40" name="user_pw" value=""></input></td>
				</tr>
				<tr>
				<td>사용자 비밀번호 확인</td>
				<td><input type="password" class="styled" size="40" name="user_pw_re" value=""></input></td>
				</tr>
				<tr>
						<td>사용자 등급</td>
				<td><select name="user_level">
				<option value="1" <%if(dxd.getData("LEVEL").equals("1"))out.print("selected"); %>>개발자</option>
				<option value="2" <%if(dxd.getData("LEVEL").equals("2"))out.print("selected"); %>>기획자</option>
				<option value="3" <%if(dxd.getData("LEVEL").equals("3"))out.print("selected"); %>>디자이너</option>
				<option value="4" <%if(dxd.getData("LEVEL").equals("4"))out.print("selected"); %>>코더</option>
				<option value="5" <%if(dxd.getData("LEVEL").equals("5"))out.print("selected"); %>>설계자</option>
				<option value="6" <%if(dxd.getData("LEVEL").equals("6"))out.print("selected"); %>>아키텍트</option>
				<option value="0" <%if(dxd.getData("LEVEL").equals("0"))out.print("selected"); %>>관리자</option>
				</select></td>
				</tr>
				</tbody>
				</table>
				<p>
				<input type="button" class="button white" name="button1" value="저장하기" onClick="javascript:fnSaveUser();"></input>
				<input type="button" class="button white" name="button2" value="뒤로가기" onClick="javascript:history.back();"></input></p>
				</form>
				</div>
			</div>


