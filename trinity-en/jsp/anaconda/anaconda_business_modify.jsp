<!--
BUSINESS, BUSINESS_NAME, SQL 의 항목은 TYPE에 따라서 추후에 바뀌어야 한다
EJB = SERVICE_NAME, SOAP = SERVICE, SQL = SQL
-->
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>

<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.mediator.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.util.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.business.BusinessData"%>
<%@ page import="com.stuko.anaconda.business.BusinessCollection"%>
<%@ page import="com.stuko.anaconda.business.BusinessHelper"%>

<%
//request.setCharacterEncoding("EUC-KR");
	try
	{

	String strColbizname		= request.getParameter("colbizname");
	String strBizName			= request.getParameter("BizName");
	String strAopInter			= "";
	String strAopPointCls		= "";
	String strAopPointMethod	= "";
	String strDataSource		= "";
	String strEjbMethod			= "";
	String strFactory			= "";
	String strJndiName			= "";
	String strJnpInter			= "";
	String strPojoCls			= "";
	String strService			= "";
	String strServiceName		= "";
	String strSQL				= "";
	String strType				= "";
	String strUrl				= "";
	String strejbhome_interface = "";
	String strejbcreate_method  = "";
	String strSubSQL            = "";
	
	String strRemote            = "";
	String strIP                = "";
	String strPort              = "";
	
	BizLogicXmlResource xmlResource = BizLogicXmlResource.getInstance();
	BusinessData bizdata = null;
	BusinessCollection businessCollection = null;
	String strSessionValue = "";
	try
	{
		bizdata = xmlResource.searchBusinessDataEqualsServiceName(strColbizname,strBizName);

		strAopInter			=	bizdata.getAOP_INTERCEPTER();
		strAopPointCls		=	BusinessHelper.convert(bizdata.getAOP_POINT_CLASS());
		strAopPointMethod	=	BusinessHelper.convert(bizdata.getAOP_POINT_METHOD());
		strDataSource		=	bizdata.getDATA_DATASOURCE();
		strEjbMethod		=	bizdata.getEJBCreateMethod();
		strFactory			=	bizdata.getFACTORY();
		strJndiName			=	bizdata.getJNDINAME();
		strJnpInter			=	bizdata.getJNPINTERFACE();
		strPojoCls			=	bizdata.getPOJO_CLASS();
		strService			=	bizdata.getSERVICE();
		strServiceName		=	bizdata.getSERVICE_NAME();
		strejbhome_interface=   bizdata.getEJBHOME_INTERFACE();
		strejbcreate_method =   bizdata.getEJBCreateMethod();
		strServiceName      =   BusinessHelper.convert(strServiceName);

		strSQL				=	BusinessHelper.convert(bizdata.getSQL());
		strSubSQL			=	BusinessHelper.convert(bizdata.getSubSQL()); 
		strType				=	bizdata.getTYPE();
		strUrl				=	bizdata.getURL();
		
		strRemote           =   bizdata.getREMOTE();
		strIP               =   bizdata.getIP();
		strPort             =   bizdata.getPORT();
		
		strSessionValue = bizdata.getOWNER();
		if(!BusinessHelper.checkBusinessNull(strSessionValue))
		{
			RequestHelper helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
			DefaultAuth auth = (DefaultAuth)helper.getSessionObject();
			if(auth != null)
			{
				strSessionValue = auth.getAuthItem(("MEMBER_NAME"));	
			}
		}
		
		
	} catch (Exception e) {
		ExceptionCenter.catchException(e);
	}
%>

<script language="javascript">
function unitTest()
{
	if(confirm('Do you execute unit test of process?'))
	{
		window.open("/Anaconda.do?CMD=CMD_SEQ_103196839281268503996921&strBCName=<%=strColbizname%>&strBPName=<%=strBizName%>");
	}
}
function createInterceptor()
{
	with(frm)
	{
		if(aop_point_method.value == null && aop_point_class.value == null)
		{
			alert("If you want to write interceptor, you should enter the before and after code.");
			return;
		}
		
	}
	var bAnswer = confirm("Do you create interceptor class?");
	if (bAnswer == true) 
	{
			window.open("/Anaconda.do?CMD=CMD_SEQ_104696876221288444364148&BizCol=<%=strColbizname%>&BizProc=<%=strBizName%>","","height=400,width=700,left=200,top=20,status=no, location=no, toolbar=no, scrollbars=yes");
	} else {
		alert("Cancelled");
		return;
	}
}

function doRun(callerName, REQ)
{
	if(callerName == 'CMD_SEQ_104696876221288444364148')
	{
		alert('Class was created successfully.');
	}
}

function doRunning(callerName)
{
	if(callerName == 'CMD_SEQ_104696876221288444364148')
	{
		//alert('정상적으로 삭제 되었습니다.');
	}
}
function copyProcess()
{
	var bAnswer = confirm("Do you want to copy process?");

	if (bAnswer == true)
	{
		with(frm)
		{
			code.value="copy";
			AnacondaSubmit(document.frm);		
		}
	}
}
var fNum = 1;
function AddFamily(str)
{
	for( var i=0; i < str; i++ )
	{
	    //웹브라우져에 따른 설정.
	    //익스플로어일때,
		if(document.getElementById)
		{
 			var Tbl = document.getElementById('AddChild');
		} else {
 			var Tbl = document.all['AddChild'];
		}

	    //첫번째row
	    var tRow1 = createElement("TR","","");
		Tbl.appendChild(tRow1);
		//var tRow1 = Tbl.insertRow();
		var skey = _rand();
	    tRow1.setAttribute("id","AddChild_Tr_New_" + skey);
		var tCell1 = createElement("TD","","");
		var tCell2 = createElement("TD","","");
		var tCell3 = createElement("TD","","");
		var tCell4 = createElement("TD","","");
		tRow1.appendChild(tCell1);
		tRow1.appendChild(tCell2);
		tRow1.appendChild(tCell3);
		tRow1.appendChild(tCell4);

	    tCell1.bgColor = "#F6FCFF";
	    tCell1.align = "center";
	    tCell1.innerHTML =
	     "    <input name='field_name' type='text' class='styled'  size='25'>";

	    tCell2.bgColor = "#F6FCFF";
	    tCell2.align = "center";
	    tCell2.innerHTML =
	     " <SELECT NAME='field_type'><OPTION value='KEY'>KEY</OPTION><OPTION value='CURRENT_DATE'>Current time stamp</OPTION><OPTION value='STRING'>STRING</OPTION><OPTION value='INT'>INT</OPTION><OPTION value='int[]'>INT[]</OPTION><OPTION value='LONG'>LONG</OPTION><OPTION value='DOUBLE'>DOUBLE</OPTION><OPTION value='BOOLEAN'>BOOLEAN</OPTION><OPTION value='REFERENCE'>Refer other variable</OPTION><OPTION value='REFER_HASH'>make other variable to be hashed</OPTION><OPTION value='REFER_ENCRYPT'>encrypt other variable</OPTION><OPTION value='REFER_DECRYPT'>decrypt other variable</OPTION><OPTION value='REFER_PW_ENCRYPT'>encrypt other variable by DES</OPTION><OPTION value='REFER_PW_DECRYPT'>decrypt other variable by DES</OPTION><OPTION value='String[]'>STRING[]</OPTION><OPTION value='BUSINESSDATA'>process parameter</OPTION>"
	     + "<OPTION value='ORACLE_SP_CURSOR_RETURN'>Oracle Stored procedure cursor result</OPTION>"
	     + "<OPTION value='ORACLE_SP_VARCHAR_RETURN'>Oracle Stored procedure character result</OPTION>"
	     + "<OPTION value='ORACLE_SP_INT_RETURN'>Oracle Stored procedure integer result</OPTION>"
	     + "<OPTION value='ORACLE_SP_LONG_RETURN'>Oracle Stored procedure long result</OPTION>"
	     + "<OPTION value='ReferenceObject'>object</OPTION>"
		 + "</SELECT>";

	    tCell3.bgColor = "#F6FCFF";
	    tCell3.align = "center";
	    tCell3.innerHTML =
	     "    <input name='field_value' type='text' class='styled'  size='25'>";

	    tCell4.bgColor = "#F6FCFF";
	    tCell4.align = "center";
	    tCell4.innerHTML =  "<button name='delete' type='button' class='btn btn-danger' onClick='javascript:delRow(\"AddChild_Tr_New_" + skey + "\")' value='Delete'>Delete</button>";

	    //두번째row
	    //var tRow2 = Tbl.insertRow();
	    //var tCell5 = tRow2.insertCell();

	    //tCell5.colSpan = "4";
	    //tCell5.className = "dot";
	    //tCell5.height = "1";

	    fNum++;
	}//end for
}

function fn_FindBiz_BC()
{
	fn_BizCollection(frm.jndiname.value);
}
function fn_BizCollection(args)
{
	window.open("/Anaconda.do?CMD=CMD_SEQ_105987900951290598606770&title=Search&Object=opener.frm.jndiname&srh_param=BC&inputText=" + args,"","height=400,width=800,left=200,top=20,status=no, location=no, toolbar=no, scrollbars=yes");
}

function fn_FindBiz_BP()
{
	fn_BizProcess(frm.jndiname.value);
}

function fn_BizProcess(args)
{
	window.open("/Anaconda.do?CMD=CMD_SEQ_100900150121290598597624&title=Search&Object=opener.frm&srh_param=BC&inputText=" + args,"","height=400,width=850,left=200,top=20,status=no, location=no, toolbar=no, scrollbars=yes");
}
function submitForm()
{
	if(!confirm("If you did not change owner, the owner will be current user.")) return;
	var bAnswer = confirm("Really Modify?");

	if (bAnswer == true)
	{
		AnacondaSubmit(document.frm);
		return true;
	} 
	else 
	{
		alert("Cancelled");
		return false;
	}
}
function defaultSQL()
{
	with(frm)
	{
		// factory.value='';
		// jnpinterface.value='';
		// jndiname.value='';
		data_datasource.value='java:comp/env/jdbc/bestmember';
		// biz_url.value='';
		service_name.value='';
	}
}

function fn_select_jndi(select_object_index)
{
	with(frm)
	{
		if(data_datasource != null) data_datasource.value=select_jndi[select_object_index].value;
	}
}

function selectType(num)
{
	var DIV_SQL = '<Table class="table_hydra" cellspacing="1" cellpadding="1" id="TBL_SQL"> ' +
	'	<colgroup>' +
	'	<col width="30%">' +
	'	<col>' +
	'	</colgroup>' +
	'<thead>' +
	'<tr>' +
	'<th scope="col">Name</th>' +
	'<th scope="col">Value</th>' +
	'</tr>' +
	'</thead>' +
	'	<tbody>' +
	'  		<tr>' +
	'    	  <td class="left" width="200">Default</td>' +
	'    	  <td>&nbsp;<button type="button" class="btn btn-info" name="btnDefault" value="Default" onClick="javascript:defaultSQL();">Default</button></td>	' +
	'  		</tr>' +
	'  		<tr>' +
	'    	  <td class="left" width="200">DataSource(Not Use Context)<p>"<b>session.jndi</b>" id reserved word. "<b>session.jndi</b>" is for account datasource of  SaaS</p></td>' +
	'    	  <td>&nbsp;<input type="text" class="styled" name="data_datasource" size="45" value="<%=strDataSource%>">&nbsp;&nbsp;<a href="javascript:fnNull();" onClick="javascript:fnSearch(frm.data_datasource);" style="color:blue;"><img src="/jsp/anaconda/img/search_result.png" width="10px" height="10px" border="0" align="absmiddle"></img>Search</a></td>	' +
	'  		</tr>' +
	'		<tr>' +
	'    	  <td class="left" width="200">SQL</td>' +
	'    	  <td>&nbsp;<textarea class="styled" name="service_name" style="width:600px;height:400px;" nowrap></textarea></td>	' +
	'  		</tr>' +
	'	</tbody>' +
	'</Table>	';

	var DIV_SUB_SQL = '<Table class="table_hydra" cellspacing="1" cellpadding="1" id="TBL_SUB_SQL"> ' +
	'	<colgroup>' +
	'	<col width="30%">' +
	'	<col>' +
	'	</colgroup>' +
	'<thead>' +
	'<tr>' +
	'<th scope="col">Name</th>' +
	'<th scope="col">Value</th>' +
	'</tr>' +
	'</thead>' +
	'	<tbody>' +
	'  		<tr>' +
	'    	  <td class="left" width="200">Default</td>' +
	'    	  <td>&nbsp;<button type="button" class="btn btn-info" name="btnDefault" value="Default" onClick="javascript:defaultSQL();">Default</button></td>	' +
	'  		</tr>' +
	'  		<tr>' +
	'    	  <td class="left" width="200">DataSource(Not Use Context)</td>' +
	'    	  <td>&nbsp;<input type="text" class="styled" name="data_datasource" size="45" value="<%=strDataSource%>">&nbsp;&nbsp;<a href="javascript:fnNull();" onClick="javascript:fnSearch(frm.data_datasource);" style="color:blue;"><img src="/jsp/anaconda/img/search_result.png" width="10px" height="10px" border="0" align="absmiddle"></img>Search</a></td>	' +
	'  		</tr>' +
	'		<tr>' +
	'    	  <td class="left" width="200">Parent SQL</td>' +
	'    	  <td>&nbsp;<textarea class="styled" name="service_name" style="width:470px;height:100px;" nowrap></textarea></td>	' +
	'  		</tr>' +
	'		<tr>' +
	'    	  <td class="left" width="200">Child SQL</td>' +
	'    	  <td>&nbsp;<textarea class="styled" name="sub_service_name" style="width:600px;height:400px;" nowrap></textarea></td>	' +
	'  		</tr>' +	
	'	</tbody>' +
	'</Table>	';
	
	var DIV_MULTI = '<Table class="table_hydra" cellspacing="1" cellpadding="1" id="MULTI_SQL"> ' +
	'	<colgroup>' +
	'	<col width="30%">' +
	'	<col>' +
	'	</colgroup>' +
	'<thead>' +
	'<tr>' +
	'<th scope="col">Name</th>' +
	'<th scope="col">Value</th>' +
	'</tr>' +
	'</thead>' +
	'	<tbody>' +
	'  		<tr>' +
	'    	  <td class="left" width="200">Default</td>' +
	'    	  <td>&nbsp;<button type="button" class="btn btn-info" name="btnDefault" value="Default" onClick="javascript:defaultSQL();">Default</button></td>	' +
	'  		</tr>' +
	'  		<tr>' +
	'    	  <td class="left" width="200">DataSource(Not Use Context)</td>' +
	'    	  <td>&nbsp;<input type="text" class="styled" name="data_datasource" size="45" value="<%=strDataSource%>">&nbsp;&nbsp;<a href="javascript:fnNull();" onClick="javascript:fnSearch(frm.data_datasource);" style="color:blue;"><img src="/jsp/anaconda/img/search_result.png" width="10px" height="10px" border="0" align="absmiddle"></img>Search</a></td>	' +
	'  		</tr>' +
	'		<tr>' +
	'    	  <td class="left" width="200">SQL</td>' +
	'    	  <td>&nbsp;<textarea class="styled" name="service_name" style="width:470px;height:100px;" nowrap></textarea></td>	' +
	'  		</tr>' +
	'	</tbody>' +
	'</Table>	';

	var DIV_EJB = '<Table class="table_hydra" cellspacing="1" cellpadding="1" id="TBL_EJB"> ' +
	'	<colgroup>' +
	'	<col width="30%">' +
	'	<col>' +
	'	</colgroup>' +
	'<thead>' +
	'<tr>' +
	'<th scope="col">Name</th>' +
	'<th scope="col">Value</th>' +
	'</tr>' +
	'</thead>' +
	'	<tbody>' +
	'  		<tr> ' +
	'    	  <td class="left" width="200">EJB Factory class(EJB 2.0 ver)</td> ' +
	'    	  <td>&nbsp;<input type="text" class="styled" name="factory" size="45" value="<%=((strFactory == null || strFactory.equals("null")) ? "org.jnp.interfaces.NamingContextFactory" : strFactory)%>"></td>	 ' +
	'  		</tr> ' +
	'  		<tr> ' +
	'    	  <td class="left" width="200">EJB Interface(EJB 2.0 ver)</td> ' +
	'    	  <td>&nbsp;<input type="text" class="styled" name="jnpinterface" size="45" value="<%=((strJnpInter == null || strJnpInter.equals("null")) ? "org.jboss.naming:org.jnp.interfaces" : strJnpInter)%>"></td>	 ' +
	'  		</tr> ' +
	'  		<tr> ' +
	'    	  <td class="left" width="200">EJB JNDI Name(EJB 2.0 ver)</td> ' +
	'    	  <td>&nbsp;<input type="text" class="styled" name="jndiname" size="45" value="<%=strJndiName%>"></td>	 ' +
	'  		</tr> ' +
	'		<tr> ' +
	'    	  <td class="left" width="200">EJB Find URL(EJB 2.0 ver)</td> ' +
	'    	  <td>&nbsp;<input type="text" class="styled" name="biz_url" size="45" value="<%=((strUrl == null || strUrl.equals("null")) ? "jnp://IP:PORT" : strUrl)%>">&nbsp;&nbsp;<a href="javascript:fnNull();" onClick="javascript:fnSearch(frm.biz_url);" style="color:blue;"><img src="/jsp/anaconda/img/search_result.png" width="10px" height="10px" border="0" align="absmiddle"></img>찾기</a></td>	 ' +
	'  		</tr> ' +
	'		<tr> ' +
	'    	  <td class="left" width="200">EJB Home Interface(EJB 2.0 ver)</td> ' +
	'    	  <td>&nbsp;<input type="text" class="styled" name="ejbhome_interface" size="45" value="<%=((strejbhome_interface == null || strejbhome_interface.equals("null")) ? "" : strejbhome_interface)%>"></td>	 ' +
	'  		</tr> ' +
	'		<tr> ' +
	'    	  <td class="left" width="200">EJB Home create method(EJB 2.0 ver)</td> ' +
	'    	  <td>&nbsp;<input type="text" class="styled" name="ejbcreate_method" size="45" value="<%=((strejbcreate_method == null || strejbcreate_method.equals("null")) ? "create" : strejbcreate_method)%>"></td>	 ' +
	'  		</tr> ' +
	'		<tr> ' +
	'    	  <td class="left" width="200">EJB Interface Method(EJB 2.0 ver)</td> ' +
	'    	  <td>&nbsp;<textarea class="styled" name="service_name" style="width:470px;height:100px;"><%=strServiceName%></textarea></td>	 ' +
	'  		</tr> ' +
	'	</tbody>' +
	'</Table> ';

	var DIV_SOAP = '<Table class="table_hydra" cellspacing="1" cellpadding="1" id="TBL_SOAP"> ' +
	'	<colgroup>' +
	'	<col width="30%">' +
	'	<col>' +
	'	</colgroup>' +
	'<thead>' +
	'<tr>' +
	'<th scope="col">Name</th>' +
	'<th scope="col">Value</th>' +
	'</tr>' +
	'</thead>' +
	'	<tbody>' +
	'  		<tr> ' +
	'    	  <td class="left" width="200">SOAP Service Name</td> ' +
	'    	  <td>&nbsp;<input type="text" class="styled" name="jnpinterface" size="45" value="<%=strJnpInter%>"></td>	 ' +
	'  		</tr> ' +
	'  		<tr> ' +
	'    	  <td class="left" width="200">SOAP Namespace</td> ' +
	'    	  <td>&nbsp;<input type="text" class="styled" name="jndiname" size="45" value="<%=strJndiName%>"></td>	 ' +
	'  		</tr> ' +
	'		<tr> ' +
	'    	  <td class="left" width="200">SOAP URL</td> ' +
	'    	  <td>&nbsp;<input type="text" class="styled" name="biz_url" size="45" value="<%=strUrl%>">&nbsp;&nbsp;<a href="javascript:fnNull();" onClick="javascript:fnSearch(frm.biz_url);" style="color:blue;"><img src="/jsp/anaconda/img/search_result.png" width="10px" height="10px" border="0" align="absmiddle"></img>Search</a></td>	 ' +
	'  		</tr> ' +
	'		<tr> ' +
	'    	  <td class="left" width="200">SOAP Service method</td> ' +
	'    	  <td>&nbsp;<textarea class="styled" name="service_name" style="width:470px;height:100px;"><%=strServiceName%></textarea></td>	 ' +
	'  		</tr> ' +
	'	</tbody>' +
	'</Table> ';


	var DIV_POJO = '<Table class="table_hydra" cellspacing="1" cellpadding="1" id="TBL_POJO"> ' +
	'	<colgroup>' +
	'	<col width="30%">' +
	'	<col>' +
	'	</colgroup>' +
	'<thead>' +
	'<tr>' +
	'<th scope="col">Name</th>' +
	'<th scope="col">Value</th>' +
	'</tr>' +
	'</thead>' +
	'	<tbody>' +
	'  		<tr> ' +
	'    	  <td class="left" width="200">POJO Class Name</td> ' +
	'    	  <td>&nbsp;<input type="text" class="styled" name="pojo_class" size="45" value="<%=strPojoCls%>"></td>	 ' +
	'  		</tr> ' +
	'		<tr> ' +
	'    	  <td class="left" width="200">POJO Method Name</td> ' +
	'    	  <td>&nbsp;<textarea class="styled" name="service_name" style="width:470px;height:100px;"><%=strServiceName%></textarea></td>	 ' +
	'  		</tr> ' +
	'	</tbody>' +
	'</Table> ';

	var DIV_BC = '<Table class="table_hydra" cellspacing="1" cellpadding="1" id="TBL_BC"> ' +
	'	<colgroup>' +
	'	<col width="30%">' +
	'	<col>' +
	'	</colgroup>' +
	'<thead>' +
	'<tr>' +
	'<th scope="col">Name</th>' +
	'<th scope="col">Value</th>' +
	'</tr>' +
	'</thead>' +
	'	<tbody>' +
	'		<tr> ' +
	'    	  <td class="left" width="200">Business service name</td> ' +
	'    	  <td>&nbsp;<input type="text" class="styled" name="jndiname" size="60" value="<%=strJndiName%>" >&nbsp;&nbsp;<button type="button" class="btn btn-primary" value="Search business service" checked onClick="javascript:fn_FindBiz_BC();">Search business service</button></td>	 ' +
	'  		</tr> ' +
	'	</tbody>' +
	'</Table> ';

	var DIV_BP = '<Table class="table_hydra" cellspacing="1" cellpadding="1" id="TBL_BP"> ' +
	'	<colgroup>' +
	'	<col width="30%">' +
	'	<col>' +
	'	</colgroup>' +
	'<thead>' +
	'<tr>' +
	'<th scope="col">Name</th>' +
	'<th scope="col">Value</th>' +
	'</tr>' +
	'</thead>' +
	'	<tbody>' +
	'  		<tr> ' +
	'    	  <td class="left" width="200">Business process name</td> ' +
	'    	  <td>&nbsp;<input type="text" class="styled" name="jndiname" size="60" value="<%=strJndiName%>">&nbsp;&nbsp;<button type="button" class="btn btn-primary" value="Search business process" checked onClick="javascript:fn_FindBiz_BP();">Search business process</button></td>	 ' +
	'  		</tr> ' +
	'		<tr> ' +
	'    	  <td class="left" width="200">process name</td> ' +
	'    	  <td>&nbsp;<textarea class="styled" name="service_name" style="width:510px;height:100px;"><%=strServiceName%></textarea></td>	 ' +
	'  		</tr> ' +
	'	</tbody>' +
	'</Table> ';

    var div;

	if(num == 0 || num == 7)  // SQL
	{

		div = document.getElementById('DIV_PROCESS');
		if(div != null)
		{
			div.innerHTML = DIV_SQL;
			var strData = SQLTEXT.innerHTML;
			frm.service_name.value = strData.replace(/&#47;/g,"/").replace(/&gt;/g,">").replace(/&lt;/g,"<").replace(/&quot;/g,"\"").replace(/<BR>/g,"\r\n").replace(/&#39;/g,"\'").replace(/&amp;/g,"&");
			//frm.service_name.value = SQLTEXT.innerHTML;

		}
	}
	else if(num == 1)  // MULTI_SQL
	{
		div = document.getElementById('DIV_PROCESS');
		// if(div != null) div.innerHTML = DIV_MULTI;
		if(div != null)
		{
			div.innerHTML = DIV_MULTI;
			//frm.service_name.innerHTML = SQLTEXT.innerHTML;
			var strData = SQLTEXT.innerHTML;
			frm.service_name.value = strData.replace(/&#47;/g,"/").replace(/&gt;/g,">").replace(/&lt;/g,"<").replace(/&quot;/g,"\"").replace(/<BR>/g,"\r\n").replace(/&#39;/g,"\'").replace(/&amp;/g,"&");
		}

	}
	else if(num == 2)  // EJB
	{
		div = document.getElementById('DIV_PROCESS');
		if(div != null) div.innerHTML = DIV_EJB;
	}
	else if(num == 3)  // POJO
	{
		div = document.getElementById('DIV_PROCESS');
		if(div != null) div.innerHTML = DIV_POJO;
	}
	else if(num == 4)  // SOAP
	{
		div = document.getElementById('DIV_PROCESS');
		if(div != null) div.innerHTML = DIV_SOAP;
	}
	else if(num == 5)  // LINK_BC
	{
		div = document.getElementById('DIV_PROCESS');
		if(div != null) div.innerHTML = DIV_BC;
	}
	else if(num == 6)  // LINK_BP
	{
		div = document.getElementById('DIV_PROCESS');
		if(div != null) div.innerHTML = DIV_BP;
	}
	else if(num == 8)  // SUB_SQL
	{
		div = document.getElementById('DIV_PROCESS');
		if(div != null)
		{
			div.innerHTML = DIV_SUB_SQL;
			var strData = SQLTEXT.innerHTML;
			var strSubData = SUBSQLTEXT.innerHTML;
			frm.service_name.value = strData.replace(/&#47;/g,"/").replace(/&gt;/g,">").replace(/&lt;/g,"<").replace(/&quot;/g,"\"").replace(/<BR>/g,"\r\n").replace(/&#39;/g,"\'").replace(/&amp;/g,"&");
			frm.sub_service_name.value = strSubData.replace(/&#47;/g,"/").replace(/&gt;/g,">").replace(/&lt;/g,"<").replace(/&quot;/g,"\"").replace(/<BR>/g,"\r\n").replace(/&#39;/g,"\'").replace(/&amp;/g,"&");
			//frm.service_name.value = SQLTEXT.innerHTML;

		}
	}

}

function fnSearch(search_key)
{
	var pos = getCurrentPosition();
	document.frmSearch.x.value = pos.x;
	document.frmSearch.y.value = pos.y;
	document.frmSearch.key.value = search_key.name;
	document.frmSearch.search.value = search_key.value;
	document.frmSearch.CMD.value = "CMD_SEQ_100615207491289267339048";
	document.frmSearch.code.value = "search";
	callAjaxByForm("search", "frmSearch");
}


function doRuning(callerName)
{
	showRunning(callerName);
}

function doRun(callerName, REQ)
{
	
	if(callerName == 'search')
	{
		var object = parseAnacondaAJAX(REQ.responseXML);
		if(object == null)
		{
			alert("ERROR");
			return;
		}
		var objUL = _("ul_search_layout");
		removeAllChildNodesById("ul_search_layout");
		var title = createElement("li","","");
		title.innerHTML = "<a href='javascript:fnShowOrHide(" + "\"" + "div_search_layout" + "\");'><img src='/jsp/anaconda/img/close.png' width='10px' height='10px' border='0' align='absmiddle' />close</a>";
		objUL.appendChild(title);
		for(var i = 0; i < object.response.length; i++)
		{
			var res = object.response[i];
			var li = createElement("li","","");
			var a = createElement("a","","");
			a.setAttribute("href","javascript:fnSetData('"+res.res_value+"','"+object.request.key+"');");
			a.innerHTML = res.res_name + '&nbsp;&nbsp;&nbsp;(' + res.res_value + ')';
			li.appendChild(a);
			objUL.appendChild(li);
		}
		var posX = parseInt(object.request.x);
		var posY = parseInt(object.request.y);
		var div_obj = _("div_search_layout");
		div_obj.style.display = 'block';
		div_obj.style.position = "absolute";
		div_obj.style.left = (posX+10) + 'px';
		div_obj.style.top = (posY+10) + 'px';
		//fnLocateDivInClickEventNoScroll("div_search_layout",posX,posY );
	}
	
}

function fnSetData(data,key)
{
	//alert(key);
	with(frm)
	{
		var obj = eval("frm."+key);
		obj.value = data;
	}
	fnShowOrHide("div_search_layout");
}


</script>
<form name="frmSearch" method="post" action="/Anaconda.do">
<input type="hidden" name="search"></input>
<input type="hidden" name="key"></input>
<input type="hidden" name="x"></input>
<input type="hidden" name="y"></input>
<input type="hidden" name="CMD"></input>
<input type="hidden" name="code" value="">
</form>

<div id="div_search_layout" class="styled" style="display:none;position:absolute;background-color:#FFFFFF;width:400px;overflow-x:scroll;height:100px;overflow-y:scroll;">
	<ul id="ul_search_layout">
	</ul>
</div>

<form name="frm" method="post" action="/Anaconda.do?CMD=CMD_SEQ_102444127711287886131786">
<input type="hidden" name="code" value="mod">
<input type="hidden" name="colbizname" value="<%=strColbizname%>">
<input type="hidden" name="business_name" value="<%=strBizName%>">
<%
		businessCollection = xmlResource.getBusinessCollection(strColbizname);
		long cache_time =  businessCollection.getCACHE_TIME();
		out.println("<input type=\"hidden\" name=\"cacheText\" value='"+cache_time+"'>");
%>
<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Process Info</h3>
					<span class="fr"><button type="button" class="btn btn-info" name="Register" value="Copy" onClick="javascript:copyProcess();">Copy</button></span>
					<span class="fr"><button type="button" class="btn btn-primary" name="Register" value="Save" onClick="javascript:submitForm();">Save</button></span>
					<span class="fr"><button type="button" class="btn btn-secondary" name="Register" value="Back" onClick="javascript:history.back();">Back</button></span>
			</div>
		</div>
	</div>
</div>

		<table class="table_hydra" cellspacing="1" cellpadding="1">
		<colgroup>
		<col width="30%">
		<col>
		</colgroup>
		<thead>
		<tr>
		<th scope="col">Name</th>
		<th scope="col">Value</th>
		</tr>
		</thead>
		<tbody>
	  	<tr>
		  <td>process name</td>
		  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=strBizName%></td>
  		</tr>
  		<tr>
		  <td class="list_top" width="200">owner</td>
		  <td>&nbsp;&nbsp;<input type="text" class="styled" name="owner" size="20" value="<%=strSessionValue%>"></td>
  		</tr> 	
  		<tr>
		  <td>Type</td>
		  <td>&nbsp;
	  		<SELECT class="styled" NAME='biz_type' onChange="javascript:selectType(this.selectedIndex);">
			  <OPTION value='SQL' <%=strType.equals("SQL")?"selected":""%>>SQL</OPTION>
			  <OPTION value='MULTI-SQL' <%=strType.equals("MULTI-SQL")?"selected":""%>>MULTI-SQL</OPTION>
			  <OPTION value='EJB' <%=strType.equals("EJB")?"selected":""%>>EJB</OPTION>
			  <OPTION value='POJO' <%=strType.equals("POJO")?"selected":""%>>POJO</OPTION>
			  <OPTION value='SOAP' <%=strType.equals("SOAP")?"selected":""%>>SOAP</OPTION>
			  <OPTION value='BC' <%=strType.equals("BC")?"selected":""%>>business service</OPTION>
			  <OPTION value='BP' <%=strType.equals("BP")?"selected":""%>>business process</OPTION>
			  <OPTION value='ORACLE_SP' <%=strType.equals("ORACLE_SP")?"selected":""%>>Oracle SP</OPTION>
			   <OPTION value='SQL_TREE' <%=strType.equals("SQL_TREE")?"selected":""%>>TREE SQL</OPTION>
	  		</SELECT>
		  </td>
  		</tr>
  		</tbody>
		</table>

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Remote call</h3>
			</div>
		</div>
	</div>
</div>
<table class="table_hydra" cellspacing="1" cellpadding="1">
		<tr>
		  <td class="list_top" width="200">Remote call or Local call</td>
		  <td>&nbsp;&nbsp;
	  		<SELECT class="styled" NAME='REMOTE'>
			  <OPTION value='true' <%= "true".equals(strRemote) ? "selected":""%>>Remote call</OPTION>
			  <OPTION value='false' <%= !"true".equals(strRemote) ?"selected":""%>>Local call</OPTION>
	  		</SELECT>
		  </td>
  		</tr> 	
  		<tr>
		  <td class="list_top" width="200">IP</td>
		  <td>&nbsp;&nbsp;<input type="text" class="styled" name="IP" size="20" value="<%=strIP%>"></td>
  		</tr> 	
  		<tr>
		  <td class="list_top" width="200">Port</td>
		  <td>&nbsp;&nbsp;<input type="text" class="styled" name="PORT" size="20" value="<%=strPort%>"></td>
  		</tr> 	
 </table>

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Process detail info</h3>
			<span class="fr">
			<select name="select_jndi" id="select_jndi"  class="styled"  onChange="javascript:fn_select_jndi(this.selectedIndex);">
			<%
				Object[] jndis = ServiceLocator.getInstance().getJndis("java:comp/env");
				for(int idx_jndis = 0; idx_jndis < jndis.length; idx_jndis++)
			   {
			%>
			   <option name="<%=jndis[idx_jndis]+""%>" value="<%=jndis[idx_jndis]+""%>"><%=jndis[idx_jndis]+""%></option>
			<%
			   }
			%>
			</select>
			</span>
			</div>
		</div>
	</div>
</div>

<DIV id="DIV_PROCESS"></DIV>

	
		
		
<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Interceptor</h3>
			<span class="fr"><button type="button" class="btn btn-primary" name="Register" value="+ Create Interceptor" onClick="javascript:createInterceptor();">+ Create Interceptor</button></span>
			</div>
		</div>
	</div>
</div>

		<ul>
			<li>Reserved : request=parameter , result=return</li>
			<li>Process skip : This.doProcessSkip(true or false);</li>
			<li>Process exit : This.doProcessExit(true or false);</li>
			<li>Process interrupt : result.setSkipCount(-1);</li>
			<li>Global: ((BusinessData)request.getAllBusinessData()).getFieldValue )</li>
			<li>Import: import com.stuko.anaconda.business.*;</li>
			<li>ex) request.getFieldValue("name") , result.getReturnObject("name")</li>
		</ul>
		<table class="table_hydra" cellspacing="1" cellpadding="1">
		<colgroup>
		<col width="30%">
		<col>
		</colgroup>
		<thead>
		<tr>
		<th scope="col">Name</th>
		<th scope="col">Value</th>
		</tr>
		</thead>
		<tbody>
		<tr>
	  	<tr>
		  <td>Interceptor class name</td>
		  <td>&nbsp;<input type="text" class="styled" name="aop_intercepter" size="50" value="<%=strAopInter%>">
		  &nbsp;<SELECT NAME='intercepter_type' onChange="javascript:selectIntercepterType(this.selectedIndex);">
			    <OPTION value='' selected>Enter the class name</OPTION>
			    <OPTION value='com.stuko.anaconda.intercepter.ConditionalBusinessIntercepter'>Conditional</OPTION>
			    <OPTION value='com.stuko.anaconda.intercepter.SimpleBusinessIntercepter'>Simple</OPTION>
	  		   </SELECT>
		  </td>
  		</tr>
  		<tr>
		  <td>Before</td>
		  <td>
               <div style="padding-left:3px;margin-top:3px;">
               <textarea class="styled code" name="aop_point_method" id="aop_point_method" style="width:600px;height:300px;" wordWrap="true"></textarea>
               </div>
            
                <div style="padding-left:3px;margin-top:3px;">   
               <select name="ref_before" id="ref_before" class="styled">
                   <option value=''>Please select below code</option>
                   <option value='"create".equals(request.getFieldValue("code"))'>Register process</option>
                   <option value='if(!"list".equals(request.getFieldValue("code"))){This.doProcessSkip(true);}else{if(request.getFieldValue("pos") == null) request.setFieldValue("pos","0");}'>List process</option>
                   <option value='"read".equals(request.getFieldValue("code"))'>Read process</option>
                   <option value='"update".equals(request.getFieldValue("code"))'>Update process</option>
                   <option value='"delete".equals(request.getFieldValue("code"))'>Delete process</option>
               </select> 
               </div>
                 </td>
  		</tr>
  		<tr>
    	  <td>After</td>
    	  <td>&nbsp;<textarea class="styled code" name="aop_point_class" style="width:600px;height:300px;"  wordWrap="true"></textarea></td>
  		</tr>
  		</tbody>
  		</table>

	<div>
		<button type="button" class="btn btn-primary" name="" value="Unit test" onclick="javascript:unitTest();">Unit test</button>  :  Before execute test , save the below parameter value.</li>
	</div>
	<br>
<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Parameter Info.</h3>
			</div>
		</div>
	</div>
</div>
  		
  		<table class="table_hydra" cellspacing="1" cellpadding="1">
			<colgroup>
			<col width="30%">
			<col width="30%">
			<col width="30%">
			<col width="10%">
			</colgroup>
			<thead>
			<tr>
			<th scope="col">Name</th>
			<th scope="col">Type</th>
			<th scope="col">Value</th>
			<th scope="col"><a href='javascript:AddFamily(1)'><img src="/jsp/anaconda/img/plus.png" width="15px" height="15px" border="0" align="absmiddle"></img>Add</a></th>								
			</tr>
			</thead>
			<tbody id="AddChild" >
			<%
		bizdata = businessCollection.getBusinessData(strBizName);
		String strSelect = "";

		for (int i = 0; i < bizdata.getFieldCount(); i++ )
		{
			out.println("<tr align=\"center\"  id='AddChild_Td_"+i+"'>");
			out.println("<td bgcolor=\"#F6FCFF\"><input name='field_name' type='text' class='styled'  size='25' value='"+bizdata.getFieldName(i)+"'></td>");
			out.println("<td bgcolor=\"#F6FCFF\"><SELECT NAME='field_type'>");
			out.println("<OPTION value='KEY' "+(bizdata.getFieldType(i).equals("KEY")? "selected":"")+">KEY</OPTION>");
			out.println("<OPTION value='CURRENT_DATE' "+(bizdata.getFieldType(i).equals("CURRENT_DATE")? "selected":"")+">Current time stamp</OPTION>");
			out.println("<OPTION value='STRING' "+(bizdata.getFieldType(i).equals("STRING")? "selected":"")+">STRING</OPTION>");
			out.println("<OPTION value='INT' "+(bizdata.getFieldType(i).equals("INT")? "selected":"")+">INT</OPTION>");
			out.println("<OPTION value='int[]' "+(bizdata.getFieldType(i).equals("int[]")? "selected":"")+">INT[]</OPTION>");
			out.println("<OPTION value='LONG' "+(bizdata.getFieldType(i).equals("LONG")? "selected":"")+">LONG</OPTION>");
			out.println("<OPTION value='DOUBLE' "+(bizdata.getFieldType(i).equals("DOUBLE")? "selected":"")+">DOUBLE</OPTION>");
			out.println("<OPTION value='BOOLEAN' "+(bizdata.getFieldType(i).equals("BOOLEAN")? "selected":"")+">BOOLEAN</OPTION>");
			out.println("<OPTION value='REFERENCE' "+(bizdata.getFieldType(i).equals("REFERENCE")? "selected":"")+">Refer other variable</OPTION>");
			out.println("<OPTION value='REFER_HASH' "+(bizdata.getFieldType(i).equals("REFER_HASH")? "selected":"")+">make other variable to be hashed</OPTION>");
			out.println("<OPTION value='REFER_ENCRYPT' "+(bizdata.getFieldType(i).equals("REFER_ENCRYPT")? "selected":"")+">encrypt other variable</OPTION>");
			out.println("<OPTION value='REFER_DECRYPT' "+(bizdata.getFieldType(i).equals("REFER_DECRYPT")? "selected":"")+">decrypt other variable</OPTION>");
			out.println("<OPTION value='REFER_PW_ENCRYPT' "+(bizdata.getFieldType(i).equals("REFER_PW_ENCRYPT")? "selected":"")+">encrypt other variable by DES</OPTION>");
			out.println("<OPTION value='REFER_PW_DECRYPT' "+(bizdata.getFieldType(i).equals("REFER_PW_DECRYPT")? "selected":"")+">decrypt other variable by DES</OPTION>");
			out.println("<OPTION value='String[]' "+(bizdata.getFieldType(i).equals("String[]")? "selected":"")+">STRING[]</OPTION>");
			out.println("<OPTION value='BUSINESSDATA' "+(bizdata.getFieldType(i).equals("BUSINESSDATA")? "selected":"")+">Parameter</OPTION>");
			out.println("<OPTION value='ORACLE_SP_CURSOR_RETURN' "+(bizdata.getFieldType(i).equals("ORACLE_SP_CURSOR_RETURN")? "selected":"")+">Oracle Stored Procedure cursor result</OPTION>");
			out.println("<OPTION value='ORACLE_SP_VARCHAR_RETURN' "+(bizdata.getFieldType(i).equals("ORACLE_SP_VARCHAR_RETURN")? "selected":"")+">Oracle Stored Procedure character result</OPTION>");
			out.println("<OPTION value='ORACLE_SP_INT_RETURN' "+(bizdata.getFieldType(i).equals("ORACLE_SP_INT_RETURN")? "selected":"")+">Oracle Stored Procedure integer result</OPTION>");
			out.println("<OPTION value='ORACLE_SP_LONG_RETURN' "+(bizdata.getFieldType(i).equals("ORACLE_SP_LONG_RETURN")? "selected":"")+">Oracle Stored Procedure long result</OPTION>");
			out.println("<OPTION value='ReferenceObject' "+(bizdata.getFieldType(i).equals("ReferenceObject")? "selected":"")+">Object</OPTION>");
			out.println("</SELECT></td>");
			out.println("<td bgcolor=\"#F6FCFF\"><input name='field_value' type='text' class='styled'  size='25' value='"+bizdata.getFieldValue(i)+"'></td>");
			out.println("<td bgcolor=\"#F6FCFF\"><button name='delete' type='button' class='btn btn-danger' onClick='javascript:delRow(\"AddChild_Td_"+i+"\")' value='Delete'>Delete</button></td>");
			out.println("</tr>");
		}
		// xmlResource.release();

%>
      </tbody>
    
  </table>


</form>
<DIV id="SQLTEXT" style="visibility:hidden"><%=strSQL%></DIV>
<DIV id="SUBSQLTEXT" style="visibility:hidden"><%=strSubSQL%></DIV>
<DIV id="AOPBEFORE" style="visibility:hidden"><%=strAopPointMethod%></DIV>
<DIV id="AOPAFTER" style="visibility:hidden"><%=strAopPointCls%></DIV>
<script>

$(function(){
    $('#ref_before').change(function(){
        $('#aop_point_method').val($(this).val());    
    });
});



//클릭한 행 삭제하기
function delRow(idx)
{
	var objTable = _('AddChild');
	var objTr = _(idx);
	objTable.removeChild(objTr);
}
function getObj()
{
    var obj = event.srcElement
    while (obj.tagName !='TD') //TD가 나올때까지의 Object추출
    {
        obj = obj.parentElement
    }
    return obj
}

function selectIntercepterType(idx)
{
	if(idx != 0) frm.aop_intercepter.value = frm.intercepter_type[idx].value;
}

selectType(frm.biz_type.selectedIndex);
var strData = AOPBEFORE.innerHTML;
// alert(strData.replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/\<BR\>/g,"\n"));
frm.aop_point_method.value = strData.replace(/&#47;/g,"/").replace(/&gt;/g,">").replace(/&lt;/g,"<").replace(/&quot;/g,"\"").replace(/<BR>/g,"\r\n").replace(/&#39;/g,"\'").replace(/&amp;/g,"&");
// frm.aop_point_method.innerHTML = strData;
// alert(frm.aop_point_method.value);
strData = AOPAFTER.innerHTML;
frm.aop_point_class.value = strData.replace(/&#47;/g,"/").replace(/&gt;/g,">").replace(/&lt;/g,"<").replace(/&quot;/g,"\"").replace(/<BR>/g,"\r\n").replace(/&#39;/g,"\'").replace(/&amp;/g,"&");
// frm.aop_point_class.innerHTML = strData;
// alert(strData);
// alert(frm.aop_point_class.value);
</script>

<%
	} catch (Exception e) {
		out.println(e.toString());
		ExceptionCenter.catchException(e);
	}
%>
