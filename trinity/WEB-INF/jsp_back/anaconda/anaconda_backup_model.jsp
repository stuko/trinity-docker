<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.util.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>

<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="com.stuko.anaconda.xtreme.site.*"%>
<%@ page import="java.util.*"%>

<%
  WebActionXmlResource wXml = WebActionXmlResource.getInstance();
  XtremeSiteManager xsm = XtremeSiteManager.getInstance();

%>
<script language="javascript">
$(document).ready(function() {
   $( ".wac" ).hide();
   $( ".domain" ).show();

    $("input[name='search_type']:radio").change(function () {
       var searchType = this.value;
       if(searchType == "domain"){
            $( ".wac" ).hide();
            $( ".domain" ).show();
       }else if(searchType == "wac"){
            $( ".domain" ).hide();
            $( ".wac" ).show();
       }
                                         
   });
});

function fnBackup(){
   with(frm){
     var cmd = "CMD_SEQ_103343496681577858717017"; 
     if(search_type.value == 'domain'){    
       if(xtremeKey.value == ''){
           alert('도메인을 입력해 주세요');
           return;
       }
       cmd = "CMD_SEQ_103343496681577858717017";
     }else if(search_type.value == 'wac'){
       if(wac.value == ''){
           alert('웹액션컬렉션을 선택해 주세요');
           return;
       }
       cmd = "CMD_SEQ_109274546151577858680363";
     }else{
       alert('백업 유형을 선택해 주세요');
       return;
     }
     if(destPath.value == ''){
         alert('백업 폴더를 입력해 주세요');
         return;
     }

     ajaxConda("frm",cmd,()=>{
       alert('모델 백업이 진행 중입이다. 약 1분 후에 '+destPath.value+' 폴더를 확인해 보세요');
     },()=>{
       alert('모델 백업이 진행 중입이다. 약 1분 후에 '+destPath.value+' 폴더를 확인해 보세요');
     });   
   }
   
}
</script>

<div>
 <div class="content-module-heading cf">
  <h3 class="fl">
  TRINITY 모델 백업하기
  </h3>	
  <span class="fr">
   <button type="button" class="btn btn-primary" onClick="javascript:fnBackup();">Backup</button>
  </span>
 </div>
</div>

<form name="frm" id="frm" method="post" action="/Anaconda.do">
<table class="table-neo">
  <tbody>
  <tr><td>백업 유형 선택</td><td> <input type="radio" name="search_type" value="domain" checked />도메인 <input type="radio" name="search_type" value="wac" />웹액션</td></tr>
<tr class="domain"><td>도메인</td><td>
      <select name="xtremeKey" id="xtremeKey" class="styled">
         <%
           DefaultXmlDataCollection dxdc = xsm.searchXtremeSite("");
           Iterator it = dxdc.iterator();
           for(int i = 0;it.hasNext();i++){
             DefaultXmlData dxd = (DefaultXmlData)it.next();
             if(dxd == null) continue;
             XtremeSite site = xsm.getXtremeSite(dxd.getData("application_key"));
             if(site == null) continue;
         %>
            <option value="<%=site.getSiteId()%>"><%=site.getDomain()%>  -> [<%=site.getSiteName()%>]</option>
         <%
          }
         %>
      </select>
</td></tr>
<!--
  <tr class="domain"><td>도메인</td><td> <input type="text" name="domain" id="domain" value=""  size="30" class="styled"></td></tr>
  <tr class="domain"><td>컨텍스트</td><td> <input type="text" name="context" id="context" value=""  size="40" class="styled"></td>
--> 

</tr>
  <tr class="wac"><td>웹액션</td>
    <td>
      <select name="wac" id="wac" class="styled">
         <%
           it = wXml.getWebActionCollection();
           for(;it.hasNext();){
             WebActionCollection wac= (WebActionCollection)it.next();
         %>
            <option value="<%=wac.getWEBACTION_NAME()%>"><%=wac.getWEBACTION_KOR_NAME()%></option>
         <%
          }
         %>
      </select>
    </td>
  </tr>
  <tr><td>백업폴더</td><td> <input type="text" name="destPath" id="destPath" value=""  size="80" class="styled">
   <p>
    저장하실 폴더를 입력하실 경우, 절대경로(/home/~.... 혹은 c:\temp)로 입력해 주셔야 합니다.
   </p>
  </td></tr>
  </tbody>
</table>
</form>

<script>
</script>
