<%@page contentType="text/xml; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%

%>
<div class="post">
	<div class="title-right">
	<h2><font><b>Analysis Model</b> - Key Abstraction</font></h2>
	</div>
</div>
<table cellspacing=0 cellpadding=0 class="styled">
<tr>
<td>
<form name="frmKey" id="frmKey" action="/Anaconda.do" method="post">
<table class="table_hydra" cellspacing="0" cellpadding="0">
 <caption>Key Word</caption>
		<colgroup>
		<col width="700px">
		</colgroup>
		<thead>
		<tr>
		<th scope="col">Key Word List&nbsp;<input type="button" class="button white" value="전체삭제" onClick="javascript:fnDeleteAll();"></input></th>
		</tr>
		</thead>
		<tbody>
		<tr><td align="center">
		<table cellspacing=0 cellpadding=5 border=0 style="padding: 5px 5px">
		<colgroup>
		<col width="25%">
		<col width="25%">
		<col width="25%">
		<col>
		</colgroup>
		<tbody>
<%
DefaultXmlResource res = DefaultXmlResource.getInstance();
DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANALYSIS_MODEL);
if(col != null)
{
	DefaultXmlData dxd = null;
	String strKey = null;
	Iterator it = col.iterator();
	int i = 0;
	int iTr = 0;
	int iTab = 0;
	boolean isClosed = false;
	for(;it.hasNext();)
	{

		dxd = (DefaultXmlData)it.next();
		for(Iterator it2 = dxd.keySet().iterator(); it2.hasNext();)
		{
			strKey = (String)it2.next();
			if(!"type".equals(strKey))
			{
				i++;
				iTr = i % 4;
				if(iTr == 1)
				{
					isClosed = false;
					iTab++;
					out.println("<tr>");
				}
		%>
		<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<img src="/jsp/anaconda/img/subject.png" align="absmiddle">&nbsp;
		<a  href="javascript:fnNull();" onClick="javascript:fnShowOrHideMenu('menu_<%=i %>');"><%=dxd.getData(strKey) %></a>
		<div id="menu_<%=i %>" style="display:none;position:absolute;background-color:white;border: 2px double #BF95FF;padding: 5px 5px;">
		<img src='/jsp/anaconda/img/close.png' width='20px' height='20px' border='0' align='absmiddle' />&nbsp;&nbsp;<a href='javascript:fnShowOrHide("menu_<%=i %>");' style="font-size:12px;"><b>close</b></a>
			<br/>
				<ul>
				<li><a href="javascript:fnNull();" onClick="javascript:fnRemoveAnalysisKeyword('<%=dxd.getNAME()%>','<%=strKey%>')">키워드 삭제</a></li>
				<li>DesignModel Name&nbsp;&nbsp;<input class="styled" type="text" name="input_<%=i%>" id="input_<%=i%>" value="" size="30"></input>&nbsp;<input type="button" class="button white" value="저장" onClick="javascript:fnSaveAnalysisKeyword('<%=i%>','<%=dxd.getData(strKey)%>');" /></li>
				</ul>
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;	
		</td>
<%
				if(iTr == 0)
				{
					isClosed = true;
					out.println("</tr>");
				}
			}
		}
	}
	if(iTr != 0)
	{
		for(int j = 1; j < iTr; j++)
		{
			out.println("<td></td>");
		}
	}
	if(!isClosed)
	{
		out.println("</tr>");
	}

}
%>
</tbody>
</table>
	</td></tr>
 </tbody>
</table>
</form>
</td>
</tr>
</table>
<form name="frm" id="frm" action="/Anaconda.do" method="post">
<input type="hidden" name="CMD"  value="CMD_SEQ_109808025731320386460526" />
<input type="hidden" name="code"  value="" />
<input type="hidden" name="dxname"  value="" />
<input type="hidden" name="dxkey"  value="" />
</form>
<script language="javascript">

function fnDeleteAll()
{
	if(confirm('삭제 하시겠습니까?'))
	{
		with(frm)
		{
			code.value = "delete_all";
			CMD.value = "CMD_SEQ_109808025731320386460526";
			callAjaxByForm("delete_all", "frm");
		}
	}
}

function fnRemoveAnalysisKeyword(arg1, arg2)
{
	with(frm)
	{
		dxname.value = arg1;
		dxkey.value = arg2;
		code.value = "remove";
		CMD.value = "CMD_SEQ_109808025731320386460526";
		callAjaxByForm("remove", "frm");
	}
}

function fnSaveAnalysisKeyword(arg1, arg2)
{
    var entity = _('input_' + arg1);
    if(entity.value == '')
    {
       alert("DesignModle 이름을 입력하세요");
       return;
    }
	with(frm)
	{
		dxname.value = entity.value;
		dxkey.value = arg2;
		code.value = "create_design_model";
		CMD.value = "CMD_SEQ_109808025731320386460526";
		callAjaxByForm("create_design_model", "frm");
	}
}

function doRuning(callerName)
{
showRunning(callerName);

}

function doRun(callerName,REQ)
{
	alert("정상적으로 반영되었습니다.");
	document.location.reload();
}

</script>