<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<style>

.div_keyword_true
{
	background:#FFFFCC; 
	font:none 12px dotum,Arial,Sanserif;
	color:#333333;
	margin:2px 0 2px 0;
	padding:6px 6px 6px 6px;border: 1px double #CCCCCC;
}

.div_keyword_false
{
	background:#FFFFCC; 
	font:none 12px dotum,Arial,Sanserif;
	color:#333333;
	margin:2px 0 2px 0;
	padding:6px 6px 6px 6px;border: 1px double #CCCCCC;
}

.div_keyword_home 
{
	background:#CCFFFF; 
	font:none 12px dotum,Arial,Sanserif;
	color:#333333;
	margin:2px 0 2px 0;
	padding:6px 6px 6px 6px;border: 1px double #CCCCCC;
}

.table_keyword
{
	border:0px;
	margin:0px 0px 0px 0px;
}
.td_keyword
{
	border:0px;
	margin:0px 0px 0px 0px;
	width:18px;
	font-size:12px;
}
.td_keyword2
{
	border:0px;
	margin:0px 0px 0px 0px;
	font-size:12px;
}
.td_keyword_img
{
	border:0px;
	margin:0px 0px 0px 0px;
	width:18px;
	background:url(/jsp/bestmember/img/tree-branch.gif) repeat-y;
}
.a_keyword
{
	text-decoration:none;
}
</style>

<form name="frmRuleTree" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD" value=""></input>
<input type="hidden" name="seq" value=""></input>
<input type="hidden" name="parent_seq" value=""></input>
<input type="hidden" name="div_id" value=""></input>
<input type="hidden" name="context_seq" value=""></input>
<input type="hidden" name="min_seq" value=""></input>
<input type="hidden" name="code" value=""></input>
<input type="hidden" name="context_name" value=""></input>
<input type="hidden" name="kind" value="MSG"></input>
<input type="hidden" name="x" value=""></input>
<input type="hidden" name="y" value=""></input>
<input type="hidden" name="msg" value=""></input>
</form>

<form name="frmParentRuleTree" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD" value=""></input>
<input type="hidden" name="seq" value=""></input>
<input type="hidden" name="parent_seq" value=""></input>
<input type="hidden" name="div_id" value=""></input>
<input type="hidden" name="context_seq" value=""></input>
<input type="hidden" name="min_seq" value=""></input>
<input type="hidden" name="code" value=""></input>
<input type="hidden" name="context_name" value=""></input>
<input type="hidden" name="kind" value="MSG"></input>
<input type="hidden" name="x" value=""></input>
<input type="hidden" name="y" value=""></input>
<input type="hidden" name="msg" value=""></input>
</form>

<!-- ------------------------------------------------------------------------- -->
<!-- Rule Tree Div & Form -->
<!-- ------------------------------------------------------------------------- -->




<div id="div_rule_menu" style="position:absolute;display:none;background-color:white;border: 2px double #CCCCCC; z-index:200;">
	<form name="frmMenu">
		<ul style="list-style:none ;padding: 10px 25px 10px 25px;">
			<p style="height:30px">
				<img src="/jsp/bestmember/img/important.png" width="20px" height="20px" align="absmiddle"></img>&nbsp;
Rule management menu
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="text-decoration:none;" href='javascript:fnShowOrHide("div_rule_menu");'><img src='/jsp/anaconda/img/close.png' width='20px' height='20px' border='0' align='absmiddle' />&nbsp;close</a>
			</p>
			
			<li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goShowRule();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;More about rules</a></li>
			<li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goShowRule();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;Modifying rules</a></li>
			<li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goCreate();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;Adding rules</a></li>
			<li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goExpandRule();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;Extending Rules</a></li>
			<li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goDelete();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;Delete a rule</a></li>
			<li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goShowAction();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;View rule action</a> &nbsp;
			<select name="menu_keyword" id="menu_keyword" class="styled">
				<option value="BScript" selected>Before Script</option>
				<option value="BService">Before Service</option>
				<option value="TService">Then Service</option>
				<option value="AScript">After Script</option>
				<option value="AService">After Service</option>
				<option value="EService">Else Service</option>
			</select>
			</li>
			<li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goRuleMove();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;Move rule location</a></li>
		</ul>
	</form>
</div>

