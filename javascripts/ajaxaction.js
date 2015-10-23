var scripts = document.getElementsByTagName('script');
var myScript = scripts[ scripts.length - 1 ];
var queryString = myScript.src.replace(/^[^\?]+\??/,'');
var params = parseQuery( queryString );

function parseQuery ( query ) {
   var Params = new Object ();
   if ( ! query ) return Params; // return empty object
   var Pairs = query.split(/[;&]/);
   for ( var i = 0; i < Pairs.length; i++ ) {
      var KeyVal = Pairs[i].split('=');
      if ( ! KeyVal || KeyVal.length != 2 ) continue;
      var key = unescape( KeyVal[0] );
      var val = unescape( KeyVal[1] );
      val = val.replace(/\+/g, ' ');
      Params[key] = val;
   }
   return Params;
}

var baseUrl = "http://127.0.0.1:8500/longrunbaptistwheels/";
if (params.env === 'prod'){
    baseUrl = 'http://www.longrunbaptist.org/';
}else{
    baseUrl = 'http://127.0.0.1:8500/longrunbaptistwheels/'; 
}


	// The "instanceCreated" event is fired for every editor instance created.
	CKEDITOR.on( 'instanceCreated', function ( event ) {
		var editor = event.editor,
        element = editor.element;
        
      editor.on( 'focus', function( evt ) {
        $( "#renamePage" ).toggle( "slow" ); 
         console.log(params);  
      } );
        
        editor.on( 'blur', function( evt ) {
            
           
        
          var chkBoxName =  evt.editor.element.getAttribute('chkboxid');
          var renamePostName;
          var thisContent = evt.editor.getData();
          var fileName =  evt.editor.element.getAttribute('id');     
            
        $( "#renamePage" ).toggle( "slow" );  
        //If rename checkbox is clicked
        $( "#renamePageChk" ).change(function() {
            var $input = $( this );
            renamePostName = $input.is( ":checked" ); 
        }).change();
        
        updateRecord(fileName,thisContent,params.cfm);    
            
    // Function to updateRecord        
    function updateRecord(filename,content,actionUrl){ 
        var myUrl = baseUrl + actionUrl; 
        $.post(myUrl, { postTitle: filename, postContent: content }, 
               function(data, status)
               { console.log(data); 
               });
        }});   
	   });

