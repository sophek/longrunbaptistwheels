<cfparam name="form.q" default="" />
<cfparam name="form.pagenum" default="1" />
<cfparam name="form.categorynum" default="" />


<cfif isdefined("form.q") and form.q neq "">
    <cfset qry = model("post").findAll(select="id,post_name, post_title, post_excerpt, post_content,categoryid", where="post_title like '%#form.q#%'")>          
<cfelse>
    
    <cfif isdefined("form.categorynum") and form.categorynum neq "">
        <cfset sqlwhere = "post_status='publish' AND categoryid = #form.categorynum#" />
    <cfelse>
        <cfset sqlwhere = "post_status='publish' " />

    </cfif>    
          
    <cfset qry = model("post").findAll(select="id,post_name, post_title, post_excerpt, post_content,categoryid", where="#sqlwhere#", page=#form.pagenum#, perPage=20, order="ID DESC")>          
</cfif>
    <cfset qryCategory = model("category").findAll(select="id,categoryname", order="categoryname ASC")> 

<cfoutput query="qry">
                      <tr id="tr#id#">
                        <td><h2 id="@#post_name#" contenteditable="true">#Ucase(post_title)#</h2></td>
                        </td>
                       <td>
                        <div class="form-group">
                            <select class="form-control" id="selectCategory#id#" onchange="updateCat(#id#)">
                                <cfloop query="qryCategory">
                                    <option value="#id#" <cfif qryCategory.id eq qry.categoryid>selected</cfif> >#categoryname#</option>
                                </cfloop>    
                            </select>
                        </div>
                    </td>
                        <td class="text-nowrap">
                          <button type="button" class="btn white-btn" data-toggle="tooltip" data-original-title="Clone" onclick="javascript:duplicate('#id#','#post_name#')">
                            <i class="fa fa-files-o" aria-hidden="true"></i>
                          </button>
                            <button type="button" class="btn white-btn" data-toggle="tooltip" data-original-title="Edit" onclick="javascript:editme('#id#','#post_name#')">
                            <i class="fa fa-wrench" aria-hidden="true"></i>
                          </button>
                          <button type="button" id="btn#id#" class="btn white-btn remove" data-toggle="modal" data-target="##examplePositionCenter" data-productid="#id#" data-pagename="#post_name#" data-original-title="Delete">
                            <i class="fa fa-times" aria-hidden="true"></i>
                          </button>
                             <button type="button" class="btn white-btn" data-toggle="tooltip" data-original-title="View">
                             <a href="../../index.cfm/page/article/#post_name#"><i class="fa fa-eye" aria-hidden="true"></i></a>
                          </button>
                            
                        </td>
                      </tr>
                    </cfoutput>