<cfset currentId = model("product").maximum("id")>
<cfset currentId = currentId + 1>
    
<div class="header-top">
        <div class="container">
          <div class="row">
            <div id="entrybox">
                <br />
                <div class="form-inline">
                <div class="form-group">
                  <label for="itemProductNameInput">Item Name</label><br />
                  <input type="text" class="form-control input-lg" id="itemProductNameInput" placeholder="Item Name" name="itemProductNameInput">
                    <cfoutput>
                        <input type="hidden"  id="itemProductIdInput" placeholder="Item Name" name="itemProductIdInput" value="#currentId#">
                    </cfoutput>    
                </div>
                <div class="form-group">
                  <label for="itemProductPriceInput">Item Price</label><br />
                  <input type="text" class="form-control input-lg col-sm" id="itemProductPriceInput" placeholder="Item Price" name="itemProductPriceInput">
                </div>
                     <div class="form-group">
                  <label for="itemProductQtyInStockInput">Item Qty. InStock</label><br />
                  <input type="text" class="form-control input-lg" id="itemProductQtyInStockInput" placeholder="Item Price" name="itemProductQtyInStockInput">
                </div>
                <div class="form-group">
                  <label for="itemProductShortDescInput">Item Short Description</label><br />
                  <input type="text" class="form-control input-lg" id="itemProductShortDescInput" placeholder="Item Short Description" name="itemProductShortDescInput">
                </div>
                <div class="form-group">
                  <label for="itemProductDescInput">Item Long Description</label><br />
                  <input type="text" class="form-control input-lg" id="itemProductDescInput" placeholder="Item Long Description" name="itemProductDescInput">
                </div>    
                <div class="form-group">
                  <label for="itemProductDescInput">Item Image</label><br />
                    <cfoutput>
                       <form id="my-dropzone2" action="../uploadme.cfm?imgID=#currentId#" title="#currentId#" class="dropzone"></form>
                    </cfoutput>    
                </div>    
                
                <div class="form-group">
                  <a class="btn red-btn" id="createItemProduct" title="Submit"><i class="fa fa-location-arrow">&nbsp;Create</i></a>
                </div>
                    
                <div class="form-group" id="success">
                  
                </div>
              </div>
                
                
                <br />
            </div>
          </div>
        </div>
      </div> <!--  End of header top   -->