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
<!-- Load c3.css -->
<link href="/jsp/sp/chart/c3.min.css" rel="stylesheet">
<!-- Load d3.js and c3.js -->
<script src="/jsp/sp/chart/c3.js"></script>
<%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"coin_list");
BusinessCollection bc2 = RequestHelper.getBusinessCollection(request,"factor_list");
%>

<h3 class="page-header"><i class="fa fa-chart-line"></i>&nbsp; ACMA Stats Information </h3>

<p>
<div class="row">
  <div class="col-lg-12">

<div>
<%
if(bc.size() > 0){
  for(int i = 0; i < bc.size() ;i++){
%>
<button type="button" style="margin-top:5px;margin-left:5px;" class="btn btn-success" onClick="javascript:selectCommand('<%=bc.getBusinessData(i).getFieldValue("code")%>');"><%=bc.getBusinessData(i).getFieldValue("code")%></button>
<%
  }
}
%>
</div>
<div style="margin-top:5px;width:100%;">

<table style="width:100%;">
<tbody>
<tr>
<td style="width:10%;">
 자산 선택
</td>
<td>
<select id='select_coin' class="form-control select-large" onChange="javascript:selectCoin(this)">
  <option value="">자산을 선택해 주세요</option>
<%
if(bc.size() > 0){
  for(int i = 0; i < bc.size() ;i++){
%>
  <option value="<%=bc.getBusinessData(i).getFieldValue("code")%>"><%=bc.getBusinessData(i).getFieldValue("code")%></option>
<%
  }
}
%>
</select>
</td>
</tr>
<tr>
<td>
항목
</td>
<td>
<select id='factors' class="form-control select-large" onChange='showFactorChart()' />
</td>
</tr>
<tr>
<td>
<span style="margin-top:10px;width:40%;float:left;margin-left:10px;"> 시간 전(Hour)</span>
</td>
<td>
<input id="hour" name="hour" class="form-control" type="text" placeholder="몇 시간 전(기본 2시간전)" value="-2">(기본 2시간전)
</td>
</tr>
<tr>
<td>
차트 선택
</td>
<td>
<select id='select_command' style="margin-top:10px;" class="form-control select-large" onChange="javascript:selectCoin(this)">
  <option value="">차트를 선택해 주세요</option>
  <option value="daily_slope">기울기 트렌드</option>  
  <option value="ma_trend">이평선 트렌드</option>
  <option value="ewma_trend">가중 평균 이평선 트렌드</option>
  <option value="m5_gap_price">5분 갭 트렌드</option>
  <option value="macd">MACD 트렌드</option>
  <option value="macd_signal">MACD SIGNAL 트렌드</option>
  <option value="benefit7">50일간 수익</option>
<%
if(bc2.size() > 0){
  for(int i = 0; i < bc2.size() ;i++){
%>
  <option value="<%=bc2.getBusinessData(i).getFieldValue("name")%>"><%=bc2.getBusinessData(i).getFieldValue("name")%></option>
<%
  }
}
%>

</select>
</td>
</tr>
</tbody>
</table>
</div>

<div id="chart"  style="margin-top:5px;border:1px;borderStyle:solid;borderColor:green;background:white"></div>
<div id='recommend_select' style='display:none;background:white;color:blue;'>
<input type='hidden' name='recommend_code' id='recommend_code'>
<input type='hidden' name='recommend_date' id='recommend_date'>
<input type='hidden' name='recommend_time' id='recommend_time'>
<div id='recommend_desc'></div>
<div>
<button id='btn_buy' onClick="javascript:buy();">매수추천</button>
<button id='btn_sell' onClick="javascript:sell();">매도추천</button>
<button id='btn_sell' onClick="javascript:close_rec_select();">닫기</button>
</div>
</div>
</p>

<script>
// var tickers = ['KRW-BTC','KRW-ETH','KRW-ATOM','KRW-SOL','KRW-MANA','KRW-HUNT']
// var cols = ['cur_price', 'min_ma5','min_ma10','min_ma15','min_ma20','min_ma50'];

function buy(){
  recommend_rule_detail('CMD_SEQ_105086745331676110304807',$('#recommend_code').val(),$('#recommend_date').val(),$('#recommend_time').val());
}

function sell(){
  recommend_rule_detail('CMD_SEQ_104238063481680774020379',$('#recommend_code').val(),$('#recommend_date').val(),$('#recommend_time').val());
}

function selectCoin(sel){
  var coin = $("#select_coin option:selected").val();
  if(coin != ''){
    selectCommand(coin);
    getFactors(coin);
  }else{
    alertPopup('경고','원하시는 자산을 선택해 주세요');
  }
}

