
  <link rel="stylesheet" href="css/prism.css">
  <link rel="stylesheet" href="css/chosen.css">
  <style type="text/css" media="all">
    /* fix rtl for demo */
    .chosen-rtl .chosen-drop { left: -9000px; }
  </style>




      <div class="side-by-side clearfix">
       
          <select data-placeholder="Ajoute ..." class="chosen-select" multiple style="width:350px;" name="motCles" tabindex="4" required>
            <option value="java">Java</option>
            <option value="c">C</option>
            <option value="cplus">C++</option>
            <option value="javascript">Javascript</option>
            <option value="jee">JEE</option>
            <option value="dotnet">.NET</option>
            <option value="wordpress">Wordpress</option>
            <option value="drupal">Drupal</option>
            <option value="management">Management</option>
            <option value="rh">RH</option>            
          </select>
        
      </div>

      
  <script src="js/chosen.jquery.js" type="text/javascript"></script>
  <script src="js/prism.js" type="text/javascript" charset="utf-8"></script>
  <script type="text/javascript">
    var config = {
      '.chosen-select'           : {width:"100%"},
      '.chosen-select-deselect'  : {allow_single_deselect:true},
      '.chosen-select-no-single' : {disable_search_threshold:10},
      '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
      '.chosen-select-width'     : {width:"100%"}
    };
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    }
  </script>


