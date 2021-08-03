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

<style>

.fs-it-btn {
  // margin-top: 10px;
  margin-left: 50px;
  border: 1px solid #a2a2a2;
  border-radius: 10;
  color: #fff;
  font-weight: bold;
  font-size:20px;
}
.fs-it-btn-vertical-line {
  text-align:center;
  padding: 4px 0 5px 10px;
  margin-left: 10px;
  border-left: 1px solid #a2a2a2;
}
.bg-blue {
    background-color: #2c9deb;
}
.text-uppercase {
    text-transform: uppercase;
}
.fs-it-btn:hover {
    text-decoration: none;
    color:#fff;
}

.fa {
    color: #fff;
}


h3{
    font-family: 'Poppins', sans-serif;
}

.social-box .box{
    background: #FFF;
    border-radius: 10px; 
    padding: 40px 10px;
    margin: 20px 0px;
    cursor: pointer;
    transition: all 0.5s ease-out;
}

.social-box .box:hover{
   box-shadow: 0 0 6px #4183D7;
}

.social-box .box .box-text{
    margin:20px 0px;
    font-size: 15px;
    line-height: 30px;
}

.social-box .box .box-btn a{
    text-decoration: none;
    color: #4183D7;
    font-size: 16px;
}






.circle2 {
  padding: 13px 20px;
  border-radius: 50%;
  background-color: #ED8D8D;
  color: #fff;
  max-height: 50px;
  z-index: 2;
}

.how-it-works.row .col-2 {
  align-self: stretch;
}
.how-it-works.row .col-2::after {
  content: "";
  position: absolute;
  border-left: 3px solid #ED8D8D;
  z-index: 1;
}
.how-it-works.row .col-2.bottom::after {
  height: 50%;
  left: 50%;
  top: 50%;
}
.how-it-works.row .col-2.full::after {
  height: 100%;
  left: calc(50% - 3px);
}
.how-it-works.row .col-2.rfull::after {
  height: 100%;
  left: calc(50% - 3px);
}
.how-it-works.row .col-2.lfull::after {
  height: 100%;
  left: 50%;
  top: 0;
}
.how-it-works.row .col-2.top::after {
  height: 50%;
  left: 50%;
  top: 0;
}


.timeline div {
  padding: 0;
  height: 40px;
}
.timeline hr {
  border-top: 3px solid #ED8D8D;
  margin: 0;
  top: 17px;
  position: relative;
}
.timeline .col-2 {
  display: flex;
  overflow: hidden;
}
.timeline .corner {
  border: 3px solid #ED8D8D;
  width: 100%;
  position: relative;
  border-radius: 15px;
}
.timeline .top-right {
  left: 50%;
  top: -50%;
}
.timeline .left-bottom {
  left: -50%;
  top: calc(50% - 3px);
}
.timeline .top-left {
  left: -50%;
  top: -50%;
}
.timeline .right-bottom {
  left: 50%;
  top: calc(50% - 3px);
}



.spinner * {
  text-align: center;
  height:50px;
}
.spinner input::-webkit-outer-spin-button,
.spinner input::-webkit-inner-spin-button {
  margin: 0;
  -webkit-appearance: none;
}
.spinner input:disabled {
  background-color: white;
}

#input{
  border: 1px solid;
  padding: 10px;
  box-shadow: 5px 10px 18px #888888;
}

.row{
   margin-left:50px;
}

.ds-btn li{ list-style:none; float:left; padding:10px; margin:10px;}
.ds-btn li a span{padding-left:15px;padding-right:5px;width:100%;display:inline-block; text-align:left;}
.ds-btn li a span small{width:100%; display:inline-block; text-align:left;}

.timeline-template {
  display:none;
}

.blink{
  color: rgb (0, 137, 226);
  animation: blink 1s infinite;
}
	 
@keyframes blink{
  0%{opacity: 1;}
  75%{opacity: 1;}
  76%{ opacity: 0;}
  100%{opacity: 0;}
}


.arrowup {
  width: 0; 
  height: 0; 
  border-left: 60px solid transparent;
  border-right: 60px solid transparent;
  border-bottom: 60px solid #337ab7;
}

.arrowdown {
  width: 0; 
  height: 0; 
  border-left: 60px solid transparent;
  border-right: 60px solid transparent;
  border-top: 60px solid #5bc0de;
}

