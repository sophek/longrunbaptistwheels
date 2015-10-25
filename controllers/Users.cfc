<cfcomponent extends="Controller" output="false">
	
	<!--- users/index --->
	<cffunction name="index">
		<cfset users = model("User").findAll()>
	</cffunction>
	
	<!--- users/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset user = model("User").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(user)>
	        <cfset flashInsert(error="User #params.key# was not found")>
	        <cfreturn redirectTo(action="index", delay=true)>
	    </cfif>
			
	</cffunction>
	
	<!--- users/new --->
	<cffunction name="new">
		<cfset user = model("User").new()>
	</cffunction>
	
	<!--- users/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset user = model("User").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(user)>
	        <cfset flashInsert(error="User #params.key# was not found")>
			<cfreturn redirectTo(action="index", delay=true)>
	    </cfif>
		
	</cffunction>
	
	<!--- users/create --->
	<cffunction name="create">
      <cfset IsAjax = false />
              <cfif structKeyExists(form,"username") And form.username NEQ "">
                  <cfset IsAjax = true />
              </cfif>
              <cfif structKeyExists(form,"password") And form.password NEQ "">
                  <cfset IsAjax = true />
              </cfif>
              
              <cfif IsAjax>
                  <cfset params= { 
                     user= { 
                          username=form.username , 
                          password=form.password
                          } 
                     } />
              </cfif>
        
		<cfset user = model("User").new(params.user)>
		
		<!--- Verify that the user creates successfully --->
		<cfif user.save()>
			<cfset flashInsert(success="The user was created successfully.")>
            <cfreturn redirectTo(action="index", delay=true)>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the user.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
            
    <cffunction name="QueryStringToStruct" output="false">
        <cfargument name="QueryString" required="yes" type="string">
        <cfargument name="objName" required="yes" type="string" default="user"> 
        <cfargument name="objKey" required="yes" type="string" default="">       
        <cfset myStruct = StructNew()>
        <cfset params = StructNew()>
        <cfloop list="#QueryString#" delimiters="&" index="i">
            <cfset QueryStringParts = ListToArray(i, "=")>
            <cfset structInsert(myStruct, Trim(QueryStringParts[1]),Trim(QueryStringParts[2]))>
        </cfloop>
        <cfscript> 
            params = StructNew(); 
            StructInsert(params, "key", arguments.objKey); 
            StructInsert(params, arguments.objName, myStruct); 
        </cfscript>     
        <cfreturn params />
</cffunction>        
	
	<!--- users/update --->
	<cffunction name="update">
        <cfset IsAjax = false />
        
        <cfset params = QueryStringToStruct('#form.param#','#form.objName#','#form.key#') />
        
		<cfset user = model("User").findByKey(params.key)>
		
		<!--- Verify that the user updates successfully --->
		<cfif user.update(params.user)>
			<cfset flashInsert(success="The user was updated successfully.")>	
            <cfreturn redirectTo(action="index", delay=true)>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the user.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- users/delete/key --->
	<cffunction name="delete">
		<cfset user = model("User").findByKey(params.key)>
		
		<!--- Verify that the user deletes successfully --->
		<cfif user.delete()>
			<cfset flashInsert(success="The user was deleted successfully.")>	
            <cfreturn redirectTo(action="index", delay=true)>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the user.")>
			<cfreturn redirectTo(action="index", delay=true)>
		</cfif>
	</cffunction>
	
</cfcomponent>