function getFactors(coin){
   var d= {code : coin};
   var cmd = 'CMD_SEQ_106442855921682907879064';
   post(d,cmd
     ,(json)=>{
       simplePopup('항목 정보 가져옴','데이터를 조회 하였습니다.');
       if(json == null || json['factors'] == null || json['factors'].length == 0){
         simplePopup('에러','데이터가 없습니다.');
         return;
       }
       $('#factors').children().remove();
       $('#factors').append('<option value="">선택하세요</option>');
       for(var i = 0; i < json['factors'].length ; i++){
         // console.log(json.factors[i].name);
         $('#factors').append('<option value="'+json.factors[i].date+'|'+json.factors[i].time+'|'+json.factors[i].name+'|'+coin+'">'+json.factors[i].name+'</option>');
       }       
     },(err)=>{
       simplePopup('항목 에러','에러가 발생하였습니다');
   });

}

function showFactorChart(){

  var factors_value = $("#factors option:selected").val();
  var factors_value_array = factors_value.split('|');
  var columns_array = new Array();
  var series_array = new Array();
  post({code:factors_value_array[3], name:factors_value_array[2]},'CMD_SEQ_105746634471682907886803', 
           (data)=>{ 
              columns_array.push(factors_value_array[2]);
              for(var idx = 0 ; idx < data.datas.length ; idx++){
                  columns_array.push(data.datas[idx].value);
                  series_array.push(data.datas[idx].datetime);
              }
              var chart = c3.generate({
                  bindto: '#chart',
                  data: {
                     columns: [columns_array], 
                     type : 'line' ,
                     colors: ['#00f']
                  },
                  bar: {
                      width: {
                         ratio: 0.5
                      }
                  },
                  axis: {
                      x: {
                         type: 'category',
                         categories: series_array
                      }
                  },
                  grid: {
                     y: {
                        lines: [
                           {value: 0, text: 'zero'}
                        ]
                     }
                  }
              });
           } , (err)=>{});
}

function selectCommand(coin){
  $("#select_coin").val(coin).prop("selected", true);
  var code = $("#select_command option:selected").val();
  var cmd = getCommand(code);
  if(cmd == '') alertPopup('경고','원하시는 차트를 선택해 주세요');
  else callChart(coin , code);
}


function getCommand(code){
  if(code == 'ma_trend') return 'CMD_SEQ_109044780501645161227780';
  else if(code == 'daily_slope') return 'CMD_SEQ_103189602001661921113111';
  else if(code == 'macd') return 'CMD_SEQ_109044780501645161227780';
  else if(code == 'benefit7') return 'CMD_SEQ_107584288061661911889527';
  else return 'CMD_SEQ_102066097141714091185951';
}

function getColumns(code){
   if(code== 'ma_trend') return ['cur_price', 'min_ma5','min_ma10','min_ma15','min_ma20','min_ma50'];
   else if(code== 'ewma_trend') return ['cur_price', 'min_ewma5','min_ewma10','min_ewma15','min_ewma20','min_ewma50'];
   else if(code== 'daily_slope') return ['slope_of_slope_min_ma5','slope_of_slope_min_ma10','slope_of_slope_min_ma15','slope_of_slope_min_ma20','slope_of_slope_min_ma50'];
   else if(code== 'm5_gap_price') return ['m5_gap_price','m5_std_diff','m5_gap_diff'];
   else if(code== 'macd') return ['macd'];
   else if(code== 'macd_signal') return ['macd_signal'];
   else if(code== 'benefit7') return ['benefit'];
   else  return ['slope'];
}

function getChartType(code){
   if(code== 'ma_trend') return 'spline';
   else if(code== 'daily_slope') return 'spline';
   else if(code== 'benefit7') return 'bar';
   else  return 'spline';
}

function getAxis(code, chart_array_x){
   if(code== 'ma_trend') return chart_array_x['date']+'-'+chart_array_x['time'];
   else if(code== 'daily_slope') return chart_array_x['date']+'-'+chart_array_x['time'];
   else if(code== 'benefit7') return chart_array_x['date'];
   else  return chart_array_x['date']+'-'+chart_array_x['time'];
}

