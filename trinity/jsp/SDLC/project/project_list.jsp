<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
%>
<script language="javascript">
<!--
//-->
</script>

<p>
		<div class="post"><div class="title-right"><h2><font><b>프로젝트 목록</b></font></h2></div></div>
		<ul>
			<li><input type="button" class="button white" name="" value="프로젝트 생성" onClick="javascript:fn_ActReg();"></li>
		</ul>
</p>
		<table class="table_hydra" cellspacing="0" cellpadding="0">
		<caption>프로젝트 리스트</caption>
		<colgroup>
		<col width="20%">
		<col width="50%">
		<col width="10%">
		<col width="10%">
		<col width="10%">
		</colgroup>
		<thead >
		<tr>
		<th scope="col">번호</th>
		<th scope="col">프로젝트 명</th>
		<th scope="col">시작일</th>
		<th scope="col">종료일</th>
		<th scope="col">상태</th>
		</tr>
		</thead>
		<tbody >
		<tr>
		<td>1</td>
		<td>sdf</td>
		<td>sdf</td>
		<td>sdf</td>
		<td>sdf</td>
		</tr>
		</tbody>
		</table>
<!----------------------------------------- 리스트 보여주는 테이블 끝----------------------------------------->

<p></p>

