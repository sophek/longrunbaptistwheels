<!--- if session admin is defined --->  
<cfif structKeyExists(session,"admin") AND session.admin EQ "true">
<cfset pageTitle = trim(form.id) />
<cfparam name="form.catid" default="" />
<cfparam name="form.layoutid" default="" />      
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
        <cfset newPost.categoryid = form.catid>
        <cfset newPost.post_mime_type = form.layoutid>      
        <cfset newPost.save()>
<cfoutput><a class="btn red-btn" href="/longrunbaptistwheels/index.cfm/page/article/#pageName#"><i class="fa fa-external-link">&nbsp;View</i></a></cfoutput>              
</cfif>           
</cfif>
