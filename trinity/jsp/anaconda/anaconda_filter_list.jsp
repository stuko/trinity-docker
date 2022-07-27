<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.filter.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>


<script language="javascript">
<!--
function fnFilterCreate()
{
	document.location.href="/Anaconda.do?CMD=CMD_SEQ_106855886431288257600525";
}

function fn_ActFilterCollection(args)
{
	document.location.href="/Anaconda.do?CMD=CMD_SEQ_106855886431288257600525&ActColName="+args;
}

function fnFilterDelete(args)
{
	var bAnswer = confirm("Really delete?");
	
	if (bAnswer == true) 
	{
		document.frm.action="/Anaconda.do?CMD=CMD_SEQ_106025468951288260696078&code=del&ActColName="+args;
		AnacondaSubmit(document.frm);		
	} else {
		alert("Cancelled");
		return;
	}
}

//-->
</script>
<form name="frm" method="POST" action="">
</form>

<div id="table-content">

 <div>
   <div class="content-module-heading cf">
     <h3 class="fl">
     Filter List Info.
     </h3>	
     <span class="fr">
     <button type="button" class="btn btn-primary" name="Register" value="Create filter" onClick="javascript:fnFilterCreate();">Create a filter</button>             
     </span>
   </div>
 </div>


 <div>

		<table class="table_hydra" cellspacing="0" cellpadding="0">
		<colgroup>
		<col width="10%">
		<col width="15%">
		<col width="10%">
		<col width="5%">
		</colgroup>
		<thead>
		<tr>
		<th scope="col">Filter group name</th>
		<th scope="col">Filter name</th>
		<th scope="col">Filter dead line</th>
		<th scope="col">Function</th>
		</tr>
		</thead>
		<tbody >
		<%
			try
			{
				WebActionFilterXmlResource xmlResource = WebActionFilterXmlResource.getInstance();
				Iterator it = xmlResource.getWebActionFilterCollection();
				WebActionFilterCollection webActionFilterCollection = null;
				WebActionFilter webFilter = null;

				for (;it.hasNext();)
				{
				    webActionFilterCollection = (WebActionFilterCollection)it.next();
				    Iterator iterator = webActionFilterCollection.iterator();
				    int iSize = webActionFilterCollection.size();
				    for(int i =0 ;iterator.hasNext(); i++)
				    {
						webFilter = (WebActionFilter)iterator.next();
		 				out.println("<tr>");
						if(i == 0)
						{
							out.println("<td rowspan=" + iSize +" class=left><a href=\"javascript:fn_ActFilterCollection('"+webActionFilterCollection.getFILTERCOLLECTION_NAME()+"')\"><img src=\"/jsp/anaconda/img/trinity_icon.gif\" border=0>&nbsp;"+webActionFilterCollection.getFILTERCOLLECTION_KOR_NAME()+"</a></td>");
						}
						out.println("<td class=left>"+(webFilter.getFileter_kor_name().length() > 15 ? webFilter.getFileter_kor_name().substring(0,15) + "..." : webFilter.getFileter_kor_name())+"</td>");						
						//out.println("<td class=left>"+(webFilter.getFilter_forward().length() > 20 ? webFilter.getFilter_forward().substring(0,20) + "..." : webFilter.getFilter_forward())+"</td>");
						//out.println("<td class=left>"+webFilter.getUrlpattern()+"</td>");
						 
						//out.println("<td class=left>"+(webFilter.getFilter_type().equals("FILTER_URL") ? "URL" : "Request")+"</td>");
						String stime = String.valueOf(webFilter.getTo_yyyymmddhhmmssSSS()).substring(0,4)+"년"+String.valueOf(webFilter.getTo_yyyymmddhhmmssSSS()).substring(4,6)+"월"+String.valueOf(webFilter.getTo_yyyymmddhhmmssSSS()).substring(6,8)+"일";
						out.println("<td class=left>"+stime+"</td>");						
						if(i == 0)
						{							
							out.println("<td rowspan=" + iSize +" class=left>&nbsp;<button type='button' class='btn btn-danger' onClick=\"javascript:fnFilterDelete('"+webActionFilterCollection.getFILTERCOLLECTION_NAME()+ "')\">Delete</button></td>");
						}
						out.println("</tr>");
					}					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
		</tbody>
		</table>
</div>
</div>
