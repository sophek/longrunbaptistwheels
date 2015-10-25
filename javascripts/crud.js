var scripts = document.getElementsByTagName('script');
var myScript = scripts[ scripts.length - 1 ];
var queryString = myScript.src.replace(/^[^\?]+\??/,'');
var params = parseQuery( queryString );

function parseQuery ( query ) {
   var Params = new Object ();
   if ( ! query ) return Params; // return empty object
   var Pairs = query.split(/[;&]/);
   for ( var i = 0; i < Pairs.length; i++ ) {
      var KeyVal = Pairs[i].split('=');
      if ( ! KeyVal || KeyVal.length != 2 ) continue;
      var key = unescape( KeyVal[0] );
      var val = unescape( KeyVal[1] );
      val = val.replace(/\+/g, ' ');
      Params[key] = val;
   }
   return Params;
}

var baseUrl = "";
if (params.env === 'local'){
    baseUrl = 'http://127.0.0.1:8500/longrunbaptistwheels/';
}else{
    baseUrl = 'http://www.longrunbaptist.org/'; 
}

//List Pages

$( document ).ready(function() {
    
//Create product
    
    $("#createItemProduct").on('click',function(){
        alert("create product");
        createProduct();
    })
    
    
    
   function postAjax(obj){
        
        // create the url to post to
        var fullUrl = "http://127.0.0.1:8500/longrunbaptistwheels/index.cfm" + obj.action;
        // create an object and call it params
        var params = obj;
        // serialize this object
        var str = jQuery.param( params ); 
        
        $.post(fullUrl, {
              param : str,
              key: obj.key,
              objName : obj.objName
          },
          function (data, status) {
              if (status == 'success') {
                 toastr["success"](obj.successMsg);  
              } else {
                  toastr["success"](obj.errorMsg);
              }
          });
    }    
   
    
//DonePageEdit Button

//Hide on load
    
$("#donePageEdit").hide();    
    
    $("#donePageEdit").on('click',function(){
       var isVisible = $( "#pageTitleEdit" ).is( ":visible" );
      if (isVisible){
           $( "#pageTitleEdit" ).toggle();
           $( "#pageContentEdit" ).toggle();
           $( "#headings" ).toggle();
           $( "#pagesTable" ).toggle();
           $("#donePageEdit").hide();
          loadPages();
       }
       
    })
    
 //fresh the page
  loadPages();
    
//init all applicable functions    
  deletePage();
  
  $("#input-search-btn").on('click',function(){
        search(); 
    })
     
});

//Loading pages
function loadPages(){
    var myUrl = baseUrl + "listofpages.cfm"; 
    $.get( myUrl, function( data ) {
      $( "#headings" ).html( data );
    }); 
}

function deletePage()
{
     $('#examplePositionCenter').on('show.bs.modal', function (event) { // id of the modal with event
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var productid = button.data('productid') // Extract info from data-* attributes
      var pagename = button.data('pagename')
	  var title = 'Confirm Delete #' + pagename
	  var content = 'Are you sure want to delete ' + pagename + '?'
	  
	  // Update the modal's content.
	  var modal = $(this)
	  modal.find('.modal-title').text(title)
	  modal.find('.modal-body').text(content)	  

      $(".btn-primary").on('click',function(){
           deleteme(productid,pagename);
        });
	})    
}


//Update pages based on pagination

function pageme(){
     var pagenumber = $("#pagenum").val();
     var myUrl = baseUrl + "listofpages.cfm"; 
      $.post(myUrl, {
              pagenum: pagenumber
          },
          function (data, status) {
              if (status == 'success') {
                 var msg = "Cateogry was changed to " + pagenumber;
                    toastr["success"](msg);
                  $( "#headings" ).html( data );
              } else {
                  toastr["error"](status);
              }
          });
        }


//Filter by page Category

function filterbyCategory(){
     var categoryid = $("#selectCategory").val();
     var myUrl = baseUrl + "listofpages.cfm"; 
      $.post(myUrl, {
              categorynum: categoryid
          },
          function (data, status) {
              if (status == 'success') {
                  $( "#headings" ).html( data );
              } else {
                  toastr["error"](status);
              }
          });
        }

// Update the cateogry based by on the dropdown
function updateCat(pageid){
     var catid = "#selectCategory" + pageid;
     var category = $(catid).val();
     var categoryName = $(catid + " :selected").text();
     var myUrl = baseUrl + "updateCategory.cfm"; 
     var mypage = pageid;
    
    console.log(category + " " + mypage + categoryName);
      $.post(myUrl, {
              id: category,
              page: mypage
          },
          function (data, status) {
              if (status == 'success') {
                 var msg = "Cateogry was changed to " + categoryName;
                    toastr["success"](msg);
              } else {
                  toastr["error"](status);
              }
          });
        }


