<!DOCTYPE HTML>
<!--
	Industrious by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->

<html>
	<head>
		<title>Flight Booking Service</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="assets/css/main.css" />

		<style>
			
		
			#map {
        height: 80%;
       width: 750px;
       position: fixed;
      }

      /* Optional: Makes the sample page fill the window. */
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }

      #description {
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
      }
      #book-title{
        background:linear-gradient(
        45deg,
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
  width: 35%; /* Could be more or less, depending on screen size */
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
	<body class="is-preload">
		<header id="header">
			<a class="logo" href="index.jsp" ><p >Flight Booking Service</p></a>
			<nav>
				<a href="#menu">Menu</a>
			</nav>
		</header>

	<!-- Nav -->
		<nav id="menu">
			<ul class="links">
				<li><a href="index.jsp">Home</a></li>
				<li><a href="elements.html">About</a></li>
				<li><a href="generic.html">Contact</a></li>
			</ul>
		</nav>

		<!-- Heading -->
			<div id="heading" >
				<h1 >Book Flights</h1>
			</div>



		<!-- Main -->
			<section id="main" class="wrapper">
				<div class="inner">
					<div class="content">
<h1 id="book-title">Please select your location</h1>



<form>
    		<div style="height: 500px;" class="col-md-8" >
							<div class="input-group">                  
						  
							<input id="searchInput" style="width: 460px; height:45px ; margin-top:7px ; font-size: 20px; color: black; background-color: rgb(240, 240, 240);" class="controls form-control" type="text" placeholder="Enter your location..">    
								  </div>            
							   <br>
							   <br>
							   <div style="border-radius: 8px;" id="map"></div> 
							 </div>		 
					<br>
<div class="col-md-8">
	<ul id="full-ad" class="geo-data">
          <li><span id="Li">Address: </span> <span id="location"></span></li>
          <hr width="760px">

          <li> <span id="Li">Postal Code:</span>  <span id="postal_code"></span></li>
          <hr width="760px">
          <li><span id="Li">Country:</span> <span id="country"></span></li>
          <hr width="760px">
          <li> <span id="Li">Latitude:</span>   <span id="lat"></span></li>
          <hr width="760px">
		  <li><span id="Li">Longitude:</span>    <span id="lon"></span></li>
		  <hr width="760px">
		  <li><span id="Li">City:</span>    <span id="city"></span></li>
	  </ul>
  </div>

  <br>

  <input class="button large" id="myBtn" style="color: black;" value="View Flights"/>
  <div id="myModal" class="modal">

	<!-- Modal content -->
	<div class="modal-content">
	  <span class="close">&times;</span>
	  <h2 style="color: red; font-weight: bold;">Notice!</h2>
	 
	  <hr>
		<h4>To Avaible to Access</h4>
	  <p>Please Sign-in & Get Fully Featured Flight Service..</p>
<div class="row">
	<div class="col-md-6">

		<a href="login.jsp">
		<input type="button" class=" small btn btn-block btn-lg btn-danger" id="myBtn"  value="Sign-in" />
	</a>
</div>

	<div class="col-md-6">
		<a href="Registration.jsp">
			<input type="button" class=" small btn btn-block btn-lg  btn-primary" id="myBtn"  value="Register"/>
		</a>
	</div>
	</div>



	</div>
  
  </div>

</form>
				
					  </div>
									 
					</div>
				</div>
			</section>

			<!-- Footer -->
			<footer id="footer">
				<div class="inner">
					<div class="content">
						<section>
							<h3>How to Book a Flight? </h3>
							<p>Nunc lacinia ante nunc ac lobortis. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus ornare mi ut ante amet placerat aliquet. Volutpat eu sed ante lacinia sapien lorem accumsan varius montes viverra nibh in adipiscing. Lorem ipsum dolor vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing sed feugiat eu faucibus. Integer ac sed amet praesent. Nunc lacinia ante nunc ac gravida.</p>
						</section>
						<section>
							<h4>Go to</h4>
							<ul class="alt">
								<li><a href="#">About.</a></li>
								<li><a href="#">Contact.</a></li>
								<li><a href="#">Sign in.</a></li>
						
							</ul>
						</section>
						<section>
							<h4>Follow us </h4>
							<ul class="plain">
								<li><a href="#"><i class="icon fa-twitter">&nbsp;</i>Twitter</a></li>
								<li><a href="#"><i class="icon fa-facebook">&nbsp;</i>Facebook</a></li>
								<li><a href="#"><i class="icon fa-instagram">&nbsp;</i>Instagram</a></li>
								<li><a href="#"><i class="icon fa-github">&nbsp;</i>Github</a></li>
							</ul>
						</section>
					</div>
					<div class="copyright">
						&copy; Flight Booking Service.  <a href="https://unsplash.co"></a>, <a href="https://coverr.co"></a>.
					</div>
				</div>
			</footer>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfUfmbwDjLNccWwiVU91-YxqCQId7tNkw&callback=initMap&libraries=places&v=weekly"
			defer
		  ></script>
			<script>
				function initMap() {
				var map = new google.maps.Map(document.getElementById('map'), {
				  center: {lat: -33.8688, lng: 151.2195},
				  zoom: 13
				});
				var input = document.getElementById('searchInput');
				map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
			
				var autocomplete = new google.maps.places.Autocomplete(input);
				autocomplete.bindTo('bounds', map);
			
				var infowindow = new google.maps.InfoWindow();
				var marker = new google.maps.Marker({
					map: map,
					anchorPoint: new google.maps.Point(0, -29)
				});
			
				autocomplete.addListener('place_changed', function() {
					infowindow.close();
					marker.setVisible(false);
					var place = autocomplete.getPlace();
					if (!place.geometry) {
						window.alert("Autocomplete's returned place contains no geometry");
						return;
					}
			  
					// If the place has a geometry, then present it on a map.
					if (place.geometry.viewport) {
						map.fitBounds(place.geometry.viewport);
					} else {
						map.setCenter(place.geometry.location);
						map.setZoom(17);
					}
					marker.setIcon(({
						url: place.icon,
						size: new google.maps.Size(71, 71),
						origin: new google.maps.Point(0, 0),
						anchor: new google.maps.Point(17, 34),
						scaledSize: new google.maps.Size(35, 35)
					}));
					marker.setPosition(place.geometry.location);
					marker.setVisible(true);
				
					var address = '';
					if (place.address_components) {
						address = [
						  (place.address_components[0] && place.address_components[0].short_name || ''),
						  (place.address_components[1] && place.address_components[1].short_name || ''),
						  (place.address_components[2] && place.address_components[2].short_name || '')
						].join(' ');
					}
				
					infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
					infowindow.open(map, marker);
				  
					// Location details
					for (var i = 0; i < place.address_components.length; i++) {
						if(place.address_components[i].types[0] == 'postal_code'){
							document.getElementById('postal_code').innerHTML = place.address_components[i].long_name;
						}
						if(place.address_components[i].types[0] == 'country'){
							document.getElementById('country').innerHTML = place.address_components[i].long_name;
						}
						if(place.address_components[i].types[0] == 'locality'){
							document.getElementById('city').innerHTML = place.address_components[i].long_name;
						}
					}
					document.getElementById('location').innerHTML = place.formatted_address;
					document.getElementById('lat').innerHTML = place.geometry.location.lat();
					document.getElementById('lon').innerHTML = place.geometry.location.lng();
				});
			}
				</script>
<script>
	var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
	</body>
</html>