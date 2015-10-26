<cfset currentPage = "page_details.cfm">
<cfset pageTemplate = "page" />

    
<cfset editable = "false" />
<cfif isdefined("session.admin") and session.admin eq "true">
    <cfset editable = "true" />
</cfif>   
   

<!doctype html>
<html class="no-js" lang="">
    <head>
    <cfoutput>    
    <!--- Includes `stylesheets/styles.css` --->
    #styleSheetLinkTag("http://127.0.0.1:8500/remark/assets/css/bootstrap-extend.min.css")#
    #styleSheetLinkTag("main,vendor")#
    #javaScriptIncludeTag("vendor/modernizr.js")#
    #javaScriptIncludeTag("https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js")#
    #javaScriptIncludeTag("//cdn.ckeditor.com/4.5.4/standard/ckeditor.js")# 
    #styleSheetLinkTag("//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css")#
    #styleSheetLinkTag("http://127.0.0.1:8500/remark/assets/fonts/web-icons/web-icons.min.css")#
    #javaScriptIncludeTag("//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js")#    
        
 </cfoutput>
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
        
</head>
    
    
    
  <body>
      
     
      
    <!--[if lt IE 10]>
      <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->
  
  <div class="wrapper-body">
    <header class="s-header">
        <cfoutput>
            #includePartial(partial="/shared/headertop")#
            #includePartial(partial="/shared/topmenu")#
        </cfoutput>
    <cfoutput>    
      <div class="button-wrapper">
        <div class="container">
            <a class="btn-content">
                <div class="row">         
                            Pages
                </div>
            </a><br /><br />
            <div id="renamePage"><input type="checkbox" id="renamePageChk"> Rename the page?</div>
        </div>  
      </div>
    </cfoutput>    <!-- End of Content -->
    </header>
    <!-- End of header -->
   
    <!-- start of store --> 
    <section class="store">
        
        <!---  --->
        
      <div class="container">
        <div class="row">
            <cfoutput>#includePartial(partial="/shared/modal")#</cfoutput>
            
           <div class="wrapper clearfix">
              <aside class="content blog-details">
                <div id="pageTitleEdit" contenteditable="true"></div>
                <div id="pageContentEdit" contenteditable="true">Page content</div>
                <br />
                <br />  
                <div><a class="btn red-btn" id="donePageEdit"><i class="fa fa-location-arrow">&nbsp;Go Back</i></a></div>  
                  <div class="about-god">
                    <table class="table table-bordered" id="pagesTable">
                    <thead>
                      <tr>
                        <th class="text-nowrap" style="width:200px"> Go to Page Number
                            
                            <select class="form-control" id="pagenum" onchange="pageme()">
                                <cfoutput>
                                <cfloop index="i" from="1" to="#qryPageCount#">
                                    <option value="#i#">#i#</option>
                                </cfloop>
                                </cfoutput>    
                            </select>
                        </th>
                        <th style="width:200px" class="text-nowrap"> 
                            Filter by Page Cateogry
                            <select class="form-control" id="selectCategory" onchange="filterbyCategory()">
                                <cfoutput>
                                    <option value="">All</option>
                                <cfloop query="qryCategory">
                                    <option value="#id#">#categoryname#</option>
                                </cfloop>
                                </cfoutput>    
                            </select>
                            
                            
                           </th>
                        <th class="text-nowrap">
                            Search by Page Title
                        
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search for..." id="search">
                                <span class="input-group-btn">
                                              <button type="button" class="btn btn-default btn-outline" id="input-search-btn">Search</button>
                                            </span>
                            </div>
                        </th>
                      </tr>
                        <tr>
                            <th class="text-nowrap">Page Title</th>
                            <th class="text-nowrap">Page Category</th>
                            <th class="text-nowrap">Action</th>
                            
                        </tr>
                    </thead>
                      
                    <tbody id="headings">
                    </tbody>
                  </table>
                 </div>
               </aside>
           </div>
        </div>        
      </div>
    </section>
    <cfoutput>
        #includePartial(partial="/shared/footer")# 
        #javaScriptIncludeTag("postajax.js")# 
        #javaScriptIncludeTag("pages.js")# 
      </cfoutput>
   </body>
</html>
