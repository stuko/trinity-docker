<%@ page contentType="text/html; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>

<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.util.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.business.BusinessData"%>
<%@ page import="com.stuko.anaconda.business.BusinessHelper"%>
<%@ page import="com.stuko.anaconda.business.BusinessCollection"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="com.stuko.anaconda.prms.rule.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="java.util.*"%>
<%
	String strBizColName	= request.getParameter("BizColName") == null || request.getParameter("BizColName").equals("null") ? "" : request.getParameter("BizColName").trim();
	String strCode			= "";
	String strAopInter			= "";
	String strAopPointCls		= "";
	String strAopPointMethod	= "";
	String strCount = "1";
	if (strBizColName.equals("") || strBizColName == null || request.getParameter("BizColName").equals("null"))
	{
		strCode = "ins";
	} else {
		strCode = "upd";
	}
	BusinessCollection businessCollection = null;
	BusinessData bizdata = null;
	BizLogicXmlResource xmlResource = BizLogicXmlResource.getInstance();
	String strColKorBizName = null;
	long cache_time = 0;

	if (strCode.equals("upd"))
	{
		businessCollection = xmlResource.getBusinessCollection(strBizColName);		
		cache_time =  businessCollection.getCACHE_TIME();
		strColKorBizName = businessCollection.getBIZ_COLLECTION_KOR_NAME();
		strAopInter			=	businessCollection.getAOP_INTERCEPTER();
		strAopPointCls		=	BusinessHelper.convert(businessCollection.getAOP_POINT_CLASS());
		strAopPointMethod	=	BusinessHelper.convert(businessCollection.getAOP_POINT_METHOD());
		strCount = BusinessHelper.checkBusinessNull(businessCollection.getCOUNT()) == false ? "1" : businessCollection.getCOUNT();
	}
	
	RequestHelper helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
	DefaultAuth auth = (DefaultAuth)helper.getSessionObject();
	String strSessionValue = "";
	if(auth != null)
	{
		strSessionValue = auth.getAuthItem(("MEMBER_NAME"));	
	}
%>

<script language="javascript">
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
		var skey = _rand();
	    tRow1.setAttribute("id","AddChild_Tr_New_" + skey);
		
		var tCell1 = createElement("TD","","");
		var tCell2 = createElement("TD","","");
		var tCell3 = createElement("TD","","");
			
	    tRow1.appendChild(tCell1);
		tRow1.appendChild(tCell2);
		tRow1.appendChild(tCell3);
		    
	    tCell1.bgColor = "#F6FCFF";
	    tCell1.align = "left";
	    tCell1.innerHTML = 
	     "<input name='bizname' type='text' class='styled'  size='20'>";
	     
	    tCell2.bgColor = "#F6FCFF";
	    tCell2.align = "left";
	    tCell2.innerHTML = 
	     "<input name='desc' type='text' class='styled'  size='40'>";
	     
	    tCell3.bgColor = "#F6FCFF";
	    tCell3.align = "left";
	    tCell3.innerHTML = 
	     "<button name='delete' type='button' class='btn btn-primary' onClick='javascript:delRow(\"AddChild_Tr_New_" + skey + "\")' value='삭제'>삭제</button>&nbsp;<button name='delete' type='button' class='btn btn-primary' onClick='javascript:AddFamily(1)' value='추가'>추가</button>";	     
	}
}

function AddFirst(str)
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
		Tbl.insertBefore(tRow1,Tbl.firstChild);
		var skey = _rand();
	    tRow1.setAttribute("id","AddChild_Tr_New_" + skey);
		
		var tCell1 = createElement("TD","","");
		var tCell2 = createElement("TD","","");
		var tCell3 = createElement("TD","","");
			
	    tRow1.appendChild(tCell1);
		tRow1.appendChild(tCell2);
		tRow1.appendChild(tCell3);
		    
	    tCell1.bgColor = "#F6FCFF";
	    tCell1.align = "left";
	    tCell1.innerHTML = 
	     "<input name='bizname' type='text' class='styled'  size='27'>";
	     
	    tCell2.bgColor = "#F6FCFF";
	    tCell2.align = "left";
	    tCell2.innerHTML = 
	     "<input name='desc' type='text' class='styled'  size='40'>";
	     
	    tCell3.bgColor = "#F6FCFF";
	    tCell3.align = "left";
	    tCell3.innerHTML = 
	     "<button name='delete' type='button' class='btn btn-primary' onClick='javascript:delRow(\"AddChild_Tr_New_" + skey + "\")' value='삭제'>삭제</button>&nbsp;<button name='delete' type='button' class='btn btn-primary' onClick='javascript:AddFamily(1)' value='추가'>추가</button>";	     
	}
}


