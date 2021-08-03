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

<%
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getBackLogDetail");
%>
<%!
    public String nvl(String a) {
        return a==null || "null".equals(a) ? "" : a;
    }
%>
    <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800" style="margin-top:20px;">요구사항 자세히 보기</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <div class="card-header py-3">
              <p>
                <button class="btn btn-primary" id="btn-register" onClick="list()">돌아가기</button>
                <button class="btn btn-info" onClick="update();">수정하기</button>
              </p>
             </div>
            </div>
           
         <div class="card-body">
               <div class="row">
                 <div class="col-sm">

                   <%
                   if(bc != null && bc.size() > 0){
                     for(int i = 0;i < bc.size() ;i++){
                   %>
                    <ul>
                      <li><%=bc.getBusinessData(i).getFieldValue("SP_NAME")%></a></li>
                      <li><%=bc.getBusinessData(i).getFieldValue("BL_TEXT")%></li>
                      <li><div style="margin-left:3px">실제 : <%=nvl(bc.getBusinessData(i).getFieldValue("PROGRESS"))%> %</div>
                           <progress value='<%=bc.getBusinessData(i).getFieldValue("PROGRESS")%>'  max="100">
                           <strong>진척률 <%=bc.getBusinessData(i).getFieldValue("PROGRESS")%> %</strong>
                           </progress></li>
                      <li>진척률 : <input type="text" name="Progress" placeholder="" id="Progress" size="5" value="<%=bc.getBusinessData(i).getFieldValue("PROGRESS")%>"/> %</li>
                      <li>요구사항 : <textarea id="BL_TEXT" name="BL_TEXT" cols="25" rows="5"><%=bc.getBusinessData(0).getFieldValue("BL_TEXT")%></textarea></li>
                      <input type="hidden" id="BL_KEY" name="BL_KEY" value="<%=bc.getBusinessData(0).getFieldValue("BL_KEY")%>">
                    </ul>
                    <%
                      }
                    }
                    %>
                   </div>
          </div>
<script>
function list(){
  document.location.href='/Anaconda.do?CMD=CMD_SEQ_105298443101591746625312&PMCode=<%=request.getParameter("PMCode")%>&Account=<%=request.getParameter("Account")%>';
}
function update(){
 if($('#Progress').val() == null || $('#Progress').val() == ''){
    showPopup('실패','헉!!!. 진척률 정보를 숫자로 입력해야 합니다.',null);
    return;
 }
 confirmPopup('경고','정말로 수정하시겠습니까?',()=>{
    var d = {"SBL_KEY" : '<%=request.getParameter("SBL_KEY")%>',"PROGRESS":$('#Progress').val(),"BL_KEY":$('#BL_KEY').val(),"BL_TEXT":$('#BL_TEXT').val()};
    var cmd = "CMD_SEQ_100981346091592787636671";
    post(d,cmd,(data)=>{
      showPopup('성공','축하합니다!!!. 요청하신 정보가 저장되었습니다..',null);
      window.location.reload();
    },(err)=>{
      showPopup('실패','헉!!!. 요청하신 내용을 저장 하지 못했습니다.',null);
      window.location.reload();
    });
  });
}

</script>
