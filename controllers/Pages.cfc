<cfcomponent extends="Controller">
    <cfset title="Title" />
    <cfset currentAttr = "" />
    <cfset currentValue = "" />
    <cfset pageTemplate = "Pages">
        
<cfif pageTemplate eq "homepage">
    <cfset currentAttr = "ATTRIBUTES" />
    <cfset currentValue = "VALUE" />
<cfelse>
    <cfset currentAttr = "POST_NAME" />
    <cfset currentValue = "POST_CONTENT" />
</cfif>  
    <!--- This function returns the structure id based on the value key passed to it --->
<cffunction name="getContentId">
    <cfargument name="val" default="" />
    <cfargument name="attr" default="#currentAttr#" />
    <cfreturn #ArrayOfStructsFind(arrStruct,"#arguments.attr#","#arguments.val#")# />
</cffunction>     

<!---This funciton get the value of the structrue --->
<cffunction name="getContent">
    <cfargument name="value" default="" />
    <cfargument name="attr" default="#currentAttr#" />
    <cfargument name="val" default="#currentValue#" />
    
    <cfset result = "Content Goes Here!" />
    <cftry>
        <cfset structId = getContentId(#arguments.value#,#arguments.attr#) />
        <cfset data = #arrStruct[structId][arguments.val]# />
        <cfcatch type="any">
            <cfset data = "" />
        </cfcatch>
    </cftry>
    <cfif len(data) neq 0>
        <cfset result = data />
    </cfif>
    <cfreturn result>    
</cffunction> 
    <cffunction name="index">
        <cfset serverURL = "http://" & cgi.server_name & ":8500" & cgi.script_name & "/" />
        <cfset serverURL = replace(serverUrl,"/index.cfm","","ALL") />    
        <cfset qryPageCount = model("wp_post").count() />
        <cfset qryPageCount = Int(qryPageCount/ 10)>
        <cfset qryCategory = model("category").findAll(select="id,categoryname", order="categoryname ASC")> 
    </cffunction>    
</cfcomponent>