function copyService()
{
	var bAnswer = confirm("복사 하시겠습니까?")
	if (bAnswer == true) 
	{
		with(frm)
		{
			code.value = 'copy';
			AnacondaSubmit(document.frm);
		}
	}	
}
function fnSubmit()
{
	var bAnswer = confirm("생성하시겠습니까?")
	
	if (bAnswer == true) 
	{
		if(document.frm.BizCheck.checked == false)
		{ 
			if (document.frm.colbizname.value == "")
			{
				alert("Enter the service name.");		
				document.frm.colbizname.focus();	
				return ;
			}
		} 
	} else {
		alert("취소하셨습니다");
		return ;
	}
	AnacondaSubmit(document.frm);
}
function createInterceptor()
{
	with(frm)
	{
		if(aop_point_method.value == null && aop_point_class.value == null)
		{
			alert("인터셉터를 만드시려면, 이전/이후 소스를 입력해 주세요.");
			return;
		}
		
	}
	var bAnswer = confirm("인터셉터 클래스를 만드시겠습니까?");
	if (bAnswer == true) 
	{
		window.open("/Anaconda.do?CMD=CMD_SEQ_107351305671330160197641&BizCol=<%=strBizColName%>","","height=400,width=700,left=200,top=20,status=no, location=no, toolbar=no, scrollbars=yes");
		
	} else {
		alert("취소하셨습니다.");
		return;
	}
}
function doRun(action, REQ)
{
    alert(REQ.responseText);
	alert("요청하신 내용이 적용되었습니다.");
}
function chkForm(frm)
{	
	var bAnswer = confirm("생성하시겠습니까?")
	
	if (bAnswer == true) 
	{
		if(document.frm.BizCheck.checked == false)
		{ 
			if (document.frm.colbizname.value == "")
			{
				alert("서비스 이름을 입력해 주세요");		
				document.frm.colbizname.focus();	
				return false;
			}
		} else {
		
		}
		return true;
	} else {
		alert("Cancelled");
		return false;
	}
}


function fnAllChangeUser()
{
	if(!confirm("소유자를 설정하지 않으시면, 현재 로그인한 사용자로 설정이 됩니다.")) return;
	with(frm)
	{
		// var change_user = owner.value;
		code.value = "change_user";
		AnacondaSubmit(document.frm);
	}
}

function fn_check()
{
	with(frm)
	{
		if(BizCheck.checked == true)
		{ 
			colbizname.disabled = true;
			colbizname.value = "";
		} else {
			colbizname.disabled = false;
		}
	}
}

function showAction(div_object)
{
	var obj = _(div_object);
	if(obj.style.display == 'none') obj.style.display = 'block';
	else  obj.style.display = 'none';
}

</script>

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">서비스 정보</h3>
					<span class="fr"><button type="button" class="btn btn-info" name="Register" value="Copy" onClick="javascript:copyService();">복사</button></span>
					<span class="fr"><button type="button"  id="actionGroupShow" class="btn btn-primary" name="Register" value="Save" onClick="javascript:fnSubmit();">저장</button></span>
					<span class="fr"><button type="button"  id="actionGroupShow" class="btn btn-secondary" name="Register" value="Back" onClick="javascript:history.back();">뒤로가기</button></span>
			</div>
		</div>
	</div>
</div>

<form name="frm" method="post" action="/Anaconda.do?CMD=CMD_SEQ_105864769331287842547280">
<input type="hidden" name="code" value="<%=strCode%>" />

