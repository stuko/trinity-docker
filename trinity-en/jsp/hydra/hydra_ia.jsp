<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%!
public String getBusinessTree(BusinessTree bt)
{
	StringBuffer sb = new StringBuffer();
	Iterator it = bt.iterator();
	sb.append("<table cellspacing='0' cellpadding='0' style='border:0px;margin:0px 0px 0px 0px;' align='left' valign='top'>");

	for(int i = 0;it.hasNext();i++)
	{
		BusinessTree businessTree = (BusinessTree)it.next();
		String strKey = BusinessHelper.getKey("DIV_");
		sb.append("<tr  style='border:0px;margin:0px 0px 0px 0px;' align='left' valign='top'>");
		
		if(bt.getDepth() == 1)
		{
			sb.append("<td  style='border:0px;margin:0px 0px 0px 0px;width:18px;' align='left' valign='top'>");
		}
		else
		{
			if(i == 0)
			{
				// 처음
				if(bt.size() == 1)
				{
					sb.append("<td  style='border:0px;margin:0px 0px 0px 0px;width:18px;' align='left' valign='top'>");
					sb.append("<img src='/jsp/SDLC/img/tree-leaf-start-no.gif'>");
				}
				else
				{
					sb.append("<td  style='border:0px;margin:0px 0px 0px 0px;width:18px;background: url(/jsp/SDLC/img/tree-branch.gif) repeat-y;' align='left' valign='top'>");
					sb.append("<img src='/jsp/SDLC/img/tree-leaf-start.gif'>");
				}
			}
			else if(i == (bt.size()-1))
			{
				// 마지막
				sb.append("<td  style='border:0px;margin:0px 0px 0px 0px;width:18px;' align='left' valign='top'>");
				sb.append("<img src='/jsp/SDLC/img/tree-leaf-end.gif'>");
			}
			else
			{
				// 중간
				sb.append("<td  style='border:0px;margin:0px 0px 0px 0px;width:18px;background: url(/jsp/SDLC/img/tree-branch.gif) repeat-y;' align='left' valign='top'>");
				sb.append("<img src='/jsp/SDLC/img/tree-leaf.gif'>");
			}
		}
		sb.append("</td>");
		sb.append("<td  style='border:0px;margin:0px 0px 0px 0px;' align='left' valign='top'>");
		sb.append("<div style='background:#FFFFCC;width:120px;font:none 12px 돋움체,Arial , Sanserif;color:#333333;margin:2px 0 2px 0;padding:6px 6px 6px 6px;border: 1px double #CCCCCC;' align='left'>");
		String img_head = "word.png";
		if(bt.getDepth() == 1) img_head = "home.png";
		sb.append("<a style='text-decoration:none;' href='javascript:fnNull();' onClick='javascript:fnShowMenu(\""+businessTree.getNode().getFieldValue("seq")+"\");'><img src='/jsp/SDLC/img/"+img_head+"' width='20px' height='20px' border='0' align='absmiddle'>&nbsp;");
		sb.append(businessTree.getNode().getFieldValue("cate_name"));
		sb.append("</a></div>");
		sb.append("</td>");
		if(businessTree.hasChild())
		{
			if(bt.getDepth() <= 4)
			{
				sb.append("<td  style='border:0px;margin:0px 0px 0px 0px;' align='left' valign='top'>");
				sb.append(this.getBusinessTree(businessTree));
				sb.append("</td>");
			}
			else
			{
				sb.append("<td  style='border:0px;margin:0px 0px 0px 0px;' align='left' valign='center'>");
				sb.append("<a style='text-decoration:none;' href='javascript:fnNull();' onClick='javascript:fnShowMenu(\""+businessTree.getNode().getFieldValue("seq")+"\");'>&nbsp;");
				sb.append("<img src='/jsp/SDLC/img/more.png' width='20px' height='20px' border='0' align='absmiddle'>");
				sb.append("</a>");
				sb.append("</td>");
			}
		}
		sb.append("</tr>");
	}
	sb.append("</table>");
	return sb.toString();
}
%>

<script language="javascript">
var keywordManager = new KeywordManager();

function doRuning(callerName)
{
showRunning(callerName);
}