.arrowright {
  width: 0; 
  height: 0; 
  border-top: 30px solid transparent;
  border-bottom: 30px solid transparent;
  border-left: 30px solid #FFFFFF;
}

.arrowleft {
  width: 0; 
  height: 0; 
  border-top: 60px solid transparent;
  border-bottom: 60px solid transparent; 
   border-right:60px solid #f0ad4e; 
}

</style>


<div class="container-fluid">

  <h2 class="pb-3 pt-2 border-bottom mb-5"><i class="far fa-calendar-alt"></i> 계획세우기    
    <span style="align:right">
     <button type="button" class="btn bg-blue fs-it-btn" id="add_plan">
       <i class="fa fa-plus" aria-hidden="true"></i>
        <span class="fs-it-btn-vertical-line"></span>
          <span id="add_plan_text">계획 추가</span></button>
    </span>
    <span style="align:right">
     <button type="button" class="btn bg-danger fs-it-btn" id="apply_plan">
       <i class="fa fa-refresh" aria-hidden="true"></i>
        <span class="fs-it-btn-vertical-line"></span>
          <span id="apply_plan_text">계획 반영(대화룰 생성)</span></button>
    </span>
  </h2>

  <div class="row" id="input" style="display:none;box-shadow: 0 0 6px #4183D7;">
	<h4><i class="fas fa-chevron-right"></i><strong style="margin-left:10px;">추가할 계획을 입력해 주세요 </strong> <br/></h4><br/>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<!-- Start form -->
                    <form>
                      <input type="hidden" name="PL_KEY" id="PL_KEY">
                      <div class="form-group">
                        <label for="exampleInputTitle">제목</label>
                        <input type="text" class="form-control" id="PL_TITLE" placeholder="제목을 입력해 주세요">
                      </div>
                      <div class="form-group">
                        <label for="exampleInputSeq">순서</label>
  <div class="input-group spinner" style="width:200px;margin-bottom:20px;">
    <div class="input-group-prepend">
      <button class="btn btn-danger minus_seq" type="button">-</button>
    </div>
    <input type="number" class="count_seq form-control" min="0" max="100" step="1" id="PL_SEQ" value="0">
    <div class="input-group-append">
      <button class="btn btn-info plus_seq" type="button">+</button>
    </div>
  </div>
                      </div>

                      <div class="form-group">
                        <label for="exampleInputEmail1">계획이 차지하는 비율</label>


  <div class="input-group spinner" style="width:200px;margin-bottom:20px;">
    <div class="input-group-prepend">
      <button class="btn btn-danger minus_percent" type="button">-</button>
    </div>
    <input type="number" class="count_percent form-control" min="0" max="100" step="1" id="PL_PERCENT" value="1">
    <div class="input-group-append">
      <button class="btn btn-info plus_percent" type="button">+</button>
    </div>
  </div>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputEmail1">계획의 우선순위(가중치)</label>

 <div class="input-group spinner" style="width:200px;margin-bottom:20px;">
    <div class="input-group-prepend">
      <button class="btn btn-danger minus_weight" type="button">-</button>
    </div>
    <input type="number" class="count_weight form-control" min="0" max="100" step="1" id="PL_WEIGHT" value="1">
    <div class="input-group-append">
      <button class="btn btn-info plus_weight" type="button">+</button>
    </div>
  </div>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputEmail1">계획의 주요 내용</label>
                        <textarea class="form-control" id="PL_TEXT" placeholder="주요 내용을 입력해 주세요" rows="10" cols="100"></textarea>    
                      </div>

                    </form>

			<!-- End form -->
		</div>

       <ul class="ds-btn">
        <button id="resetPlan" class="btn btn-lg btn-danger">
           <i class="glyphicon glyphicon-list pull-left"></i>
           <span>초기화<br><small>입력내용을 초기화합니다</small></span><br>
           <i style="font-size:50px;" class="far fa-times-circle"></i>
        </button >
        <button id="save" class="btn btn-lg btn-primary">
          <i class="glyphicon glyphicon-user pull-left"></i>
          <span>계획 저장<br><small>첫번째 계획을 저장 혹은 하위계획 수정</small></span><br>
          <i style="font-size:50px;" class="far fa-arrow-alt-circle-up"></i>
        </button>
        <button id="addPlan" class="btn btn-lg btn-info">
           <i class="glyphicon glyphicon-list pull-left"></i>
           <span>하위계획 추가<br><small>두번째 이후 계획을 추가합니다</small></span><br>
           <i style="font-size:50px;" class="far fa-arrow-alt-circle-down"></i>
           <!--i style="font-size:50px;" class="far fa-arrow-alt-circle-right"></i-->
        </button >
       </ul>

     <div class="container" id="subPlan">
     </div>

   </div>

