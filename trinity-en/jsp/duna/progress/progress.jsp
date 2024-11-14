<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.xtreme.site.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
.circle {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  font-size: 17px;
  color: #fff;
  line-height: 80px;
  text-align: center;
  background: #000;
  float: left;
  margin-left:10px;
}
</style>
<%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getProgress");
BusinessCollection bc2 = RequestHelper.getBusinessCollection(request,"getStatsOfProgress");
String status = "";
String avgEva = "";
if(bc2 != null && bc2.size() > 0) {
   if(bc2.getBusinessData(0).getFieldValue("EVA_A") != null){
     double d = Double.parseDouble(bc2.getBusinessData(0).getFieldValue("EVA_A"));
     if(d >= 80) {
        status = "G";
     } else if( d >= 60){
        status = "Y";
     } else{
        status = "R";
     } 
     avgEva = d + " %";
   }
   
}

%>
<%!
    public String nvl(String a) {
        return a==null || "null".equals(a) ? "" : a;
    }
%>
    <!-- Page Heading -->
<p style="margin-top:10px;">
<h1 class="h3 mb-2 text-gray-800"><b>프로젝트 상태 정보</b></h1>
</p>
<p  style="margin-top:10px;margin-bottom:20px;">
<p>평균진척률 (실제/계획) : <%=avgEva%> (<%=status%>)</p>
<% if("R".equals(status)) { %>
<div class="circle" style='background:red;color:white;'>위험</div>
<div class="circle" style='background:white;color:black;'>경고</div>
<div class="circle" style='background:white;color:black;'>정상</div>
<%}else if("Y".equals(status)) { %>
<div class="circle" style='background:white;color:black;'>위험</div>
<div class="circle" style='background:yellow;color:black;'>경고</div>
<div class="circle" style='background:white;color:black;'>정상</div>
<%}else if("G".equals(status)) { %>
<div class="circle" style='background:white;color:black;'>위험</div>
<div class="circle" style='background:white;color:black;'>경고</div>
<div class="circle" style='background:green;color:white;'>정상</div>
<%}else { %>
<div class="circle" style='background:white;color:black;'>위험</div>
<div class="circle" style='background:white;color:black;'>경고</div>
<div class="circle" style='background:white;color:black;'>정상</div>
<%}%>
</p>
<div style="clear:both;">
  <div>
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">스프린트 상태</h6>
              <div class="card-header py-3">
              <p>
                <button class="btn btn-primary" id="btn-register" onClick="register()">요구사항 등록</button>
              </p>
             </div>
            </div>
           
            <div class="card-body">
                   <%
                   if(bc != null && bc.size() > 0){
                     for(int i = 0;i < bc.size() ;i++){
                   %>
               <div class="row">
                 <div class="col-sm">
                   <ul data-role="listview">
                      <div><button class="btn btn-primary" onClick="modify('/Anaconda.do?CMD=CMD_SEQ_104230077671592780671824&SBL_KEY=<%=bc.getBusinessData(i).getFieldValue("SBL_KEY")%>&PMCode=<%=request.getParameter("PMCode")%>&Account=<%=request.getParameter("Account")%>')"><%=bc.getBusinessData(i).getFieldValue("SP_NAME")%></button> 
                      <% if(bc.getBusinessData(i).getFieldValue("BL_KEY") != null && !"null".equals(bc.getBusinessData(i).getFieldValue("BL_KEY"))
                         && bc.getBusinessData(i).getFieldValue("BL_TEXT") != null  && !"null".equals(bc.getBusinessData(i).getFieldValue("BL_TEXT")) ) { %>
                         <button class="btn btn-danger" id='btn-remove' onClick="remove('<%=bc.getBusinessData(i).getFieldValue("BL_KEY")%>');">삭제</button>
                      <% } %>
                      </div>
                      <li><span><%=bc.getBusinessData(i).getFieldValue("START_DATE_F")%>~<%=bc.getBusinessData(i).getFieldValue("END_DATE_F")%></span></li>
                      <!--<li><%=nvl(bc.getBusinessData(i).getFieldValue("STATUS"))%>-->
                      <li><div style="margin-left:3px">계획 : <%=nvl(bc.getBusinessData(i).getFieldValue("SV"))%> %</div>
                           <progress value='<%=bc.getBusinessData(i).getFieldValue("SV")%>'  max="100">
                           <strong>진척률 <%=bc.getBusinessData(i).getFieldValue("SV")%> %</strong>
                           </progress></li>
                      <li><div style="margin-left:3px">실제 : <%=nvl(bc.getBusinessData(i).getFieldValue("CV"))%> %</div>
                           <progress value='<%=bc.getBusinessData(i).getFieldValue("CV")%>'  max="100">
                           <strong>진척률 <%=bc.getBusinessData(i).getFieldValue("CV")%> %</strong>
                           </progress></li>
                      <li><div style="margin-left:3px">실제/계획 : <%=nvl(bc.getBusinessData(i).getFieldValue("EVA"))%> %</div>
                           <progress value='<%=bc.getBusinessData(i).getFieldValue("EVA")%>'  max="100">
                           <strong>진척률 <%=bc.getBusinessData(i).getFieldValue("EVA")%> %</strong>
                           </progress></li>
                      <li>담당자 : <%=nvl(bc.getBusinessData(i).getFieldValue("SBL_ROLE"))%></li>
                      <li><%=nvl(bc.getBusinessData(i).getFieldValue("BL_TEXT"))%></li>
                     <hr/>
                    </ul>
               </div>
             </div>
                    <%
                      }
                    }
                    %>
                 
  
<script>
function register(){
  document.location.href='/Anaconda.do?CMD=CMD_SEQ_107575071501592398891518&PMCode=<%=request.getParameter("PMCode")%>&Account=<%=request.getParameter("Account")%>';
}
function modify(u){
 document.location.href=u;
}
function remove(bk){
  confirmPopup('경고','정말로 삭제하시겠습니까('+bk+')?',()=>{
    var d = {"BL_KEY" : bk};
    var cmd = "CMD_SEQ_104208626701592258765125";
    post(d,cmd,(data)=>{
      showPopup('success','Congratulation!!!. your request is successful.',null);
      window.location.reload();
    },(err)=>{
      showPopup('fail','Ooops!!!. your request is not successful.',null);
      window.location.reload();
    });
  });
}
</script>
  </div>
</div>
