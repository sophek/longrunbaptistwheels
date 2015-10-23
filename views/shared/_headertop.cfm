<div class="header-top">
        <div class="container">
          <div class="row">
         
            <div id="entrybox">
                <br />
                <form class="form-inline">
                <div class="form-group">
                  <label class="sr-only" for="page">Page Title</label>
                  <input type="text" class="form-control input-lg" id="page" placeholder="Page Title" name="page">
                </div>

                <div class="form-group">
                  <label class="sr-only" for="categories">Category</label>
                   <cfoutput>  
                               <select class="form-control input-lg" id="categories">
                                   <option value="">--Select a Category--</option>
                                <cfloop query="#arguments.categories#">
                                    <option value="#id#">#categoryname#</option>
                                </cfloop>    
                               </select>
                                </cfoutput> 
                </div>
                <div class="form-group">
                  <label class="sr-only" for="categories">Layout</label>
                   <cfoutput>  
                               <select class="form-control input-lg" id="layouts">
                                   <option value="">--Select a Layout--</option>
                                <cfloop query="#arguments.layouts#">
                                    <option value="#layoutname#">#layoutname#</option>
                                </cfloop>    
                               </select>
                                </cfoutput> 
                </div>    

                <div class="form-group">
                  <a class="btn red-btn" id="createpage" title="Submit"><i class="fa fa-location-arrow">&nbsp;Create</i></a>
                </div>
                <div class="form-group" id="success">
                  
                </div>
              </form>
                <br />
            </div>
          </div>
        </div>
      </div> <!--  End of header top   -->