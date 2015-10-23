<cfcomponent extends="Controller">
    <cfset title="Title" />
    <cffunction name="index">
        <cfset time = Now()>
        <cfset qry = model("product").findAll()>    
    </cffunction>    
</cfcomponent>