<%@ page import="java.io.RandomAccessFile" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String logPath = "/home/java/trinity/wayd-install/logs/MYLOG_IS_UNDEFINED/";
    logPath =  request.getParameter("log_path") == null ? logPath : request.getParameter("log_path");

    String fileName = request.getParameter("log_filename") == null ? "" : request.getParameter("log_filename");
 
    if ("".equals(fileName.trim()) == false) {
 
        fileName = logPath + fileName.trim().replaceAll("\\.\\.", "");
 
        long preEndPoint = request.getParameter("preEndPoint") == null ? 0 : Long.parseLong(request.getParameter("preEndPoint") + "");
 
        StringBuilder log = new StringBuilder();
        long startPoint = 0;
        long endPoint = 0;
 
        RandomAccessFile file = null;
        try {
            file = new RandomAccessFile(fileName, "r");
            endPoint = file.length();
 
            startPoint = preEndPoint > 0 ?
                    preEndPoint : endPoint < 2000 ?
                    0 : endPoint - 2000;
 
            file.seek(startPoint);
 
            String str;
            while ((str = file.readLine()) != null) {
                log.append(str);
                log.append("\n");
                endPoint = file.getFilePointer();
                file.seek(endPoint);
            }
 
        } catch (FileNotFoundException fnfe) {
            log.append("["+fileName +"] : File does not exist." + fnfe.toString());
            fnfe.printStackTrace();
        } catch (Exception e) {
            log.append("Sorry. An error has occurred. " + e.toString());
            e.printStackTrace();
        } finally {
            try {file.close();} catch (Exception e) {}
        }
        String line = URLEncoder.encode(new String(log.toString().getBytes("ISO-8859-1"),"UTF-8"), "UTF-8").replaceAll("\\+", "%20");
        // if(line.toLowerCase().indexOf("exception") >= 0 || line.toLowerCase().indexOf("error") >= 0)
        //   line = "<font style='color:yellow;font-wight:bold'>"+line+"</font>";
        out.print("{\"endPoint\":\"" + endPoint + "\", \"log\":\"" + line + "\"}");
 
    } else {
         List<String> fileList = new ArrayList<String>();
        String line = null;
        BufferedReader br = null;
        Process ps = null;
        try {
            Runtime rt = Runtime.getRuntime();
            ps = rt.exec(new String[]{"/bin/sh", "-c", "find "+ logPath + " -maxdepth 1 -type f -exec basename {} \\; | sort"});
            br = new BufferedReader(new InputStreamReader(ps.getInputStream()));
 
            while( (line = br.readLine()) != null ) {
                fileList.add(line);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { br.close(); } catch(Exception e) {}
        }
%>
<div>
    <style type="text/css">
        #console {
            overflow: auto;
            width: 100%;
            height: 600px;;
            background-color: black;
            color:white;
            font-size: 15px;
            padding-left:10px;
            padding-right:10px;
        }
        #runningFlag {
            color: red;
        }
    </style>
 
<div style="margin-top:10px; margin-bottom:10px;">
    <h2>Debugging Log files</h2>
  <table>
   <tr>
    <td> LOG PATH </td>
    <td colspan="3"> <input type="text"  style="width:80%;" id="logPath" value="<%=logPath%>" />
    <p>
      <a href="javascript:setPath('/home/java/trinity/wayd-install/logs/MYLOG_IS_UNDEFINED/');">WAYD</a> 
      <a href="javascript:setPath('/home/java/trinity/tomcat/logs/');">TRINITY</a>
    </p>
 </td>
    <td colspan="2"> <button class="btn btn-primary" onclick="javascript:fnRefresh();">Refresh</button> </td>
   </tr>
   <tr>
    <td>
    tail -f
    </td>
    <td>
    <select id="fileName">
        <%  for (String file : fileList) {  %>
        <option value="<%=file%>"><%=file%></option>
        <%  }   %>
    </select>
    </td>
    <td>
    | grep <input id="grep"  style="width:200px;" type="text" />
    | grep -v <input id="grepV"  style="width:200px;"   type="text" />
    </td>
    <td>
     <button id="startTail" class="btn btn-primary">start tail</button>
    </td>
    <td width="100px">
     <button id="stopTail" class="btn btn-primary">stop tail</button>
    </td>
    <td>
    <span id="runningFlag">Stop</span>
    </td>
   </tr>
   <tr>
    <td colspan="6">
<div style="margin-top:20px;">
<textarea id="console"></textarea>
</div>
    </td>
   </tr>
  </table>
</div>
<script>
function fnRefresh(){
   document.location.href="/Anaconda.do?CMD=CMD_SEQ_104740062431578035448248&log_path=" + $('#logPath').val();
}
</script>

   <script type="text/javascript">
        var endPoint = 0;
        var tailFlag = false;
        var fileName;
        var logPath;
        var consoleLog;
        var grep;
        var grepV;
        var pattern;
        var patternV;
        var runningFlag;
        var match;
        (function() {
            consoleLog = $('#console');
            runningFlag = $('#runningFlag');
 
            function startTail() {
                runningFlag.html('Running');
                fileName = $('#fileName').val();
                logPath = $('#logPath').val();
                grep = $.trim($('#grep').val());
                grepV = $.trim($('#grepV').val());
                pattern = new RegExp('.*'+grep+'.*\\n', 'g');
                patternV = new RegExp('.*'+grepV+'.*\\n', 'g');
                function requestLog() {
                    
                    if (tailFlag) {
                        $.ajax({
                            type : 'POST',
                            url : '/Anaconda.do?CMD=CMD_SEQ_103986104281578040214524',   // #### Caution: The name of the source file
                            dataType : 'json',
                            data : {
                                'log_path' : logPath,
                                'log_filename' : fileName,
                                'preEndPoint' : endPoint
                             },
                            success : function(data) {
                                endPoint = data.endPoint == false ? 0 : data.endPoint;
                                logdata = decodeURIComponent(data.log);

                                if (grep != false) {
                                    match = logdata.match(pattern);
                                    logdata = match ? match.join('') : '';
                                }
                                if (grepV != false) {
                                    logdata = logdata.replace(patternV, '');
                                }
                                consoleLog.val(consoleLog.val() + logdata);
                                consoleLog.scrollTop(consoleLog.prop('scrollHeight'));
 
                                setTimeout(requestLog, 1000);
                            },
                            error : function(data) {
                                alert(JSON.stringify(data));
                            }
                        });
                    }
                }
                requestLog();
            }
            $('#startTail').on('click', function() {tailFlag = true; startTail();});
            $('#stopTail').on('click', function() {
                tailFlag = false;
                runningFlag.html('Stop');
            });
            $('#fileName').change(function() {
                tailFlag = false;
                endPoint = 0;
                runningFlag.html('Stop');
            });
        })();

        function setPath(path){
            $('#logPath').val(path);
            fnRefresh();
        }
    </script>


<%
    }
%>
</div>
