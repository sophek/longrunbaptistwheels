
        <cfset newProduct = model("product").new()>
        <cfset newProduct.productName = "my product">
        <cfset newProduct.productPrice = "20.00">
        <cfset newProduct.productImage = "product image">
        <cfset newProduct.productDesc = "Long desc long desc">
        <cfset newProduct.productShortDesc = "Short Desc">
        <cfset newProduct.productQtyInStock = 5>
        <cfset newProduct.save()>
       
