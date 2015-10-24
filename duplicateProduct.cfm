<cfparam name="form.id" default="1">
<cfif IsDefined("session.duplicateCounter")>
  <cfset session.duplicateCounter = #SESSION.duplicateCounter# + 1>
<cfelse>
  <cfset session.duplicateCounter = 1>
</cfif>    
<!--- Set a session to keep tracker of how many duplicates there are --->    
<cfif isdefined("form.id") and form.id neq "">
<!--- Increase the counter by 1 --->    
<!--- Insert into the db and concat the counter --->    
   <cfquery name="qry" datasource="longrun" result="qryResult">
    INSERT INTO products (productName,productPrice,productDesc,productQtyInStock,productImage,productShortDesc) SELECT CONCAT(productName,'-','#session.duplicateCounter#') AS productName ,
       productPrice,productDesc,productQtyInStock,productImage,productShortDesc
       FROM products where id = <cfqueryparam  value="#form.id#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cfif>
    
 <cfset order = model("product").findOne(order="id DESC", returnAs="query")>
<cfoutput query="order"> 
    <div class="figure" id="figure#id#">
                        <div class="item">
                            <div class="item-img">
                                <img src="../images/products/#id#.jpg" alt="image" id="imgProduct#id#">
                                   
                               <div class="item-cart">
                                <a>Click the plus icon to clone and trash to delete.</a>   
                                   
                                <div class="btn-group" role="group" aria-label="..." style="float:right;padding-right:10px;padding-top:10px">
                                    <p onclick="duplicateProduct('#id#','#productName#')" style="color:green"><i class="fa fa-plus fa-2x"></i>
                                    </p>
                                    <p id="remove" onclick="deleteProduct('#id#','#productName#')" style="color:red"><i class="fa fa-trash fa-2x"></i>
                                    </p>
                                </div>
                            </div>
                            </div>
                            <div class="item-content">
                                <div class="item-header clearfix"> <span class="headline-lato edit" id="itemProductName#id#">#productName#</span> <span id="itemProductPriceEdit#id#" class="edit">#productPrice#</span> </div>
                                <p id="itemProductShortDesc#id#" class="edit_area">#productShortDesc#</p>
                                <div id="itemProductLongDesc#id#" class="edit_area">#productDesc#</div>
                                <input type="hidden" id="itemProductPrice#id#" value="#productPrice#" />
                                <input type="hidden" id="itemProductQtyInStock#id#" value="#productQtyInstock#" />
                                
                                <div class="btn-group">
                                <button type="button" class="btn-small btn-red" id="">Add to Cart</button>
                                <button type="button" class="btn-small btn-red" id="itemDetailsBtn#id#" data-productid="#id#">Details</button>
                            </div>
                            </div>
                            
                            <div>
                                <form id="my-dropzone" action="../uploadme.cfm?imgID=#id#" title="#id#" class="dropzone dz-clickable"><div class="dz-default dz-message"><span>Drop files here to upload</span></div></form></div>
                        </div>
                    </div>
</cfoutput>    
         

