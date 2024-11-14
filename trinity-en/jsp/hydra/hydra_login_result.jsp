<%@ page contentType="text/html;charset=EUC-KR" buffer="12kb" autoFlush="true"%>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="com.stuko.anaconda.value.ReturnValue" %>
<%@ page import="com.stuko.anaconda.cache.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.bestmember.pattern.action.*" %>
<%@ page import="java.util.ArrayList" %>
<%
	RequestHelper helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
	String strUrl = helper.getCookie(InitClass.PRE_URL);
	//String strUrl = request.getAttribute(InitClass.PRE_URL);
	if(strUrl == null) strUrl = "/Anaconda.do?CMD=CMD_SEQ_108173637391288444301255";
	strUrl = "/Anaconda.do?CMD=CMD_SEQ_108173637391288444301255";
%>
<script language="javascript">
 document.location.href = "<%=strUrl%>";
</script>



