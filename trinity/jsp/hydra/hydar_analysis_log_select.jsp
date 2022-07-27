
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
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
	StringBuffer sb_data = new StringBuffer();
	StringBuffer sb_cols = new StringBuffer();
	BusinessCollection bc = RequestHelper.getBusinessCollection(request,"tag_log");
	Iterator it = bc.iterator();
	for(int i = 0;it.hasNext();i++)
	{
		BusinessData bd = (BusinessData)it.next();
		if(i != 0)
		{
			sb_data.append(",");
			sb_cols.append(",");
		}
		sb_data.append(bd.getFieldValue("CNT"));
		//sb_cols.append("'" + bd.getFieldValue("YYYYMMDD") + "-" + bd.getFieldValue("TAG_NAME") + "'");
		sb_cols.append("'" + bd.getFieldValue("YYYYMMDD") + "'");
	}


%>

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Analysis-Tagging(Log) (Tagging Name : <%=request.getParameter("tag_value")%>)</h3>
		</div>
	</div>
</div>


 

<div id="chart1" style="margin-top:20px; margin-left:20px;  height:300px;"></div>
<script language="javascript">
$(document).ready(function(){
        $.jqplot.config.enablePlugins = true;
        var s1 = [<%=sb_data.toString() %>];
        var ticks = [<%=sb_cols.toString() %>];
         
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

<%
}catch(Exception e)
{
	e.printStackTrace();
	out.println(e.toString());
}
%>

