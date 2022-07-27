<!------------------------------------------------------------------------>
<!------------------ ANACONDA UI FILE START ------------------------------>
<!------------------------------------------------------------------------>
<!-- FILE PATH : /WEB-INF/Anaconda/LayoutDir/area.jsp -->
<!------------------------------------------------------------------------>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.*"%><%@ page import="java.util.*"%><%@ page import="java.net.*"%><%@ page import="com.stuko.anaconda.XmlConfig.*"%><%@ page import="com.stuko.anaconda.business.*"%><%@ page import="com.stuko.anaconda.value.*"%><%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%><%@ page import="com.stuko.anaconda.util.InitClass"%>
<%
	DefaultXmlResource res = DefaultXmlResource.getInstance();
	String strLayoutName = request.getParameter(BlankField.ANACONDA_AREA_PARAM);
	String strBody = request.getParameter(BlankField.ANACONDA_AREA_BODY);
	String strIsPanel = request.getParameter(BlankField.ANACONDA_AREA_ISPANEL); 
	
	
	DefaultXmlDataCollection col_area = res.getDefaultXmlDataCollection(BlankField.ANACONDA_AREA);
	DefaultXmlDataCollection col_ui = res.getDefaultXmlDataCollection(BlankField.ANACONDA_UI);
	DefaultXmlDataCollection col_layout = res.getDefaultXmlDataCollection(BlankField.ANACONDA_LAYOUT);
	
	DefaultXmlData dxd = null;
	String strContainerStyle = null;
	String strContainerClass = null;
	int row = 0;
	int col = 0;
	
	if("true".equals(strIsPanel))
	{
		dxd = col_ui.getDefaultXmlData(strLayoutName);	
		strContainerStyle = dxd.getData("ui_style");
		strContainerClass = dxd.getData("ui_class");
		row = Integer.parseInt(dxd.getData("panel_row"));
		col = Integer.parseInt(dxd.getData("panel_col"));
	}
	else
	{
		dxd = col_layout.getDefaultXmlData(strLayoutName);	
		strContainerStyle = dxd.getData("style");
		strContainerClass = dxd.getData("class");
		row = Integer.parseInt(dxd.getData("row"));
		col = Integer.parseInt(dxd.getData("col"));
	}
	
	String strTitle = dxd.getData("title");
	String strJs = dxd.getData("js");
	String strCss = dxd.getData("css");

	strContainerStyle = BusinessHelper.checkBusinessNull(strContainerStyle) == false ? "" : strContainerStyle;
	strContainerClass = BusinessHelper.checkBusinessNull(strContainerClass) == false ? "" : strContainerClass;
	
	DefaultXmlDataCollection col_result = col_area.getDefaultXmlData("layout_name", dxd.getNAME());
	
	//out.println(col_result.toString());
	String	strAreaNameHeader = dxd.getNAME();
