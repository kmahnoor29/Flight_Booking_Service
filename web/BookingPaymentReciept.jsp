<%@ page import="java.util.Date" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.BufferedReader" %>
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
  session.getAttribute("ADDRESS");
%>
<!DOCTYPE html>
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

    .invoice-title h2, .invoice-title h3 {
      display: inline-block;
    }

    .table > tbody > tr > .no-line {
      border-top: none;
    }

    .table > thead > tr > .no-line {
      border-bottom: none;
    }

    .table > tbody > tr > .thick-line {
      border-top: 2px solid;
    }


    #map {
      height: 80%;
      width: 750px;
      position: fixed;
    }

    #description {
      font-family: Roboto;
      font-size: 15px;
      font-weight: 300;
    }
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

    #infowindow-content .title {
      font-weight: bold;
    }

    #infowindow-content {
      display: none;
    }

    #map #infowindow-content {
      display: inline;
    }

    .pac-card {
      margin: 10px 10px 0 0;
      border-radius: 2px 0 0 2px;
      box-sizing: border-box;
      -moz-box-sizing: border-box;
      outline: none;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
      background-color: #fff;
      font-family: Roboto;
    }

    #pac-container {
      padding-bottom: 12px;
      margin-right: 12px;
    }

    .pac-controls {
      display: inline-block;
      padding: 5px 11px;
    }

    .pac-controls label {
      font-family: Roboto;
      font-size: 13px;
      font-weight: 300;
    }

    #pac-input {
      background-color: #fff;
      font-family: Roboto;
      font-size: 15px;
      font-weight: 300;
      margin-left: 12px;
      padding: 0 11px 0 13px;
      text-overflow: ellipsis;
      width: 400px;
    }

    #pac-input:focus {
      border-color: #4d90fe;
    }

    #title {
      color: #fff;
      background-color: #4d90fe;
      font-size: 25px;
      font-weight: 500;
      padding: 6px 12px;
    }

    #target {
      width: 345px;
    }
    .side{

      margin-top: 70px;
    }


    #full-ad{
      list-style: none;

    }


    #Li{


      font-weight: bold;

      font-family: Avantgarde, TeX Gyre Adventor, URW Gothic L, sans-serif;
    }

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
          <span>Direction PAnel</span>
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
    <h2 id="book-title">
      Flights
      <%
        out.print(session.getAttribute("Address"));

      %>

    </h2>
    <form method="post" action="/CurrencyServlet">
      <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
          <div class="card">
            <div class="header"> <h2> Currency Converter..</h2> </div>
            <div class="body">

              <div class="row clearfix">

                <div class="col-md-4">
                  <div class="input-group">
                                        <span class="input-group-addon">
                                            Amount:
                                        </span>
                    <div class="form-line">
                      <%
                        String check_seat=(String)session.getAttribute("My_seat");
                        String check_price=(String)session.getAttribute("Price");


                        int price = Integer.parseInt(check_price);
                        int seat = Integer.parseInt(check_seat);

                        int result = price*seat;
                        String total= Integer.toString(result);


                      %>
                      <input type="number" value="<%
                   out.print(result);
                  %>" name="Total_PRice" class="form-control number" placeholder="Enter Price." readonly required>
                    </div>
                  </div>
                </div>



                </div>



              </div>
            </div>
          </div>
        </div>


      <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
          <div class="card">
            <div class="header"> <h2>Selects Options here..</h2> </div>

            <div class="body">
              <div class="row clearfix">
                <div class="col-md-6">
                  <p>
                    <b>Current Unit:</b>
                  </p>


                  <select name='Curr'  id="Curr" class="form-control show-tick" data-live-search="true" required>

                    <option>Choose To.. </option>
                    <option value="AED">UAE Dirham </option>
                    <option value="ARS">Argentine Peso</option>
                    <option value="AUD">Australian Dollar</option>
                    <option value="BGN">Bulgarian Lev</option>
                    <option value="BRL">Brazilian Real</option>
                    <option value="BWP">Botswana Pula</option>
                    <option value="CAD">Canadian Dollar</option>
                    <option value="CAD">Canadian Dollar</option>
                    <option value="CHF" >Swiss Franc</option>
                    <option value="CLP" >Chilean Peso</option>
                    <option value="CNY">Chinese Yuan</option>
                    <option  value="COP">Colombian Peso</option>
                    <option value="DKK">Danish Krone</option>
                    <option value="EEK" >Estonian Kroon</option>
                    <option value="EGP">Egypt Pounds</option>
                    <option value="EUR">Euro</option>
                    <option value="GBP">British pound</option>
                    <option value="HKD">Hong Kong Dollar</option>
                    <option value="HRK">Croatian Kuna</option>
                    <option value="HUF">Hungarian Forint</option>
                    <option value="ILS">Israeli New Shekel</option>
                    <option value="INR">Indian Rupee</option>
                    <option value="ISK">Iceland Krona</option>
                    <option value="JPY">Japanese Yen</option>
                    <option value="KRW">South Korean Won</option>
                    <option value="KZT">Kazakhstani Tenge</option>
                    <option value="LKR">Sri Lanka Rupee</option>
                    <option value="LTL">Lithuanian Litas</option>
                    <option value="LVL">Latvian Lat</option>
                    <option value="LYD">Libyan Dinar</option>
                    <option value="MXN ">Mexican Peso</option>
                    <option value="MYR">Malaysian Ringgit</option>
                    <option value="NOK">Norwegian Kroner</option>
                    <option value="NPR">Nepalese Rupee</option>
                    <option value="NZD">New Zealand Dollar</option>
                    <option value="OMR">Omani Rial</option>
                    <option value="PKR">Pakistan Rupee</option>
                    <option value="QAR">Qatari Rial</option>
                    <option value="RON">Romanian Leu</option>
                    <option value="RUB">Russian Ruble</option>
                    <option value="SAR">Saudi Riyal</option>
                    <option value="SDG">Sudanese Pound</option>
                    <option value="SEK">Swedish Krona</option>
                    <option value="SGD">Singapore Dollar</option>
                    <option value="THB">Thai Baht</option>
                    <option value="TRY">Turkish Lira</option>
                    <option value="TTD">Trinidad/Tobago Dollar</option>
                    <option value="TWD">Taiwan Dollar</option>
                    <option value="UAH">Ukrainian hryvnia</option>
                    <option value="USD" selected>United States Dollar</option>
                    <option value="VEB">Venezuelan Bolivar</option>
                    <option value="ZAR">South African Rand</option>

                  </select>


                  </div>
                <div class="col-md-6">
                  <p>
                    <b>Change To Unit:</b>
                  </p>
                  <select name='To' id="To" class="form-control show-tick" data-live-search="true" required>

                    <option selected>Choose To.. </option>
                    <option value="AED">UAE Dirham </option>
                    <option value="ARS">Argentine Peso</option>
                    <option value="AUD">Australian Dollar</option>
                    <option value="BGN">Bulgarian Lev</option>
                    <option value="BRL">Brazilian Real</option>
                    <option value="BWP">Botswana Pula</option>
                    <option value="CAD">Canadian Dollar</option>
                    <option value="CAD">Canadian Dollar</option>
                    <option value="CHF" >Swiss Franc</option>
                    <option value="CLP" >Chilean Peso</option>
                    <option value="CNY">Chinese Yuan</option>
                    <option  value="COP">Colombian Peso</option>
                    <option value="DKK">Danish Krone</option>
                    <option value="EEK" >Estonian Kroon</option>
                    <option value="EGP">Egypt Pounds</option>
                    <option value="EUR">Euro</option>
                    <option value="GBP">British pound</option>
                    <option value="HKD">Hong Kong Dollar</option>
                    <option value="HRK">Croatian Kuna</option>
                    <option value="HUF">Hungarian Forint</option>
                    <option value="ILS">Israeli New Shekel</option>
                    <option value="INR">Indian Rupee</option>
                    <option value="ISK">Iceland Krona</option>
                    <option value="JPY">Japanese Yen</option>
                    <option value="KRW">South Korean Won</option>
                    <option value="KZT">Kazakhstani Tenge</option>
                    <option value="LKR">Sri Lanka Rupee</option>
                    <option value="LTL">Lithuanian Litas</option>
                    <option value="LVL">Latvian Lat</option>
                    <option value="LYD">Libyan Dinar</option>
                    <option value="MXN ">Mexican Peso</option>
                    <option value="MYR">Malaysian Ringgit</option>
                    <option value="NOK">Norwegian Kroner</option>
                    <option value="NPR">Nepalese Rupee</option>
                    <option value="NZD">New Zealand Dollar</option>
                    <option value="OMR">Omani Rial</option>
                    <option value="PKR">Pakistan Rupee</option>
                    <option value="QAR">Qatari Rial</option>
                    <option value="RON">Romanian Leu</option>
                    <option value="RUB">Russian Ruble</option>
                    <option value="SAR">Saudi Riyal</option>
                    <option value="SDG">Sudanese Pound</option>
                    <option value="SEK">Swedish Krona</option>
                    <option value="SGD">Singapore Dollar</option>
                    <option value="THB">Thai Baht</option>
                    <option value="TRY">Turkish Lira</option>
                    <option value="TTD">Trinidad/Tobago Dollar</option>
                    <option value="TWD">Taiwan Dollar</option>
                    <option value="UAH">Ukrainian hryvnia</option>
                    <option value="USD">United States Dollar</option>
                    <option value="VEB">Venezuelan Bolivar</option>
                    <option value="ZAR">South African Rand</option>

                  </select>
                </div>
              </div>
              </div>
            </div>
          </div>
        </div>

      <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
          <div class="card">

            <div class="body">
              <div class="button-demo">
                <input  style="font-size: 25px;"  type="submit" class="btn bg-red btn-block waves-effect" value="Convert" />


              </div>
            </div>
          </div>
        </div>
      </div>


    </form>



    <div class="row">
        <div class="col-xs-12">
          <div class="invoice-title">
            <h2>Invoice</h2><h3 class="pull-right">Order # <% out.print(session.getAttribute("Book_id") ); %></h3>
          </div>
          <hr>
          <div class="row">
            <div class="col-xs-6">
              <address>
                <strong>Billed To:</strong><br>
               <% out.print(session.getAttribute("fullname")); %><br>
                <%
                  out.print(session.getAttribute("bmobile"));
                %><br>
                <% out.print(session.getAttribute("bemail")); %><br>

              </address>
            </div>
            <div class="col-xs-6 text-right">
              <address>
                <strong>Shipped To:</strong><br>
                <% out.print(session.getAttribute("fullname")); %><br>
                <%
                  out.print(session.getAttribute("bmobile"));
                %><br>
                <% out.print(session.getAttribute("bemail")); %><br>

              </address>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-6">
              <address>
                <strong>Payment Method:</strong><br>
                Visa <br>
               <%out.print(session.getAttribute("bemail")); %>
              </address>
            </div>
            <div class="col-xs-6 text-right">
              <address>
                <strong>Order Date:</strong><br>
                <%  DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
                  LocalDateTime now = LocalDateTime.now();
                  out.print(dtf.format(now));   %><br><br>
              </address>
            </div>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title"><strong>Order summary</strong></h3>
            </div>
            <div class="panel-body">
              <div class="table-responsive">
                <table class="table table-condensed">
                  <thead>
                  <tr>
                    <td><strong>Item</strong></td>
                    <td class="text-center"><strong>Price</strong></td>
                    <td class="text-center"><strong>Quantity</strong></td>
                    <td class="text-right"><strong>Totals</strong></td>
                  </tr>
                  </thead>
                  <tbody>
                  <!-- foreach ($order->lineItems as $line) or some such thing here -->
                  <tr>
                    <td>Flight <% out.print(session.getAttribute("City")); %></td>
                    <td class="text-center">$ <%

                      out.print(result);


                    %></td>
                    <td class="text-center"><%out.print(session.getAttribute("My_seat")); %></td>
                    <td class="text-right">$ <%
                      String check_seat1=(String)session.getAttribute("My_seat");
                      String check_price1=(String)session.getAttribute("Price");


                      int price1 = Integer.parseInt(check_price1);
                      int seat1 = Integer.parseInt(check_seat1);

                      int result1 = price*seat;
                      String total1= Integer.toString(result);

                      out.print(result);


                    %></td>
                  </tr>


                  <tr>
                    <td class="thick-line"></td>
                    <td class="thick-line"></td>
                    <td class="thick-line text-center"><strong>Subtotal</strong></td>
                    <td class="thick-line text-right">$ <%
                      out.print(result);
                    %>
                    </td>
                  </tr>
                  <tr>
                    <td class="no-line"></td>
                    <td class="no-line"></td>
                    <td class="no-line text-center"><strong>Services</strong></td>
                    <td class="no-line text-right">$ <%
                    int service = 20;
                      out.print(service);
                    %></td>
                  </tr>
                  <tr>
                    <td class="no-line"></td>
                    <td class="no-line"></td>
                    <td class="no-line text-center"><strong>Total</strong></td>
                    <td class="no-line text-right">$
                    <%
                      out.print(result+service);
                    %>

                    </td>
                  </tr>
                  </tbody>
                </table>






              </div>
            </div>
          </div>
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
