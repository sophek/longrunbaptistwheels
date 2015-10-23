 <div class="menu">
        <div class="container">
          <div class="row">
            <div class="header-top-left">
              <a href="index.html" class="logo">
                <cfoutput>#imageTag('logo.png')#</cfoutput>
              </a> 
            </div>
            <div class="header-top-right">
              <nav class="navbar">
                <div class="nav-wrapper">
                  <div class="navbar-header">
                    <button type="button" class="navbar-toggle" >
                      <span class="sr-only">Toggle navigation</span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                    </button>      
                  </div>
                  <div class="overlay"></div>
                  <div class="nav-menu" >
                    <a href="#" class="close">
                      <i class="fa fa-times"></i>
                    </a>
                    <ul class="nav navbar-nav menu-bar">
                      <li class="dropdown">
                        <a href="#" class="active">Home</a>
                        <ul class="submenu">
                          <li>
                          <a href="homepage1.html">About Us</a>
                          </li>
                          <li>
                          <a href="homepage5.html">Doctrinal Statement</a>
                          </li>
                        </ul>
                      </li>
                        <li class="dropdown">
                        <a href="#" class="active">Articles</a>
                        <ul class="submenu">
                          <li>
                          <a href="homepage1.html">Kingdom</a>
                          </li>
                          <li>
                          <a href="homepage5.html">Rapture</a>
                          </li>
                          <li>
                          <a href="homepage6.html">Salvation</a>
                          </li>
                          <li>
                          <a href="homepage2.html">Hell</a>
                          </li>
                          <li>
                          <a href="homepage3.html">Proganada</a>
                          </li>
                          <li>
                          <a href="homepage4.html">One Page Event counter</a>
                          </li>
                        </ul>
                      </li>    
                      <li><a href="sermons.html">sermons</a></li>
                      <li><a href="contact_us.html">contact us</a></li>
                      <li><a href="store.html">store</a></li>
                      <cfif isdefined("session.admin") and session.admin eq "true">        
                      <li>
                        <a href="#" class="search-box-tablet" id="pageEntrybox"><i class="fa fa-plus fa-4x"></i></a>
                        <input type="text" placeholder="Search" class=" search-box-top">
                      </li>
                    </cfif>      
                    </ul>
                  </div>
                </div>  
              </nav>
            </div>  <!-- End of header right -->
          </div>
        </div>
      </div> <!-- End of menu --> 