     <form class="form-inline">
                <div class="form-group">
                  <label class="sr-only" for="page">Page Title</label>
                  <input class="form-control input-lg" type="text" placeholder="Search" id="search">
                </div>

                <div class="form-group">
                  <label class="sr-only" for="categories">Category</label>
                   <cfoutput>  
                               <select class="form-control input-lg" id="categoriesSearch">
                                   <option value="">--Select a Category--</option>
                                <cfloop query="#arguments.categories#">
                                    <option value="#id#">#categoryname#</option>
                                </cfloop>    
                               </select>
                                </cfoutput> 
                    
                <button type="button" class="btn white-btn remove" name="refresh" id="btnSearch" title="Refresh"><i class="fa fa-search">Search</i> </button>   <button type="button" class="btn white-btn remove" name="refresh" title="Refresh" id="searchToggle"><i class="fa fa-list-ol"></i>
        </button>  
                </div>
        
        
              </form>

