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
<%@ page import="com.stuko.anaconda.SQLCommand.*"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String title = "Real time";
String factor_type = request.getParameter("factor_type");
if(!BusinessHelper.checkBusinessNull(factor_type)){
   factor_type = "R";
}else{
	title = "Scheduling";
}


%>

<div id="div_profile_menu" style="width:500px;position:absolute;display:none;background-color:white;border: 2px double #CCCCCC; z-index:200;">
	<form name="frmMenu">
		
			<p style="height:30px">
				<img src="/jsp/bestmember/img/important.png" width="20px" height="20px" />&nbsp;룰 변수 관리&nbsp;<a style="margin-left:20px;text-decoration:none;" href='javascript:fnShowOrHide("div_profile_menu");'><img src='/jsp/anaconda/img/close.png' width='20px' height='20px' border='0' align='absmiddle' />&nbsp;닫기</a>
			</p>
<ul style="list-style:none ;padding: 10px 25px 10px 25px;">
			<li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goReadProfile();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;룰 변수 정보 자세히 보기</a></li>
			<li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goUpdateProfile();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;룰 변수 수정하기</a></li>
			<li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goDeleteProfile();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;룰 변수 삭제하기</a></li>
			<li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:convertProfile();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;룰 변수로 전환하기</a></li>
			
		</ul>
	</form>
</div>

<div id="div_profile_candidate_menu" style="width:500px;position:absolute;display:none;background-color:white;border: 2px double #CCCCCC; z-index:200;">
	<form name="frmCandidateMenu">
			<p style="height:30px">
				<span><img src="/jsp/bestmember/img/important.png" width="20px" height="20px" align="absmiddle" />&nbsp;룰 변수 후보 관리<a style="margin-left:20px;text-decoration:none;" href='javascript:fnShowOrHide("div_profile_candidate_menu");'><img src='/jsp/anaconda/img/close.png' width='20px' height='20px' border='0' align='absmiddle' />&nbsp;닫기</a></span>
			</p>
		<ul style="list-style:none ;padding: 10px 25px 10px 25px;">
			<li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goCreateProfile();'><img src="/jsp/bestmember/img/shortcut.png" border="0" align="absmiddle"></img>&nbsp;룰 변수 추가하기</a></li>
		</ul>
	</form>
</div>


<div id="div_profile" style="width:900px;position:absolute;display:none;background-color:white;border: 2px double #CCCCCC;padding: 10px 10px;z-index:200;">
       <h6>룰 변수 항목 상세 보기</h6>
	<form name="frmProfile" method="post" action="/Anaconda.do">
		<input type="hidden" name="CMD" value=""></input>
		<input type="hidden" name="seq" value=""></input>
		<input type="hidden" name="factor_type" value="<%=factor_type%>"></input>
		<input type="hidden" name="parent_seq" value=""></input>
		<input type="hidden" name="code" value=""></input>
		<input type="hidden" name="x" value=""></input>
		<input type="hidden" name="y" value=""></input>
		<div class="table-responsive">
                      <table class="table table-bordered" width="100%" id="dataTable">
                         <thead>
                           <tr>
                             <th >이름</th>
                             <th width="90%">값</th>
                          </tr>
                        </thead>
                        <tbody>
				<tr>
					<td>룰 변수 그룹</td>
					<td><input type="text" name="factor_group" class="styled" size="40" value="DUNA.SAAS"></input><br>(* 기본값 : DUNA.SAAS  아닌경우 커스터마이징 요청)</td>
				</tr>
				<tr>
					<td>룰 변수 이름</td>
					<td><input type="text" name="factor_name" class="styled" size="40" ></input></td>
				</tr>
				<tr>
					<td>룰 기본 변수 여부<br>(변수 생성 우선수위 상:Y)</td>
					<td>
					<select name="baseprofile_yn" class="styled">
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>룰 변수 유형</td>
					<td>
					<select id="factor_from" name="factor_from" class="styled">
						<option value="Table">DB 테이블의 레코드</option>
						<option value="Column">DB 테이블의 한 칼럼</option>
						<option value="script">자바 스크립트</option>
						<option value="REST">REST 호출 결과</option>
                                                <option value="POJO">POJO 실행 결과</option>
					</select>
                                       <div id="dbInfo" name="dbInfo" style="display:none">
                                         <p>* Table 혹은 Column 유형의 프로파일 항목을 선택하신 경우, 아래 DB 연결정보를 사용하시게 됩니다. 만약 아래 DB 연결정보를 선택하지 않으실 경우, 기본으로 제공하는 DB 연결 정보를 사용하게 됩니다.</p>
                                         <select id="anaconda_db_seq" name="anaconda_db_seq" class="styled">
                                            <option value="-1" selected> 기본 DB 정보 </option>
					 </select> 
                                       </div>
					</td>
				</tr>
				<tr>
					<td>
                                         룰 변수 상세 내용
                                         <p>POJO을 선택하신 경우, com.stuko.kronos.realtime.Factor 인터페이스를 구현하신후 해당 클래스를 배포해주시고, 입력해 주셔야 합니다.</p>
                                        </td>
					<td><textarea rows="10" cols="70" name="factor_statement"></textarea>
                                         <pre>
