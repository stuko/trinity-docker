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
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
// Object object = request.getAttribute(InitClass.getReturnValue());
// ReturnValue rv = (ReturnValue)object;
// out.println(rv.getmOBJMAP());
// out.println("--------------------");
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"ERROR");
if(bc == null)out.println("bc is null");
if(bc != null && bc.size() > 0)
{
BusinessData bd = bc.getBusinessData(0);
%>
<jsp:include page="/jsp/common/default-message.jsp">
	<jsp:param name='title' value='<%=bd.getFieldValue("title")%>' />
	<jsp:param name='code' value='<%=bd.getFieldValue("code")%>' />
	<jsp:param name='message' value='<%=bd.getFieldValue("message")%>' />
	<jsp:param name='return_link' value='<%=bd.getFieldValue("return_link")%>' />
	<jsp:param name='return_message' value='<%=bd.getFieldValue("return_message")%>' />
	<jsp:param name='alert_message' value='<%=bd.getFieldValue("alert_message")%>' />
	<jsp:param name='redirect_link' value='<%=bd.getFieldValue("redirect_link")%>' />
</jsp:include>
<%}%>