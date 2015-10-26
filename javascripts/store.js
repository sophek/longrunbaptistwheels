
var baseUrl = "http://127.0.0.1:8500/longrunbaptistwheels/";

$("#storeItem-details").hide();


$(".detailsBtn").on('click', function (evt) {

    // Set a data param so the image won't cache.
    d = new Date();
    var imgId = evt.target.getAttribute('data-productid')
        //Get the short desc of the item clicked

    var shortDesc = $("#itemProductShortDesc" + imgId)[0].innerHTML;
    var longDesc = $("#itemProductLongDesc" + imgId)[0].innerHTML;
    //
    var itemName = $("#itemProductName" + imgId)[0].innerHTML;
    var itemPrice = $("#itemProductPrice" + imgId).val();
    var itemQtyInStock = $("#itemProductQtyInStock" + imgId).val();

    // This is to show the item details on button click.
    $("#itemProductShortDesc").html(shortDesc);
    $(".itemProductLongDesc").html(longDesc);
    $("#itemProductName").html(itemName);
    $("#itemProductPrice").html(itemPrice);


    var imgUrl = "../images/products/" + imgId + ".jpg" + "?" + d.getTime();
    $("#imgProductDetails").attr("src", imgUrl);
    $("#storeItem-details").toggle();
    $("#store").toggle();

}); 



//Create Item Product Click
    $("#createItemProduct").on('click',function(){
        createProduct();
    });

//Continue shopping button
$(".continueShoppingBtn").on('click', function (evt) {
    $("#storeItem-details").toggle();
    $("#store").toggle();
})

//Delete Product function     
    
function deleteProduct(id,productname){
           var obj = {
               action : "/products/delete",
               productName : productname,
               productPrice : 20,
               key: id,
               objName: "product",
               successDiv : "success",
               removeDiv : "#figure" + id
           }
           postAjax(obj);
    }


// Duplicate Product

function duplicateProduct(id,productname){
           var obj = {
               action : "/products/duplicate",
               productName : productname,
               productPrice : 20,
               key: id,
               objName: "product",
               successDiv : "success",
               removeDiv : "reload"
           }
           postAjax(obj);
    }


// Create Product

function createProduct(){
           var obj = {
               action : "/products/create",
               productName : $("#itemProductNameInput").val(),
               productPrice : $("#itemProductPriceInput").val(),
               productImage : "Item.jpg",
               productQtyInStock : 20,
               productShortDesc : $("#itemProductShortDescInput").val(),
               productDesc : $("#itemProductDescInput").val(),
               key: 0,
               objName: "product",
               successDiv : "success",
               removeDiv : "reload"
           };
           postAjax(obj);
    }

function updateProductFinal(){
           var obj = {
               action : "/products/update",
               productName : $("#itemProductNameInput").val(),
               productPrice : $("#itemProductPriceInput").val(),
               productImage : "Item.jpg",
               productQtyInStock : $("#itemProductQtyInStockInput").val(),
               productShortDesc : $("#itemProductShortDescInput").val(),
               productDesc : $("#itemProductDescInput").val(),
               key:$("#itemProductIdInput").val() ,
               objName: "product",
               successDiv : "success",
               removeDiv : "noremove"
           };
           postAjax(obj);
    }

function updateProduct(id){
    
    $('html, body').animate({ scrollTop: 0 }, 'slow');
    var isVisible = $( "#entrybox" ).is( ":visible" );
    if (!isVisible){
        $("#entrybox").toggle("slow");
    }
    }


