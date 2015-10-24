<cfsilent>
<cfif isdefined("form.id") and trim(form.id) contains "itemProductName">
    <cfset id = replace(form.id,"itemProductName","","ALL") />
    <cfset columnnameToUpdate = "productname" />
</cfif>
<cfif isdefined("form.id") and trim(form.id) contains "itemProductShortDesc">
    <cfset id = replace(form.id,"itemProductShortDesc","","ALL") />
    <cfset columnnameToUpdate = "productShortDesc" />
</cfif>
<cfif isdefined("form.id") and trim(form.id) contains "itemProductPriceEdit">
    <cfset id = replace(form.id,"itemProductPriceEdit","","ALL") />
    <cfset columnnameToUpdate = "productPrice" />
</cfif>
<cfif isdefined("form.id") and trim(form.id) contains "itemProductLongDesc">
    <cfset id = replace(form.id,"itemProductLongDesc","","ALL") />
    <cfset columnnameToUpdate = "productDesc" />
</cfif>
<cfquery name="qry" datasource="longrun" result="qryResult">
        update products set #columnnameToUpdate# = '#form.value#' where id = #id#;
</cfquery>
</cfsilent>    
<cfoutput>#trim(form.value)#</cfoutput>
