<cfcomponent output="false" mixin="global">

<cffunction name="init">
	<cfset this.version = "1.1.5,1.1.7">
	
	<cfreturn this>
</cffunction>

<cffunction name="sermonAudioApi" returntype="any" access="public" output="false">
    <!--- BC8CAFFC-26AF-4A8F-845D-215369E9DD0A --->
    <cfargument name ="api" default="BC8CAFFC-26AF-4A8F-845D-215369E9DD0A" />
    <cfargument name ="page" default="1" />
    <cfargument name ="pagesize" default="10" />
    <cfset fullUrl = "https://www.sermonaudio.com/api/saweb_get_sermons.aspx?apikey=" & arguments.api & "&page=#arguments.page#&pagesize=#arguments.pagesize#" />   
	<cfhttp url="#fullUrl#" method="get" result="result" /> 
    <cfset getResult = deserializeJSON(result.filecontent)>
    <cfreturn getResult />    
</cffunction>

</cfcomponent>        
        
        
       