<cfcomponent extends="Controller" output="false">
	
	<!--- posts/index --->
	<cffunction name="index">
		<cfset posts = model("Post").findAll()>
	</cffunction>
	
	<!--- posts/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset post = model("Post").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(post)>
	        <cfset flashInsert(error="Post #params.key# was not found")>
	        <cfreturn redirectTo(action="index", delay=true)>
	    </cfif>
			
	</cffunction>
	
	<!--- posts/new --->
	<cffunction name="new">
		<cfset post = model("Post").new()>
	</cffunction>
	
	<!--- posts/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset post = model("Post").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(post)>
	        <cfset flashInsert(error="Post #params.key# was not found")>
			<cfreturn redirectTo(action="index", delay=true)>
	    </cfif>
		
	</cffunction>
	
	<!--- posts/create --->
	<cffunction name="create">
		<cfset post = model("Post").new(params.post)>
		
		<!--- Verify that the post creates successfully --->
		<cfif post.save()>
			<cfset flashInsert(success="The post was created successfully.")>
            <cfreturn redirectTo(action="index", delay=true)>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the post.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- posts/update --->
	<cffunction name="update">
		<cfset post = model("Post").findByKey(params.key)>
		
		<!--- Verify that the post updates successfully --->
		<cfif post.update(params.post)>
			<cfset flashInsert(success="The post was updated successfully.")>	
            <cfreturn redirectTo(action="index", delay=true)>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the post.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- posts/delete/key --->
	<cffunction name="delete">
        <cfif checkForParam()>
                    <cfset params = QueryStringToStruct(form.param,form.objName,form.key) />
                </cfif>
		<cfset post = model("Post").findByKey(params.key)>
		
		<!--- Verify that the post deletes successfully --->
		<cfif post.delete()>
			<cfset flashInsert(success="The post was deleted successfully.")>	
            
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the post.")>
			
		</cfif>
	</cffunction>
	
</cfcomponent>
