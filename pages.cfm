<cfset currentPage = "page_details.cfm">
<cfset pageTemplate = "page" />
<cfinclude template="editable.cfm" />
    
<cfset editable = "false" />
<cfif isdefined("session.admin") and session.admin eq "true">
    <cfset editable = "true" />
    <cfquery name="qry" datasource="longrun" result="qryResult" maxrows="10">
                        Select id, post_title, post_name from wp_posts order by id desc;
    </cfquery>    
<cfelse>    
<!--- redirect to the login page --->
    <cflocation url="admin/index.cfm" addToken="no" />
</cfif>   
    
<!--- Get the sermons for semon auido --->        
<cfhttp url="https://www.sermonaudio.com/api/saweb_get_sermons.aspx?apikey=BC8CAFFC-26AF-4A8F-845D-215369E9DD0A&page=1&pagesize=10" method="get" result="result" /> 
<cfset getResult = deserializeJSON(result.filecontent)>    

<!doctype html>
<html class="no-js" lang="">
<cfinclude template="head.cfm" />
    
  <body>
    <!--[if lt IE 10]>
      <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->
  
  <div class="wrapper-body">
    <header class="s-header">
      <cfinclude template="header-top.cfm" />
      <cfinclude template="topmenu.cfm" />
    <cfoutput>    
      <div class="button-wrapper">
        <div class="container">
            <a class="btn-content">
                Pages
            </a>
        </div>  
      </div>
    </cfoutput>    <!-- End of Content -->
    </header>
    <!-- End of header -->
   
    <!-- start of store --> 
    <section class="store">
      <div class="container">
        <div class="row">
           <div class="wrapper clearfix">
              <aside class="content blog-details">
                <div class ="blog-image">
                  <img src="images/blog-details.jpg" alt="image">
                </div>
               
                <div id="updateSuccess"></div> 
                  
                  
                <div class="about-god">
                    
                     
                    <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>Page Title</th>
                        <th>Rename Page Name?</th>
                        <th>Page Name</th>
                        <th class="text-nowrap">Action</th>
                      </tr>
                    </thead>
                    <tbody id="headings">
                    
                    <cfoutput query="qry">
                      <tr>
                        <td><h2 id="@#post_name#" contenteditable="#editable#" chkboxid="##renamePage#currentrow#" >#post_title#</h2></td>
                        <td><input type="checkbox" id="renamePageChk">
                        </td>
                        <td>#post_name#</td>
                        <td class="text-nowrap">
                          <button type="button" class="btn white-btn" data-toggle="tooltip" data-original-title="Clone" onclick="javascript:duplicate('#id#','#post_name#')">
                            <i class="fa fa-files-o" aria-hidden="true"></i>
                          </button>
                            <button type="button"  class="btn white-btn" data-toggle="tooltip" data-original-title="Edit" onclick="javascript:location.href='page_details.cfm?page_name=#post_name#'">
                            <i class="fa fa-wrench" aria-hidden="true"></i>
                          </button>
                          <button type="button"  class="btn white-btn" data-toggle="tooltip" data-original-title="Delete" onclick="javascript:deleteme('#id#','#post_name#')">
                            <i class="fa fa-times" aria-hidden="true"></i>
                          </button>
                        </td>
                      </tr>
                    </cfoutput>
                    </tbody>
                  </table>
                 </div>
               </aside>
             <aside class="sidebar">
               <div class="item-menu">
                  <div class="item-menu-wrap">
                    <h5>Event catagories</h5>
                    <ul class="catagory">
                      <li><a href="">children</a></li>
                      <li><a href="">classes</a></li>
                      <li><a href="">community</a></li>
                      <li><a href="">health</a></li>
                      <li><a href="">more</a></li>
                    </ul>
                  </div>  
               </div><!--  End of item-menu -->
             </aside>
           </div>
        </div>        
      </div>
    </section>
    <cfinclude template="footer.cfm" />
  </div>  
    
    <script src="scripts/vendor.js"></script>
    <script src="scripts/plugins.js"></script>
    <script src="scripts/main.js"></script>
    <cfif isdefined("session.admin") and session.admin eq "true">
        
        <script>
            
            
    toastr.options = {
  "closeButton": true,
  "debug": false,
  "newestOnTop": true,
  "progressBar": true,
  "positionClass": "toast-top-center",
  "preventDuplicates": false,
  "showDuration": "300",
  "hideDuration": "1000",
  "timeOut": "5000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
}
            
            
            // Duplicate the current page by passing in the id
          function duplicate(id,pagename){
            //jquery post to the duplicate cfm page
            $.post("duplicate.cfm",
            {
              id: id,
              page: pagename       
          },
        function(data, status){
            if (status == 'success'){
                toastr.options.onclick = function () {
                    location.href = 'pages.cfm';
                };
                var msg = "You successfully duplicated page " + id + " Click the notification to see it."
                toastr["success"](msg);
                //location.href = 'pages.cfm';
            }else{
                var msgError = "There was an error : " + status 
                toastr["error"](msgError);  
            }
        
        });
        }
            
             // Duplicate the current page by passing in the id
          function deleteme(id,pagename){
            //jquery post to the duplicate cfm page
            $.post("delete.cfm",
            {
              id: id,
              page: pagename       
          },
        function(data, status){
            if (status == 'success'){
                toastr.options.onclick = function () {
                    location.href = 'pages.cfm';
                };
                var msg = "You successfully deleted page " + id + " Click the notification to see it."
                toastr["success"](msg);
                //location.href = 'pages.cfm';
            }else{
                var msgError = "There was an error : " + status 
                toastr["error"](msgError);  
            }
        
        });
        }
        
            
            
        </script>
        
        <cfinclude template="editablefooter.cfm" />
    </cfif>
      
   </body>
</html>
