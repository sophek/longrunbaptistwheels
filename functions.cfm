<cffunction name="getSnippet">
    <cfargument name="cmsURL" default="demo" />
    <cfset local.baseUrl = "http://smartpacketip-com.securec83.ezhostingserver.com/cms/">
    <cfset local.fullUrl = baseUrl & arguments.cmsURL />
    <cfhttp url="#local.fullUrl#" resolveurl="yes" result="result">
    <cfreturn result.Filecontent>
</cffunction>
        
<cfset ids=[]>
    
<cffunction name="readContent">
    <cfargument name="file" type="string" default="file" />
    <cfset thisPath = ExpandPath("*.*")> 
    <cfset thisDirectory = GetDirectoryFromPath(thisPath)>
    <cfset fullFile = thisDirectory & #arguments.file# & ".txt" />
    <cfset content = "Content goes here!" />
    <cfif fileExists(fullFile)>
        <cffile  action = "read" file = #fullFile# variable = "content" />    
    </cfif>
    <cfreturn content>    
</cffunction>
        
        
<cffunction name="makeEditable">
    <cfargument name="idname" type="string" default="file" />
    <cfargument name="txField" type="string" default="text" />
    <cfset foo = ArrayAppend(ids,"#arguments.idname#") />
    <cfif isdefined("url.edit")>
    <cfset linkString = "<a id=""#arguments.idname#"" data-type=""#arguments.txField#"" data-pk=""3"" data-placeholder=""Your comments here..."" data-title=""Enter comments"">#readContent("#arguments.idname#")#</a>" />
    <cfelse>
    <cfset linkString =  #readContent("#arguments.idname#")#>  
    </cfif>
    <cfreturn linkString />
</cffunction> 
        