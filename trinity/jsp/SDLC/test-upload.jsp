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


<H5>카메니저 매물리스트<H5>
<p>* 현재부터, 5일전까지 매물 신규 등록 건입니다.</p>
<div>
  <form enctype="multipart/form-data" action="/ext/Anaconda.do?CMD=CMD_SEQ_108538845171511534105307" method="POST">
    <input type="hidden" name="FileUploadSubmit" value="true">
    이 파일을 전송합니다: <input name="fileTest" type="file" />
    <input type="submit" value="파일 전송" />
</form>
</div>













