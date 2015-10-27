<cfoutput>#session.food#</cfoutput>
<cfoutput>
    
    <cfquery name="test" datasource="longrun">INSERT INTO Food (foodname) Values ('#session.food#')</cfquery>

</cfoutput>    
