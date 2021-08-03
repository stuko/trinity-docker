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

<jsp:include page="/jsp/common/default-leftmenu.jsp">
	<jsp:param name="title" value="프로젝트 관리 메뉴" />
	<jsp:param name="column" value="팀 리스트,팀 등록,역할 리스트,역할 등록,프로젝트 리스트,프로젝트 등록,프로젝트 게시판" />
	<jsp:param name="link" value="/Anaconda.do?CMD=CMD_SEQ_105010315761332038107557
												  ,/sdlc/Anaconda.do?CMD=CMD_SEQ_101716048121332039130676
												  ,/sdlc/Anaconda.do?CMD=CMD_SEQ_105936135081332062289413
												  ,/sdlc/Anaconda.do?CMD=CMD_SEQ_108093945961332061537354
												  ,/sdlc/Anaconda.do?CMD=CMD_SEQ_104651175361332065328722
												  ,/sdlc/Anaconda.do?CMD=CMD_SEQ_105884107961332066065383
												  ,/sdlc/Anaconda.do?CMD=CMD_SEQ_104757947291319959645242&gubun=1" />
</jsp:include>


<!-- Table View component -->
<jsp:include page="/jsp/common/default-table.jsp">
	<jsp:param name="title" value="프로젝트 관리 메뉴" />
	<jsp:param name="header" value="번호,메뉴" />
	<jsp:param name="value" value="팀 리스트,팀 등록,역할 리스트,역할 등록,프로젝트 리스트,프로젝트 등록,프로젝트 게시판" />
	<jsp:param name="column" value="1,2,3,4,5,6,7" />
	<jsp:param name="link" value="/Anaconda.do?CMD=CMD_SEQ_105010315761332038107557
												  ,/sdlc/Anaconda.do?CMD=CMD_SEQ_101716048121332039130676
												  ,/sdlc/Anaconda.do?CMD=CMD_SEQ_105936135081332062289413
												  ,/sdlc/Anaconda.do?CMD=CMD_SEQ_108093945961332061537354
												  ,/sdlc/Anaconda.do?CMD=CMD_SEQ_104651175361332065328722
												  ,/sdlc/Anaconda.do?CMD=CMD_SEQ_105884107961332066065383
												  ,/sdlc/Anaconda.do?CMD=CMD_SEQ_104757947291319959645242&gubun=1" />
</jsp:include>



<!-- Form View component -->
<jsp:include page="/jsp/common/default-form.jsp">
	<jsp:param name="title" value="프로젝트 프로세스 등록" />
	<jsp:param name="action" value="/Anaconda.do?CMD=" />
	<jsp:param name="form" value="project_process" />
	<jsp:param name="footer" value="등록 완료" />
	<jsp:param name="header" value="항목,값" />
	<jsp:param name="check" value="check_password()" />
	<jsp:param name="check_message" value="비밀번호가 일치하지 않습니다." />
	<jsp:param name="column" value="프로세스 이름,프로세스 설명" />
	<jsp:param name="type" value="text,text" />
	<jsp:param name="css" value="styled,styled" />
	<jsp:param name="name" value="process_name,process_desc" />
	<jsp:param name="size" value="60,60" />
</jsp:include>


<!-- Form-Modify View component -->
<jsp:include page="/jsp/common/default-form-modify.jsp">
	<jsp:param name="title" value="프로젝트 프로세스 수정" />
	<jsp:param name="action" value="/Anaconda.do?CMD=" />
	<jsp:param name="form" value="project_process" />
	<jsp:param name="footer" value="등록 완료" />
	<jsp:param name="header" value="항목,값" />
	<jsp:param name="check" value="check_password()" />
	<jsp:param name="check_message" value="비밀번호가 일치하지 않습니다." />
	<jsp:param name="column" value="프로세스 이름,프로세스 설명" />
	<jsp:param name="type" value="text,text" />
	<jsp:param name="css" value="styled,styled" />
	<jsp:param name="name" value="process_name,process_desc" />
	<jsp:param name="size" value="60,60" />
	<jsp:param name="hidden_name" value="code,key" />
	<jsp:param name="hidden_value" value="A000,12132434kkk" />
	<jsp:param name="value" value="분석설계프로세스,설계를 위한 전단계" />
</jsp:include>


<!-- View component -->
<jsp:include page="/jsp/common/default-view.jsp">
	<jsp:param name="title" value="프로젝트 프로세스 리스트" />
	<jsp:param name="view_col_name" value="BC_SEQ_105108911611332065328722" />
	<jsp:param name="view_proc_name" value="getProjectList" />
	<jsp:param name="header" value="seq, project_title, project_start_date, project_end_date, project_status" />
	<jsp:param name="view_parameter_name" value="pos" />
	<jsp:param name="view_parameter_value" value="0" />
	<jsp:param name="view_parameter_type" value="int" />
	<jsp:param name="view_direction" value="h" />
	<jsp:param name="show_bit" value="1,1,1,0,1" />
	<jsp:param name="link_bit" value="1,1,0,0,1" />
	<jsp:param name="link" value="/Anaconda.do?CMD=XXXXXX" />
</jsp:include>

<!-- MSG View component -->
<jsp:include page="/jsp/common/default-message.jsp">
	<jsp:param name="title" value="회원가입 완료" />
	<jsp:param name="code" value="0000" />
	<jsp:param name="message" value="" />
	<jsp:param name="return_link" value="http://www.naver.com/" />
	<jsp:param name="return_message" value="돌아가기" />
	<jsp:param name="alert_message" value="" />
	<jsp:param name="redirect_link" value="" />
</jsp:include>