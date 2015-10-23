<cfparam name="form.id" default="1">
<cfparam name="form.page" default="4">
<cfquery name="qry" datasource="longrun" result="qryResult">
    update wp_posts 
    set categoryid = #form.id# 
    where id = #form.page#;
</cfquery>
