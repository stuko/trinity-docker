<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.Auth.*"%>

<%
	String seq = request.getParameter("seq");
%>

<style>
.home
{
	background:#CCFFFF; 
	font:none 12px dotum,Arial,Sanserif;
	color:#333333;
	margin:2px 0 2px 0;
	padding:16px 16px 16px 16px;border: 1px double #CCCCCC;
	float: left;
        width:400px;  
}

.dialog
{
	background:#FFFFCC; 
	font:none 12px dotum,Arial,Sanserif;
	color:#333333;
	margin:2px 0 2px 0;
	padding:16px 16px 16px 16px;border: 1px double #CCCCCC;
	float: left;
        width:400px;
}

.more
{
	border:0;
	float: left;
	align:absmiddle;
	padding:16px 16px 16px 16px;
	vertical-align:middle;
}

.more_img
{
	border:0;
	width:20px;
	height:20px;
	float: left;
	align:absmiddle;
	vertical-align:middle;
}

.dialogs
{
	padding:16px 16px 16px 16px;
}

.talk
{
	width:360px;
	height:100px;
	border: 1px double #CCCCCC;
	margin : 3px;
}
.if
{
	width:300px;
	border: 1px double #CCCCCC;
	margin : 3px;
}
.talking
{
	
}
</style>
 <div class="container-fluid">

<h3 class="page-header"><img src="/jsp/sp/img/talk.png" width="40px">&nbsp;  Edit dialog scenario </h3>
<p>Determine the conversation topic in the selection box below, then create a scenario.</p>

	<div id="choiceContext">
			<select id="selTalk" onChange="javascript:changeTalk(this);">
					<option value=''>선택</option>
				</select>
	</div>
	<div id="dialogs" class="dialogs">
	</div>

<div id='templateHome' style='display:none;'>
	<form name="frmTemplateHome" id="#FORM_ID">
	<input type="hidden" name="seq"  value=""  id="#SEQ_ID">
	<input type="hidden" name="parent_seq"  value="" id="#P_SEQ_ID">
	<input type="hidden" name="kind"  value="" id="#KIND_ID">
	<input type="hidden" name="rule_group"  value="" id="#GROUP_ID">
	<div id="home" class="home">
		<div id="start" class="start">
			<div style="display:none;">
				조건 : &nbsp;<input type="text" id="#RULE_ID" name="rule" class="if" />
			</div>
			<div>
				<textarea  id="#MSG_ID" name="msg" class="talk"></textarea>
			</div>
			<div>
					<input type="button" class="btn btn-primary" value="저장" onClick="javascript:updateDialog('#SEQ_ID','#MSG_ID');"></input>&nbsp;
					<input id="#DEL_ID" type="button" class="btn btn-primary" value="추가" onClick="javascript:AddTemplate(true, '#DEL_ID','#template','#NEW_ID');"></input>	
			</div>
		</div>
	</div>
	</form>
</div>


<div id='template' style='display:none;'>
		<form name="frmTemplate" id="#FORM_ID">
		<input type="hidden" name="seq"  value=""   id="#SEQ_ID">
		<input type="hidden" name="parent_seq"  value=""   id="#P_SEQ_ID">
		<input type="hidden" name="kind"  value=""   id="#KIND_ID">
		<input type="hidden" name="rule_group"  value=""   id="#GROUP_ID">
		<div id="more" class="more">
			<img src="/jsp/bestmember/img/more.png" class="more_img" />
		</div>
		<div id="dialog" class="dialog">
			<div id="talking" class="talking">
			<div style="display:none;">
				조건 : &nbsp;<input type="text" id="#RULE_ID" name="rule" class="if" />
			</div>
			<div>
				<textarea  id="#MSG_ID" name="msg" class="talk"></textarea>
			</div>
				<div>
						<input type="button" class="btn btn-primary" value="Save" onClick="javascript:updateDialog('#SEQ_ID','#MSG_ID');"></input>&nbsp;
						<input id="#DEL_ID" type="button" class="btn btn-primary" value="Add" onClick="javascript:AddTemplate(true, '#DEL_ID','#template', '#NEW_ID');"></input>	&nbsp;
						<input type="button" class="btn btn-primary" value="Delete" onClick="javascript:DelTemplate('#DIV_ID', '#P_SEQ_ID');"></input>
				</div>
			</div>
		</div>
		</form>
