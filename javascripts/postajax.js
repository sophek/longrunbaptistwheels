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