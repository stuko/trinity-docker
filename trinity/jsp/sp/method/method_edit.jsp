<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<div id="Method">
<h3>방법론 관리</h3>
<br/>
<div >
 <div>
    <div>
     <input type="text" id="MethodologyName" name="MethodologyName" size="50" />&nbsp;      <input type="button" class="btn btn-primary" value="방법론추가" onClick="javascript:createMethod();"></input>
    </div>
</div>
</div>
<br/>

<div >
  <select id="choiceMethod" onchange="javascript:changeMethod(this);">
    <option value="">선택</option>
  </select>
</div>
<br/>

<div class="card-block">
<div class="table-responsive">
<table width="100%" class="table table-bordered" id="dataTable" cellspacing="0">
<thead>
<tr>
<th>방법론 단계</th>
<th>방법론 행동</th>
<th>삭제</th>
</tr>
</thead>
<tfoot>
<tr>
<th>방법론 단계</th>
<th>방법론 행동</th>
<th>삭제</th>
</tr>
</tfoot>
<tbody id="tBody">
</tbody>
</table>
</div>
</div>
<script language="javascript">
       function loadMethod(){
          var d= {CMD:'CMD_SEQ_106843409661500958350582'};
          $.ajax({
                    url:"/Anaconda.json",
                    type:"POST",
                    headers: {
                          "Accept" : "application/json; charset=utf-8" , "charset" : "utf-8"
                    },
                    data:d,
                    dataType:"json",
                    success: function (data) {
                            // alert(JSON.stringify(data));
                            if(data.MethodList && data.MethodList.length != 0){
                              for(var i = 0; i < data.MethodList.length; i++){
                                $("#choiceMethod").append("<option value='"+data.MethodList[i].MethodologyCode+"'>"+data.MethodList[i].MethodologyName+"</option>");
                              }
                            }
                    }
                  });
        }
      function changeMethod(sel){
          var MCode = $("#choiceMethod option:selected").val();
          var d= {MethodologyCode : MCode , CMD:'CMD_SEQ_104178628611500956664491'};
          $.ajax({
                    url:"/Anaconda.json",
                    type:"POST",
                    headers: {
                          "Accept" : "application/json; charset=utf-8" , "charset" : "utf-8"
                    },
                    data:d,
                    dataType:"json",
                    success: function (data) {
                            // alert(JSON.stringify(data));
                             $("#tBody").html('');
                            if(data.PhaseList && data.PhaseList.length != 0){
                              for(var i = 0; i < data.PhaseList.length; i++){
                                var div = 'D-' + new Date().toISOString().slice(0,10).replace(/-/g,"") + '-' + (Math.random()*1000000);
                                $("#tBody").append("<tr><td>"+data.PhaseList[i].PhaseName+"</td><td><div id='"+div+"' /></td><td><input type='button' class='btn btn-primary' value='삭제' onClick='javascript:deletPhase();'></input></td></tr>");
                                var PhaseCode = data.PhaseList[i].PhaseCode;
                                changeActivity(PhaseCode, div);
                              }
                            }
                    }
                  });
        }
        function changeActivity(PCode,tDiv){
          var d= {PhaseCode : PCode , CMD:'CMD_SEQ_105348746431500956668200'};
          $.ajax({
                    url:"/Anaconda.json",
                    type:"POST",
                    headers: {
                          "Accept" : "application/json; charset=utf-8" , "charset" : "utf-8"
                    },
                    data:d,
                    dataType:"json",
                    success: function (data) {
                            // alert(JSON.stringify(data));
                            $("#" + tDiv).html('');
                            if(data.ActivityList && data.ActivityList.length != 0){
                              for(var i = 0; i < data.ActivityList.length; i++){
                                var div = 'D-' + new Date().toISOString().slice(0,10).replace(/-/g,"") + '-' + (Math.random()*1000000);
                                $("#" + tDiv).append("<div id='"+div+"'>"+data.ActivityList[i].ActivityName+"</div>");
                                // alert($("#" + tDiv).html());
                              }
                            }
                    }
                  });
        }
        function createMethod(){
          var code = 'M-' + new Date().toISOString().slice(0,10).replace(/-/g,"") + '-' + (Math.random()*1000000);
          var d= {MethodologyCode : code,
                  MethodologyName : $('#MethodologyName').val(),
                  CMD:'CMD_SEQ_108572767821500959202960'};
          $.ajax({
                    url:"/Anaconda.json",
                    type:"POST",
                    headers: {
                          "Accept" : "application/json; charset=utf-8" , "charset" : "utf-8"
                    },
                    data:d,
                    dataType:"json",
                    success: function (data) {
                      alert('방법론이 생성되었습니다. 아래 단계와 행위정보를 입력해 주세요');
                      $('#MethodologyName').val('')
                      loadMethod();
                    }
                  });
        }
                
        window.onload = function(){
          loadMethod();
        }
        
        
        
// $("#selBox option:selected").val();
// $("#selBox option:selected").text();
        
// CMD_SEQ_104178628611500956664491 : 단계정보
// CMD_SEQ_105348746431500956668200 : 행동정보
// CMD_SEQ_109552234651500956671823 : 산출물 정보
</script>

