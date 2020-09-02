
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  if(session.getAttribute("user")==null){
    response.sendRedirect("login.jsp");
  }



%>

<!DOCTYPE html>
<%

  String Address = request.getParameter("Address");
  session.setAttribute("ADDRESS", Address);

  String driverName = "com.mysql.jdbc.Driver";
  String connectionUrl = "jdbc:mysql://localhost:3306/";
  String dbName = "flight_booking_service";
  String userId = "root";
  String password = "";

  try {
    Class.forName(driverName);
  } catch (ClassNotFoundException e) {
    e.printStackTrace();
  }

  Connection connection = null;
  Statement statement = null;
  ResultSet resultSet = null;
%>
<html>

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



    #book-title{
      background:linear-gradient(
              25deg,
              #2e3535,
              #28c9a1
      );
      font-weight: bold;

      font-family: Avantgarde, TeX Gyre Adventor, URW Gothic L, sans-serif;
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }


    .panel-title {display: inline;font-weight: bold;}
    .checkbox.pull-right { margin: 0; }
    .pl-ziro { padding-left: 0px; }




    .modal {
      display: none; /* Hidden by default */
      position: fixed; /* Stay in place */
      z-index: 1; /* Sit on top */
      left: 0;
      top: 0;
      width: 100%; /* Full width */
      height: 100%; /* Full height */
      overflow: auto; /* Enable scroll if needed */
      background-color: rgb(0,0,0); /* Fallback color */
      background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content/Box */
    .modal-content {
      background-color: #fefefe;
      margin: 15% auto; /* 15% from the top and centered */
      padding: 20px;
      border: 1px solid #888;
      width: 45%; /* Could be more or less, depending on screen size */
    }

    /* The Close Button */
    .close {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }

    .close:hover,
    .close:focus {
      color: black;
      text-decoration: none;
      cursor: pointer;
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
        <div class="email"> <% String email=(String)session.getAttribute("email");  out.print(email);%> </div>
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
    <form action="Payment-Insert.jsp" method="post">



      <!--Payment-->

      <div class="row">
        <div class="col-xs-12 col-md-4">

          <ul class="nav nav-pills nav-stacked">
            <li  class="active"><a href="#">
              <span class="badge pull-right">

                <%

                  // String check_seat = request.getParameter("my-seat");

                  String check_seat=(String)session.getAttribute("My_seat");
                  String check_price=(String)session.getAttribute("Price");


                  int price = Integer.parseInt(check_price);
                  int seat = Integer.parseInt(check_seat);

                  int result = price*seat;
                 String total= Integer.toString(result);

                  out.print(result);



                %></span> Final Payment</a>
            </li>
          </ul>

<input name="id" value="<%=session.getAttribute("Book_id")
%>" hidden>
<input name="curr-price" value="<%=result %>" hidden>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title">
                Payment Details
              </h3>

            </div>
            <div class="panel-body">

                <div class="form-group">
                  <label for="cardNumber">
                    CARD NUMBER</label>
                  <div class="input-group">
                    <input type="number" class="form-control" name="Cardno" id="cardNumber" placeholder="Valid Card Number"
                           required autofocus />
                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                  </div>
                </div>
                <div class="row">
                  <div class="col-xs-7 col-md-7">  <label for="expityMonth">
                    EXPIRY DATE</label>
                    <div class="form-group">

                      <div class="col-xs-6 col-lg-6 pl-ziro">
                        <input name="ExpiryDate" type="text" class="form-control" id="expityMonth" placeholder="MM" required />
                      </div>
                      <div class="col-xs-6 col-lg-6 pl-ziro">
                        <input name="ExpiryMonth" type="text" class="form-control" id="expityYear" placeholder="YY" required /></div>
                    </div>
                  </div>
                  <div class="col-xs-5 col-md-5 pull-right">
                    <div class="form-group">
                      <label for="cvCode">
                        CV CODE</label>
                      <input type="password" name="CVV" class="form-control" id="cvCode" placeholder="CV" required />
                    </div>
                  </div>
                </div>

            </div>


            <div  class="btn bg-teal btn-block waves-effect">
              <i class="fa fa-check-circle-o" aria-hidden="true"></i>
              <input type="submit"  id="Pay" name="Pay" class="btn bg-teal  waves-effect" value="Pay" />


            </div>

          </div>






          <br/>




        </div>

        <div class="col-xs-12 col-md-8">
          <div class="panel panel-default">
            <div class="panel-heading">
              <div class="header">
                <h2 >
                  Booking By:
                </h2>

              </div>
              <br>
              <!-- Badges -->

              <div class="card">

                <div class="body">
                  <ul class="list-group">
                    <li class="list-group-item"><%=  session.getAttribute("fullname") %> <span class="badge bg-pink">Name</span></li>
                    <li class="list-group-item"><%=session.getAttribute("bemail") %> <span class="badge bg-cyan">Email</span></li>
                    <li class="list-group-item"><%=session.getAttribute("bphone") %><span class="badge bg-teal">Landline</span></li>
                    <li class="list-group-item"><%=session.getAttribute("bmobile") %> <span class="badge bg-orange">Mobile</span></li>
                    <li class="list-group-item"><%=session.getAttribute("My_seat") %> <span class="badge bg-purple">Seats</span></li>
                  </ul>
                </div>
              </div>

              <!-- #END# Badges -->



            </div>
          </div>
        </div>
      </div>



      <!--User Info-->






      <!--User INFO End-->

    <!--Payment-->


    <!-- #END# Location -->
  </form>
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
