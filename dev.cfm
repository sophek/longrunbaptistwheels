<cfset newuser = {
       username = "sophek@yahoo.co",
       password = "password"
       } />

<cfset params={ 
       user= { 
       username="sophek@yahoo.co" , 
       password="password" 
       },
       key = 14
    }>
    
    
    

   
    
 
    
    
<cffunction name="QueryStringToStruct" output="false">
<cfargument name="QueryString" required="yes" type="string">
<cfargument name="objName" required="yes" type="string" default="user"> 
<cfargument name="objKey" required="yes" type="string" default="">       
<cfset myStruct = StructNew()>
<cfset params = StructNew()>
<cfloop list="#QueryString#" delimiters="&" index="i">
    <cfset QueryStringParts = ListToArray(i, "=")>
    <cfset structInsert(myStruct, Trim(QueryStringParts[1]),Trim(QueryStringParts[2]))>
</cfloop>
<cfscript> 
    params = StructNew(); 
    StructInsert(params, "key", arguments.objKey); 
    StructInsert(params, arguments.objName, myStruct); 
</cfscript>     
    
<cfreturn params />
</cffunction>
    
     <cfdump var="#QueryStringToStruct('username=sophek&password=foo','user','15')#" label="" /> 