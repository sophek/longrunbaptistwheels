<!--- Title is required --->
<cfparam name="title" type="string" default="">
<cfset editable = "true" />
   
    
<!--- Get the sermons for semon auido --->        
<cfhttp url="https://www.sermonaudio.com/api/saweb_get_sermons.aspx?apikey=BC8CAFFC-26AF-4A8F-845D-215369E9DD0A&page=1&pagesize=10" method="get" result="result" /> 
<cfset getResult = deserializeJSON(result.filecontent)>    

<!doctype html>
<html class="no-js" lang="">
    <head>
    <script src="https://use.typekit.net/dyx7yee.js"></script>
    <script>try{Typekit.load({ async: true });}catch(e){}</script>    
    <cfoutput>    
    <!--- Includes `stylesheets/styles.css` --->
    #styleSheetLinkTag("main,vendor")#
    #javaScriptIncludeTag("vendor/modernizr.js")#
    #javaScriptIncludeTag("dropzone.js")#    
    #javaScriptIncludeTag("https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js")#
    #javaScriptIncludeTag("//cdn.ckeditor.com/4.5.4/standard/ckeditor.js")#   
    #styleSheetLinkTag("//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css")# 
    #styleSheetLinkTag("dropzone.css")# 
    #javaScriptIncludeTag("//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js")#
 </cfoutput>
        

        
</head>
    
  <body>
    <!--[if lt IE 10]>
      <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->
  
  <div class="wrapper-body">
    <header class="s-header">
      <cfoutput>#includePartial(partial="/shared/headertop")#</cfoutput>
      <cfoutput>#includePartial(partial="/shared/topmenu")#</cfoutput>
    <cfoutput>    
      <div class="button-wrapper">
        <div class="container">
            <a class="btn-content">
             <div class="row edit">         
                            Hello
                </div>
            </a>
            <br />
            <br />
        </div>  
      </div>
    </cfoutput>    <!-- End of Content -->
    </header>
    <!-- End of header -->
   
    <!-- start of store -->
    <cfoutput>  
    <section class="store">
        #includeContent()#
    </section>
    </cfoutput>
    <!--- Article Categories --->  
    <cfoutput>#includePartial(partial="/shared/footer")#</cfoutput>
<cfif isdefined("session.admin") and session.admin eq "true">
    <cfoutput>
      #javaScriptIncludeTag("editable")#
      #javaScriptIncludeTag("http://127.0.0.1:8500/longrunbaptistwheels/javascripts/crud.js?env=local")#  
    #javaScriptIncludeTag("jquery.jeditable.mini.js")#    
    </cfoutput>
    
</cfif> 
      
          <script>
        
        $("#myAwesomeDropzone").dropzone({ url: "../uploadme.cfm?imgID=23" });
        
        
//    Dropzone.options.myAwesomeDropzone = {
//url: "../uploadme.cfm?imgID=23"        
//  paramName: "file", // The name that will be used to transfer the file
//  maxFilesize: 2, // MB
//  accept: function(file, done) {
//    if (file.name == "justinbieber.jpg") {
//      done("Naha, you don't.");
//    }
//    else { done(); }
//  }
//};    
    </script>
       
   </body>
</html>
