
<cfif isdefined("form.email") AND form.email EQ "pastor@longrunbaptist.org" OR form.email EQ "sophek@gmail.com">
            <cfif isdefined("form.password") AND form.password EQ "flatearth1611!">
                <cfset session.admin = "true" />
                <cflocation url="index.cfm" addtoken="no" />
            <cfelse>
                <cfset error = "Please enter the correct login information." />    
            </cfif>    
        </cfif>
