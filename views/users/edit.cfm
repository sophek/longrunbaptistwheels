<h1>Editing user</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			#errorMessagesFor("user")#
	
			#startFormTag(action="update", key=params.key)#
		
				#includePartial("fields")#
				
				#submitTag()#
				
			#endFormTag()#
			

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
