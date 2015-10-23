  
<cfif structKeyExists(session,"admin") AND session.admin EQ "true">
    <!-- Set the page default form param -->
<cfparam name="form.page" default="" />

<!-- Get the file path directory -->
<cfset thisPath = ExpandPath("*.*")> 
<cfset thisDirectory = GetDirectoryFromPath(thisPath)>

<!-- Create a variable to out the output content -->    
<cfset myOutput = "">
<cfset pageTitle = "">
<cfset pageName = "">
    

<cfif form.page NEQ "">
    <cfset localFile = trim(form.page)>
    <cfset pageTitle = localFile>
    <!-- Strip out the whitespace and replace it with hypen -->    
    <cfset pageName = replace(pageTitle," ","-","ALL")>    
</cfif>    

<!-- Create the full file name to pass the file creator function -->    
<cfset localFile = thisDirectory & pageName & ".html" />
<cfsavecontent variable="myOutput">
        <article>
        <h1><cfoutput>#pageTitle#</cfoutput></h1>
        <div id="content">
            Content goes here!
        </div>    
        </article>
    </cfsavecontent>
    
<cfif form.page EQ "">
    <h1>Please enter the title of your page.</h1>
<cfelse>
    <cfif fileExists(localFile)>
    <h1>Please create another file, that file already exist!</h1>
<cfelse>
    <cfquery name="qry" datasource="longrun"  CACHEDWITHIN="#CreateTimeSpan(0, 1, 0, 0)#" result="qryResult">
        Insert into wp_posts (post_title, post_name, post_content, post_excerpt)
        Values (<cfqueryparam  value="#pageTitle#" cfsqltype="CF_SQL_VARCHAR">,<cfqueryparam  value="#pageName#" cfsqltype="CF_SQL_VARCHAR">, 'Content goes here!','Excerpt goes here!');
    </cfquery>
    <cffile action="write" addnewline="yes" file="#localFile#" output="#myOutput#" fixnewline="yes">
    <cflocation url="page_details.cfm?page_name=#pageName#" addtoken="no" />    
</cfif>
</cfif>
<cfelse>
    <cflocation url="admin/index.cfm" addToken="no" />
</cfif>