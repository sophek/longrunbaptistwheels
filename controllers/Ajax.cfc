<cfcomponent extends="controller">
	<cffunction name="init">
		<cfscript>
			provides("html,json");
			filters(through="_isValidAjaxRequest", except="index");
		</cfscript>
	</cffunction>

	<!--- This is called remotely;
		isAjax() just confirms this is an ajax request;
		renderPartial() returns the HTML of the partial without further processing
		--->
	<cffunction name="getpartial" access="public">
			<cfset renderPartial("time")>
	</cffunction>

	<!--
	this is another way of doing the same thing without a partial
	renderWith is useful to return simple strings etc.
	--->
	<cffunction name="gettext" access="public">
		<cfset thetime="Returned with renderWith: " & timeFormat(now(), "HH:MM")>
		<cfset renderWith(thetime)>
	</cffunction>

	<!--- This is called for every request to the AJAX controller via filters() --->
	<cffunction name="_isValidAjaxRequest" access="private">
		<cfif !isAjax()>
			<cfthrow message="Not an ajax request!">
		</cfif>
	</cffunction>

</cfcomponent>