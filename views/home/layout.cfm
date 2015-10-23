<!--- Title is required --->
<cfparam name="title" type="string">

<cfset currentPage = "index.cfm">
<cfset pageTemplate = "homepage" />
<cfset editable = "false" />
<cfif isdefined("session.admin") and session.admin eq "true">
    <cfset editable = "true" />
</cfif>    

<!--- Get the sermons for semon auido  --->  
<cfset getResult = #sermonAudioApi('BC8CAFFC-26AF-4A8F-845D-215369E9DD0A','2')# />
    
<!doctype html>
<html class="no-js" lang="">
    <cfoutput>    
    <!--- Includes `stylesheets/styles.css` --->
    #styleSheetLinkTag("main,vendor")#
    #javaScriptIncludeTag("vendor/modernizr.js")#
    #javaScriptIncludeTag("https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js")#
    #javaScriptIncludeTag("ckeditor3/ckeditor.js")#   
    #styleSheetLinkTag("//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css")# 
    #javaScriptIncludeTag("//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js")#        
        
 </cfoutput>
  <body>
    <!--[if lt IE 10]>
      <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->

  <div class="wrapper-body">  
    <div class="sliders">
      <div class="image-slider"><img src="images/background/header_background.jpg" alt="image"></div>
    </div> 
    <header>
     <cfoutput>#includePartial(partial="/shared/headertop")#</cfoutput>
     <cfoutput>#includePartial(partial="/shared/topmenu")#</cfoutput>
        
    <cfoutput>    
      <div class="content">
        <div class="container">
          <div class="row">
            <div class="header-top-left"></div>
            <div class="header-top-right">
              <h2 id="longrunbaptist-title" contenteditable="#editable#">#getContent("longrunbaptist-title")#</h2>
              <p id="bibleverse" contenteditable="#editable#">#getContent("bibleverse")#</p>          
              <a href="" class="btn red-btn">join us</a>
            </div>
          </div>
        </div>  
      </div>
    </cfoutput>    <!-- End of Content -->
    </header>
    <a href="#" id="scrollUp"></a>
    <!-- End of header -->
    <section class="event"  >
      <div class="container">
        <div class="row"> 
          <figure class="left-fig clearfix">
            <div class="left-fig-img">
              <i class="fa fa-calendar"></i>
            </div>
            <div class="left-fig-content">
              <h5>upcoming Event</h5>
              <h6>next</h6>
              
            </div>
          </figure>
          <ul class="right-fig js-countdown clearfix">
            <li>
              <h5>Pastor's Bible Study</h5>
              <h6>23 March, 2015</h6>
            </li>
            <li class="days">
              <span class="count"></span>
              <span>days</span>
            </li>
            <li class="hours">
              <span class="count"></span>
              <span>hrs</span>
            </li>
            <li class="minutes">
              <span class="count"></span>
              <span>min</span>
            </li> 
            <li class="seconds">
              <span class="count"></span>
              <span>sec</span>
            </li>             
            <li>
              <a href="#" class="btn red-btn">all events</a>
            </li>
          </ul>
        </div>
      </div>
    </section>
    <!-- End of event secton -->
    <cfoutput>
    <section class="content-wrap">
      <div class="container">
        <div class="row">
          <div class="fig-content">
            <div class="content-items">
              <img src="images/welcome/item.jpg" alt="image">
            </div>
            
          </div>
          <div class="figcaption-content">
              
            <h3 id="sampleTitle" contenteditable="#editable#">#getContent("sampleTitle")#</h3>
            <div id="intro-desc" contenteditable="true">
              #getContent("intro-desc")#
            </div>  
          </div>       
        </div>
      </div>
    </section>
    </cfoutput>    
      <!-- End of content wrap section -->
    <section class="about">
      <div class="container">
        <div class="line-heading">
          <h3 id="who-we-are-title" contenteditable="true"><cfoutput>#getContent("who-we-are-title")#</cfoutput></h3>        
        </div>
        <div class="row">          
          <div>
            <div class="col-md-4">
              <div class="figcaption clearfix">
                <div class="item">
                  <img src="images/about/item1.jpg" alt="image"><br /><br />
                </div>
                <div class="item-container">
                  <h4 class="headline-lato" id="what-we-do" contenteditable="true"><cfoutput>#getContent("what-we-do")#</cfoutput></h4>
                   <p id="what-we-do-desc" contenteditable="true"><cfoutput>#getContent("what-we-do-desc")#</cfoutput></p>
                  <a href="#" class="red-readmore">read more</a>
                </div>
              </div>
            </div>
            <div class="col-md-4" >
              <div class="figcaption clearfix">
                <div class="item">
                  <img src="images/about/item2.jpg" alt="image"><br /><br />
                </div>
                <div class="item-container">
                  <h4 class="headline-lato" id="our-vision" contenteditable="true"><cfoutput>#getContent("our-vision")#</cfoutput></h4>
                  <p id="our-vision-desc" contenteditable="true"><cfoutput>#getContent("our-vision-desc")#</cfoutput></p>
                  <a href="#" class="red-readmore">read more</a>
                </div>
              </div>
            </div>
            <div class="col-md-4" >
              <div class="figcaption clearfix">
                <div class="item">
                  <img src="images/about/item3.jpg" alt="image"><br /><br />
                </div>
                <div class="item-container">
                  <h4 class="headline-lato" id="join-us" contenteditable="true"><cfoutput>#getContent("join-us")#</cfoutput></h4>
                  <p id="join-us-desc" contenteditable="true"><cfoutput>#getContent("join-us-desc")#</cfoutput></p>
                  <a href="#" class="red-readmore">read more</a>
                </div>
              </div>
            </div>
          </div>  
        </div>
      </div>
    </section>
      <!-- end of about section -->  
     
 <cfoutput>
    <section class="sermons">
      <div class="container">
        <div class="line-heading">
            <h3 id="our-latest-sermons" contenteditable="#editable#">#getContent("our-latest-sermons")#</h3>
        </div>
        <div class="row">          
          <div class="figure-wrapper">
              <cfoutput>    
            <cfloop index="i" from="1" to="#arrayLen(getResult)#">
                 <div class="figure clearfix">
              <div class="item-figure">
                <div class="image-wrapper">
                 <img src="images/content/fig1.jpg" alt="image">
                </div>                 
              </div>
              <div class="item-content">
                <h4>
                    <a rel="nofollow" href="http://www.sermonaudio.com/playpopup.asp?SID=#getResult[i].sermonid#" onclick="window.open (this.href, 'mediaplayer', 'width=545,height=215,left=0,top=0,scrollbars=no'); return false;" onmouseOver="window.status='Play media in flash player.'; return true" class="headline-lato">#getResult[i].title#</a><br>#getResult[i].bibletext# &nbsp;</h4>
                <span>#getResult[i].date#<br><a rel="nofollow" href="http://www.sermonaudio.com/playpopup.asp?SID=#getResult[i].sermonid#" onclick="window.open (this.href, 'mediaplayer', 'width=545,height=215,left=0,top=0,scrollbars=no'); return false;" onmouseOver="window.status='Play media in flash player.'; return true" class="zoom"><i class="fa fa-play" style="color:red;width:100">&nbsp;Play</i></a></span> 
                <span>By: #getResult[i].speaker#</span>
               </div>
            </div> 
            </cfloop>
            </cfoutput>
          </div> 
        </div>        
      </div>
    </section>
    </cfoutput> 
    
    <!--- Donation Section --->
    <cfoutput>  
    <section class="donation">      
      <div class="container">
        <div class="line-heading">
          <h3 id="@urgent-donation" contenteditable="#editable#">#getContent("urgent-donation")#</h3>
        </div>
       
        <a class="prev-btn"> 
          <img src="images/left-arrow.jpg" alt="image">
        </a>
        <a class="next-btn"> 
          <img src="images/right_arrow.jpg" alt="image">
        </a>       
        <div class="slider-donation clearfix">
          <div class="figure-wrapper clearfix">
            <div class="item-holder clearfix">
              <div class="item-fig">
                <img src="images/content/donation1.jpg" alt="image">
                <a href="https://www.sermonaudio.com/secure/paydonate.asp?sourceid=kingdombaptist" onclick="window.open (this.href, 'donate', 'width=700,height=690,left=0,top=0,scrollbars=no'); return false;" onmouseOver="window.status='Support this broadcaster'; return true" class="btn btn-white">Donate now</a>
              </div>
              <div class="item-content">
                <h4 id="donation-title" contenteditable="#editable#">#getContent("donation-title")#</h4>
                <div id="donation-desc" contenteditable="#editable#">#getContent("donation-desc")#</div>
              </div> <!-- End of item content -->
            </div> <!-- End of item holder -->
          </div> <!-- End of figure wrap -->
        </div>  <!-- End of slider donation -->
      </div> <!-- End of container -->    
    </section>        
</cfoutput>
<cfoutput>#includePartial(partial="/shared/footer")#</cfoutput>    
<cfif isdefined("session.admin") and session.admin eq "true">
    <cfoutput>
      #javaScriptIncludeTag("editable")#
    </cfoutput> 
</cfif>  
      
</body>
</html>