</div>


 <div class="col-lg-4 col-xs-12 text-center" id="plan_card" style="display:none;">
   <div class="box">
     <i class="fa fa-behance fa-3x" aria-hidden="true"></i>
       <div class="box-title">
	 <h3 class="card_title"></h3>
       </div>
       <div class="box-text">
         <span class="card_text"></span>
       </div>
       <div class="box-btn">
<!--	 <button class="btn btn-danger" onClick="continueData(this);">
           상세계획
           <span style="display:none" class="PL_KEY"></span>
           <span style="display:none" class="PL_SEQ"></span> 
         </button>  -->
	 <button class="btn btn-info" onClick="modifyData(this);">
           자세히 보기
           <span style="display:none" class="PL_KEY"></span>
           <span style="display:none" class="PL_SEQ"></span>
         </button>
	 <button class="btn btn-danger" onClick="deleteData(this);">
           삭제
           <span style="display:none" class="PL_KEY"></span>
           <span style="display:none" class="PL_SEQ"></span>
         </button>

       </div>
  </div>
 </div>	 



<div class="social-box">
    <div class="container-fluid">
     	<div class="row text-center" id="plan_list">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
        <br><br> <h2 style="color:#0fad00">계획을 세워보세요</h2>
        <h5>DUNA가 시간을 잘 관리하는 똑똑한 로봇이 되도록 만들어 주세요</h5>
        <p class="text-center" style="font-size:20px;color:#5C5C5C;width:70%">
        </p>
    <br><br>
        </div>
	</div>		
    </div>
</div>




<div id="first-timeline" class="timeline-template">
    <div class="row align-items-center how-it-works d-flex">
      <div class="col-2 text-center bottom d-inline-flex justify-content-center align-items-center">
        <div class="circle2 font-weight-bold PL_SEQ"></div>
      </div>
      <div class="col-6">
        <span style="display:none" class="PL_KEY"></span>
        <h5 class="PL_TITLE"></h5>
        <p  class="PL_TEXT"></p>
	 <button class="btn btn-info" onClick="modifyData(this);">
           수정 하기
           <span style="display:none" class="PL_KEY"></span>
           <span style="display:none" class="PL_SEQ"></span>
         </button>
	 <button class="btn btn-secondary" onClick="goSubPlan(this);">
           하위 계획
           <span style="display:none" class="PL_KEY"></span>
           <span style="display:none" class="PL_SEQ"></span>
         </button>

	 <button class="btn btn-danger" onClick="deleteData(this);">
           삭제
           <span style="display:none" class="PL_KEY"></span>
           <span style="display:none" class="PL_SEQ"></span>
         </button>
      </div>
    </div>
</div>



<div id="odd-timeline" class="timeline-template">
    <div class="row timeline">
      <div class="col-2">
        <div class="corner top-right"></div>
      </div>
      <div class="col-8">
        <hr/>
      </div>
      <div class="col-2">
        <div class="corner left-bottom"></div>
      </div>
    </div>
    <!--second section-->
    <div class="row align-items-center justify-content-end how-it-works d-flex">
      <div class="col-6 text-right">
        <span style="display:none" class="PL_KEY"></span>
        <h5 class="PL_TITLE"></h5>
        <p  class="PL_TEXT"></p>
	 <button class="btn btn-info" onClick="modifyData(this);">
           수정 하기
           <span style="display:none" class="PL_KEY"></span>
           <span style="display:none" class="PL_SEQ"></span>
         </button>
	 <button class="btn btn-secondary" onClick="goSubPlan(this);">
           하위 계획
           <span style="display:none" class="PL_KEY"></span>
           <span style="display:none" class="PL_SEQ"></span>
         </button>

	 <button class="btn btn-danger" onClick="deleteData(this);">
           삭제
           <span style="display:none" class="PL_KEY"></span>
           <span style="display:none" class="PL_SEQ"></span>
         </button>
      </div>
      <div class="col-2 text-center rfull d-inline-flex justify-content-center align-items-center">
        <div class="circle2 font-weight-bold PL_SEQ"></div>
      </div>
    </div>
