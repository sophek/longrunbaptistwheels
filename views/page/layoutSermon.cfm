<!--- Title is required --->
<cfparam name="title" type="string">
<cfset editable = "true" />
   
    
<!--- Get the sermons for semon auido --->        
<cfhttp url="https://www.sermonaudio.com/api/saweb_get_sermons.aspx?apikey=BC8CAFFC-26AF-4A8F-845D-215369E9DD0A&page=1&pagesize=10" method="get" result="result" /> 
<cfset getResult = deserializeJSON(result.filecontent)>    

<!doctype html>
<html class="no-js" lang="">
    <head>
     <cfoutput>    
    <!--- Includes `stylesheets/styles.css` --->
    #styleSheetLinkTag("main,vendor")#
    #javaScriptIncludeTag("vendor/modernizr.js")#
    #javaScriptIncludeTag("https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js")#
    #javaScriptIncludeTag("//cdn.ckeditor.com/4.5.4/standard/ckeditor.js")#   
    #styleSheetLinkTag("//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css")# 
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
             <div class="row">         
                            <div id="@#qry.post_name#" contenteditable="#editable#">#qry.post_title#</div>
                </div>
            </a><br /><br />
            <div id="renamePage"><input type="checkbox" id="renamePageChk"> Rename the page?</div>
        </div>  
      </div>
    </cfoutput>    <!-- End of Content -->
    </header>
    <!-- End of header -->
   
    <!-- start of store -->
  
   <cfoutput>
    <section class="sermons">
      <div class="container">
        <div class="row">
           #includeContent()#
          </div>
        <div class="row">          
          <div class="figure-wrapper">
              <cfoutput>    
            <cfloop index="i" from="1" to="#arrayLen(getResult)#">
                 <div class="figure clearfix">
              <div class="item-figure">
                <div class="image-wrapper">
                 <img src="../../../images/faust-01.PNG" alt="image">
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
 
    <!--- Article Categories --->  
    <cfoutput>#includePartial(partial="/shared/footer")#</cfoutput>
  </div>  
      
     <cfoutput>
      #javaScriptIncludeTag("vendor.js,plugins.js,main.js")#
      #javaScriptIncludeTag("http://127.0.0.1:8500/longrunbaptistwheels/javascripts/ajaxaction.js?cfm=update.cfm&env=local")# 
      </cfoutput> 
       
      
   </body>
</html>
