<!DOCTYPE html>
<html>
<%
  String id = request.getParameter("id");

  String Total_Seats=request.getParameter("total_seats");

  String price = request.getParameter("ticket_price");

  String Booking_Status=request.getParameter("booking_status");

  session.getAttribute("Address");


%>
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  if(session.getAttribute("user")==null){
    response.sendRedirect("login.jsp");
  }



%>

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <title>Welcome To | Flight Booking Service</title>
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

  <style>


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
      <a class="navbar-brand" href="UserDashboard.jsp">User</a>
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
        <img src="Images/users.png" width="48" height="48" alt="User" />
      </div>
      <div class="info-container">
        <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">User</div>
        <div class="email"> <% String email=(String)session.getAttribute("email");
        out.print(email);
        %> </div>
        <div class="btn-group user-helper-dropdown">
          <i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
          <ul class="dropdown-menu pull-right">
            <li><a href="javascript:void(0);"><i class="material-icons">person</i>Profile</a></li>

            <li role="separator" class="divider"></li>
            <li><a href="javascript:void(0);"><i class="material-icons">input</i>Sign Out</a></li>
          </ul>
        </div>
      </div>
    </div>
    <!-- #User Info -->
    <!-- Menu -->
    <div class="menu">
      <ul class="list">
        <li class="header">User Navigation</li>
        <li>
          <a href="UserDashboard.jsp">
            <i class="fa fa-home col-light-green " style="font-size: 25px;" aria-hidden="true"></i>
            <span>Home</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="fa fa-fighter-jet col-light-green " style="font-size: 25px;" aria-hidden="true"></i>
            <span>Bookings</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="fas fa-shopping-cart col-light-green " style="font-size: 25px;" aria-hidden="true"></i>
            <span>Payment Details</span>
          </a>
        </li>     <li>
        <a href="#">
          <i class="fas fa-money-bill-alt col-light-green " style="font-size: 25px;" aria-hidden="true"></i>
          <span>Currency Convert</span>
        </a>
      </li> <li>
        <a href="#">
          <i class="fas fa-receipt col-light-green " style="font-size: 25px;" aria-hidden="true"></i>
          <span>View Reciepts</span>
        </a>
      </li> <li>
        <a href="directionspanel.jsp">
          <i class="fas fa-route col-light-green " style="font-size: 25px;" aria-hidden="true"></i>
          <span>Direction Panel</span>
        </a>
      </li>







      </ul>
    </div>
    <!-- #Menu -->
    <!-- Footer -->
    <div class="legal">
      <div class="copyright">
        &copy;<a href="#">User - Flight Booking Service</a>.
      </div>
      <div class="version">
        <b>2020 </b>
      </div>
    </div>
    <!-- #Footer -->
  </aside>
  <!-- #END# Left Sidebar -->

</section>

<section class="content">
  <div class="container-fluid">
    <div class="block-header">
      <h2>DASHBOARD</h2>
    </div>


    <!--Form Start-->

    <form action="Booking-Insert.jsp" method="post">



      <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
          <div class="card">
            <div class="header"> <h2>Enter your Data here..</h2> </div>
            <div class="body">

              <div class="row clearfix">
                <div class="col-md-4">
                  <div class="input-group">
                                    <span class="input-group-addon">
                                         Full Name:
                                    </span>
                    <div class="form-line">

                      <input type="text" name="Bname" class="form-control number" placeholder="Enter Your Full Name." required>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="input-group"><span class="input-group-addon">
                                   Email:
                                    </span>
                    <div class="form-line">
                      <input type="text"  name="Bemail" class="form-control text" placeholder="Enter Your Email Address " required>
                    </div>

                  </div>
                </div>
                <div class="col-md-4">
                  <div class="input-group">
                                    <span class="input-group-addon">
                                        Current Phone no. (Landline) :
                                    </span>
                    <div class="form-line">
                      <input type="text"  name="Bphone" class="form-control text" placeholder="Enter Landline Number">
                    </div>

                  </div>
                </div>

                <div class="col-md-4">
                  <div class="input-group">
                                    <span class="input-group-addon">
                                        Mobile no. (Current):
                                    </span>
                    <div class="form-line">
                      <input type="text"  name="Bmobile" class="form-control text" placeholder="Enter Mobile Number">
                    </div>

                  </div>
                </div>


                <div class="col-md-4">
                  <div class="input-group">
                                    <span class="input-group-addon">
                                        No. OF Seats:
                                    </span>
                    <div class="form-line">
                      <input type="number"  name="Bseats" class="form-control time12" placeholder="Ex: 2">
                    </div>

                  </div>
                </div>











              </div>


              <br>
              <br>


              <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <div class="card">

                    <div class="body">
                      <div class="button-demo">


                          <input type="submit"  style="font-size: 25px;"  class="btn bg-teal btn-block waves-effect" value="Book Flight" />

                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!--End Details-->
<input name="id" value="<%=id%>" hidden >
              <input name="seat" value="<%=Total_Seats%>" hidden >
              <input name="bookingStatus" value="<%=Booking_Status%>" hidden>
              <input name="price" value="<%=price%>" hidden> <input name="Address" value="<%out.print(session.getAttribute("Address"));%>" hidden>

            </div>
          </div>
        </div>
      </div>
    </form>
    <!--Form End-->




  </div>
  </div>
  <!-- #END# Location -->

  <!-- #END# Browser Usage -->
  </div>
  </div>
</section>



<!-- Jquery Core Js -->
<script src="Dashboard/js/jquery-3.5.1.min.js"></script>
<script src="Dashboard/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap Core Js -->
<script src="Dashboard/plugins/bootstrap/js/bootstrap.js"></script>


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