</div>




<div id="even-timeline" class="timeline-template">
    <div class="row timeline">
      <div class="col-2">
        <div class="corner right-bottom"></div>
      </div>
      <div class="col-8">
        <hr/>
      </div>
      <div class="col-2">
        <div class="corner top-left"></div>
      </div>
    </div>
    <!--third section-->
    <div class="row align-items-center how-it-works d-flex">
      <div class="col-2 text-center lfull d-inline-flex justify-content-center align-items-center">
        <div class="circle2 font-weight-bold PL_SEQ"></div>
      </div>
      <div class="col-6">
        <span style="display:none" class="PL_KEY"></span>
        <h5 class="PL_TITLE"></h5>
        <p  class="PL_TEXT"></p>
	 <button class="btn btn-info" onClick="modifyData(this);">
           수정 하기
           <span style="display:none" class="PL_KEY"></span>
           <span style="display:none" class="PL_SEQ"></span>
         </button>
	 <button class="btn btn-secondary" onClick="goSubPlan(this);">
           하위 계획
           <span style="display:none" class="PL_KEY"></span>
           <span style="display:none" class="PL_SEQ"></span>
         </button>

	 <button class="btn btn-danger" onClick="deleteData(this);">
           삭제
           <span style="display:none" class="PL_KEY"></span>
           <span style="display:none" class="PL_SEQ"></span>
         </button>

      </div>
    </div>
</div> 




<script>

function toggleSubList(){
  if($('#PL_KEY').val() == '' || $('#PL_SEQ').val() == '') $('#subList').hide();
  else  $('#subList').show();
}

function toggleInput(){
  $("#input").toggle();
  if($("#add_plan_text").text() == '계획 추가') {
     $("#add_plan_text").text('입력 화면 닫기');
     toggleSubList();
  }
  else  $("#add_plan_text").text('계획 추가');
}

function openInput(){
  $("#input").show();
  $("#add_plan_text").text('입력 화면 닫기');
  toggleSubList();
}

function closeInput(){
  $("#input").hide();
  $("#add_plan_text").text('계획 추가');
  $('#subList').show();
}

$("#resetPlan").on('click', function(){
  $('#PL_KEY').val('');
  $('#PL_SEQ').val('0');
  $('#PL_TITLE').val('');
  $('#PL_TEXT').val('');
  $('#PL_PERCENT').val('1');
  $('#PL_WEIGHT').val('1');
});

$("#add_plan").on('click', function(){
  toggleInput();
});

$("#apply_plan").on('click', function(){
  confirmPopup('확인','만드신 계획을 대화룰에 반영할까요?',()=>{
    var cmd = 'CMD_SEQ_109432617651618016200278';
    json({},cmd
         ,(data)=>{
             alertPopup('성공','요청하신 내용을 저장 하였습니다.');
         },(err)=>{
             alertPopup('실패','요청하신 내용을 저장하지 못했습니다.['+err+']');
         });
    });
});

