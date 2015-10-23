<cfscript>
    
     set(dataSourceName="longrun");
    set(overwritePlugins=false);
set(cachePlugins = false);
set(deletePluginDirectories=false);
	 //set(dataSourceUserName="root");
	 //set(dataSourcePassword="root"); 
    
	/*
		If you leave these settings commented out, CFWheels will set the data source name to the same name as the folder the application resides in.
	*/

	 

	/*
		If you leave this setting commented out, CFWheels will try to determine the URL rewrite capabilities automatically.
		The "URLRewriting" setting can bet set to "on", "partial" or "off".
		To run with "partial" rewriting, the "cgi.path_info" variable needs to be supported by the web server.
		To run with rewriting set to "on", you need to apply the necessary rewrite rules on the web server first.
	*/

	// set(URLRewriting="partial");
</cfscript>