<div id="div_home_menu" style="position:absolute;display:none;background-color:white;border: 2px double #CCCCCC; z-index:200;">
	<form name="frmHomeMenu">
		<ul style="list-style:none ;padding: 10px 25px 10px 25px;">
			<p style="height:30px">
				<img src="/jsp/bestmember/img/important.png" width="20px" height="20px" align="absmiddle"></img>&nbsp;룰 관리 메뉴
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="text-decoration:none;" href='javascript:fnShowOrHide("div_home_menu");'><img src='/jsp/anaconda/img/close.png' width='20px' height='20px' border='0' align='absmiddle' />&nbsp;close</a>
			</p>
			<li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goCreate();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;Adding rules</a></li>
			<li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goShowRule();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;Modifying rules</a></li>
		</ul>
	</form>
</div>



<div id="div_save_rule" style="position:absolute;display:none;background-color:white;border: 2px double #CCCCCC;padding: 10px 10px;z-index:200;">
	<form name="frmRule" method="post" action="/Anaconda.do">
		<input type="hidden" name="CMD" value=""></input>
		<input type="hidden" name="seq" value=""></input>
		<input type="hidden" name="min_seq" value=""></input>
		<input type="hidden" name="kind" value="MSG"></input>
		<input type="hidden" name="code" value=""></input>
		<input type="hidden" name="x" value=""></input>
		<input type="hidden" name="y" value=""></input>
		<table border="0" cellpadding="2" cellspacing="0" width="500px">
			<colgroup>
				<col width="30%"></col>
				<col></col>
			</colgroup>
			<tbody>
				<tr>
					<td>Rule name</td>
					<td><input type="text" name="context_name" class="styled" size="40" ></input></td>
				</tr>
				<tr>
					<td>Rule type</td>
					<td>
					<select name="rule_condition" class="styled">
						<option value="0">Success rule</option>
						<option value="-1">Failure rule</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>Rule Description</td>
					<td><input type="text" name="context_desc" class="styled" size="40" ></input></td>
				</tr>
				<tr>
					<td>Rule script</td>
					<td><textarea class="form-control" rows="3" name="rule"></textarea></td>
				</tr>
				<tr>
					<td>message</td>
					<td><textarea class="form-control" rows="3" name="msg"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="button" class="button white" style="font: bold 13px 돋움체;margin-left: 5px;margin-top: 5px;" value="Save rules" onClick="javascript:saveRule();"></input>
					<input type="button" class="button white" style="font: bold 13px 돋움체;margin-left: 5px;margin-top: 5px;" value="close" onClick="javascript:fnShowOrHide('div_save_rule');"></input>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>


<div id="div_action_info" style="position:absolute;display:none;background-color:white;border: 2px double #CCCCCC;padding: 10px 10px; width:400px;height:400px;overflow:auto;z-index:200;clear:both">
	<p style="clear:both;height:10px"></p>
	<ul style="list-style:none ;padding: 10px 25px 10px 25px;  clear: both;">
	<li>&nbsp;<a style="text-decoration:none;" href='javascript:fnShowOrHide("div_action_info");'><img src='/jsp/anaconda/img/close.png' width='20px' height='20px' border='0' align='absmiddle' />&nbsp;close</a></li>
	<hr></hr>
	<div id="div_action_data" style="position:absolute;display:block;clear:both" ></div>
	</ul>
</div>


<div id="div_action_input" style="position:absolute;display:none;background-color:white;border: 2px double #CCCCCC;padding: 10px 10px;z-index:200;">
	<form name="frmAction" method="post" action="/Anaconda.do">
	<input type="hidden" name="CMD" value=""></input>
	<input type="hidden" name="seq" value=""></input>
	<input type="hidden" name="context_seq" value=""></input>
	<input type="hidden" name="min_seq" value=""></input>
	<input type="hidden" name="code" value=""></input>
	<input type="hidden" name="context_name" value=""></input>
	<input type="hidden" name="x" value=""></input>
	<input type="hidden" name="y" value=""></input>
	<table border="0" cellpadding="2" cellspacing="0" width="500px" height="60px">
	<caption><b><div id="div_action_title"></div></b></caption>
	<colgroup>
	<col width="30%"></col>
	<col></col>
	</colgroup>
	<tbody>
	<tr>
	<td>Action type</td>
	<td>
	<select name="keyword" class="styled">
		<option value="BScript" selected>Before Script</option>
		<option value="BService">Before Service</option>
		<option value="TService">Then Service</option>
		<option value="AScript">After Script</option>
		<option value="AService">After Service</option>
		<option value="EService">Else Service</option>
	</select>
	</td>
	</tr>
	<tr>
	<td>action</td>
	<td>
	<input type="text" class="styled" name="keyword_desc" />
	</td>
	</tr>
	<tr>
	<td colspan="2" >
	<input type="button" class="button white" style="font: bold 13px 돋움체;margin-left: 5px;margin-top: 5px;" value="Save" onClick="javascript:saveAction();"></input>
	<input type="button" class="button white" style="font: bold 13px 돋움체;margin-left: 5px;margin-top: 5px;" value="Close" onClick="javascript:fnShowOrHide('div_action_input');"></input>
	</td>
	</tr>
	</tbody>
	</table>
	</form>
