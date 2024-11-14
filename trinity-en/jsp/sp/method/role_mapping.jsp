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
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
/**
// ---------------------------------------------------------------------------------------
// JSP 코딩 규칙
// ---------------------------------------------------------------------------------------

out.println((프로세스결과타입)RequestHelper.getReturnValue(request,"프로세스 이름"));
Object object = request.getAttribute(InitClass.getReturnValue());
Object session_object = request.getAttribute(InitClass.getSessionValue());
Object businss_object = request.getAttribute(InitClass.getBusinessDataValue());

out.println((프로세스결과타입)RequestHelper.getReturnValue(request,"프로세스 이름");
BusinessCollection bc = RequestHelper. getBusinessCollection(request,"프로세스 이름");
BusinessCollection bc = RequestHelper. getBusinessCollection(request,"프로세스 이름");
BusinessHelper helper = new BusinessHelper();
helper.convertToTableRow(bc);

for(int i = 0; i > bc.size(); i++)
{
     BusinessData bd = bc.getBusinessData(i);
}

 

**/

BusinessCollection roles = RequestHelper.getBusinessCollection(request,"getRoles");
BusinessCollection methodologies = RequestHelper.getBusinessCollection(request,"getMethodologies");

%>

<div class="container-fluid" style="z-index:10;padding-top:20px;">
     <div class="card mb-3" style="padding-bottom:40px;">
           <div class="card-header">
             <h3>Published Methodology Role mapping</h3>
           </div>
          <p>
 * Choose a methodology and set each role for that methodology <br>
 * (Note) The methodology set here will affect everyone's settings.
The methodology is a shared resource that everyone uses together.
          </p>
      </div>

<form id="frmMethodology" name="frmMethodology" method="POST" action="/Anaconda.json">
  <div class="form-group">
   <label for="select">Methodology list:</label>
   <select class="selectpicker" data-style="btn-primary" data-live-search="true" id="MethodologyCode" name="MethodologyCode" onchange="javascript:getPhase(this)">
      <option data-tokens="" value="">Select Methodology</option>
     <%
     for(int i = 0; i < methodologies.size(); i++){
     %>
     <option data-tokens="<%=methodologies.getBusinessData(i).getFieldValue("MethodologyCode")%>" value="<%=methodologies.getBusinessData(i).getFieldValue("MethodologyCode")%>"><%=methodologies.getBusinessData(i).getFieldValue("MethodologyName")%></option>
     <%
     }
     %>
   </select>
  </div>
  <div class="form-group">
   <label for="select">Phase list:</label>
   <select class="selectpicker" data-style="btn-primary" data-live-search="true"  id="PhaseCode" name="PhaseCode" onchange="javascript:getActivity(this)">
   </select>
  </div>
  <div class="form-group">
   <label for="select">Activity list:</label>
   <select class="selectpicker" data-style="btn-primary" data-live-search="true" id="ActivityCode" name="ActivityCode" 
 onchange="javascript:getRole(this)">
   </select>
  </div>

  <div class="form-group">
   <label for="select">Role list:</label>
   <select class="selectpicker" data-style="btn-primary" data-live-search="true" id="RoleCode" name="RoleCode">
     <option data-tokens="" value="">Select Role</option>
     <%
     for(int i = 0; i < roles.size(); i++){
     %>
     <option data-tokens="<%=roles.getBusinessData(i).getFieldValue("RoleCode")%>" value="<%=roles.getBusinessData(i).getFieldValue("RoleCode")%>"><%=roles.getBusinessData(i).getFieldValue("RoleName")%></option>
     <%
     }
     %>
   </select>
  </div>
  <button type="button" id="btn_save" class="btn btn-primary btn-lg" onclick="javascript:saveRole();">Save</button>
</form>
</div>

<script>
function getPhase(sel){
   ajaxConda('frmMethodology','CMD_SEQ_104178628611500956664491',false , (d)=>{
     var data = JSON.parse(d);
     if(data && data.PhaseList && data.PhaseList.length > 0){
        $('#PhaseCode').empty();
        $('#PhaseCode').append('<option data-tokens="" value="">Select Phase</option>');
        for(var i = 0; i <  data.PhaseList.length ; i++){
          var a = data.PhaseList[i].PhaseCode;
          var b = data.PhaseList[i].PhaseName;
          $('#PhaseCode').append('<option data-tokens="'+a+'" value="'+a+'">'+b+'</option>');
        }   
     }
   });
}

function getActivity(sel){
   ajaxConda('frmMethodology','CMD_SEQ_105348746431500956668200',false , (d)=>{
     var data = JSON.parse(d);
     if(data && data.ActivityList && data.ActivityList.length > 0){
        $('#ActivityCode').empty();
        $('#ActivityCode').append('<option data-tokens="" value="">Select Activity</option>');  
        for(var i = 0; i <  data.ActivityList.length ; i++){
          var a = data.ActivityList[i].ActivityCode;
          var b = data.ActivityList[i].ActivityName;
          $('#ActivityCode').append('<option data-tokens="'+a+'" value="'+a+'">'+b+'</option>');
        }   
     }
   });
}

function getRole(sel){
   ajaxConda('frmMethodology','CMD_SEQ_100354901051567033277077',false , (d)=>{
     var data = JSON.parse(d);
     if(data && data.ActivityDetail && data.ActivityDetail.length > 0){
        $('#RoleCode').val(data.ActivityDetail[0].RoleCode);
     }
   });
}

function saveRole(){
   ajaxConda('frmMethodology','CMD_SEQ_103403780461567033281543',false , (d)=>{
     var data = JSON.parse(d);
     if(data && data.updateRole && data.updateRole.length > 0){
        alertPopup('congratulation','Your request was applied successfully');
     }
   });
}

// CMD_SEQ_103403780461567033281543
</script>
