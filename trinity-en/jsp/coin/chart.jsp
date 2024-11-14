<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%
   String names = request.getParameter("names");
   String values = request.getParameter("values");

   String[] an = names.split("[,]");
   String[] av = values.split("[,]");

   StringBuilder str_name = new StringBuilder();
   StringBuilder str_value = new StringBuilder();

   for(int i = 0; i < an.length; i++){
      str_name.append("'" + an[i] + "'");
      if(i != an.length - 1) str_name.append(",");
   }
   for(int i = 0; i < av.length; i++){
      str_value.append("Math.round("+av[i]+")");
      if(i != av.length - 1) str_value.append(",");
   }
%>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['name',<%=str_name.toString()%>],
          ['data',<%=str_value.toString()%>]
        ]);

        var options = {
          chart: {
            title: 'coin price index',
            subtitle: 'coin moving average and current price',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
  </head>
  <body>
    <div id="columnchart_material" style="width: 800px; height: 500px;"></div>
  </body>
</html>