function doRun(callerName , REQ)
{
	if(callerName == 'getKeywordReport')
	{
		var object = parseAnacondaAJAXFromBusinessCollection(REQ.responseXML);
		var strData = '';
	  	keywordManager.seq = object.request.seq;
		keywordManager.member_id = object.request.member_id;
		keywordManager.min_seq = object.request.min_seq;
		keywordManager.cate_name = object.request.cate_name;  

		for(var i = 0; i < object.response.length; i++)
		{
			var desc = TextToHtmlNoBR(object.response[i].key_word_desc);
			//var desc = object.response[i].key_word_desc;
			// desc = desc.replace(/<BR>/g,"\r\n");
			strData = strData + '<b>' + object.response[i].key_word +'</b>' + "<br>";
			strData = strData + desc + "<br>";
		}
		var oDivMenu = _('div_keyword_view_menu');
		var oDiv = _('div_keyword_view');
		oDiv.innerHTML = oDivMenu.innerHTML + strData;
		oDiv.style.left = object.request.x;
		oDiv.style.top = object.request.y;
		fnShowOrHide("div_keyword_view");
	}
	else if(callerName == 'getKeywordDefine')
	{
		var object = parseAnacondaAJAXFromBusinessCollection(REQ.responseXML);
		var strData = '';
		// alert(object.response.length);
		fnShowOrHide("div_keyword_define");
		var pos = getCurrentPosition();
		var div = _('div_keyword_define');
		div.style.left = object.request.x;
		div.style.top = object.request.y;
	  	with(frmKeywordDefine)
	  	{
	  	  	var div = _('div_keyword');
	  	  	div.innerHTML = keywordManager.keyword;
	  	    div = _('div_keyword_title');
		  	div.innerHTML = cate_name.value + " : " + keywordManager.keyword + " 입력화면";
		  	//alert(object.response.length);
		  	keywordManager.seq = object.request.seq;
 			keywordManager.member_id = object.request.member_id;
  			keywordManager.min_seq = object.request.min_seq;
  			keywordManager.cate_name = object.request.cate_name;  
		  	if(object.response.length != 0)
		  	{
			  	
			  	keyword_define.value = TextToHtml(object.response[0].key_word_desc);
			  	define_seq.value = object.response[0].seq;
			  	keywordManager.createOrUpdate = "updateKeywordDefine";
		  	}
		  	else
		  	{
		  		define_seq.value = '';
		  		keyword_define.value = '';
			  	keywordManager.createOrUpdate = "saveKeywordDefine";
		  	}
	  	}
	}
	else
	{
		alert("정상적으로 반영 되었습니다.");
		document.location.reload();
	}
}

function fnShowMenu(arg1,arg2,arg3,arg4)
{
  // /Anaconda.do?CMD=CMD_SEQ_108714982471292549068709
  // alert(seq + "/" + member_id + "/" + min_seq);
  var pos = getCurrentPosition();
  // alert(pos.x);
  var div = _('div_keyword_menu');
  div.style.left = pos.x;
  div.style.top = pos.y;
  fnShowOrHide("div_keyword_menu");
  keywordManager.seq = arg1;
  keywordManager.member_id = arg2;
  keywordManager.min_seq = arg3;
  keywordManager.cate_name = arg4;  
  with(frmKeywordDefine)
  {
   	cate_name.value = arg4;
  }
}
function KeywordManager()
{
	var seq;
	var member_id;
	var min_seq;
	var cate_name;
	var createOrUpdate;
	var keyword;
	var keyword_define;
}
KeywordManager.prototype.viewDetail = function()
{
	document.location.href = '/Anaconda.do?CMD=CMD_SEQ_108714982471292549068709&seq='+this.seq+'&min_seq='+this.min_seq+'&member_id='+this.member_id;
}
KeywordManager.prototype.create = function()
{
	fnShowOrHide("div_create_node");
	var pos = getCurrentPosition();
	var div = _('div_create_node');
  	div.style.left = pos.x;
  	div.style.top = pos.y;
  	this.createOrUpdate = "createNode";
 }
KeywordManager.prototype.update = function()
{
	fnShowOrHide("div_create_node");
	var pos = getCurrentPosition();
	var div = _('div_create_node');
  	div.style.left = pos.x;
  	div.style.top = pos.y;
  	this.createOrUpdate = "updateNode";
  	with(frmTree)
	{
  		cate_name.value = this.cate_name;
	}
}
KeywordManager.prototype.define = function(arg1)
{

}
KeywordManager.prototype.showKeywordMove = function()
{
	fnShowOrHide("div_keyword_move");
	var pos = getCurrentPosition();
	var div = _('div_keyword_move');
  	div.style.left = pos.x;
  	div.style.top = pos.y;
}
KeywordManager.prototype.createNode = function()
{
	with(frmTree)
	{
		if(cate_name.value == '') 
		{
			alert("노드 이름을 입력해 주세요");
			return;
		}
		seq.value = this.seq;
		member_id.value = this.member_id;
		min_seq.value = this.min_seq;
		CMD.value = "CMD_SEQ_102315675841292552233927";
		code.value = "createNode";
		callAjaxByForm("createNode","frmTree");				
	}
	//fnShowOrHide("div_create_node");
}
KeywordManager.prototype.updateNode = function()
{
	with(frmTree)
	{
		if(cate_name.value == '') 
		{
			alert("노드 이름을 입력해 주세요");
			return;
		}
		seq.value = this.seq;
		member_id.value = this.member_id;
		min_seq.value = this.min_seq;
		CMD.value = "CMD_SEQ_102315675841292552233927";
		code.value = "updateNode";
		callAjaxByForm("updateNode","frmTree");				
	}
	//fnShowOrHide("div_create_node");
}

