<cfset postTitle = trim(form.postTitle) />
<cfset AtSign = Left(postTitle,1) />
<cfset postName = postTitle />
<cfif AtSign eq "@">
<cfset postName = Right(postTitle,len(postTitle)-1) />
</cfif>
<cfquery name="qry" datasource="longrun" result="qryResult">
    update wp_posts 
    set post_title = '#form.postContent#', post_content = '#form.contentContent#'     
    where post_name = '#postName#';
</cfquery>
<cfoutput>#postName#</cfoutput>    

    