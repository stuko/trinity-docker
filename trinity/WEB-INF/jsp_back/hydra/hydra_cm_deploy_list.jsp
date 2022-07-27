<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script language="javascript">

function fnSave()
{
	with(frmCMManage)
	{
		if(server_group_name.value == '')
		{
			alert("서버 그룹명을 입력해 주세요");
			return;
		}
		code.value = "create";
		CMD.value = "CMD_SEQ_105096814561290042602752";
		callAjaxByForm("create", "frmCMManage");
	}
}
function fnUpdate()
{
	with(frmCMManage)
	{
		if(server_group_name.value == '')
		{
			alert("서버 그룹명을 입력해 주세요");
			return;
		}

		code.value = "update";
		CMD.value = "CMD_SEQ_100962981681290042609660";
		callAjaxByForm("update", "frmCMManage");
	}
}
function fnDelete()
{
	with(frmCMManage)
	{
		if(confirm("정말로 삭제 하시겠습니까?"))
		{
			code.value = "delete";
			CMD.value = "CMD_SEQ_101550314381290042614584";
			callAjaxByForm("delete", "frmCMManage");
		}
	}
}
function doRuning(callerName)
{
showRunning(callerName);

}

function doRun(callerName,REQ)
{
	alert("정상적으로 반영되었습니다.");
	document.location.reload();
}
</script>
<jsp:include page="/jsp/hydra/hydra_cm_menu.jsp" />				
		<div class="post">
				
				<div class="entry">
				<form name="frmCMManage" method="post" action="/Anaconda.do">
				<input type="hidden" name="code" value=""></input>
				<input type="hidden" name="CMD" value=""></input> 
				<input type="hidden" name="seq" value=""></input> 
				<table>
				<caption>서버 그룹 관리</caption>
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
				<td>서버 그룹 이름</td>
				<td><input type="text" class="styled" size="40" name="server_group_name" value=""></input>
				</td>
				</tr>
				</tbody>
				</table>
				<p>
				<input type="button" class="button white" name="button1" value="저장하기" onClick="javascript:fnSave();"></input>
				<input type="button" class="button white" name="button2" value="수정하기" onClick="javascript:fnUpdate();"></input>
				<input type="button" class="button white" name="button3" value="삭제하기" onClick="javascript:fnDelete();"></input>
				<input type="button" class="button white" name="button4" value="뒤로가기" onClick="javascript:history.back();"></input></p>
				</form>
			
			
			<table>
			<tr>
			<td valign="top">
			<%
			BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getServerGroupJoin");
			
			Iterator it = bc.iterator();
			for(int i = 0;it.hasNext();i++)
			{
				BusinessData bd = (BusinessData)it.next();
			%>
				<a href="javascript:fnNull();" onClick="javascript:fnSelectServer('<%=bd.getFieldValue("SEQ") %>','<%=bd.getFieldValue("CM_SERVER") %>');">
				<div style="float:left;padding:5px 5px 5px 5px" align="center"><div><img src="/jsp/hydra/img/servers1.png" width="50px" border="0" align="absmiddle"></img></div><div><%=bd.getFieldValue("CM_SERVER") %></div></div></a>
			<%
			}			 
			%>
			</td>
			</tr>
			</table>
				</div>
			</div>
			<br><br>
<script language="javascript">
function fnSelectServer(arg1,arg2,arg3)
{
	with(frmCMManage)
	{
		seq.value = arg1;
		server_group_name.value = arg2;
	}
}
</script>
