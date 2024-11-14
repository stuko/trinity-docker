<!DOCTYPE html>
<html lang="en">
    
<head>
     <title>TRINITY 3.1</title><meta charset="UTF-8" />
       <meta name="viewport" content="width=device-width, initial-scale=1.0" />


<script src="/jsp/summernote/jquery-3.3.1.js"></script>
<script src="/jsp/trinity2/js/jquery.min.js"></script>
<script src="/jsp/trinity2/js/bootstrap.min.js"></script>
<script src="/jsp/summernote/summernote-bs4.min.js"></script>
<link href="/jsp/trinity2/css/bootstrap.min.css" rel="stylesheet" />
<!--<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">-->
<link href="/jsp/summernote/summernote-bs4.min.css" rel="stylesheet" />

        <link rel="stylesheet" href="/jsp/trinity2/css/bootstrap-responsive.min.css" />
        <!--link rel="stylesheet" href="/jsp/trinity2/css/maruti-login.css" /-->
        <link rel="stylesheet" href="/jsp/trinity2/css/fullcalendar.css" />
        <link rel="stylesheet" href="/jsp/trinity2/css/maruti-style.css" />
        <link rel="stylesheet" href="/jsp/trinity2/css/maruti-media.css" class="skin-color" />
        <link href="/bt/admin-v2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="/jsp/Neo/css/style.css">
        <link rel="stylesheet" href="/bt/jquery-ui/1.12.1/jquery-ui.theme.css" />
        <link rel="stylesheet" href="/bt/jquery-ui/1.12.1/jquery-ui.css" />
        <link rel="stylesheet" href="/bt/jquery-ui/1.12.1/jquery-ui.structure.css" />

<script src="/jsp/trinity2/js/excanvas.min.js"></script>
<!--script src="/jsp/trinity2/js/jquery.ui.custom.js"></script-->

<!--script src="/jsp/trinity2/js/jquery.flot.min.js"></script-->
<!--script src="/jsp/trinity2/js/jquery.flot.resize.min.js"></script-->
<script src="/jsp/trinity2/js/jquery.peity.min.js"></script>
<script src="/jsp/trinity2/js/fullcalendar.min.js"></script>
<!--script src="/jsp/trinity2/js/maruti.js"></script-->
<!--script src="/jsp/trinity2/js/maruti.dashboard.js"></script-->
<script src="/jsp/trinity2/js/maruti.chat.js"></script>
<script src="/bt/jquery-ui/1.12.1/jquery-ui.js"></script>

<script src="/jsp/anaconda/js/default.js"></script>
<script src="/jsp/summernote/paper-1.14.5.js"></script>
<script src="/jsp/API/js/process.js"></script>



<!--
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
-->


<script language="javascript">
function fnSelectSearch()
{
	with(smartFrm)
	{
		search.value = '';
	}
}
function smartSearch()
{
  with(smartFrm)
  {
    search.value = keyword.value;
    if(search.value == '' || search.value == 'Input keyword'){
      if(confirm('Search a current page?')){
	searchCurrentPage();      
      }
    }else{
      setCookie("search-word",search.value,1);
      action = "/Anaconda.do";
      submit();
    }
  }
}
function goPMS()
{
	setCookie("HMENU","PMS",1);
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_104651175361332065328722";
}
function goMyPage()
{
	setCookie("HMENU","PMS",1);
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_101590000581381445705515";
}
function goWDEV()
{
	setCookie("HMENU","WDEV",1);
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_108173637391288444301255";
}
function goWIKI()
{
	setCookie("HMENU","WIKI",1);
	document.location.href = "/	sdlc/Anaconda.do?CMD=CMD_SEQ_104757947291319959645242&gubun=1";
}
function goSecession()
{
	if(confirm("Really leave?")){
            if(confirm("Really?")){
                if(confirm("You can not use you account any more.")){
   		    document.location.href = "/Anaconda.do?CMD=CMD_SEQ_107375260951381444906625";
                }
            }
	}
}
function goLogin()
{
	setCookie("HMENU","PMS",1);
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_100937963281288324762498"; 	
}
function searchCurrentPage(){
   var cmd = 'CMD_SEQ_106594560501498179923551';
   if( cmd != ''){
     with(smartFrm){
        search.value = cmd;
 	setCookie("search-word",search.value,1);
	action = "/Anaconda.do";
	submit();
     }
   }else{
     alert('Can not find command!!!');  
   }
}
</script>

<style>

/* ---------- CLEARFIX ---------- */
/* For modern browsers */
.cf:before,
.cf:after {
    content: "";
    display: table;
}

.cf:after { clear:both; }

/* For IE 6/7 (trigger hasLayout) */
.cf { zoom: 1; }


body{
  height : 100%;
  min-height:100%;
  background : #fff;   
}
.container{ 
   min-width:95%;
   min-height:100%;
   background : #fff;
}
select { font-size: 12px;
   align:center;background:#fff;
}

