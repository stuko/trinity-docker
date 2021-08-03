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
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
// BusinessCollection bc = RequestHelper.getBusinessCollection(request,"getList");
%>
 <%
  String strBody = request.getAttribute(BlankField.VIEW_BODY) == null ? "" : (String)request.getAttribute(BlankField.VIEW_BODY);
  String strFooter = request.getAttribute(BlankField.VIEW_FOOTER) == null ? "" : (String)request.getAttribute(BlankField.VIEW_FOOTER); 
  String strLeft = request.getAttribute(BlankField.VIEW_LEFT) == null ? "" : (String)request.getAttribute(BlankField.VIEW_LEFT); 
  String strRight = request.getAttribute(BlankField.VIEW_RIGHT) == null ? "" : (String)request.getAttribute(BlankField.VIEW_RIGHT); 
  String strTop = request.getAttribute(BlankField.VIEW_TOP) == null ? "" : (String)request.getAttribute(BlankField.VIEW_TOP); 

Object sessionObject = request.getAttribute(InitClass.getSessionValue());
Object account = session.getAttribute("Account");
String jndi = (String)session.getAttribute("jndi");

int intPoint = 0;
if(sessionObject != null){
   BusinessRecord record = (BusinessRecord)sessionObject;
   String point = record.getFieldValue("Point");
   if(point != null){
      intPoint = Integer.parseInt(point);
   }
}

String chatbot_level = "0";
if(account == null) chatbot_level = "-1";


String clientId = "";
String secretKey = "";
Object ocid = session.getAttribute("clientId");
Object osk = session.getAttribute("secretKey");
clientId = ocid == null ? "" : (String)ocid;
secretKey = osk == null ? "" : (String)osk;

String sIp = InitClass.getInstance().getData("ENGINE_IP");
String sPort = InitClass.getInstance().getData("ENGINE_PORT");
String sProtocol = InitClass.getInstance().getData("ENGINE_PROTOCOL");
String wsocket = InitClass.getInstance().getData("WEBSOCKET"); 
String iIp = getLocalIpAddress(); // InetAddress.getLocalHost().getHostAddress();
String iPort = "8081";
String iProtocol = "http";
String ip = BusinessHelper.checkBusinessNull(sIp) ? sIp : iIp;
String port = BusinessHelper.checkBusinessNull(sPort) ? sPort : iPort;
String protocol = BusinessHelper.checkBusinessNull(sProtocol) ? sProtocol : iProtocol ;


 %>
<%!
public String getLocalIpAddress() {
      try {
            for (Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces(); en.hasMoreElements();) {
                  NetworkInterface intf = en.nextElement();
                  for (Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses(); enumIpAddr.hasMoreElements();) {
                        InetAddress inetAddress = enumIpAddr.nextElement();
                        if (!inetAddress.isLoopbackAddress() && inetAddress instanceof Inet4Address) {
                              return inetAddress.getHostAddress();
                        }
                  }
            }
      } catch (SocketException ex) {
            ex.printStackTrace();
      }
      return null;
}

%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Social Project Platform</title>

  <script src="/bt/jquery-ui/1.12.4/jquery.js"></script>
  <script src="/bt/js/plugins/toastr/toastr.min.js"></script>

  <script src="/bt/chart/2.9.3/Chart.min.js"></script>
  <script src="/bt/chart/2.9.3/Chart.bundle.min.js"></script>
  <link href="/bt/chart/2.9.3/Chart.min.css" rel="stylesheet">

  <script language="javascript" src="/jsp/anaconda/js/default.js"></script>
  <script src="/jsp/API/js/process.js"></script>

  <!-- Custom styles for this template -->
  <link href="/bt/agency/css/agency.css" rel="stylesheet">
  <script src="/bt/js/plugins/toastr/toastr.min.js"></script>
  <link rel="stylesheet" href="/bt/css/plugins/toastr/toastr.min.css">
  <link rel="stylesheet" href="/jsp/API/css/my.css">

  <link rel="stylesheet" href="/bt/jquery-ui/1.12.1/jquery-ui.css" />
  <link rel="stylesheet" href="/bt/jquery-ui/1.12.1/jquery-ui.structure.css" />
  <link rel="stylesheet" href="/bt/jquery-ui/1.12.1/jquery-ui.theme.css" /> 
  <script src="/bt/jquery-ui/1.12.1/jquery-ui.js"></script> 

  <!-- Custom fonts for this template -->
  <link href="/jsp/duna/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/jsp/duna/css/sb-admin-2.min.css" rel="stylesheet">
  <script language="javascript" src="/jsp/anaconda/js/default.js"></script>
  <script src="/jsp/API/js/process.js"></script>
  <!-- Custom styles for this page -->
  <link href="/jsp/duna/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">
  <div>
	<!-- alert 팝업 -->
		<div id="alert_popup" class="sp_popup s200 alert_popup" style="display:none;" draggable="true">
			<div class="sp_pop_header"><div class="layer_title"></div></div>
			<div class="sp_pop_container">
				<div class="txt_dialog pop_message" style="min-height:200px;height:200px;margin-top:20px; overflow: auto"></div>
				<p class="foot_btn">
					<a href="#" class="btn_n bg_red modal_alert_confirm">OK</a>
				</p>
			</div>
			<a href="#" class="sp_popup_close modal_alert_close">Close</a>
		</div>

		<!-- confirm 팝업 -->
		<div id="confirm_popup"  class="sp_popup s200 confirm_popup" style="display:none;" draggable="true">
			<div class="sp_pop_header"><div class="layer_title"></div></div>
			<div class="sp_pop_container">
				<div class="txt_dialog pop_message" style="min-height:200px;height:200px;margin-top:20px; overflow: auto"></div>
				<p class="foot_btn">
					<a href="#" class="btn_n bg_red modal_alert_confirm">OK</a>
					<a href="#" class="btn_n bg_gray modal_alert_close">Cancel</a>
				</p>
			</div>
			<a href="#" class="sp_popup_close modal_alert_close">Close</a>
		</div>

		<!-- 상태 진행중 팝업 -->
		<div id="progress_popup"  class="sp_popup s200 status_progress_popup" style="display:none;" draggable="true">
			<div class="sp_pop_header"><div class="layer_title"></div></div>
			<div class="sp_pop_container">
				<div class="txt_dialog">
					<div class="ajax_loader"><div id="circularG_1" class="circularG"></div><div id="circularG_2" class="circularG"></div><div id="circularG_3" class="circularG"></div><div id="circularG_4" class="circularG"></div><div id="circularG_5" class="circularG"></div><div id="circularG_6" class="circularG"></div><div id="circularG_7" class="circularG"></div><div id="circularG_8" class="circularG"></div></div>
					<p class="txt_dialog3 pop_message" style="min-height:200px;height:200px;margin-top:20px; overflow: auto"></p>
				</div>
			</div>
			<a href="#" class="sp_popup_close modal_progress_close">Close</a>
		</div>
    </div>


  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Begin Page Content -->
        <div class="container-fluid">

	<% 
	 if(!strBody.equals("")) { %><jsp:include page="<%=strBody%>" flush="true" /><%
	 }%>


        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

   

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Bootstrap core JavaScript-->
  <script src="/jsp/duna/vendor/jquery/jquery.min.js"></script>
  <script src="/jsp/duna/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/jsp/duna/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/jsp/duna/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="/jsp/duna/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="/jsp/duna/vendor/datatables/dataTables.bootstrap4.min.js"></script>

</body>

</html>
