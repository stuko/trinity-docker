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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getMyActionList");
%>
 <div id="page-wrapper" class="gray-bg">

  <%@ include file="/jsp/API/sub_top_common.jsp" %>

<div class="wrapper wrapper-content animated fadeInRight">

            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h3 style="font-weight:bold">REST API 서비스 리스트</h3>
                        </div>
                        <div class="ibox-title">
                            <p>
                            아래에 등록된 API 리스트는 회원님께서 사용하실 수 있습니다. <br>
                            회원님의 앱에서 사용하실경우, 아래처럼 URL을 호출해 주시면 됩니다.<br>
                            만약, 보안 연결이 필요하신 경우, https://app.bestmember.net 으로 변경하여 호출해 주시기 바랍니다. <br>          
                            "http://api.bestmember.net/{your email}/Anaconda.json?CMD=XXXXXXXX" <br>
                            {등록시 사용한 이메일}.
                            </p>
                              <button id="edit" name="edit" class="btn btn-primary" type="button" onClick="javascript:fnGoRegisterService();">서비스 추가</button>
                        </div>
                        <div class="ibox-content">

                            <table class="footable table table-stripped toggle-arrow-tiny">
                                <colgroup> 
                                 <col width="10%"/>
                                 <col width="50%"/>
                                 <col width="20%"/>
                                 <col width="20%"/>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th data-toggle="true">서비스 이름</th>
                                    <th>URL 정보</th>
                                    <th>REST API 서비스<br>하위 프로세스<br>개수</th>
                                    <th>기능</th>
                                </tr>
                                </thead>
                                <tbody>
                         <%
                           for(int i = 0 ; i < bc.size(); i++){
                                BizLogicXmlResource xmlResource = BizLogicXmlResource.getInstance();
                                BusinessCollection data =  xmlResource.getBusinessCollection(bc.getBusinessData(i).getFieldValue("BusinessServiceCode"));
                                if(data == null) continue;
                          %>
                                <tr>
                                    <td><%=data.getBIZ_COLLECTION_KOR_NAME()%></td>
                                    <td><a href="javascript:fnEditTrinityService('<%=data.getBusinessName()%>');">http://api.bestmember.net/{Your Email}/Anaconda.json?CMD=<%=bc.getBusinessData(i).getFieldValue("Command")%></a></td>
                                    <td><%=data.size()%></td>
                                    <td>
<button id="edit" name="edit" class="btn btn-sm btn-primary" type="button" onClick="javascript:fnEditTrinityService('<%=data.getBusinessName()%>');">서비스 편집</button>
                                          <button id="delete" name="delete" class="btn btn-sm btn-danger" type="button"  onClick="javascript:fnDeleteTrinityService('<%=data.getBusinessName()%>');">서비스 삭제</button>
                                          
                                   </td>
                                </tr>
                             <%
                              }
                             %>
                               </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="5">
                                        <ul class="pagination pull-right"></ul>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
</div>
<script language="javascript">
function fnGoRegisterService(){
    document.location.href = '/Anaconda.do?CMD=CMD_SEQ_101546461141516501853438';
}
function fnDeleteTrinityService(bcCode){
    if(!confirm("Do you really want to continue ?")) return;
    var d = {businessCollectionName : bcCode}
    post(d,'CMD_SEQ_103054825331516545252055',(json)=>{
                 showPopup('Success', "Congratulation!!! Your REST service was deleted in the TRINITY+ correctly","/Anaconda.do?CMD=CMD_SEQ_109602875151516493932720");
            } , 
            ()=>{
                 showPopup('Error', "Oops!!! Your REST service was not deleted correctly",null);
            } );  
}

function fnEditTrinityService(bcCode){
      document.location.href = '/Anaconda.do?CMD=CMD_SEQ_103893832871516546171498&businessCollectionName=' + bcCode;
}
</script>



  <%@ include file="/jsp/API/sub_footer_common.jsp" %>
 
</div>
