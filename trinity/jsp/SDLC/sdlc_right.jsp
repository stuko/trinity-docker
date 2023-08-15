<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.queue.RequestQueue" %>
<%@ page import="com.stuko.anaconda.queue.*" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.XmlConfig.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.service.*" %>
<%@ page import="com.stuko.anaconda.xtreme.site.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.bi.*"%>
<%@ page import="com.stuko.anaconda.util.*"%>


<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<!--h3><a href="/Anaconda.do?CMD=CMD_SEQ_104757947291319959645242&gubun=3" style="color:white">ISSUE ?</a></h3-->
<h3 style="font-family:arial"><img src="/jsp/hydra/img/servers.png" width="15px" height="15px" absmiddle>&nbsp;Current Status</h3>
<%
XtremeSiteManager xsm = XtremeSiteManager.getInstance();
DefaultXmlDataCollection dxdc = xsm.searchXtremeSite("");
int count1 = dxdc.size();
WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();
int count2 = xmlResource.size();
BizLogicXmlResource biz = BizLogicXmlResource.getInstance();
int count3 = biz.size();
%>
<%
RequestQueue q = RequestQueue.getInstance();
int cnt = 0;
SimpleQueue obj = q.getQueue(RequestQueue.ERROR);
if(obj != null)
	cnt = obj.getCount();

%>
<div class='featurebox_side'>
<div style="padding:5px;"><a href="/Anaconda.do?CMD=CMD_SEQ_108173637391288444301255">Web Site</a>&nbsp;(<%=count1%>)</div>
<div style="padding:5px;"><a href="/Anaconda.do?CMD=CMD_SEQ_108164918711286971872119">Page</a>&nbsp; (<%=count2%>)</div>
<div style="padding:5px;"><a href="/Anaconda.do?CMD=CMD_SEQ_103615773161287821449749">Service</a>&nbsp; (<%=count3%>)</div>
<div style="padding:5px;"><a href="/Anaconda.do?CMD=CMD_SEQ_101787643881289806558558">Error</a>&nbsp; (<%=cnt %>)</div>
</div>
<h3 style="font-family:arial"><img src="/jsp/hydra/img/servers.png" width="15px" height="15px" absmiddle>&nbsp;Special Func.</h3>
<div class='featurebox_side'>
<div style="padding:5px;"><a href="/Anaconda.do?CMD=CMD_SEQ_103935205231230567381328"><img src="/jsp/SDLC/img/sql.png" border="0" width="20px" align="absmiddle" alt="SQL 실행하기">&nbsp;Executer</a></div>
<div style="padding:5px;"><a href="/Anaconda.do?CMD=CMD_SEQ_108037707931289267322444"><img src="/jsp/anaconda/img/db.png" width="20px" border="0" width="40px" align="absmiddle" alt="데이터베이스 내용 보기">&nbsp;Explorer</a></div>
<div style="padding:5px;"><a href="/Anaconda.do?CMD=CMD_SEQ_108773320751371349718547"><img src="/jsp/anaconda/img/application.png" width="20px" border="0" width="40px" align="absmiddle" alt="Entity 내용 보기">&nbsp;Entity</a></div>
<div style="padding:5px;"><a href="/Anaconda.do?CMD=CMD_SEQ_100859473711361075217648"><img src="/jsp/SDLC/img/backup.png" border="0" width="20px" align="absmiddle" alt="원복하기"></img>
Recover</a></div>
<div style="padding:5px;"><a href="/Anaconda.do?CMD=CMD_SEQ_103213425031360588235009"><img src="/jsp/SDLC/img/rule.png" border="0" width="20px" align="absmiddle" alt="룰기반 개발하기"></img>
Rule (+/-)</a></div>
<div style="padding:5px;"><a href="/Anaconda.do?CMD=CMD_SEQ_108372379531335656881877"><img src="/jsp/SDLC/img/file.png" border="0" width="20px" align="absmiddle" alt="수정된 파일보기"></img>
Modified</a></div>
</div>
<!--div class='featurebox_side'>
<%
// out.println(DateUtil.getYYYYMMDD() + " ~");
%>
<a href="/Anaconda.do?CMD=CMD_SEQ_108372379531335656881877" style="font-weight:bold;">&nbsp;수정한 파일 보기</a>
</div-->

