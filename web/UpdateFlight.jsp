<%--
  Created by IntelliJ IDEA.
  User: MAHNOOR
  Date: 8/28/2020
  Time: 1:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%--Closing Session Deleting Cache History--%>


<%

  String id = request.getParameter("id");

  String driver = "com.mysql.jdbc.Driver";
  String connectionUrl = "jdbc:mysql://localhost:3306/";
  String database = "flight_booking_service";
  String userid = "root";
  String password = "";
  try {
    Class.forName(driver);
  } catch (ClassNotFoundException e) {
    e.printStackTrace();
  }
  Connection connection = null;
  Statement statement = null;
  ResultSet resultSet = null;
%>

<%
  try{
    connection = DriverManager.getConnection(connectionUrl+database, userid, password);
    statement=connection.createStatement();
    String sql ="select * from flight_details where id="+id;
    resultSet = statement.executeQuery(sql);
    while(resultSet.next()){
%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <title>Welcome To | Bootstrap Based Admin Template - Material Design</title>
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
    #search-pages{
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
      <div class="spinner-layer pl-red">
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
        <div class="email">

          <% String email=(String)session.getAttribute("email");

            out.print(email);
          %>

        </div>
        <div class="btn-group user-helper-dropdown">
          <i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
          <ul class="dropdown-menu pull-right">
            <li><a href="javascript:void(0);"><i class="material-icons">person</i>Profile</a></li>

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
          <a href="AdminDashboard.jsp">
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
      <h2>Update Flight</h2>
    </div>

    <!--Form Start-->

    <form action="Flight-Update.jsp" method="post">



      <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
          <div class="card">
            <div class="header"> <h2>Enter Flight Data here..</h2> </div>
            <div class="body">
              <input  type="hidden" name="id" value="<%=resultSet.getInt("id") %>">

              <div class="row clearfix">
                <div class="col-md-4">
                  <div class="input-group">
                                        <span class="input-group-addon">
                                            Flight No:
                                        </span>
                    <div class="form-line">

                      <input value="<%=resultSet.getString("flight_no") %>" type="number" name="flightno" class="form-control number" placeholder="Enter Flight No." required>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="input-group"><span class="input-group-addon">
                                       Flight Name:
                                        </span>
                    <div class="form-line">
                      <input type="text" value="<%=resultSet.getString("flight_name") %>" name="flightname" class="form-control text" placeholder="Enter Flight Name" required>
                    </div>

                  </div>
                </div>
                <div class="col-md-4">
                  <div class="input-group">
                                        <span class="input-group-addon">
                                            Departure From:
                                        </span>
                    <div class="form-line">
                      <input type="text" value="<%=resultSet.getString("dep_from") %>"  name="depFrom" class="form-control text" placeholder="Enter Departure City" required>
                    </div>

                  </div>
                </div>

                <div class="col-md-4">
                  <div class="input-group">
                                        <span class="input-group-addon">
                                            Arrive At:
                                        </span>
                    <div class="form-line">
                      <input type="text" value="<%=resultSet.getString("arr_at") %>" name="arrAt" class="form-control text" placeholder="Enter Arrival City" required>
                    </div>

                  </div>
                </div>


                <div class="col-md-4">
                  <div class="input-group">
                                        <span class="input-group-addon">
                                            Departure Time:
                                        </span>
                    <div class="form-line">
                      <input type="text" value="<%=resultSet.getString("dep_time") %>"  name="depTime" class="form-control time12" placeholder="Ex: 11:59 pm" required>
                    </div>

                  </div>
                </div>


                <div class="col-md-4">
                  <div class="input-group">
                                        <span class="input-group-addon">
                                            Arrival Time:
                                        </span>
                    <div class="form-line">
                      <input type="text" value="<%=resultSet.getString("arr_time") %>"  name="arrTime" class="form-control time12" placeholder="Ex: 1:00 am" required>
                    </div>

                  </div>
                </div>


                <div class="col-md-4">
                  <div class="input-group">
                                        <span class="input-group-addon">
                                            Date:
                                        </span>
                    <div class="form-line">
                      <input type="text" value="<%=resultSet.getString("date") %>"  name="Date" class="form-control datetime" placeholder="Ex: 30/07/2016" required>
                    </div>

                  </div>
                </div>

                <div class="col-md-4">
                  <div class="input-group">
                                        <span class="input-group-addon">
                                            Total Seats (Custom):
                                        </span>
                    <div class="form-line">
                      <input type="number" value="<%=resultSet.getInt("total_seats") %>" name="Customseats" class="form-control number" placeholder="Total Seats Ex: 80 ." required>
                    </div>

                  </div>
                </div>


                <div class="col-md-4">
                  <div class="input-group">
                                        <span class="input-group-addon">
                                            Ticket Price:
                                        </span>
                    <div class="form-line">
                      <input type="text" value="<%=resultSet.getInt("ticket_price") %>"  name="Ticketprice" class="form-control" placeholder="Enter Price" required>
                    </div>

                  </div>
                </div>


                <div class="col-md-4">
                  <div class="input-group">
                                        <span class="input-group-addon">
                                            Booking:
                                        </span>
                    <div class="demo-switch">
                      <div class="switch">
                        <label> <b>OnGoing</b><input value="<%=resultSet.getString("booking_status") %>"  name="BookingStatus" type="checkbox" ><span class="lever switch-col-pink"></span> <b>Closed</b> </label>
                      </div>

                    </div>

                  </div>
                </div>



              </div>

              <!--Selects-->

              <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <div class="card">
                    <div class="header"> <h2>Selects Options here..</h2> </div>

                    <div class="body">
                      <div class="row clearfix">



                        <div class="col-md-12">
                          <p>
                            <b>Flight Type:</b>
                          </p>
                          <select name="Flighttype" class="form-control show-tick" data-live-search="true" required>
                            <option selected >Choose Type..</option>
                            <option    <%=(resultSet.getString("flight_type").equals("Sports")?"selected='selected'":"") %>>Economy</option>
                            <option value="Business">Business</option>
                            <option value="First Class">First Class</option>
                          </select>

                        </div>



                      </div>
                    </div>

                  </div>
                </div>
              </div>

              <!--Select End-->


              <div class="row clearfix">
                <div class="header"> <h2>Enter Airport Details here..</h2> </div>

                <div class="col-md-4">
                  <div class="input-group">
                    <span class="input-group-addon">Airport Name</span>
                    <div class="form-line">
                      <input type="text" value="<%=resultSet.getString("airport_name") %>"  name="AirportName" class="form-control" placeholder="Enter Airport Name" required>
                    </div>
                  </div>
                </div>



                <div class="col-md-4">
                  <div class="input-group">
                    <span class="input-group-addon">Airport@example.com</span>
                    <div class="form-line">
                      <input type="text" value="<%=resultSet.getString("airport_email") %>"  name="AirportEmail" class="form-control" placeholder=" Enter Airport Address">
                    </div>

                  </div>
                </div>

                <div class="col-md-4">
                  <div class="input-group">
                    <span class="input-group-addon">Phone No.</span>
                    <div class="form-line">
                      <input type="text" value="<%=resultSet.getString("airport_no") %>" name="AirportNo" class="form-control date" placeholder="Enter Phone N0.">
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
                        <input  style="font-size: 25px;"  type="submit" class="btn bg-pink btn-block waves-effect" value="Update Flight" />
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!--End Details-->


            </div>
          </div>
        </div>
      </div>

    </form>
    <!--Form End-->

    <%
        }
        connection.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    %>

    <!-- #END# Widgets -->

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
