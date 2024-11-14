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
    if(confirm("Really copy role?")){
	document.frm2.action="/Anaconda.do?CMD=CMD_SEQ_109355673071288245749397";
	document.frm2.RoleCollectionKorName.value = strRoleKorName;
	document.frm2.RoleCollection.value = strNameSpace;
	document.frm2.GUBUN.value = 'copy';
	AnacondaSubmit(document.frm2);
    }		
}
function fnRoleCollectionRemove(strNameSpace)
{
    if(confirm("Really delete role?")){
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
	var bAnswer = confirm("Can not recover.\nReally Delete?");
	
	if (bAnswer == true) 
	{
		document.frm.action="/Anaconda.do?CMD=CMD_SEQ_109355673071288245749397&GUBUN=D&RoleCollection="+args+"&RoleName="+arg2;
		AnacondaSubmit(document.frm);		
	} else {
		alert("Cancelled");
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
			<h3 class="fl">Access roles list</h3>	
			<span class="fr">
                           <button type="button" class="btn btn-primary" name="Register" value="Create" onClick="javascript:fnRoleCreate();">Create</button>
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
		<th scope="col">Role name</th>
		<th scope="col">Role value</th>
		<th scope="col">Type</th>
		<th scope="col">Parent role</th>
		<th scope="col">Function</th>
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
	 			<tr style="background:#FFFFCC;"><td colspan=2 style="text-align:center">Role group : <%=strRoleKeys %>(<%=col.getROLECOLLECTION_KOR_NAME() %>)</td>
	 			<td colspan="3" style="text-align:right">
<button type="button" class="btn btn-secondary" name="" value="Copy role group" onClick="javascript:fnShowOrHideMenu('div_role_<%=idx %>');">Copy role group</button>
	 			&nbsp;&nbsp;<button type="button" class="btn btn-danger" name="" value="Delete role group" onClick="javascript:fnRoleCollectionRemove('<%=strRoleKeys %>');">Delete role group</button></td></tr>
				<div id="div_role_<%=idx %>" style="display:none;position:absolute;background-color:white;border: 2px double #BF95FF;padding: 5px 5px;">
						<ul>
							<li>Role group name : <input type="text" name="role_kor_name_<%=idx %>"></input></li>
							<li><button type="button" class="btn btn-info" name="" value="Copy role" onClick="javascript:fnRoleCopy('<%=strRoleKeys %>',frmRoleCopy.role_kor_name_<%=idx %>.value);">Copy role</button>
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