</div>



<!-- 키워드위치이동 화면 --> 
<div id="div_rule_move" style="position:absolute;display:none;background-color:white;border: 2px double #CCCCCC;padding: 10px 10px;z-index:200;">
	<form name="frmRuleMove" method="post" action="/Anaconda.do">
		<input type="hidden" name="CMD" value=""></input>
		<input type="hidden" name="seq" value=""></input>
		<input type="hidden" name="parent_seq" value=""></input>
		<input type="hidden" name="min_seq" value=""></input>
		<input type="hidden" name="code" value=""></input>
		<input type="hidden" name="context_name" value=""></input>
		<input type="hidden" name="kind" value="MSG"></input>
		<input type="hidden" name="x" value=""></input>
		<input type="hidden" name="y" value=""></input>
		<table border="0" cellpadding="2" cellspacing="0" width="500px" height="60px">
			<colgroup>
				<col width="30%"></col>
				<col></col>
			</colgroup>
			<tbody>
				<tr>
					<td>Move below the selected rule.</td>
					<td>
						<div id='div_select_rule'>
							<select id='select_rule' name='select_rule'>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" >
						<input type="button" class="button white" style="font: bold 13px 돋움체;margin-left: 5px;margin-top: 5px;" value="Save" onClick="javascript:saveRuleMove();"></input>
						<input type="button" class="button white" style="font: bold 13px 돋움체;margin-left: 5px;margin-top: 5px;" value="Close" onClick="javascript:fnShowOrHide('div_rule_move');"></input>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>  

<script language="javascript">
var keywordManager = new KeywordManager();

function doRuning(callerName)
{
	showRunning(callerName);
}
//#############################################################
// AJAX Call