// End Updating Category



//Delete CRUD


function search(){
 var myUrl = baseUrl + "listofpages.cfm"; 
 var qry = $("#search").val(); 
    
    
$("#search")    
            $.post(myUrl,
            {
              q: qry,
              page: "pagename"      
          },
        function(data, status){
            if (status == 'success'){
                $( "#headings" ).html( data );
                var msg = "You successfully duplicated page " + pagename + " Click the notification to see it.";
                toastr["success"](msg);
            }else{
                var msgError = "There was an error : " + status;
                toastr["error"](msgError);  
            }
        
        });
}


//AddToCart Function


function deleteme(id, pagename) {
    var myUrl = baseUrl + "delete.cfm";
    
    var mypage = pagename;
      $.post(myUrl, {
              id: id,
              page: pagename
          },
          function (data, status) {
              if (status == 'success') {
                  var msg = "You successfully deleted page " + mypage;
                  toastr["success"](msg);
                  loadPages();
              } else {
                  var msgError = "There was an error : " + status
                  toastr["error"](msgError);
              }
          });
        }


function duplicateProduct(id,pagename){
           var myUrl = baseUrl + "duplicateProduct.cfm"; 
            $.post(myUrl,
            {
              id: id,
              page: pagename      
          },
        function(data, status){
            if (status == 'success'){
                var msg = "You successfully duplicated a product";
                toastr["success"](msg);
                //redirect to the same page page.
                //$("#store").append(data);
                location.reload();
            }else{
                var msgError = "There was an error : " + status;
                toastr["error"](msgError);  
            }
        
        });
    }

//


function createProduct(){
   
           var myUrl = baseUrl + "createProduct.cfm"; 
            $.post(myUrl,
            {
              productName: "Item 1",
              productPrice: 20.00,
              productImage: "Item1.jpg",
              productDesc: "Long Description",
              productShortDesc: "Short Desc",
              productQtyInStock: 10,    
                  
          },
        function(data, status){
            if (status == 'success'){
                var msg = "You successfully created a product";
                toastr["success"](msg);  
                 
            }else{
                var msgError = "There was an error : " + status;
                toastr["error"](msgError);  
            }
        
        });
    }


function deleteProduct(id,pagename){
   
           //var myUrl = baseUrl + "deleteProduct.cfm";
           var myUrl = baseUrl + "index.cfm/products/delete/" + id ; 
            $.post(myUrl,
            {
              id: id,
              page: pagename      
          },
        function(data, status){
            if (status == 'success'){
                var msg = "You successfully deleted a product";
                $("#figure" + id).remove();
                toastr["warning"](msg);  
                 
            }else{
                var msgError = "There was an error : " + status;
                toastr["error"](msgError);  
            }
        
        });
    }

// Duplicate
function duplicate(id,pagename){
           var myUrl = baseUrl + "duplicate.cfm"; 
            $.post(myUrl,
            {
              id: id,
              page: pagename      
          },
        function(data, status){
            if (status == 'success'){
                loadPages();
                var msg = "You successfully duplicated page " + pagename + " Click the notification to see it.";
                toastr["success"](msg);
            }else{
                var msgError = "There was an error : " + status;
                toastr["error"](msgError);  
            }
        
        });
    }

//Edit

   function editme(id,pagename){
       $( "#headings" ).toggle();
       $( "#pagesTable" ).toggle();
        $("#donePageEdit").toggle();
       
       var isVisible = $( "#pageTitleEdit" ).is( ":visible" );
       console.log(isVisible);
       if (!isVisible){
           $("#pageTitleEdit" ).toggle();
           $("#pageContentEdit" ).toggle();
          
       }
       
       var myUrl = baseUrl + "edit.cfm";
       var mypage = pagename;
       $.post(myUrl,
            {
              id: id,
              page: pagename       
          },
        function(data, status){
            if (status == 'success'){
                var msg = "You are editing : " + pagename;
                toastr["success"](msg); 
                //Get return data and split by id 
                var html= data;
                var newdata = $(html).find('id');
                //load the html to their respective elements.
                $("#pageTitleEdit").html(newdata.prevObject[0]);
                $("#pageContentEdit").html(newdata.prevObject[2]);
                
            }else{
                var msgError = "There was an error : " + status;
                toastr["error"](msgError);  
            }
        
        });
    }

