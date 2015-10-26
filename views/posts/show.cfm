<h1>Showing post</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

					<p><span>Id</span> <br />
						#post.id#</p>
				
					<p><span>Page Name</span> <br />
						#post.pageName#</p>
				
					<p><span>Page Content</span> <br />
						#post.pageContent#</p>
				
					<p><span>Page Title</span> <br />
						#post.pageTitle#</p>
				
					<p><span>Page Layout</span> <br />
						#post.pageLayout#</p>
				
					<p><span>Page Category</span> <br />
						#post.pageCategory#</p>
				

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this post", action="edit", key=post.id)#
</cfoutput>
