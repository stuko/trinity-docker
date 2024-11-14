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
		if(server_name.value == '')
		{
			alert("서버명을 입력해 주세요");
			return;
		}
		if(server_dir.value == '')
		{
			alert("서버의 변경관리 작업 폴더를  입력해 주세요.");
			return;
		}
		if(server_root.value == '')
		{
			alert("서버의 웹루트 경로를  입력해 주세요.");
			return;
		}
		code.value = "create";
		CMD.value = "CMD_SEQ_101004637551289990859325";
		callAjaxByForm("create", "frmCMManage");
	}
}
function fnUpdate()
{
	with(frmCMManage)
	{
		if(server_name.value == '')
		{
			alert("서버명을 입력해 주세요");
			return;
		}
		if(server_dir.value == '')
		{
			alert("서버의 변경관리 작업 폴더를  입력해 주세요.");
			return;
		}
		if(server_root.value == '')
		{
			alert("서버의 웹루트 경로를  입력해 주세요.");
			return;
		}
		code.value = "update";
		CMD.value = "CMD_SEQ_103604848951289994779464";
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
			CMD.value = "CMD_SEQ_100065763101289994785533";
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
				<caption>서버관리</caption>
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
				<td>서버 이름</td>
				<td><input type="text" class="styled" size="40" name="server_name" value=""></input>
				</td>
				</tr>
				<tr>
				<td>원격 접속 여부</td>
				<td>
				<select id='server_type' name="server_type">
				<option value="REMOTE">원격(Linux/Unix 계열만 사용 가능)</option>
				<option value="LOCAL">로컬</option>
				</select>
				</td>
				</tr>
				<tr>
				<td>서버 용도</td>
				<td>
				<select id='server_object' name="server_object">
				<option value="SRC">소스서버</option>
				<option value="DEV">개발서버</option>
				<option value="UAT">사용자테스트서버</option>
				<option value="PRD">리얼서버</option>
				</select>
				</td>
				</tr>
				<tr>
				<td>서버 그룹</td>
				<td><select id='select_group_seq' name="server_group_seq" >
				<%
				BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"getServerGroup");
				
				Iterator it1 = bc1.iterator();
				for(int i = 0;it1.hasNext();i++)
				{
					BusinessData bd1 = (BusinessData)it1.next();
				%>
				<option value="<%=bd1.getFieldValue("SEQ") %>"><%=bd1.getFieldValue("CM_SERVER") %></option>
				<%
				}
				%>
				</select>
				</td>
				</tr>
				<tr>
				<td>아이피</td>
				<td><input type="text" class="styled" size="40" name="server_ip" value=""></input>
				</td>
				</tr>
				<tr>
				<td>아이디</td>
				<td><input type="text" class="styled" size="40" name="server_id" value=""></input>
				</td>
				</tr>
				<tr>
				<td>비밀번호</td>
				<td><input type="password" class="styled" size="40" name="server_pw" value=""></input>
				</td>
				</tr>
				<tr>
				<td>FTP폴더경로(.. 사용)</td>
				<td><input type="text" class="styled" size="60" name="server_ftp_dir" value=""></input>
				</td>
				</tr>
				<tr>
				<td>작업폴더경로</td>
				<td><input type="text" class="styled" size="60" name="server_dir" value=""></input>
				</td>
				</tr>
				<tr>
				<td>웹루트경로</td>
				<td><input type="text" class="styled" size="60" name="server_root" value=""></input>
                <p style="color:red;font-family:돋움체;"> * 경로 입력시 \ => \\ 로 입력 바람.</p>
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
			BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getServerList");
			
			Iterator it = bc.iterator();
			for(int i = 0;it.hasNext();i++)
			{
				BusinessData bd = (BusinessData)it.next();
			%>
			<div id='server_<%=i%>' style='width:90px;float:left;align:center;'>
				<a href="javascript:fnNull();" onClick="javascript:fnSelectServer('<%=bd.getFieldValue("SEQ") %>','<%=bd.getFieldValue("CM_NAME") %>','<%=bd.getFieldValue("CM_IP") %>','<%=bd.getFieldValue("CM_ID") %>','<%=bd.getFieldValue("CM_PW") %>','<%=bd.getFieldValue("CM_DIR") %>','<%=bd.getFieldValue("CM_ROOT") %>','<%=bd.getFieldValue("CM_SERVER_GROUP_SEQ") %>','<%=bd.getFieldValue("CM_TYPE") %>','<%=bd.getFieldValue("CM_FTP_DIR") %>','<%=bd.getFieldValue("CM_SERVER_OBJECT") %>');">
				<div style="float:left;padding:5px 5px 5px 5px;" align="center"><div><img src="/jsp/hydra/img/server.png" width="50px" border="0" align="absmiddle"></img></div><div><%=BusinessHelper.getSubString(bd.getFieldValue("CM_NAME"),15,"...") %></div></div></a>
			</div>
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
function fnSelectServer(s, nm, ip, i, pw, d, root, group_seq,remote,ftp_dir,obj)
{
	with(frmCMManage)
	{
		seq.value = s;
		server_name.value = nm;
		server_ip.value = ip;
		server_id.value = i;
		server_pw.value = pw;
		server_dir.value = d;
		server_root.value = root;
		server_ftp_dir.value = ftp_dir;
		setSelectBox('select_group_seq', group_seq);
		setSelectBox('server_type', remote);
		setSelectBox('server_object', obj);
	}
}

</script>