// Rule List
// subRule List
// Rule View
// Rule Create
// Rule Update
// Rule Delete
// Action View
// Action Create
// Action Update
// Action Delete
//#############################################################
function doRun(callerName , REQ)
{
	if(callerName == 'getActionInfo')	{
		var object = parseAnacondaAJAXFromBusinessCollection(REQ.responseXML);
		var strData = '';
	  	keywordManager.seq = object.request.seq;
		keywordManager.keyword = object.request.keyword;  
		keywordManager.keyword_desc = object.request.keyword_desc;  

		fnShowOrHide("div_action_input");
		var oDivView = _('div_action_input');
		oDivView.style.left = object.request.x;
		oDivView.style.top = object.request.y;

		with(frmAction){
	  	  	if(object.response.length != 0)	{
				keywordManager.seq = object.request.seq;
 				keywordManager.keyword = object.response[0].keyword;  
				keywordManager.keyword_desc = object.response[0].keyword_desc;  
				seq.value = object.request.seq;
			  	keyword.value = TextToHtml(object.response[0].keyword);
			  	keyword_desc.value = TextToHtml(object.response[0].keyword_desc);
			  	keywordManager.createOrUpdate = "updateAction";
		  	}else	{
				keywordManager.seq = object.request.seq;
 				keywordManager.keyword = object.request.keyword;  
				keywordManager.keyword_desc = '';  
				seq = object.request.seq;
			  	keyword.value = object.request.keyword;  
			  	keyword_desc.value = '';
			  	keywordManager.createOrUpdate = "saveAction";
		  	}
	  	}
	}else if(callerName == 'getRuleInfo'){
		var object = parseAnacondaAJAXFromBusinessCollection(REQ.responseXML);
		var strData = '';
		fnShowOrHide("div_save_rule");
		var pos = getCurrentPosition();
		var div = _('div_save_rule');
		div.style.left = object.request.x;
		div.style.top = object.request.y;
	  	with(frmRule)
	  	{
	  	  	if(object.response.length != 0)
		  	{
				if(object.response[0].parent_seq == '-1'){
					rule_condition.disabled = true;
				}else{
					rule_condition.disabled = false;
				}
				keywordManager.seq = object.request.seq;
 				keywordManager.rule = object.response[0].rule;  
				keywordManager.context_name = object.response[0].context_name;  
				keywordManager.context_desc = object.response[0].context_desc;  
				keywordManager.rule_condition = object.response[0].rule_condition;  
				keywordManager.msg = object.response[0].msg;  

				rule.value = TextToHtml(object.response[0].rule);
			  	context_name.value = TextToHtml(object.response[0].context_name);
			  	context_desc.value = TextToHtml(object.response[0].context_desc);
				rule_condition.value = object.response[0].rule_condition;
				msg.value = object.response[0].msg;  
			  	keywordManager.createOrUpdate = "updateRule";
		  	}
		  	else
		  	{
				keywordManager.seq = object.request.seq;
 				keywordManager.rule = '';  
				keywordManager.context_name = '';  
				keywordManager.context_desc = '';  
				keywordManager.msg = '';  
			  	context_name.value = '';
			  	context_desc.value = '';
				msg.value = '';
			  	keywordManager.createOrUpdate = "saveRule";
		  	}
	  	}
	}else if(callerName == 'countSubRule'){
		var object = parseAnacondaAJAXFromBusinessCollection(REQ.responseXML);
	  	var count = object.response[0].count;  
		var iCnt = parseInt(count);
		if(iCnt < 2){
			keywordManager.createRule();
		}else{
			alert('You can not register more than one rule.');
			return;
		}
	}else if(callerName == 'updateAction'){
		var object = parseAnacondaAJAXFromBusinessCollection(REQ.responseXML);
		var strData = '';
		fnShowOrHide("div_action_input");
		var pos = getCurrentPosition();
		var div = _('div_action_input');
		div.style.left = object.request.x;
		div.style.top = object.request.y;
	  	with(frmAction)
	  	{
	  	  	keywordManager.seq = object.request.seq;
 			keywordManager.keyword = object.request.keyword;  
		  	if(object.response.length != 0)
		  	{
			  	keyword_desc.value = TextToHtml(object.response[0].keyword_desc);
			  	keywordManager.createOrUpdate = "updateAction";
		  	}
		  	else
		  	{
		  		keyword.value = '';
			  	keywordManager.createOrUpdate = "saveAction";
		  	}
	  	}
	}
	else if(callerName == 'getRuleContextList' || callerName == 'getSubRuleContextList' || callerName == 'getParentRuleContextList')
	{
		var object = parseAnacondaAJAXFromBusinessCollection(REQ.responseXML);
		if(object.error != "")
			alert("ERROR=" + object.error);
		else
		{
			if(keywordManager.depth >= 5 ) return;
			if(callerName != 'getSubRuleContextList' && (object.length == null 
			|| object.length == "" 
			|| object.response[0] == null 
			|| object.response[0].seq == null)){
				history.back();
				return;
			}

			if(callerName == 'getRuleContextList' || callerName == 'getParentRuleContextList'){
				if(object.response[0].parent_seq == "-1") frmParentRuleTree.seq.value = "1";
				else frmParentRuleTree.seq.value = object.response[0].parent_seq;
				frmRuleTree.seq.value = object.response[0].seq;
				frmRuleTree.parent_seq.value = object.response[0].parent_seq;
			}

			var div = keywordManager.appendKeywordList(object);
			var count = parseInt(object.length);
			for(var i=0 ; i < count ; i++){
				keywordManager.getSubRuleContextList(object.response[i].seq,keywordManager.getKeywordID(i));
			}
		}
    }
	else
	{
		alert("Successfully applied.");
		var t = Math.floor(Math.random()*1000);
		window.location.href = window.location.href + '&rn=' + t;
	}
}

function fnShowHomeMenu(seq,divName)
{
  var pos = getCurrentPosition();
  var div = _(divName);
  div.style.left = pos.x + 'px';
  div.style.top = pos.y + 'px';
  fnShowOrHide(divName);
  keywordManager.seq = seq;
}


function fnShowMenu(arg1,arg2,arg3,arg4)
{
  var pos = getCurrentPosition();
  var div = _('div_rule_menu');
  div.style.left = pos.x + 'px';
  div.style.top = pos.y + 'px';
  fnShowOrHide("div_rule_menu");
  keywordManager.seq = arg1;
  keywordManager.min_seq = arg3;
  keywordManager.context_name = arg4;  
  with(frmRuleTree){
   	context_name.value = arg4;
  }
}

//##############################################################
// KEYWORD Manager
//##############################################################
function KeywordManager()
{
	var seq;
	var min_seq;
	var context_name;
	var rule;
	var context_desc;
	var rule_condition;
	var createOrUpdate;
	var depth;
	var option;
	var keyword;
	var keyword_desc;
	var msg;
	var kind;
	var parent_seq;

	this.depth = 0;
	this.option = "";
}
KeywordManager.prototype.getNextRuleContextList = function(){
	document.location.href = '/Anaconda.do?CMD=CMD_SEQ_102838910731495757776566&seq='+this.seq+'&min_seq='+this.min_seq;
}
KeywordManager.prototype.countSubRule = function(){
	with(frmRule){
		seq.value = this.seq; 
		CMD.value = 'CMD_SEQ_105627997381495856912039';
		callAjaxByForm('countSubRule',"frmRule");
	}
}
KeywordManager.prototype.createRule = function(success){
	with(frmRule){
		rule_condition.value = '0'; 
		if(!success)rule_condition.value  = '-1'; 
		fnShowOrHide("div_save_rule");
		this.createOrUpdate = "saveRule";
	}
 }
