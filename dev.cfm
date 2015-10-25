<cfset str="productName=Newest+Itme&productDesc=How+are+you+today" />

<cfoutput> 
    #REReplace(str,"[\\+]"," ","ALL")#<BR> 
</cfoutput>
    
    
    
         <cffunction name="QueryStringToStruct" output="false">
        <cfargument name="QueryString" required="yes" type="string">
        <cfargument name="objName" required="yes" type="string" default="user"> 
        <cfargument name="objKey" required="yes" type="string" default="">       
        <cfset myStruct = StructNew()>
        <cfset params = StructNew()>
        <cfloop list="#QueryString#" delimiters="&" index="i">
            <cfset QueryStringParts = ListToArray(i, "=")>
            <cfset eString = Trim(QueryStringParts[2]) />    
            <cfset structInsert(myStruct, Trim(QueryStringParts[1]),REReplace(eString,"[\\+]"," ","ALL"))>
        </cfloop>
        <cfscript> 
            params = StructNew(); 
            StructInsert(params, "key", arguments.objKey); 
            StructInsert(params, arguments.objName, myStruct); 
        </cfscript>     
        <cfreturn params />
</cffunction>
            
            
            <cfdump var="#QueryStringToStruct(str,'user',7)#" />