%>
<div id="<%=strAreaNameHeader%>_container" style="<%=strContainerStyle%>" class="<%=strContainerClass %>">
<%
	String strAreaKey  =  "";
	String strAreaName = "";
	String strPath = "";
	String strName = "";
	String strUIName = "";
	String strX = "";
	String strY = "";
	String strStyle = "";
	String strClass = "";
	int intX = -1;
	int intY = -1;
	DefaultXmlData defaultXmlData = null;
	DefaultXmlData uiXmlData = null;
	for(int i = 0; i < row; i++)
	{
%>
<div id="<%=strAreaNameHeader%>_row_<%=i %>" >
<%
		for(int j = 0; j < col ;j++)
		{
			strAreaKey = "";
			strAreaName = "";
			strPath = "";
			strName = "";
			strUIName = "";
			intX = -1;
			intY = -1;
			
			strX = "";
			strY = "";
			
			if(col_result != null && col_result.size() > 0)
			{
				DefaultXmlDataCollection searchCollection = col_result.getDefaultXmlData("x",""+i);
				if( searchCollection != null && searchCollection.size() > 0)
				{
					searchCollection = searchCollection.getDefaultXmlData("y",""+j);
					if(searchCollection != null && searchCollection.size() > 0)
					{
						defaultXmlData = (DefaultXmlData)searchCollection.get(0);
						strAreaKey = defaultXmlData.getNAME();
						strAreaName = defaultXmlData.getData("area_name");
						strUIName = defaultXmlData.getData("ui_name");
						strStyle = defaultXmlData.getData("area_style");
						strClass = defaultXmlData.getData("area_class");
						if(!BusinessHelper.checkBusinessNull(strStyle)) strStyle = "";
						if(!BusinessHelper.checkBusinessNull(strClass)) strClass = "";
						
						if(defaultXmlData.getData("isbody") != null && defaultXmlData.getData("isbody").equals("true"))
						{
							strPath = strBody;
						}
						else
						{
							uiXmlData = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_UI).getDefaultXmlData(strUIName);
							if(uiXmlData != null)
							{
								strName = uiXmlData.getData("name");
								strPath = uiXmlData.getData("value");
							}
						}			
						strX = defaultXmlData.getData("x");
						strY = defaultXmlData.getData("y");
						intX = Integer.parseInt(strX.trim());
						intY = Integer.parseInt(strY.trim());
					}
				}
			}
			//// System.out.println("strX="+strX + "/" + i + "," + "strY=" + strY + "/" + j + ":" + strPath + " body is " + strBody);
			//// System.out.println(intX + "/" + intY);
			
%>
				
				<% if(strX.equals(""+i) && strY.equals(""+j)) { %>
				<%
							String strAreaLayoutName = strLayoutName;
							String isPanel = "false";
							if(uiXmlData.getData("value_type").equals("panel"))
							{
								strAreaLayoutName = uiXmlData.getNAME();
								isPanel = "true";
							}
							request.setAttribute(uiXmlData.getNAME(),uiXmlData);
							if(BusinessHelper.checkBusinessNull(strPath))
							{
				%>
				<div  id="<%=strAreaNameHeader%>_section_<%=i %>_<%=j %>" style="<%=strStyle%>" class="<%=strClass %>">
							<jsp:include page="<%=strPath%>" flush="true" >
								<jsp:param value="<%=strAreaLayoutName %>" name="anaconda.area.name"/>
								<jsp:param value="<%=strBody %>" name="anaconda.area.body"/>	
								<jsp:param value="<%=isPanel %>" name="anaconda.area.ispanel"/>	
								<jsp:param value="<%=uiXmlData.getNAME() %>" name="anaconda.area.ui"/>	
							</jsp:include>
				</div>
				<%
							}
				} 
				%>
			<%
		}
	%>
</div>
<%
		
	}
%>
</div>

<!-------------------ANACONDA UI FILE END -------------------------------->


<!------------------------------------------------------------------------>
<!------------------ ANACONDA UI FILE START ------------------------------>
<!------------------------------------------------------------------------>
<!-- FILE PATH : /jsp/anaconda/ui/bug_edit.jsp -->
<!------------------------------------------------------------------------>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.*"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%
// 크기
String parameter = request.getParameter(BlankField.ANACONDA_AREA_UI);
DefaultXmlData dxd = (DefaultXmlData)request.getAttribute(parameter);
%>
<script language="javascript">
</script>
<form name="frmBug" method="post">
<p><h>버그관리</h></p>
<table class="table_hydra" cellspacing="1" cellpadding="1">
<colgroup>
<col width="30%">
<col>
</colgroup>
<thead>
<tr>
<th scope="col">이름</th>
<th scope="col">값</th>
</tr>
</thead>
<tbody>
<tr>
	<td>버그 이름</td>
	<td><input class="styled" type="text" name="bug_name" size="20" value=""></input></td>
</tr>
<tr>
	<td>버그 유형</td>
	<td><input class="styled" type="text" name="bug_type" size="20" value=""></input></td>
</tr>
<tr>
	<td> </td>
	<td><textarea style="styled" cols="20" rows="10" name="bus_contents"></textarea></td>
</tr>
<tr>
	<td span="2">
	<input type="button" class="button white" value="저장하기" onClick="javascript:save();"></input>
	<input type="button" class="button white" value="삭제하기" onClick="javascript:save();"></input>
	<input type="button" class="button white" value="수정하기" onClick="javascript:save();"></input>
	<input type="button" class="button white" value="돌아가기" onClick="javascript:history.back();"></input>
	</td>
</tr>
</tbody>
</table>

</form>



<!-------------------ANACONDA UI FILE END -------------------------------->


<!------------------------------------------------------------------------>
<!------------------ ANACONDA UI FILE START ------------------------------>
<!------------------------------------------------------------------------>
<!-- FILE PATH : /jsp/anaconda/anaconda_footer.jsp -->
<!------------------------------------------------------------------------>
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<p class="legal">
		&copy;Since 2004, 베스트멤버  All Rights Reserved.&nbsp;&nbsp 
		&nbsp;&nbsp;&bull;&nbsp;&nbsp;This Framework is used in the Trinity & Hydra&nbsp;&nbsp;<img src="/jsp/anaconda/img/mail.png" width="15px" height="15px" border=0 align="absmiddle">&nbsp;stuko@nate.com