KeywordManager.prototype.saveKeywordDefine = function(arg1)
{
	with(frmKeywordDefine)
	{
		if(keyword_define.value == '')
		{
			alert(arg1+ "를 입력해 주세요");
			return;
		}
		seq.value = this.seq;
		member_id.value = this.member_id;
		min_seq.value = this.min_seq;
		CMD.value = "CMD_SEQ_102315675841292552233927";
		code.value = keywordManager.createOrUpdate;
		// keyword.value = arg1;
		callAjaxByForm(keywordManager.createOrUpdate,"frmKeywordDefine");				
	}
	//fnShowOrHide("div_create_node");
}
KeywordManager.prototype.getKeywordDefine = function(arg1)
{
	with(frmKeywordDefine)
	{
		// alert(this.seq);
		seq.value = this.seq;
		CMD.value = "CMD_SEQ_102315675841292552233927";
		code.value = "getKeywordDefine";
		var pos = getCurrentPosition();
		x.value = pos.x;
		y.value = pos.y;
		keyword.value = arg1;
		keywordManager.keyword = arg1;
		callAjaxByForm("getKeywordDefine","frmKeywordDefine");				
	}
	//fnShowOrHide("div_create_node");
}

KeywordManager.prototype.getKeywordReport = function()
{
	with(frmKeywordDefine)
	{
		seq.value = this.seq;
		member_id.value = this.member_id;
		min_seq.value = this.min_seq;
		var pos = getCurrentPosition();
		x.value = pos.x;
		y.value = pos.y;
		CMD.value = "CMD_SEQ_102315675841292552233927";
		code.value = "getKeywordReport";
		// keyword.value = arg1;
		callAjaxByForm("getKeywordReport","frmKeywordDefine");				
	}
	//fnShowOrHide("div_create_node");
}
KeywordManager.prototype.publishNode = function()
{
	with(frmKeywordDefine)
	{
		CMD.value = "CMD_SEQ_102315675841292552233927";
		code.value = "publishNode";
		callAjaxByForm("publishNode","frmKeywordDefine");				
	}
}
KeywordManager.prototype.unpublishNode = function()
{
	with(frmKeywordDefine)
	{
		CMD.value = "CMD_SEQ_102315675841292552233927";
		code.value = "unpublishNode";
		callAjaxByForm("unpublishNode","frmKeywordDefine");				
	}
}

KeywordManager.prototype.saveKeywordMove = function()
{
	with(frmKeywordMove)
	{
		seq.value = this.seq;
		CMD.value = "CMD_SEQ_102315675841292552233927";
		code.value = "moveTree";
		callAjaxByForm("moveTree","frmKeywordMove");				
	}
	//fnShowOrHide("div_create_node");
}

function goDetail()
{
	keywordManager.viewDetail();
}
function goCreate()
{
	keywordManager.create();
}
function goDefine(arg1)
{
	keywordManager.getKeywordDefine(arg1);
}
function goMove()
{
	keywordManager.showKeywordMove();
}
function goUpdate()
{
	keywordManager.update();	
}
function createNode()
{
	if(keywordManager.createOrUpdate == 'createNode')
		keywordManager.createNode();
	else if(keywordManager.createOrUpdate == 'updateNode')
		keywordManager.updateNode();	
}
function saveKeywordDefine(arg1)
{
	keywordManager.saveKeywordDefine(arg1);
}
function getKeywordReport()
{
	keywordManager.getKeywordReport();
}
function publishNode()
{
	keywordManager.publishNode();
}
function unpublishNode()
{
	keywordManager.unpublishNode();
}
function saveKeywordMove()
{
	keywordManager.saveKeywordMove();
}
</script>

<%
String strBeforeSeq = "";
String strData = "";
Object object = request.getAttribute(InitClass.getReturnValue());
if(object != null && object instanceof ReturnValue)
{
	ReturnValue rv = (ReturnValue)object;	
	object = rv.getReturnObject("getIA");
	if(object != null && object instanceof BusinessTree)
	{
		BusinessTree businessTree = (BusinessTree)object;
		if(businessTree.hasChild())
		{
			BusinessTree bt = (BusinessTree)businessTree.get(0);	
			strBeforeSeq = bt.getNode().getFieldValue("parent_seq");
			if(strBeforeSeq.equals("-2")) strBeforeSeq = "";
		}
		strData = this.getBusinessTree(businessTree);
	}
}


%>

<p style="height:10px">IA 관리</p>
<p>
&nbsp;
</p>
<div style="padding-left:10px;padding-top:10px;">
<%=strData %>
<p height="20px">&nbsp;</p>
</div>





