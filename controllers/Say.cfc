<cfcomponent extends="Controller">

<cffunction name="hello">
        <cfset qry = model("wp_post").findOne(select="post_mime_type, post_name, post_content,post_title", where="id=#params.key#", returnAs="query")>
        <cfset myparams = params />
        <cfset time = Now()>
        <cfset pageTemplate = "page.cfm">
        <cfset title = qry.post_name />
        <cfset article = qry.post_name />
        <cfset editable = "true" />    
            
        <cfset renderPage(layout="#qry.POST_MIME_TYPE#")>               
</cffunction>
</cfcomponent>