<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.action.*"%>
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%
String rule_group = request.getParameter("rule_group");
String kind = request.getParameter("kind");
String getMinSeq = "";
String init_seq = request.getParameter("seq");
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getMinSeq");
if(bc != null && bc.size() > 0){
    getMinSeq = bc.getBusinessData(0).getFieldValue("seq");
}
if(!BusinessHelper.checkBusinessNull(init_seq)){
   init_seq = getMinSeq;
}
if(rule_group == null || rule_group.equals("")){
%>
  <script language="javascript">
    alert("Rule group information does not exist.");
    history.back();
  </script>
<%
}
%>

<style>

.div_keyword_true
{
  background:#FFFFCC; 
  font:none 12px dotum,Arial,Sanserif;
  color:#333333;
  margin:2px 0 2px 0;
  padding:6px 6px 6px 6px;border: 1px double #CCCCCC;
  width:220px;
  word-break:break-all;
}

.div_keyword_false
{
  background:#FFCCCC; 
  font:none 12px dotum,Arial,Sanserif;
  color:#333333;
  margin:2px 0 2px 0;
  padding:6px 6px 6px 6px;border: 1px double #CCCCCC;
  width:220px; 
  word-break:break-all;
}

.div_keyword_home 
{
  background:#CCFFFF; 
  font:none 12px dotum,Arial,Sanserif;
  color:#333333;
  margin:2px 0 2px 0;
  padding:6px 6px 6px 6px;border: 1px double #CCCCCC;
  width:220px;
  word-break:break-all;
}

