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
		if(cm_title.value == '')
		{
			alert("변경사유를 입력해 주세요");
			return;
		}
		if(cm_list.value == '')
		{
			alert("변경 파일 항목을 입력해 주세요.");
			return;
		}
		code.value = "create";
		CMD.value = "CMD_SEQ_108107788421289969333122";
		callAjaxByForm("create", "frmCMManage");
	}
}

function doRuning(callerName)
{
showRunning(callerName);

}

function doRun(callerName,REQ)
{
	alert("정상적으로 반영되었습니다.");
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_100333381081289029921460";
}

function fnSearchAction()
{
	window.open("/Anaconda.do?CMD=CMD_SEQ_103900747961296881944884&title=액션조회&Object=opener.document.frmCMManage.cm_list","","height=500,width=650,left=200,top=20,status=no, location=no, toolbar=no,resizable=yes,scrollbars=yes");	
}
function fnSearchService()
{
	window.open("/Anaconda.do?CMD=CMD_SEQ_104966356991308445054352&title=서비스조회&Object=opener.document.frmCMManage.cm_list","","height=500,width=650,left=200,top=20,status=no, location=no, toolbar=no,resizable=yes,scrollbars=yes");	
}
function fnSearchView()
{
	window.open("/Anaconda.do?CMD=CMD_SEQ_107686747271308455082141&title=화면조회&Object=opener.document.frmCMManage.cm_list","","height=500,width=650,left=200,top=20,status=no, location=no, toolbar=no,resizable=yes,scrollbars=yes");	
}

</script>

<jsp:include page="/jsp/hydra/hydra_cm_menu.jsp" />				

<div class="post">

				<div class="entry">
				<form name="frmCMManage" method="post" action="/Anaconda.do">
				<input type="hidden" name="code" value=""></input>
				<input type="hidden" name="CMD" value=""></input> 
				<table>
				<caption>변경관리</caption>
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
				<td>변경 사유</td>
				<td><input type="text" class="styled" size="80" name="cm_title" value=""></input>
				</td>
				</tr>
				<tr>
				<td>소스 서버</td>
				<td><select name="cm_server">
				<%
				BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getSourceServerList");
				
				Iterator it = bc.iterator();
				for(int i = 0;it.hasNext();i++)
				{
					BusinessData bd = (BusinessData)it.next();
				%>
				<option value="<%=bd.getFieldValue("SEQ") %>"><%=bd.getFieldValue("CM_SERVER") %></option>
				<%
				}			 
				%>
				</select></td>
				</tr>
				<tr>
				<td>변경 파일 목록<br>
				<br>
				<li>웹 루트를 기준으로 변경하고자 하는 파일 명을 오른족에 입력해 주세요
				<br><br>
<pre>
  ex) 입력예
      /WEB-INF/classes/sample/sample.class
      /jsp/sample/sample.jsp
      /img/sample/sample.gif
</pre>
				<br><input type="button" class="button white" name="button1" value="액션으로 찾기" onClick="javascript:fnSearchAction();"></input>
                                 <input type="button" class="button white" name="button1" value="서비스로 찾기" onClick="javascript:fnSearchService();"></input><input type="button" class="button white" name="button1" value="화면으로 찾기" onClick="javascript:fnSearchView();"></input></td>
				<td>
				<textarea class="styled" name="cm_list" style="width:540px;height:250px;" wordWrap="true"></textarea>
				</td>
				</tr>
				</tbody>
				</table>
				<p>
				<input type="button" class="button white" name="button1" value="저장하기" onClick="javascript:fnSave();"></input>
				<input type="button" class="button white" name="button2" value="뒤로가기" onClick="javascript:history.back();"></input></p>
				</form>
				</div>
			</div>