<!-------------------ANACONDA UI FILE END -------------------------------->


<!------------------------------------------------------------------------>
<!------------------ ANACONDA UI FILE START ------------------------------>
<!------------------------------------------------------------------------>
<!-- FILE PATH : /jsp/bestmember/bestmember_top.jsp -->
<!------------------------------------------------------------------------>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.util.*" %>
		<div class="header">
			<div class="top_info">
				<div class="top_info_right">
					<!--  p><b>You are not Logged in!</b> <a href="#">Log in</a> to check your messages.<br /-->
						<%
						if(session.getAttribute(InitClass.getSESSION_DOMAIN()) == null){
						%>
						<a href="/Anaconda.do?CMD=CMD_SEQ_102171638871290559092125"  style="text-decoration:none;">로그인</a> 혹은 <a href="/Anaconda.do?CMD=CMD_SEQ_107504044261290560224692"  style="text-decoration:none;">회원가입</a>하시겠습니까?</p>
						<%}else{%>
						<a href="/Anaconda.do?CMD=CMD_SEQ_109415929681290591374244"  style="text-decoration:none;">로그아웃</a> 혹은 <a href="/Anaconda.do?CMD=CMD_SEQ_106580973941290560765491"  style="text-decoration:none;">회원정보수정</a>을 하시겠습니까?</p>
						<%} %>
				</div>		
				<div class="top_info_left">
				<%
				String strNewsSubject = "Spring";
				
				
				
				%>
					 <font color="blue"><%=strNewsSubject %></font> 관련 <a  style="text-decoration:none;" href="/Anaconda.do?CMD=CMD_SEQ_108677564861290762108083&subject=<%=strNewsSubject %>&kind=column">주요기사</a> 혹은 <a  style="text-decoration:none;" href="/Anaconda.do?CMD=CMD_SEQ_108677564861290762108083&subject=<%=strNewsSubject %>&kind=news">자료</a></p>
				</div>
			</div>
			<div class="logo">
				<a href="/Anaconda.do?CMD=CMD_SEQ_106234694441288612507662"  style="text-decoration:none;"><img src="/jsp/anaconda/img/bm.png" border=0 align="absmiddle"></img></a>
			</div>
		</div>
		<div class="bar">
			<ul style="padding-left:200px">
				<li><a title="솔루션" href="/Anaconda.do?CMD=CMD_SEQ_101601074261290735292541" accesskey="i"><img src="/jsp/anaconda/img/menu0.png" border="0" align="absmiddle"></img></a></li>
				<li><a title="시장" href="/Anaconda.do?CMD=CMD_SEQ_106254093561290735139860" accesskey="i"><img src="/jsp/anaconda/img/menu2.png" border="0" align="absmiddle"></img></a></li>
				<li><a title="정보" href="/Anaconda.do?CMD=CMD_SEQ_108677564861290762108083" accesskey="i"><img src="/jsp/anaconda/img/menu3.png" border="0" align="absmiddle"></img></a></li>
				<li><a title="강좌" href="/Anaconda.do?CMD=CMD_SEQ_104036707601290759200358" accesskey="i"><img src="/jsp/anaconda/img/menu4.png" border="0" align="absmiddle"></img></a></li>
				<li><a title="사람" href="/Anaconda.do?CMD=CMD_SEQ_105683825461290735356355" accesskey="i"><img src="/jsp/anaconda/img/menu5.png" border="0" align="absmiddle"></img></a></li>
				<!-- li class="active">베스트멤버</li>
				<li><a href="#" accesskey="m">프로젝트</a></li -->
				<!-- li><img src="/jsp/SDLC/img/sw.png" width=15 height=15 border=0 align="absmiddle"></img><a href="/Anaconda.do?CMD=CMD_SEQ_100045125901288610516229" target="_new" accesskey="p">Trinity</a></li>
				<li><img src="/jsp/hydra/img/dragon.png" width=15 height=15 border=0 align="absmiddle"></img><a href="/Anaconda.do?CMD=CMD_SEQ_108173637391288444301255" target="_new" accesskey="s">Hydra</a></li>
				<li><img src="/jsp/anaconda/img/snake.png" width=15 height=15 border=0 align="absmiddle"></img><a href="/Anaconda.do?CMD=CMD_SEQ_108164918711286971872119" target="_new" accesskey="r">Anaconda</a></li-->
			</ul>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="/Anaconda.do?CMD=CMD_SEQ_105837494071291256697630" style="text-decoration:none;font:bold 13px 돋움체;color:red;"><img src="/jsp/anaconda/img/anaconda_credit2.png" width="50px" height="50px" border="0" align="absmiddle"></img></a>
			<a href="/Anaconda.do?CMD=CMD_SEQ_101922941381291089775525" style="text-decoration:none;font:bold 13px 돋움체;color:red;"><img src="/jsp/anaconda/img/test.png" width="40px" height="40px" border="0" align="absmiddle"></img></a>
			<a href="/Anaconda.do?CMD=CMD_SEQ_101102474691290752650773" style="text-decoration:none;font:bold 13px 돋움체;color:red;"><img src="/jsp/anaconda/img/virtual_company.png" width="40px" height="40px" border="0" align="absmiddle"></img></a>
			<a href="/Anaconda.do?CMD=CMD_SEQ_102004061071291615097852&gubun=10" style="text-decoration:none;font:bold 13px 돋움체;color:red;"><img src="/jsp/anaconda/img/faq.png" width="40px" height="40px" border="0" align="absmiddle"></img></a>		</div>

