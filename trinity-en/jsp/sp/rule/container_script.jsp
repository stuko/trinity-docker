<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.filter.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.action.*"%>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script>
function fnSaveScript(){
  with(frmScript){
    if(container_name.value==''){
       alertPopup('Oops....','Please input container name...');
       return;
    }
  }
  ajaxConda("frmScript","CMD_SEQ_104491534621566694701211",true,()=>{
     alertPopup('success','OK!!! , Script was saved successfully');   
     window.location.reload(); 
  });
}

function fnSet(n,b,a){
	with(frmScript){
	  container_name.value= n;
	  var bs = document.getElementById(b);
          before_script.value = TextToHtml((bs.innerHTML).trim());
          var as = document.getElementById(a);
          after_script.value = TextToHtml((as.innerHTML).trim());
	}
}

function reset(){
	with(frmScript){
	  container_name.value= '';
	  before_script.value = '';
	  after_script.value = '';
	}
}

function fnDeleteScript(c){
  frmScript.container_name.value = c;
  ajaxConda("frmScript","CMD_SEQ_109349262431566696779883",true,()=>{
     alertPopup('success','OK!!! , Script was deleted successfully');   
     window.location.reload(); 
  });
}


</script>

<div class="container-fluid">

<h3 class="page-header"><img src="/jsp/sp/img/function.png" width="40px">&nbsp;Container Script</h3>
<df>
 컨테이너 스크립트란?
</df>
<dl>
DUNA 엔진은 컨테이너는 단위로 이뤄져 있습니다<br>
"대화의 문장을 전달 받는 컨테이너", "전달받은 대화를 분석하는 컨테이너", "분석한 결과를 문장으로 만들어 주는 커테이너" 등... 여러개의 컨테이너로 운영되고 있습니다. 참고로 Docker의 컨테이너와는 관련이 없습니다. ^^<br>
컨테이너는 챗봇을 운영하는데 매우 중요한 기본이 되는 기능을 가지고 있습니다. 하지만 챗봇을 운영하는데 좀더 미세한 기능을 조정하고 싶은 경우가 있습니다. 이럴때 컨테이너의 스크립트를 통해서 필요한 기능을 추가하거나 변경할 수 있습니다. 컨테이너 이름은 아래에 나와 있는데로 이며, 컨테이너가 실행되는 순서대로 표현이 되었으니 필요한 기능을 넣으실때 주의해 주시기 바랍니다.
</dl>

	<form name="frmScript" id="frmScript" method="post" action="/Anaconda.do">
		<table  class="table table-condensed" >
			<colgroup>
				<col width="200px"></col>
				<col></col>
			</colgroup>
			<tbody>
				<tr>
					<td>컨테이너 이름</td>
					<td>
<input type="text" id="container_name" name="container_name" size="30">

<select class="container_name_select" id="container_name_select">
  <option value="TranslateContainer">TranslateContainer</option>
  <option value="SocialProjectContainer">SocialProjectContainer</option>
  <option value="ProfileContainer">ProfileContainer</option>
  <option value="IntentContainer">IntentContainer</option>
  <option value="SimpleAnalysisContainer">SimpleAnalysisContainer</option>
  <option value="DunaRuleContainer">DunaRuleContainer</option>
  <option value="EnglishContainer">EnglishContainer</option>
  <option value="TrainingContainer">TrainingContainer</option>
  <option value="RecoverContainer">RecoverContainer</option>
  <option value="GameContainer">GameContainer</option>
  <option value="BusinessModelingContainer">BusinessModelingContainer</option>
  <option value="StoreContainer">StoreContainer</option>
</select>

</td>
				</tr>
				<tr>
					<td>실행전 스크립트</td>
					<td><textarea class="form-control" rows="5" name="before_script" id="before_script"></textarea></td>
				</tr>
				<tr>
					<td>실행후 스크립트</td>
					<td><textarea class="form-control" rows="5" name="after_script" id="after_script"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="button" class="btn btn-primary" value="저장하기" onClick="fnSaveScript();"></input>
					<input type="button" class="btn btn-info" value="새로입력" onClick="reset();"></input>
					</td>
				</tr>
			</tbody>
		</table>
	</form>


 <div class="card mb-3" style="padding-bottom:40px;">
           <div class="card-header">
<h6>&nbsp; Script Sample <br>
<pre>
// Reserved word : ruleParameter, 룰변수
ruleParameter.put('TMP_VAR','I will be saved');
룰변수.put('TMP_VAR','I will be saved');

// creat function
1. define function name : ex) FUN1
2. define function body 

function(){
   return 'i am happy';
}

</pre>
   </div>
</div>




	<br>
	<br>

	 <div class="card-block">
                    <div class="table-responsive">
                        <table class="table table-condensed" id="dataTable">
                            <thead>
                                <tr>
					<th>컨테이너 이름</th>
					<th>실행전 스크립트</th>
					<th>실행후 스크립트</th>
					<th>삭제하기</th>
				</tr>
                            </thead>

	<tbody>
	<%
BusinessCollection bc = RequestHelper. getBusinessCollection(request,"getContainerScript");
for(int i = 0; i < bc.size(); i++){
	%>
	<tr>
		<td><a href="javascript:fnSet('<%=bc.getBusinessData(i).getFieldValue("container_name")%>','b-<%=i%>','a-<%=i%>')">
		<%=bc.getBusinessData(i).getFieldValue("container_name")%></a></td>
		<td><div id='b-<%=i%>'><%=bc.getBusinessData(i).getFieldValue("before_script")%></div></td>
		<td><div id='a-<%=i%>'><%=bc.getBusinessData(i).getFieldValue("after_script")%></div></td>
		<td><input type="button" class="btn btn-danger" value="삭제하기" onClick="javascript:fnDeleteScript('<%=bc.getBusinessData(i).getFieldValue("container_name")%>');"></input></td>
	</tr>
   <%
}
   %>
   </tbody>
	</table>

</div>
</div>

<script>
$('#container_name_select').change(function(){
  $('#container_name').val($('#container_name_select').val());
});

</script>
