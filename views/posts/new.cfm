<h1>Create a New post</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			#errorMessagesFor("post")#
	
			#startFormTag(action="create")#
		
				#includePartial("fields")#

				#submitTag()#
				
			#endFormTag()#
			

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
