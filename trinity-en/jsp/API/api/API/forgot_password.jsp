<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 
<div class="gray-bg middle-box text-center loginscreen animated fadeInDown"> 
       <div>
            <div style="text-align:center">
                <h1 class="logo-name">T+</h1>
            </div>
        <h3>비밀 번호 초기화 하기</h3>
            <p>비밀번호를 잊으신경우, 비밀번호를 초기화 한후, 가입시 입력한 이메일로 초기화된 비밀번호를 보내드립니다.
            </p>
            <p>or.(<a href="/Anaconda.do?CMD=CMD_SEQ_108989841081515973724128">Home</a>)</p>
            <form class="m-t" role="form" method="post" name="frmEnter" action="/Anaconda.do">
                <div class="form-group">
                     <input type="text" name="email" id="email" class="form-control" value="" class="form-control" placeholder="이메일" required=""></input>
               </div>
              <button class="btn btn-primary"  type="button" value="" onClick="javascript:fnForgot();" >비밀번호 초기화 및 새 비밀번호 전송</button>
               <div>
                <a href="https://app.bestmember.net/Anaconda.do?CMD=CMD_SEQ_101263323761515982251126"><small>로그인을 원하시나요?</small></a>
                <p class="text-muted text-center"><small>아직 가입하지 않으셨나요?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="/Anaconda.do?CMD=CMD_SEQ_105576075501516163662868">계정 만들기</a>
               </div
            </form>
            <p class="m-t"> <small>BESTMEMBER+ &copy; 2018</small> </p>
        </div>
</div>
