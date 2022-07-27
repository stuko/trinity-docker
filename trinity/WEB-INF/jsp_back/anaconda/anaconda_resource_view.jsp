<%@ page contentType="text/xml; charset=UTF-8" %><%@page pageEncoding="UTF-8" %><%@ page import="java.util.*"%><%@ page import="com.stuko.anaconda.XmlConfig.*"%><%@ page import="com.stuko.anaconda.business.*"%><%@ page import="com.stuko.anaconda.value.*"%><%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%><%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="com.stuko.anaconda.SQLCommand.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<script language="javascript">
function fnCreateXmlData(arg1, arg2, arg3)
{
	if(confirm('Really create a XML meta data'))
	{
		with(frmRES)
		{
			res_key.value = arg1;
			res_name.value = arg2;
			res_jndi.value = arg3;
			code.value = "create_xml_data";
			callAjaxByForm("create_xml_data", "frmRES");
		}
	}
}

function fnCreateXmlService(arg1, arg2, arg3)
{
	if(confirm('Really create xml service?'))
	{
		with(frmRES)
		{
			res_key.value = arg1;
			res_name.value = arg2;
			res_jndi.value = arg3;
			code.value = "create_xml_service";
			callAjaxByForm("create_xml_service", "frmRES");
		}
	}
}
function fnCreateRESTService(arg1, arg2, arg3)
{
	if(confirm('Really create REST service?'))
	{
		with(frmRES)
		{
			res_key.value = arg1;
			res_name.value = arg2;
			res_jndi.value = arg3;
			code.value = "create_rest_service";
			callAjaxByForm("create_rest_service", "frmRES");
		}
	}
}
function fnCreateXmlTableConfig(obj1,obj2)
{
	var objfrm = _(obj1);
	with(objfrm)
	{
		var j = 0;
		code.value = "create_xml_table_config";
		list.value = '';
		j = 0;
		for(var i = 0; i < chk_LIST.length; i++)
		{
			if(chk_LIST[i].checked == true)
			{
				if(j == 0)
					list.value = list.value + chk_LIST[i].value;
				else
					list.value = list.value + "," + chk_LIST[i].value;
				j++;
			}
		}
		read.value = '';
		j = 0;
		for(var i = 0; i < chk_READ.length; i++)
		{
			if(chk_READ[i].checked == true)
			{
				if(j == 0)
					read.value = read.value + chk_READ[i].value;
				else
					read.value = read.value + "," + chk_READ[i].value;
				j++;
			}
		}
		insert.value = '';
		j = 0;
		for(var i = 0; i < chk_INSERT.length; i++)
		{
			if(chk_INSERT[i].checked == true)
			{
				if(j == 0)
					insert.value = insert.value + chk_INSERT[i].value;
				else
					insert.value = insert.value + "," + chk_INSERT[i].value;
				j++;
			}
		}
		update.value = '';
		j = 0;
		for(var i = 0; i < chk_UPDATE.length; i++)
		{
			if(chk_UPDATE[i].checked == true)
			{
				if(j == 0)
					update.value = update.value + chk_UPDATE[i].value;
				else
					update.value = update.value + "," + chk_UPDATE[i].value;
				j++;
			}
		}
		key.value = '';
		j = 0;
		for(var i = 0; i < chk_KEY.length; i++)
		{
			if(chk_KEY[i].checked == true)
			{
				if(j == 0)
					key.value = key.value + chk_KEY[i].value;
				else
					key.value = key.value + "," + chk_KEY[i].value;
				j++;
			}
		}
		callAjaxByForm("create_xml_table_config", obj2);
	}
}
function fnRemoveXmlTableConfig(arg1,arg2,arg3)
{
	if(confirm('Really delete?'))
	{
		with(frmRES)
		{
			res_key.value = arg1;
			res_name.value = arg2;
			res_jndi.value = arg3;
			code.value = "remove_xml_data";
			callAjaxByForm("remove_xml_data", "frmRES");
		}
	}
}
function doRuning(action)
{
}

