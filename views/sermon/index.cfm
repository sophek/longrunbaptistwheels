<!--- Get the sermons for semon auido  --->  
<cfset getResult = #sermonAudioApi('BC8CAFFC-26AF-4A8F-845D-215369E9DD0A','1')# />

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
                 <i class="fa fa-microphone fa-4x"></i>
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