KeywordManager.prototype.getKeywordID = function(idx){
   return "div_subkeywordinfo_tr" + "_" + this.depth + "_" + idx
}
KeywordManager.prototype.showRuleMove = function(){
	fnShowOrHide("div_rule_move");
	var pos = getCurrentPosition();
	var div = _('div_rule_move');
  	div.style.left = pos.x+'px';
  	div.style.top = pos.y + 'px';
}
KeywordManager.prototype.saveRule = function(){
	with(frmRule){
		if(context_name.value == '') {
			alert("Please enter a rule name");
			return;
		}
		seq.value = this.seq;
		min_seq.value = this.min_seq;
		if(keywordManager.createOrUpdate == 'saveRule'){
			CMD.value = "CMD_SEQ_102874264551495784790279";
			code.value = 'saveRule';
			callAjaxByForm('saveRule',"frmRule");	
		}else{
			CMD.value = "CMD_SEQ_107950786481495797259992";
			code.value = 'updateRule';
			callAjaxByForm('updateRule',"frmRule");	
		}
	}
}
KeywordManager.prototype.expandRule = function(){
	with(frmRule){
		seq.value = this.seq;
		min_seq.value = this.min_seq;
		CMD.value = "CMD_SEQ_108885975071496960918576";
		code.value = 'expandRule';
		callAjaxByForm('expandRule',"frmRule");	
	}
}
KeywordManager.prototype.updateRule = function(){
	with(frmRule){
		if(context_name.value == ''){
			alert("Please enter a rule name");
			return;
		}
		seq.value = this.seq;
		min_seq.value = this.min_seq;
		CMD.value = "CMD_SEQ_107950786481495797259992";
		code.value = "updateRule";
		callAjaxByForm("updateRule","frmRule");				
	}
}

KeywordManager.prototype.saveAction = function(arg1){
	with(frmAction){
		if(keyword_desc.value == ''){
			alert("Please enter action information");
			return;
		}
		seq.value = this.seq;
		min_seq.value = this.min_seq;
		context_seq.value = this.seq;
		if(keywordManager.createOrUpdate == 'saveAction'){
			CMD.value = "CMD_SEQ_108404413371495797495662";
			code.value = 'saveAction';
			callAjaxByForm('saveAction',"frmAction");	
		}else{
			CMD.value = "CMD_SEQ_105934800371495797768298";
			code.value = 'updateAction';
			callAjaxByForm('updateAction',"frmAction");	
		}
	}
}

KeywordManager.prototype.getActionInfo= function(arg1){
	with(frmAction){
		seq.value = this.seq;
		CMD.value = "CMD_SEQ_102169349931495797764792";
		code.value = "getActionInfo";
		var pos = getCurrentPosition();
		x.value = pos.x+'px';
		y.value = pos.y + 'px';
		context_seq.value = this.seq;
		keyword.value = arg1;
		keywordManager.keyword = arg1;
		callAjaxByForm("getActionInfo","frmAction");				
	}
}

