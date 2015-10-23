<!--- Place helper functions here that should be available for use in all view pages of your application. --->

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

    
<!--- Convert query objec to Array of structures, the reason why I'm doing this is I didn't want to query the db for the values I wanted. --->

<cfset qry = model("page").findAll(select="id, pageUrl,attributes,value", where="pageUrl='index.cfm'")>
<cfset arrStruct = QueryToArrayOfStructures(qry)>
<cfset editable = "true" />  
    
    <!--- This function returns the structure id based on the value key passed to it --->
<cffunction name="getContentId">
    <cfargument name="val" default="" />
    <cfargument name="attr" default="ATTRIBUTES" />
    <cfreturn #ArrayOfStructsFind(arrStruct,"#arguments.attr#","#arguments.val#")# />
</cffunction>     

<!---This funciton get the value of the structrue --->
<cffunction name="getContent">
    <cfargument name="value" default="" />
    <cfargument name="attr" default="ATTRIBUTES" />
    <cfargument name="val" default="VALUE" />

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
