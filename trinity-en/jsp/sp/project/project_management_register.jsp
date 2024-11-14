<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.xtreme.site.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%
  BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getMethodology");
%>


<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
프로젝트 정보 입력
    </h3>	
  <span style="text-align:right">
   <button class="btn btn-primary" id="backToList"><< 목록으로 돌아가기</button>
  </span>
  <span style="text-align:right">
   <button class="btn btn-secondary" id="save"">저장하기</button>
  </span>

  </div>
  <form name="frmProject" id="frmProject" method="POST">
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">이름</th>
        <th scope="col">값</th>
      </tr>
      </thead>
      <tr><td>프로젝트 이름</td><td><input type="text" name="ProjectName" id="ProjectName" size="70" class="styled"></td></tr>
      <tr><td>시작일자</td><td>
          <input type="text" name="StartDateTime" id="StartDateTime" size="10" class="form-control" value="" />
      </td></tr>
      <tr><td>종료일자</td><td>
          <input type="text" name="EndDateTime" id="EndDateTime" size="10" class="form-control" value="" />
      </td></tr>
      <tr><td>방법론</td><td>
        <select name="Methodology" id="Methodology">
             <option value="">선택해 주세요</option>
          <% if(bc != null && bc.size() > 0) { %>
           <%  for(int i = 0;i < bc.size() ; i++) { %>
             <option value="<%=bc.getBusinessData(i).getFieldValue("MethodologyCode")%>"><%=bc.getBusinessData(i).getFieldValue("MethodologyName")%></option>
           <% } %>
          <% } %>
        </select>
      </td></tr>
      <tbody>
      <tr>
      </tr>
      </tbody>
    </table>
  </div>
  </form>
</div>

<script>

$('#StartDateTime')
      .datepicker({
         format: 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
         startDate: '-10d', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
         endDate: '+10d', //달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
         autoclose: true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
         calendarWeeks: false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
         clearBtn: false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
         datesDisabled: ['2019-06-24', '2019-06-26'], //선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
         daysOfWeekDisabled: [0, 6], //선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
         daysOfWeekHighlighted: [3], //강조 되어야 하는 요일 설정
         disableTouchKeyboard: false, //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
         immediateUpdates: false, //사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false
         multidate: false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false
         multidateSeparator: ',', //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
         templates: {
            leftArrow: '&laquo;',
            rightArrow: '&raquo;',
         }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
         showWeekDays: true, // 위에 요일 보여주는 옵션 기본값 : true
         title: '날짜 입력', //캘린더 상단에 보여주는 타이틀
         todayHighlight: true, //오늘 날짜에 하이라이팅 기능 기본값 :false
         toggleActive: true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
         weekStart: 0, //달력 시작 요일 선택하는 것 기본값은 0인 일요일
         language: 'ko', //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
      })
      .on('changeDate', function (e) {
         /* 이벤트의 종류 */
         //show : datePicker가 보이는 순간 호출
         //hide : datePicker가 숨겨지는 순간 호출
         //clearDate: clear 버튼 누르면 호출
         //changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
         //changeMonth : 월이 변경되면 호출
         //changeYear : 년이 변경되는 호출
         //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간
 
         console.log(e);
         // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시) 위와 같은 형태로 보인다.
      });



$('#EndDateTime')
      .datepicker({
         format: 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
         startDate: '-10d', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
         endDate: '+10d', //달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
         autoclose: true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
         calendarWeeks: false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
         clearBtn: false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
         datesDisabled: ['2019-06-24', '2019-06-26'], //선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
         daysOfWeekDisabled: [0, 6], //선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
         daysOfWeekHighlighted: [3], //강조 되어야 하는 요일 설정
         disableTouchKeyboard: false, //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
         immediateUpdates: false, //사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false
         multidate: false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false
         multidateSeparator: ',', //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
         templates: {
            leftArrow: '&laquo;',
            rightArrow: '&raquo;',
         }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
         showWeekDays: true, // 위에 요일 보여주는 옵션 기본값 : true
         title: '날짜 입력', //캘린더 상단에 보여주는 타이틀
         todayHighlight: true, //오늘 날짜에 하이라이팅 기능 기본값 :false
         toggleActive: true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
         weekStart: 0, //달력 시작 요일 선택하는 것 기본값은 0인 일요일
         language: 'ko', //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
      })
      .on('changeDate', function (e) {
         /* 이벤트의 종류 */
         //show : datePicker가 보이는 순간 호출
         //hide : datePicker가 숨겨지는 순간 호출
         //clearDate: clear 버튼 누르면 호출
         //changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
         //changeMonth : 월이 변경되면 호출
         //changeYear : 년이 변경되는 호출
         //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간
 
         console.log(e);
         // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시) 위와 같은 형태로 보인다.
      });



$('#backToList').on('click',function(event){
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_109503436111588560842324';
  return false;
});

$('#save').on('click', function(event) {
  save();
});

function save(){

  with(frmProject){
    if(ProjectName.value == '' || isNaN(StartDateTime.value) || isNaN(EndDateTime.value)){
       alertPopup('경고',"입력값을 확인해 주세요");
       return;
    }
    var start_date = $('#StartDateTime').val();
    var end_date = $('#EndDateTime').val();
    start_date = start_date.substring(6,10) + start_date.substring(0,2) + start_date.substring(3,5); 
    end_date = end_date.substring(6,10) + end_date.substring(0,2) + end_date.substring(3,5); 

    var d = {ProjectName: $('#ProjectName').val()
           , StartDateTime: start_date
           , EndDateTime: end_date
           , code : "create"
           };

    $.ajax({
      url: "/Anaconda.json?CMD=CMD_SEQ_101128537211581942262530",
      data: d,
      type : "POST",
      dataType: "json",
      success : function (data) {
        alertPopup('성공', '요청 하신 내용을 저장 하였습니다.');
        document.location.href="/Anaconda.do?CMD=CMD_SEQ_109503436111588560842324";
      },error : function (err) {
        alertPopup("실패", "요청 하신 내용을 정상적으로 저장 하지 못하였습니다.");        
      }
    });
  }
}
</script>