KeywordManager.prototype.getRuleInfo = function(){
	with(frmRule)
	{
		seq.value = this.seq;
		min_seq.value = this.min_seq;
		var pos = getCurrentPosition();
		x.value = pos.x+'px';
		y.value = pos.y + 'px';
		CMD.value = "CMD_SEQ_101274675111495797011194";
		code.value = "getRuleInfo";
		callAjaxByForm("getRuleInfo","frmRule");				
	}
}
KeywordManager.prototype.deleteRule = function(){
	with(frmRule){
		seq.value = this.seq;
		CMD.value = "CMD_SEQ_100350913941495861068131";
		code.value = "deleteRule";
		callAjaxByForm("deleteRule","frmRule");				
	}
}
KeywordManager.prototype.saveRuleMove = function(){
	with(frmRuleMove){
		seq.value = this.seq;
		CMD.value = "CMD_SEQ_105050443491495807338244";
		code.value = "saveRuleMove";
		callAjaxByForm("saveRuleMove","frmRuleMove");				
	}
}
KeywordManager.prototype.getParentRuleContextList = function(did){
    with(frmParentRuleTree)	{
		div_id.value = did;
		this.depth = 0;
		CMD.value = "CMD_SEQ_100301325031495772465888";
		submit();				
	}
}
KeywordManager.prototype.getRuleContextList = function(arg_seq,did){
    with(frmRuleTree){
		seq.value = arg_seq;
		this.depth = 0;
		div_id.value = did;
		CMD.value = "CMD_SEQ_109333914371495770843830";
		callAjaxByForm("getRuleContextList","frmRuleTree");				
	}
}
KeywordManager.prototype.getSubRuleContextList = function(arg_seq,did)
{
	if(arg_seq == null || arg_seq == "" || arg_seq == "null"){
		alert("No top-level rule selected.");
		return;
	}
    with(frmRuleTree){
		seq.value = arg_seq;
		div_id.value = did;
		CMD.value = "CMD_SEQ_105837084301495771929005";
		callAjaxByForm("getSubRuleContextList","frmRuleTree");				
	}
}
KeywordManager.prototype.appendKeywordList = function(arg){

	var object = arg;
	var width = 12*17;
	var height = 12*4;
	this.depth++;
			
	var div = _(object.request.div_id);

	var table = document.createElement("table");
	table.setAttribute("cellspacing","0");
	table.setAttribute("cellpadding","0");
	table.setAttribute("style","");
	table.setAttribute("align","left");
	table.setAttribute("valign","top");

	if(object.length != null && object.length != "")	{
		var count = parseInt(object.length);
		
		for(var i=0 ; i < count ; i++){
			var img_head = "word.png";
			var tr = document.createElement("tr");
			tr.className = "table_keyword";
			tr.setAttribute("align","left");
			tr.setAttribute("valign","top");
			
			var td = document.createElement("td");
			
			if(this.depth == 1){
				img_head = "home.png";
				td.setAttribute("style","");
				td.setAttribute("align","left");
				td.setAttribute("valign","top");
			}
			else{	
				if(i == 0){
					if(count == 1){
						td.className = "td_keyword";
						td.setAttribute("align","left");
						td.setAttribute("valign","top");
						var img = document.createElement("img");
						img.setAttribute("src","/jsp/bestmember/img/tree-leaf-start-no.gif");
						td.appendChild(img);
					}else	{
						td.className="td_keyword_img";
						td.setAttribute("align","left");
						td.setAttribute("valign","top");
						var img = document.createElement("img");
						img.setAttribute("src","/jsp/bestmember/img/tree-leaf-start.gif");
						td.appendChild(img);
					}
				}else if(i == count -1){
					td.className = "td_keyword";
					td.setAttribute("align","left");
					td.setAttribute("valign","top");
					var img = document.createElement("img");
					img.setAttribute("src","/jsp/bestmember/img/tree-leaf-end.gif");
					td.appendChild(img);
				}else	{
					td.className="td_keyword_img";
					td.setAttribute("align","left");
					td.setAttribute("valign","top");
					var img = document.createElement("img");
					img.setAttribute("src","/jsp/bestmember/img/tree-leaf.gif");
					td.appendChild(img);
				}
			}
			var td2 = document.createElement("td");
			td2.className = "td_keyword2";
			td2.setAttribute("width",width+"px;");
			td2.setAttribute("align","left");
			td2.setAttribute("valign","top");
			var div2 = document.createElement("div");
			// div2.className = "div_keyword_element";

			div2.setAttribute("align","left");
			var a = document.createElement("a");
			a.className="a_keyword";
			a.setAttribute("href","javascript:fnNull();");

			var img1 = document.createElement("img");
			img1.setAttribute("src","/jsp/bestmember/img/"+img_head);
			img1.setAttribute("width","20");
			img1.setAttribute("height","20");
			img1.setAttribute("border","0");
			img1.setAttribute("align","absmiddle");
			
			if(object.response[i].parent_seq == -1) {
				a.setAttribute("onClick","javascript:fnShowHomeMenu('"+object.response[i].seq+"','div_home_menu');;");
				div2.className = "div_keyword_home";
				a.innerHTML =   "<img src='/jsp/bestmember/img/home.png' width='20'>"   +  "&nbsp;<b>" + object.response[i].rule + "</b>&nbsp;&nbsp;"  ;
			}else{
				 a.setAttribute("onClick","javascript:fnShowMenu('"+object.response[i].seq+"','','','" +object.response[i].context_name+"');");
				 if(object.response[i].rule_condition == 'true' || object.response[i].rule_condition == '0') {
					 div2.className = "div_keyword_true";
					 a.innerHTML = "<img src='/jsp/sp/img/true.png' width='15'>"  + "&nbsp;<b>" + object.response[i].rule+ '</b><p>' + object.response[i].msg + "&nbsp;&nbsp;</p>"  ;
				 } else{
					 div2.className = "div_keyword_false";
					 a.innerHTML =  "<img src='/jsp/sp/img/false.png' width='15'>"   +  "&nbsp;<b>"  + object.response[i].rule+ '</b><p>' + object.response[i].msg + "&nbsp;&nbsp;</p>"  ;
				 }
			}

			var chk = document.createElement("a");

			chk.setAttribute("href","javascript:fnNull();");
            chk.setAttribute("onClick","javascript:fnShowCreate('"+object.response[i].seq +"','" +object.response[i].context_name+"');");
			var img1_1 = document.createElement("img");
			img1_1.setAttribute("src","/jsp/anaconda/img/check.png");
			img1_1.setAttribute("width","15");
			img1_1.setAttribute("height","15");
			img1_1.setAttribute("border","0");
			img1_1.setAttribute("align","absmiddle");
            chk.appendChild(img1_1);

            var chk2 = document.createElement("a");
			chk2.setAttribute("href","javascript:fnNull();");
            chk2.setAttribute("onClick","javascript:goNextPage('"+object.response[i].seq+"','" +object.response[i].context_name+"');");
			
			var img1_2 = document.createElement("img");
			img1_2.setAttribute("src","/jsp/bestmember/img/paper.png");
			img1_2.setAttribute("width","20");
			img1_2.setAttribute("height","20");
			img1_2.setAttribute("border","0");
			img1_2.setAttribute("align","absmiddle");
			
			chk2.appendChild(img1_2);

            var chk3 = document.createElement("a");
			chk3.setAttribute("href","javascript:fnNull();");
            chk3.setAttribute("onClick","javascript:fnShowAction('"+object.response[i].seq
														  +"','" +object.response[i].context_name+"');");
	
			/*
			var select = document.createElement("select");
			select.setAttribute("id","action_select");
			var action_options = [];
			var BScript = document.createElement("option");
			BScript.setAttribute("value","BScript");
			var BService = document.createElement("option");
			BService.setAttribute("value","BService");
			var TService = document.createElement("option");
			TService.setAttribute("value","TService");
			var AScript = document.createElement("option");
			AScript.setAttribute("value","AScript");
			var AService = document.createElement("option");
			AService.setAttribute("value","AService");
			var EService = document.createElement("option");
			EService.setAttribute("value","EService");
			action_options.push(BScript);
			action_options.push(BService);
			action_options.push(TService);
			action_options.push(AScript);
			action_options.push(AService);
			action_options.push(EService);
			select.appendChild(action_options);
			*/

			var img1_3 = document.createElement("img");
			img1_3.setAttribute("src","/jsp/bestmember/img/write.png");
			img1_3.setAttribute("width","15");
			img1_3.setAttribute("height","15");
			img1_3.setAttribute("border","0");
			img1_3.setAttribute("align","absmiddle");
			
			chk3.appendChild(img1_3);

			//div2.appendChild(chk);
			div2.appendChild(chk2);
			//div2.appendChild(chk3);
			div2.appendChild(a);
			td2.appendChild(div2);

			var td3 = document.createElement("td");
			td3.className = "td_keyword2";
			td3.setAttribute("align","left");
			td3.setAttribute("valign","top");			
			td3.setAttribute("id",this.getKeywordID(i));
			// td3.innerHTML = "MORE";

			var a2  =document.createElement("a");
			a2.className = "a_keyword";
			a2.setAttribute("href","javascript:fnNull();");
			a2.setAttribute("onClick","javascript:goNextPage('"+object.response[i].seq
														  +"','" +object.response[i].context_name+"');");
			var img2 = document.createElement("img");
			img2.setAttribute("src","/jsp/bestmember/img/more.png");
			img2.setAttribute("width","20");
			img2.setAttribute("height","20");
			img2.setAttribute("border","0");
			img2.setAttribute("align","absmiddle");
			a2.innerHTML = '&nbsp;';
			a2.appendChild(img2);
			
			td3.appendChild(a2);

			var opt = document.createElement("option");
			opt.setAttribute("value",object.response[i].seq);
			opt.innerHTML = object.response[i].context_name;

			var select = _("select_rule");
			select.appendChild(opt);

			tr.appendChild(td);
			tr.appendChild(td2);
			tr.appendChild(td3);
			table.appendChild(tr);
		}
		div.innerHTML = table.outerHTML;
	}
	return div;
}
function rzCC(s){
  for(var exp=/-([a-z])/; 
      exp.test(s); 
      s=s.replace(exp,RegExp.$1.toUpperCase()));
  return s;
}

