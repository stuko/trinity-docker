<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.openapi.*"%>
<%@ page import="com.stuko.anaconda.util.*"%>

<%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"list");
BusinessCollection bc2 = RequestHelper.getBusinessCollection(request,"scenario");
BusinessCollection bc3 = RequestHelper.getBusinessCollection(request,"token");
String token = "";
if(bc3 != null  && bc3.size() > 0) {
   token = bc3.getBusinessData(0).getFieldValue("value");
}
%>

<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
$&nbsp;DUNA - ACMA 
    </h3>	
    <li>
      ACMA(Auto Controlling My Asset: 나의 자산 관리 자동화)를 할 수 있도록 지원 해 드립니다. 아래 정보를 입력해 주세요
    </li>
    <li>
      ACMA는 내가 가진 다양한 자산들을 자동으로 관리 할 수 있도록 DUNA의 룰엔진을 활용합니다.
    </li>
    <li>
      ACMA는 내가 가진 다양한 자산과 연결할 수 있는 API정보를 통해 자동화된 자산 관리가 가능합니다.
    </li>
    <li style="color:blue;font-weight:bold">
      ACMA는 내가 만든 다양한 룰엔진의 시나리오를 다른사람들이 사용할 수 있도록 <a href="/Anaconda.do?CMD=CMD_SEQ_108723096481594591078090&kind=MSG">공개</a> 할 수 있습니다.
    </li>
    <li> 
    <span style="color:blue;font-weight:bold">다른 분들이 공개한 ACMA를 복제 하기 : </span>
    <span style="margin-top:2px;">
      <select name="scenario" id="scenario">
        <% 
          if(bc2 != null && bc2.size() > 0) {
            for(int i = 0; i < bc2.size() ; i++){
        %>
           <option value='<%=bc2.getBusinessData(i).getFieldValue("PS_DB_NAME")%>'><%=bc2.getBusinessData(i).getFieldValue("PS_SUBJECT")%></option>
        <%
            }
          }
        %>
      </select>
      <button class="btn btn-primary" onClick="fnReplicateRule()">룰 복제하기</button>
    </span>
    </li>
  </div>

  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th width="300px">이름</th>
        <th scope="col">값</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td>제공회사명</td>
        <td>
        <input type="text" id="vendor" name="vendor" value=""> * simulation 이라고 입력하시면, 시뮬레이션 모드로 실행 할 수 있습니다. ex)upbit
        </td>
      </tr>
      
      <tr>
        <td>채널<br>(텔레그램 채널아이디)</td>
        <td>
        <input type="hidden" id="old_duna_channel" name="old_duna_channel" value="">
        <input type="hidden" id="old_accessKey" name="old_accessKey" value="">
        <input type="hidden" id="old_secretKey" name="old_secretKey" value="">
        <input type="text" id="duna_channel" name="duna_channel" value="">
        </td>
      </tr>
      <tr>
        <td>자산관리 API ACCESS KEY</td>
        <td>
           <input type="text" id="accessKey" name="accessKey" size="50"/>
        </td>
      </tr>
      <tr>
        <td>자산관리 API SECRET KEY</td>
        <td>
           <input type="text" id="secretKey" name="secretKey" size="50"/>
        </td>
      </tr>
      <tr>
        <td>DUNA 토큰</td>
        <td>
           <input type="text" id="duna_token" name="duna_token" size="100" placeholder='<%=token%>'/>
           <br>default : <%=token%>
        </td>
      </tr>
      <tr>
        <td>DUNA 채널 아이디</td>
        <td>
           <input type="text" id="duna_channel_id" name="duna_channel_id" size="100"/>
           <br>* 텔레그램 채널 아이디를 넣어 주세요
        </td>
      </tr>
      <tr>
        <td>DUNA CLIENT ID</td>
        <td>
           <input type="text" id="duna_client_id" name="duna_client_id" size="100" placeholder='<%=session.getAttribute("clientId")%>'/>
           <br>default : <%=session.getAttribute("clientId")%>
        </td>
      </tr>
      <tr>
        <td>DUNA SECRET KEY</td>
        <td>
           <input type="text" id="duna_secret_key" name="duna_secret_key" size="100" placeholder='<%=session.getAttribute("secretKey")%>'/>
           <br>default : <%=session.getAttribute("secretKey")%> 
        </td>
      </tr>
      <tr>
        <td>DUNA URL</td>
        <td>
           <input type="text" id="duna_url" name="duna_url" size="100" placeholder='http://49.247.7.108:8081/'/>
           <br>default : http://49.247.7.108:8081/
        </td>
      </tr>
      <tr>
        <td colspan='2'>
        <span style="margin-right:5px">
         <button class="btn btn-primary" id="btnCreate" onClick="javascript:fnCheckAndExecute(false)">
         추가
         </button>
         <button class="btn btn-danger" id="btnCreate" onClick="javascript:fnModify()">
         수정
         </button>
         <button class="btn btn-warning" id="btnInit" onClick="javascript:fnInit()">
         초기화
         </button>
         <button class="btn btn-danger" id="btnDelete" onClick="javascript:fnDelete()">
          삭제
         </button>
        </span>
        </td>
      </tr>


