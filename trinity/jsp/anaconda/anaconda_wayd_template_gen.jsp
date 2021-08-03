<h4>WAYD Project Generator</h4>
<p>
If you want develop a container of WAYD, You can generate below Project easily.....
</p>
<table>
  <thead>
    <col  width="10%"/>
    <col  width="90%"/>
  </thead>
  <tbody>
  <tr>
    <td><span>Project Name</span></td><td><span><input type="text" class="styled" size="20" id="project" name="project"></span><span>ex) Eclipse project name or Maven project name</span></td>
  </tr>
  <tr>
    <td><span>Container Name</span></td><td><span><input type="text" class="styled" size="20" id="container" name="container"></span><span>ex) WAYD container name</span></td>
  </tr>
  <tr>
    <td colspan="2"><span><button type="button" class="btn btn-primary" onClick="javascript:createProject();">Generate Project</button></span></td>
  </tr>
  </tbody>
</table>
<script>
function createProject(){
  if($('#project').val() ==  '' ||  $('#container').val() == ''){
    alert('please enter project and container name');
    return;
  }
  if($('#project').val().length < 5 ||  $('#container').val().length < 5 ){
    alert('please enter project and container name at lease 5 ');
    return;
  }
  
  if(confirm('Really generate project ????')){
    var d = {
       project : $('#project').val(), container : $('#container').val()
    }
    post(d, 'CMD_SEQ_101217607581583150626366',(json)=>{
      alertPopup('success','congratulation');
      console.log(json);
      window.open(json.gen);
    },(err)=>{
      alertPopup('fail','sorry');
    });
  }
}
</script>
