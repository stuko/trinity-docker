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

<%@ page import="
    javax.naming.*,
    javax.sql.*,
    org.apache.tomcat.dbcp.dbcp2.*,    
    org.apache.commons.dbcp2.*"
%>
<% 
 Context initContext = new InitialContext();
 Context envContext  = (Context)initContext.lookup("java:/comp/env");
 DataSource ds   = (DataSource)envContext.lookup("jdbc/SPDB");
  
 org.apache.tomcat.dbcp.dbcp2.BasicDataSource bds = (org.apache.tomcat.dbcp.dbcp2.BasicDataSource)ds; 
 String dbname  = "sp";
 
 try { 
   int bdsNumActive  = bds.getNumActive(); 
   int bdsMaxActive  = bds.getMaxTotal(); 
   int bdsNumIdle   = bds.getNumIdle(); 
   long bdsMaxWait  = bds.getMaxIdle(); 
   
   String fontcolor  = ""; 
   
   if (bdsNumActive <= 400) { 
    fontcolor = "<font color='green'>"; 
   } else if (bdsNumActive > 400 && bdsNumActive <= 500) { 
    fontcolor = "<font color='orange'>"; 
   } else { 
    fontcolor = "<font color='red'>"; 
   }
%> 
   <table cellpadding='3' cellspacing='0' border='1'>
    <tr>
     <td colspan='4' align='center'><b><%=dbname%></b> DataSource</td>
    </tr>
    <tr>
     <td height='24' align='center' alt='connections that are processing'># Active Connections</td>
     <td height='24' align='center' alt='total size of pool'>Maximum Active Connections</td>
     <td height='24' align='center' alt='connections that are idle in the pool'># of Idle Connections</td>
     <td height='24' align='center'>Maxium Wait period before timeout</td>
    </tr>
    <tr>
     <td align='right'><%=fontcolor%><%=bdsNumActive%></font></td>
     <td align='right'><%=bdsMaxActive%></td>
     <td align='right'><%=bdsNumIdle%></td>
     <td align='right'><%=bdsMaxWait%></td>
    </tr>
   </table>
<%
 } catch(Exception e) { 
  out.println(e.toString());
 } 
%>
