<cfparam name="form.id" default="1" />
<cfparam name="form.q" default="" />
<cfparam name="form.catid" default="" />
<cfif isdefined(form.q) and form.q eq "" and isdefined(form.catid) and form.catid eq "">
    <cfset qry = model("wp_post").findAll(select="id,post_name, post_title, post_excerpt, post_content", where="post_status='publish'", page=1, perPage=20, order="ID DESC")>
<cfelseif isdefined(form.q) and form.q neq "" and isdefined(form.catid) eq "">
    <cfset qry = model("wp_post").findAll(select="id,post_name, post_title, post_excerpt, post_content", where="post_status='publish' AND post_title LIKE '%#form.q#%'", order="post_name ASC")>
<cfelseif isdefined(form.q) eq "" and form.eq "" and isdefined(form.catid) and form.catid neq "">
    <cfset qry = model("wp_post").findAll(select="id,post_name, post_title, post_excerpt, post_content", where="post_status='publish' AND categoryid=#form.catid#", order="post_name ASC")>
<cfelse>
     <cfset qry = model("wp_post").findAll(select="id,post_name, post_title, post_excerpt, post_content", where="post_status='publish'", page=1, perPage=20, order="ID DESC")>          
</cfif>

<cfoutput query="qry">
                      <tr id="tr#id#">
                        <td><h2 id="@#post_name#" contenteditable="true" chkboxid="##renamePage#currentrow#" >#Ucase(post_title)#</h2></td>
                        </td>
                        <td>#post_name#</td>
                        <td class="text-nowrap">
                          <button type="button" class="btn white-btn" data-toggle="tooltip" data-original-title="Clone" onclick="javascript:duplicate('#id#','#post_name#')">
                            <i class="fa fa-files-o" aria-hidden="true"></i>
                          </button>
                            <button type="button" class="btn white-btn" data-toggle="tooltip" data-original-title="Edit" onclick="javascript:editme('#id#','#post_name#')">
                            <i class="fa fa-wrench" aria-hidden="true"></i>
                          </button>
                          <button type="button" id="btn#id#"   class="btn white-btn remove" data-toggle="tooltip" data-original-title="Delete" onclick="javascript:deleteme('#id#','#post_name#')">
                            <i class="fa fa-times" aria-hidden="true"></i>
                          </button>
                        </td>
                        <td></td>
                      </tr>
                    </cfoutput>