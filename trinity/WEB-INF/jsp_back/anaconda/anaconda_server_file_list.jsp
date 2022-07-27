<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.io.*" %> 
<%@page import="java.util.*" %> 
<%@page import="java.text.*" %> 
<%
String getFile = request.getParameter("getFile");
String cmd = "true".equals(getFile) ? "CMD_SEQ_107509557321581921847292" : "CMD_SEQ_107581931011562108379033";

SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd  -  HH:mm:ss");
DecimalFormat df = new DecimalFormat("#,###.0");

String folder = request.getParameter("folder");
folder = (folder == null || folder.equals("")) ? "/" : folder;

String pre = folder.substring(0,folder.lastIndexOf("/"));
String root = application.getRealPath("");

 File dir = new File(root + folder);
 if(dir == null) return;
 String total = df.format(dir.getTotalSpace()/1000000) + " (MB)";
 String usable = df.format(dir.getUsableSpace()/1000000) + " (MB)";
 String free = df.format(dir.getFreeSpace()/1000000) + " (MB)";

%>
<script>
function openParent(path){
  opener.setFile(path);
  self.close();
}
</script>
<div class="wrapper wrapper-content">
  <div>
     <div class="content-module-heading cf">
	<h3 class="fl">서버 파일 정보</h3>	
  	     <span class="fr">
               <h4><%=root + folder%></h4>
             </span>
     </div>
    <div>
      <div>
        전체 : <%=total%> , 사용가능 : <%=usable%> , 남은 공간 : <%=free%>
      </div>

     <h3>
      <i class="fas fa-home"></i><a style='margin-left:5px;margin-right:10px;' href="/Anaconda.do?CMD=<%=cmd%>&getFile=<%=getFile%>">홈</a>
      <i class="fas fa-arrow-left"></i><a style='margin-left:5px;' href="/Anaconda.do?CMD=<%=cmd%>&getFile=<%=getFile%>&folder=<%=pre%>">이전</a>
     </h3>
   </div>
  </div>

<table>
<%
try{
  
 

  // File dir = jsp.getParentFile();
  File[] list = dir.listFiles();
  if(list == null || list.length == 0){
    out.println("No files");
    return;
  }
  List<File> dirs  = new ArrayList<>();
  List<File> files  = new ArrayList<>();
  for (int i = 0; i < list.length; i++) {
     if(list[i].isDirectory()) dirs.add(list[i]);
     else  files.add(list[i]);

  }
  for(File f : dirs){
    
         Date lastModifiedDate = new Date( f.lastModified());
         String currentFolder = folder + (folder.endsWith("/") ? "" : "/") + f.getName();
         out.println("<tr><td><i class='fas fa-folder-open'></i><a  style='margin-left:5px;font-size:18px;' href=\"/Anaconda.do?CMD="+cmd+"&getFile="+getFile+"&folder=" + currentFolder + "\">" + f.getName() + "</a></td><td colspan='4'><span class='fr'>"+simpleDateFormat.format( lastModifiedDate )+"</span></td></tr>");   
  }
  for(File f: files){
         Date lastModifiedDate = new Date( f.lastModified());
         if("true".equals(getFile)){
           out.println("<tr><td><a style='font-size:16px;' href='javascript:openParent(&quot;"+ folder + "/" + f.getName() +"&quot;);'> " + f.getName() + "</a></td><td><span class='fr'>"+simpleDateFormat.format( lastModifiedDate )+"</span></td><td><span class='fr' style='margin-right:30px;'>"+df.format(f.length()/1000) + " (KB)" +"</span></td><td><button class='btn btn-primary btn-sm' type='button' style='margin-left:10px;margin-top:3px;margin-bottom:3pxl;' onClick='javascript:fnTransfer(&#39;"+root+"&#39;,&#39;"+dir.getAbsolutePath()+"&#39;,&#39;"+f.getAbsolutePath()+"&#39;);'>파일전송</button></td></tr>");
         }else{ 
           out.println("<tr><td><a style='font-size:16px;' href='/Anaconda.do?CMD=CMD_SEQ_106594560501498179923551&path="+ folder + "/" + f.getName() +"'> " + f.getName() + "</a></td><td><span class='fr'>"+simpleDateFormat.format( lastModifiedDate )+"</span></td><td><span class='fr' style='margin-right:30px;'>"+df.format(f.length()/1000) + " (KB)" +"</span></td><td><button type='button' class='btn btn-primary btn-sm' style='margin-left:10px;margin-top:3px;margin-bottom:3pxl;' onClick='javascript:fnTransfer(&#39;"+root+"&#39;,&#39;"+dir.getAbsolutePath()+"&#39;,&#39;"+f.getAbsolutePath()+"&#39;);'>파일전송</button><td></tr>");
         }
  }

}catch(Exception e){
   e.printStackTrace();
   out.println(e.toString() + " : " + folder);
}

%>
 </table>

</div>
<script>
function fnTransfer(root, dir, f){
  var p = dir.replace(root,'');
  alert(root + ':' + p + ':' + f);
  var d = {
    ip : "222.239.250.13",
    port : "9091",
    path : '/' + p,
    file : f
  };
  post(d,'CMD_SEQ_107830615471584192661078',(json)=>{
    alert('Congratulation... file is transfered\n' + json );
  },(err)=>{
    alert('Error... file is not transfered\n' + err);
  });
  
}
</script>
