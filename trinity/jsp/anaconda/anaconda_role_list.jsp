<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%
	String strText = request.getParameter("inputText") == null ? "" : request.getParameter("inputText").trim();	
	String strParam = request.getParameter("srh_param") == null ? "" : request.getParameter("srh_param").trim();
%>

<script language="javascript">
<!--
function fnRoleView(strCollectionName,strViewName)
{
	if(strViewName == null || strViewName == '')
	{
		alert("No role info.");
		return;
	}
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_108710360611288228206258&Col=" + strCollectionName + "&Role=" + strViewName;
}
function fnRoleCopy(strNameSpace,strRoleKorName)
{
    if(confirm("권한을 복사 할까요?")){
	document.frm2.action="/Anaconda.do?CMD=CMD_SEQ_109355673071288245749397";
	document.frm2.RoleCollectionKorName.value = strRoleKorName;
	document.frm2.RoleCollection.value = strNameSpace;
	document.frm2.GUBUN.value = 'copy';
	AnacondaSubmit(document.frm2);
    }		
}
function fnRoleCollectionRemove(strNameSpace)
{
    if(confirm("권한을 삭제할까요?")){
	document.frm2.action="/Anaconda.do?CMD=CMD_SEQ_109355673071288245749397";
	document.frm2.RoleCollection.value = strNameSpace;
	document.frm2.GUBUN.value = 'DC';
	AnacondaSubmit(document.frm2);		
     }
} 
function fnRoleCreate()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_108710360611288228206258";
}

function fnRoleDel(args,arg2)
{	
	var bAnswer = confirm("권한을 삭제 할까요?");
	
	if (bAnswer == true) 
	{
		document.frm.action="/Anaconda.do?CMD=CMD_SEQ_109355673071288245749397&GUBUN=D&RoleCollection="+args+"&RoleName="+arg2;
		AnacondaSubmit(document.frm);		
	} else {
		alert("취소하셨습니다.");
		return;
	}
}
//-->
</script>

<form name="frm" method="post" action="">
</form>
<form name="frm2" method="post" action="">
<input type="hidden" name="RoleCollectionKorName"></input>
<input type="hidden" name="GUBUN"></input>
<input type="hidden" name="RoleCollection"></input>
</form>


 <div class="content-module-heading cf">
	<h3 class="fl">권한 리스트</h3>	
	<span class="fr">
		<button type="button" class="btn btn-primary" name="Register" value="Create" onClick="javascript:fnRoleCreate();">추가하기</button>
	</span>
 </div>



<form name="frmRoleCopy" id="frmRoleCopy" method="post" action="">
		<table class="table_hydra" cellspacing="0" cellpadding="0">
		<colgroup>
		<col width="30%">
		<col>
		<col width="5%">
		<col width="30%">
		<col width="10%">
		</colgroup>
		<thead >
		<tr>
		<th scope="col">권한이름</th>
		<th scope="col">권한값</th>
		<th scope="col">권합값 유형</th>
		<th scope="col">상위권한</th>
		<th scope="col">기능</th>
		</tr>
		</thead>
		<tbody >
		 <%
		 	XtremeRoleManager res = XtremeRoleManager.getInstance();
		 	Set keys = res.getRoleCollection();
		 	Iterator it_keys = keys.iterator();
		 	for(int idx = 0;it_keys.hasNext();idx++)
		 	{
		 		String strRoleKeys = (String)it_keys.next();
			 	XtremeRoleCollection col = res.getRoleCollection(strRoleKeys);
			 	if(col != null)
			 	{
	 		%>
	 			<tr style="background:#FFFFCC;"><td colspan=2 style="text-align:center">권한 그룹 : <%=strRoleKeys %>(<%=col.getROLECOLLECTION_KOR_NAME() %>)</td>
	 			<td colspan="3" style="text-align:right">
<button type="button" class="btn btn-secondary" name="" value="Copy role group" onClick="javascript:fnShowOrHideMenu('div_role_<%=idx %>');">권한 그룹 복사</button>
	 			&nbsp;&nbsp;<button type="button" class="btn btn-danger" name="" value="Delete role group" onClick="javascript:fnRoleCollectionRemove('<%=strRoleKeys %>');">권한 그룹 삭제</button></td></tr>
				<div id="div_role_<%=idx %>" style="display:none;position:absolute;background-color:white;border: 2px double #BF95FF;padding: 5px 5px;">
						<ul>
							<li>권한 그룹 이름 : <input type="text" name="role_kor_name_<%=idx %>"></input></li>
							<li><button type="button" class="btn btn-info" name="" value="Copy role" onClick="javascript:fnRoleCopy('<%=strRoleKeys %>',frmRoleCopy.role_kor_name_<%=idx %>.value);">권한 복사</button>
							</li>
						</ul>
				</div>
	 		<%
				 	for(int i = 0;i < col.size(); i++)
				 	{
				 			XtremeRole role = (XtremeRole)col.get(i);
				 %>
				 <tr>
				 	<td  class="left"><a href="javascript:fnRoleView('<%=strRoleKeys %>','<%=role.getRole_name() %>')"><i class="fas fa-user-tag"></i> <%=role.getRole_kor_name()%></a></td>
				 	<td  class="left"><%=role.getRole_value()%></td>
				 	<td  class="left"><%=role.getRole_type()%></td>
				 	<td  class="left"><a href="javascript:fnRoleView('<%=strRoleKeys %>','<%=role.getRole_depend() %>')"><%=role.getRole_depend() %></a></td>
				 	<td><button type="button" class="btn btn-danger" value="Delete" onClick="fnRoleDel('<%=strRoleKeys %>','<%=role.getRole_name() %>')">Delete</button></td>
				 </tr>
				 <%
			 		}
			 	}
			 	else
			 	{
			 		out.println("No Role");
			 	}
		 	}
		 %>
		</tbody>
		</table>
</form>
<!----------------------------------------- 리스트 보여주는 테이블 끝----------------------------------------->