<%
if(bc != null && bc.size() > 0) {
  for(int i = 0; i < bc.size() ; i++){
%>
      <tr>
        <td colspan='2'>
        <hr />
        <h4>ACMA 기본 정보 목록</h4>
        <div style="color:green">
        <p>
        <table>
        <tr><td style="font-weight:bold">제공회사명</td><td><%=bc.getBusinessData(i).getFieldValue("vendor")%></td></tr>
        <tr><td style="font-weight:bold">채널(텔레그램 채널아이디)</td><td><%=bc.getBusinessData(i).getFieldValue("duna_channel")%></td></tr>
        <tr><td style="font-weight:bold">자산관리 API ACCESS KEY</td><td><%=bc.getBusinessData(i).getFieldValue("access_key")%></td></tr>
        <tr><td style="font-weight:bold">자산관리 API SECRET KEY</td><td><%=bc.getBusinessData(i).getFieldValue("secret_key")%></td></tr>
        <tr><td style="font-weight:bold">DUNA 토큰</td><td><%=bc.getBusinessData(i).getFieldValue("duna_token")%></td></tr>
        <tr><td style="font-weight:bold">DUNA 채널 아이디</td><td><%=bc.getBusinessData(i).getFieldValue("duna_channel_id")%></td></tr>
        <tr><td style="font-weight:bold">DUNA CLIENT ID</td><td><%=bc.getBusinessData(i).getFieldValue("duna_client_id")%></td></tr>
        <tr><td style="font-weight:bold">DUNA SECRET KEY</td><td><%=bc.getBusinessData(i).getFieldValue("duna_secret_key")%></td></tr>
        <tr><td style="font-weight:bold">DUNA URL</td><td><%=bc.getBusinessData(i).getFieldValue("duna_url")%></td></tr>
        </table>
        <span style="margin-right:5px">
        <hr />
        <div>
         <button class="btn btn-warning" id="btnModify" onClick="javascript:fnSetData('<%=bc.getBusinessData(i).getFieldValue("vendor")%>','<%=bc.getBusinessData(i).getFieldValue("duna_channel")%>','<%=bc.getBusinessData(i).getFieldValue("access_key")%>','<%=bc.getBusinessData(i).getFieldValue("secret_key")%>','<%=bc.getBusinessData(i).getFieldValue("duna_token")%>','<%=bc.getBusinessData(i).getFieldValue("duna_channel_id")%>','<%=bc.getBusinessData(i).getFieldValue("duna_client_id")%>','<%=bc.getBusinessData(i).getFieldValue("duna_secret_key")%>','<%=bc.getBusinessData(i).getFieldValue("duna_url")%>')">
         선택
         </button>
         <button class="btn btn-secondary" onClick="fnGetDetail('detail_<%=i%>','<%=bc.getBusinessData(i).getFieldValue("vendor")%>',
                                                        '<%=bc.getBusinessData(i).getFieldValue("duna_client_id")%>','<%=bc.getBusinessData(i).getFieldValue("duna_secret_key")%>',
                                                        '<%=bc.getBusinessData(i).getFieldValue("duna_channel")%>','<%=bc.getBusinessData(i).getFieldValue("duna_account")%>')">ACMA 상세정보 보기</button>
        </span>
        </div>
        <hr />
        <h4>ACMA 상세 정보 관리</h4>
        <hr />
        <div style="margin-top:2px;margin-bottom:2px">
          <div style="margin-top:2px;margin-bottom:2px">이름 : <input type="text" id="detail_name_<%=i%>" name="detail_name_<%=i%>" value="">값 : <input type="text" id="detail_value_<%=i%>" name="detail_value_<%=i%>" value="">
            <button class="btn btn-sm btn-secondary" onClick="fnCreateDetail('detail_name_<%=i%>', 'detail_value_<%=i%>', 'detail_<%=i%>','<%=bc.getBusinessData(i).getFieldValue("vendor")%>',
                                                                  '<%=bc.getBusinessData(i).getFieldValue("duna_client_id")%>',
                                                                  '<%=bc.getBusinessData(i).getFieldValue("duna_secret_key")%>',
                                                                  '<%=bc.getBusinessData(i).getFieldValue("duna_channel")%>',
                                                                  '<%=bc.getBusinessData(i).getFieldValue("duna_account")%>')">상세정보 추가</button>
           <div id='detail_<%=i%>'></div>
        </div>
        </p>
        </div>
        </td>
      </tr>