function recommend_rule(x , y , code, date, time){
   $('#recommend_code').val(code);
   $('#recommend_date').val(date);
   $('#recommend_time').val(time);
   $('#recommend_desc').text(code + '-' + date + '-' + time).show();

/*
   $('#recommend_select').css( 'position', 'relative' );
   $('#recommend_select').css( 'top', y);
   $('#recommend_select').css( 'left', x);
   $('#recommend_select').show();

   var parentLeft = $("#parent").position().left;
   var parentWidth = $("#parent").width();
   var divWidth = $("#div").width();
   var left = parentLeft + (parentWidth - divWidth)/2;

   $("#div").css("left", left+"px"); 
*/
   var windowWidth = $(window).width();
   var divWidth = $("#recommend_select").width();
   var left = (windowWidth - divWidth) / 2;
   var windowHeight = $(window).height();
   var top = (windowHeight) / 2;

   $("#recommend_select").css({
     position: "fixed",
     top:top + "px", 
     left: left + "px"
   }).show();

}

function close_rec_select(){
  $('#recommend_select').hide();
}

function recommend_rule_detail(cmd,code,date,time){
  confirmPopup('룰 추천','선택하신 시점의 상태('+code + ':' + date + ':' + time +')를 자동으로 룰을 추천해 드릴까요?',()=>{
     console.log(code + ',' + date + ',' + time);
     var d= {code : code, date : date, time: time};
     post(d,cmd
       ,(json)=>{
         simplePopup('룰 추천 성공','선택하신 룰을 추천해 드렸습니다.');
         $('#recommend_select').hide();
       },(err)=>{
         simplePopup('룰 추천 에러','에러가 발생하였습니다');
         $('#recommend_select').hide();
       });
  });

}

function callChart(t , code){
  var cols = getColumns(code);
  var chart_type = getChartType(code);
  var columns_array = new Array();
  
  var d={ticker:t , hour: $('#hour').val() , name : code};
  console.log($('#hour').val());
  $('#recommend_select').hide();
  post(d,getCommand(code),(json)=>{
    if(json == null || json['chart'] == null || json['chart'].length == 0){
      simplePopup('차트 에러','데이터가 없습니다.');
      return;
    }
    console.log("-----------------");
    console.log(json.chart[0].date);
    console.log("-----------------");
    var series_array = new Array();
    // series_array.push('x');
    var chart_array = json['chart'];
    // 최근 구매 가격 제외함.
    // 20240327
    // var recent_buy_price_array = json['recent_buy_price'];
    var recent_buy_price_array = null;
    var recent_buy_price = 0;
    if(recent_buy_price_array != null){
      // 최근 구매 가격 제외함.
      // 20240327
      // recent_buy_price = recent_buy_price_array[0]['recent_buy_price'];
    }

    for(var j = 0; j < cols.length; j++){
      var column = new Array();
      column.push(cols[j]);
      for(var x = 0; x < chart_array.length ; x++){
         column.push(chart_array[x][cols[j]]);
         if( j == 0 ){
           series_array.push(getAxis(code,chart_array[x]));
           //console.log("-----------------");
           //console.log(chart_array[x]['date']+'-'+chart_array[x]['time']);
           //console.log("-----------------");
         }
      }
      // if( j == 0 )columns_array.push(series_array);   
      columns_array.push(column);   
    }
    
    chart_color = {};
    chart_color[columns_array[0][0]] = function(d) { return d.value < 0 ? '#00f' : '#f00' };
    //console.log("-----------------");
    //console.log(chart_color);
    //console.log("-----------------");
    //console.log("-----------------");
    //console.log(series_array);
    //console.log("-----------------");

    var chart = c3.generate({
      bindto: '#chart',
      data: {
        onclick: function (e) { 
            var obj = chart_array[arguments[0].x];
            console.log(obj); 
            var x = e.clientX;
            var y = e.clientY;
            recommend_rule(x, y , obj.code, obj.date, obj.time);
        },
        columns: columns_array, 
        type : chart_type ,
        colors: chart_color
      },
      bar: {
        width: {
            ratio: 0.5 // this makes bar width 50% of length between ticks
        }
        // or
        //width: 100 // this makes bar width 100px
      },
      axis: {
        x: {
            type: 'category',
            categories: series_array
        }
      },
      grid: {
        y: {
            lines: [
                {value: 0, text: 'zero'}
                // 20240327
                // 최근 구매가격 제외
                // {value: recent_buy_price, text: 'recent buy price'}
                // {value: 1300, text: 'Label 1300 for y2', axis: 'y2', position: 'start'},
                // {value: 350, text: 'Label 350 for y', position: 'middle'}
            ]
        }
      }
    });

  },(err)=>{
    simplePopup('차트 에러','에러가 발생하였습니다');
  });

}

</script>
