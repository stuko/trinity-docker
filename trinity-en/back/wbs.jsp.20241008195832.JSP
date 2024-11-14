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
<%@ page import="com.stuko.anaconda.util.*"%>
<%@ page import="java.text.ParseException"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
/*
if(session.getAttribute(InitClass.getSESSION_DOMAIN()) != null){
  Object object = session.getAttribute(InitClass.getSESSION_DOMAIN());
  IAuth auth = (IAuth)object;
  member_id = auth.getAuthItem(("MEMBER_NAME"));
}
*/
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"wbs");
%>
<table>
  <thead>
     <tr>
       <th scope="col">Phase</th>
       <th scope="col">ActivityName</th>
       <th scope="col">StartDate</th>
       <th scope="col">EndDate</th>
       <th scope="col">Role</th>
       <th scope="col">Progress</th>
<%
long Days = 0;
if(bc != null && bc.size() > 0){
  String str_start_date_time = bc.getBusinessData(0).getFieldValue("PMStartDateTime");
  String str_end_date_time = bc.getBusinessData(0).getFieldValue("PMEndDateTime");
  SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
  Date start_date = formatter.parse(str_start_date_time);
  Date end_date = formatter.parse(str_end_date_time);
  long Sec = (end_date.getTime() - start_date.getTime())/1000;
  Days = Sec / (24*60*60);

  for(int i = 0; i < Days; i++){
%>
    <th scope="col"></th>
<%
  }
}
%>      
    </tr>
  </thead>
  <tbody>
<%
if(bc != null && bc.size() > 0){
  for(int i = 0; i < bc.size(); i++) {
    BusinessData bd = bc.getBusinessData(i);
%>
    <tr>
        <td><%=bd.getFieldValue("PhaseName")%></td>
        <td><%=bd.getFieldValue("ActivityName")%></td>
        <td><%=bd.getFieldValue("RoleName")%></td>
        <td><%=bd.getFieldValue("PMStartDateTime")%></td>
        <td><%=bd.getFieldValue("EndDateTime")%></td>
        <td><%=bd.getFieldValue("Progress")%></td>
<%
      for(int j = 0; j < Days ; j++){
%>    
        <td>&nbsp;</td>
<%
      }
%>    
    </tr>
<%
  }
}
%>
    </tbody>
</table>
