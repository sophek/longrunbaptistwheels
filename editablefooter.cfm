    <script>

	// The "instanceCreated" event is fired for every editor instance created.
	CKEDITOR.on( 'instanceCreated', function ( event ) {
		var editor = event.editor,
				element = editor.element;
            
		// Customize editors for headers and tag list.
		// These editors do not need features like smileys, templates, iframes etc.
		if ( element.is( 'h1', 'h2', 'h3' ) || element.getAttribute( 'id' ) == 'taglist' ) {
			// Customize the editor configuration on "configLoaded" event,
			// which is fired after the configuration file loading and
			// execution. This makes it possible to change the
			// configuration before the editor initialization takes place.
			editor.on( 'configLoaded', function () {

				// Remove redundant plugins to make the editor simpler.
				editor.config.removePlugins = 'colorbutton,find,flash,font,' +
						'forms,iframe,image,newpage,removeformat,' +
						'smiley,specialchar,stylescombo,templates';

				// Rearrange the toolbar layout.
				editor.config.toolbarGroups = [
					{ name: 'editing', groups: [ 'basicstyles', 'links' ] },
					{ name: 'undo' },
					{ name: 'clipboard', groups: [ 'selection', 'clipboard' ] },
					{ name: 'about' }
				];
			} );
		}
        //On the details_page --- when an title is edited, it can also edit the page name
      editor.on( 'focus', function( evt ) {
        $( "#renamePage" ).toggle( "slow" ); 
      } );
        
        editor.on( 'blur', function( evt ) {
        
          var chkBoxName =  evt.editor.element.getAttribute('chkboxid');
          var renamePostName;
            
        $( "#renamePage" ).toggle( "slow" );  
        $( "#renamePageChk" ).change(function() {
        var $input = $( this );
        renamePostName = $input.is( ":checked" ); 
        }).change();
             
        
        var thisContent = evt.editor.getData();
        var fileName =  evt.editor.element.getAttribute('id');      
                     
$.post("post.cfm",
    {
        content: thisContent,
        id: fileName,
        pageUrl : '<cfoutput>#currentPage#</cfoutput>',
        myCheckbox : renamePostName
    },
    function(data, status){
        //alert("Data: " + data + "\nStatus: " + status);
    });
            
});
        
	} );
        
	</script>