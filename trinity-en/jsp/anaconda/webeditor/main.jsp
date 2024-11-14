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
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@page import="com.stuko.anaconda.security.*"%>
<%@page import="java.security.PublicKey"%>
<%@page import="java.security.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
String file = request.getParameter("path");
if(file == null || file.equals("null")) file = "";
%>

	  <h2>Source Editor </h2>
	  <br>
	  <form id="get-data-form" method="post"  name="getDataForm">
			<div>
			<select name="charset" id="charset">
				<option value="utf-8" selected>utf-8</option>
				<option value="euckr" >euckr</option>
				<option value="euc-kr" >euc-kr</option>
				<option value="8859_1" >8859_1</option>
			</select>
			<input type="text" name="file" class="file" id="file" size="50" value="<%=file%>"> &nbsp; <input type="button" value="Read file" onClick="javascript:readFile();" class="styled">&nbsp; <input type="button" value="Save file" onClick="javascript:saveFile();" class="styled">
			</div>
			<br>
			<div>
			<textarea class="tinymce" id="texteditor"></textarea>
			</div>
	   </form>
	  <div id="data-container">
	  </div>
	   <!-- javascript -->
	   <script language="javascript" src="js/jquery.min.js"></script>
 	   <script language="javascript" src="plugin/tinymce/tinymce.min.js"></script>
	   <script language="javascript" src="plugin/tinymce/init-tinymce.js"></script>
	   <script language="javascript" src="js/getdata.js"></script>

<script language="javascript">
	if(getDataForm.file.value != '') readFile();
</script>