<%--
  Created by IntelliJ IDEA.
  User: MAHNOOR
  Date: 8/27/2020
  Time: 9:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--Closing Session Deleting Cache History--%>

<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);




%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <title>Welcome To | Flight Booking Service Dashboard</title>
  <!-- Favicon-->
  <link rel="icon" href="favicon.ico" type="image/x-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

  <!-- Bootstrap Core Css -->
  <link href="Dashboard/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

  <!-- Waves Effect Css -->
  <link href="Dashboard/plugins/node-waves/waves.css" rel="stylesheet" />

  <!-- Animation Css -->
  <link href="Dashboard/plugins/animate-css/animate.css" rel="stylesheet" />

  <!-- Morris Chart Css-->
  <link href="Dashboard/plugins/morrisjs/morris.css" rel="stylesheet" />

  <!-- Custom Css -->
  <link href="Dashboard/css/style.css" rel="stylesheet">

  <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
  <link href="Dashboard/css/themes/all-themes.css" rel="stylesheet" />

  <style>#search-pages{
    display: "none";
  }
  #myUL {
    /* Remove default list styling */
    list-style-type: none;
    padding: 0;
    margin: 0;
    margin-top: 80px;

  }

  #myUL li a {

    border: 1px solid #ddd; /* Add a border to all links */
    margin-top: -1px; /* Prevent double borders */
    background-color: #f6f6f6; /* Grey background color */
    padding: 12px; /* Add some padding */
    text-decoration: none; /* Remove default text underline */
    font-size: 18px; /* Increase the font-size */
    color: black; /* Add a black text color */
    display: block; /* Make it into a block element to fill the whole list */
  }

  #myUL li a:hover:not(.header) {

    background-color: #eee; /* Add a hover effect to all links, except for headers */
  }
  </style>
</head>

<body class="theme-red">


<!-- Page Loader -->
<div class="page-loader-wrapper">
  <div class="loader">
    <div class="preloader">
      <div class="spinner-layer pl-black">
        <div class="circle-clipper left">
          <div class="circle"></div>
        </div>
        <div class="circle-clipper right">
          <div class="circle"></div>
        </div>
      </div>
    </div>
    <p>Please wait...</p>
  </div>
</div>



</div>
<!-- #END# Search Bar -->
<!-- Top Bar -->
<nav style="background-color: black;" class="navbar">
  <div class="container-fluid">
    <div class="navbar-header">
      <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false"></a>
      <a href="javascript:void(0);" class="bars"></a>
      <a class="navbar-brand" href="AdminDashboard.jsp">ADMIN</a>
    </div>

  </div>
</nav>
<!-- #Top Bar -->
<section>
  <!-- Left Sidebar -->
  <aside id="leftsidebar" class="sidebar">
    <!-- User Info -->
    <div class="user-info">
      <div class="image">
        <img src="Dashboard/images/user.png" width="48" height="48" alt="User" />
      </div>
      <div class="info-container">
        <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Admin</div>
        <div class="email"><% String email=(String)session.getAttribute("email");

            out.print(email);
          %>
          </div>
        <div class="btn-group user-helper-dropdown">
          <i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
          <ul class="dropdown-menu pull-right">
            <li><a href="#"><i class="material-icons">person</i>Profile</a></li>

            <li role="separator" class="divider"></li>
            <li><a href="/LogoutServlet"><i class="material-icons">input</i>Sign Out</a></li>
          </ul>
        </div>
      </div>
    </div>
    <!-- #User Info -->
    <!-- Menu -->
    <div class="menu">
      <ul class="list">
        <li class="header">Flight Navigation</li>
        <li>
          <a href="AdminDashBoard.jsp">
            <i class="fa fa-home col-light-blue " style="font-size: 25px;" aria-hidden="true"></i>
            <span>Home</span>
          </a>
        </li>
        <li>
          <a href="AddFlight.jsp">
            <i class="fa fa-plus col-light-blue " style="font-size: 25px;" aria-hidden="true"></i>
            <span>Add Flight</span>
          </a>
        </li>
        <li>
          <a href="ViewFlights.jsp">
            <i class="fa fa-eye col-light-blue " style="font-size: 25px;" aria-hidden="true"></i>
            <span>View Flights</span>
          </a>
        </li>

        <li>
          <a href="ViewFlights.jsp">
            <i class="fa fa-pencil col-light-blue " style="font-size: 25px;" aria-hidden="true"></i>
            <span>Edit Flight</span>
          </a>
        </li>

        <li>
          <a href="ViewFlights.jsp">
            <i class="fa fa-trash-o col-light-blue " style="font-size: 25px;" aria-hidden="true"></i>

            <span>Delete Flight</span>
          </a>
        </li>



      </ul>
    </div>
    <!-- #Menu -->
    <!-- Footer -->
    <div class="legal">
      <div class="copyright">
        &copy;<a href="javascript:void(0);">Admin - Flight Booking Service</a>.
      </div>
      <div class="version">
        <b>2020 </b>
      </div>
    </div>
    <!-- #Footer -->
  </aside>
  <!-- #END# Left Sidebar -->
  <!-- Right Sidebar -->

  <!-- #END# Right Sidebar -->
