<h1>Editing post</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			#errorMessagesFor("post")#
	
			#startFormTag(action="update", key=params.key)#
		
				#includePartial("fields")#
				
				#submitTag()#
				
			#endFormTag()#
			

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
