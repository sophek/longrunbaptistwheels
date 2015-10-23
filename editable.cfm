<cfscript>

/**
 * Converts a query object into an array of structures.
 * 
 * @param query 	 The query to be transformed 
 * @return This function returns a structure. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, September 27, 2001 
 */
function QueryToArrayOfStructures(theQuery){
	var theArray = arraynew(1);
	var cols = ListtoArray(theQuery.columnlist);
	var row = 1;
	var thisRow = "";
	var col = 1;
	for(row = 1; row LTE theQuery.recordcount; row = row + 1){
		thisRow = structnew();
		for(col = 1; col LTE arraylen(cols); col = col + 1){
			thisRow[cols[col]] = theQuery[cols[col]][row];
		}
		arrayAppend(theArray,duplicate(thisRow));
	}
	return(theArray);
}

/**
 * Returns the position of an element in an array of structures.
 * 
 * @param array 	 Array to search. (Required)
 * @param searchKey 	 Key to check in the structs. (Required)
 * @param value 	 Value to search for. (Required)
 * @return Returns the numeric index of a match. 
 * @author Nath Arduini (nathbot@gmail.com) 
 * @version 0, June 11, 2009 
 */
function arrayOfStructsFind(Array, SearchKey, Value){
	var result = 0;
	var i = 1;
	var key = "";
	for (i=1;i lte arrayLen(array);i=i+1){
		for (key in array[i])
		{
			if(array[i][key]==Value and key == SearchKey){
				result = i;
				return result;
			}
		}
	}
    
    return result;
}
</cfscript>

<cfset currentAttr = "" />
<cfset currentValue = "" />

<cfif pageTemplate eq "homepage">
    <cfset currentAttr = "ATTRIBUTES" />
    <cfset currentValue = "VALUE" />
<cfelse>
    <cfset currentAttr = "POST_NAME" />
    <cfset currentValue = "POST_CONTENT" />
</cfif>   
    
<cfparam name="url.page_name" default="" />    

<!--- This function returns the structure id based on the value key passed to it --->
<cffunction name="getContentId">
    <cfargument name="val" default="" />
    <cfargument name="attr" default="#currentAttr#" />
    <cfreturn #ArrayOfStructsFind(arrStruct,"#arguments.attr#","#arguments.val#")# />
</cffunction>     

<!---This funciton get the value of the structrue --->
<cffunction name="getContent">
    <cfargument name="value" default="" />
    <cfargument name="attr" default="#currentAttr#" />
    <cfargument name="val" default="#currentValue#" />
    
    <cfset result = "Content Goes Here!" />
    <cftry>
        <cfset structId = getContentId(#arguments.value#,#arguments.attr#) />
        <cfset data = #arrStruct[structId][arguments.val]# />
        <cfcatch type="any">
            <cfset data = "" />
        </cfcatch>
    </cftry>
    <cfif len(data) neq 0>
        <cfset result = data />
    </cfif>
    <cfreturn result>    
</cffunction> 

<!--- Get the current page name --->
<cfset currentPage = ListToArray(cgi.script_name,"/") />
<cfset currentPage = currentPage[ArrayLen(currentPage)]/>
<cfset pageName = url.page_name />    

<cfoutput>    
<cfif pageTemplate eq "homepage">  
    <cfset qry = model("page").findAll(select="id, pageUrl,attributes,value", where="pageUrl='#currentPage#'")>
<cfelseif pageTemplate eq "pages">
    <cfset qry = model("wp_post").findAll(select="post_name, post_title, post_excerpt, post_content", where="post_status='publish'")>
<cfelse>
    <cfset pageName = params.article /> 
    <cfset qry = model("wp_post").findAll(select="post_name, post_title, post_excerpt, post_content", where="post_name='#pageName#' AND post_status='publish'")>
</cfif>    
</cfoutput>

<!--- Convert query objec to Array of structures, the reason why I'm doing this is I didn't want to query the db for the values I wanted. --->
<cfset arrStruct = QueryToArrayOfStructures(qry)>
<cfset editable = "true" />    