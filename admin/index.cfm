<cfset error = "" />
<cfif structKeyExists(session,"admin") AND session.admin EQ "true">
    <cflocation url="../index.cfm" addToken="no">
    <cfelse>
    <!-- Check to see if submit was pressed -->
    <cfif isdefined("url.submit") AND url.submit EQ "true">
        <cfif isdefined("form.email") AND form.email EQ "pastor@longrunbaptist.org" OR form.email EQ "sophek@gmail.com">
            <!---Check for password --->
            <cfif isdefined("form.password") AND form.password EQ "flatearth1611!">
                <cfset session.admin = "true" />
                <cflocation url="../index.cfm" addToken="no">
            <cfelse>
                <cfset error = "Please enter the correct login information." />    
            </cfif>
        </cfif>
    </cfif>    
</cfif>




<!DOCTYPE html>
<html class="no-js css-menubar" lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
  <meta name="description" content="bootstrap admin template">
  <meta name="author" content="">

  <title>Login V3 | Longrun Baptist</title>

  <link rel="apple-touch-icon" href="../../assets/images/apple-touch-icon.png">
  <link rel="shortcut icon" href="../../assets/images/favicon.ico">

  <!-- Stylesheets -->
    
  <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="../assets/css/bootstrap-extend.min.css">
  <link rel="stylesheet" href="../assets/css/site.min.css">

  <!-- Skin tools (demo site only) -->
  <link rel="stylesheet" href="assets/css/skintools.css">
  <script src="../../assets/js/sections/skintools.min.js"></script>

  <!-- Plugins -->

  <!-- Page -->
  <link rel="stylesheet" href="../assets/css/login-v3.css">

  <!-- Fonts -->
  <link rel="stylesheet" href="../../assets/fonts/web-icons/web-icons.min.css">
  <link rel="stylesheet" href="../../assets/fonts/brand-icons/brand-icons.min.css">
  <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,300italic'>

  <!--[if lt IE 9]>
    <script src="../../assets/vendor/html5shiv/html5shiv.min.js"></script>
    <![endif]-->

  <!--[if lt IE 10]>
    <script src="../../assets/vendor/media-match/media.match.min.js"></script>
    <script src="../../assets/vendor/respond/respond.min.js"></script>
    <![endif]-->


</head>
<body class="page-login-v3 layout-full">
  <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->


  <!-- Page -->
  <div class="page animsition vertical-align text-center" data-animsition-in="fade-in"
  data-animsition-out="fade-out">>
    <div class="page-content vertical-align-middle">
      <div class="panel">
        <div class="panel-body">
          <div class="brand">
            <img class="brand-img" src="../images/logo.png" alt="...">
             <label class="floating-label" style="color:red"><cfoutput>#error#</cfoutput></label>  
        </div>
            
          <form method="post" action="index.cfm?submit=true">
              
            <div class="form-group form-material floating">
              <input type="email" class="form-control" name="email" />
              <label class="floating-label">Email</label>
            </div>
            <div class="form-group form-material floating">
              <input type="password" class="form-control" name="password" />
              <label class="floating-label">Password</label>
            </div>
            <div class="form-group clearfix">
              <div class="checkbox-custom checkbox-inline checkbox-primary checkbox-lg pull-left">
                <input type="checkbox" id="inputCheckbox" name="remember">
                <label for="inputCheckbox">Remember me</label>
              </div>
              <a class="pull-right" href="forgot-password.html">Forgot password?</a>
            </div>
            <button type="submit" class="btn btn-primary btn-block btn-lg margin-top-40">Sign in</button>
          </form>
        </div>
      </div>

      <footer class="page-copyright page-copyright-inverse">
        <p>© 2015. All RIGHT RESERVED.</p>
        <div class="social">
          <a class="btn btn-icon btn-pure" href="javascript:void(0)">
            <i class="icon bd-twitter" aria-hidden="true"></i>
          </a>
          <a class="btn btn-icon btn-pure" href="javascript:void(0)">
            <i class="icon bd-facebook" aria-hidden="true"></i>
          </a>
          <a class="btn btn-icon btn-pure" href="javascript:void(0)">
            <i class="icon bd-google-plus" aria-hidden="true"></i>
          </a>
        </div>
      </footer>
    </div>
  </div>
  <!-- End Page -->

</body>

</html>    