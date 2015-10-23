<cfset thisPath = ExpandPath("*.*")> 
<cfset thisDirectory = GetDirectoryFromPath(thisPath)> 
<cfset myOutput = "">
<cfset localFile = "">
<cfif isdefined("form.content")>
    <cfset myOutput = form.content />
    <cfset localFile = thisDirectory & form.id & ".txt" /> 
</cfif>        
<cffile action="write" addnewline="yes" file="#localFile#" output="#myOutput#" fixnewline="yes"> 
Success Sophek
    
