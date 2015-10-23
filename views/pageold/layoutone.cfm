<html>
<head>
<title></title>
</head>

<body>

<div id="container">
    
    This is layout one
    <div id="navigation">
        <ul>
            <cfoutput>
            <li>#linkTo(text="Home", controller="main")#</li>
            <li>#linkTo(text="About Us", controller="about")#</li>
            <li>#linkTo(text="Contact Us", controller="contact")#</li>
            </cfoutput>
        </ul>
    </div>
    <div id="content">
        <cfoutput>#includeContent()#</cfoutput>
    </div>
</div>

</body>
</html>