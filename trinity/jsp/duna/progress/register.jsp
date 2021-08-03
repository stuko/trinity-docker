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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getSprintList");
%>
<div style="margin-bottom:20px;margin-top:10px;">
  <h3 class="fl">
      요구사항 등록
    </h3>	
  <p>
  <span>
   <button class="btn btn-primary" id="backToList"><< 돌아가기</button>
  </span>
  <span>
   <button class="btn btn-secondary" id="save"">등록</button>
  </span>
  </p>
</div>

<div>
  <div>
   요구사항 등록 계정 : <%=request.getParameter("Account")%>
  </div> 
  <form name="frmRegister" id="frmRegister" method="POST">
   <div>
     <div class="row">
       <div class="col">
       스프린트 : <select name="SP_KEY" id="SP_KEY">
       <%
          if(bc != null && bc.size() > 0){
            for(int i = 0;i < bc.size() ;i++){
       %>
           <option value="<%=bc.getBusinessData(i).getFieldValue("SP_KEY")%>"><%=bc.getBusinessData(i).getFieldValue("SP_NAME")%>(<%=bc.getBusinessData(i).getFieldValue("START_DATE")%> ~ <%=bc.getBusinessData(i).getFieldValue("END_DATE")%>)</option>    
       <%
            }
         }
       %>
      </select>
      </div>
     </div>
     <div class="row">
       <div class="col">
        요구사항 : <textarea rows="3" cols="30" name="BL_TEXT" class="styled" size="100" id="BL_TEXT" ></textarea>
       </div>
    </div>
  </div>
  </form>
</div>

<script>
$('#backToList').on('click',function(event){
  document.location.href = '/Anaconda.do?CMD=CMD_SEQ_105298443101591746625312&PMCode=<%=request.getParameter("PMCode")%>&Account=<%=request.getParameter("Account")%>';
  return false;
});

$('#save').on('click', function(event) {
  save();
});

function save(){
  with(frmRegister){
    if(BL_TEXT.value == ''){
       alert("Please check input field");
       return;
    }

    var d = {SP_KEY : $('#SP_KEY').val() , BL_TEXT : $('#BL_TEXT').val() , PMCode : '<%=request.getParameter("PMCode")%>', SBL_ROLE : '<%=request.getParameter("Account")%>'};

    $.ajax({
      url: "/Anaconda.json?CMD=CMD_SEQ_105849689651592399599327",
      data: d,
      type : "POST",
      dataType: "json",
      success : function (data) {
        alertPopup('성공', '축하합니다. 요구하신 정보가 등록되었습니다.');
        document.location.href="/Anaconda.do?CMD=CMD_SEQ_105298443101591746625312&PMCode=<%=request.getParameter("PMCode")%>&Account=<%=request.getParameter("Account")%>";
      },error : function (err) {
        alertPopup("실패", "죄송합니다. 요구하신 정보를 저장 할 수 없습니다.");        
      }
    });
  }
}
</script>
