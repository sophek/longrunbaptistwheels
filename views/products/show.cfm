<h1>Showing product</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

					<p><span>Id</span> <br />
						#product.id#</p>
				
					<p><span>Product Name</span> <br />
						#product.productName#</p>
				
					<p><span>Product Price</span> <br />
						#product.productPrice#</p>
				
					<p><span>Product Qty In Stock</span> <br />
						#product.productQtyInStock#</p>
				
					<p><span>Product Image</span> <br />
						#product.productImage#</p>
				
					<p><span>Product Short Desc</span> <br />
						#product.productShortDesc#</p>
				
					<p><span>Product Desc</span> <br />
						#product.productDesc#</p>
				

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this product", action="edit", key=product.id)#
</cfoutput>
