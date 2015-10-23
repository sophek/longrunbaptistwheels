<!--- Load html page based on url --->
<cfparam name="url.page_name" default="welcome-to-our-new-site" />
<cfquery name="qry" datasource="longrun"  CACHEDWITHIN="#CreateTimeSpan(0, 1, 0, 0)#" result="qryResult">
  select post_name, post_title, post_excerpt from kbbackup.wp_posts LIMIT 10;
</cfquery>

<cffunction name="readContent">
    <cfargument name="file" type="string" default="file" />
    <cfset thisPath = ExpandPath("*.*")> 
    <cfset thisDirectory = GetDirectoryFromPath(thisPath)>
    <cfset fullFile = thisDirectory & #arguments.file# & ".html" />
    <cfset content = "Content goes here!" />
    <cfif fileExists(fullFile)>
        <cffile  action = "read" file = #fullFile# variable = "content" />    
    </cfif>
    <!-- Replace phone number -->    
    <cfset content = replace(content,"469-658-6046","214-213-6599","All") />
    <!-- Replace Address -->    
    <cfset content = replace(content,"700 Cordes Dr","PO Box 414","All") />
    <cfset content = replace(content,"Venus, TX. 76084","Theodosia, MO 65671","All") />
        
    <!-- Replace Kingdombaptist Church to longrun -->
    <cfset content = replace(content,"Kingdom Baptist","Longrun Baptist","All") />
    <cfset content = replace(content,"kingdombaptist.org","longrunbaptist.org","All") />
    
    <cfreturn content>    
</cffunction>

<!doctype html>
<html class="no-js" lang="">
<cfinclude template="head.cfm" />
  <body>
    <!--[if lt IE 10]>
      <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->
  <div class="page_overlay">
    <div class="loader-inner ball-scale-multiple">
      <div></div>
      <div></div>
      <div></div>
    </div>
  </div>
  <div class="wrapper-body">
    <header class="s-header">
      <div class="header-top">
        <div class="container">
          <div class="row">
            <div class="header-top-left">
              <a href="#"><i class="fa fa-facebook"></i></a>
              <a href="#"><i class="fa fa-twitter"></i></a>
              <a href="#"><i class="fa fa-vine"></i></a>
              <a href="#"><i class="fa fa-behance"></i></a>
            </div>
            <div class="header-top-right">
              <a href="#" class="top-wrap">Plan your visit</a>
              <a href="#" class="top-wrap">calender</a>
              <a href="#" class="top-wrap">donate now</a>
            </div>
          </div>
        </div>
      </div> <!--  End of header top   -->
      <cfinclude template="topmenu.cfm" />
      <div class="button-wrapper">
        <div class="container">
          <div class="row">
            <a href="#" class="btn-content">our blog</a>
          </div>
        </div>
      </div> <!-- End of Content -->
    </header>
  <!-- End of header -->

  <!-- start of store -->
    <section class="store">
      <div class="container">
        <div class="row">
           <div class="wrapper clearfix">
              <aside class="content">
                <cfoutput query="qry">
                <div class="item-holder clearfix">
                  <div class="item-image">
                    <img src="images/content/jesus-blog.jpg" alt="image">
                  </div>
                  <div class="item-container">
                    <h4><a href="page_details.cfm?file_name=#post_name#" class="headline-lato">#post_title#</a></h4>
                    <p>#Right(POST_EXCERPT,255)#...</p>
                    <a href="blog_details.html" class="btn-small btn-grey">Read more</a>
                    <ul class="wrapper-comment">
                    <li>
                      <a href="##"><i class="fa fa-pencil-square-o"></i><span>Pastor Joey Faust</span></a>
                    </li>
                    <li>
                      <a href="##"><i class="fa fa-tags"></i><span>graphics design and webdesign</span></a>
                    </li>
                    </ul>
                  </div>
                </div>
                </cfoutput>    
                
              
             </aside>
             <aside class="sidebar">
                <div class="item-menu">
                    <div class="search_box">
                      <input type="text" placeholder="search" class="searchinput">
                      <a href="#" class="search-btn"><i class="fa fa-search"></i></a>
                    </div>

                </div>
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
              <div class="item-menu">
                <div class="item-menu-wrap">
                  <h5>photo</h5>
                  <ul class="item-photo clearfix">
                    <li><a href=""><img src="images/photo/footer-img2.jpg" alt="image"></a></li>
                    <li><a href=""><img src="images/photo/footer-img1.jpg" alt="image"></a></li>
                    <li><a href=""><img src="images/photo/jesus.jpg" alt="image"></a></li>
                    <li><a href=""><img src="images/photo/jesus1.jpg" alt="image"></a></li>
                    <li><a href=""><img src="images/photo/content3.jpg" alt="image"></a></li>
                    <li><a href=""><img src="images/photo/jesus2.jpg" alt="image"></a></li>
                    <li><a href=""><img src="images/photo/jesus3.jpg" alt="image"></a></li>
                    <li><a href=""><img src="images/photo/jesus.jpg" alt="image"></a></li>
                    <li><a href=""><img src="images/photo/footer-img2.jpg" alt="image"></a></li>

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
</body>
</html>