REST를 선택하신 경우, 
{
   url : "https://", 
   header : {name:value, .........} , 
   parameter: {name:value,........}, 
   method : "GET/POST" 
}
                                          </pre>
                                       </td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="button" class="btn btn-info" style="font: bold 13px 돋움체;margin-left: 5px;margin-top: 5px;" value=" 저장하기 " onClick="javascript:saveProfile();"></input>
					<input type="button" class="btn btn-info" style="font: bold 13px 돋움체;margin-left: 5px;margin-top: 5px;" value=" 닫기 " onClick="javascript:fnShowOrHide('div_profile');"></input>
					</td>
				</tr>
			</tbody>
		</table>
              </div>
	</form>
</div>

<form name="frmProfileList" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD" value=""></input>
<input type="hidden" name="seq" value=""></input>
<input type="hidden" name="parent_seq" value=""></input>
<input type="hidden" name="div_id" value=""></input>
<input type="hidden" name="factor_name" value=""></input>
<input type="hidden" name="factor_group" value=""></input>
<input type="hidden" name="factor_statement" value=""></input>
<input type="hidden" name="code" value=""></input>
<input type="hidden" name="factor_from" value=""></input>
<input type="hidden" name="baseprofile_yn" value=""></input>
<input type="hidden" name="anaconda_db_seq" value=""></input>
<input type="hidden" name="factor_type" value="<%=factor_type%>"></input>
<input type="hidden" name="x" value=""></input>
<input type="hidden" name="y" value=""></input>
<input type="hidden" name="msg" value=""></input>
</form>

 <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-8">
                        <h3 class="page-header">
                           <img src="/jsp/sp/img/realtime_profile.png" width="40px">&nbsp;  룰 변수(<%=title%>) 관리하기
                        </h3>
			<h6>룰 변수 관리 화면은 룰 엔진에서 사용하실 여러 변수들을 미리 생성해 주기 위해 변수들을 정의 놓는 곳입니다.</h6>
