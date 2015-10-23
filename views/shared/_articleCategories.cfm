        <aside class="sidebar">
               <div class="item-menu">
                  <div class="item-menu-wrap">
                    <h5>Article catagories</h5>
                    <cfoutput>  
                    <ul class="catagory">
                    <cfloop query="#arguments.categories#">    
                      <li><a href="#id#">#categoryname#</a></li>
                    </cfloop>    
                    </ul>
                    </cfoutput>    
                  </div>  
               </div><!--  End of item-menu -->
             </aside>