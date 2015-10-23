<!--- Load html page based on url --->
<cfparam name="url.page_name" default="welcome-to-our-new-site" />
<cfquery name="qry" datasource="longrun"  CACHEDWITHIN="#CreateTimeSpan(0, 1, 0, 0)#" result="qryResult">
  select post_name from kbbackup.wp_posts where post_name = '#url.page_name#';
</cfquery>


<cfdump var="#qry#" label="" /> 


<cffunction name="readContent">
    <cfargument name="file" type="string" default="file" />
    <cfset thisPath = ExpandPath("*.*")> 
    <cfset thisDirectory = GetDirectoryFromPath(thisPath)>
    <cfset fullFile = thisDirectory & #arguments.file# & ".html" />
    <cfset content = "Content goes here!" />
    <cfif fileExists(fullFile)>
        <cffile  action = "read" file = #fullFile# variable = "content" />    
    </cfif>
    <!-- Replace phone number -->    
    <cfset content = replace(content,"469-658-6046","214-213-6599","All") />
    <!-- Replace Address -->    
    <cfset content = replace(content,"700 Cordes Dr","PO Box 414","All") />
    <cfset content = replace(content,"Venus, TX. 76084","Theodosia, MO 65671","All") />
        
    <!-- Replace Kingdombaptist Church to longrun -->
    <cfset content = replace(content,"Kingdom Baptist","Longrun Baptist","All") />
    <cfset content = replace(content,"kingdombaptist.org","longrunbaptist.org","All") />
    
    <cfreturn content>    
</cffunction>

<cfoutput query="qry">
    #replace(readContent(post_name),chr(10),"<br />","ALL")#
</cfoutput> 


<!--- 
<cfset thisPath = ExpandPath("*.*")> 
<cfset thisDirectory = GetDirectoryFromPath(thisPath)> 
<cfset myOutput = "">
<cfset localFile = "">
   
        
<cfquery name="qry" datasource="longrun"  CACHEDWITHIN="#CreateTimeSpan(0, 1, 0, 0)#" result="qryResult">
  select post_name, post_title, post_content from kbbackup.wp_posts where post_status = 'publish' and post_name is not null order by post_name asc
</cfquery>   
    
<cfdump var="#qry#" label="" /> 

<cfoutput query="qry">
    <cfset localFile = thisDirectory & #post_name# & ".html" />
    <cfsavecontent variable="myOutput">
        <article>
        <h1>#post_title#</h1>
        <div id="content">
            #post_content#
        </div>    
        </article>
    </cfsavecontent>
    <cffile action="write" addnewline="yes" file="#localFile#" output="#myOutput#" fixnewline="yes">
</cfoutput>    
    

<cffile action="write" addnewline="yes" file="#localFile#" output="#myOutput#" fixnewline="yes"> 


<cfif isdefined("form.name")>
    <cfset localFile = thisDirectory & form.name & ".txt" /> 
</cfif>        

--->


    
