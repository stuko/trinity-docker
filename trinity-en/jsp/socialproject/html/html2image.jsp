<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.openapi.*"%>
<%@ page import="com.stuko.anaconda.util.*"%>

<HTML>
 <HEAD>
  <TITLE> Html2Image </TITLE>
  <META Charset="UTF-8">
  <style>
h1 {
    font-family: Times, serif;    
}

h2 {
    font-family: Verdana, sans-serif;
}

p { 
    font-family: '카페24 아네모네 에어','카페24 단정해','카페24 아네모네','카페24 써라운드', '카페24 빛나는별','카페24 고운밤','카페24 숑숑','카페24 쑥쑥','카페24 심플해','카페24 동동','카페24 당당해', 휴먼편지체, NanumGothic;

    font-size:30px;
}

.box {
  margin: 2px 0;
  padding: 1px 3px;
  border-width: 2px;

}
  </style>
 </HEAD>

 <BODY>
  <div class="box">
  <p><%=URLDecoder.decode(request.getParameter("text"),"UTF-8")%></p>
  </div>
 </BODY>
</HTML>
