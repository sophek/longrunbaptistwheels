<cfparam name="form.id" default="">   
<cfif isdefined("form.id") and form.id neq "">  
  <cfset aPost = model("wp_post").findOne(select="id,post_title,post_name,post_content", where="id=#form.id#", returnAs="query")>
  <cfoutput>
      <h2 id="@#aPost.post_name#" contenteditable="true">#aPost.post_title#</h2>
      <div id="#aPost.post_name#" contenteditable="true">#aPost.post_content#</div>
    </cfoutput>
</cfif>


    