</div>
</div>
<script language="javascript">
	function uuid(){
	   var chars = '0123456789abcdef'.split('');
	   var uuid = [], rnd = Math.random, r;
	   uuid[8] = uuid[13] = uuid[18] = uuid[23] = '-';
	   uuid[14] = '4'; // version 4
	   for (var i = 0; i < 36; i++){
	      if (!uuid[i]){
	         r = 0 | rnd()*16;
	         uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r & 0xf];
		  }
	   }
	   return uuid.join('');
	}
	
	function getTemplate(tid , nSeq){
		var div = uuid();
		var r = uuid();
		var m = uuid();
		var a = uuid();
		var d = uuid();
		var f = uuid();
		var s = uuid();
		var p = uuid();
		var k = uuid();
		var g = uuid();
		var n = $("<div id= '"+div+"'></div>").html($( tid ).html().replace(/#DEL_ID/g,d).replace(/#ADD_ID/g,a).replace(/#RULE_ID/g,r).replace(/#MSG_ID/g,m).replace(/#FORM_ID/g,f).replace(/#SEQ_ID/g,s).replace(/#P_SEQ_ID/g,p).replace(/#KIND_ID/g,k).replace(/#GROUP_ID/g,g).replace(/#NEW_ID/g,nSeq).replace(/#DIV_ID/g,div));
		var rtn = {template : n , rid : r ,mid : m ,aid : a , did : d , fid : f, sid : s , pid : p, kid : k , gid : g , nid : nSeq , id : div};
		return rtn;
	}

	function AddTemplate(b , delID, id , nSeq){
		$('#'+delID).detach();
		insertDialog(b, delID, id, nSeq);
	}

	function DelTemplate(delID,seqID){
		if(confirm('Really delete ['+seqID+']['+$('#'+seqID).val()+']?')){
			// $('#'+delID).detach();
			deleteDialog($('#'+seqID).val());
		}
	}

	window.onload = function(){
		init('<%=seq%>');
	}

	function init(s){
		loadDepth = 0;
		$( "#dialogs" ).empty();

		var d = {CMD:'CMD_SEQ_109246742041499839614850', kind:'MSG'}
		$.ajax({
				  url:"/Anaconda.json",
				  type:"POST",
				  headers: { 
					"Accept" : "application/json; charset=utf-8" , "charset" : "utf-8"
				  },
				  data:d,
				  dataType:"json",
				  success: function (data) {
                    
					for (i = 0; i < data.RuleContextGroupList.length; i++)
					{ 
						if ( $("#selTalk option[value='"+data.RuleContextGroupList[i].seq+"']").length == 0 ){
							 $('#selTalk').append($('<option>',
							 {
								value: data.RuleContextGroupList[i].seq,
								text : data.RuleContextGroupList[i].context_name
							}));
						}
					}

				  }
				});
	  if(s != null && s != ''){loadDialog(s);}
	}
	//-----------------------------------------------------
	// Business Logic
	//-----------------------------------------------------
	var loadDepth = 0;
	
	function changeTalk(sel){
		init(sel.options[sel.selectedIndex].value);
	}
	
	function loadDialog(s){
		if(s == null || s == ''){
			s = '-1';
		}
		var d= {seq : s , CMD:'CMD_SEQ_107185695031500701970895'};
		
		$.ajax({
			  url:"/Anaconda.json",
			  type:"POST",
			  headers: { 
				"Accept" : "application/json; charset=utf-8" , "charset" : "utf-8"
			  },
			  data:d,
			  dataType:"json",
			  success: function (data) {
				  alert(JSON.stringify(data)); 
				  if(data.DialogList && data.DialogList.length != 0){
					    var tmp = null; var nid = null;
						if(data.DialogList.length == 2) nid = data.DialogList[1].seq;

						if(loadDepth == 0){
							tmp = AddDialog( '#templateHome' , nid);
							if(data.DialogList[1].CNT && data.DialogList[1].CNT != '0') $('#'+tmp.did).detach();
						}else tmp = AddDialog( '#template' , nid);

						loadDepth++;

						$('#'+tmp.sid).val(data.DialogList[0].seq);
						$('#'+tmp.pid).val(data.DialogList[0].parent_seq);
						$('#'+tmp.rid).val(data.DialogList[0].rule);
						$('#'+tmp.mid).val(data.DialogList[0].msg);
						$('#'+tmp.kid).val(data.DialogList[0].kind);
						$('#'+tmp.gid).val(data.DialogList[0].rule_group);

						if(data.DialogList.length == 2 && data.DialogList[1].CNT && data.DialogList[1].CNT != '0') {
							$('#'+tmp.did).detach();
							loadDialog(data.DialogList[1].seq);
						}

				  }
			  }
			});
	}
	function insertDialog(b, delID, id, nSeq){
		if(b){
			if(nSeq == null || nSeq == '') return;
			var d= {seq : nSeq,CMD:'CMD_SEQ_107249762101500762248085'  };
					
			$.ajax({
				  url:"/Anaconda.json",
				  type:"POST",
				  headers: { 
					"Accept" : "application/json; charset=utf-8" , "charset" : "utf-8"
				  },
				  data:d,
				  dataType:"json",
				  success: function (data) {
					  if(data.getFRule && data.getFRule.length > 0){
							var tmp = AddDialog(id,data.getFRule[0].seq);
							$("#"+tmp.sid).val(data.getTRule[0].seq);
					  }
				  }
				});
		}else{
			AddDialog(id, nSeq);
		}
	}

	function AddDialog(id, nSeq){	
		var r =  getTemplate(id, nSeq);
		$( "#dialogs" ).append(r.template);
		return r;
	}

	function updateDialog(seqID,msgID){
		
		if(seqID == null || seqID == '') return;

		var d= {seq : $('#'+seqID).val() , msg : $('#'+msgID).val() ,CMD:'CMD_SEQ_101439550581500735517521'  };
				
		$.ajax({
			  url:"/Anaconda.json",
			  type:"POST",
			  headers: { 
				"Accept" : "application/json; charset=utf-8" , "charset" : "utf-8"
			  },
			  data:d,
			  dataType:"json",
			  success: function (data) {
				    alert('Your edits are reflected normally.');
			  }
			});

	}
	function deleteDialog(seqID){
		if(seqID == null || seqID == '') return;
		var d= {seq : seqID , CMD:'CMD_SEQ_100184002351500771152979'  };
				
		$.ajax({
			  url:"/Anaconda.json",
			  type:"POST",
			  headers: { 
				"Accept" : "application/json; charset=utf-8" , "charset" : "utf-8"
			  },
			  data:d,
			  dataType:"json",
			  success: function (data) {
				    init($("#choiceContext option:selected").val());
			  }
			});

	}
</script>
