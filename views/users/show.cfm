<h1>Showing user</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

					<p><span>Id</span> <br />
						#user.id#</p>
				
					<p><span>Username</span> <br />
						#user.username#</p>
				
					<p><span>Password</span> <br />
						#user.password#</p>
				

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this user", action="edit", key=user.id)#
</cfoutput>
