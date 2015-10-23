<!--- Get the sermons for semon auido --->        
<cfhttp url="https://www.sermonaudio.com/api/saweb_get_sermons.aspx?apikey=BC8CAFFC-26AF-4A8F-845D-215369E9DD0A&page=1&pagesize=10" method="get" result="result" /> 
<cfset getResult = deserializeJSON(result.filecontent)> 

<cfoutput>    
<footer>
      <div class="container">
        <div class="row">
          <div class="row left">
            <div class="why" id="why" contenteditable="#editable#">
              <cfoutput></cfoutput>
            </div>
              
            <div class="pages">
              <h4>Pages</h4>
              <ul>
                <li><a href="##">About Church</a></li>
                <li><a href="##">I'm new here</a></li>
                <li><a href="##">Sermons</a></li>
                <li><a href="##">Events</a></li>
                <li><a href="##">Connect</a></li>
              </ul>
            </div>
          </div>

          <div class="row right">
            <div class="contact">
              <h4>Contact us</h4>
              <p>#arguments.address#</p>
              <p>#arguments.phone#<br /><a href="mailto:#arguments.email#">#arguments.email#</a></p>
            </div>
            <div class="recent">
              <h4>Recent Sermons</h4>
               
            <cfloop index="i" from="1" to="3">    
              <div class="figure row">
                <div>
                   <i class="fa fa-microphone fa-4x"></i>
                </div>
                <div class="figcaption">
                  <h5 class="heading"><a rel="nofollow" href="http://www.sermonaudio.com/playpopup.asp?SID=#getResult[i].sermonid#" onclick="window.open (this.href, 'mediaplayer', 'width=545,height=215,left=0,top=0,scrollbars=no'); return false;" onmouseOver="window.status='Play media in flash player.'; return true" class="headline-lato">#getResult[i].title#</a><br>#getResult[i].bibletext# &nbsp;</h5>
                  <h5 class="date">#getResult[i].date#</h5>
                  
                </div>
              </div>
                </cfloop>
                    
            </div>
          </div>
        </div>
      </div>
    </footer>
</div>  
#javaScriptIncludeTag("vendor.js,plugins.js,main.js")#
</cfoutput> 
