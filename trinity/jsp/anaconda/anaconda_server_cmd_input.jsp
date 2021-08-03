<%@ page contentType="text/html; charset=utf-8"  pageEncoding="utf-8" %>

<%@ page import="java.io.*"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.webeditor.file.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>

<div>
  <h3> Execute server command </h3>
</div>
<div>
  <p> 
    <h4> Favorite command
    <ul>
        <li>/bin/sh;-c;ls -ltr
        <li>/bin/sh;-c;cd /home/kronos/kanban
        <li>/bin/sh;-c;/home/kronos/kanban/gulp_pack.sh
    </ul>
  </p>
</div>
<div>
    <input type="text" name="exec" id="exec" style="width:600px" value="" ></input>
    <button class="btn btn-danger"  onClick="fnExecuteCommand()">execute</button>
</div>

<div id="result" style="display:block">
  
</div>
<hr>

<table>
<%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"selectCMDList");
if(bc != null && bc.size() > 0){
   Iterator it = bc.iterator();
   for(int i = 1;it.hasNext();i++){
	BusinessData bd = (BusinessData)it.next();
	String strCmd = bd.getFieldValue("CMD");
        String strInsertDt = bd.getFieldValue("INSERT_DT");
%>
  <tr>
    <td><a href="javascript:setCmd('<%=strCmd%>')"><%=strCmd%></a></td>
    <td><span style="margin-left:50px;"><%=strInsertDt%></span></td>
    </td>
  </tr>
<%
   }
}
%>


</table>

<script>
  function setCmd(cmd){
     $('#exec').val(cmd);
  }
  function fnExecuteCommand(){
     var d = {CMD:'CMD_SEQ_101834834501562247402017', exec: $('#exec').val() };
	$.ajax({
  	  url:"/Anaconda.do",
	  type:"POST",
	  headers: { 
		"Accept" : "application/json; charset=UTF-8"
	  },
	  data:d,
	  success: function (data) {
             alert($.trim(data));
             $('#result').val($.trim(data));
	  },
          error: function(data){
             alert($.trim(data));
              $('#result').val($.trim(data));
          }
	});
  }
</script>
