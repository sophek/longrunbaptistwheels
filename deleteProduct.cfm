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
  DELETE from products where id = <cfqueryparam  value="#form.id#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cfif>