<%
  }
}else{
%>
      <tr>
        <td colspan="2">정보가 없습니다.</td>
      </tr>
<%
}
%>
      </tbody>
    </table>
  </div>


<script language="javascript">
$(document).ready(function(){

});

function fnDelete(){
  if(!confirm('삭제 하시겠습니까?')) return;
  var d = {duna_channel: $('#duna_channel').val(),accessKey: $('#accessKey').val(),secretKey: $('#secretKey').val()};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_108451900411667267097778' ,
    type: 'POST',
    data : d,
    dataType : 'json',
    success : function (data){
       document.location.reload();
    },
    error : function (err) {
       alert(err);
    }
 });
}

function fnSetData(vendor, duna_channel, accessKey, secretKey, duna_token, duna_channel_id, duna_client_id, duna_secret_key, duna_url){
   $('#vendor').val(vendor);
   $('#duna_channel').val(duna_channel);
   $('#accessKey').val(accessKey);
   $('#secretKey').val(secretKey);
   $('#duna_token').val(duna_token);
   $('#duna_channel_id').val(duna_channel_id);
   $('#duna_client_id').val(duna_client_id);
   $('#duna_secret_key').val(duna_secret_key);
   $('#old_duna_channel').val(duna_channel);
   $('#old_accessKey').val(accessKey);
   $('#old_secretKey').val(secretKey);
   $('#duna_url').val(duna_url);

   var d = {vendor: $('#vendor').val(),duna_channel: $('#duna_channel').val(),accessKey: $('#accessKey').val(),secretKey: $('#secretKey').val(),old_duna_channel: $('#old_duna_channel').val(),old_accessKey: $('#old_accessKey').val(),old_secretKey: $('#old_secretKey').val(),duna_token: $('#duna_token').val(),duna_channel_id: $('#duna_channel_id').val(),duna_client_id: $('#duna_client_id').val(),duna_secret_key: $('#duna_secret_key').val(),duna_url: $('#duna_url').val()};     
   $.ajax({
     url : '/Anaconda.json?CMD=CMD_SEQ_100627974591667267101647' ,
     type: 'POST',
     data : d,
     dataType : 'json',
     success : function (data){
       console.log(data);
       $('#vendor').val(data.read[0].vendor);
       $('#duna_channel').val(data.read[0].duna_channel);
       $('#accessKey').val(data.read[0].access_key);
       $('#secretKey').val(data.read[0].secret_key);
       $('#duna_token').val(data.read[0].duna_token);
       $('#duna_channel_id').val(data.read[0].duna_channel_id);
       $('#duna_client_id').val(data.read[0].duna_client_id);
       $('#duna_secret_key').val(data.read[0].duna_secret_key);
       $('#duna_url').val(data.read[0].duna_url);
     },
     error : function (err) {
        alert(err);
     }
  });

}