.div_keyword_has_child 
{
  background:#CCCCFF; 
  font:none 12px dotum,Arial,Sanserif;
  color:#333333;
  margin:2px 0 2px 0;
  padding:6px 6px 6px 6px;border: 1px double #CCCCCC;
        width:220px;
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
<input type="hidden" name="rule_group" value="<%=rule_group%>"></input>
<input type="hidden" name="kind" value="<%=kind%>"></input>
<input type="hidden" name="x" value=""></input>
<input type="hidden" name="y" value=""></input>
<input type="hidden" name="msg" value=""></input>
<input type="hidden" name="sql_statement" value=""></input>
<input type="hidden" name="attachments" value=""></input>
<input type="hidden" name="priority" value=""></input>
<input type="hidden" name="delimeter" value=""></input>
<input type="hidden" name="anaconda_db_seq" value=""></input>
</form>

<form name="frmParentRuleTree" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD" value=""></input>
<input type="hidden" name="seq" value="<%=init_seq%>"></input>
<input type="hidden" name="parent_seq" value=""></input>
<input type="hidden" name="div_id" value=""></input>
<input type="hidden" name="context_seq" value=""></input>
<input type="hidden" name="min_seq" value=""></input>
<input type="hidden" name="code" value=""></input>
<input type="hidden" name="context_name" value=""></input>
<input type="hidden" name="rule_group" value="<%=rule_group%>"></input>
<input type="hidden" name="kind" value="<%=kind%>"></input>
<input type="hidden" name="x" value=""></input>
<input type="hidden" name="y" value=""></input>
<input type="hidden" name="msg" value=""></input>
<input type="hidden" name="sql_statement" value=""></input>
<input type="hidden" name="attachments" value=""></input>
<input type="hidden" name="priority" value=""></input>
<input type="hidden" name="delimeter" value=""></input>
<input type="hidden" name="anaconda_db_seq" value=""></input>
</form>

<!-- ------------------------------------------------------------------------- -->
<!-- Rule Tree Div & Form -->
<!-- ------------------------------------------------------------------------- -->




<div id="div_rule_menu" style="width:400px;position:absolute;display:none;background-color:white;border: 2px double #CCCCCC; z-index:200;">
  <form name="frmMenu">
    <ul style="list-style:none ;padding: 10px 25px 10px 25px;">
      <p style="height:30px">
        <img src="/jsp/bestmember/img/important.png" width="20px" height="20px" align="absmiddle"></img>&nbsp;Rule Management&nbsp;<a style="text-decoration:none;" href='javascript:fnShowOrHide("div_rule_menu");'><img src='/jsp/anaconda/img/close.png' width='20px' height='20px' border='0' align='absmiddle' />&nbsp;close</a>
      </p>
      <li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goDetail();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;More</a></li>    
      <li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goShowRule();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;Detail</a></li>
      <li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goShowRule();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;Modify</a></li>
      <li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goInsertBetween();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;Set Child Rule</a></li>
                        <li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goCreate();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;Add Rule</a></li>
      <li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goExpandRule();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;Expand Rule</a></li>
      <li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goRoot();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;룰 상위로 이동하기</a></li>
      <li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goDelete();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;룰 삭제하기</a></li>
      <li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goShowAction();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;룰 액션 보기</a> &nbsp;
      <select name="menu_keyword" id="menu_keyword" class="styled">
        <option value="BScript" selected>룰 실행전 스크립트</option>
        <option value="BService">룰 실행전 서비스</option>
        <option value="TService">룰 성공시 서비스</option>
        <option value="AScript">룰 실행후 스크립트</option>
        <option value="AService">룰 실행후 서비스</option>
        <option value="EService">룰 실패시 서비스</option>
      </select>
      </li>
      <li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goRuleMove();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;룰 위치 이동하기</a></li>
    </ul>
  </form>
</div>

<div id="div_home_menu" style="width:400px;position:absolute;display:none;background-color:white;border: 2px double #CCCCCC; z-index:200;">
  <form name="frmHomeMenu">
    <ul style="list-style:none ;padding: 10px 25px 10px 25px;">
      <p style="height:30px">
        <img src="/jsp/bestmember/img/important.png" width="20px" height="20px" align="absmiddle"></img>&nbsp;룰 정보 관리&nbsp;<a style="text-decoration:none;" href='javascript:fnShowOrHide("div_home_menu");'><img src='/jsp/anaconda/img/close.png' width='20px' height='20px' border='0' align='absmiddle' />&nbsp;닫기</a>
      </p>
      <li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goCreate();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;룰 추가하기</a></li>
      <li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goExpandRule();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;룰 확장(추가)하기</a></li>
      <li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goShowRule();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;룰 수정하기</a></li>
<li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goInsertBetween();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;하위룰 지정하기</a></li>
      <li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goRuleMove();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;룰 위치 이동하기</a></li>

    </ul>
  </form>
</div>



<div id="div_save_rule" style="position:absolute;display:none;background-color:white;border: 2px double #CCCCCC;padding: 10px 10px;z-index:200;">
  <form name="frmRule" method="post" action="/Anaconda.do">
    <input type="hidden" name="CMD" value=""></input>
    <input type="hidden" name="seq" value=""></input>
    <input type="hidden" name="RULE_CREATE" value=""></input>
    <input type="hidden" name="RULE_UPDATE" value=""></input>
    <input type="hidden" name="min_seq" value=""></input>
    <input type="hidden" name="rule_group" value="<%=rule_group%>"></input>
    <input type="hidden" name="kind" value="<%=kind%>"></input>
    <input type="hidden" name="code" value=""></input>
    <input type="hidden" name="x" value=""></input>
    <input type="hidden" name="y" value=""></input>
    <h4>룰 정보 수정<span class="fr"><a href="#" onClick="javascript:fnShowOrHide('div_save_rule');return null;"><i class="fas fa-window-close"></i></a></span></h4>
    <table class="table table-condensed">
      <colgroup>
        <col width="20%"></col>
        <col></col>
      </colgroup>

      <tbody>
        <tr>
          <td colspan="2">
          <input type="button" class="btn btn-warning" value="저장" onClick="javascript:saveRule();"></input>
          <input type="button" class="btn btn-danger"value="닫기" onClick="javascript:fnShowOrHide('div_save_rule');"></input>
          </td>
        </tr>

        <tr>
          <td>룰 이름</td>
          <td><input type="text" name="context_name" class="styled" size="40" ></input></td>
        </tr>
        <tr>
          <td>성공/실패여부</td>
          <td>
          <select name="rule_condition" class="styled">
            <option value="-1">Failure rule</option>
            <option value="0" selected>Success rule</option>
          </select>
          </td>
        </tr>
        <tr>
          <td>룰 설명</td>
          <!--td><input type="text" name="context_desc" class="styled" size="40" ></input></td-->
          <td><textarea class="form-control" rows="10" name="context_desc" id='context_desc'></textarea></td>
        </tr>
        <tr>
          <td>우선순위</td>
          <td>
          <!--
                                         <select name="priority" class="styled">
            <option value="1000">High</option>
            <option value="100">Middle</option>
            <option value="10">Low</option>
            <option value="-1">직접입력</option>
          </select>
          -->
          <input type="text" name="priority" id="priority" class="styled" size="5" value="100"></input>
          </td>
        </tr>
        <tr>
          <td>
              룰 실행 스크립트<button type="button" id="btn_help" class="btn btn-primary" onClick="javascript:showFunctionList();">Help</button>
              <div style='margin-top:10px;'>
                 <select id='factor_list' class='styled'></select>
              </div>
          </td>
          <td><textarea class="form-control" rows="10" name="rule" id='rule'></textarea></td>
        </tr>
        <tr>
          <td>구분자(기본값: ,)</td>
          <td><input type="text" name="delimeter" class="styled" size="5"></input></td>
        </tr>
                                <tr>
          <td>
            룰 결과(대화문장)
          </td>
          <td><textarea class="form-control" rows="10" name="msg"></textarea>
          <p style="color:blue;font-weight:bold">
            Button example : {=@button(1번선택,btn btn-primary,duna.button,1)}
            </p>
          </td>
        </tr>
        <tr>
          <td><input type="button" class="btn btn-info" value="Execute SQL" onClick="javascript:view('SQL','Script','Attach','Trinity','Quest','Service','Rest')"></input></td>
          <td>
          <table id="SQL" style="display:none;width:100%">
<tr><td colspan="2"><p>
If a rule is selected, enter the SQL to run after generating the message.</p></td></tr>
          <tr>
                                        <tr>
          <td>DataBase</td>
          <td>
                                         <select name="anaconda_db_seq" id="anaconda_db_seq" class="styled">
            <option value="-1">Select a database</option>
          </select>
                                        </td>
                </tr>


                                        <tr>
                                        <td style="overflow: scroll;width:650px;height:200px;" colspan="2">
when running multiple SQL statements, Please use ";+enter".<br>
< SSO Sample ><br>
INSERT INTO Token (id,account, channelId, teamId, expire, token)
Values ({=SSO코드},{=Account} , {=channelId} , {=team} , DATE_ADD(Now(), INTERVAL 10 Minute),UUID())
</td>
                                        </tr>
          <tr>
          <td colspan="2">SQL statemet : <textarea class="form-control" rows="10" name="sql_statement"></textarea></td>
                                        </tr>
          </table>
          </td>
        </tr>
        <tr>
          <td><input type="button" class="btn btn-info" value="Script" onClick="javascript:view('Script','Attach','SQL','Trinity','Quest','Service','Rest')"></input></td>
          <td>
                                        <table id="Script" style="display:none">
<tr><td colspan="2"><p>
If a rule is selected, enter the script to run before and after generating the message.</p></td></tr>
          <tr>
          <td>룰 실행전 스크립트: <textarea class="form-control" rows="8" name="RULE_BEFORE_SCRIPT"></textarea></td>
          </tr>
          <tr>
          <td>룰 실행후 스크립트: <textarea class="form-control" rows="8" name="RULE_AFTER_SCRIPT"></textarea></td>
          </tr>
          </table>
          </td>
        </tr>
        <tr>
          <td><input type="button" class="btn btn-info" value="Attach JSON" onClick="javascript:view('Attach','Script','SQL','Trinity','Quest','Service','Rest')"></input></td>
          <td>
          <table id="Attach" style="display:none">
<tr><td colspan="2"><p>
If a rule is selected, enter the JSON to append to parameters or results after generating the message.</p></td></tr>
          <tr>
          <td>JSON : <textarea class="form-control" rows="8" name="attachments"></textarea></td>
          </tr>
          </table>
          </td>
        </tr>

        <tr>
          <td><input type="button" class="btn btn-info" value="Execute Service" onClick="javascript:view('Service','Attach','Script','SQL','Trinity','Quest','Rest')"></input></td>
          <td>
          <table id="Service" style="display:none">
<tr><td colspan="2"><p>
Execute service by Spring</p></td></tr>
          <tr>
          <td>서비스 이름(룰성공시 실행): <input type="text" class="styled" name="service_name" id="service_name" value=""></td>
          </tr>
          </table>
          </td>
        </tr>
        <tr style="display:none">
          <td><input type="button" class="btn btn-info" value="Execute Trinity Command" onClick="javascript:view('Trinity', 'Service','Attach','Script','SQL','Quest','Rest')"></input></td>
          <td>
          <table id="Trinity" style="display:none">
<tr><td colspan="2"><p>
트리니티 커멘드 이름(룰성공시 실행) <span id='ref_command' style="margin-left:5px;color:red;font-weight:bold;">"Select a webaction to find Trinity command"</span></p></td></tr>
          <tr>
          <td>Trinity Command :  
             <select name="trinity_command" id="trinity_command">
              <option value="">없음</option>
              <%
               WebActionXmlResource xmlResource = WebActionXmlResource.getInstance();
	       Iterator it = xmlResource.getWebActionCollection();
               WebActionCollection webActionCollection = null;
               WebAction action = null;
               for(; it.hasNext() ; ){
                 webActionCollection = (WebActionCollection)it.next();
	         Iterator iterator = webActionCollection.iterator();
	         for(; iterator.hasNext() ;){
                   action = (WebAction)iterator.next();
                 %>
                   <option value="<%=action.getCOMMAND()%>">[<%=webActionCollection.getWEBACTION_KOR_NAME()%>]<%=action.getKOR_NAME()%></option>
                 <%
                 }
             }
            %>
            </select>
          </td>
          </tr>
          </table>
          </td>
        </tr>
        <tr>
          <td><input type="button" class="btn btn-info" value="Call REST" onClick="javascript:view('Rest','Trinity','Script','SQL','Attach','Quest','Service')"></input></td>
          <td>
          <table id="Rest" style="display:none"  class="table table-condensed">
<tr><td colspan="2"><p>
If a rule is selected, enter the URL and parameters to call after generating the message.</p></td></tr>
          <tr>
          <td>URL Template</td>
          <td>
          <select name="msgType" class="styled" onChange="javascript:setMessageFormat(this);">
            <option value="cancel">취소</option>
            <option value="telegram">Telegram</option>
            <option value="slack">Slack</option>
            <option value="facebook">Facebook</option>
            <option value="kakao">Kakao</option>
            <option value="push">SocialProject PUSH</option>
            <option value="trinity">Trinity</option>
          </select>
          </td>
          </tr>
          <tr>
          <td>URL</td>
          <td><input type="text" name="rest_url" class="styled" size="40" ></input></td>
          </tr>
          <tr>
            <td>Result</td>
            <td><input type="text" name="rest_result" class="styled" size="40" ></input></td>
          </tr>
          <tr>
            <td>Header</td>
            <td><textarea class="form-control" rows="8" name="rest_header"></textarea></td>
          </tr>
          <tr>
            <td>
             <div>
             <div>Body</div>
             <div>Telegram chat Id</div>
             <ul>
<%
bc = RequestHelper.getBusinessCollection(request,"getChannelId");
if(bc != null && bc.size() > 0){
  for(int x = 0; x < bc.size() ; x++){
%>
    <li><%=bc.getBusinessData(x).getFieldValue("channelId")%></li>
<%
  }
}
%>
             </ul>
             </div>     
            </td>
            <td><textarea class="form-control" rows="8" name="rest_body"></textarea></td>
          </tr>
          </table>
          </td>
        </tr>

        <tr>
          <td><input type="button" class="btn btn-info"  value="Add a Question" onClick="javascript:view('Quest','Script','SQL','Attach','Trinity','Service','Rest')"></input></td>
          <td>
          <table id="Quest" style="display:none"  class="table table-condensed">
          <input type="hidden" name="q_code">
          <input type="hidden" name="RuleSeq">
<tr><td colspan="2"><p>
If a rule is selected, enter the Question and Answers to send after generating the message.</p></td></tr>
          <tr>
            <td>Question</td>
            <td><input id="Subject" type="text" name="Subject" class="styled" size="36"></input></td>
          </tr>
          <tr id="factor_type" style="display:none">
            <td>Factor Type</td>
            <td>
              <select id="factor" name="factor" onChange="javascript:setFactorType();">
            </td>
          </tr>
          <tr>
            <td>Answer Type</td>
            <td>
            <select name="QuestType" id="QuestType" class="styled" onChange="javascript:changeQuestAnswer();">
              <option value="callback">Button</option>
              <option value="url">Link</option>
              <option value="switch">Switch</option>
              <option value="buttons">Keyboard</option>
              <option value="factor">Factor</option>
            </select>
            </td>
          </tr>
<script>
  function changeQuestAnswer(){
     if($('#QuestType option:selected').val() == 'factor') {
       $('#answers').hide();
       $('#factor_type').show();
       var d = {};
       post(d,'CMD_SEQ_108156965051591420806900',(res)=>{
          $('#factor').empty();
          for(var i= 0; i < res.getFactorList.length ; i++){
            $('#factor').append('<option value="'+res.getFactorList[i].seq+'">'+res.getFactorList[i].factor_name+'</option>'); 
          }
          var txt = $('#Subject').val();
          //$('#factor > option[@value='+txt+']').attr('selected','true');
          // $("#factor option").filter(function() {return this.value == txt;}).prop('selected', 'selected');
          $('#factor').val(txt);  
      },(e)=>{
          alert(e);
       });

     }else{
        $('#answers').show();
        $('#factor_type').hide();
     }
  }
  
  function setFactorType(){
    $('#Subject').val($('#factor option:selected').val());
  }

  function getMoveTargetList(){
      var d = {};
      post(d,'CMD_SEQ_107563812781614813114572',(res)=>{
          $('#select_rule').empty();
          for(var i= 0; i < res.getMoveTargetList.length ; i++){
            $('#select_rule').append('<option value="'+res.getMoveTargetList[i].seq+'">['+res.getMoveTargetList[i].seq+ ']' + res.getMoveTargetList[i].context_name+'</option>'); 
          }
      },(e)=>{
          alert(e);
      });
  }

  function add_intent(answer_id){
    var answer = $('#' + answer_id).val();      
    if(answer == ''){
      alertPopup('경고','의도로 추가할 내용을 입력해 주세요');
      return;
    }
    var d = {Subject : answer , context_name: answer};
    post(d,'CMD_SEQ_108707157681662508966558',(json)=>{
           alertPopup('성공', '의도 정보를 저장 하였습니다.');
         },(err)=>{
           alertPopup('실패', '의도 정보를 저장하지 못하였습니다. - '+ err);
         });
  }

  function add_rule(answer_id){
    var answer = $('#' + answer_id).val();      
    if(answer == ''){
      alertPopup('경고','룰로 추가할 내용을 입력해 주세요');
      return;
    }
    var d = {};
    with(frmRule){
      d['seq'] = seq.value;
      d['rule_group'] = rule_group.value;
      d['kind'] = kind.value;
      d['rule'] = "intentLike(\"" + answer + "\",90)";
      d['context_name'] = context_name.value;
    }
    console.log(d);
    post(d,'CMD_SEQ_108885975071496960918576',(json)=>{
           alertPopup('성공', '룰 정보를 저장 하였습니다.');
         },(err)=>{
           alertPopup('실패', '룰 정보를 저장하지 못하였습니다. - '+ err);
         });
  }

</script>
          <tr id='answers'>
            <td>Answer</td>
            <td>
            <input type="hidden" name="QCCode1">
            (1) &nbsp;<input type="text" name="Answer1" id="Answer1" class="styled"  ></input><button type="button" style="margin-top:4px" class="btn btn-primary" onClick="javascript:add_intent('Answer1')">의도추가</button><button type="button" style="margin-top:4px;margin-left:4px;" class="btn btn-danger" onClick="javascript:add_rule('Answer1')">룰추가</button><br/>
            <input type="hidden" name="QCCode2">
            (2) &nbsp;<input type="text" name="Answer2"  id="Answer2" class="styled"  ></input><button type="button" style="margin-top:4px" class="btn btn-primary" onClick="javascript:add_intent('Answer2')">의도추가</button><button type="button" style="margin-top:4px;margin-left:4px;" class="btn btn-danger" onClick="javascript:add_rule('Answer2')">룰추가</button><br/>
            <input type="hidden" name="QCCode3">
            (3) &nbsp;<input type="text" name="Answer3"  id="Answer3" class="styled"  ></input><button type="button" style="margin-top:4px" class="btn btn-primary" onClick="javascript:add_intent('Answer3')">의도추가</button><button type="button" style="margin-top:4px;margin-left:4px;" class="btn btn-danger" onClick="javascript:add_rule('Answer3')">룰추가</button><br/>
            <input type="hidden" name="QCCode4">
            (4) &nbsp;<input type="text" name="Answer4"  id="Answer4" class="styled"  ></input><button type="button" style="margin-top:4px" class="btn btn-primary" onClick="javascript:add_intent('Answer4')">의도추가</button><button type="button" style="margin-top:4px;margin-left:4px;" class="btn btn-danger" onClick="javascript:add_rule('Answer4')">룰추가</button><br/>
            <input type="hidden" name="QCCode5">
            (5) &nbsp;<input type="text" name="Answer5"  id="Answer5" class="styled"  ></input><button type="button" style="margin-top:4px" class="btn btn-primary" onClick="javascript:add_intent('Answer5')">의도추가</button><button type="button" style="margin-top:4px;margin-left:4px;" class="btn btn-danger" onClick="javascript:add_rule('Answer5')">룰추가</button><br/>
            <input type="hidden" name="QCCode6">
            (6) &nbsp;<input type="text" name="Answer6"  id="Answer6" class="styled"  ></input><button type="button" style="margin-top:4px" class="btn btn-primary" onClick="javascript:add_intent('Answer6')">의도추가</button><button type="button" style="margin-top:4px;margin-left:4px;" class="btn btn-danger" onClick="javascript:add_rule('Answer6')">룰추가</button><br/>
            <input type="hidden" name="QCCode7">
            (7) &nbsp;<input type="text" name="Answer7"  id="Answer7" class="styled"  ></input><button type="button" style="margin-top:4px" class="btn btn-primary" onClick="javascript:add_intent('Answer7')">의도추가</button><button type="button" style="margin-top:4px;margin-left:4px;" class="btn btn-danger" onClick="javascript:add_rule('Answer7')">룰추가</button>
            </td>
          </tr>
          </table>
          </td>
        <tr>
          <td colspan="2">
          <input type="button" class="btn btn-warning" value="저장" onClick="javascript:saveRule();"></input>
          <input type="button" class="btn btn-danger"value="닫기" onClick="javascript:fnShowOrHide('div_save_rule');"></input>
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
  <input type="hidden" name="priority" value=""></input>
  <input type="hidden" name="delimeter" value=""></input>
  <input type="hidden" name="anaconda_db_seq" value=""></input>
  <input type="hidden" name="service_name" value=""></input>
  <input type="hidden" name="trinity_command" value=""></input>

  <table  class="table table-condensed">
  <caption><b><div id="div_action_title"></div></b></caption>
  <colgroup>
  <col width="30%"></col>
  <col></col>
  </colgroup>
  <tbody>
  <tr>
  <td>Action Type</td>
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
  <td>액션</td>
  <td>
  <input type="text" class="styled"  size="40" name="keyword_desc" />
  </td>
  </tr>
  <tr>
  <td colspan="2" >
  <input type="button" class="btn btn-warning" value="저장" onClick="javascript:saveAction();"></input>
  <input type="button" class="btn btn-danger" value="닫기" onClick="javascript:fnShowOrHide('div_action_input');"></input>
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
    <input type="hidden" name="rule_group" value="<%=rule_group%>"></input>
    <input type="hidden" name="kind" value="<%=kind%>"></input>
    <input type="hidden" name="x" value=""></input>
    <input type="hidden" name="y" value=""></input>
    <input type="hidden" name="priority" value=""></input>
    <input type="hidden" name="delimeter" value=""></input>
    <input type="hidden" name="anaconda_db_seq" value=""></input>
    <input type="hidden" name="service_name" value=""></input>
    <input type="hidden" name="trinity_command" value=""></input>

    <table  class="table table-condensed">
      <colgroup>
        <col width="30%"></col>
        <col></col>
      </colgroup>
      <tbody>
        <tr>
          <td>Move down the selected rule.</td>
          <td>
            <div id='div_select_rule'>
              <select id='select_rule' name='select_rule'>
              </select>
            </div>
          </td>
        </tr>
        <tr>
          <td colspan="2" >
            <input type="button" class="btn btn-warning" value="저장" onClick="javascript:saveRuleMove();"></input>
            <input type="button" class="btn btn-danger" value="닫기" onClick="javascript:fnShowOrHide('div_rule_move');"></input>
          </td>
        </tr>
      </tbody>
    </table>
  </form>
</div>  


<!-- 키워드위치이동 화면 --> 
<div id="div_sub_rule" style="position:absolute;display:none;background-color:white;border: 2px double #CCCCCC;padding: 10px 10px;z-index:200;width:400px;">
  <form name="frmSubRule" method="post" action="/Anaconda.do">
    <input type="hidden" name="CMD" value=""></input>
    <input type="hidden" name="seq" value=""></input>
    <input type="hidden" name="parent_seq" value=""></input>
                <input type="hidden" name="child_seq" value=""></input>
    <input type="hidden" name="min_seq" value=""></input>
    <input type="hidden" name="code" value=""></input>
    <input type="hidden" name="context_name" value=""></input>
    <input type="hidden" name="rule_group" value="<%=rule_group%>"></input>
    <input type="hidden" name="kind" value="<%=kind%>"></input>
    <input type="hidden" name="x" value=""></input>
    <input type="hidden" name="y" value=""></input>
                <input type="hidden" name="priority" value=""></input>
    <table  class="table table-condensed">
      <colgroup>
        <col width="50%"></col>
        <col></col>
      </colgroup>
      <tbody>
        <tr>
          <td>Insert the selected rule.</td>
          <td>
            <div id='div_select_sub_rule'>
              <select id='select_sub_rule' name='select_rule' style="width:200px;">
              </select>
            </div>
          </td>
        </tr>
        <tr>
          <td colspan="2" >
            <input type="button" class="btn btn-warning" value="저장" onClick="javascript:saveSubRule();"></input>
            <input type="button" class="btn btn-danger" value="닫기" onClick="javascript:fnShowOrHide('div_sub_rule');"></input>
          </td>
        </tr>
      </tbody>
    </table>
  </form>
</div>  

<script language="javascript">

var CURRENT_DEPTH_SEQ = <%=init_seq%>;


function setMessageFormat(sel){
  with(frmRule){
    if(sel.options[sel.selectedIndex].value == 'telegram'){
      rest_url.value = 'https://api.telegram.org/bot{=token}/sendMessage';
      rest_header.value = '{\"charset\":\"utf-8\"}';
      rest_body.value = '{\"chat_id\":\"{=chat_Id}\",\"text\":\"메시지 내용\"}';
    }else if(sel.options[sel.selectedIndex].value == 'slack'){
      rest_url.value = 'https://slack.com/api/chat.postMessage?token={=token}&channel={=chat_id}&text={=text}&as_user=false&username={=botName}';
      rest_header.value = '{\"charset\":\"utf-8\"}';
      rest_body.value = '' +
        '{\n' +
        '"token":"{=토큰}", \n' +
        '"channel":"{=channelId}",\n' +
        '"text": "Would you like to play a game?",\n' +
        '"response_type": "in_channel",\n' +
        '"username": "ProjectManager",\n' +
        '"attachments": [         \n' +
        '    {\n' +
          '      "text": "Choose a game to play",\n' +
        '    "fallback": "If you could read this message, you",\n' +
        '    "color": "#3AA3E3",\n' +
        '    "attachment_type": "default",\n' +
        '    "callback_id": "game_selection",\n' +
        '    "actions": [                 \n' +
        '            {                     \n' +
        '            "name": "games_list",\n' +
        '            "text": "Pick a game...",\n' +
        '            "type": "select",\n' +
        '            "options": [              \n' +           
        '                    {\n' +
        '                    "text": "Hearts",\n' +
        '                    "value": "hearts"      \n' +                   
        '                    },                         \n' +
        '                    {                             \n' +
        '                    "text": "Bridge",\n' +
        '                    "value": "bridge"\n' +
        '                    },                         \n' +
        '                    {                             \n' +
        '                    "text": "Checkers",\n' +
        '                    "value": "checkers" \n' +
        '                    }\n' +
        '                  ]\n' +
        '              }\n' +
        '            ]\n' +
        '          }\n' +
        '        ]\n' +
        '  }\n';
    }else if(sel.options[sel.selectedIndex].value == 'facebook'){
      rest_url.value = 'https://graph.facebook.com/v2.6/me/messages?access_token={=token}';
      rest_header.value = '{\"charset\":\"utf-8\"}';
      rest_body.value = '{\"recipient\": {\"id\": \"{=chat_Id}\"},\"message\": {\"text\": \"{=contents}\"}}';
    }else if(sel.options[sel.selectedIndex].value == 'kakao'){
      rest_url.value = 'https://kapi.kakao.com/v1/api/talk/memo/send';
      rest_header.value = '{\"charset\":\"utf-8\"}';
      rest_body.value = '';
    }else if(sel.options[sel.selectedIndex].value == 'push'){
      rest_url.value = 'http://app.bestmember.net:6081/rest?container=TXPContainer&sync=true&METHOD=PUT&NAME={=Account}&MSG_NAME=SOCIALPROJECT';
      rest_header.value = '{\"charset\":\"utf-8\"}';
      rest_body.value = '{\"DATA\": \"\"}';
    }else if(sel.options[sel.selectedIndex].value == 'trinity'){
      rest_url.value = 'https://app.bestmember.net/Anaconda.json';
      rest_header.value = '{\"charset\":\"utf-8\"}';
      rest_body.value = '{\"CMD\": \"\"}';
    }else{
      rest_url.value = '';
      rest_header.value = '';
      rest_body.value = '';
    }
  }
}


function view(arg1,arg2,arg3,arg4,arg5,arg6,arg7){
  fnShowDiv(arg1);
  fnHideDiv(arg2);
  fnHideDiv(arg3);
  // fnHideDiv(arg4);
  fnHideDiv(arg5);
  // fnHideDiv(arg6);
  fnHideDiv(arg7);
}

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
  if(callerName == 'getActionInfo')  {
    var object = parseBusinessCollectionByIndex(REQ.responseXML,0);
    var strData = '';
    keywordManager.seq = object.request.seq;
    keywordManager.keyword = object.request.keyword;  
    keywordManager.keyword_desc = object.request.keyword_desc;  

    fnShowOrHide("div_action_input");
    var oDivView = _('div_action_input');
    oDivView.style.left = object.request.x;
    oDivView.style.top = object.request.y;

    with(frmAction){
        if(object.response.length != 0)  {
          keywordManager.seq = object.request.seq;
          keywordManager.keyword = object.response[0].keyword;  
          keywordManager.keyword_desc = object.response[0].keyword_desc;  
          seq.value = object.request.seq;
          keyword.value = TextToHtml(object.response[0].keyword);
          keyword_desc.value = TextToHtml(object.response[0].keyword_desc);
          keywordManager.createOrUpdate = "updateAction";
        }else  {
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
    var object = parseBusinessCollectionByIndex(REQ.responseXML,0);
    var script = parseBusinessCollectionByIndex(REQ.responseXML,1);
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
        /* 
        if(object.response[0].parent_seq == '-1'){
          rule_condition.disabled = true;
        }else{
          rule_condition.disabled = false;
        }
        */

        keywordManager.seq = object.request.seq;
        keywordManager.rule = object.response[0].rule;  
        keywordManager.context_name = object.response[0].context_name;  
        keywordManager.context_desc = object.response[0].context_desc;  
        keywordManager.rule_condition = object.response[0].rule_condition;  
        keywordManager.priority = object.response[0].priority;  
        keywordManager.anaconda_db_seq = object.response[0].anaconda_db_seq;  
        keywordManager.delimeter = object.response[0].delimeter;  

        keywordManager.msg = TextToHtml(object.response[0].msg);  
        keywordManager.sql_statement = TextToHtml(object.response[0].sql_statement);  
        keywordManager.attachments = TextToHtml(object.response[0].attachments);  

        keywordManager.rest_url = TextToHtml(object.response[0].rest_url);  
        keywordManager.rest_result = TextToHtml(object.response[0].rest_result);  
        keywordManager.rest_header = TextToHtml(object.response[0].rest_header);  
        keywordManager.rest_body = TextToHtml(object.response[0].rest_body);  
        keywordManager.q_code = object.response[0].q_code;  
        keywordManager.service_name = object.response[0].service_name;  
        keywordManager.trinity_command = object.response[0].trinity_command;  

        rule.value = TextToHtml(object.response[0].rule);
        context_name.value = TextToHtml(object.response[0].context_name);
        context_desc.value = TextToHtml(object.response[0].context_desc);
        rule_condition.value = object.response[0].rule_condition;
        priority.value = keywordManager.priority;
        anaconda_db_seq.value = keywordManager.anaconda_db_seq;
        delimeter.value = keywordManager.delimeter;

        rest_url.value = TextToHtml(object.response[0].rest_url);  
        rest_result.value = TextToHtml(object.response[0].rest_result);  
        rest_header.value = TextToHtml(object.response[0].rest_header);  
        rest_body.value = TextToHtml(object.response[0].rest_body);  
        q_code.value = object.response[0].q_code;  
        service_name.value = object.response[0].service_name;  
        trinity_command.value = object.response[0].trinity_command; 
        $('#trinity_command').val( object.response[0].trinity_command );
        // $('#trinity_command option[value='+object.response[0].trinity_command+']').attr('selected','selected');
        // alert($('#trinity_command').val());
        msg.value= TextToHtml(object.response[0].msg);  
        sql_statement.value = TextToHtml(object.response[0].sql_statement);    
        attachments.value = TextToHtml(object.response[0].attachments);    

        if(script && script.response && script.response[0]){
          keywordManager.RULE_BEFORE_SCRIPT= BRToEnter(script.response[0].RULE_BEFORE_SCRIPT);    
          keywordManager.RULE_AFTER_SCRIPT= BRToEnter(script.response[0].RULE_AFTER_SCRIPT);
          RULE_BEFORE_SCRIPT.value = BRToEnter(script.response[0].RULE_BEFORE_SCRIPT);    
          RULE_AFTER_SCRIPT.value = BRToEnter(script.response[0].RULE_AFTER_SCRIPT);    
        }

        keywordManager.createOrUpdate = "updateRule";

        var d= {CMD:'CMD_SEQ_100057316271498317709302' , q_code:keywordManager.q_code};
        $.ajax({
              url:"/Anaconda.json",
              type:"POST",
              headers: { 
              "Accept" : "application/json; charset=utf-8" , "charset" : "utf-8"
              },
              data:d,
              dataType:"json",
              success: function (data) {
                if(data && data.listRuleQuest && data.listRuleQuest[0]){
                  q_code.value = data.listRuleQuest[0].QCode;
                  RuleSeq.value = keywordManager.seq;
                  Subject.value = data.listRuleQuest[0].Quest;
                  // QuestType.value = data.listRuleQuest[0].QuestType;
                  for(var i=0; i<QuestType.options.length; i++) {
                    if(QuestType.options[i].value == data.listRuleQuest[0].QuestType) {
                      QuestType.options[i].selected = true;
                      changeQuestAnswer();
                      break;
                    }
                  }
                  QCCode1.value = data.listRuleQuest[0].QCCode;  
                  Answer1.value = data.listRuleQuest[0].Answer;  
                  QCCode2.value = data.listRuleQuest[1].QCCode;  
                  Answer2.value = data.listRuleQuest[1].Answer;  
                  QCCode3.value = data.listRuleQuest[2].QCCode;  
                  Answer3.value = data.listRuleQuest[2].Answer;  
                  QCCode4.value = data.listRuleQuest[3].QCCode;  
                  Answer4.value = data.listRuleQuest[3].Answer;  
                  QCCode5.value = data.listRuleQuest[4].QCCode;  
                  Answer5.value = data.listRuleQuest[4].Answer;  
                  QCCode6.value = data.listRuleQuest[5].QCCode;  
                  Answer6.value = data.listRuleQuest[5].Answer;  
                  QCCode7.value = data.listRuleQuest[6].QCCode;  
                  Answer7.value = data.listRuleQuest[6].Answer;  
                }
               }
            });

        }
        else
        {
          keywordManager.seq = object.request.seq;
          keywordManager.rule = '';  
          keywordManager.priority = ''; 
          keywordManager.delimeter = ''; 
          keywordManager.anacoonda_db_seq = '';  
          keywordManager.context_name = '';  
          keywordManager.context_desc = '';  
          keywordManager.msg = '';  
          keywordManager.sql_statement = '';  
          keywordManager.service_name = '';  
          keywordManager.trinity_command = '';  

          keywordManager.attachments = '';
          keywordManager.RULE_BEFORE_SCRIPT = '';  
          keywordManager.RULE_AFTER_SCRIPT = '';
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
      if(confirm('룰을 삽입하시겠습니까?')){
         keywordManager.createRule();
      }else{
         return;
      }
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
      window.location.reload()
  }
  else if(callerName == 'getRuleContextList' || callerName == 'getSubRuleContextList' || callerName == 'getParentRuleContextList')
  {
    var object = parseAnacondaAJAXFromBusinessCollection(REQ.responseXML);
    if(object.error != "")
      alert("ERROR=" + object.error);
    else
    {
      if(keywordManager.depth > 10 ) return;
      if(callerName != 'getSubRuleContextList' && (object.length == null 
      || object.length == "" 
      || object.response[0] == null 
      || object.response[0].seq == null)){
        // history.back();
        console.log('############# Error ################');
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
 }else if( callerName == 'showSubRule' ){
    var object = parseAnacondaAJAXFromBusinessCollection(REQ.responseXML);
    if(object.error != ""){
      alert("ERROR=" + object.error);
    }else{
      var count = object.response.length;
      var select = _("select_sub_rule");
      for(var i=0 ; i < count ; i++){
        var opt = document.createElement("option");
        opt.setAttribute("value",object.response[i].seq);
        opt.innerHTML =  object.response[i].seq + ':' + object.response[i].context_name.trim();
        select.appendChild(opt);
      }
    }
  }else{
    if(CURRENT_DEPTH_SEQ == null || CURRENT_DEPTH_SEQ == undefined){
      CURRENT_DEPTH_SEQ = -1;
    }
    keywordManager.getRuleContextList(CURRENT_DEPTH_SEQ,'div_rule_tree'); 
    window.location.reload()
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
  getMoveTargetList();
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
  getMoveTargetList();
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
  var priority;
  var createOrUpdate;
  var depth;
  var option;
  var keyword;
  var keyword_desc;
  var msg;
  var rule_group;
  var parent_seq;
  var sql_statement;
  var kind;
  var attachments;
  var rest_url;
  var rest_result;
  var rest_header;
  var rest_body;
  var q_code;
  var anaconda_db_seq;
  var delimeter;
  var RULE_BEFORE_SCRIPT;
  var RULE_AFTER_SCRIPT;
  var SCRIPT_CREATE;
  var SCRIPT_UPDATE;
  var service_name;
  var trinity_command;

  this.depth = 0;
  this.option = "";
}
KeywordManager.prototype.getNextRuleContextList = function(){
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_102838910731495757776566&seq='+this.seq+'&min_seq='+this.min_seq+'&rule_group=<%=rule_group%>&kind=<%=kind%>';
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
    RULE_CREATE.value = 'true';
    RULE_UPDATE.value = '';
    rule_condition.value = '0'; 
    if(!success)rule_condition.value  = '-1'; 
    fnShowOrHide("div_save_rule");
    this.createOrUpdate = "saveRule";
  }
 }
KeywordManager.prototype.getKeywordID = function(idx){
   return "div_subkeywordinfo_tr" + "_" + this.depth + "_" + idx
}
   KeywordManager.prototype.viewDetail = function(){
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_109170810941496452670436&seq='+this.seq+'&min_seq='+this.min_seq+'&rule_group=<%=rule_group%>&kind=<%=kind%>';
}
KeywordManager.prototype.showRuleMove = function(){
  fnShowOrHide("div_rule_move");
  var pos = getCurrentPosition();
  var div = _('div_rule_move');
    div.style.left = pos.x+'px';
    div.style.top = pos.y + 'px';
}

KeywordManager.prototype.showSubRule = function(){
       with(frmSubRule){
      seq.value = '11395';
      CMD.value = "CMD_SEQ_107207042051550215478534";
            // CMD.value = "CMD_SEQ_106525617631565391445223";
      code.value = "showSubRule";
      callAjaxByForm("showSubRule","frmSubRule");        
  }
}

KeywordManager.prototype.selectSubRule = function(){
  fnShowOrHide("div_sub_rule");
  var pos = getCurrentPosition();
  var div = _('div_sub_rule');
    div.style.left = pos.x +'px';
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
    RuleSeq.value = this.seq;

    RULE_BEFORE_SCRIPT.value = enterToBR(RULE_BEFORE_SCRIPT.value);
    RULE_AFTER_SCRIPT.value = enterToBR(RULE_AFTER_SCRIPT.value);

    if(keywordManager.createOrUpdate == 'saveRule'){
      CMD.value = "CMD_SEQ_102874264551495784790279";
      code.value = 'saveRule';
      RULE_CREATE.value = 'true';
      RULE_UPDATE.value = '';
      callAjaxByForm('saveRule',"frmRule");  
    }else{
      CMD.value = "CMD_SEQ_107950786481495797259992";
      code.value = 'updateRule';
      RULE_CREATE.value = '';
      RULE_UPDATE.value = 'true';
      callAjaxByForm('updateRule',"frmRule");  
    }
    fnHideDiv("div_rule_menu");
    fnHideDiv("div_save_rule");
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
    msg.value = (msg.value).replace('<br>','\n');
    context_desc.value = (context_desc.value).replace('<br>','\n');
    sql_statement.value = (sql_statement.value).replace('<br>','\n');
    attachments.value = (attachments.value).replace('<br>','\n');
    code.value = "updateRule";
    RULE_CREATE.value = '';
    RULE_UPDATE.value = 'true';

    RULE_BEFORE_SCRIPT.value = enterToBR(RULE_BEFORE_SCRIPT.value);
    RULE_AFTER_SCRIPT.value = enterToBR(RULE_AFTER_SCRIPT.value);

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
  if(confirm('룰의 위치를 하위룰에 이동시킬 경우 치명적인 오류가 발생할 수 있습니다. 계속 하시겠습니까?')){
    with(frmRuleMove){
      if(this.seq == select_rule.value) {
         alert("이동 시키려는 위치가 현재 위치 입니다.");
         return;
      }
      if(this.seq == '' || select_rule.value == '') {
         alert("이동 시키려는 위치 정보가 없습니다.");
         return;
      }
      seq.value = this.seq;
      CMD.value = "CMD_SEQ_105050443491495807338244";
      code.value = "saveRuleMove";
      callAjaxByForm("saveRuleMove","frmRuleMove");        
    }
    fnHideDiv("div_rule_menu");
    fnHideDiv("div_rule_move");
  }
}
KeywordManager.prototype.saveSubRule = function(){
  with(frmSubRule){
    seq.value = this.seq;
    child_seq.value = select_sub_rule.value;
    CMD.value = "CMD_SEQ_104071838211550215280974";
    code.value = "saveSubRule";
    callAjaxByForm("saveSubRule","frmSubRule");        
  }
}
KeywordManager.prototype.removeSubRule = function(arg1){
  with(frmSubRule){
    seq.value = arg1;
    CMD.value = "CMD_SEQ_108460191531550242944942";
    code.value = "removeSubRule";
    callAjaxByForm("removeSubRule","frmSubRule");        
  }
}


KeywordManager.prototype.getParentRuleContextList = function(did){
    with(frmParentRuleTree)  {
    div_id.value = did;
    this.depth = 0;
    CMD.value = "CMD_SEQ_100301325031495772465888";
    callAjaxByForm("getParentRuleContextList","frmParentRuleTree");
  }
}
KeywordManager.prototype.getRuleContextList = function(arg_seq,did){
    with(frmRuleTree){
    seq.value = arg_seq;
    this.depth = 0;
    div_id.value = did;
    CMD.value = "CMD_SEQ_109333914371495770843830";
    callAjaxByForm("getRuleContextList","frmRuleTree");
                fnHideDiv("div_save_rule");        
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
          
  if(object.length != null && object.length != "")  {
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
          }else  {
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
        }else  {
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
      // div2.setAttribute("width","300px");
      var a = document.createElement("a");
      a.className="a_keyword";
      a.setAttribute("href","javascript:fnNull();");
      a.setAttribute("title","Show pop menu");
      /*
      var img1 = document.createElement("img");
      img1.setAttribute("src","/jsp/bestmember/img/"+img_head);
      img1.setAttribute("width","20");
      img1.setAttribute("height","20");
      img1.setAttribute("border","0");
      img1.setAttribute("align","absmiddle");
      */
      if(object.response[i].parent_seq == -1) {
        a.setAttribute("onClick","javascript:fnShowHomeMenu('"+object.response[i].seq+"','div_home_menu');;");
        div2.className = "div_keyword_home";
        a.innerHTML =   "<br/><img src='/jsp/bestmember/img/home.png' width='20'>"   +  "&nbsp;<b>" + object.response[i].context_name + '<br>' + (object.response[i].rule != null && object.response[i].rule != 'null' ? object.response[i].rule.replaceAll('\n','<BR>') : '') + "</b>&nbsp;&nbsp;"  ;
      }else{
         a.setAttribute("onClick","javascript:fnShowMenu('"+object.response[i].seq+"','','','" +object.response[i].context_name+"');");
         if(object.response[i].rule_condition == 'true' || object.response[i].rule_condition == '0') {
           div2.className = "div_keyword_true";
           a.innerHTML = "<br/>"  + "&nbsp;<b>" + object.response[i].rule.replaceAll('\n','<BR>') + '</b><p>'+object.response[i].context_name+'</p><p style="color:blue">' + object.response[i].msg + "&nbsp;&nbsp;</p>"  ;
         } else{
           div2.className = "div_keyword_false";
           a.innerHTML =  "<br/>"   +  "&nbsp;<b>"  + object.response[i].rule.replaceAll('\n','<BR>') + '</b><p>'+object.response[i].context_name+'</p><p style="color:blue">' + object.response[i].msg + "&nbsp;&nbsp;</p>"  ;
         }
      }
      var chk = document.createElement("a");

      chk.setAttribute("href","javascript:fnNull();");
            chk.setAttribute("onClick","javascript:fnShowCreate('"+object.response[i].seq +"','" +object.response[i].context_name+"');");
      var img1_1 = document.createElement("img");
      img1_1.setAttribute("src","/jsp/bestmember/img/add.png");
      img1_1.setAttribute("title","Add rule");
      img1_1.setAttribute("width","15");
      img1_1.setAttribute("height","15");
      img1_1.setAttribute("border","0");
      img1_1.setAttribute("align","absmiddle");
      chk.appendChild(img1_1);

      var chk2 = document.createElement("a");
      chk2.setAttribute("href","javascript:fnNull();");
      chk2.setAttribute("onClick","javascript:fnShowExpand('"+object.response[i].seq+"','" +object.response[i].context_name+"');");
      
      var img1_2 = document.createElement("img");
      img1_2.setAttribute("src","/jsp/bestmember/img/expand.png");
      img1_2.setAttribute("title","Expand rules(true and false)");
      img1_2.setAttribute("width","15");
      img1_2.setAttribute("height","15");
      img1_2.setAttribute("border","0");
      img1_2.setAttribute("align","absmiddle");
      
      chk2.appendChild(img1_2);

      var chk3 = document.createElement("a");
      chk3.setAttribute("href","javascript:fnNull();");
      chk3.setAttribute("onClick","javascript:fnShowRule('"+object.response[i].seq+"','" +object.response[i].context_name+"');");
      
      var img1_3 = document.createElement("img");
      img1_3.setAttribute("src","/jsp/bestmember/img/edit.png");
      img1_3.setAttribute("title","Edit a rule");
      img1_3.setAttribute("width","15");
      img1_3.setAttribute("height","15");
      img1_3.setAttribute("border","0");
      img1_3.setAttribute("align","absmiddle");
      
      chk3.appendChild(img1_3);

      var chk4 = document.createElement("a");
      chk4.setAttribute("href","javascript:fnNull();");
      chk4.setAttribute("onClick","javascript:fnShowDelete('"+object.response[i].seq+"','" +object.response[i].context_name+"');");
      
      var img1_4 = document.createElement("img");
      img1_4.setAttribute("src","/jsp/bestmember/img/del.png");
      img1_4.setAttribute("title","Delete a rule");
      img1_4.setAttribute("width","15");
      img1_4.setAttribute("height","15");
      img1_4.setAttribute("border","0");
      img1_4.setAttribute("align","absmiddle");
      
      chk4.appendChild(img1_4);
      var childRuleId = '';
      var delButton = '';
      if(object.response[i].child_seq != -1)  {
        childRuleId = object.response[i].child_seq;
        delButton = "&nbsp;<a href=\"javascript:fnRemoveSubRule('"+object.response[i].seq+"')\"><img src='/jsp/bestmember/img/del.png' title='Delete a child rule' width='10px'></a>";
        div2.className = "div_keyword_has_child";
      }
                        
      var priority = object.response[i].priority;
      if("1000" == priority) priority = "H";
      if("100" == priority) priority = "M";
      if("10" == priority) priority = "L";

      var span_1 = document.createElement("span");
      span_1.innerHTML = "id : " + object.response[i].seq + " ( "+priority+" )";
      var child_div = document.createElement("div");
      if(childRuleId != null && childRuleId != '') {
        child_div.innerHTML= delButton + " child id: <a href=\"javascript:fnNull();\" onClick=\"javascript:goNextPage('"+childRuleId +"','" +object.response[i].context_name+"');\">["+
                             +childRuleId+"]</a> ";
       
      }

      /*
            var chk3 = document.createElement("a");
      chk3.setAttribute("href","javascript:fnNull();");
            chk3.setAttribute("onClick","javascript:fnShowAction('"+object.response[i].seq
                              +"','" +object.response[i].context_name+"');");

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


      var img1_3 = document.createElement("img");
      img1_3.setAttribute("src","/jsp/bestmember/img/write.png");
      img1_3.setAttribute("width","15");
      img1_3.setAttribute("height","15");
      img1_3.setAttribute("border","0");
      img1_3.setAttribute("align","absmiddle");
      
      chk3.appendChild(img1_3);
      */


      chk.setAttribute("style","padding :5px");
      chk2.setAttribute("style","padding :5px");
      chk3.setAttribute("style","padding :5px");
      chk4.setAttribute("style","padding :5px");
      span_1.setAttribute("style","padding :5px");

      div2.appendChild(chk);
      div2.appendChild(chk2);
      div2.appendChild(chk3);
      if( child_div != null) div2.appendChild(child_div);
      div2.appendChild(chk4);
      div2.appendChild(span_1);

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
      img2.setAttribute("title","Go to next page");
      img2.setAttribute("width","20");
      img2.setAttribute("height","20");
      img2.setAttribute("border","0");
      img2.setAttribute("align","absmiddle");
      a2.innerHTML = '&nbsp;';
      a2.appendChild(img2);
      
      td3.appendChild(a2);

      var opt = null;
      var select = _("select_rule");
      if($("#select_rule option").length == 0){
        opt = document.createElement("option");
        opt.setAttribute("value",'-1');
        opt.innerHTML = "-1" + ":" + "root";
      }else{
        opt = document.createElement("option");
        opt.setAttribute("value",object.response[i].seq);
        opt.innerHTML = object.response[i].seq + ":" + object.response[i].context_name;
      }
            
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
function fnShowExpand(arg1,arg2){
  var pos = getCurrentPosition();
  keywordManager.seq = arg1;
  keywordManager.context_name = arg2;  
  with(frmRule)  {
     context_name.value = arg2;
  }
  goExpandRule();
}
function fnShowDelete(arg1,arg2){
  var pos = getCurrentPosition();
  keywordManager.seq = arg1;
  keywordManager.context_name = arg2;  
  with(frmRule)  {
     context_name.value = arg2;
  }
  goDelete();
}

function fnRemoveSubRule(arg1){
  confirmPopup('경고','정말로 삭제하시겠습니까?', ()=>{
     keywordManager.removeSubRule(arg1);
  });
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
function fnGoSubRuleTree(arg1){

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
  with(frmRule){
       rule.value = '';
       context_name.value = '';
       context_desc.value = '';
       rule_condition.value = '';
       priority.value = 100;
       delimeter.value = '|';
       rest_url.value = '';  
       rest_result.value = '';  
       rest_header.value = '';  
       rest_body.value = '';  
       q_code.value = '';  
       service_name.value = '';  
       trinity_command.value='';  
       msg.value= '';  
       sql_statement.value = '';    
       attachments.value = '';    
       RULE_BEFORE_SCRIPT.value = '';    
       RULE_AFTER_SCRIPT.value = '';    
       QCCode1.value = '';
       QCCode2.value = '';
       QCCode3.value = '';
       QCCode4.value = '';
       Answer1.value = '';
       Answer2.value = '';
       Answer3.value = '';
       Answer4.value = '';
       Answer5.value = '';
       Answer6.value = '';
       Answer7.value = '';
       Subject.value = '';
  }
  keywordManager.getRuleInfo();
}

function goDetail(){
  keywordManager.viewDetail();
}

function goShowAction(){
  with(frmMenu){
    var sel = menu_keyword.value;
    keywordManager.getActionInfo(sel);
  }
}
function goInsertBetween(){
       keywordManager.selectSubRule();
       keywordManager.showSubRule();
}
function goCreate(){
  var pos = getCurrentPosition();
  var div = _('div_save_rule');
  div.style.left = pos.x+'px';
  div.style.top = pos.y +'px'; 
  keywordManager.countSubRule();
}
function goExpandRule(){
  confirmPopup('경고','룰을 확장 할까요?', ()=>{
    var pos = getCurrentPosition();
    var div = _('div_save_rule');
    div.style.left = pos.x+'px';
    div.style.top = pos.y +'px';
    keywordManager.expandRule();
  });
 
}
function goDelete(){
  confirmPopup('경고','정말로 삭제하시겠습니까?', ()=>{
     keywordManager.deleteRule();
  });

}
function goRuleMove(){
  keywordManager.showRuleMove();
}
function saveRule(){
  confirmPopup('경고','룰(Rule)을 저장 할까요?', ()=>{
      keywordManager.saveRule();  
  });

}
function saveAction(){
  confirmPopup('경고','저장 할까요?', ()=>{
     keywordManager.saveAction();  
  });

}
function saveRuleMove(){
  confirmPopup('경고','저장 할까요?', ()=>{
     keywordManager.saveRuleMove();
  });

  
}
function saveSubRule(){
  confirmPopup('경고','저장 할까요?', ()=>{
        fnHideDiv('div_sub_rule');
        fnHideDiv('div_rule_menu');
        keywordManager.saveSubRule();
  });
}

function goNextPage(arg1,arg2){
  var pos = getCurrentPosition();
  keywordManager.seq = arg1;
  keywordManager.context_name = arg2;  
  with(frmRuleTree){
     context_name.value = arg2;
  }
  CURRENT_DEPTH_SEQ = arg1;
  keywordManager.getRuleContextList(arg1,'div_rule_tree');
  // keywordManager.getRuleContextList(arg1,'div_rule_tree');
  // keywordManager.getNextRuleContextList();
}

function goRoot(s){
  var d = {seq : keywordManager.seq};
  post(d,'CMD_SEQ_103817823741617621830105',data=>{
    confirmPopup('Success','정상적으로 반영되었습니다.',()=>{window.location.reload();});
  },err=>{
    confirmPopup('Fail','에러가 발생하였습니다.',()=>{window.location.reload();});    
  });
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


String kind_ctnt = "대화 실행";
if(!"MSG".equals(kind)) kind_ctnt = "대화 완료";
%>

<div style="z-index:10">

  <h3 ><img src="/jsp/sp/img/realtime_message.png" width="40px">&nbsp;Rule Management</h3>
     <!-- Rule Tree -->
            <div>
<div id="script_code" class="card mb-3" style="margin-top:5px;">
<div class="card-header">
<h6>&nbsp; 자주 쓰는 룰</h6>
</div>
<div>
<ul>
 <li> 저장('XXXX') 현재 입력한 메시지를 XXXX 이름으로 저장 해 줌. / equal('XXXX') 현재 입력한 메시지가 XXXX 와 같으면 True. / like('XXXX') 현재 입력한 메시지가 XXXX 와 비슷하면 True.
 <li> intentLike('XXXX',10) 현재 입력한 메시지가  XXXX의도일 확률이 10%이면 True. / have('XXXX,XX,XXXXX') 현재 입력한 메시지에 , 로 분리된 단어 들이 포함되면 True. 
 <li><b> Training Bot 을 만드시려면, rule ( 1 == 1 )을 등록하시고, After Script 영역에 SET('clientId','clientId'); SET('trigger-name','ChatBotName.test'); SET('ChatBotName.test','true'); 을 입력해 주세요.</b>
 <li><b> 금수저 DUNA Bot은 sell_yn(Y/N) , buy_yn(Y/N), sell_method(market/target), buy_method(market/target) 값을 설정해야 합니다..</b>
 <li>
  <div style="margin-top:10px;">
     <input id='var_name' type="text" class="styled" size="20" style="width:200px;float: left;margin-right:10px;"> <button type="button" class="btn btn-info" id="add_var">변수명 추가</button>
  </div>
 <li>
  <div style="margin-top:10px;">
     <input id='function_name' type="text" class="styled" size="20" style="width:200px;float: left;margin-right:10px;"> <button type="button" class="btn btn-primary" id="function_var">함수명 추가</button>
  </div>


</ul>

</div>
</div>
              <div>           
        
          <p style="height:10px"></p>
          <div style="margin:10px">
          <a style='text-decoration:none;' href='/Anaconda.do?CMD=CMD_SEQ_109170810941496452670436&rule_group=<%=rule_group%>&kind=<%=kind%>'><i class="fa fa-fw fa-sign-out"></i>&nbsp;Top</img></a>
          &nbsp;
          <a style='text-decoration:none;' href='javascript:keywordManager.getParentRuleContextList("div_rule_tree");'><i class="fa fa-fw fa-share"></i>&nbsp;Previous</img></a>
          </div>

          <div style="padding-left:10px;padding-top:10px;display:block;width:100%;" id="div_rule_tree">
          <p height="20px">&nbsp;</p>
          </div>

          <p style="height:10px"></p>

            </div>
          </div>    


</div>


          <div>
                <div>           
                    Rule script is very important . please be careful.
                </div>
           </div>

<script language="javascript">
keywordManager.getRuleContextList(<%=init_seq%>,'div_rule_tree');
function insert_word_in_textarea(val){
   var cursorPos = $('#rule').prop('selectionStart');     
   var v = $('#rule').val();
   var textBefore = v.substring(0,  cursorPos);
   var textAfter  = v.substring(cursorPos, v.length);
   $('#rule').val(textBefore + val + textAfter);
}

(function(){

  $('#trinity_command').change(function(){
      $('#ref_command').text($(this).val());    
  });
  $('#factor_list').change(()=>{
    insert_word_in_textarea($('#factor_list').val());
  });  
  post({},'CMD_SEQ_107695074081575101621830',(data)=>{
       
       if(data && data.selectDBInfoList && data.selectDBInfoList.length > 0){
         $.each(data.selectDBInfoList, (idx, item)=>{
           var option = $("<option value='"+item.seq+"'>"+item.jndi+"</option>");
           $('#anaconda_db_seq').append(option);
         });
      }
    },(err)=>{
       alertPopup('에러','데이터베이스 정보를 가져오는데 실패하였습니다');
    });


  post({},'CMD_SEQ_109787182311657082171999', (result)=>{
         $.each(result.factor_list, function (index, value) {
             $('#factor_list').append('<option value="' + value.factor_name + '">' + value.factor_name + '</option>');
         });
      },(err)=>{
      });

})();

  $('#add_var').click(function(){
    if($('#var_name').val() == '') alertPopup('추가','변수명을 꼭 입력해 주세요');
    else{
      var d = {'factor_name': $('#var_name').val()};
      post(d,'CMD_SEQ_100789925831657080898587',(result)=>{
             console.log(result);
             if(result.check_profile[0].count == 0){
               confirmPopup('추가','변수 '+$('#var_name').val()+'를 추가하시겠습니까?',()=>{
                           d = {'factor_name': $('#var_name').val(), 'factor_statement':'','factor_from':'script','factor_type':'R','baseprofile_yn':'N','factor_group':'DUNA.SAAS','anaconda_db_seq':-1};
                           post(d,'CMD_SEQ_100623391721495932098371',(result)=>{
                             simplePopup('결과','성공하였습니다.');
                           },(err)=>{
                             simplePopup('결과','실패하였습니다.');                   
                           });
               });
             }else {
               simplePopup('결과','변수명이 이미 존재 합니다.');
             }
           }, (err)=>{
              simplePopup('결과','변수명을 확인 할 수 없습니다.');
           });
    }
  });

  $('#function_var').click(function(){
    if($('#function_name').val() == '') alertPopup('추가','함수명을 꼭 입력해 주세요');
    else{
      var d = {'function_name': $('#function_name').val()};
      post(d,'CMD_SEQ_103971716871657084239589',(result)=>{
             console.log(result);
             if(result.check_function[0].count == 0){
               confirmPopup('추가','함수 '+$('#function_name').val()+'를 추가하시겠습니까?',()=>{
                           d = {'function_name': $('#function_name').val(), 'rule_function':'','kind':''};
                           post(d,'CMD_SEQ_106752320981500422361060',(result)=>{
                             simplePopup('결과','성공하였습니다.');
                           },(err)=>{
                             simplePopup('결과','실패하였습니다.');                   
                           });
               });
             }else {
               simplePopup('결과','함수명이 이미 존재 합니다.');
             }
           }, (err)=>{
              simplePopup('결과','함수명을 확인 할 수 없습니다.');
           });
    }
  });

</script>
