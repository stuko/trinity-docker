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
<%@ page import="com.stuko.anaconda.util.InitClass"%>

 <%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getDataBaseInfo");
String id = "";
String password = "";
String url = "";
String max = "10";
String trinity = "Y";
String needToCreateDB = "N";
if(bc != null && bc.size() > 0){
    id = bc.getBusinessData(0).getFieldValue("Id");
   password = bc.getBusinessData(0).getDecFieldValue("Password").trim();
   url = bc.getBusinessData(0).getFieldValue("Url");
   max = bc.getBusinessData(0).getFieldValue("MaxConnection");
   trinity = bc.getBusinessData(0).getFieldValue("UseTrinity");
   needToCreateDB = bc.getBusinessData(0).getFieldValue("TrinityDBYN");
}
%>
 <div id="page-wrapper" class="gray-bg">

  <%@ include file="/jsp/API/sub_top_common.jsp" %>
<div class="ibox-title">
<h3>데이터 베이스 연결 정보 </h3>
<p>회원님께서 운영하시는 DataBase 를 사용하고자 하실 경우, <br>아래에 연결 계정과 비밀번호(비밀번호는 암호화 되어서 저장됩니다.)를 저장해 주시면, 됩니다
<br><b>MySQL</b>만 사용가능합니다.</p>
<p>현재 TRINITY+ 에서 운영하는 DB를 이용하실 경우, <b><u>'TRINITY+ DB 사용' 란을 체크</u></b> 해주세요..</p>
</div>

 <div class="row wrapper border-bottom white-bg page-heading">
    <div class="ibox-content">
                 <form method="get" class="form-horizontal">

                            <div class="form-group"><label class="col-sm-2 control-label">데이터 베이스 연결방법 설정<br/>
                                    <small class="text-navy">TRINITY+ DataBase 혹은 사용자 데이터 베이스</small></label>
                                    <div class="col-sm-10">
                                        <div><label> <input type="radio" checked="" value="Y" id="useTrinity" name="trinity" onClick="javascript:selectDB()">TRINITY+ DB 사용</label></div>
                                        <div><label> <input type="radio" value="N" id="useNotTrinity" name="trinity" onClick="javascript:selectDB()">사용자 데이터베이스</label></div>
                                    </div>
                         </div>
                        <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <div class="col-sm-4 col-sm-offset-2">
<%
if(bc != null && bc.size() > 0 && trinity.equals("N")){
%>
                                        <button class="btn btn-sm  btn-primary" type="button" onClick="javascript:fnTestDataBase()">연결 테스트</button>
<%
}
%>
                                        <button class="btn btn-sm btn-primary" type="button" onClick="javascript:fnSaveDataBase();">저장 하기</button>
<%
if(bc != null && bc.size() > 0 &&  trinity.equals("Y") ){
%>
                                        <button id = "btn_create_trinity" class="btn btn-sm btn btn-primary" type="button" onClick="javascript:fnCreateDataBaseInTrinity();">데이터 베이스 생성 </button>
<%
}
%>
<%
if(bc != null && bc.size() > 0  && trinity.equals("Y")){
%>
                                        <button id="btn_drop_trinity" class="btn btn-sm btn btn-danger" type="button" onClick="javascript:fnDropDataBaseInTrinity();">데이터 베이스 삭제</button>
<%
}
%>
<br><br>
                        <div id="my_db"> 
                              <div class="form-group"><label class="col-sm-2 control-label">연결 URL</label>
                                      <div class="col-sm-10"><input type="text" class="form-control"  id="url" name="url" value="<%=url%>"></div>
                                      <span style="padding-left:300px;">ex) jdbc:mysql://{IP}:{3306}/{DB Name}?useUnicode=true&characterEncoding=utf8</span>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group"><label class="col-sm-2 control-label">아이디</label>
                                    <div class="col-sm-10"><input type="text" class="form-control" id="id" name="id" value="<%=id%>">  </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group"><label class="col-sm-2 control-label">비밀번호</label>
                                    <div class="col-sm-10"><input type="password" class="form-control"  id="password" name="password" value="<%=password%>"></div>
                                </div>
                               <div class="hr-line-dashed"></div>
                                <div class="form-group"><label class="col-sm-2 control-label">최대 연결수</label>
                                    <div class="col-sm-10"><input type="text" class="form-control"  id="max" name="max" value="<%=max%>"></div>
                                </div>
                         </div>
                         </form>
    </div>
</div>
<script language="javascript">
if('<%=trinity%>' == 'Y'){
   $("#useTrinity").prop("checked", true);
   $("#useNotTrinity").prop("checked", false);
   if('<%=needToCreateDB%>' == 'N'){
        $('#btn_create_trinity').show();
        $('#btn_drop_trinity').hide();
   }else{
       $('#btn_create_trinity').hide();
       $('#btn_drop_trinity').show();
   }
}else{
  $('#btn_drop_trinity').hide();
  $('#btn_create_trinity').hide();
  $("#useNotTrinity").prop("checked", true);
  $("#useTrinity").prop("checked", false);
}


function selectDB(){
  if($(':radio[name="trinity"]:checked').val() == 'Y') {
      if('<%=needToCreateDB%>' == 'N'){
        $('#btn_create_trinity').show();
        $('#btn_drop_trinity').hide();
      }else{
       $('#btn_create_trinity').hide();
       $('#btn_drop_trinity').show();
      }
     $('#my_db').hide();
  }else{
    $('#btn_drop_trinity').hide();
    $('#btn_create_trinity').hide();
     $('#my_db').show();
  }

}
selectDB();
</script>
  <%@ include file="/jsp/API/sub_footer_common.jsp" %>
 
</div>
