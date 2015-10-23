<cfset postTitle = trim(form.postTitle) />
<cfset AtSign = Left(postTitle,1) />
<cfset postName = postTitle />
<cfif AtSign eq "@">
<cfset postName = Right(postTitle,len(postTitle)-1) />
</cfif>
<cfquery name="qry" datasource="longrun" result="qryResult">
    update wp_posts 
    <cfif AtSign eq "@">
    set post_title = '#form.postContent#' 
    <cfelse>
    set post_content = '#form.postContent#'     
    </cfif>
    where post_name = '#postName#';
</cfquery>
<cfoutput>#postName#</cfoutput>    

    