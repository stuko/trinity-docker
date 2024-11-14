<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.*"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%
// 크기
String parameter = request.getParameter(BlankField.ANACONDA_AREA_UI);
DefaultXmlData dxd = (DefaultXmlData)request.getAttribute(parameter);
%>
<script language="javascript">
</script>
<form name="frmConfig" method="post">
<p><h>환경설정</h></p>
<table class="table_hydra" cellspacing="1" cellpadding="1">
<colgroup>
<col width="30%">
<col>
</colgroup>
<thead>
<tr>
<th scope="col">이름</th>
<th scope="col">값</th>
</tr>
</thead>
<tbody>
<tr>
	<td>로그 디렉토리</td>
	<td><input class="styled" type="text" name="log_dir" size="20" value=""></input></td>
</tr>
<tr>
	<td>백업 디렉토리</td>
	<td><input class="styled" type="text" name="backup_dir" size="20" value=""></input></td>
</tr>
<tr>
	<td>사용자 큐 설정 </td>
	<td><input class="styled" type="checkbox" name="user_queue" value=""></input></td>
</tr>
<tr>
	<td span="2">
	<input type="button" class="button white" value="저장하기" onClick="javascript:save();"></input>
	<input type="button" class="button white" value="삭제하기" onClick="javascript:save();"></input>
	<input type="button" class="button white" value="수정하기" onClick="javascript:save();"></input>
	<input type="button" class="button white" value="돌아가기" onClick="javascript:history.back();"></input>
	</td>
</tr>
</tbody>
</table>

</form>


