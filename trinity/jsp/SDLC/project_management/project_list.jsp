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
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.service.*"%>
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

	String strCount = "0";
	BizLogicXmlResource biz = BizLogicXmlResource.getInstance();
	BusinessData process = biz.searchBusinessDataEqualsServiceName("Count","countProject");
	BusinessData param = (BusinessData)request.getAttribute(InitClass.getBusinessDataValue());
	TrinityService service = new TrinityService();
	ReturnValue rv = service.invokeDirectly(process,param);
	if(rv.mBRtn){
		BusinessCollection bc = (BusinessCollection)rv.mORtn;
		strCount = bc.getBusinessData(0).getFieldValue("CNT");
	}

%>


<!-- View component -->
<jsp:include page="/jsp/common/default-view.jsp">
	<jsp:param name="title" value="프로젝트 관리" />
	<jsp:param name="view_col_name" value="MyProject" />
	<jsp:param name="view_proc_name" value="getMyProjectList" />
        <jsp:param name="header" value="번호,프로젝트 이름,시작일자, 종료일자, 프로젝트 상태" />	
        <jsp:param name="column" value="SEQ,PROJECT_TITLE,PROJECT_START_DATE, PROJECT_END_DATE, PROJECT_STATUS" />
	<jsp:param name="view_parameter_name" value="session.MEMBER_NAME,pos" />
	<jsp:param name="view_parameter_value" value="<%=strSessionValue%>" />
	<jsp:param name="view_parameter_type" value="string,int" />
	<jsp:param name="view_direction" value="h" />
	<jsp:param name="show_bit" value="1,1,1,1,1" />
	<jsp:param name="link_bit" value="1,1,1,0,0" />
	<jsp:param name="link" value="/Anaconda.do?CMD=CMD_SEQ_101853473601381454886328" />
</jsp:include>

<!-- View component -->
<jsp:include page="/jsp/common/default-page.jsp">
	<jsp:param name="page_size" value="10" />
	<jsp:param name="page_name" value="pos" />
	<jsp:param name="total_count" value="<%=strCount%>" />
	<jsp:param name="link" value="/Anaconda.do?CMD=CMD_SEQ_105918899811381018422406" />
</jsp:include>
