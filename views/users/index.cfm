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
    
    
$("#test").on('click',function(){
    
   var obj = {
       action : "/users/update",
       username : "soap",
       password : "newpassword",
       key: 14,
       objName: "user",
       successMsg: "The user was updated successfully!",
       errorMsg: "Sorry there was something wrong with update.",
       successDiv : "success"
   }
   postAjax(obj);
    
})
</script>