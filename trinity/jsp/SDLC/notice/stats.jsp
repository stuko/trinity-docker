<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.*"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.openapi.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<p height="20px;"></p>
<h2 style="color:#660066;margin-left:20px;margin-top:20px;font-family:돋움체;">베스트 멤버 웹사이트 통계</h2>
<p>
</p>
<%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getMemberCount");
BusinessData bd = bc.getBusinessData(0);
String member = bd.getFieldValue("cnt");
bc = RequestHelper.getBusinessCollection(request,"getJoinCount");
bd = bc.getBusinessData(0);
String join = bd.getFieldValue("cnt");
bc = RequestHelper.getBusinessCollection(request,"getDownCount");
bd = bc.getBusinessData(0);
String down = bd.getFieldValue("cnt");
%>
<div class="left_links">
<p>회원 통계 : <%=member%></p>
<p>제휴 통계 : <%=join%></p>
<p>아나콘다 다운로드 통계 : <%=down%></p>

</div>