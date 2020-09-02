<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="javax.mail.Session" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="javax.xml.bind.DatatypeConverter" %>


<%--Closing Session Deleting Cache History--%>
<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  if(session.getAttribute("user")==null){
    response.sendRedirect("login.jsp");
  }



%>

<%

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
  <link rel="icon" href="../../favicon.ico" type="image/x-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

  <!-- Bootstrap Core Css -->
  <link href="Dashboard/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

  <!-- Waves Effect Css -->
  <link href="Dashboard/plugins/node-waves/waves.css" rel="stylesheet" />

  <!-- Animation Css -->
  <link href="Dashboard/plugins/animate-css/animate.css" rel="stylesheet" />

  <!-- JQuery DataTable Css -->
  <link href="Dashboard/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">

  <!-- Custom Css -->
  <link href="Dashboard/css/style.css" rel="stylesheet">

  <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
  <link href="Dashboard/css/themes/all-themes.css" rel="stylesheet" />

  <style>



    #book-title{
      background:linear-gradient(
              45deg,
              #757a7a,
              #0fc99a
      );
      font-weight: bold;

      font-family: Avantgarde, TeX Gyre Adventor, URW Gothic L, sans-serif;
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
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
        <div class="email">  <% String email=(String)session.getAttribute("email");

          out.print(email);
        %> </div>
        <div class="btn-group user-helper-dropdown">
          <i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
          <ul class="dropdown-menu pull-right">
            <li><a href="javascript:void(0);"><i class="material-icons">person</i>Profile</a></li>

            <li role="separator" class="divider"></li>
            <li><a href="LogoutServlet"><i class="material-icons">input</i>Sign Out</a></li>
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
          <span>View Direction</span>
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

  <%
    String city = request.getParameter("City");

    out.print(city);

    session.setAttribute("City",city);

    String Address = request.getParameter("ADDRESS");
    out.print(Address);

    session.setAttribute("Address",Address);
  %>



<section class="content">
  <div class="container-fluid">
    <div class="block-header">
      <h2>DASHBOARD</h2>
    </div>
    <!-- Exportable Table -->

    <form>
      <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
          <div class="card">
            <div class="header">
              <h2 id="book-title">
                Neartest
                <%    out.print(Address);

                %>
                Flights
              </h2>

            </div>
            <div class="body">
              <div class="table-responsive">
                <table class="table table-bordered table-striped table-hover dataTable js-exportable">
                  <thead>
                  <tr>
                    <th><b>Flight ID</b></th>
                    <th>Flight No.</th>
                    <th>Flight Name</th>
                    <th>Departure From</th>
                    <th>Arrival At</th>
                    <th>Departure Time</th>
                    <th>Arrival Time</th>
                    <th>Flight Date</th>
                    <th>Total Seats</th>
                    <th>Ticket Price</th>
                    <th>Booking Status</th>
                    <th>Flight Type</th>
                    <th>Airport Name</th>
                    <th>Arrival Email</th>
                    <th>Arrival No.</th>
                    <th>Book Flight</th>
                  </tr>
                  </thead>
                  <tfoot>
                  <tr>
                    <th><b>Flight ID</b></th>
                    <th>Flight No.</th>
                    <th>Flight Name</th>
                    <th>Departure From</th>
                    <th>Arrival At</th>
                    <th>Departure Time</th>
                    <th>Arrival Time</th>
                    <th>Flight Date</th>
                    <th>Total Seats</th>
                    <th>Ticket Price</th>
                    <th>Booking Status</th>
                    <th>Flight Type</th>
                    <th>Airport Name</th>
                    <th>Arrival Email</th>
                    <th>Arrival No.</th>
                    <th>Book Flight</th>
                  </tr>
                  </tfoot>

                  <%


                    try{
                      connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                      statement=connection.createStatement();
                      String sql ="SELECT * FROM flight_details where dep_from = '"+city+"' OR  arr_at = '"+city+"' ";
                      resultSet = statement.executeQuery(sql);
                      while(resultSet.next()){



                  %>


                  <tbody>
                  <tr>
                    <td><%=resultSet.getInt("id") %></td>
                    <td><%=resultSet.getString("flight_no") %></td>
                    <td><%=resultSet.getString("flight_name") %></td>
                    <td><%=resultSet.getString("dep_from") %></td>
                    <td><%=resultSet.getString("arr_at") %></td>
                    <td><%=resultSet.getString("dep_time") %></td>
                    <td><%=resultSet.getString("arr_time") %></td>
                    <td><%=resultSet.getString("date") %></td>
                    <td><%=resultSet.getInt("total_seats") %> </td>
                    <td><%=resultSet.getInt("ticket_price") %> </td>
                    <td><%=resultSet.getString("booking_status") %> </td>
                    <td><%=resultSet.getString("flight_type") %></td>
                    <td><%=resultSet.getString("airport_name") %></td>
                    <td><%=resultSet.getString("airport_email") %></td>
                    <td><%=resultSet.getString("airport_no") %></td>
                    <td><a href="BookFlights.jsp?id=<%=resultSet.getInt("id")%>&total_seats=<%=resultSet.getInt("total_seats") %>&ticket_price=<%=resultSet.getInt("ticket_price") %>&booking_status=<%=resultSet.getString("booking_status") %>" class="btn bg-teal waves-effect">   <i class="fa fa-address-book" aria-hidden="true"></i>
                      Click to book! </a></td>



                  </tr>
                  <%
                      }

                    } catch (Exception e) {
                      e.printStackTrace();
                    }
                  %>

                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>



    </form>
    <!-- #END# Exportable Table -->




    <!-- #END# Browser Usage -->
  </div>

</section>

<script src="https://kit.fontawesome.com/d0caab7068.js" crossorigin="anonymous"></script>



<!-- Jquery Core Js -->
<script src="Dashboard/plugins/jquery/jquery.min.js"></script>

<!-- Bootstrap Core Js -->
<script src="Dashboard/plugins/bootstrap/js/bootstrap.js"></script>

<!-- Select Plugin Js -->
<script src="Dashboard/plugins/bootstrap-select/js/bootstrap-select.js"></script>

<!-- Slimscroll Plugin Js -->
<script src="Dashboard/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

<!-- Waves Effect Plugin Js -->
<script src="Dashboard/plugins/node-waves/waves.js"></script>

<!-- Jquery DataTable Plugin Js -->
<script src="Dashboard/plugins/jquery-datatable/jquery.dataTables.js"></script>
<script src="Dashboard/plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
<script src="Dashboard/plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
<script src="Dashboard/plugins/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
<script src=".Dashboard/plugins/jquery-datatable/extensions/export/jszip.min.js"></script>
<script src="Dashboard/plugins/jquery-datatable/extensions/export/pdfmake.min.js"></script>
<script src="Dashboard/plugins/jquery-datatable/extensions/export/vfs_fonts.js"></script>
<script src="Dashboard/plugins/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
<script src="Dashboard/plugins/jquery-datatable/extensions/export/buttons.print.min.js"></script>

<!-- Custom Js -->
<script src="Dashboard/js/admin.js"></script>
<script src="Dashboard/js/pages/tables/jquery-datatable.js"></script>

<!-- Demo Js -->
<script src="Dashboard/js/demo.js"></script>
</body>

</html>
