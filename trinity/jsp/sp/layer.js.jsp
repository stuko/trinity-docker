<%@page contentType="text/javascript; charset=UTF-8" pageEncoding="UTF-8"  %>
<%
String cmd2 = request.getParameter("cmd2");
String div = request.getParameter("div");
if(cmd2 != null && div != null){
%>
var chatDiv = '<%=div%>';
function include(url) {
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = url;
    document.getElementsByTagName('head')[0].appendChild(script);
}

function writeHtml(strHtml){
   document.write(strHtml.replace('\"','&#34;').replace('\'','&#39;'));
}

function callCMD(){
  var url = '/Anaconda.do?CMD=<%=cmd2%>';
  var parent = null;
  if(chatDiv == 'chat') {
    parent = $('.mCSB_container:last');
  } else {
    parent = $('#' + chatDiv);
  }


  $.ajax({
            type : 'post',
            url : url,
            data : '',
            dataType : 'text',
            error: function(data, status, error){
                if(parent != null && parent != '' && parent != 'null'){
                  data = data.trim();
                  fakeMessagePlus(data);
                }else{
                  writeHtml(data);
                }
            },
            success : function(data, status){
                if(parent != null && parent != '' && parent != 'null'){
                  data = data.trim();
                  fakeMessagePlus(data);
                }else{
                  writeHtml(data);
                }
            }
        });
}
$( document ).ready(function() {
// include('/bt/js/jquery-3.1.1.min.js');
if(chatDiv != null){
   callCMD();
}
   
});
<%
}
%>
