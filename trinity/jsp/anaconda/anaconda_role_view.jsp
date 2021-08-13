<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>

<%
	BusinessHelper helper  = new BusinessHelper();
	String strColName= request.getParameter("Col");
	System.out.println(strColName);
	strColName = helper.getRoleString();
	String strRole= request.getParameter("Role");
	String strRoleName = "";	
	String strRoleType = "";
	String strRoleUrlType = "";
	String strRoleUrlSelected = "disabled";
	String strSearchActionButtonDisplay = "none";
	String strRoleUrl = "";
	String strRoleValue = "";
	String strParent = "";
	String strExpression = "";
	String strRoleFieldName = "";
	String strRoleKorName = "";
	String strRoleClickMessage = "";
	XtremeRole role = null;
	
	try
	{
		if(strRole != null)
		{

			XtremeRoleManager xmlResource = XtremeRoleManager.getInstance();
		 	XtremeRoleCollection col = null;
			if(strColName != null)
			{
				col = xmlResource.getRoleCollection(strColName);
				role = col.getXtremeRole(strRole);
				if(role != null)
				{
					strRoleName = role.getRole_name();
					strRoleType = role.getRole_type();
					strRoleValue = role.getRole_value();
					strRoleUrl = role.getRole_url();
					strParent = role.getRole_depend();
					strExpression = role.getRole_expression();
					strRoleFieldName = role.getRole_field_name();
					strRoleKorName = role.getRole_kor_name();
					strRoleUrlType = role.getRole_url_type();
					strRoleClickMessage = role.getRole_click_message();
					if(strRoleUrlType == null)
					{
						strRoleUrlType = "URL";
					}
					if(strRoleUrlType.equals("URL"))strRoleUrlSelected="";
				}
			}
		}
		else
		{
			//strColName= "";
			strRole= "";
		}


	} catch (Exception e) {
		ExceptionCenter.catchException(e);
	}
%>

<script>
function fnRoleUpdate()
{
	with(frmRole)
	{
		GUBUN.value = 'U';
		if(confirm("Really update?"))
		{
			AnacondaSubmit(document.frmRole);
		}
	}

}
function fnRoleCreate()
{
	with(frmRole)
	{
		GUBUN.value = 'R';
		if(confirm("Really create?"))
		{
			AnacondaSubmit(document.frmRole);
		}
	}
}
function fnRoleDelete()
{
	with(frmRole)
	{
		GUBUN.value = 'D';
		if(confirm("Can not recover.\nReally delete?"))
		{
			AnacondaSubmit(document.frmRole);
		}
	}
}
function checkCol()
{
	with(frmView)
	{
		if(chkCol.checked == true) CollectionName.disabled = true;
	    else CollectionName.disabled = false;
	}
}
function checkView()
{
	with(frmView)
	{
		if(chkView.checked == true) Forward.disabled = true;
	    else Forward.disabled = false;
	}
}

function selectRoleUrlType(selectBox)
{
	if(selectBox.selectedIndex == 1)
	{
		viewSearchActionButton();
	}
	else
	{
		closeSearchActionButton();
	}
}

function viewSearchActionButton()
{
	var objButton = document.getElementById('searchActionButton');
	objButton.style.display = "block";
}

function closeSearchActionButton()
{
	var objButton = document.getElementById('searchActionButton');
	objButton.style.display = "none";
}

function fnSearchAction()
{
	window.open("/Anaconda.do?CMD=CMD_SEQ_109181124291288240727842&title=Search&Object=opener.document.frmRole.RoleUrl","","height=500,width=650,left=200,top=20,status=no, location=no, toolbar=no,resizable=yes,scrollbars=yes");	
}

function fnSearchRole()
{
	window.open("/Anaconda.do?CMD=CMD_SEQ_105690120951288243926312&title=Search&Object=opener.document.frmRole.RoleParent","","height=500,width=650,left=200,top=20,status=no, location=no, toolbar=no,resizable=yes,scrollbars=yes");	
}
</script>
<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">권한 정보 생성</h3>

			</div>
		</div>
	</div>