<h6 style="color:red">최종 결정 여부 변수(decideType)은 기본으로 'random' 입니다 , decideType 변수를 다음 세가지 중에 하나로 선택해 주시면 룰 엔진에서 결정된 룰들 중에 {priority, random, all} 방식 중에 한가지로 결정이 됩니다, 룰 변수 'decideType' 를 꼭 등록해 주시고, 변수 유형은  'script'로 해주시며 , 값은  priority , random , all 중에 한가지를 입력해 주시기 바랍니다.</h6>
						<!--
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-desktop"></i> Bootstrap Elements
                            </li>
                        </ol>
						-->
                    </div>
                </div>
                <!-- /.row -->


		<div class="page-header">
		<h5>룰 변수 항목들&nbsp;&nbsp;<button type="button" class="btn btn-lg btn-success" onClick="javascript:fnShowProfileCandidateMenu('T');">신규 룰 변수 만들기</button></h5>
		<h6><button type="button" class="btn btn-warning" onClick="javascript:$('#factor_list').toggle();">현재 사용중 (real time)<span id='factor_count'></button></span>
		<button type="button" class="btn btn-success" onClick="javascript:$('#factor_list_schedule').toggle();">현재 사용중 (schedule)<span id='factor_schedule_count'></button></span>
		<button type="button" class="btn btn-info" onClick="javascript:$('#factor_list_candidate').toggle();">룰 변수 후보<span id='factor_error_count'></button></span>
		<button type="button" class="btn btn-danger" onClick="javascript:$('#factor_list_error').toggle();">에러난 룰 변수<span id='factor_candidate_count'></button></span></h6>
	       </div>
	      <div class="row">
               <div class="col-lg-12">
		 <div>
		   <p><div id="factor_list" style='display:block'></div></p>
                   <p><div id="factor_list_schedule" style='display:none'></div></p>
                   <p><div id="factor_list_error" style='display:none'></div></p>
                   <p><div id="factor_list_candidate" style='display:none'></div></p>
                </div>
              </div>
            </div>
</div>

<script language="javascript">

$(document).ready(function(){
  post({},'CMD_SEQ_107695074081575101621830',(data)=>{
       if(data && data.selectDBInfoList && data.selectDBInfoList.length > 0){
         $.each(data.selectDBInfoList, (idx, item)=>{
           var option = $("<option value='"+item.seq+"'>"+item.jndi+"</option>");
           $('#anaconda_db_seq').append(option);
         });
         $("#dbInfo").show();
      }
    },(err)=>{
       $("#dbInfo").hide();
    });

});

