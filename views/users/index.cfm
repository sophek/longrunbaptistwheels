<h1>Listing users</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
	<p>#linkTo(text="New user", action="new")#</p>
</cfoutput>

<cftable query="users" colHeaders="true" HTMLTable="true">
	
					<cfcol header="Id" text="#id#" />
				
					<cfcol header="Username" text="#username#" />
				
					<cfcol header="Password" text="#password#" />
				
	<cfcol header="" text="#linkTo(text='Show', action='show', key=id)#" />
	<cfcol header="" text="#linkTo(text='Edit', action='edit', key=id)#" />
	<cfcol header="" text="#linkTo(text='Delete', action='delete', key=id, confirm='Are you sure?')#" />
</cftable>

<button id="test">test</button>

<script>
    
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
              } else {
                  toastr["error"](errorMsg);
              }
          }).fail(function(data, status, xhr) {
                toastr["error"](xhr);
                console.log(xhr)
            });
    }
    
    
    
    
    
$("#test").on('click',function(){
   var obj = {
       action : "/products/delete",
       productName : "sdfsdfd",
       productPrice : 20,
       key: 94,
       objName: "product",
       successDiv : "success"
   }
   postAjax(obj);
    
})    
    
    
$("#testsss").on('click',function(){
   var obj = {
       action : "/users/update",
       username : "sdfsdfd",
       password : "sfsdfsd",
       key: 11,
       objName: "user",
       successDiv : "success"
   }
   postAjax(obj);
    
})


$("#testdd").on('click',function(){
    
   var obj = {
       action : "/users/create",
       username : "spohektounn-new",
       password : "sophektounn",
       key: 14,
       objName: "user",
       successMsg: "The user was created successfully!",
       errorMsg: "Sorry there was something wrong with update.",
       successDiv : "success"
   }
   postAjax(obj);
    
})
</script>