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
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_106299522501559973855919";
}
function fnRemove(seq){
    ajaxConda(null,'CMD_SEQ_107558122001559979928639&seq='+seq,null , ()=>{
        location.reload()
    });
}
</script>


<div>
 <div class="content-module-heading cf">
  <h3 class="fl">
  Manage database connection
  </h3>	
  <span class="fr">
   <button type="button" class="btn btn-primary" name="Register" value="Create connection" onClick="javascript:goWrite();">Create connection</button>
  </span>
 </div>
</div>
  <p>  
    <b style="color:red">TRINITY 서버를 여러대 운영 할 경우, 아래에 등록하신 데이터베이스 연결들은 재시작 후 반영됩니다.</b>
  </p>

<table class="table-neo">
   <thead class="th-neo">
   <td>Connection name</td>
   <td>Driver class name</td>
   <td>Connection URL</td>
   <td>Max</td>
   <td>Min</td>
   <td>Function</td>
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
		String seq = bd.getFieldValue("SEQ");
                String jndi = bd.getFieldValue("JNDI");
		String url = bd.getFieldValue("URL");
		String driver = bd.getFieldValue("DRIVER");
		String max = bd.getFieldValue("TOTAL");
		String min = bd.getFieldValue("IDLE");
	%>
	<tr>
	<td><font style="color:black">&nbsp;&nbsp;<%=jndi%></font></td>
	<td><font style="color:black">&nbsp;&nbsp;<%=driver%></font></td>
	<td><a href="/Anaconda.do?CMD=CMD_SEQ_106113405671559978895142&seq=<%=seq%>"><%=url%></a></td>
	<td><%= max%></td>
	<td><%= min%></td>
        <td><span class="fr"><button type="button" class="btn btn-secondary" onClick="fnTest('<%=seq%>')">Test</button>&nbsp;<button type="button" class="btn btn-danger" onClick="fnRemove('<%=seq%>')">Delete</button></span></td> 
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
String strCount = bc1.getBusinessData(0).getFieldValue("CNT");
%>
<script language="javascript">
function fnPage(seq)
{
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_104757947291319959645242&gubun=<%=request.getParameter("gubun") %>&pos=" + seq;
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