<table class="table_hydra" cellspacing="0" cellpadding="0">
<colgroup>
		<col width="20%">
		<col>
		</colgroup>
		<tbody>
		  <tr>
			<td class="left">&nbsp;서비스 이름 <br>&nbsp;<input name="BizCheck" type="checkbox"    onClick="javascript:fn_check();">&nbsp;&nbsp;(선택하시면, 자동생성됨. )</td>
			<td class="left">
<%
	if (strCode.equals("upd"))
	{
		out.println("&nbsp;<input type=\"text\"  class=\"styled\"  name=\"colbizname\" size=\"30\" value=\""+strBizColName+"\">");		
	} else {
		out.println("&nbsp;<input name=\"colbizname\" type=\"text\"  class=\"styled\"  size=\"30\">");			
	}
	
%>
        &nbsp;<font color="red" style="size:12px;"><b>* 알파벳 입력 (특수문자나 공백은 사용하지 못함).</b></font>
		</td>
	</tr>
	  <tr>
		<td class="left">&nbsp;서비스 별명&nbsp;</td>
		<td class="left">	
		<%
		strColKorBizName = BusinessHelper.checkBusinessNull(strColKorBizName) == true ? strColKorBizName : "";
		out.println("&nbsp;<input type=\"text\"  class=\"styled\"  name=\"colKorbizname\"  size=\"60\" value=\""+strColKorBizName+"\">");
		%>
		</td>
	</tr>
	</tbody>
	</table>

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">서비스 상세 정보</h3>
					<span class="fr"><button type="button" class="btn btn-info" name="Register" value="Open/Close" onClick="javascript:showAction('div_collection');">+/-</button></span>
			</div>
		</div>
	</div>
</div>

		<div id="div_collection" style="display:block;">
		<table class="table_hydra" cellspacing="0" cellpadding="0">
		<colgroup>
		<col width="30%">
		<col>
		</colgroup>
		<tbody>
		<tr>
			<td class="left">&nbsp;서비스 캐시 시간&nbsp;</td>
			<td class="left">&nbsp;<input name="cacheText" type="text" class="styled" size="13" value="<%=cache_time%>">&nbsp;&nbsp;(밀리세컨드, 0이면 사용안함)</td>
		</tr>  	
		<tr>
			<td class="left">&nbsp;서비스 실행 횟수&nbsp;</td>
			<td class="left">&nbsp;<input name="count" type="text" class="styled" size="13" value="<%=strCount%>">&nbsp;&nbsp;(입력한 횟수만큼 실행)</td>
		</tr>  	
		 <tr>
			<td class="left">&nbsp;소유자 변경&nbsp;&nbsp;</td>
			<td class="left">&nbsp;<input type="text" name="owner"  class="styled" size="20" value="<%=strSessionValue %>"></input>&nbsp;&nbsp;<button type="button" class="btn btn-primary" value="Change all" onClick="javascript:fnAllChangeUser();">모두 변경</button></td>
		  </tr>
		</tbody>	
	 </table>
 

 <div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">프로세스 정보</h3>
			</div>
		</div>
	</div>
</div>

 <table class="table_hydra" cellspacing="0" cellpadding="0">
 		<colgroup>
		<col width="30%">
		<col>
		<col width="15%">
		</colgroup>
		<thead>
		<tr>
		<th scope="col">프로세스 이름</th>
		<th scope="col">프로세스 설명</th>
		<th scope="col"><a href='javascript:AddFirst(1)'><img src="/jsp/anaconda/img/plus.png" width="15px" height="15px" border="0" align="absmiddle"></img>추가</a></th>
		</tr>
		</thead>
		<tbody id="AddChild">