function doRun(action,REQ)
{
	if(action == 'create_xml_data')
	{
		alert("Saved successfully.");
		document.location.reload();	
	}else if(action == 'remove_xml_data')
	{
		alert("Deleted successfully.");
		document.location.reload();	
	}else if(action == 'create_xml_table_config')
	{
		alert("Saved successfully.");
		document.location.reload();	
	}else if(action == 'create_xml_service')
	{
		alert("Saved successfully.");
		document.location.reload();	
	}else if(action == 'create_rest_service')
	{
		alert("Saved successfully.");
		document.location.reload();	
	}
}
</script>
<%
try
{
String strResourceKey = request.getParameter("res_key");
DefaultXmlResource res = DefaultXmlResource.getInstance();
DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_RES); 
DefaultXmlData dxd = col.getDefaultXmlData(strResourceKey);
String str_jndi = dxd.getData("res_value");
DataAccessCenter dac = new DataAccessCenter(str_jndi, new BusinessData());
String service_button = "";
BusinessCollection bc = dac.getTableInfo();

%>
<p><div class="post"><div class="title-right"><h2><font><b>데이터베이스 리소스 관리</b></font></h2></div></div></p>
<form name="frmRES" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_100615207491289267339048"></input>
<input id="res_key" type="hidden" name="res_key"></input>
<input id="res_name" type="hidden" name="res_name"></input>
<input id="res_jndi" type="hidden" name="res_jndi"></input>
<input type="hidden" name="code"></input>
</form>
<table class="table_hydra" cellspacing="0" cellpadding="0">
<colgroup>
<col width="10%"></col>
<col width="25%"></col>
<col width="20%"></col>
<col width="10%"></col>
<col width="35%"></col>
</colgroup>
<thead>
<th>번호</th>
<th>테이블</th>
<th>XML 매핑</th>
<th>유형</th>
<th>기능</th>
</thead>
<tbody>
<%
for(int i = 0; i < bc.size(); i++)
{
	BusinessData bd = bc.getBusinessData(i);
%>
<tr>
<td><%=i+1 %></td>
<td>
<%=bd.getBusinessName() %>
</td>
<%
DefaultXmlResource dxr = DefaultXmlResource.getInstance();
String strDxdName = "N/A";
DefaultXmlDataCollection dxdc = dxr.getDefaultXmlDataCollection(strResourceKey);
DefaultXmlData dxd2 =  null;
if(dxdc != null)
{
	dxd2 =  dxdc.getDefaultXmlData(bd.getBusinessName());
	if(dxd2 != null)
		strDxdName = dxd2.getNAME();
}
%>
<%
if(!"N/A".equals(strDxdName))
{
	service_button = "";
%>
<td>
&nbsp;<a href="javascript:fnNull();" onClick="javascript:fnShowOrHide('div_table_<%=strDxdName %>');"><%=strDxdName %></a>
<div id="div_table_<%=strDxdName %>" style="display:none;position:absolute;background-color:white;border: 2px double #BF95FF;padding: 5px 5px;width:500px;overflow-x:scroll;overflow-y:scroll;">
<p>
<% if(!BusinessHelper.checkNull(dxd2.getData("Business.Service.Name"))){ %>
<button type="button" class="btn btn-primary" value="Create CRUD function" onClick="javascript:fnCreateXmlTableConfig('id_<%=strDxdName%>','frm_<%=strDxdName%>');">CRUD 기능 생성</button>
<% }%>
<button type="button" class="btn btn-danger" value="Delete xml meta data" onClick="javascript:fnRemoveXmlTableConfig('<%=strResourceKey%>','<%=strDxdName%>','<%=str_jndi%>');">XML 메타 삭제</button>
<button type="button" class="btn btn-secondary" value=" Close" onClick="javascript:fnShowOrHide('div_table_<%=strDxdName %>');">닫기</button>
</p>
<form name="frm_<%=strDxdName%>" id="id_<%=strDxdName %>" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_100615207491289267339048"></input>
<input name="res_key" type="hidden" value="<%=strResourceKey%>"></input>
<input name="res_name" type="hidden" value="<%=strDxdName%>"></input>
<input name="res_jndi" type="hidden" value="<%=str_jndi%>"></input>
<input type="hidden" name="list"></input>
<input type="hidden" name="read"></input>
<input type="hidden" name="update"></input>
<input type="hidden" name="insert"></input>
<input type="hidden" name="key"></input>
<input type="hidden" name="code"></input>

<table cellspacing="0" cellpadding="0" class="newspaper-a">
<colgroup>
<col width="40%"></col>
<col width="40%"></col>
<col width="5%"></col>
<col width="5%"></col>
<col width="5%"></col>
<col width="5%"></col>
<col width="5%"></col>
</colgroup>
<thead>
<th style="color:blue">Column</th>
<th style="color:blue">Type</th>
<th style="color:blue">LIST</th>
<th style="color:blue">READ</th>
<th style="color:blue">INSERT</th>
<th style="color:blue">UPDATE</th>
<th style="color:blue">KEY</th>
</thead>
<tbody>
<%
	BusinessData fields = dxd2.getBusinessData();
	for(int j = 0; j < fields.size(); j++)
	{
		BusinessItem item = (BusinessItem)fields.get(j);
%>
<tr>
<td><%=item.FIELD_NAME %></td>
<td><%=item.FIELD_TYPE %></td>
<td><input type="checkbox" name="chk_LIST" value="<%=item.FIELD_NAME%>" <%=dxd2.getData("list") !=  null && dxd2.getData("list").indexOf(item.FIELD_NAME) >= 0 ? "checked" : "" %> /></td>
<td><input type="checkbox" name="chk_READ" value="<%=item.FIELD_NAME%>" <%=dxd2.getData("read") !=  null && dxd2.getData("read").indexOf(item.FIELD_NAME) >= 0 ? "checked" : "" %> /></td>
<td><input type="checkbox" name="chk_INSERT" value="<%=item.FIELD_NAME%>" <%=dxd2.getData("insert") !=  null && dxd2.getData("insert").indexOf(item.FIELD_NAME) >= 0 ? "checked" : "" %> /></td>
<td><input type="checkbox" name="chk_UPDATE" value="<%=item.FIELD_NAME%>" <%=dxd2.getData("update") !=  null && dxd2.getData("update").indexOf(item.FIELD_NAME) >= 0 ? "checked" : "" %> /></td>
<td><input type="checkbox" name="chk_KEY" value="<%=item.FIELD_NAME%>" <%=dxd2.getData("key") !=  null && dxd2.getData("key").indexOf(item.FIELD_NAME) >= 0 ? "checked" : "" %> /></td>
</tr>
<%
	}
%>
</tbody>
</table>
</form>
</div>
</td>
<%
}else{
	service_button = "disabled";
%>
<td><%=strDxdName %></td>
<%
}
%>
<td><%=bd.getTYPE() %></td>
</td>
<td>
<% if("N/A".equals(strDxdName)) {%>
<button type="button" class="btn btn-primary" value="Create XML meta data" onClick="javascript:fnCreateXmlData('<%=strResourceKey %>','<%=bd.getBusinessName() %>','<%=str_jndi %>');">XML 메타 생성하기</button>
<% } else { %>
<% if(!BusinessHelper.checkNull(dxd2.getData("Business.Service.Name"))){ %>
<button type="button" class="btn btn-danger" value="Create XML service" onClick="javascript:fnCreateXmlService('<%=strResourceKey %>','<%=bd.getBusinessName() %>','<%=str_jndi %>');" <%=service_button%>>XML 서비스 생성</button>
<% } %>
<button type="button" class="btn btn-secondary" value="Create REST service" onClick="javascript:fnCreateRESTService('<%=strResourceKey %>','<%=bd.getBusinessName() %>','<%=str_jndi %>');" <%=service_button%>>REST 서비스 생성</button>
<% } %>
</td>
</tr>
<%
}
%>
</tbody>
</table>
<%
}catch(Exception e)
{
	out.println(e.getMessage());
}
%>
<p></p>
