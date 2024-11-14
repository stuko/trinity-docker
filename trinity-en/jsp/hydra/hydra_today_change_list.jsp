<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="post">
				<div class="title-right">
				<h2><font><b>금일 수정한 파일 목록</b></font>
				</div>
<br>
<div style="font-family:arial;color:#6600FF;width:900px;height:750px;overflow-x:scroll;overflow-y:scroll;">
<pre style="font-family:arial;color:blue;font-size:12px;">
<%
out.println((String)RequestHelper.getReturnValue(request,"getChangeList"));
%>

</pre>
</div>
</div>
