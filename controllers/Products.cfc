<cfcomponent extends="Controller" output="false">
	
	<!--- products/index --->
	<cffunction name="index">
		<cfset products = model("Product").findAll()>
	</cffunction>
	
	<!--- products/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset product = model("Product").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(product)>
	        <cfset flashInsert(error="Product #params.key# was not found")>
	        <cfreturn redirectTo(action="index", delay=true)>
	    </cfif>
			
	</cffunction>
	
	<!--- products/new --->
	<cffunction name="new">
		<cfset product = model("Product").new()>
	</cffunction>
	
	<!--- products/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset product = model("Product").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(product)>
	        <cfset flashInsert(error="Product #params.key# was not found")>
			<cfreturn redirectTo(action="index", delay=true)>
	    </cfif>
		
	</cffunction>
	
	<!--- products/create --->
	<cffunction name="create">
        <cfif checkForParam()>
           <cfset params = QueryStringToStruct(form.param,form.objName,form.key) />
        </cfif>
        <cfset product = model("Product").new(params.product)>
		
		<!--- Verify that the product creates successfully --->
		<cfif product.save()>
			<cfset flashInsert(success="The product was created successfully.")>
            <cfreturn redirectTo(action="index", delay=true)>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the product.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- products/update --->
	<cffunction name="update">
        <cfif checkForParam()>
            <cfset params = QueryStringToStruct(form.param,form.objName,form.key) />
        </cfif>
        
		<cfset product = model("Product").findByKey(params.key)>
		
		<!--- Verify that the product updates successfully --->
		<cfif product.update(params.product)>
			<cfset flashInsert(success="The product was updated successfully.")>	
            <cfreturn redirectTo(action="index", delay=true)>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the product.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- products/delete/key --->
	<cffunction name="delete">
        <cfif checkForParam()>
                <cfset params = QueryStringToStruct(form.param,form.objName,form.key) />
        </cfif>
        
		<cfset product = model("Product").findByKey(params.key)>
		
		<!--- Verify that the product deletes successfully --->
		<cfif product.delete()>
			<cfset flashInsert(success="The product was deleted successfully.")>	
            <cfreturn redirectTo(action="index", delay=true)>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the product.")>
			<cfreturn redirectTo(action="index", delay=true)>
		</cfif>
	</cffunction>
            
    <cffunction name="duplicate">
        <cfif checkForParam()>
                <cfset params = QueryStringToStruct(form.param,form.objName,form.key) />
        </cfif>    
        <cfset product = model("Product").findByKey(params.key)>
        <cfset duplicateOfProduct = product.clone(recurse=false) />
	</cffunction>
	
</cfcomponent>
