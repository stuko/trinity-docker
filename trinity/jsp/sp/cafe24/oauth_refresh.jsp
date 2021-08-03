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
<%
try{
  BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getOAuthInfo");
  if(bc != null && bc.size() > 0){
    String url = bc.getBusinessData(0).getFieldValue("OT_REQ_RF_TOKEN_URL");
    String key = bc.getBusinessData(0).getFieldValue("OT_KEY");
    String rf_token = bc.getBusinessData(0).getFieldValue("OT_RF_TOKEN");
    String tmp_key = bc.getBusinessData(0).getFieldValue("OT_TMP_KEY");
    String clientId = bc.getBusinessData(0).getFieldValue("OT_CLIENTID");
    String secretKey = bc.getBusinessData(0).getFieldValue("OT_SECRETKEY");
    System.out.println("##################################");  
    System.out.println("url : " + url);
    System.out.println("key  : " + key );
    System.out.println("##################################");  
    com.stuko.trinity.mediator.impl.RESTCallerImpl rest = new com.stuko.trinity.mediator.impl.RESTCallerImpl();
    Map parameter = new HashMap();
    parameter.put("grant_type", "refresh_token");
    parameter.put("refresh_token", rf_token);
    String method = "POST";
    String cskey = clientId + ":" + secretKey ;
    String encKey = com.stuko.anaconda.security.Base64.encodeBytes(cskey.getBytes());
    Map header = new HashMap();
    header.put("Content-Type","application/x-www-form-urlencoded");
    header.put("Authorization","Basic " + encKey);
    Map<String,Object> map = rest.invoke(url,method,header,parameter);
    // access_token, expires_at, refresh_token, refresh_token_expires_at, client_id, mall_id, user_id
    String forward = "/Anaconda.do?CMD=CMD_SEQ_102562232481584362885387&OT_TOKEN="+map.get("access_token")+"&OT_RF_TOKEN="+map.get("refresh_token")+"&OT_CLIENTID="+clientId+"&OT_KEY="+key+"&OT_TMP_KEY="+tmp_key;
    //out.println("url : " + url);
    //out.println("key  : " + key );
    //out.println(map);
    //out.println(forward);
    // RequestDispatcher rd = request.getRequestDispatcher(forward);
    // rd.forward(request,response);
    response.sendRedirect(forward);
  }else{
    out.println("ERROR - " + request.getParameter("state"));
  }
}catch(Exception e){
  out.println(e.toString());
}
%>
