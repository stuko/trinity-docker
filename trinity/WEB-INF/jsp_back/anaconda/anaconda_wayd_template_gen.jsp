<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<h4>WAYD 프로젝트 생성</h4>
<p>
WAYD 프로젝트를 생성하시려면, 아래에 프로젝트 명과 컨테이너 이름을 입력해 주세요
</p>
<table>
  <thead>
    <col  width="10%"/>
    <col  width="90%"/>
  </thead>
  <tbody>
  <tr>
    <td><span>프로젝트 이름</span></td><td><span><input type="text" class="styled" size="20" id="project" name="project"></span><span>ex) Eclipse project name or Maven project name</span></td>
  </tr>
  <tr>
    <td><span>컨테이너 이름</span></td><td><span><input type="text" class="styled" size="20" id="container" name="container"></span><span>ex) WAYD container name</span></td>
  </tr>
  <tr>
    <td colspan="2"><span><button type="button" class="btn btn-primary" onClick="javascript:createProject();">프로젝트 생성</button></span></td>
  </tr>
  </tbody>
</table>

<script>
  function createProject(){
    if($('#project').val() ==  '' ||  $('#container').val() == ''){
      alert('프로젝트 이름과 컨테이너 이름을 입력해 주세요.');
      return;
    }
    if($('#project').val().length < 5 ||  $('#container').val().length < 5 ){
      alert('프로젝트 이름과 컨테이너 이름은 최소 5자리 이상이어야 합니다.');
      return;
    }
    
    if(confirm('프로젝트를 생성해드릴까요?')){
      var d = {
        project : $('#project').val(), container : $('#container').val()
      }
      post(d, 'CMD_SEQ_101217607581583150626366',(json)=>{
        alertPopup('성공','프로젝트를 생성하였습니다.');
        console.log(json);
        window.open(json.gen);
      },(err)=>{
        alertPopup('실패','죄송합니다. 프로젝트를 생성하지 못했습니다.');
      });
    }
  }
</script>
