
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.bi.*" %>
<%@ page import="com.stuko.anaconda.queue.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="post">
<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Log</h3>
		</div>
	</div>
</div>
<div class="entry" id="logging" style="font-family:arial;color:#6600FF;width:80%;height:900px;overflow-x:scroll;overflow-y:scroll;">
<!-- div id="debug" style="display:block;border: 1px double #BF95FF;padding: 10px 10px 10px 10px;background-color:#FFFFFF;
                      width=1200px;height:700px;overflow-x:scroll;overflow-y:scroll;" -->
				<%
				RequestQueue queue = RequestQueue.getInstance();
				Object[] object = queue.getDebugQueue();
				if(object != null)
				{
				
					String[] from_data = (String[])object[0];
					String[] to_data = (String[])object[object.length - 1];

					String from = from_data[0];
					String to = to_data[0];
					%>
					<div style="font-family:arial;color:#6600FF;font-size:15px;font-weight:bold;"><%=from %> ~ <%=to %></div>
					<pre>
				<%
					String tmp = "";
					int view_count = object.length < 500 ? 500 : object.length;

					for(int i = object.length - view_count ; i < object.length ; i++)
					//for(int i = 0; i < object.length; i++)
					{
						if(object[i] != null)
						{
							String[] data = (String[])object[i];
							if(!tmp.equals(data[0]))
							{
								tmp = data[0];
							}								
				%><%=data[0].trim() %>&nbsp;&nbsp;&nbsp;<%=data[1] %>
				<%			
						}
					}
				%>
				</pre>
				<%

				}
				
				%>

<!--  /div-->
</div>
</div>