$("#save").on('click', function(){

 if($('#PL_TITLE').val() == '') {alertPopup('경고','제목을 꼭 입력해주세요'); return;}
 if($('#PL_TEXT').val() == '') {alertPopup('경고','계획의 내용을 꼭 입력해주세요'); return;}
 if($('#PL_WEIGHT').val() == '') {alertPopup('경고','계획의 가중치를 꼭 입력해주세요'); return;}
 if($('#PL_PERCENT').val() == '') {alertPopup('경고','계획의 전체 비중을 꼭 입력해주세요'); return;}

 confirmPopup('확인','요청하신 정보를 저장할까요?',()=>{
    var cmd = 'CMD_SEQ_104715821941608069599860';
    if($('#PL_KEY').val() != '')cmd = 'CMD_SEQ_106209110201608069603350'; 
    var d = {PL_TITLE: $('#PL_TITLE').val()
            ,PL_TEXT: $('#PL_TEXT').val()
            ,PL_WEIGHT: $('#PL_WEIGHT').val()
            ,PL_PERCENT: $('#PL_PERCENT').val()
            ,PL_KEY : $('#PL_KEY').val()
            ,PL_SEQ : $('#PL_SEQ').val()
            };
    console.log(d); 
    json(d,cmd
         ,(data)=>{
             alertPopup('성공','요청하신 내용을 저장 하였습니다.');
             $('#PL_TITLE').val('');
             $('#PL_TEXT').val('');
             $('#PL_WEIGHT').val('1');
             $('#PL_PERCENT').val('1');
             $('#PL_KEY').val('');
             $('#PL_SEQ').val('');
             list(); 
             toggleInput();
         },(err)=>{
             alertPopup('실패','요청하신 내용을 저장하지 못했습니다.['+err+']');
         });
    });
});

$("#addPlan").on('click', function(){
 if($('#PL_TITLE').val() == '') {alertPopup('경고','제목을 꼭 입력해주세요'); return;}
 if($('#PL_TEXT').val() == '') {alertPopup('경고','계획의 내용을 꼭 입력해주세요'); return;}
 if($('#PL_WEIGHT').val() == '') {alertPopup('경고','계획의 가중치를 꼭 입력해주세요'); return;}
 if($('#PL_PERCENT').val() == '') {alertPopup('경고','계획의 전체 비중을 꼭 입력해주세요'); return;}

 confirmPopup('확인','요청하신 하위 계획을 추가할까요?',()=>{
   var d = { PL_KEY: $('#PL_KEY').val()
            ,PL_SEQ: $('#PL_SEQ').val()
            ,PL_PERCENT: $('#PL_PERCENT').val()
            ,PL_WEIGHT: $('#PL_WEIGHT').val()
            ,PL_TITLE: $('#PL_TITLE').val()
            ,PL_TEXT: $('#PL_TEXT').val()
           };
    console.log(d); 
    json(d,'CMD_SEQ_109182023681608159175931' //  'CMD_SEQ_100607777721608343038619'
         ,(data)=>{
             openInput();
             subPlan();
         },(err)=>{
             alertPopup('실패','요청하신 정보를 가져올수 없습니다.['+err+']');
    });
  });
});


function subPlan(){

    var d = {PL_KEY : $('#PL_KEY').val()};
    console.log(d); 
    json(d,'CMD_SEQ_101989939821608159061366'
         ,(data)=>{
            if(data && data.subList && data.subList.length > 0){
              $('#subPlan').html('');
              var idx = 0;
              for(var one in data.subList){
                console.log(data.subList[one].PL_TITLE); 
                var timeline; 
                if(idx == 0){
                  timeline = $('#first-timeline').clone();
                }else if( idx%2 == 1){
                  timeline = $('#odd-timeline').clone();
                }else if( idx%2 == 0){
                  timeline = $('#even-timeline').clone();
                }
                idx++;
                timeline.find('.PL_KEY').html(data.subList[one].PL_KEY);
                timeline.find('.PL_SEQ').html(data.subList[one].PL_SEQ);
                timeline.find('.PL_TEXT').html(data.subList[one].PL_TEXT.replace(/\n/g,'<br>'));
                timeline.find('.PL_TITLE').html(data.subList[one].PL_TITLE);                
                timeline.show();
                console.log(timeline.html());
                $('#subPlan').append(timeline.html());
              }
            }else{
              // alertPopup('확인','상세계획이 없군요. 상세계획을 작성해 보세요.');
              $('#subList').show();
            }
         },(err)=>{
             alertPopup('실패','요청하신 정보를 조회 하지 못했습니다.['+err+']');
    });

}

function modifyData(object){
   var d = { PL_KEY: $(object).find('.PL_KEY').text()
            ,PL_SEQ: $(object).find('.PL_SEQ').text()
           };
    console.log(d); 
    json(d,'CMD_SEQ_100827062361608159171296'
         ,(data)=>{
             $('#PL_KEY').val(data.read[0].PL_KEY);
             $('#PL_SEQ').val(data.read[0].PL_SEQ);
             $('#PL_TITLE').val(data.read[0].PL_TITLE);
             $('#PL_TEXT').val(data.read[0].PL_TEXT);
             $('#PL_PERCENT').val(data.read[0].PL_PERCENT);
             $('#PL_WEIGHT').val(data.read[0].PL_WEIGHT);           
             openInput();
             subPlan();
             $('#PL_TITLE').focus();
         },(err)=>{
             alertPopup('실패','요청하신 정보를 가져올수 없습니다.['+err+']');
    });
}

