<!DOCTYPE html>
<html>

<head>

  <title>User | Flight Booking Service</title>
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
  <meta name="description" content="Google Maps API V3: Custom Directions Panel" />
  <meta name="keywords" content="Google Maps API V3, Custom Directions Panel, jQuery, jQuery tutorials, thewebstorebyg wordpress code blog" />
  <meta name="author" content="Giri Jeedigunta - thewebstorebyg" />
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
  <link href="Dashboard/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">
  <!-- Waves Effect Css -->
  <link href="Dashboard/plugins/node-waves/waves.css" rel="stylesheet" />
  <link href="direction.css" type="text/css" rel="stylesheet" />

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
    .book-title{

      font-family: Avantgarde, TeX Gyre Adventor, URW Gothic L, sans-serif;

    }
  </style>
</head>

<body>
<div id="mapCanvas">&#160;</div>
<div id="directionsPanel">
<h4 id="book-title">Flight Booking Service</h4>
  <a class="book-title" style="color: white; background-color: lightseagreen;" href="#geoLocation" id="useGPS">Use My Location</a>
  <p class="or">[OR]</p>
  <div  class="directionInputs">
    <form>
      <p>
        <label style="color: white; background-color: lightseagreen;">A</label>
        <input class="form-control text" type="text" value="" id="dirSource" />
      </p>
      <p>
        <label style="color: white; background-color: lightseagreen;">B</label>
        <input class="form-control text" type="text" value="" id="dirDestination" />
      </p>
      <a style="background-color: #008080; color: white;" href="#getDirections" id="getDirections">Get Directions</a>
      <a style="background-color: #008080; color: white;" href="#reset" id="paneReset">Reset</a>
      <br>
      <br>

      <a style="background-color: red; color: white;" href="UserDashboard.jsp" id="back">Go Back To DashBoard?</a>
    </form>
  </div>
  <div id="directionSteps">
    <p class="msg">Direction Steps Will Render Here</p>
  </div>
  <a href="#toggleBtn" id="paneToggle" class="out">&lt;</a>
</div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfUfmbwDjLNccWwiVU91-YxqCQId7tNkw&callback=init&libraries=places&sensor=false" async defer></script>
<script src="directions.js"></script>
<!-- Waves Effect Plugin Js -->
<script src="Dashboard/plugins/node-waves/waves.js"></script>
<script>
  function init() {
    initMap();
  }
</script>
<!--
  For detailed tutorial visit:
  https://thewebstorebyg.wordpress.com/2013/01/11/custom-directions-panel-with-google-maps-api-v3/

  Author: Giri Jeedigunta
  Last Edited: July 2017.
  Visit: http://thewebstorebyg.wordpress.com/ for more tutorials.

  NOTE:
  To use the Google Maps JavaScript API Versions 3.27 and above, you must generate your own API key and add a list of  domains you intend to use this API. More details – https://developers.google.com/maps/documentation/javascript/get-api-key
-->
</body>

</html>
