<section class="store">
    
    
    
    <div class="container">
        <div class="row">
            
            <div class="wrapper clearfix">
                <aside class="content clearfix" id="store">
                    <cfoutput query="qry">
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
                                <div class="item-header clearfix"> <span class="headline-lato" id="@#productName#" contenteditable="true">#productName#</span> <span>#DollarFormat(productPrice)#</span> </div>
                                <p>#productShortDesc#</p>
                                <p><a class="btn red-btn" ><i class="fa fa-cart-plus">&nbsp;Add To Cart</i></a></p>
                            </div>
                           <div><form id="my-dropzone" action="../uploadme.cfm?imgID=#id#" title="#id#" class="dropzone"></form></div> 
                            
                            
                        </div>
                    </div>
                    </cfoutput>  
                    
                    <script>
    
                    Dropzone.options.myDropzone = {

                      init: function() {
                        this.on("complete", function(file) {
                        d = new Date();
                          //this.options.url = "/some-other-url";
                            var imgId = this.element.title;
                            var imgUrlId = "#imgProduct" + imgId;
                            var imgUrl = "../images/products/" + imgId + ".jpg" + "?" + d.getTime(); 
                            $(imgUrlId).attr("src",imgUrl);
                            this.removeFile(file);
                        });
                      }
                    };   
                </script>
                    
                    
                </aside>
                <aside class="sidebar">
                    <div class="item-menu">
                        <div class="item-menu-wrap">
                            <h5>Event catagories</h5>
                            <ul class="catagory">
                                <li><a>children</a>
                                </li>
                                <li><a>classes</a>
                                </li>
                                <li><a>community</a>
                                </li>
                                <li><a>health</a>
                                </li>
                                <li><a>more</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="item-menu">
                        <div class="item-menu-wrap">
                            <h5>Past event</h5>
                            <div class="item-wrap clearfix">
                                <div class="item-fig"> <img src="images/footer-img1.jpg" alt="image"> </div>
                                <div class="item-content">
                                    <h6><a href="#">Pastor's Bible Study</a></h6>
                                    <p>April 10, 2015</p>
                                </div>
                            </div>
                            <div class="item-wrap clearfix">
                                <div class="item-fig"> <img src="images/footer-img2.jpg" alt="image"> </div>
                                <div class="item-content">
                                    <h6><a href="#">Pastor's Bible Study</a></h6>
                                    <p>April 10, 2015</p>
                                </div>
                            </div>
                            <div class="item-wrap clearfix">
                                <div class="item-fig"> <img src="images/content3.jpg" alt="image"> </div>
                                <div class="item-content">
                                    <h6><a href="#">Pastor's Bible Study</a></h6>
                                    <p>April 10, 2015</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item-menu">
                        <div class="item-menu-wrap">
                            <h5>photo</h5>
                            <ul class="item-photo clearfix">
                                <li>
                                    <a><img src="images/photo/footer-img2.jpg" alt="image">
                                    </a>
                                </li>
                                <li>
                                    <a><img src="images/photo/footer-img1.jpg" alt="image">
                                    </a>
                                </li>
                                <li>
                                    <a><img src="images/photo/jesus.jpg" alt="image">
                                    </a>
                                </li>
                                <li>
                                    <a><img src="images/photo/jesus1.jpg" alt="image">
                                    </a>
                                </li>
                                <li>
                                    <a><img src="images/photo/content3.jpg" alt="image">
                                    </a>
                                </li>
                                <li>
                                    <a><img src="images/photo/jesus2.jpg" alt="image">
                                    </a>
                                </li>
                                <li>
                                    <a><img src="images/photo/jesus3.jpg" alt="image">
                                    </a>
                                </li>
                                <li>
                                    <a><img src="images/photo/jesus.jpg" alt="image">
                                    </a>
                                </li>
                                <li>
                                    <a><img src="images/photo/footer-img2.jpg" alt="image">
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
    </div>
</section>