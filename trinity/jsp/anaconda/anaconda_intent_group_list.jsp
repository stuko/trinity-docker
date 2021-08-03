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
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getIntentGroupList");
%>
<div>
  <div class="content-module-heading cf" style="margin-bottom:20px;">
    <h3 class="fl">
대화 의도 그룹 정보 목록
    </h3>	
  <span class="fr">
   <input type="button" class="btn btn-secondary" name="Register" value="대화 의도 그룹 등록하기" onClick="javascript:goRegister();">
  </span>

  </div>
  <div class="table-responsive">
    <table class="table">
      <thead>
      <tr>
        <th scope="col">대화 의도 그룹 이름</th>
        <th scope="col">대화 의도 갯수</th>
        <th scope="col">대화 의도 태그</th>
      </tr>
      </thead>
      <tbody>
<%
if(bc != null && bc.size() > 0) {
  for(int i = 0; i < bc.size() ; i++){
%>
      <tr>
        <td><%=bc.getBusinessData(i).getFieldValue("IG_NAME")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("IT_COUNT")%></td>
        <td><%=bc.getBusinessData(i).getFieldValue("IG_TAG")%></td>
      </tr>
<%
  }
}else{
%>
      <tr>
        <td colspan="3">대화 의도 그룹 정보가 없습니다.</td>
      </tr>
<%
}
%>
      </tbody>
    </table>
  </div>


<p height="20px">&nbsp;</p>
<p align="center">
<%
BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"selectTotalCount");
String strCount = bc1.getBusinessData(0).getFieldValue("CNT");
%>
<script language="javascript">
function fnPage(seq)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_108015592941580175502168&pos=" + seq;
}
</script>
<%
int cnt = Integer.parseInt(strCount);
int page_count = cnt/20;
int page_mod = cnt%20;
// if(page_mod > 0) page_count++;
String seq = request.getParameter("pos");
if(!BusinessHelper.checkBusinessNull(seq))seq = "0";
int iseq = Integer.parseInt(seq);
for(int i = 0; i <= page_count;i++)
{
	if(iseq == i*20)
	{
	%>
		<%=i+1 %>
	<%
		
	}
	else
	{
	%>
		<a href="javascript:fnPage('<%=i*20 %>');"><%=i+1 %></a>
	<%
		
	}
}
%>
</div>

<script>
function goRegister(){
  document.location.href="/Anaconda.do?CMD=CMD_SEQ_103658193111580192021758";
}
</script>
