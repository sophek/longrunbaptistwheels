<!---
	This is the parent controller file that all your controllers should extend.
	You can add functions to this file to make them globally available in all your controllers.
	Do not delete this file.
--->

<cfcomponent extends="Wheels">
    
    <cffunction name="init">
        <cfset jsServer = "http://" & cgi.server_name & ":8500/" & cgi.script_name />
    </cffunction>
    
    <cffunction name="footer" access="private" returntype="struct">
    <cfscript> 
    footerData = StructNew(); 
    StructInsert(footerData, "address", "PO Box 410, Theodosia MO 65761"); 
    StructInsert(footerData, "phone", "417-255-5610");
    StructInsert(footerData, "email", "pastor@kingdombaptist.org");        
    </cfscript> 
        <cfreturn footerData />
    </cffunction>   
    
    <cffunction name="articleCategories" access="private" returntype="struct">
        <cfset qryCat =  model("category").findAll(select="id, categoryname")>
        
        <cfscript> 
        category = StructNew(); 
        StructInsert(category, "categories", qryCat);     
        </cfscript> 
    <cfreturn category />
    </cffunction>  
    
      <cffunction name="headertop" access="private" returntype="struct">
        <cfset qryCat =  model("category").findAll(select="id, categoryname", Order="categoryname ASC")>
        <cfset qryLayout =  model("layout").findAll(select="id, layoutname", Order="layoutname ASC")>    
        
        <cfscript> 
        category = StructNew(); 
        StructInsert(category, "categories", qryCat);
        StructInsert(category, "layouts", qryLayout);
            
        </cfscript> 
    <cfreturn category />
    </cffunction>   
            
    <cffunction name="search" access="private" returntype="struct">
        <cfset qryCat =  model("category").findAll(select="id, categoryname", Order="categoryname ASC")>
        
        <cfscript> 
        category = StructNew(); 
        StructInsert(category, "categories", qryCat);
            
        </cfscript> 
    <cfreturn category />
    </cffunction> 
        
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
            
            
    <cffunction name="checkForParam">
      <cfset IsAjax = false />
        
        <cfif structKeyExists(form,"param") AND form.param NEQ "">
            <cfset IsAjax = true />
        </cfif>
        
        <cfif structKeyExists(form,"objName") AND form.objName NEQ "">
            <cfset IsAjax = true />
        </cfif>
        
        <cfif structKeyExists(form,"key") AND form.key NEQ "">
            <cfset IsAjax = true />
        </cfif> 
        
        <cfreturn IsAjax />
    </cffunction>    
        
            
        
</cfcomponent>