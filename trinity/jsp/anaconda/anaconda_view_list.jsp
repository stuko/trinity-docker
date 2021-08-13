<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.util.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="java.util.*"%>
<%
	String IS_ACCEPTER = session.getAttribute("ACCEPTER") == null ? "true" : (String)session.getAttribute("ACCEPTER");
	String strText = request.getParameter("inputText") == null ? "" : request.getParameter("inputText").trim();	
	String strParam = request.getParameter("srh_param") == null ? "" : request.getParameter("srh_param").trim();
	String strWAC = null;
	String strSessionValue = "";
	RequestHelper helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
	DefaultAuth auth = (DefaultAuth)helper.getSessionObject();
	if(auth != null){
		strSessionValue = auth.getAuthItem(("MEMBER_NAME"));	
	}
	if(!BusinessHelper.checkBusinessNull(request.getParameter("WVC"))){
		helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
		String cookieWac = (String)helper.getSession("WVC");
		if(BusinessHelper.checkBusinessNull(cookieWac)){
			strWAC = cookieWac;
		}else{
			strWAC = "ALL";
		}
	}else{
		strWAC = request.getParameter("WVC").trim();
		helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
		helper.setSession("WVC",strWAC);
	}
%>

<script language="javascript">
	function fnViewView(strCollectionName,strViewName){
		document.location.href = "/Anaconda.do?CMD=CMD_SEQ_105760595001287408553144&Col=" + strCollectionName + "&View=" + strViewName;
	}
	function fnViewCreate(){
		document.location.href = "/Anaconda.do?CMD=CMD_SEQ_105760595001287408553144";
	}
	function fn_ViewDel(args){	
		var bAnswer = confirm("화면 (" +args+ ")는  삭제시 복구가 되지 않습니다.\n삭제하시겠습니까?");
		if (bAnswer == true) {
			document.searchFrm.action="/Anaconda.do?CMD=CMD_SEQ_103722119481287894495105&viewCol="+args;
			AnacondaSubmit(document.searchFrm);		
		} else {
			alert("취소되었습니다");
			return;
		}
	}
	function fnUIList(){
		document.location.href = "/Anaconda.do?CMD=CMD_SEQ_104378450531288765663303";
	}

	function fnLayoutList(){
		document.location.href = "/Anaconda.do?CMD=CMD_SEQ_105856396481288658408572";
	}
	function fnSearchWACList(strWAC){
		document.location.href="/Anaconda.do?CMD=CMD_SEQ_100600677051287893203559&WVC="+strWAC;
	}
	function fnShowOrHideActionGroup(strAnchor, strDiv){
		var objAnChor = _(strAnchor);
		if(objAnChor.innerHTML == '화면 그룹 숨기기')objAnChor.innerHTML = '화면 그룹 보이기';
		else objAnChor.innerHTML = '화면 그룹 숨기기';
		fnShowOrHide(strDiv);
	}
	function doRuning(callerName){
		showRunning(callerName);
	}
	function doRun(callerName){
		alert("정상적으로 반영되었습니다");
	}
	function fnAllChangeUser(){
		if(!confirm("현재 사용자로 모든 화면의 소유자를 바꾸시겠습니까?.")) return;
		with(frmView){
			// var change_user = owner.value;
			code.value = "change_all_user";
			GUBUN.value = "change_all_user";
			callAjaxByForm("change_all_user", "frmView");
			// AnacondaSubmit(document.frmView);
		}
	}
</script>

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
				<h3 class="fl">뷰 그룹 정보</h3>

				<form name="frmView" method="post" action="/Anaconda.do">
				<input type="hidden" name="CMD" value="CMD_SEQ_104913855441287801302856" />
				<input type="hidden" name="GUBUN" value="" />
				<input type="hidden" name="code" value="" /> 
				<input type="hidden" name="owner" value="<%=strSessionValue %>" />
				</form>
				
				<form name="searchFrm" method="POST" action="/Anaconda.do?CMD=CMD_SEQ_100600677051287893203559">

					<div class="post"><div class="title-right"><h2><font><b>화면 목록</b></font></h2></div></div>
					<span class="fr">
						<input type="button" class="button white" name="" value="화면 그룹 (Group) 생성" colspan="2" onClick="javascript:fnViewCreate();">
					</span>
					<span class="fr"></span>
					<span class="fr">
						<input type="button" class="button white"  name="" value="UI 요소 목록" colspan="2" onClick="javascript:fnUIList();">
					</span>
						<span class="fr"><input type="button" class="button white"  name="" value="레이아웃 (Layout) 목록화면" colspan="2" onClick="javascript:fnLayoutList();">
					</span>
						<span class="fr"><input type="button"  id="actionGroupShow" class="button white" name="Register" value="전체보기" onClick="javascript:fnShowOrHideActionGroup('actionGroupShow','divContext');fnNull();">
					</span>
					<%if (strSessionValue.equals(InitClass.getInstance().getData(InitClass.SA_ID))) {%>
						<span class="fr">
							<input type="button" class="button white" value="현재 사용자로 일괄변경" onClick="javascript:fnAllChangeUser();"></input>
						</span>
					<%} %>

					<div style="width:100%;display:none;margin-left:10px;position:relative;background-color:white;border: 1px double #666;padding: 1px 1px;" id="divContext">
						<table cellspacing=0 cellpadding=0 width="100%">
							<tr>
								<td>
									<table cellspacing=0 cellpadding=5 border=0 style="padding: 5px 5px">
										<caption style="padding: 10px 10px"><b>화면 그룹 리스트</b></caption>
										<tbody>
											<tr>
												<td style="float:right">
													<div id='tab1' style='display:block;'>
