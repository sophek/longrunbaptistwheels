<footer>
      <div class="container">
        <div class="row">
          <div class="row left">
            <div class="why" id="why" contenteditable="<cfoutput>#editable#</cfoutput>">
              <cfoutput>#getContent("why")#</cfoutput>
            </div>
              
            <div class="pages">
              <h4>Pages</h4>
              <ul>
                <li><a href="#">About Church</a></li>
                <li><a href="#">I'm new here</a></li>
                <li><a href="#">Sermons</a></li>
                <li><a href="#">Events</a></li>
                <li><a href="#">Connect</a></li>
              </ul>
            </div>
          </div>

          <div class="row right">
            <div class="contact">
              <h4>Contact us</h4>
              <p>PO Box 410, Theodosia MO 65761</p>
              <p>417 255 5610<br />pastor@kingdombaptist.org</p>
            </div>
            <div class="recent">
              <h4>Recent Sermons</h4>
                <cfoutput>
            <cfloop index="i" from="1" to="3">    
              <div class="figure row">
                <div>
                  <img src="images/footer-img1.jpg" alt="image">
                </div>
                <div class="figcaption">
                  <h5 class="heading"><a rel="nofollow" href="http://www.sermonaudio.com/playpopup.asp?SID=#getResult[i].sermonid#" onclick="window.open (this.href, 'mediaplayer', 'width=545,height=215,left=0,top=0,scrollbars=no'); return false;" onmouseOver="window.status='Play media in flash player.'; return true" class="headline-lato">#getResult[i].title#</a><br>#getResult[i].bibletext# &nbsp;</h5>
                  <h5 class="date">#getResult[i].date#</h5>
                  
                </div>
              </div>
                </cfloop>
                </cfoutput>    
            </div>
          </div>
        </div>
      </div>
    </footer>