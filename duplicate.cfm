<cfparam name="form.id" default="1">
<cfif IsDefined("session.duplicateCounter")>
  <cfset session.duplicateCounter = #SESSION.duplicateCounter# + 1>
<cfelse>
  <cfset session.duplicateCounter = 1>
</cfif>    
<!--- Set a session to keep tracker of how many duplicates there are --->    
<cfif isdefined("form.id") and form.id neq "">
<!--- Increase the counter by 1 --->    
<!--- Insert into the db and concat the counter --->    
   <cfquery name="qry" datasource="longrun" result="qryResult">
    INSERT INTO wp_posts (post_name,post_title,post_content,post_status,post_excerpt) SELECT CONCAT(post_name,'-','#session.duplicateCounter#') AS post_name ,CONCAT(post_title,'-','copy') AS  post_title,post_content,post_status,post_excerpt FROM wp_posts where id = <cfqueryparam  value="#form.id#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cfif>

<cfset highestTr = model("wp_post").maximum("id") /> 
<cfoutput>tr#highestTr#</cfoutput>
