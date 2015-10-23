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
<div class="figure">
                        <div class="item">
                            <div class="item-img"> <img src="../images/products/#form.id#.jpg" alt="image">
                               <div class="item-cart">
                                <div class="btn-group" role="group" aria-label="..." style="float:right;padding-right:10px;padding-top:10px">
                                    <p onclick="duplicateProduct('#id#','#productName#')" style="color:green"><i class="fa fa-plus fa-2x"></i>
                                    </p>
                                        <p onclick="deleteProduct('#id#','#productName#')" style="color:red"><i class="fa fa-trash fa-2x"></i>
                                    </p>
                                </div>
                            </div>
                            </div>
                            <div class="item-content">
                                <div class="item-header clearfix"> <span class="headline-lato" id="@#productName#" contenteditable="true">#productName#</span> <span>#DollarFormat(productPrice)#</span> </div>
                                <p>#productShortDesc#</p>
                                <p>
                                    <a class="btn red-btn" ><i class="fa fa-cart-plus">&nbsp;Add To Cart</i></a>
                                    
                                </p>
                            </div>
                           <div><form id="my-dropzone" action="../uploadme.cfm?imgID=#id#" title="#id#" class="dropzone"></form></div> 
                        </div>
                    </div> 
</cfoutput>    

