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
<p></p>
<form name="frm" method="POST" action="/Anaconda.do?CMD=CMD_SEQ_105690120951288243926312&title=권한조회">
<input type="hidden" name="Object" value="<%=strObject %>"></input>
<!----------------------------------------- 검색 조건및 등록 테이블 시작---------------------------------------->	
		<table>
		  <tr>
			<td align="right"><b>Condition</b>&nbsp;&nbsp;&nbsp;</td>
			<td>
			  <SELECT NAME='srh_param'>
			    <OPTION>Select</OPTION>
			    <OPTION value='Role' <%=strParam.equals("Role")?"selected":""%>>Role name</OPTION>
	  		  </SELECT>
                        </td><td>
	  		  <input type="text" class="styled" name="inputText" size="30" value="<%=strText%>">
                       </td><td>
	  		  <input type="submit" class="button white" name="" value="Search" onClick="javascript:AnacondaSubmit(document.frm);">			  
	  		</td>
		  </tr>
		</table>
<!----------------------------------------- 검색 조건및 등록 테이블 끝------------------------------------------>
<!----------------------------------------- 리스트 보여주는 테이블 시작----------------------------------------->
		<table>
		<thead>
		<tr>
		<th scope="col">Role name</th>
		<th scope="col">Role code</th>
		<th scope="col">Function</th>
		</tr>
		</thead>
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
				 %>
				 <tr>
				 	<td  height="20"  bgcolor="#FFFFFF" style="padding:3 5 2 7;"><%=role.getRole_kor_name()%></td>
				 	<td  height="20"  bgcolor="#FFFFFF" style="padding:3 5 2 7;"><%=role.getRole_name() %></td>
				 	<td  height="20"  bgcolor="#FFFFFF" style="padding:3 5 2 7;">&nbsp;&nbsp;<input type="button" class="button white" value="Select" onClick="javascript:fn_FrmInput('<%=role.getRole_kor_name() %>','<%=role.getRole_name() %>')"></td>
				 </td>
				 
				 <%
			 		}
			 	}
			 	else
			 	{
			 		out.println("No Role");
			 	}
				%>
		</tbody>
		</td>
		</tr>
		</table>
</form>
<p></p>
