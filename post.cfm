<!---Set defaults --->
<cfparam name="form.id" default="" />
<cfparam name="form.content" default="" />
<cfparam name="form.pageurl" default="" />
<cfparam name="form.myCheckbox" default="" />

<!--- Only if content, id and url were passed --->
<cfif isdefined("form.content") and form.content neq "">
<cfif isdefined("form.pageurl") and form.pageurl neq "">
<cfif isdefined("form.id") and form.id neq "">

<cfset postTitle = trim(form.id) />
<cfset postName = replace(postTitle," ","-","ALL") />
<cfset AtSign = Left(postTitle,1) />
    
<!--- If data is coming from index.cfm ie homepage --->    
<cfif form.pageurl eq "index.cfm">
<!--- Get the data via the attributed name --->   
    
    <cfset qry = model("page").findAll(select="id, pageUrl,attributes,value", where="attributes='#postName#' AND pageUrl='#form.pageurl#'")>

           
<!--- If there is no data, go ahead and insert into the page table --->            
        <cfif qry.recordcount eq 0>
            
            <cfset newPage = model("page").new()>
            <cfset newPage.attributes = "#postName#">
            <cfset newPage.value = "#form.content#">
            <cfset newPage.pageUrl = "#form.pageurl#">
            <cfset newPage.save()>
        
            <cfelse>
                <!--- Update the record --->
            <cfset attr = model("page").findOne(where="attributes='#postName#' AND pageUrl='#form.pageurl#'")>
            <cfset attr.update(value="#form.content#")>    
                
            
        </cfif>
    <!--- if the page is not a homepage --->    
    <cfelse>
        <!---If the @ is present, remove the @ sign --->
            <cfif AtSign eq "@">
                <cfset postName = Right(postTitle,len(postTitle) - 1) />
                <cfif isdefined("form.myCheckbox") and form.myCheckbox eq "true">
                    <cfset postNameUpdate = replace(form.content," ","-","ALL") />
                    <cfset postNameUpdate = replace(postNameUpdate,"<p>","","ALL") />
                    <cfset postNameUpdate = replace(postNameUpdate,"</p>","","ALL") />
                <cfelse>
                    <cfset postNameUpdate = postName />    
                </cfif>
            <cfelse>
                <cfset postNameUpdate = postName />             
            </cfif>
            
        
        <!--- Get the data via the post_name ---> 
                    
       <cfset qry = model("wp_post").findOne(select="id,post_name, post_title, post_excerpt, post_content", where="post_name='#postName#' AND post_status='publish'", returnAs="query")>  
           
           
        <!--- If there is no data, go ahead and insert into the page table --->      
        <cfif qry.recordcount eq 0>
            <cfquery name="qry" datasource="longrun" result="qryResult">
                Insert into wp_posts (post_title,post_name,post_content,post_excerpt)
                Values(<cfqueryparam  value="#postName#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam  value="#form.content#" cfsqltype="CF_SQL_VARCHAR">);
            </cfquery>
            <cfelse>
                
            <cfset post = model("wp_post").findOne(select="id,post_name, post_title, post_excerpt, post_content", where="post_name='#postName#' AND post_status='publish'")> 
            <cfset post.update(post_name="#LCase(trim(postNameUpdate))#")>  
                
                
            <cfif AtSign eq "@">
                <cfset postTitle = "#form.content#">
                <cfset postTitle = replace(postTitle,"<p>","","ALL") />
                <cfset postTitle = replace(postTitle,"</p>","","ALL") />
                <cfset post.update(post_title="#postTitle#")>    
            <cfelse>
                <cfset post.update(post_content="#form.content#")> 
            </cfif> 
                
                <cfquery name="qry" datasource="longrun" result="qryResult">
                    update wp_posts set post_title = 'sophek' where id = 3338;
                </cfquery>
                <!---Redirect to new page if the pageName was changed --->       
        </cfif>
    </cfif>
    
</cfif>
</cfif>
</cfif>                

    

    
    
