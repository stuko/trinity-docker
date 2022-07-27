<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.filter.*"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.action.*"%>
<%@ page import="com.stuko.anaconda.xtreme.role.*"%>
<%@ page import="com.stuko.anaconda.view.*"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
// ---------------------------------------------------------------------------------------
// JSP 코딩 규칙
// ---------------------------------------------------------------------------------------

BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getDailyRank");
BusinessHelper helper = new BusinessHelper();
String s1 = "";
String c1 = "";
Iterator it = bc.iterator();
for(;it.hasNext();)
{
	BusinessData bd = (BusinessData)it.next();
	s1 = s1 + bd.getFieldValue("CNT") + "," ;
	//c1 = c1 + "'" + bd.getFieldValue("YYYYMMDD") + "-" + bd.getFieldValue("BI_WHAT") + "'" + "," ;
	c1 = c1 + "'" + bd.getFieldValue("BI_WHAT") + "'" + "," ;
}
if(s1.endsWith(",")) s1 = s1.substring(0,s1.length()-1);
if(c1.endsWith(",")) c1 = c1.substring(0,c1.length()-1);

%>

<div class="post">

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Analysis-Statistics.</h3>
		</div>
	</div>
</div>



</div>
<div id="chart1" style="margin-top:20px; margin-left:20px; width:80%; height:300px; font-size:12px;"></div>
<script language="javascript">
$(document).ready(function(){
        $.jqplot.config.enablePlugins = true;
        var s1 = [<%=s1 %>];
        var ticks = [<%=c1%>];
         
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



<table class="table_hydra" cellspacing="0" cellpadding="0">
<tbody>
<%=helper.convertToTableRow(bc)%>
</tbody>
</table>


