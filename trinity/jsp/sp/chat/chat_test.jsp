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
<%@ page import="java.net.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String clientId = "";
String secretKey = "";
String ip = "";
String port = "";

Object ocid = session.getAttribute("clientId");
Object osk = session.getAttribute("secretKey");
clientId = ocid == null ? "" : (String)ocid;
secretKey = osk == null ? "" : (String)osk;

String sIp = InitClass.getInstance().getData("ENGINE_IP");
String sPort = InitClass.getInstance().getData("ENGINE_PORT");
String iIp = getLocalIpAddress(); // InetAddress.getLocalHost().getHostAddress();
String iPort = "8081";
ip = BusinessHelper.checkBusinessNull(sIp) ? sIp : iIp;
port = BusinessHelper.checkBusinessNull(sPort) ? sPort : iPort;
%>
<%!
public String getLocalIpAddress() {
      try {
            for (Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces(); en.hasMoreElements();) {
                  NetworkInterface intf = en.nextElement();
                  for (Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses(); enumIpAddr.hasMoreElements();) {
                        InetAddress inetAddress = enumIpAddr.nextElement();
                        if (!inetAddress.isLoopbackAddress() && inetAddress instanceof Inet4Address) {
                              return inetAddress.getHostAddress();
                        }
                  }
            }
      } catch (SocketException ex) {
            ex.printStackTrace();
      }
      return null;
}

%>
<div class="container-fluid" style="margin-top:20px;">
    <div class="row">
       <div class="col">
         <h3 class="page-header">
         <i class="fas fa-check"></i> &nbsp;  채팅 테스트
         </h3>
      </div>
   </div>
   <div class="row">
    <div class="col">
        <div class="form-group">
            <label for="chat-message">채널 아이디</label>
            <input type="text" class="form-control" id="channelId" placeholder="Enter channelId" value="<%=clientId%>">
        </div>
    </div>
  </div>
 <div class="row">
    <div class="col">
      <form>
        <div class="form-group">
            <label for="rule-seq">룰 번호</label>
            <input type="text" class="form-control" id="rule-seq" placeholder="Enter rule seq">
            <small id="testHelp" class="form-text text-muted">Please enter rule seq and check the response message.</small>
        </div>
        <div class="form-group">
            <label for="chat-message">메시지</label>
            <input type="text" class="form-control" id="message" placeholder="Enter message">
            <small id="messageHelp" class="form-text text-muted">Please enter messag and check the response message.</small>
        </div>
      </form>
      <button id="send" class="btn btn-primary">보내기</button>

    </div>
  </div>
  <div class="row">
   <div class="col">
     <div id="time" style="margin-top:50px;"></div>
   </div>
  </div>
  <div class="row">
   <div class="col">
     <div id="show" style="width:100%;height:600px;margin-top:30px;overflow:auto"></div>
  </div>
 </div>
</div>


<script>
$(document).ready(function(){
 $('form input').keydown(function(e) {
    if (e.keyCode == 13) {
      sendMessage();
      return false;   
    }
  });
});

  $('#send').click(()=>{
      // alertPopup('hi',$('#message').val());
      // alert('http://<%=ip%>:<%=port%>/rest');
      sendMessage();

   });

  function sendMessage(){
       var p = {
            msgType : "DUNA.SAAS"
          , clientId : "<%=clientId%>"
          , secretKey : "<%=secretKey%>"
//        , channelId : "<%=clientId%>"
          , message : $('#message').val()
          , ServiceName:'chat'
          , Level : 'normal'
          , MY_THOUGHT : $('#message').val()
          , ip : ''
          , x : ''
          , y : ''
          , city : ''
          , dfp : getCookie("DFP")
          , channelId: $('#channelId').val()
          , chat_Id : $('#channelId').val()
          , ruleTest : 'false'
          , ruleSeq : ''
          , url : 'http://<%=ip%>:<%=port%>/rest'
         };
      if($('#rule-seq').val() != ''){
          p.ruleSeq = $('#rule-seq').val();
          p.ruleTest = 'true';
      }

     json(p,'CMD_SEQ_100007709531581063542164',(s)=>{
           dpTime();
           d = JSON.stringify(s);
           $('#show').text(d);
           showChat(d);
     } , (e)=>{
           alertPopup('fail',e);
     })

/*
      $.ajax({
         url:'http://<%=ip%>:<%=port%>/rest' // 요청 할 주소
         ,async:true// false 일 경우 동기 요청으로 변경
         ,type:'POST' // GET, PUT
         ,data: JSON.stringify(p)// 전송할 데이터
         ,dataType:'text' // xml, json, script, html
         ,beforeSend:function(d) {}// 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단
         ,success:function(d) {
           // alertPopup('success',d);
           dpTime();
           $('#show').text(d);
           showChat(d);
         }// 요청 완료 시
         ,error:function(d) {
           alertPopup('fail',d);
         }// 요청 실패.
         ,complete:function(d) {}// 요청의 실패, 성공과 상관 없이 완료 될 경우 호출
     });
*/
  }

function dpTime(){ 
    var now = new Date(); 
    var hours = now.getHours(); 
    var minutes = now.getMinutes(); 
    var seconds = now.getSeconds(); 
    if (hours > 12){ hours -= 12; ampm = "오후 "; }
    else{ ampm = "오전 "; } 
    if (hours < 10){ hours = "0" + hours; } 
    if (minutes < 10){ minutes = "0" + minutes; } 
    if (seconds < 10){ seconds = "0" + seconds; }
    $('#time').text('Test Execution time : ' + ampm + hours + ":" + minutes + ":" + seconds); 
}

function showChat(m){
    var json = JSON.parse(m); 
    if(json.chat.contents_list && json.chat.contents_list.length > 0){
        var answer = "";
        json.chat.contents_list.forEach(function(e){
            answer += "<div>" + e.contents + "</div>";
        });
        alertPopup('answer',answer);
    }
}

</script>
