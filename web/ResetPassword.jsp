<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  if(session.getAttribute("user")==null){
    response.sendRedirect("login.jsp");
  }



%>
<html>
<head>
  <title>Flight Reservation Service</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
  <meta name="description" content="" />
  <meta name="keywords" content="" />
  <script type="text/javascript" src="https://www.technicalkeeda.com/js/javascripts/plugin/jquery.validate.js"></script>

  <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

  <link rel="stylesheet" href="assets/bootstrap/bootstrap.css" />



  <style>
    body{
      padding-top:4.2rem;
      padding-bottom:4.2rem;
      background:rgba(0, 0, 0, 0.76);
      background-repeat: no-repeat;
      background-position: center;
      background-image: url('Images/login.jpg');
    }
    .progress-bar {
      color: rgb(255, 255, 255);
    }

    a{
      text-decoration:none !important;
    }
    h1,h2,h3{
      font-family: 'Kaushan Script', cursive;
    }
    .myform{
      position: relative;
      display: -ms-flexbox;
      display: flex;
      padding: 1rem;
      -ms-flex-direction: column;
      flex-direction: column;
      width: 100%;
      pointer-events: auto;
      background-color: #fff;
      color: black;
      background-clip: padding-box;
      border: 1px solid rgba(0,0,0,.2);
      border-radius: 1.1rem;
      outline: 0;
      max-width: 500px;
    }
    .tx-tfm{
      text-transform:uppercase;
    }
    .mybtn{
      border-radius:50px;
    }

    .login-or {
      position: relative;
      color: #aaa;
      margin-top: 10px;
      margin-bottom: 10px;
      padding-top: 10px;
      padding-bottom: 10px;
    }
    .span-or {
      display: block;
      position: absolute;
      left: 50%;
      top: -2px;
      margin-left: -25px;
      background-color: #fff;
      width: 50px;
      text-align: center;
    }
    .hr-or {
      height: 1px;
      margin-top: 0px !important;
      margin-bottom: 0px !important;
    }
    .google {
      color:#666;
      width:100%;
      height:40px;
      text-align:center;
      outline:none;
      border: 1px solid lightgrey;
    }
    .google:hover{
      background-color:#666 ;
    }
    form .error {
      color: #ff0000;
    }
    #second{display:none;}
    #book-title{
      background:linear-gradient(
              45deg,
              #393f3f,
              #23b18d
      );
      font-family: Avantgarde, TeX Gyre Adventor, URW Gothic L,New Century ;

      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }


  </style>
</head>
<body>
<script>
  function fncSubmit()
  {

    if(document.ChangePasswordForm.Oldpassword.value == "")
    {
      alert('Please input old password');
      document.ChangePasswordForm.Oldpassword.focus();
      return false;
    }

    if(document.ChangePasswordForm.Newpassword.value == "")
    {
      alert('Please input Password');
      document.ChangePasswordForm.Newpassword.focus();
      return false;
    }

    if(document.ChangePasswordForm.Cpassword.value == "")
    {
      alert('Please input Confirm Password');
      document.ChangePasswordForm.Cpassword.focus();
      return false;
    }

    if(document.ChangePasswordForm.Newpassword.value != document.ChangePasswordForm.Cpassword.value)
    {
      alert('Confirm Password Not Match');
      document.ChangePasswordForm.Newpassword.focus();
      return false;
    }

  }
</script>

<div class="container">
  <div class="row">
    <div class="col-md-5 mx-auto">
      <div >
        <div class="myform form ">
          <div class="logo mb-3">
            <div class="col-md-12 text-center">
              <h1 id="book-title">Reset Password</h1>
            </div>
          </div>
          <form action="ChangePassword.jsp" onclick="fncSubmit()" name="ChangePasswordForm" method="post" name="login">
            <div class="form-group">
              <label for="Oldpassword">Old Password</label>
              <input type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                     title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
                     name="Oldpassword" id="Oldpassword"  class="form-control" aria-describedby="emailHelp" placeholder="Enter Password" required>
            </div>
            <div class="form-group">
              <label for="Newpassword">New Password</label>
              <input type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                     title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
                     name="Newpassword" id="Newpassword"  class="form-control" aria-describedby="emailHelp" placeholder="Enter Password" required>
            </div>

            <div class="form-group">
              <label for="Cpassword">Confirm Password</label>
              <input type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                     title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
                     name="Cpassword" id="Cpassword"  class="form-control" aria-describedby="emailHelp" placeholder="Enter Password" required>
            </div>
            <div class="form-group">
              <p class="text-center">By signing up you accept our <a href="#">Terms Of Use</a></p>
            </div>
            <div class="col-md-12 text-center ">
              <button type="submit" class=" btn btn-block mybtn  tx-tfm" style=" background:linear-gradient(
                                45deg,
                                #474141,
                                #b13423
                            );">Change Password</button>
            </div>


            <div class="form-group">
              <p class="text-center">Don't have account? <a href="Registration.jsp" id="signup">Sign up here</a></p>

              <a href="index.jsp">
                <input class="btn btn-block mybtn tx-tfm" id="myBtn" style="color: black;" value="Go Back"/>
              </a>

            </div>
          </form>

        </div>
      </div>





    </div>
  </div>
</div>

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>


<script src="https://kit.fontawesome.com/d0caab7068.js" crossorigin="anonymous"></script>



</body>




</html>