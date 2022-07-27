<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.queue.*" %>
<%@ page import="com.stuko.anaconda.bi.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.Exception.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="com.stuko.anaconda.jstl.util.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
try
{
/**
1. H/W 모니터링
  가. 메모리 상태 정보
  나. CPU 상태 정보
  다. HDD 상태 정보
2. 사용자 요청 트래픽 모니터링
 가. 금일 초당 평균 요청 건수
 나. 금일 평균 요청 처리 시간
 다. 최장 요청 처리 시간
3. 오류 건수 모니터링
 가. 시간대별 오류 건수
 나. 가장 많은 오류 요청 정보
4. 가장 많은 요청 정보
 가. 가장 많은 요청 정보
 나. 가장 많은 형태의 사용자 흐름
 RequestQueue queue = RequestQueue.getInstance();
 Object[] object = queue.getBIReportQueue();
 if(object != null)
 {

 	for(int i = 0; i < object.length; i++)
 	{
 		if(object[i] != null)
 		{
 			HashMap map = (HashMap)object[i];
 			out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>> " + map.size());
 			Set key = map.keySet();
 			Iterator it = key.iterator();
 			for(;it.hasNext();)
 			{
 				String strKey = (String)it.next();
 				out.println("Key = " + strKey + "/ Value = " + map.get(strKey));
 			}
 		}
 	}
 }

**/

RequestQueue queue = RequestQueue.getInstance();
com.stuko.anaconda.queue.SimpleQueue memory = queue.getQueue(RequestQueue.MEMORY);
String total_memory = "";
String free_memory = "";
String max_memory = "";
String used_memory = "";
String used_percent = "";

if(memory != null)
{
	
	if("true".equals(InitClass.getInstance().getPath(InitClass.TRACE)))
	{
		if(memory.getCount() > 0)
		{
			// String[] data = null;
			//if(memory.getCount() == 1) data = (String[])memory.peek();
			//else data = (String[])memory.poll();
				
			Object[] data = memory.getArray();
			if(data.length > 0)
			{
				String[] memory_data = (String[])data[0];
				total_memory = memory_data[1];
				free_memory = memory_data[2];
				max_memory = memory_data[3];
				used_memory = memory_data[4];
				used_percent = memory_data[5];
			}
		}
	}
}
//--------------------------------------------------------------
// 향후 준비 해야 함.
//--------------------------------------------------------------
RemoteUtil ru = new RemoteUtil();
String disk_command = "";
String cpu_command = "";
if(ru.getOS().equals(RemoteUtil.W2K))
{
	disk_command = "";
	cpu_command = "";
}
else
{
	disk_command = "";
	cpu_command = "";
}
%>

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Trinity CPU & Memory Usage</h3>
			</div>
		</div>
	</div>
</div>

<table>
<tr>
<td valign="top" class="none-border">
<div>
<ul>
<li><b style="color:blue;size:12px;">메모리 정보(MB)</b></li>
</ul>
<div id="chart1" style="margin-top:20px; margin-left:20px; width:300px; height:300px;"></div>
<div style="margin-top:20px; margin-left:130px; width:300px; height:50px;"><font color="red" size="8" style="font-family:arial;"><b><%=used_percent%></b></font>&nbsp;(%)</div>
<script language="javascript">
$(document).ready(function(){
        $.jqplot.config.enablePlugins = true;
        var s1 = [<%=total_memory %>, <%=used_memory %> , <%=free_memory %>, <%=max_memory %>];
        var ticks = ['Total', 'Used' , 'Available', 'MAX'];
         
        plot1 = $.jqplot('chart1', [s1], {
            // Only animate if we're not using excanvas (not in IE 7 or IE 8)..
            animate: !$.jqplot.use_excanvas,
            seriesDefaults:{
                renderer:$.jqplot.BarRenderer,
                pointLabels: { show: true }
            },
            axes: {
                xaxis: {
                    renderer: $.jqplot.CategoryAxisRenderer,
                    ticks: ticks
                }
            },
            highlighter: { show: false }
        });
     
        $('#chart1').bind('jqplotDataClick', 
            function (ev, seriesIndex, pointIndex, data) {
                $('#info1').html('series: '+seriesIndex+', point: '+pointIndex+', data: '+data);
            }
        );
    });

</script>
<!-- p><%=used_percent%></p-->
</td>
<td valign="top"  class="none-border">
<%
com.stuko.anaconda.queue.SimpleQueue monitor = queue.getQueue(RequestQueue.MONITOR);
String elapse = "";
String over = "";
String concurrent = "";
String max_concurrent = "";

if(monitor.getCount() > 0)
{
	String[] cur_monitor = null;
	// if(monitor.getCount() == 1) cur_monitor = (String[])monitor.peek();
	// else cur_monitor = (String[])monitor.poll();
	cur_monitor = (String[])monitor.peek();
	elapse = cur_monitor[1];
	over = cur_monitor[2];
	concurrent = cur_monitor[3];
	max_concurrent = cur_monitor[4];
}
%>

<ul style="margin-bottom:20px;">
<li><b style="color:blue;size:12px;">트래픽 정보(MB)</b></li>
</ul>
<table style="width:300px; height:300px;">
<tr>
<td width="200px" align="right"  class="none-border">
<div>
<font color="red" size="8" style="font-family:arial;"><b><%=elapse %></b></font>&nbsp;(ms)
<br>&nbsp;&nbsp;최대 수행 시간
</div>
</td>
</tr>
<tr>
<td width="200px" align="right"  class="none-border">
<div>
<font color="blue" size="8" style="font-family:arial;"><b><%=max_concurrent %></b></font>&nbsp;(명)
<br>&nbsp;&nbsp;최대 동시 접속자 수
</div>
</td>
</tr>
<tr>
<td width="200px" align="right"  class="none-border">
<div>
<font color="blue" size="8" style="font-family:arial;"><b><%=concurrent %></b></font>&nbsp;(명)
<br>&nbsp;&nbsp;현재 동시 접속자 수
</div>
</td>
</tr>
</table>
</td>
</tr>
</table>


<%
com.stuko.anaconda.queue.SimpleQueue error_queue = queue.getQueue(RequestQueue.ERROR);
String error_count = "";
String rescent_error = "";
if(error_queue.getCount() > 0)
{
	error_count = (error_queue.getCount()) + "";
	String[] cur_error = (String[])error_queue.peek();
	if(cur_error.length >= 3)
		rescent_error = BusinessHelper.convertBR(BusinessHelper.getSubString(cur_error[2],300,"..."));
}
%>

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Error Info.</h3>
			</div>
		</div>
	</div>
</div>
<table class="table-neo">
<tbody>
<tr>
<td class="td-neo"><font color="white" size="3" style="font-family:돋움체;"><b>오류 건수</b></font></td><td   class="td-neo"><font color="red" size="5" style="font-family:arial;"><b><%=error_count %></b></font> &nbsp;(건)&nbsp;&nbsp;</td>
</tr>
<tr>
<td  class="td-neo"><font color="white" size="3" style="font-family:돋움체;"><b>오류 내용</b></font></td><td   class="td-neo"><%=rescent_error%> </td>
</tr>
</tbody>
</table>
<%
}catch(Exception e)
{
	e.printStackTrace();
	out.println(e.toString());
}
%>

<br><br><br>