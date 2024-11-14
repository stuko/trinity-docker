<%@ page contentType="text/xml; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%
String strStory = "회원가입 스토리보드";
%>
<p><h1><img src="/jsp/anaconda/img/product.png" border="0" width="10px" height="10px" align="absmiddle" ></img>&nbsp;&nbsp;
<font color="blue" size="3" style="font-weight:bold;">'<%=strStory%>'</font> <font size="3">유즈케이스 리스트</font></h1></p>
<ul>
	<li>스토리보드(시나리오) 작성 방법</li>
	<li>=========================================================</li>
	<li>1. 대 분류</li>
	<li>  가. 소 분류</li>
	<li>    - 기능 혹은 화면</li>
	<li>=========================================================</li>
	<li>분석모델 생성 : Trinity & Anaconda의 비즈니스 로직 구현 단위인 서비스를 생성하기 위한 후보 추출</li>
	<li>화면 생성 : Trinity & Anaconda의 화면을 생성함(기능 혹은 화면레벨)</li>
</ul>



