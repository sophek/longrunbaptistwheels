<cfcomponent output="false" mixin="global">

<cffunction name="init">
	<cfset this.version = "1.1.5,1.1.7">
	
	<cfreturn this>
</cffunction>

<cffunction name="CssGenerator" returntype="string" access="public" output="false">
    <cfset filePath = expandPath( "./css.txt" ) />
    <cfset cssLine = "" />
<cfloop
        index="line"
        file="#filePath#">
        <cfset line = replace(line,"<link href='css/","","ALL") />
        <cfset line = replace(line,"rel='stylesheet' type='text/css />'","","ALL") />
        <cfset line = replace(line,"rel='stylesheet'","","ALL") />
        <cfset line = replace(line,"'","","ALL") />
        <cfset line = replace(line,"  />","","ALL") />
        <cfset line = replace(line,"css/","","ALL") />
        <cfset line = replace(line,".css","","ALL") />
        <cfset cssLine  = cssLine & trim(line) & "," />
</cfloop>
    <cfreturn Left(cssLine,Len(cssLine)-1)>
</cffunction>

</cfcomponent>  