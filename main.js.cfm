
<!--- 
$(document).ready(function() {
    //toggle `popup` / `inline` mode
    $.fn.editable.defaults.mode = 'inline';     

  <cfoutput> 
        <cfloop index="i" from="1" to="#arrayLen(ids)#">
            
            $('###ids[i]#').editable({
           url: 'post.cfm',
           type: 'textarea',
           pk: #i#,
           name: '#ids[i]#',
           title: ''
    });
           
        </cfloop> 
    </cfoutput> 


 
    
    
});

--->


$(function() {
  
  /* Fix FireBug */
  /*
  if ($.browser.mozilla) {
      window.loadFirebugConsole();    
  };
  */
  
  /* Handle links inside editable area. */
  $('.editable > a').bind('click', function() {
      $(this).parent().trigger('click');
      return false; 
  });
  
  $('#pageTitle').editable('http://www.appelsiini.net/projects/jeditable/wysiwyg/php/save.php', { 
    indicator : '<img src="../img/indicator.gif">',
    type      : 'wysiwyg',
    width     : 640,
    height    : 'auto',
    onblur    : 'ignore',
    submit    : 'OK',
    cancel    : 'Cancel'
  });

  $('#wysiwyg_2').editable('http://www.appelsiini.net/projects/jeditable/wysiwyg/php/save.php', { 
    indicator : '<img src="../img/indicator.gif">',
    type      : 'wysiwyg',
    width     : 640,
    height    : 'auto',
    onblur    : 'ignore',
    submit    : 'OK',
    cancel    : 'Cancel',
    wysiwyg   : { controls : { separator04         : { visible : true },
                               insertOrderedList   : { visible : true },
                               insertUnorderedList : { visible : true }
                }
    }
  });
    
});