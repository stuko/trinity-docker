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
// ---------------------------------------------------------------------------------------
// JSP 코딩 규칙
// ---------------------------------------------------------------------------------------
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"SPPCLogin");
BusinessCollection ss = RequestHelper.getBusinessCollection(request,"setMyDBtoSession");

int iCnt = 0;
String URL = "";
if(bc != null && bc.size() > 0){
   iCnt = bc.size();
   if(iCnt > 0) {
      session.setAttribute("Account", bc.getBusinessData(0).getFieldValue("Account"));
      // session.setAttribute("TeamCode", bc.getBusinessData(0).getFieldValue("TeamCode"));
      // session.setAttribute("TeamName", bc.getBusinessData(0).getFieldValue("TeamName"));
      session.setAttribute("MemberStatus", "I");
      URL = "/Anaconda.do?CMD=CMD_SEQ_105943068391560662902167";
   }

   String msg = "[TeamCode]=["+request.getParameter("TeamCode")+"],[rule_group]=["+request.getParameter("rule_group")+"],[Account]=["+session.getAttribute("Account")+"]";
}

String clientId = "";
String secretKey = "";

if(ss != null && ss.size() > 0) {
   clientId = ss.getBusinessData(0).getFieldValue("clientId");
   secretKey = ss.getBusinessData(0).getFieldValue("secretKey");
}
session.setAttribute("clientId",clientId);
session.setAttribute("secretKey",secretKey);
out.println(URL);


%>
