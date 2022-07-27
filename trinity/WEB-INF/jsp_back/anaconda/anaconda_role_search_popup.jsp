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
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%
	String strObject = request.getParameter("Object");
	String strText = request.getParameter("inputText") == null ? "" : request.getParameter("inputText").trim();	
	String strParam = request.getParameter("srh_param") == null ? "" : request.getParameter("srh_param").trim();
%>

<script language="javascript">
<!--
function fn_FrmInput(args1,args2)
{
	var object = eval(<%=strObject%>);
	object.value = args2;
	self.close();
	return;
}
//-->
</script>
<div style="padding: 5px;margin:10px;">
<h3>검색하기</h3>
<form name="frm" method="POST" action="/Anaconda.do?CMD=CMD_SEQ_105690120951288243926312&title=권한조회">
<input type="hidden" name="Object" value="<%=strObject %>"></input>
<!----------------------------------------- 검색 조건및 등록 테이블 시작---------------------------------------->	
		<table class="table_hydra" cellspacing="0" cellpadding="1">
		  <tr>
			<td>
			  <SELECT NAME='srh_param'>
			    <OPTION>선택</OPTION>
			    <OPTION value='Role' <%=strParam.equals("Role")?"selected":""%>>권한 이름</OPTION>
	  		  </SELECT>
            </td>
			<td>
	  		  <input type="text" class="styled" name="inputText" size="45" value="<%=strText%>">
	  		</td>
			<td align="right"><div><button type="submit" style="margin-bottom:10px;" class="btn btn-primary" name="" value="Search" onClick="javascript:AnacondaSubmit(document.frm);">검색</button></div></td>
		  </tr>
		</table>
		
		<hr/>
<!----------------------------------------- 검색 조건및 등록 테이블 끝------------------------------------------>
<!----------------------------------------- 리스트 보여주는 테이블 시작----------------------------------------->
		<table class="table_hydra" cellspacing="0" cellpadding="3" border="1" style="border-color:gray">
			<colgroup>
				<col width="30%">
				<col width="50%">
				<col>
			</colgroup>
		<tbody>
				<%
			 	XtremeRoleManager res = XtremeRoleManager.getInstance();
			 	XtremeRoleCollection col = res.getRoleCollection("Default");
			 	if(col != null)
			 	{
				 	for(int i = 0;i < col.size(); i++)
				 	{
				 			XtremeRole role = (XtremeRole)col.get(i);
				 			
							if (!strText.equals("") && strText!= null && strParam.equals("Role")) {
								if(role.getRole_kor_name().indexOf(strText) < 0)
								{
									continue;
								}
							}

							if("".equals(role.getRole_name().trim())) continue;
				 %>
				 <tr>
				 	<td  height="20"  bgcolor="#FFFFFF" style="padding:3 5 2 7;"><%=role.getRole_kor_name()%></td>
				 	<td  height="20"  bgcolor="#FFFFFF" style="padding:3 5 2 7;"><%=role.getRole_name() %></td>
				 	<td  height="20"  bgcolor="#FFFFFF" style="padding:3 5 2 7;">
						<button type="button" class="btn btn-primary" value="선택" onClick="javascript:fn_FrmInput('<%=role.getRole_kor_name() %>','<%=role.getRole_name() %>')">선택</button>
					</td>
				 </tr>
				 
				 <%
			 		}
			 	}
			 	else
			 	{
			 		out.println("No Role");
			 	}
				%>
		</tbody>
</form>
</div>
