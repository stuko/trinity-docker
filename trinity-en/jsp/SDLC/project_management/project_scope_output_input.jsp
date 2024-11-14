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
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.action.*"%>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
	String strSessionValue  = "";
	RequestHelper helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
	DefaultAuth auth = null;
	if(helper.getSessionObject() != null)
	{
		auth = (DefaultAuth)helper.getSessionObject();
	}
	if(auth != null)
	{
		strSessionValue = auth.getAuthItem(("MEMBER_NAME"));	
	}
	String hidden = "create_output,"+ request.getParameter("ID") ;

%>

<script language="javascript">
function check()
{
	return true;
}
</script>



<jsp:include page="/jsp/common/default-form.jsp">
	<jsp:param name="title" value="산출물 등록" />
	<jsp:param name="action" value="/Anaconda.do?CMD=CMD_SEQ_103180836221381456398062" />
	<jsp:param name="form" value="output_enter" />
	<jsp:param name="footer" value="* 프로젝트의 Output을 등록해야 합니다." />
	<jsp:param name="header" value="항목,값" />
	<jsp:param name="check" value="check()" />
	<jsp:param name="check_message" value="" />
	<jsp:param name="column" value="OUTPUT NAME" />
	<jsp:param name="type" value="text" />
	<jsp:param name="css" value="styled" />
	<jsp:param name="name" value="output_subject" />
	<jsp:param name="size" value="100" />
	<jsp:param name="hidden_name" value="code,SEQ" />
	<jsp:param name="hidden_value" value="<%=hidden%>" />
</jsp:include>


<!-- View component -->
<jsp:include page="/jsp/common/default-view.jsp">
	<jsp:param name="title" value="산출물 정보" />
	<jsp:param name="view_col_name" value="Project" />
	<jsp:param name="view_proc_name" value="getOutputList" />
	<jsp:param name="header" value="번호,관련 번호,산출물 이름,등록일시" />
        <jsp:param name="column" value="ID,RELATE_ID,OUTPUT_SUBJECT,REG_DT" />
	<jsp:param name="view_parameter_name" value="SEQ" />
	<jsp:param name="view_parameter_value" value='<%=request.getParameter("ID")%>' />
	<jsp:param name="view_parameter_type" value="string" />
	<jsp:param name="view_direction" value="h" />
	<jsp:param name="show_bit" value="1,1,1,1" />
	<jsp:param name="link_bit" value="0,0,0,0" />
	<jsp:param name="link" value="/Anaconda.do?CMD=CMD_SEQ_102094788721381457761296" />
</jsp:include>
