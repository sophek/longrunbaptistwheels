<h1>Listing posts</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
	<p>#linkTo(text="New post", action="new")#</p>
</cfoutput>

<cftable query="posts" colHeaders="true" HTMLTable="true">
	
					<cfcol header="Id" text="#id#" />
				
					<cfcol header="Page Name" text="#pageName#" />
				
					<cfcol header="Page Content" text="#pageContent#" />
				
					<cfcol header="Page Title" text="#pageTitle#" />
				
					<cfcol header="Page Layout" text="#pageLayout#" />
				
					<cfcol header="Page Category" text="#pageCategory#" />
				
	<cfcol header="" text="#linkTo(text='Show', action='show', key=id)#" />
	<cfcol header="" text="#linkTo(text='Edit', action='edit', key=id)#" />
	<cfcol header="" text="#linkTo(text='Delete', action='delete', key=id, confirm='Are you sure?')#" />
</cftable>