function deleteData(object){

 confirmPopup('확인','요청하신 정보를 삭제할까요? 상세 계획 내용도 함께 삭제 됩니다.',()=>{
   var d = { PL_KEY: $(object).find('.PL_KEY').text()
            ,PL_SEQ: $(object).find('.PL_SEQ').text()
           };
    var cmd = 'CMD_SEQ_101021056761608343415753';
    if($(object).find('.PL_SEQ').text() == '0') cmd = 'CMD_SEQ_103424365001608069606597';
    console.log(d); 
    json(d, cmd
         ,(data)=>{
             list();
             alertPopup('성공','요청하신 내용을 삭제 하였습니다.');
         },(err)=>{
             alertPopup('실패','요청하신 내용을 삭제하지 못했습니다.['+err+']');
    });
  });
}

function list(){
  var d = {};
  json(d,'CMD_SEQ_109042683621608069594697'
  ,(data)=>{
    console.log(data);
    if(data && data.list && data.list.length > 0){
      $('#plan_list').html('');
      for(var one in data.list){
        console.log(data.list[one].PL_TITLE); 
        var card = $('#plan_card').clone();
        card.find('.card_title').text(data.list[one].PL_TITLE);
        card.find('.card_text').text(data.list[one].PL_TEXT);
        card.find('.PL_KEY').text(data.list[one].PL_KEY);
        card.find('.PL_SEQ').text(data.list[one].PL_SEQ);
        $('#plan_list').append(card.show());
        subPlan(); 
      }
    } 
  },(err)=>{
    console.log(err);     
  });
}

function goSubPlan(object){
   var d = { PL_KEY: $(object).find('.PL_KEY').text()
            ,PL_SEQ: $(object).find('.PL_SEQ').text()
           };
   document.location.href = 'CMD_SEQ_109706975751617928276778.do?PL_KEY=' + $(object).find('.PL_KEY').text() + '&PL_SEQ=' + $(object).find('.PL_SEQ').text();
}

$(document).ready(function() {
  min = 0; // Minimum of 0
  max = 10; // Maximum of 10
  $('.count').prop('disabled', true);

  $(".minus_percent").on("click", function() {
    if ($('.count_percent').val() > min) {
      $('.count_percent').val(parseInt($('.count_percent').val()) - 1 );
      $('.counter_percent').text(parseInt($('.counter_percent').text()) - 1 );
    }
  });

  $(".minus_weight").on("click", function() {
    if ($('.count_weight').val() > min) {
      $('.count_weight').val(parseInt($('.count_weight').val()) - 1 );
      $('.counter_weight').text(parseInt($('.counter_weight').text()) - 1 );
    }
  });

  $(".minus_seq").on("click", function() {
    if ($('.count_seq').val() > min) {
      $('.count_seq').val(parseInt($('.count_seq').val()) - 1 );
      $('.counter_seq').text(parseInt($('.counter_seq').text()) - 1 );
    }
  });



  $(".plus_percent").on("click", function() {
    if ($('.count_percent').val() < max) {
      $('.count_percent').val(parseInt($('.count_percent').val()) + 1 );
      $('.counter_percent').text(parseInt($('.counter_percent').text()) + 1 );
    }
  });

  $(".plus_weight").on("click", function() {
    if ($('.count_weight').val() < max) {
      $('.count_weight').val(parseInt($('.count_weight').val()) + 1 );
      $('.counter_weight').text(parseInt($('.counter_weight').text()) + 1 );
    }
  });

  $(".plus_seq").on("click", function() {
    if ($('.count_seq').val() < max) {
      $('.count_seq').val(parseInt($('.count_seq').val()) + 1 );
      $('.counter_seq').text(parseInt($('.counter_seq').text()) + 1 );
    }
  });

  list();

  $('#subList').hide();

 });

</script>
