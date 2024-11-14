<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
if(request.getServerName().indexOf("api.bestmember.net") >= 0) {
%>
      <div class="row border-bottom">
        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
           <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
        </div>
        <ul class="nav navbar-top-links navbar-right" style="margin-top:15px;">
          <li>
            <span class="m-r-sm text-muted welcome-message">Welcome to <a href="/Anaconda.do?CMD=CMD_SEQ_108989841081515973724128">TRINITY+</a>.</span>
          </li>
        </ul>
      </nav>
     </div>

<script langugae="javascript">
  loginCheckWithFunc((json)=>{
     $("#logout").show();
     $("#login").hide();
  }, ()=>{
     $("#login").show();
     $("#logout").hide();
  });
</script>
<%
}
%>