<%	
if (strCode.equals("upd"))
{
	try
	{
		Iterator iterator = businessCollection.iterator();
		
	    for(int i=0;iterator.hasNext();i++)
	    {
			bizdata = (BusinessData)iterator.next();				
			out.println("<tr align=\"left\" id='AddChild_Td_"+i+"'>");						
			out.println("<td bgcolor=\"#F6FCFF\"><input name='bizname' type='text' class='styled'  size='20' value='"+bizdata.getBusinessName()+"'>");
			out.println("&nbsp;<a href=\"/Anaconda.do?CMD=CMD_SEQ_103913152981287845327671&BizName="+bizdata.getBusinessName()+"&colbizname="+strBizColName+"\"><img src=\"/jsp/anaconda/img/go.png\" width=\"15px\" height=\"15px\" border=\"0\" align=\"absmiddle\"></img></a>바로가기</td>");
			out.println("<td  align=\"left\" bgcolor=\"#F6FCFF\"><input name='desc' type='text' class='styled'  size='40' value='"+bizdata.getDESC()+"'></td>");
			out.println("<td  align=\"left\" bgcolor=\"#F6FCFF\"><button name='delete' type='button' class='btn btn-primary' onClick='javascript:delRow(\"AddChild_Td_"+i+"\")' value='삭제'>삭제</button>&nbsp;<button name='delete' type='button' class='btn btn-primary' onClick='javascript:AddFamily(1)' value='추가'>추가</button></td>");
			out.println("</tr>");
		}	
		xmlResource.release();
	} catch (Exception e) {
		ExceptionCenter.catchException(e);
	}
}
%>				  
	    </tbody>
</table>
 <div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
				<h3 class="fl">인터셉터</h3>
			</div>
		</div>
	</div>
</div>
		<ul>
			<li>예약어 : BusinessDataParameter=parameter , MasterReturnValue=return</li>
			<li>프로세스 건너뛰기 : This.doProcessSkip(true or false);</li>
			<li>프로세스 종료 : This.doProcessExit(true or false);</li>
			<li>프로세스 중단 : MasterReturnValue.setSkipCount(-1);</li>
			<li>전역 변수: ((BusinessData)BusinessDataParameter.getAllBusinessData()).getFieldValue )</li>
			<li>패키지 : import com.stuko.anaconda.business.*;</li>
		</ul>
		
<table class="table_hydra" cellspacing="0" cellpadding="0">
		<colgroup>
		<col width="30%">
		<col width="500px">
		</colgroup>
		<tbody>
  		<tr>
		  <td class="left" >인터셉터 클래스 이름</td>
		  <td>&nbsp;<input type="text" class="styled" name="aop_intercepter" size="50" value="<%=strAopInter%>">
		  &nbsp;<SELECT NAME='intercepter_type' onChange="javascript:selectIntercepterType(this.selectedIndex);">
			    <OPTION value='' selected>선택해 주세요</OPTION>
			    <OPTION value='com.stuko.anaconda.intercepter.ConditionalBusinessCollectionIntercepter'>Conditional</OPTION>
			    <OPTION value='com.stuko.anaconda.intercepter.SimpleBusinessCollectionIntercepter'>Simple</OPTION>
	  		   </SELECT>
		  </td>
  		</tr>
  		<tr>
		  <td class="left" >이전 스크립트</td>
		  <td>&nbsp;<textarea class="styled code" name="aop_point_method" style="width:530px;height:150px;" wordWrap="true"></textarea></td>
  		</tr>
  		<tr>
    	  <td class="left" >이후 스크립트</td>
    	  <td>&nbsp;<textarea class="styled code" name="aop_point_class" style="width:530px;height:150px;"  wordWrap="true"></textarea></td>
  		</tr>
  		</tbody>
 </table>
</form>
<DIV id="AOPBEFORE" style="visibility:hidden">
<%=BusinessHelper.revert(strAopPointMethod)%>
</DIV>
<DIV id="AOPAFTER" style="visibility:hidden">
<%=BusinessHelper.revert(strAopPointCls)%>
</DIV>
 
<script> 
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

var strData = AOPBEFORE.innerHTML;
frm.aop_point_method.value = strData.replace(/&amp;/g,"&").replace(/&#47;/g,"/").replace(/&gt;/g,">").replace(/&lt;/g,"<").replace(/&quot;/g,"\"").replace(/<BR>/g,"\r\n").replace(/&#39;/g,"\'");
strData = AOPAFTER.innerHTML;
frm.aop_point_class.value = strData.replace(/&amp;/g,"&").replace(/&#47;/g,"/").replace(/&gt;/g,">").replace(/&lt;/g,"<").replace(/&quot;/g,"\"").replace(/<BR>/g,"\r\n").replace(/&#39;/g,"\'");
</script>
