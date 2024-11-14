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
  String strBody = request.getAttribute(BlankField.VIEW_BODY) == null ? "" : (String)request.getAttribute(BlankField.VIEW_BODY);
  String strFooter = request.getAttribute(BlankField.VIEW_FOOTER) == null ? "" : (String)request.getAttribute(BlankField.VIEW_FOOTER); 
  String strLeft = request.getAttribute(BlankField.VIEW_LEFT) == null ? "" : (String)request.getAttribute(BlankField.VIEW_LEFT); 
  String strRight = request.getAttribute(BlankField.VIEW_RIGHT) == null ? "" : (String)request.getAttribute(BlankField.VIEW_RIGHT); 
  String strTop = request.getAttribute(BlankField.VIEW_TOP) == null ? "" : (String)request.getAttribute(BlankField.VIEW_TOP); 
  String currentPath = "Please Input";
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        인공지능 프로젝트 관리 로봇(AI PM)
    </title>
    <link rel="shortcut icon" href="/jsp/aipm/images/favicon.png" type="image/png">
    <!-- GOOGLE FONT -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <!-- BOXICONS -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

    <!-- Plugin -->
    <link rel="stylesheet" href="/jsp/aipm/libs/owl.carousel/assets/owl.carousel.min.css">

    <!-- APP CSS -->
    <link rel="stylesheet" href="/jsp/aipm/css/bootstrap.min.css">
    <link rel="stylesheet" href="/jsp/aipm/css/grid.css">
    <link rel="stylesheet" href="/jsp/aipm/css/style.css">
    <link rel="stylesheet" href="/jsp/aipm/css/responsive.css">
</head>

<body class="sidebar-expand">

    <!-- SIDEBAR -->
    <div class="sidebar">
        <div class="sidebar-logo">
            <a href="index.html">
                <img src="/jsp/aipm/images/logo.png" alt="DUNA logo">
            </a>
            <div class="sidebar-close" id="sidebar-close">
                <i class='bx bx-left-arrow-alt'></i>
            </div>
        </div>
        <!-- SIDEBAR MENU -->
        <div class="simlebar-sc" data-simplebar>
            <ul class="sidebar-menu tf">
                <li class="sidebar-submenu">
                    <a href="index.html" class="sidebar-menu-dropdown">
                        <i class='bx bxs-home'></i>
                        <span>대시보드</span>
                        <div class="dropdown-icon">
                            <i class='bx bx-chevron-down'></i>
                        </div>
                    </a>
                    <ul class="sidebar-menu sidebar-menu-dropdown-content">
                        <li>
                            <a href="index.html">
                                대시보드
                            </a>
                        </li>
                        <li>
                            <a href="user-profile.html">
                                내 정보
                            </a>
                        </li>
                   </ul>
                </li>
                <li class="sidebar-submenu">
                    <a href="project.html" class="sidebar-menu-dropdown">
                        <i class='bx bxs-bolt'></i>
                        <span>프로젝트</span>
                        <div class="dropdown-icon"><i class='bx bx-chevron-down'></i></div>
                    </a>
                    <ul class="sidebar-menu sidebar-menu-dropdown-content">
                        <li>
                            <a href="project.html">
                               내 프로젝트
                            </a>
                        </li>
                        <li>
                            <a href="new-project.html">
                                프로젝트 만들기
                            </a>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>

        <!-- END SIDEBAR MENU -->
    </div>
    <!-- END SIDEBAR -->
    <!-- Main Header -->
    <div class="main-header">
        <div class="d-flex">
            <div class="mobile-toggle" id="mobile-toggle">
                <i class='bx bx-menu'></i>
            </div>
            <div class="main-title">
                Dashboard
            </div>
        </div>

        <div class="d-flex align-items-center">

            <!-- App Search-->
            <form class="app-search d-none d-lg-block">
                <div class="position-relative">
                    <input type="text" class="form-control" placeholder="Search">
                    <span class="bx bx-search-alt"></span>
                </div>
            </form>
            <div class="dropdown d-inline-block d-lg-none ms-2">
                <button type="button" class="btn header-item noti-icon waves-effect" id="page-header-search-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class='bx bx-search-alt' ></i>
                    </button>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0" aria-labelledby="page-header-search-dropdown">

                    <form class="p-3">
                        <div class="form-group m-0">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
                                <div class="input-group-append">
                                    <button class="btn btn-primary h-100" type="submit"><i class='bx bx-search-alt' ></i></button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

           
            <!-- <div class="dropdown d-none d-lg-inline-block ms-1">
                <button type="button" class="btn header-item noti-icon waves-effect" data-toggle="fullscreen">
                        <i class="bx bx-fullscreen"></i>
                    </button>
            </div> -->
            <div class="dropdown d-inline-block mt-12">
                <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img class="rounded-circle header-profile-user" src="/jsp/aipm/images/profile/profile.png"
                            alt="Header Avatar">
                        <span class="pulse-css"></span>
                        <span class="info d-xl-inline-block  color-span">
                            <span class="d-block fs-20 font-w600">Randy Riley</span>
                            <span class="d-block mt-7" >randy.riley@gmail.com</span>
                        </span>
                            
                        <i class='bx bx-chevron-down'></i>
                    </button>
                <div class="dropdown-menu dropdown-menu-end">
                    <!-- item-->
                    <a class="dropdown-item" href="#"><i class="bx bx-user font-size-16 align-middle me-1"></i> <span>Profile</span></a>
                    <a class="dropdown-item" href="#"><i class="bx bx-wallet font-size-16 align-middle me-1"></i> <span>My Wallet</span></a>
                    <a class="dropdown-item d-block" href="#"><span class="badge bg-success float-end">11</span><i class="bx bx-wrench font-size-16 align-middle me-1"></i> <span>Settings</span></a>
                    <a class="dropdown-item" href="#"><i class="bx bx-lock-open font-size-16 align-middle me-1"></i> <span>Lock screen</span></a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item text-danger" href="user-login.html"><i class="bx bx-power-off font-size-16 align-middle me-1 text-danger"></i> <span>Logout</span></a>
                </div>
            </div>
        </div>
    </div>




  <% if(!strBody.equals("")) { %><jsp:include page="<%=strBody%>" flush="true" /><%}%>




  <div class="overlay"></div>

    <!-- SCRIPT -->
    <!-- APEX CHART -->

    <script src="/jsp/aipm/libs/jquery/jquery.min.js"></script>
    <script src="/jsp/aipm/libs/moment/min/moment.min.js"></script>
    <script src="/jsp/aipm/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/jsp/aipm/libs/peity/jquery.peity.min.js"></script>
    <script src="/jsp/aipm/libs/chart.js/Chart.bundle.min.js"></script>
    <script src="/jsp/aipm/libs/owl.carousel/owl.carousel.min.js"></script>
    <script src="/jsp/aipm/libs/bootstrap/js/bootstrap.min.js"></script>
    <script src="/jsp/aipm/libs/apexcharts/apexcharts.js"></script>
    <script src="/jsp/aipm/libs/simplebar/simplebar.min.js"></script>

    <!-- APP JS -->
    <script src="/jsp/aipm/js/main.js"></script>
    <script src="/jsp/aipm/js/dashboard.js"></script>
    <script src="/jsp/aipm/js/shortcode.js"></script>
    <script src="/jsp/aipm/js/pages/dashboard.js"></script>


</body>

</html>