table {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
  background: #fff;
}

table td, table th {
  border: 1px solid #ddd;
  padding: 8px;
}

// table tr:nth-child(even){background-color: #f2f2f2;}

//table tr:hover {background-color: #ddd;}

table th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  // background-color: #efefef;
  color: #000000;
}


table {
    float: left;
}
.table_hydra{
    float: none;
}

#search button {
  margin-top : 0px;
}

/*
th {
    display: table-cell;
    vertical-align: center;
    font-weight: bold;
    text-align: left;
    
   padding-left : 8px;
   padding-top : 8px;
   padding-bottom : 8px;
}

td{
   padding-left : 8px;
   padding-top : 8px;
   padding-bottom : 8px;
}
*/
select, textarea, input[type="text"], input[type="password"], input[type="datetime"], input[type="datetime-local"], input[type="date"], input[type="month"], input[type="time"], input[type="week"], input[type="number"], input[type="email"], input[type="url"], input[type="search"], input[type="tel"], input[type="color"], .uneditable-input {
    margin-bottom: 0px;
}
#menuToggle
{
  display: block;
  position: relative;
  top: -41px;
  left: 10px;
  width:400px;
  z-index: 1;
  
  -webkit-user-select: none;
  user-select: none;

  // box-shadow: 5px 5px;
}

#menuToggle a
{
  text-decoration: none;
  color: #232323;
  
  transition: color 0.3s ease;
}

#menuToggle a:hover
{
  color: tomato;
}


#menuToggle input
{
  display: block;
  width: 40px;
  height: 32px;
  position: absolute;
  top: -7px;
  left: -5px;
  
  cursor: pointer;
  
  opacity: 0; /* hide this */
  z-index: 2; /* and place it over the hamburger */
  
  -webkit-touch-callout: none;
}

/*
 * Just a quick hamburger
 */
#menuToggle span
{
  display: block;
  width: 33px;
  height: 4px;
  margin-bottom: 5px;
  position: relative;
  
  background: #cdcdcd;
  border-radius: 3px;
  
  z-index: 1;
  
  transform-origin: 4px 0px;
  
  transition: transform 0.5s cubic-bezier(0.77,0.2,0.05,1.0),
              background 0.5s cubic-bezier(0.77,0.2,0.05,1.0),
              opacity 0.55s ease;
}

#menuToggle span:first-child
{
  transform-origin: 0% 0%;
}

#menuToggle span:nth-last-child(2)
{
  transform-origin: 0% 100%;
}

/* 
 * Transform all the slices of hamburger
 * into a crossmark.
 */
#menuToggle input:checked ~ span
{
  opacity: 1;
  transform: rotate(45deg) translate(-2px, -1px);
  background: #232323;
}

/*
 * But let's hide the middle one.
 */
#menuToggle input:checked ~ span:nth-last-child(3)
{
  opacity: 0;
  transform: rotate(0deg) scale(0.2, 0.2);
}

/*
 * Ohyeah and the last one should go the other direction
 */
#menuToggle input:checked ~ span:nth-last-child(2)
{
  transform: rotate(-45deg) translate(0, -1px);
}

/*
 * Make this absolute positioned
 * at the top left of the screen
 */
#menu
{
  position: absolute;
  width: 350px;
  margin: -100px 0 0 -50px;
  padding: 50px;
  padding-top: 125px;
  
  background: #ededed;
  list-style-type: none;
  -webkit-font-smoothing: antialiased;
  /* to stop flickering of text in safari */
  
  transform-origin: 0% 0%;
  transform: translate(-100%, 0);
  
  transition: transform 0.5s cubic-bezier(0.77,0.2,0.05,1.0);
}

#menu li a
{
  // padding: 10px 0;
  font-size: 20px;
}
#menu li a i
{
  font-size: 15px;
}

#menu li ul li a
{
  // padding: 10px 0;
  font-size: 18px;
  font-color:blue;
}

#menu li ul li a i
{
  font-size: 7px;
}

/*
 * And let's slide it in from the left
 */
#menuToggle input:checked ~ ul
{
  transform: none;
}
html,body{
  height:100%;
}

textarea {
   min-width: 98%;
}

/*
#content{
   padding-bottom:0px;
   height:100%;
   min-height:100%;
   background: #fff;
}

#footer {
   width:100%;
   position:relative;
   // bottom:0;
   text-align: center;
}
.row-fluid{
   background : white;
}
*/

/*
// Override
*/

.modal {
  // position: fixed;
  /*
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  */
  z-index: 1050;
  display: none;
  overflow: hidden;
  -webkit-overflow-scrolling: touch;
  outline: 0;
}


</style>

    </head>
    <body>

  <div class="container" style="margin-top:20px">
      <div class="row">
        <div class="col">

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

    </div>
  </div>
</div>

 </body>
</html>