</div>
<form name="frmRole" method="post" action="/Anaconda.do?CMD=CMD_SEQ_109355673071288245749397">
<input type="hidden" name="GUBUN" value="">
<input type="hidden" name="RoleCollection" value="<%=strColName %>">
<table class="table_hydra" cellspacing="0" cellpadding="0">
		<colgroup>
		<col width="30%">
		<col>
		</colgroup>
		<tbody >
	   	<tr>
		  <td class="left"  >권한 이름</td>
		  <td>&nbsp;<input type="text" class="styled" name="RoleKorName" value="<%=strRoleKorName%>" size="45"></td>	
  		</tr>
  		<tr>
		  <td class="left"  >권한 키</td>
		  <td>&nbsp;<%=strRoleName%><input type="hidden" name="RoleName" value="<%=strRoleName%>"></td>	
  		</tr>
  		<tr>
		  <td class="left" >권한 값 유형</td>
		  <td>&nbsp;<SELECT NAME='RoleType'>
			  <OPTION value='numeric' <%=strRoleType.equals("numeric")?"selected":""%>>numeric</OPTION>
			  <OPTION value='string' <%=strRoleType.equals("string")?"selected":""%>>string</OPTION>
			  <OPTION value='date' <%=strRoleType.equals("date")?"selected":""%>>date</OPTION>
			  <OPTION value='timestamp' <%=strRoleType.equals("timestamp")?"selected":""%>>timestamp</OPTION>
			  <OPTION value='reg' <%=strRoleType.equals("reg")?"selected":""%>>Regular Exp.</OPTION>
			  <OPTION value='businessprocess' <%=strRoleType.equals("businessprocess")?"selected":""%>>business process</OPTION>
	  		</SELECT>
		  </td>	
  		</tr>
		<tr>
		  <td class="left" >권합 값</td>
		  <td>&nbsp;<input type="text" class="styled" name="RoleValue" value="<%=strRoleValue%>" size="45"></td>	
		</tr>
		<tr>
		  <td class="left" >권한을 얻기위한 액션 선택</td>
		  <td>&nbsp;<SELECT NAME='RoleUrlType' onChange="javascript:selectRoleUrlType(this)">
			  <OPTION value='URL' <%=strRoleUrlType.equals("URL")?"selected":""%>>URL 입력</OPTION>
			  <OPTION value='ACTION' <%=strRoleUrlType.equals("ACTION")?"selected":""%>>액션</OPTION>
	  		</SELECT>
		  </td>	
  		</tr> 		
  		<tr>
		  <td class="left" >권한을 얻기위한 액션 입력</td>
		  <td>&nbsp;<input type="text" class="styled" name="RoleUrl" value="<%=strRoleUrl%>" size="45">
		  <% if(strRoleUrlType.equals("ACTION")){ strSearchActionButtonDisplay = "block"; } %>
		  <button id="searchActionButton" style="display:<%=strSearchActionButtonDisplay %>;margin:4px;" type="button" class="btn btn-info" name="" value="Search a action for access a role" onClick="javascript:fnSearchAction();">Search a action for access a role</button>
		  </td>	
  		</tr>
  		<tr>
		  <td class="left" >권한 프로세스 이름</td>
		  <td>&nbsp;<input type="text" class="styled" name="RoleFieldName" value="<%=strRoleFieldName%>" size="45">&nbsp;(ex:BCName.BPName , ex: business process)</td>	
  		</tr>
  		<tr>
    	  <td class="left" >권한 조건</td>
    	  <td>&nbsp;<SELECT NAME='Expression'>
			  <OPTION value='=' <%=strExpression.equals("=")?"selected":""%> >=</OPTION>
			  <OPTION value='>' <%=strExpression.equals(">")?"selected":""%> >></OPTION>
			  <OPTION value='<' <%=strExpression.equals("<")?"selected":""%> ><</OPTION>
			  <OPTION value='>=' <%=strExpression.equals(">=")?"selected":""%> >>=</OPTION>   
 			  <OPTION value='<=' <%=strExpression.equals("<=")?"selected":""%> ><=</OPTION>
			  <OPTION value='!=' <%=strExpression.equals("!=")?"selected":""%> >!=</OPTION>
		  </SELECT>
		  </td>	
  		</tr>
  		<tr>
		  <td class="left" >권한 없을때 메시지 정보</td>
		  <td>&nbsp;<input type="text" class="styled" name="RoleClickMessage" value="<%=strRoleClickMessage%>" size="45"></td>	
  		</tr>
  		<tr>
		  <td class="left" >상위 권한</td>
		  <td>&nbsp;<input type="text" class="styled" name="RoleParent" value="<%=strParent%>" size="45">&nbsp;&nbsp;<button type="button" class="btn btn-secondary" name="" value="Search role" onClick="javascript:fnSearchRole();">검색</button></td>	
  		</tr>
  	</tbody>
	</table>
  <p></p>
  <table>
  <tr>    
    <td align="center">
    <% if(role == null) { %>
	<button type="button" class="btn btn-primary" name="" value="Create" colspan="2" onClick="javascript:fnRoleCreate();">추가</button>
	<%} else { %>
	<button type="button" class="btn btn-secondary" name="" value="Modify" colspan="2" onClick="javascript:fnRoleUpdate();">수정</button>
	<button type="button" class="btn btn-danger" name="" value="Delete" colspan="2" onClick="javascript:fnRoleDelete();">삭제</button>
	<%} %>
	<button type="button" class="btn btn-warning" name="" value="Back" colspan="2" onClick="javascript:history.back();">뒤로가기</button>
	</td>
  </tr>
  </table>
</form>
