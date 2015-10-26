<!--- Title is required --->
<cfparam name="title" type="string">
<cfset editable = "true" />

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
    #javaScriptIncludeTag(" //cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js")#
    #javaScriptIncludeTag("//cdn.ckeditor.com/4.5.4/standard/ckeditor.js")#   
    #styleSheetLinkTag("//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css")# 
    #styleSheetLinkTag("dropzone.css")#
  </cfoutput>
        
</head>
    
  <body>
    <!--[if lt IE 10]>
      <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->
  
  <div class="wrapper-body">
    <header class="s-header">
      <cfoutput>#includePartial(partial="/shared/storeheadertop")#</cfoutput>
      <cfoutput>#includePartial(partial="/shared/topmenu")#</cfoutput>
    <cfoutput>    
      <div class="button-wrapper">
        <div class="container">
            <a class="btn-content">
             <div class="row edit">         
                            Store
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
    <cfoutput>#includePartial(partial="/shared/footer")#</cfoutput>
<cfif isdefined("session.admin") and session.admin eq "true">
    <cfoutput>
      <!---#javaScriptIncludeTag("http://127.0.0.1:8500/longrunbaptistwheels/javascripts/crud.js?env=local")#
      #javaScriptIncludeTag("jquery.jeditable.mini.js")# 
    --->
        
    #javaScriptIncludeTag("store.js")#    
    </cfoutput>
</cfif> 
   </body>
</html>