<!-- end menu -->

<!-------------------ANACONDA UI FILE END -------------------------------->


<!------------------------------------------------------------------------>
<!------------------ ANACONDA UI FILE START ------------------------------>
<!------------------------------------------------------------------------>
<!-- FILE PATH : /jsp/bestmember/bestmember_footer.jsp -->
<!------------------------------------------------------------------------>
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
	<p class="legal">
		&copy;Since 2004, <a href="http://www.bestmember.net/" target="new">www.bestmember.net</a> All Rights Reserved.&nbsp;&nbsp; 
<%
boolean isAdmin = false;
if(session.getAttribute(InitClass.getSESSION_DOMAIN()) != null)
{
	Object object = session.getAttribute(InitClass.getSESSION_DOMAIN());
	IAuth auth = (IAuth)object;
	String score = auth.getAuthItem("MEMBER_SCORE");
	int iscore = -1;
	try
	{
		iscore = Integer.parseInt(score);
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	if(iscore >= 1000)isAdmin = true;
}
if(isAdmin)
{
%>
		<a href="/Anaconda.do?CMD=CMD_SEQ_109067947561291939102188">관리자</a>
<%
}
%>
		&nbsp;|&nbsp;<a href="/Anaconda.do?CMD=CMD_SEQ_105160108371291601479150">제휴문의</a>&nbsp;|&nbsp;연락처:<img src="/jsp/anaconda/img/mail.png" width="15px" height="15px" border=0 align="absmiddle">&nbsp;stuko@nate.com

<!-------------------ANACONDA UI FILE END -------------------------------->


<!------------------------------------------------------------------------>
<!------------------ ANACONDA UI FILE START ------------------------------>
<!------------------------------------------------------------------------>
<!-- FILE PATH : /jsp/anaconda/anaconda_jsp_directive.jsp -->
<!------------------------------------------------------------------------>
<%@ page contentType="text/xml; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%><%


<!-------------------ANACONDA UI FILE END -------------------------------->


<!------------------------------------------------------------------------>
<!------------------ ANACONDA UI FILE START ------------------------------>
<!------------------------------------------------------------------------>
<!-- FILE PATH : /jsp/anaconda/anaconda_jsp_table.jsp -->
<!------------------------------------------------------------------------>
<table>
   <tr>
      <td></td>
   </tr>
</table>

<!-------------------ANACONDA UI FILE END -------------------------------->


<!------------------------------------------------------------------------>
<!------------------ ANACONDA UI FILE START ------------------------------>
<!------------------------------------------------------------------------>
<!-- FILE PATH : /jsp/anaconda/anaconda_jsp_paging.jsp -->
<!------------------------------------------------------------------------>

<!-------------------ANACONDA UI FILE END -------------------------------->


<!------------------------------------------------------------------------>
<!------------------ ANACONDA UI FILE START ------------------------------>
<!------------------------------------------------------------------------>
<!-- FILE PATH : /jsp/anaconda/anaconda_jsp_title.jsp -->
<!------------------------------------------------------------------------>

<!-------------------ANACONDA UI FILE END -------------------------------->


<!------------------------------------------------------------------------>
<!------------------ ANACONDA UI FILE START ------------------------------>
<!------------------------------------------------------------------------>
<!-- FILE PATH : /jsp/anaconda/anaconda_jsp_form.jsp -->
<!------------------------------------------------------------------------>

<!-------------------ANACONDA UI FILE END -------------------------------->



