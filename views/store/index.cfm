
      <div class="container">
        <div class="row">
            
            <div class="wrapper clearfix">
                
                  <aside class="content contact-wrap" id="storeItem-details">
                    <div class="store-details-wrap clearfix">
                        <div class="fig-shop clearfix">
                            <aside class="fig-shop-img"> <img src="images/content/book.jpg" alt="image" id="imgProductDetails"> </aside>
                            <aside class="fig-shop-content">
                                <h4 class="headline-lato" id="itemProductName">Bundle of books</h4>
                                <h5 id="itemProductPrice">$262</h5>
                                <p class="paragraph_opensans" id="itemProductShortDesc"></p>
                                <div class="avilable-wrap clearfix">
                                    <div class="avl-wrp"> <span>availability:</span> <span>available</span> </div>
                                    <div class="avl-wrp"> <span>quality:</span> <i class="fa fa-angle-left"></i> <span>5</span> <i class="fa fa-angle-right"></i> </div> <a class="btn-small btn-red">Add to cart</a> <a class="btn-small btn-red continueShoppingBtn">Continue Shopping</a></div>
                            </aside>
                        </div>
                        <div class="tab-shop clearfix">
                            <div role="tabpanel">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Description</a>
                                    </li>
                                    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">review(0)</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane active itemProductLongDesc" id="home"></div>
                                    <div role="tabpanel" class="tab-pane" id="messages">Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </aside>
                
                
                <aside class="content clearfix" id="store">
                    <cfoutput query="qry">
                    <div class="figure" id="figure#id#">
                        <div class="item">
                            <div class="item-img">
                                <img src="../images/products/#productImage#" alt="image" id="imgProduct#id#">
                                   
                               <div class="item-cart">
                                <a>Click the plus icon to clone and trash to delete.</a>   
                                   
                                <div class="btn-group" role="group" aria-label="..." style="float:right;padding-right:10px;padding-top:10px">
                                    <p onclick="duplicateProduct('#id#','#productName#')" style="color:green"><i class="fa fa-plus fa-2x"></i>
                                    </p>
                                    <p id="removed" onclick="deleteProduct('#id#','#productName#')" style="color:red"><i class="fa fa-trash fa-2x"></i>
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
                                <button type="button" class="btn-small btn-red">Add to Cart</button>
                                <button type="button detailsBtn" class="btn-small btn-red" id="itemDetailsBtn#id#" data-productid="#id#">Details</button>
                            </div>
                            </div>
                            
                           <div><form id="my-dropzone" action="../uploadme.cfm?imgID=#id#" title="#id#" class="dropzone"></form></div> 
                        </div>
                    </div>
                    </cfoutput>  
                    
                    <button onclick="createProduct()">create product</button>
                    
                </aside>
            </div>
        </div>
    </div>

<style>
.democlass {
    color: red;
}
</style>

          