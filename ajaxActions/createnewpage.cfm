<!--- if session admin is defined --->  
<cfif structKeyExists(session,"admin") AND session.admin EQ "true">
<cfset pageTitle = trim(form.id) />
<cfset pageName = replace(pageTitle," ","-","ALL") />    
<cfif form.id EQ "">
    <a class="btn red-btn" href="">Please Enter a Page Title</a>
<cfelse>
        <cfset newPost = model("wp_post").new()>
        <cfset newPost.post_title = "#pageTitle#">
        <cfset newPost.post_name = "#pageName#">
        <cfset newPost.post_content = "Content goes here.">
        <cfset newPost.post_excerpt = "Excerpt goes here.">
        <cfset newPost.post_date = Now()>
        <cfset newPost.save()>
<cfoutput><a class="btn red-btn" href="/page/article/#pageName#">View Page</a></cfoutput>              
</cfif>
              
</cfif>
