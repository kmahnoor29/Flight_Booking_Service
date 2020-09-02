<%--
  Created by IntelliJ IDEA.
  User: MAHNOOR
  Date: 8/30/2020
  Time: 11:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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


  String Address1 = request.getParameter("ADDRESS");
  String Address2 = request.getParameter("ADDRESS2");


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
        <a href="#">
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

%>

<section class="content">
  <div class="container-fluid">
    <div class="block-header">
      <h2>DASHBOARD</h2>
    </div>

    <div id="container" class="shadow">
      <div id="map_canvas"></div>

    <div class="row clearfix">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="card">
          <div class="header"> <h2>Directions...</h2> </div>
          <div class="body">

            <div class="row clearfix">
              <div class="col-md-4">
                <div class="input-group">
                                    <span class="input-group-addon">
                                         From:
                                    </span>
                  <div class="form-line">

                    <input type="text" name="txtAddress1" id="txtAddress1" value="<%
                    out.print(Address1);
                    %>" class="form-control number" placeholder="Enter Your Full Name." required>
                  </div>


                </div>
              </div>


              <div class="col-md-4">
                <div class="input-group">
                                    <span class="input-group-addon">
                                         To:
                                    </span>
                  <div class="form-line">

                    <input type="text" name="txtAddress2" id="txtAddress2" value="<%
                    out.print(Address2);
                    %>" class="form-control number" placeholder="Enter Your Full Name." required>
                  </div>


                </div>
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


              <input type="submit" id="btnGetDirections" style="font-size: 25px;"  class="btn bg-teal btn-block waves-effect" value="View Directions" />

            </div> <div class="separator"></div>
            <div id="divDirections">
          </div>
        </div>
      </div>
    </div>
<br>
    <br>




    </div>

      </div>

    <!-- #END# Location -->

    <!-- #END# Browser Usage -->
  </div>
  </div>
</section>


<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyAfUfmbwDjLNccWwiVU91-YxqCQId7tNkw">

</script>




<script type="text/javascript">
  var map;
  var directionsDisplay;
  var directionsService = new google.maps.DirectionsService();

  $(document).ready(function () {

    //draw a map centered at Empire State Building Newyork
    var latlng = new google.maps.LatLng(40.748492, -73.985496);
    var myOptions = {
      zoom: 15,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

    directionsDisplay = new google.maps.DirectionsRenderer();
    directionsDisplay.setMap(map);
    //directionsDisplay.setPanel(document.getElementById("divDirections"));

    $("#btnGetDirections").click(function(){
      calcRoute($("#txtAddress1").val(),$("#txtAddress2").val());
    });


  });

  function calcRoute(start,end) {
    var request = {
      origin:start,
      destination:end,
      travelMode: google.maps.TravelMode.DRIVING,
      provideRouteAlternatives : false
    };
    directionsService.route(request, function(result, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(result);
        displayDirections(result);
      }
    });
  }

  function displayDirections(result){
    var html = '<div style="margin:5px;padding:5px;background-color:#EBF2FC;border-left: 1px solid #EBEFF9;border-right: 1px solid #EBEFF9;text-align:right;">';
    html = html + '<span><strong>' + $.trim(result.routes[0].legs[0].distance.text.replace(/"/g,'')) + ', ' + $.trim(result.routes[0].legs[0].duration.text.replace(/"/g,'')) + '</strong></span></div>';
    $("#divDirections").html(html);

    //Display Steps
    var steps  = result.routes[0].legs[0].steps;
    for(i=0; i<steps.length; i++) {
      var instructions = JSON.stringify(steps[i].instructions);
      var distance = JSON.stringify(steps[i].distance.text);
      var time = JSON.stringify(steps[i].duration.text);
      $("#divDirections").append(getEmbedHTML(i+1,instructions,distance,time));
    }
  }

  function getEmbedHTML(seqno,instructions,distance,duration) {
    var strhtml = '<div class="row">';
    strhtml  =  strhtml + '<span>' + seqno + '</span>&nbsp;' + $.trim(instructions.replace(/"/g,'')) + '<br/>'
    strhtml  =  strhtml + '<div style="text-align:right;"><span>' + $.trim(distance.replace(/"/g,'')) + ' <span></div>'
    strhtml  =  strhtml + '</div><div class="separator"></div>';

    return strhtml;
  }




</script>










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
