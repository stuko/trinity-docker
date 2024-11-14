<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%
%>

<script language="javascript">
function fnPage(seq){
  seq = seq == null || seq == ''  || seq == 'null' ? '0' : seq;
  document.location.href = "/Anaconda.do?CMD=CMD_SEQ_108707152261658099555132&pos=" + seq;
}
function save(){
	with(frmInput){
		if(training_url.value == '') {
			alert("트레이닝 정보 URL을 입력해 주세요");
			return;
		}
        if(trigger_name.value == '') {
			alert("트레이너 이름을 입력해 주세요");
			return;
		}
        if(quest.value == '') {
			alert("질문의 형식을 입력해 주세요");
			return;
		}
		CMD.value = "CMD_SEQ_102450115641658102646810";
		callAjaxByForm('save',"frmInput");	
	}
}

function fnSet(v_training_url, v_trigger_name, v_quest){
	with(frmPattern){
           training_url.value = v_training_url;
           trigger_name.value = v_trigger_name;
           quest.value = v_quest;
	}
}

function remove(v_trigger_name){
    
	with(frmInput){
		if(!confirm(v_trigger_name + ' 을 정말로 삭제하시겠습니까?')) {
			return;
		}
        var d = { trigger_name : v_trigger_name}
        post(d,'CMD_SEQ_106693938281658102659125', data=>{
          simplePopup('성공',v_trigger_name + ' 을 삭제 하였습니다.');
          fnPage(0);
        }, err=>{
          simplePopup('실패','삭제하지 못하였습니다.');
        });
	}
}

function doRun(callerName , REQ)
{
    alert("정상적으로 반영 되었습니다.");
    var t = Math.floor(Math.random()*1000);
    window.location.href = window.location.href;
}
</script>

<div class="container-fluid">

<h3 class="page-header"><img src="/jsp/sp/img/pattern.png" width="40px">&nbsp; TrainerBot </h3>
<div id="div_save_pattern" style="width:1000px;position:absolute;display:block;background-color:white;padding: 10px 10px;z-index:200;">
	<form name="frmInput" method="post" action="/Anaconda.do">
		<input type="hidden" name="CMD" value=""></input>
		<input type="hidden" name="seq" value=""></input>
		<input type="hidden" name="x" value=""></input>
		<input type="hidden" name="y" value=""></input>
		<table class="table" width="100%">
			<colgroup>
				<col width="200px"></col>
				<col></col>
			</colgroup>
			<tbody>
                <tr>
					<td colspan="2">
                    <button id="btn1" type="button" class="btn btn-lg btn-primary" onClick="javascript:save();">
                        <span>😊😊😊 추가<br><small>추가해 주세요</small></span>
                    </button><span>생성후 수정이 불가능 합니다.(수정이 필요하면 삭제 후 생성해 주시기 바랍니다.)</span>
                    </td>
				</tr>
				<tr>
					<td>트레이닝 정보 URL</td>
					<td><input type="text" id="training_url" name="training_url" class="form-control" size="100" ></input></td>
				</tr>
                <tr>
					<td>트레이너 이름</td>
					<td><input type="text" id="trigger_name"  name="trigger_name" class="form-control" size="100"></input></td>
				</tr>
                <tr>
					<td>문제 형식 (예: 의 의미는 무엇인가요?) </td>
					<td><input type="text" id="quest"  name="quest" class="form-control" size="100" ></input></td>
				</tr>
				<tr style="display:none;">
					<td colspan="2">
    					<button id="btn3" type="button"  class="btn btn-primary" value="저장 " onClick="javascript:save();">추가</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	<br>
	<br>
	 <div class="card-block">
        <div class="table-responsive">
            <table class="table table-bordered" width="100%" id="dataTable" cellspacing="0">
                <thead>
                    <tr>
                        <th>트레이닝 정보 URL</th>
                        <th>트레이너 이름</th>
                        <th>문제 형식</th>
                        <th>삭제</th> 
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>트레이닝 정보 URL</th>
                        <th>트레이너 이름</th>
                        <th>문제 형식</th>
                        <th>삭제</th> 
                    </tr>
                </tfoot>
            	<tbody>
	<%
        BusinessCollection bc = RequestHelper. getBusinessCollection(request,"list");
        for(int i = 0; i < bc.size(); i++){
	%>
                    <tr>
                        <td style="word-break: break-all;word-wrap:break-word"><a href="javascript:fnSet('<%=bc.getBusinessData(i).getFieldValue("training_url")%>'
                                                     ,'<%=bc.getBusinessData(i).getFieldValue("trigger_name")%>'
                                                     ,'<%=bc.getBusinessData(i).getFieldValue("quest")%>')">
                                                     <%=bc.getBusinessData(i).getFieldValue("training_url")%></a></td>
                        <td style="word-break: break-all;word-wrap:break-word"><%=bc.getBusinessData(i).getFieldValue("trigger_name")%></td>
                        <td style="word-break: break-all;word-wrap:break-word"><%=bc.getBusinessData(i).getFieldValue("quest")%></td>
                        <td><input type="button" class="btn btn-primary" value="삭제" 
                            onclick="javascript:remove('<%=bc.getBusinessData(i).getFieldValue("trigger_name")%>')"></td>
                    </tr>
   <%
        }
   %>
                </tbody>
        	</table>
        </div>
<%
    BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"totalCount");
    String strCount = bc1.getBusinessData(0).getFieldValue("totalCount");
%>
<%
    int cnt = Integer.parseInt(strCount);
    int page_count = cnt/20;
    int page_mod = cnt%20;
    String seq = request.getParameter("pos");
    if(!BusinessHelper.checkBusinessNull(seq))seq = "0";
    int iseq = Integer.parseInt(seq);
    for(int i = 0; i <= page_count;i++){
        if(iseq == i*20){
%><%=i+1 %>
<%
  }else{
%>
  <a href="javascript:fnPage('<%=i*20 %>');"><%=i+1 %></a>
<%	
  }
}
%>
</div>
