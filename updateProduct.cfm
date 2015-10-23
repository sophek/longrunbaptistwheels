  
   <cfquery name="qry" datasource="longrun" result="qryResult">
  update products set productname = '#url.value#' where id = 26;
    </cfquery>

