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
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String strSessionValue  = "";
	RequestHelper helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
	DefaultAuth auth = (DefaultAuth)helper.getSessionObject();
	
	if(auth != null)
	{
		strSessionValue = auth.getAuthItem(("MEMBER_NAME"));	
	}
	String pos = request.getParameter("pos");
	if(!BusinessHelper.checkBusinessNull(pos)) pos = "0";
	strSessionValue = strSessionValue + "," + pos;
%>


<!-- View component -->
<jsp:include page="/jsp/common/default-view.jsp">
	<jsp:param name="title" value="내가 참여한 프로젝트" />
	<jsp:param name="view_col_name" value="MyProject" />
	<jsp:param name="view_proc_name" value="getMyProjectList" />
	<jsp:param name="header" value="seq,PROJECT_TITLE,PROJECT_START_DATE,PROJECT_END_DATE,PROJECT_STATUS" />
	<jsp:param name="view_parameter_name" value="session.MEMBER_NAME,pos" />
	<jsp:param name="view_parameter_value" value="<%=strSessionValue%>" />
	<jsp:param name="view_parameter_type" value="string,int" />
	<jsp:param name="view_direction" value="h" />
	<jsp:param name="show_bit" value="1,1,1,1,1" />
	<jsp:param name="link_bit" value="1,1,0,0,1" />
	<jsp:param name="link" value="/Anaconda.do?CMD=CMD_SEQ_108320538591332067728630" />
</jsp:include>

<jsp:include page="/jsp/common/default-view.jsp">
	<jsp:param name="title" value="내가 참여한 팀" />
	<jsp:param name="view_col_name" value="MyProject" />
	<jsp:param name="view_proc_name" value="getMyTeamList" />
	<jsp:param name="header" value="seq,TEAM_NAME,TEAM_OBJECTIVE" />
	<jsp:param name="view_parameter_name" value="session.MEMBER_NAME,pos" />
	<jsp:param name="view_parameter_value" value="<%=strSessionValue%>" />
	<jsp:param name="view_parameter_type" value="string,int" />
	<jsp:param name="view_direction" value="h" />
	<jsp:param name="show_bit" value="1,1,1" />
	<jsp:param name="link_bit" value="1,1,0" />
	<jsp:param name="link" value="/Anaconda.do?CMD=CMD_SEQ_104335751441332039231239" />
</jsp:include>

<jsp:include page="/jsp/common/default-view.jsp">
	<jsp:param name="title" value="내가 참여한 역할" />
	<jsp:param name="view_col_name" value="MyProject" />
	<jsp:param name="view_proc_name" value="getMyRoleList" />
	<jsp:param name="header" value="seq,ROLE_NAME,ROLE_OBJECTIVE" />
	<jsp:param name="view_parameter_name" value="session.MEMBER_NAME,pos" />
	<jsp:param name="view_parameter_value" value="<%=strSessionValue%>" />
	<jsp:param name="view_parameter_type" value="string,int" />
	<jsp:param name="view_direction" value="h" />
	<jsp:param name="show_bit" value="1,1,1" />
	<jsp:param name="link_bit" value="1,1,0" />
	<jsp:param name="link" value="/Anaconda.do?CMD=CMD_SEQ_107087403751332063744080" />
</jsp:include>