function fnCheckAndExecute(is_modify){

var d = {vendor: $('#vendor').val(),duna_channel: $('#duna_channel').val(),accessKey: $('#accessKey').val(),secretKey: $('#secretKey').val(),old_duna_channel: $('#old_duna_channel').val(),old_accessKey: $('#old_accessKey').val(),old_secretKey: $('#old_secretKey').val(),duna_token: $('#duna_token').val(),duna_channel_id: $('#duna_channel_id').val(),duna_client_id: $('#duna_client_id').val(),duna_secret_key: $('#duna_secret_key').val(),duna_url: $('#duna_url').val()};     
   $.ajax({
     url : '/Anaconda.json?CMD=CMD_SEQ_100627974591667267101647' ,
     type: 'POST',
     data : d,
     dataType : 'json',
     success : function (data){
       if(data.read.length == 0) {
          if(is_modify) fnModify();
          else fnCreate();
       }else{
          alertPopup('warning' , '데이터가 이미 존재합니다.');
       }
     },
     error : function (err) {
        alert(err);
     }
  });

}

function fnModify(){
  if(!confirm('수정 하시겠습니까?')) return;
  var d = {vendor: $('#vendor').val(),duna_channel: $('#duna_channel').val(),accessKey: $('#accessKey').val(),secretKey: $('#secretKey').val(),old_duna_channel: $('#old_duna_channel').val(),old_accessKey: $('#old_accessKey').val(),old_secretKey: $('#old_secretKey').val(),duna_token: $('#duna_token').val(),duna_channel_id: $('#duna_channel_id').val(),duna_client_id: $('#duna_client_id').val(),duna_secret_key: $('#duna_secret_key').val(),duna_url: $('#duna_url').val()};        
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_107366678511667267094156' ,
    type: 'POST',
    data : d,
    dataType : 'json',
    success : function (data){
      document.location.reload();
    },
    error : function (err) {
       alert(err);
    }
 });
}


function fnInit(){
  if($('#duna_channel').val() == ''){
   alertPopup('경고','ACMA DUNA 채널 정보가 없습니다. 아래에 정보 선택 버튼을 눌러 주세요.');
   return;
  }
  if(!confirm('ACMA를 초기화 하시겠습니까? 이전 설정은 모두 삭제 됩니다. 현재 입력하신 '  + $('#duna_channel').val() + ' 채널에 대한 ACMA 설정을 초기화 하겠습니다.')) return;
  var d = {duna_channel: $('#duna_channel').val(),duna_channel_1: $('#duna_channel').val(),duna_channel_2: $('#duna_channel').val()};        
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_108693297561686535523939' ,
    type: 'POST',
    data : d,
    dataType : 'json',
    success : function (data){
      document.location.reload();
    },
    error : function (err) {
       alert(err);
    }
 });
}


function fnCreate(){
  if(!confirm('추가 하시겠습니까?')) return;
  var d = {vendor: $('#vendor').val(),duna_channel: $('#duna_channel').val(),accessKey: $('#accessKey').val(),secretKey: $('#secretKey').val(),duna_token: $('#duna_token').val(),duna_channel_id: $('#duna_channel_id').val(),duna_client_id: $('#duna_client_id').val(),duna_secret_key: $('#duna_secret_key').val(),duna_url: $('#duna_url').val()};     
  $.ajax({
    url : '/Anaconda.json?CMD=CMD_SEQ_102418592241667267088861' ,
    type: 'POST',
    data : d,
    dataType : 'json',
    success : function (data){
      document.location.reload();
    },
    error : function (err) {
       alert(err);
    }
 });
}


