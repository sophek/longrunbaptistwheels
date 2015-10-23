<cfparam name="form.id" default=""> 
<cfif isdefined("session.admin") and session.admin eq "true">   
<cfif isdefined("form.id") and form.id neq "">  
    
    <!---
   <cfquery name="qry" datasource="longrun" result="qryResult">
    DELETE wp_posts FROM wp_posts where id = <cfqueryparam  value="#form.id#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    --->
  <cfset aPost = model("wp_post").findOne(select="id", where="id=#form.id#")>
  <cfset aPost.delete()>
       
</cfif>
<cfelse>
    <cflocation url ="/admin/index.cfm" addToken="no" />          
</cfif>

    