</section>

<section class="content">
  <div class="container-fluid">
    <div class="block-header">
      <h2>DASHBOARD</h2>
    </div>

    <!-- Widgets -->
    <div class="row clearfix">
      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="info-box bg-pink hover-expand-effect">
          <div class="icon">
            <i class="material-icons">playlist_add_check</i>
          </div>
          <div class="content">
            <div class="text">NEW Reports </div>
            <div class="number count-to" data-from="0" data-to="125" data-speed="15" data-fresh-interval="20"></div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="info-box bg-cyan hover-expand-effect">
          <div class="icon">
            <i class="material-icons">help</i>
          </div>
          <div class="content">
            <div class="text">NEW Bookings</div>
            <div class="number count-to" data-from="0" data-to="257" data-speed="1000" data-fresh-interval="20"></div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="info-box bg-light-green hover-expand-effect">
          <div class="icon">
            <i class="material-icons">forum</i>
          </div>
          <div class="content">
            <div class="text">NEW Messages</div>
            <div class="number count-to" data-from="0" data-to="243" data-speed="1000" data-fresh-interval="20"></div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="info-box bg-orange hover-expand-effect">
          <div class="icon">
            <i class="material-icons">person_add</i>
          </div>
          <div class="content">
            <div class="text">NEW VISITORS</div>
            <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"></div>
          </div>
        </div>
      </div>
    </div>
    <!-- #END# Widgets -->
    <!-- CPU Usage -->
    <div class="row clearfix">
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="card">
          <div class="header">
            <div class="row clearfix">
              <div class="col-xs-12 col-sm-6">
                <h2>CPU USAGE (%)</h2>
              </div>
              <div class="col-xs-12 col-sm-6 align-right">
                <div class="switch panel-switch-btn">
                  <span class="m-r-10 font-12">REAL TIME</span>
                  <label>OFF<input type="checkbox" id="realtime" checked><span class="lever switch-col-cyan"></span>ON</label>
                </div>
              </div>
            </div>
            <ul class="header-dropdown m-r--5">
              <li class="dropdown">
                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                  <i class="material-icons">more_vert</i>
                </a>
                <ul class="dropdown-menu pull-right">
                  <li><a href="javascript:void(0);">Action</a></li>
                  <li><a href="javascript:void(0);">Another action</a></li>
                  <li><a href="javascript:void(0);">Something else here</a></li>
                </ul>
              </li>
            </ul>
          </div>
          <div class="body">
            <div id="real_time_chart" class="dashboard-flot-chart"></div>
          </div>
        </div>
      </div>
    </div>
    <!-- #END# CPU Usage -->

    <!-- #END# Browser Usage -->
  </div>
  </div>
</section>






<!-- Jquery Core Js -->
<script src="Dashboard/js/jquery-3.5.1.min.js"></script>
<script src="Dashboard/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap Core Js -->
<script src="Dashboard/plugins/bootstrap/js/bootstrap.js"></script>

<!-- Select Plugin Js -->
<script src="Dashboard/plugins/bootstrap-select/js/bootstrap-select.js"></script>

<!-- Slimscroll Plugin Js -->
<script src="Dashboard/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

<!-- Waves Effect Plugin Js -->
<script src="Dashboard/plugins/node-waves/waves.js"></script>

<!-- Jquery CountTo Plugin Js -->
<script src="Dashboard/plugins/jquery-countto/jquery.countTo.js"></script>

<!-- Morris Plugin Js -->
<script src="Dashboard/plugins/raphael/raphael.min.js"></script>
<script src="Dashboard/plugins/morrisjs/morris.js"></script>

<!-- ChartJs -->
<script src="Dashboard/plugins/chartjs/Chart.bundle.js"></script>
<script src="https://kit.fontawesome.com/d0caab7068.js" crossorigin="anonymous"></script>

<!-- Flot Charts Plugin Js -->
<script src="Dashboard/plugins/flot-charts/jquery.flot.js"></script>
<script src="Dashboard/plugins/flot-charts/jquery.flot.resize.js"></script>
<script src="Dashboard/plugins/flot-charts/jquery.flot.pie.js"></script>
<script src="Dashboard/plugins/flot-charts/jquery.flot.categories.js"></script>
<script src="Dashboard/plugins/flot-charts/jquery.flot.time.js"></script>

<!-- Sparkline Chart Plugin Js -->
<script src="Dashboard/plugins/jquery-sparkline/jquery.sparkline.js"></script>

<!-- Custom Js -->
<script src="Dashboard/js/admin.js"></script>
<script src="Dashboard/js/pages/index.js"></script>

<!-- Demo Js -->
<script src="Dashboard/js/demo.js"></script>
</body>

</html>

