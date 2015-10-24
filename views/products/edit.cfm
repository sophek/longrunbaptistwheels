<h1>Editing product</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			#errorMessagesFor("product")#
	
			#startFormTag(action="update", key=params.key)#
		
				#includePartial("fields")#
				
				#submitTag()#
				
			#endFormTag()#
			

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
