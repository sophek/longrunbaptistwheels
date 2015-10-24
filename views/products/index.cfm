<h1>Listing products</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
	<p>#linkTo(text="New product", action="new")#</p>
</cfoutput>

<cftable query="products" colHeaders="true" HTMLTable="true">
	
					<cfcol header="Id" text="#id#" />
				
					<cfcol header="Product Name" text="#productName#" />
				
					<cfcol header="Product Price" text="#productPrice#" />
				
					<cfcol header="Product Qty In Stock" text="#productQtyInStock#" />
				
					<cfcol header="Product Image" text="#productImage#" />
				
					<cfcol header="Product Short Desc" text="#productShortDesc#" />
				
					<cfcol header="Product Desc" text="#productDesc#" />
				
	<cfcol header="" text="#linkTo(text='Show', action='show', key=id)#" />
	<cfcol header="" text="#linkTo(text='Edit', action='edit', key=id)#" />
	<cfcol header="" text="#linkTo(text='Delete', action='delete', key=id, confirm='Are you sure?')#" />
</cftable>

<button id="deleteMe">Delete me test</button>

<script>
    $("#deleteMe").on('click',function(evt){
        $.post("http://127.0.0.1:8500/longrunbaptistwheels/index.cfm/products/delete/89", {
              id: 89
          },
          function (data, status) {
              if (status == 'success') {
                   
              } else {
                 
              }
          });
        
    })
</script>