<h3 style="font-family:arial"><img src="/jsp/hydra/img/servers.png" width="15px" height="15px" align="absmiddle">&nbsp;History</h3>
<div class='featurebox_side'>
<%
String cur_url1 = BusinessHelper.getSubString((String)request.getAttribute(InitClass.CUR_URL),30,"...");
String cur_url2 = BusinessHelper.getSubString((String)request.getAttribute(InitClass.PRE_URL),30,"...");
String cur_url3 = BusinessHelper.getSubString((String)request.getAttribute(InitClass.PRE_URL_1),30,"...");
String cur_url4 = BusinessHelper.getSubString((String)request.getAttribute(InitClass.PRE_URL_2),30,"...");
String cur_url5 = BusinessHelper.getSubString((String)request.getAttribute(InitClass.PRE_URL_3),30,"...");
String cur_url6 = BusinessHelper.getSubString((String)request.getAttribute(InitClass.PRE_URL_4),30,"...");

String cur_cmd1 = BusinessHelper.getSubString((String)request.getAttribute(InitClass.CUR_PAGE_NAME),8,"...");
String cur_cmd2 = BusinessHelper.getSubString((String)request.getAttribute(InitClass.NEXT_PAGE_NAME),8,"...");
String cur_cmd3 = BusinessHelper.getSubString((String)request.getAttribute(InitClass.NEXT_PAGE_NAME_1),8,"...");
String cur_cmd4 = BusinessHelper.getSubString((String)request.getAttribute(InitClass.NEXT_PAGE_NAME_2),8,"...");
String cur_cmd5 = BusinessHelper.getSubString((String)request.getAttribute(InitClass.NEXT_PAGE_NAME_3),8,"...");
String cur_cmd6 = BusinessHelper.getSubString((String)request.getAttribute(InitClass.NEXT_PAGE_NAME_4),8,"...");
%>
<div style="padding:1px;"><a href="<%=(String)request.getAttribute(InitClass.CUR_URL)%>">1. <%=cur_cmd1%></a></div>
<div style="padding:1px;"><a href="<%=(String)request.getAttribute(InitClass.PRE_URL)%>">2. <%=cur_cmd2%></a></div>
<div style="padding:1px;"><a href="<%=(String)request.getAttribute(InitClass.PRE_URL_1)%>">3. <%=cur_cmd3%></a></div>
<div style="padding:1px;"><a href="<%=(String)request.getAttribute(InitClass.PRE_URL_2)%>">4. <%=cur_cmd4%></a></div>
<div style="padding:1px;"><a href="<%=(String)request.getAttribute(InitClass.PRE_URL_3)%>">5. <%=cur_cmd5%></a></div>
<div style="padding:1px;"><a href="<%=(String)request.getAttribute(InitClass.PRE_URL_4)%>">6. <%=cur_cmd6%></a></div>
<%
%>
</div>


<h3 style="font-family:arial"><img src="/jsp/hydra/img/servers.png" width="15px" height="15px" align="absmiddle">&nbsp;Solution</h3>
<div class='featurebox_side'>
<div style="padding:1px;">
<a href="/jnlp/STUKO-P2P.jnlp"><img src="/jsp/SDLC/img/chat.png" border="0" align="absmiddle" width="30px"><b>TALK</b><SUP><B style="color:red;">BETA</B></SUP></a>
</div>
<div style="padding:1px;">
<b style="font-family:arial;">P2P Solution Based on JNLP</b>
<li>Chat</li>
<li>File Transfer</li>
<li>Game(OMOK)</li>
</div>
</div>
<!--div class='featurebox_side'><a href="http://www.bestmember.net/"><img src="http://www.bestmember.net/jsp/bestmember/img/bestmember_logo.png" border="0" width="120px"></a></div-->