$("#factor_from").change( function() {
  if(this.value == 'Table' || this.value == 'Column'){
    $("#dbInfo").show();
  }else{
    $("#dbInfo").hide();
  }
});

			function saveProfile(){
				with(frmProfile){
					if(code.value == 'create'){
						CMD.value = 'CMD_SEQ_100623391721495932098371';
                                                // factor_statement.value = factor_statement.value.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
						
                                                callAjaxByForm('saveProfile',"frmProfile");
					}else{
						CMD.value = 'CMD_SEQ_104471543441495932104490';
                                                // factor_statement.value = factor_statement.value.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
						
                                                callAjaxByForm('saveProfile',"frmProfile");
					}
				}
			}
			function convertProfile(){
				with(frmProfile){
					CMD.value = 'CMD_SEQ_100189749831500117971217';
                                        // factor_statement.value = factor_statement.value.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
					callAjaxByForm('convertProfile',"frmProfile");
				}
			}


			function goPage(page){
				with(frmProfileList){
					seq.value = page;
					CMD.value = 'CMD_SEQ_103373720171495955928464';
					callAjaxByForm('getRuleFactorList',"frmProfileList");
				}
			}
			function doRuning(callerName){
				showRunning(callerName);
			}
			function doRun(callerName , REQ){
				var div = _('factor_list');
                                var div_candidate = _('factor_list_candidate');
                                var div_error = _('factor_list_error');
                                var div_schedule = _('factor_list_schedule');
                                var cnt1 = 0;
                                var cnt2 = 0;
                                var cnt3 = 0;
                                var cnt4 = 0;
				if(callerName == 'getRuleFactorList')	{
					var object = parseAnacondaAJAXFromBusinessCollection(REQ.responseXML);
					var count = parseInt(object.length);
					if(count > 0){
						for(var i=0 ; i < count ; i++){
								var span = document.createElement("span");	
								var btn = document.createElement("button");	
								btn.setAttribute('type','button');
								if(object.response[i].factor_type == 'R'){
									btn.setAttribute('class','btn btn-warning');
                                                                        cnt1++; 
								}else if(object.response[i].factor_type == 'S'){
									btn.setAttribute('class','btn btn-success');
                                                                        cnt2++; 
								}else if(object.response[i].factor_type == 'E'){
									btn.setAttribute('class','btn btn-danger');
                                                                        cnt3++; 
								}else{
									btn.setAttribute('class','btn btn-info');
                                                                        cnt4++; 
                                                                }
								btn.setAttribute('onClick','javascript:fnShowProfileMenu("'+object.response[i].seq+'");');
								btn.setAttribute('style','margin:5px 5px 5px 5px');
                                                                if(object.response[i].baseprofile_yn == 'Y')
                                                                    btn.innerHTML = '(' + object.response[i].factor_group + ')'+'(' + object.response[i].factor_from + ')<b style="color:#000000;">[BASE]&nbsp;' + object.response[i].factor_name + '&nbsp;</b>'; 
                                                                else
    								    btn.innerHTML = '(' + object.response[i].factor_group + ')'+'(' + object.response[i].factor_from + ')' + object.response[i].factor_name + '&nbsp;';
								span.appendChild(btn);

                                                                if(object.response[i].factor_type == 'R')
									div.appendChild(span);
								else if(object.response[i].factor_type == 'S')
                                                                        div_schedule.appendChild(span);
								else if(object.response[i].factor_type == 'E')
                                                                        div_error.appendChild(span);
								else
                                                                        div_candidate.appendChild(span);
								
						}
                                                $('#factor_count').html(cnt1 + '건');
                                                $('#factor_schedule_count').html(cnt2 + '건');
                                                $('#factor_candidate_count').html(cnt3 + '건');
                                                $('#factor_error_count').html(cnt4 + '건');
						return;
					}
				}else if(callerName == 'readProfile'){
					var object = parseAnacondaAJAXFromBusinessCollection(REQ.responseXML);
					if(object != null && object.length > 0){
						with(frmProfile){
					      seq.value = object.response[0].seq;
					      parent_seq.value = object.response[0].parent_seq;
					      factor_name.value = object.response[0].factor_name;
					      factor_statement.value = object.response[0].factor_statement.replace(/(<BR>|<br>)/g,'\r\n');
                                              // factor_statement.value = object.response[0].factor_statement;
					      factor_from.value = object.response[0].factor_from;
                                              factor_group.value = object.response[0].factor_group;
					      baseprofile_yn.value = object.response[0].baseprofile_yn;
                                              anaconda_db_seq.value = object.response[0].anaconda_db_seq;
						}
						fnShowOrHide('div_profile');
					}else{
						alert('Can not read profile info.');
					}
					return;
				}else {
					alert("Reflected normally.");
					var t = Math.floor(Math.random()*1000);
					window.location.href = window.location.href;
				}
			}
			</script>



			<script language="javascript">
				goPage('0');
			</script>


 <script language="javascript">
	function fnShowProfileCandidateMenu(t){
		if(t == 'T'){
			popMenu('div_profile_candidate_menu');
			return;
		}
		if(t == 'C'){
			popMenu('div_profile_candidate_menu');
			return;
		}
	 }

	function fnShowProfileMenu(s){
		with(frmProfile){
			seq.value = s;
		}
		popMenu('div_profile_menu');
	 }


	function goCreateProfile(){
		frmProfile.code.value = 'create';
		with(frmProfile){
			seq.value = '';
			parent_seq.value = '';
			factor_name.value = '';
			factor_statement.value = '';
			factor_from.value = '';
                        baseprofile_yn.value = '';
                        anaconda_db_seq.value = '-1';
		}
		popMenu('div_profile');
	}
	function goReadProfile(){
		position('div_profile');
		frmProfile.code.value = 'read';
		with(frmProfile){
			CMD.value = 'CMD_SEQ_104579180381495932112460';
			callAjaxByForm('readProfile',"frmProfile");
		}
	}
	function goUpdateProfile(){
		frmProfile.code.value = 'update';
		goReadProfile();
	}
	function goDeleteProfile(){
		if(confirm('Are you sure to delete profile?')){
			frmProfile.code.value = 'delete';
			with(frmProfile){
				CMD.value = 'CMD_SEQ_102049232321495932108673';
				callAjaxByForm('deleteProfile',"frmProfile");
			}
		
		}
	}
 </script>
            <!-- /.container-fluid -->
