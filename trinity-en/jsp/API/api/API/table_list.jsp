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
BusinessCollection saas = RequestHelper.getBusinessCollection(request,"checkSaaSDB");
String id = "";
String password = "";
String url = "";
String max = "10";
String trinity = "Y";
String needToCreateDB = "N";
if(saas != null && saas.size() > 0){
    id = saas.getBusinessData(0).getFieldValue("Id");
   password = saas.getBusinessData(0).getDecFieldValue("Password").trim();
   url = saas.getBusinessData(0).getFieldValue("Url");
   max = saas.getBusinessData(0).getFieldValue("MaxConnection");
   trinity = saas.getBusinessData(0).getFieldValue("UseTrinity");
   needToCreateDB = saas.getBusinessData(0).getFieldValue("TrinityDBYN");
}


BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getTableInfo"); 
String trinity_use_yn = "You are using the Your database";
if(saas != null && saas.size() > 0 && saas.getBusinessData(0).getFieldValue("UseTrinity").equals("Y")){
     trinity_use_yn = "현재 TRINITY+ 데이터베이스 사용중";
}
%>
 <div id="page-wrapper" class="gray-bg">

  <%@ include file="/jsp/API/sub_top_common.jsp" %>
<div class="ibox-title">
<h3>회원님의 테이블 리스트</h3>
<p><%=trinity_use_yn %></p>
</div>

 <div class="wrapper wrapper-content animated fadeInRight">

<%
if((saas != null && saas.size() > 0 && trinity.equals("N"))
|| (saas != null && saas.size() > 0 && trinity.equals("Y") && needToCreateDB.equals("Y"))  ){
%>
  <form method="get" class="form-horizontal">
                <div class="form-group"><label class="col-sm-2 control-label">테이블 관리<br/>
                                    <small class="text-navy">테이블을 만들고 싶으시면, 아래에 DDL을 입력해 주세요(ex: create table XXXXX) </small></label>
                                     <div class="col-sm-4 col-sm-offset-2">
                                        <button class="btn btn-primary" type="button" onClick="javascript:fnCreateTable();">테이블 생성</button>
                                    </div>
                  </div>
                <div class="form-group"><label class="col-sm-2 control-label">DDL</label>
                    <div class="col-sm-4 col-sm-offset-2">
                            <textarea id="ddl" class="form-control" rows="4" cols="30"></textarea>
                    </div>
                </div>
</form>
<%
}
%>

        <div class="row">
        <%
        if(bc != null && bc.size() > 0){
          for(int i = 0; i < bc.size(); i++){
             BusinessData bd = bc.getBusinessData(i);
       %>
            <div class="col-lg-4">
                <div class="contact-box">
                    <div class="col-sm-8">
                        <h3><strong><%=bd.getBusinessName() %></strong></h3>
                        <p><i class="fa fa-map-marker"></i> <%=bd.getTYPE() %></p>
                        <address>
                        <%
                             for(int j = 0; j < bd.size(); j++){
                                   BusinessItem item = bd.getBusinessItem(j);
                       %>
                            <%=item.getValue() %>(<%=item.FIELD_TYPE %>)<br>
                        <%
                           }
                         %>
                        </address>
                        <button class="btn btn-danger" type="button" onClick="javascript:fnDropTable('<%=bd.getBusinessName() %>');">테이블 삭제</button>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
       <% } }%>
     </div>
</div>




<script language="javascript">

</script>
  <%@ include file="/jsp/API/sub_footer_common.jsp" %>
 
</div>
