<cfset ui = createUUID()>
<cfset filePath = expandPath( "./" ) />

    <cfscript>
function getClientFileName(fieldName) {
	var tmpPartsArray = Form.getPartsArray();
	var clientFileName = "";

	if (IsDefined("tmpPartsArray")) {
		for (local.tmpPart in tmpPartsArray) {
			if (local.tmpPart.isFile() AND local.tmpPart.getName() EQ arguments.fieldName) {
				return local.tmpPart.getFileName();
				}
			}
		}
	
	return "";
	}
</cfscript>
    
 
    
<cfset theClientFilename = getClientFileName("file")>
<cfif ListLast(theClientFilename,".") NEQ "jpg">
   // do your error handling here
<cfelse>
  // else the extension is ok. Use cffile to handle the upload and proceed
</cfif>
    
    
    
    
<cfif isdefined("form.file")>
    <cfset ui = createUUID()>
    <cfset imgID = "" />
    
    <cfif isdefined("url.imgID")>
        <cfset imgID = url.imgID />
    </cfif>    
        
    <cfset filePath = expandPath( "./" ) & "images/products/" & "#imgID#.jpg" />
    <cffile action = "upload"  
        fileField = "file"  
        destination = "#filePath#"    
        nameConflict = "Overwrite"> 
        
        <cfquery name="qry" datasource="longrun" result="qryResult">
            update products set productImage = '#imgID#.jpg' where id = #imgID#;
        </cfquery>

        
</cfif>