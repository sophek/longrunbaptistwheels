<cfset currentPage = "page_details.cfm">
<cfset pageTemplate = "page" />
<cfinclude template="editable.cfm" />
    
<cfset editable = "false" />
<cfif isdefined("session.admin") and session.admin eq "true">
    <cfset editable = "true" />
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
                <div class="row">          
                    <div id="@#url.page_name#" contenteditable="#editable#">#getContent("#url.page_name#","POST_NAME","POST_TITLE")#</div>
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
      <div class="container">
        <div class="row">
           <div class="wrapper clearfix">
              <aside class="content blog-details">
                <div class ="blog-image">
                  <img src="images/blog-details.jpg" alt="image">
                </div>
                <cfoutput>
                <div id="updateSuccess"></div>    
                <div class="about-god" id="#url.page_name#" contenteditable="#editable#">
                    #getContent("#url.page_name#","POST_NAME","POST_CONTENT")#
                 </div>
                </cfoutput>  
                <div class="social-share clearfix">
                  <div class="share-cont">
                    <i class="fa fa-share-alt"></i>
                    <span>share</span>
                  </div>
                  <div class="social-wraps clearfix">
                    <a href=""><i class="fa fa-facebook"></i></a>
                    <a href=""><i class="fa fa-twitter"></i></a>
                  </div>
                  <div>
                    
                  </div>
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
              <div class="item-menu ">
                  <div class="item-menu-wrap">
                    <h5>Past event</h5>
                    <div class="item-wrap clearfix">
                      <div class="item-fig">
                        <img src="images/footer-img1.jpg" alt="image">
                      </div>
                      <div class="item-content">
                        <h6><a href="#">Pastor's Bible Study</a></h6>
                        <p>April 10, 2015</p>
                      </div>
                    </div>
                    <div class="item-wrap clearfix">
                      <div class="item-fig">
                        <img src="images/footer-img2.jpg" alt="image">
                      </div>
                      <div class="item-content">
                        <h6><a href="#">Pastor's Bible Study</a></h6>
                        <p>April 10, 2015</p>
                      </div>
                    </div>
                    <div class="item-wrap clearfix">
                      <div class="item-fig">
                        <img src="images/content3.jpg" alt="image">
                      </div>
                      <div class="item-content">
                        <h6><a href="#">Pastor's Bible Study</a></h6>
                        <p>April 10, 2015</p>
                      </div>
                    </div>
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
    <cfinclude template="editablefooter.cfm" />
</cfif>      
      
   </body>
</html>