<%
	ViewXmlResource xmlResource = ViewXmlResource.getInstance();
	try{
							
		Iterator it =	xmlResource.getViewCollection();
		int iTr = 0;
		int iTab = 0;
		boolean isClosed = false;
		ViewCollection viewCollection = null;
		View view = null; 
		int iRow = 0;  			
		for(int ii = 1 ;it.hasNext();ii++){
			viewCollection = (ViewCollection)it.next();
			if(!viewCollection.hasOwner(strSessionValue)) continue;
			iRow++;
			iTr = iRow % 3;
			if(iTr == 1){
				isClosed = false;
				iTab++;
				out.println("<div id=\"tab"+iTab+"\" style=\"display:none;\"><tr>");
			}
			String strWACName = viewCollection.getVIEWCOLLECTION_NAME();
			String strWACKName = viewCollection.getVIEWCOLLECTION_KOR_NAME();
			strWACKName = strWACKName.length() > 13 ? strWACKName.substring(0,13)+"..." : strWACKName;
%>
	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/jsp/anaconda/img/box.png" width="13px" height="13px" border=0 align="absmiddle">&nbsp;&nbsp;<a href="javascript:fnSearchWACList('<%=strWACName %>');"><%=strWACKName %></a>&nbsp;&nbsp;</td>
<%
			if(iTr == 0){
				isClosed = true;
				out.println("</tr></div>");
			}
		}
		if(iTr != 0){
			for(int j = 1; j < iTr; j++){
				out.println("<td></td>");
			}
		}
		if(!isClosed){
			out.println("</tr>");
		}
	}catch(Exception ex){ex.printStackTrace();}
%>
													</div>	
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</table>
					</div>
					<table class="table_hydra" cellspacing="0" cellpadding="0">
						<caption>화면 리스트</caption>
						<colgroup>
							<col width="15%">
							<col>
							<col width="10%">
							</colgroup>
						<thead >
							<tr>
								<th scope="col">화면 그룹 명</th>
								<th scope="col">화면 이름</th>
								<th scope="col">기능</th>
							</tr>
						</thead>
						<tbody>
<%
	try{
		xmlResource = ViewXmlResource.getInstance();					
		Iterator it = null; 
		if( request.getParameter("srh_param") != null && !request.getParameter("srh_param").trim().equals("")
			&& request.getParameter("srh_param").trim().equals("FORWARDNAME")
			&& request.getParameter("inputText") != null 
			&& !request.getParameter("inputText").trim().equals("")){
			String strSearch = request.getParameter("inputText").trim();
			it = xmlResource.searchViewLikeForward(strSearch);
		}else{
			it =	xmlResource.getViewCollection();
			String searchGubun = (request.getParameter("srh_param") == null ? "" : request.getParameter("srh_param")) +"/" + (request.getParameter("inputText") == null ? "" : request.getParameter("inputText"));
		}
		ViewCollection viewCollection = null;
		View view = null;    			
		for (;it.hasNext();){    				
			viewCollection = (ViewCollection)it.next();
			if(strWAC.equals("ALL") || strWAC.equals(viewCollection.getVIEWCOLLECTION_NAME())){
				Iterator iterator = viewCollection.getViews();
				int iSize = viewCollection.size();
				int i = 0;
			    for(int j =0 ;iterator.hasNext();j++){
					view = (View)iterator.next();
					if(!view.hasOwner(strSessionValue)) continue; 
					out.println("<tr align=\"left\">");
					if(i == 0){
						out.println("<td rowspan=" + iSize +"  height=\"20\"  bgcolor=\"#FFFFFF\" style=\"padding:3 5 2 7;\">"+viewCollection.getVIEWCOLLECTION_KOR_NAME() + "</td>");
					}
					out.println("<td  height=\"20\"  bgcolor=\"#FFFFFF\" style=\"padding:3 5 2 7;\"><a href='javascript:fnViewView(\""+ viewCollection.getVIEWCOLLECTION_NAME() +"\",\""+ view.getFORWARD_NAME() +"\");'><img src=\"/jsp/anaconda/img/trinity_icon.gif\" border=0>&nbsp;" + view.getFORWARD_KOR_NAME() + "</a></td>");
					if(i == 0){
						if(IS_ACCEPTER.equals("true")){
							out.println("<td rowspan=" + iSize +" align=\"left\" height=\"20\" bgcolor=\"#FFFFFF\" style=\"padding:3 5 2 7;\">&nbsp;<a href=\"javascript:fn_ViewDel('"+viewCollection.getVIEWCOLLECTION_NAME()+ "')\"><img src=\"/jsp/anaconda/img/trinity_icon.gif\" border=0>&nbsp;삭제</a></td>");
						} else {
							out.println("<td rowspan=" + iSize +" width=\"6%\" align=\"left\" height=\"20\" bgcolor=\"#FFFFFF\" style=\"padding:3 5 2 7;\">&nbsp;권한없음</td>");
						}
					}
					out.println("</tr>");
					i++;
				}
			}	
	    }
		xmlResource.release();
		} catch (Exception e) { ExceptionCenter.catchException(e); }
%>
						</tbody>
					</table>
					<p></p>
				</form>
			</div>
		</div>
	</div>
</div>