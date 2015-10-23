<cfcomponent extends="Controller">
    <cfset title="Title" />
    <cffunction name="index">
        <cfset time = Now()>
        <cfset pageTemplate = "page.cfm">
    </cffunction>
            
    <cffunction name="article"> 
        <cfset qry = model("wp_post").findOne(select="post_mime_type, post_name, post_content,post_title", where="post_name='#params.key#'", returnAs="query")>
        <cfset editable = "true" />    
        <cfset renderPage(layout="#qry.POST_MIME_TYPE#")>               
</cffunction>        
            
</cfcomponent>