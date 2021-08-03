<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>

<%
	String strText = request.getParameter("inputText") == null ? "" : request.getParameter("inputText").trim();
	//strText = (new String(strText.getBytes("8859_1"),"euc-kr"));
	String strParam = request.getParameter("srh_param") == null ? "" : request.getParameter("srh_param").trim();
	String strAnacondaRole = request.getParameter("anaconda_role") == null ? "" : request.getParameter("anaconda_role");
%>

<script language="javascript">
<!--
function fnRoleView(strCollectionName,strViewName)
{
	if(strViewName == null || strViewName == '')
	{
		alert("No role inf.");
		return;
	}
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_108710360611288228206258&Col=" + strCollectionName + "&Role=" + strViewName;
}

function fnRoleCreate()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_108710360611288228206258";
}

function fnRoleDel(args,arg2)
{	
	var bAnswer = confirm("Can not recover.\nReally delete?");
	
	if (bAnswer == true) 
	{
		document.frm.action="/Anaconda.do?CMD=CMD_SEQ_109355673071288245749397&GUBUN=D&RoleCollection="+args+"&RoleName="+arg2;
		AnacondaSubmit(document.frm);		
	} else {
		alert("Cancelled");
		return;
	}
}
function fnSelectRole(selectBox)
{
	var object = _(selectBox);
	if(object == null)
	{
	  alert("No exist.");
	  return;
    }
	for(var i = 0; i < object.options.length; i++)
	{
		if(object.options[i].selected == true)
		{
			var rolename = object.options[i].value;
			document.location.href = '/Anaconda.do?CMD=CMD_SEQ_106557688651298705108710&anaconda_role='+rolename;
		}
	}
}
function fnSaveRoleMapping()
{
	with(frm)
	{
		AnacondaSubmit(document.frm);
	}
}

function fnSelectAll(id)
{
	var object = _(id);
	if(object == null)
	{
	  alert("No exist.");
	  return;
    }

   var nodes = object.getElementsByTagName("input");
   for(var i = 0; i < nodes.length; i++)
   {
	   var item = nodes.item(i);
	   if(item.getAttribute("type") == "checkbox")
	   {
		 item.checked = true;
	   }
   }
}

function fnDeselectAll(id)
{
	var object = _(id);
	if(object == null)
	{
	  alert("No exist.");
	  return;
    }
   var nodes = object.getElementsByTagName("input");
   for(var i = 0; i < nodes.length; i++)
   {
	   var item = nodes.item(i);
	   if(item.getAttribute("type") == "checkbox")
	   {
		 item.checked = false;
	   }
   }


    
}
//-->
</script>

<form name="frm" method="post" action="/Anaconda.do?CMD=CMD_SEQ_109355673071288245749397">
<input type="hidden" name="selected_role" value='<%=strAnacondaRole %>'></input>
<input type="hidden" name="GUBUN" value='mapping'></input>
<input type="hidden" name="RoleCollection" value='Default'></input>

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Assign role</h3>

			</div>
		</div>
	</div>
</div>

		<ul>
				<li>
				Anaconda role	: <select id="anaconda_role" name="anaconda_role" class="styled" onChange="javascript:fnSelectRole('anaconda_role');">
				<option name='tmp' value='tmp'>Select</option>
		 <%
		 	XtremeRoleManager res = XtremeRoleManager.getInstance();
		 	XtremeRoleCollection col = res.getRoleCollection("Default");
		 	if(col != null)
		 	{
		 	for(int i = 0;i < col.size(); i++)
		 	{
		 			XtremeRole role = (XtremeRole)col.get(i);
		 			// if(!BusinessHelper.checkBusinessNull(strAnacondaRole) && i == 0) strAnacondaRole = role.getRole_name();
		 			String strSelected = "";
		 			if(role.getRole_name().equals(strAnacondaRole)) strSelected = "selected";
		 %>
		 	<option name="<%=role.getRole_name()%>" value="<%=role.getRole_name()%>" <%=strSelected%>>&nbsp;&nbsp;<%=role.getRole_kor_name()%></option>
		 <%
	 		}
		 	}
		 	else
		 	{
		 		out.println("No Role");
		 	}
		 %>
		 	</select>&nbsp;&nbsp;<button type="button" class="btn btn-primary" onClick="javascript:fnSaveRoleMapping();" value="Save">Save</button>
		 	</li>
		</ul>

<!----------------------------------------- 리스트 보여주는 테이블 끝----------------------------------------->		
<p></p>

<table class="table_hydra" cellspacing="0" cellpadding="0">

		<colgroup>
		<col width="20%">
		<col>
		</colgroup>
		<thead >
		<tr>
		<th scope="col">Action group name</th>
		<th scope="col">Action name</th>
		</tr>
		</thead>
		<tbody >
		
		<%
			try
			{
				WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();
				Iterator it = xmlResource.getWebActionCollection();
				WebActionCollection webActionCollection = null;
				WebAction action = null;
 
				for (int ii = 0 ;it.hasNext() ; ii++)
				{
				  out.println("<tr>");
				  webActionCollection = (WebActionCollection)it.next();
				  out.println("<td valign='top'><div style='position:relative;padding: 1px 1px;'><img width='10px' height='10px' src='/jsp/anaconda/img/shortcut.png' border='0' align='absmiddle'>&nbsp;<a href='javascript:fnNull();' onClick=\"javascript:fnShowOrHide('"+webActionCollection.getWEBACTION_NAME()+"');\">"+webActionCollection.getWEBACTION_KOR_NAME()+"</a></div>");
				  out.println("<div>(<a href=\"javascript:fnSelectAll('"+webActionCollection.getWEBACTION_NAME()+"');\">전체선택</a> , <a href=\"javascript:fnDeselectAll('"+webActionCollection.getWEBACTION_NAME()+"');\">전체해제</a>)</div><div>&nbsp;</div></td>");
				  Iterator iterator = webActionCollection.iterator();
				  int iSize = webActionCollection.size();
				  out.println("<td><div id = '"+webActionCollection.getWEBACTION_NAME()+"' style='display:none;position:relative;background-color:white;padding: 1px 1px;'>");
				  for(int i =0 ;iterator.hasNext();i++)
				  {
					action = (WebAction)iterator.next();
					String strChecked = "";
					if(BusinessHelper.checkBusinessNull(action.getISAUTH()))
					{
						if(strAnacondaRole != null && strAnacondaRole.equals(action.getISAUTH())) strChecked = "checked";
					}
			 		out.println("<div id='action_"+action.getNAME()+"' style='position:relative;padding: 1px 1px;'><input type='checkbox' name='check' value='"+action.getCOMMAND()+"' "+strChecked+">&nbsp;"+action.getKOR_NAME()+"</div>");
				  }
				  out.println("</div></td>");
				  out.println("</tr>");
				}
			} catch (Exception e) {
				ExceptionCenter.catchException(e);
			}
		%>
		</tbody>
		</table>
</form>
