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
<%@ page import="com.stuko.anaconda.util.*"%>

<%
String member_id = "";
if(session.getAttribute(InitClass.getSESSION_DOMAIN()) != null)
{
	Object object = session.getAttribute(InitClass.getSESSION_DOMAIN());
	IAuth auth = (IAuth)object;
	member_id = auth.getAuthItem(("MEMBER_NAME"));
}

%>
<script language="javascript">
function goWrite()
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_109722142151574893082773";
}
function fnModify(seq){
   document.location.href = "/Anaconda.do?CMD=CMD_SEQ_103784080801574893089620&seq="+seq;
}
function fnRemove(seq){
    confirmPopup('확인','DB 연결 정보를 삭제 하시겠습니까?',()=>{    
      ajaxConda(null,'CMD_SEQ_102519505531574893106407&seq='+seq,null , ()=>{
          location.reload()
      });
    });
}
</script>


<div class="container" width="100%">
 <div class="content-module-heading cf">
  <h3 class="fl">
  DB 연결 정보 관리
  </h3>	
  <span class="fr">
   <input type="button" class="btn btn-secondary" name="Register" value="DB 연결정보 생성하기" onClick="javascript:goWrite();">
  </span>
 </div>
</div>
<br>
<table  class="table table-condensed" width="100%" >
   <thead class="th-neo">
   <td>연결 이름</td>
   <td>연결 드라이버 클래스 이름</td>
   <td>JDBC 연결 URL</td>
   <td>최대 연결 갯수</td>
   <td>최소 연결 갯수</td>
   <td>삭제</td>
   </thead>
   <tbody>
<% 
BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getList");
if(bc != null && bc.size() > 0)
{
	Iterator it = bc.iterator();
	for(int i = 1;it.hasNext();i++)
	{
		BusinessData bd = (BusinessData)it.next();
		String seq = bd.getFieldValue("seq");
                String jndi = bd.getFieldValue("jndi");
		String url = bd.getFieldValue("url");
		String driver = bd.getFieldValue("driver");
		String max = bd.getFieldValue("total");
		String min = bd.getFieldValue("idle");
	%>
	<tr>
	<td><font style="color:black">&nbsp;&nbsp;<%=jndi%></font></td>
	<td><font style="color:black">&nbsp;&nbsp;<%=driver%></font></td>
	<td><a href="/Anaconda.do?CMD=CMD_SEQ_103784080801574893089620&seq=<%=seq%>"><%=url%></a></td>
	<td><%= max%></td>
	<td><%= min%></td>
        <td><span class="fr"><button type="button" class="btn btn-primary" style="margin-right:10px;"  onClick="fnModify('<%=seq%>')">Edit</button></span><span class="fr"><button type="button" class="btn btn-danger" onClick="fnRemove('<%=seq%>')">Delete</button></span></td> 
	</tr>
	<%
	}
}
%>
	</tbody>
	</table>


<p height="20px">&nbsp;</p>
<p align="center">
<%
BusinessCollection bc1 = RequestHelper.getBusinessCollection(request,"selectTotalCount");
String strCount = bc1.getBusinessData(0).getFieldValue("cnt");
%>
<script language="javascript">
function fnPage(seq)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_102510211121574893072709&gubun=<%=request.getParameter("gubun") %>&pos=" + seq;
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