function _setStyle(element, declaration) {
  if (declaration.charAt(declaration.length-1)==';')
    declaration = declaration.slice(0, -1);
  var k, v;
  var splitted = declaration.split(';');
  for (var i=0, len=splitted.length; i<len; i++) {
     k = rzCC(splitted[i].split(':')[0]);
     v = splitted[i].split(':')[1];
     eval("element.style."+k+"='"+v+"'");

  }
}

function fnShowCreate(arg1,arg2){
  var pos = getCurrentPosition();
  keywordManager.seq = arg1;
  keywordManager.context_name = arg2;  
  with(frmRule)  {
   	context_name.value = arg2;
  }
  goCreate();
}

function fnShowRule(arg1,arg2){
  var pos = getCurrentPosition();
  keywordManager.seq = arg1;
  keywordManager.context_name = arg2;  
  with(frmRule){
   	context_name.value = arg2;
  }
  goShowRule();
}

function fnShowAction(arg1,arg2){
  var pos = getCurrentPosition();
  keywordManager.seq = arg1;
  keywordManager.context_seq = arg1;
  keywordManager.keyword = arg2;  
  with(frmAction){
   	keyword.value = arg2;
  }
  goShowAction();
}

function goShowRule(){
	keywordManager.getRuleInfo();
}
function goShowAction(){
	with(frmMenu){
		var sel = menu_keyword.value;
		keywordManager.getActionInfo(sel);
	}
}
function goCreate(){
	var pos = getCurrentPosition();
	var div = _('div_save_rule');
	div.style.left = pos.x+'px';
	div.style.top = pos.y +'px';
	keywordManager.countSubRule();
}
function goExpandRule(){
	var pos = getCurrentPosition();
	var div = _('div_save_rule');
	div.style.left = pos.x+'px';
	div.style.top = pos.y +'px';
	keywordManager.expandRule();
}
function goDelete(){
	if(confirm('Delete really?')){
		keywordManager.deleteRule();
	}
}
function goRuleMove(){
	keywordManager.showRuleMove();
}
function saveRule(){
	keywordManager.saveRule();	
}
function saveAction(){
	keywordManager.saveAction();	
}
function saveRuleMove(){
	keywordManager.saveRuleMove();
}