function fnGetDetail(div_id, vendor, duna_client_id, duna_secret_key, duna_channel, duna_account){

var d = {vendor: vendor,
         duna_channel: duna_channel,
         duna_client_id: duna_client_id,
         duna_secret_key: duna_secret_key,
         duna_account: duna_account
        };     
   $.ajax({
     url : '/Anaconda.json?CMD=CMD_SEQ_103683866491671929541979' ,
     type: 'POST',
     data : d,
     dataType : 'json',
     success : function (data){
       console.log(data);
       if(data.list.length > 0) { 
          $('#'+div_id).empty();
          $('#'+div_id).append('<hr />');
          $('#'+div_id).append('<h4> ACMA 상세 정보 목록 </h4>');
          $('#'+div_id).append('<hr />');
          for(var i = 0; i < data.list.length ; i++){
            $('#'+div_id).append(''+
              '<div style="margin-top:2px;margin-bottom:2px">'+
              '  <li>이름 : <input type="text" name="" value="'+data.list[i].name+'" id="">값 : <input type="text" name="" value="'+data.list[i].value+'" id="'+data.list[i].name+i+'">'+
//               '  <div style="margin-top:2px;margin-bottom:2px">' + 
              '   <button class="btn btn-sm btn-secondary" onClick="fnUpdateDetail(\''+div_id+'\',\''+data.list[i].name+i+'\',\''+
                  vendor+'\',\''+duna_client_id+'\',\''+duna_secret_key+'\',\''+duna_channel+'\',\''+duna_account+'\',\''+data.list[i].name+
                  '\')">수정</button>'+
              '   <button class="btn btn-sm btn-secondary" onClick="fnDeleteDetail(\''+div_id+'\',\''+
                  vendor+'\',\''+duna_client_id+'\',\''+duna_secret_key+'\',\''+duna_channel+'\',\''+duna_account+'\',\''+data.list[i].name+
                  '\')">삭제</button>' + 
               ''+
              '</div>'+
              '');
          }
          $('#'+div_id).append('<hr />');
       }else{
          $('#'+div_id).empty();
          $('#'+div_id).append(''+
              '<div style="margin-top:2px;margin-bottom:2px">'+
              '  상세정보가 없습니다.'+
              '</div>'+
              '');
       }
     },
     error : function (err) {
        alert(err);
     }
  });

}

function fnCreateDetail(name_id, value_id, div_id, vendor, duna_client_id, duna_secret_key, duna_channel, duna_account){
  if($('#'+name_id).val() == '' || $('#' + value_id).val() == ''){
    alert('상세정보(이름/값)를 입력해 주세요');
    return ;
  } 
  var param = {
    vendor : vendor, duna_client_id : duna_client_id, duna_secret_key, duna_secret_key, duna_channel : duna_channel, duna_account : duna_account, name : $('#'+name_id).val(), value: $('#' + value_id).val()
  }
  post(param,'CMD_SEQ_107048048291671929556071', (data)=>{ 
                                                     alert("저장되었습니다");
                                                     fnGetDetail(div_id, vendor, duna_client_id, duna_secret_key, duna_channel, duna_account);
                                                 } , (err)=>{
                                                     alert("에러가 발생하였습니다");
                                                 });

}


function fnDeleteDetail(div_id, vendor, duna_client_id, duna_secret_key, duna_channel, duna_account, name){
  var param = {
    vendor : vendor, duna_client_id : duna_client_id, duna_secret_key, duna_secret_key, duna_channel : duna_channel, duna_account : duna_account, name : name
  }
  post(param,'CMD_SEQ_105535302241671929569631', (data)=>{ 
                                                     alert("삭제되었습니다");
                                                     fnGetDetail(div_id, vendor, duna_client_id, duna_secret_key, duna_channel, duna_account);
                                                 } , (err)=>{
                                                     alert("에러가 발생하였습니다");
                                                 });

}

function fnUpdateDetail(div_id, val_id, vendor, duna_client_id, duna_secret_key, duna_channel, duna_account, name){
  var param = {
    value: $('#'+val_id).val(), vendor : vendor, duna_client_id : duna_client_id, duna_secret_key, duna_secret_key, duna_channel : duna_channel, duna_account : duna_account, name : name
  }
  post(param,'CMD_SEQ_102078210521703810768557', (data)=>{ 
                                                     alert("수정되었습니다");
                                                     fnGetDetail(div_id, vendor, duna_client_id, duna_secret_key, duna_channel, duna_account);
                                                 } , (err)=>{
                                                     alert("에러가 발생하였습니다");
                                                 });

}


function fnReplicateRule(){
  if(!confirm('복제를 하실 경우, 기존 룰은 모두 삭제 됩니다. 계속할까요?')) return;
  param = { scenario: $('#scenario').val() };
  post(param,'CMD_SEQ_106272641071671949171597', (data)=>{ 
                                                     alert("복제 되었습니다.");
                                                 } , (err)=>{
                                                     alert("에러가 발생하였습니다");
                                                 });


}

</script>