//Drag and Drop Upload

 Dropzone.options.myDropzone = {
                      init: function() {
                          
                        //this.on("addedfile", function(file) { alert("Added file."); });  
                          
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



// postAjax is hte main function to interact with the server
    
    function postAjax(obj){
        
        // create the url to post to
        var fullUrl = "http://127.0.0.1:8500/longrunbaptistwheels/index.cfm" + obj.action;
        // create an object and call it params
        var params = obj;
        // serialize this object
        var str = jQuery.param( params ); 
        
        // create a variable to hold tha action status to make up for messages error and success
        var actionNameMsg = "" ;
        //this function will get the actionUrl and spit out the action ie , update, delete, and create
        function getActionURL(str){
            var actionStr = obj.action.lastIndexOf(str);
            var actionUrl = obj.action.substring(actionStr,obj.action.lenght);
            return actionUrl;
        }
        //Make the message string
        if (getActionURL('create') === 'create'){
            actionNameMsg = 'created'
        }
        
        if (getActionURL('update') === 'update'){
            actionNameMsg = 'updated'
        }
        
        if (getActionURL('delete') === 'delete'){
            actionNameMsg = 'deleted'
        }
        
        if (getActionURL('duplicate') === 'duplicate'){
            actionNameMsg = 'duplicated'
        }
        
        var successMsg = "The " + obj.objName + " was " + actionNameMsg + " successfully!"
        var errorMsg = "The " + obj.objName + " was not " + actionNameMsg + " successfully!"
        
        // Send the post request passing in the url, and the object
        $.post(fullUrl, {
              param : str,
              key: obj.key,
              objName : obj.objName
          }, //if any success or failure display that to the user via the toaster notification.       
          function (data, status) {
              if (status == 'success') {
                 toastr["success"](successMsg);
                  if (obj.removeDiv !== ''){
                      if(obj.removeDiv === 'reload'){
                           location.reload();
                      }else {
                           $(obj.removeDiv).remove();
                      }
                         
                  }
              } else {
                  toastr["error"](errorMsg);
              }
          }).fail(function(data, status, xhr) {
                toastr["error"](xhr);
                console.log(xhr)
            });
    }


$(document).ready(function() {
// Initalize data

    
    
    
      $(".edit").editable(baseUrl + 'index.cfm/products/updateJeditable', {

    type      :   'text',
    tooltip   :   'Click to edit...',
    onblur    :   'submit',
    event     :   'click',
    submitdata : function() {
   
    var colname = this;
    var columnname = $(colname).attr("data-columnname");
    var productid =  $(colname).attr("data-productid");   
           
      return {
            id : productid,
            name : columnname
            };
    }
  });
    
    
     $(".edit_area").editable(baseUrl + 'index.cfm/products/updateJeditable', {
         type : 'textarea',
         cancel: 'Cancel',
         submit: 'OK',
         indicator: '<img src="img/indicator.gif">',
         tooltip: 'Click to edit...',
         submitdata: function () {

             var colname = this;
             var columnname = $(colname).attr("data-columnname");
             var productid = $(colname).attr("data-productid");

             return {
                 id: productid,
                 name: columnname
             };
         }
     });   
    
    
    $(".updateProductbtn").on('click',function(evt){
        var id = evt.currentTarget.getAttribute('data-productid');
        console.log(evt.currentTarget.getAttribute('data-productid'));
        prepopulate(id);
        $("#createItemProduct").hide();
        
    })
    
    $("#updateItemProduct").on('click',function(evt){
        updateProductFinal();
        var id = $("#itemProductIdInput").val();
        $("#itemProductName" + id)[0].innerHTML = $("#itemProductNameInput").val();
        $("#itemProductPriceEdit" + id)[0].innerHTML =  $("#itemProductPriceInput").val(); 
        $("#itemProductShortDesc" + id)[0].innerHTML =  $("#itemProductShortDescInput").val();
        $("#itemProductLongDesc" + id)[0].innerHTML =  $("#itemProductDescInput").val();
        $("#itemProductShortDesc" + id)[0].innerHTML =  $("#itemProductShortDescInput").val();
        $("#itemProductPrice" + id).val($("#itemProductPriceInput").val());
        $("#itemProductQtyInStock" + id).val($("#itemProductQtyInStockInput").val());
    })
    
    function prepopulate(id){
        var itemName = $("#itemProductName" + id)[0].innerHTML;
        var shortDesc = $("#itemProductShortDesc" + id)[0].innerHTML;
        var longDesc = $("#itemProductLongDesc" + id)[0].innerHTML;
        var itemPrice = $("#itemProductPrice" + id).val();
        var itemQtyInStock = $("#itemProductQtyInStock" + id).val();
        
        
        $("#itemProductIdInput").val(id);
        $("#itemProductNameInput").val(itemName);
        $("#itemProductPriceInput").val(itemPrice);
        $("#itemProductShortDescInput").val(shortDesc);
        $("#itemProductDescInput").val(longDesc);   
        $("#itemProductQtyInStockInput").val(itemQtyInStock);
        
    }
    
    
});
    
   



 

    