function goNextPage(arg1,arg2){
  var pos = getCurrentPosition();
  keywordManager.seq = arg1;
  keywordManager.context_name = arg2;  
  with(frmRuleTree){
   	context_name.value = arg2;
  }
  keywordManager.getRuleContextList(arg1,'div_rule_tree');
  // keywordManager.getNextRuleContextList();
}


</script>

<%
String strData = "";
String strBeforeSeq = "";
RequestHelper helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
String min_seq = request.getParameter("min_seq");
if(BusinessHelper.checkBusinessNull(min_seq)){
	helper.setCookie("","min_seq",min_seq,-1);
}else{
	min_seq = helper.getCookie("min_seq");
}
StringBuffer keyword = new StringBuffer();
String parent_seq = "1";
%>

<div class="container-fluid" style="z-index:10">

			<!-- Rule Tree -->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fa fa-fw fa-sitemap"></i> Rule Management
                </div>
				
					<p style="height:10px"></p>
					<div style="margin:10px">
					<a style='text-decoration:none;' href='/Anaconda.do?CMD=CMD_SEQ_102838910731495757776566'><i class="fa fa-fw fa-sign-out"></i>&nbsp;Top</img></a>
					&nbsp;
					<a style='text-decoration:none;' href='javascript:keywordManager.getParentRuleContextList("div_rule_tree");'><i class="fa fa-fw fa-share"></i>&nbsp;Previous</img></a>
					</div>

					<div style="padding-left:10px;padding-top:10px;display:block;" id="div_rule_tree">
					<p height="20px">&nbsp;</p>
					</div>

					<p style="height:10px"></p>


		
                <div class="card-footer small text-muted" style="z-index:10">
                    Rule script is very important . please be careful.
                </div>
            </div>

</div>

<script language="javascript">
function selectRuleGroup(sel){
		
}

<%
String getMinSeq = "";
String init_seq = request.getParameter("seq");
BusinessCollection bc = RequestHelper. getBusinessCollection(request,"getMinSeq");
if(bc != null && bc.size() > 0){
		getMinSeq = bc.getBusinessData(0).getFieldValue("seq");
}
if(!BusinessHelper.checkBusinessNull(init_seq)){
   init_seq = getMinSeq;
}
%>
keywordManager.getRuleContextList(<%=init_seq%>,'div_rule_tree');
</script>
