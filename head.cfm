  <head>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>cross</title>
    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="stylesheet" href="styles/vendor.css">
    <link rel="stylesheet" href="styles/main.css">
    <script src="scripts/vendor/modernizr.js"></script>
    <cfif isdefined("session.admin") and session.admin eq "true">  
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	   <script src="ckeditor3/ckeditor.js"></script>
        <!---<script src="http://cdn.ckeditor.com/4.5.2/standard-all/ckeditor.js"></script> --->
        
        <!--- Toast Notifications --->
         <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
       
        
        
        <cfif cgi.script_name contains "pages.cfm">
        <style>
    .about-god i {
        font-size: 24px;
        float: left;
        padding: 0px 0px;
        background: transparent;
        color: #000000;
    }
    
    .white-btn {
        color: #ffffff;
        background-color: #ffffff;
        border: 1px solid #ffffff;
        transition: all 0.3s ease;
    }
    
    .white-btn:hover {
        background: #f46d6d;
        color: #f46d6d;
        border: 1px solid #f46d6d;
    }
</style>
        </cfif>
    </cfif>    
  </head>