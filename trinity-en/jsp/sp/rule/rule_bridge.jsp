<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="java.io.File"%>
<%@ page import="java.net.*"%>
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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"checkMyTeam");
int iCnt = 0;
if(bc != null && bc.size() > 0){
   String cnt = bc.getBusinessData(0).getFieldValue("Count");
   iCnt = Integer.parseInt(cnt);
   if(iCnt > 0) {
      session.setAttribute("TeamCode", request.getParameter("TeamCode"));
      session.setAttribute("TeamName", request.getParameter("TeamName"));
   }

   String msg = "[TeamCode]=["+request.getParameter("TeamCode")+"],[rule_group]=["+request.getParameter("rule_group")+"],[Account]=["+session.getAttribute("Account")+"]";
}
%>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<script language="javascript">

  if(<%=iCnt%> > 0){
     location.href = '/Anaconda.do?CMD=CMD_SEQ_101125880681510636806963&rule_group=<%=request.getParameter("rule_group")%>&kind=MSG';
  }else{
     alert("요청하신 팀정보가 존재하지 않습니다.");
     history.back();
  }
  
</script>
</body>
</html>




















