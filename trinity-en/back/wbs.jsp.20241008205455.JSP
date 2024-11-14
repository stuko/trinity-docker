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
long Days = 0;
Date start_date = null;
Date end_date = null;
Calendar cal = Calendar.getInstance();
Calendar today = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
if(bc != null && bc.size() > 0){
  String str_start_date_time = bc.getBusinessData(0).getFieldValue("PMStartDateTime");
  String str_end_date_time = bc.getBusinessData(0).getFieldValue("PMEndDateTime");
  SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
  start_date = formatter.parse(str_start_date_time);
  end_date = formatter.parse(str_end_date_time);
  long Sec = (end_date.getTime() - start_date.getTime())/1000;
  Days = Sec / (24*60*60);
}
%>
<div style="margin-top:20px;margin-bottom:20px;margin-left:20px;margin-right:20px;width:400px;">
  WBS (<%=Days%>일)
</div>
<hr>
<table>
  <caption>WBS (<%=Days%>일)</caption>
  <thead>
     <tr>
       <th scope="col">Phase</th>
       <th scope="col">ActivityName</th>
       <th scope="col">StartDate</th>
       <th scope="col">EndDate</th>
       <th scope="col">Role</th>
       <th scope="col">Progress</th>
<%
cal.setTime(start_date);
if(bc != null && bc.size() > 0){
  for(int i = 0; i < Days; i++){
    String str_date = sdf.format(cal.getTime());
    String str_today = sdf.format(today.getTime());
    String bg_color = "#f8f8f8";
    if(str_today.equals(str_date)) bg_color="gray";

    int w = cal.get(Calendar.DAY_OF_WEEK);
    String dw = "";
    String color = "black";
    switch(w){
      case 1:
        dw = "일";
        color="red";
        break;
      case 2:
        dw = "월";
        break;
      case 3:
        dw = "화";
        break;
      case 4:
        dw = "수";
        break;
      case 5:
        dw = "목";
        break;
      case 6:
        dw = "금";
        break;
      case 7:
        dw = "토";
        color="red";
        break;
    }
%>
    <th scope="col" style="color:<%=color%>;background:<%=bg_color%>;"><%=str_date%>(<%=dw%>)</th>
<%
    cal.add(Calendar.DATE, 1);
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
        <th><%=bd.getFieldValue("PhaseName")%></th>
        <th><%=bd.getFieldValue("ActivityName")%></th>
        <th><%=bd.getFieldValue("PMStartDateTime")%></th>
        <th><%=bd.getFieldValue("PMEndDateTime")%></th>
        <th><%=bd.getFieldValue("RoleName")%></th>
        <th><%=bd.getFieldValue("Progress")%></th>
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
