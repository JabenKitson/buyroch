    $(function(){
     $('#property_lease').change(function() {
       	  update_unique();  
       	  update_price_label();  
       	  update_forsale();   
        });

     $('#property_forsale').change(function() {
       	  update_forlease();   
        });

     $('#property_unique_space_input').change(function() {
          update_property_price_unit();
       });
       

    init_checkboxes();
    });

    function update_price_label(){
    	
    	  if ($('#property_lease').prop("checked"))
    	   {
    	   	$("label[for='property_price']").text("Price per sqft*");

          }
          else {
          	$("label[for='property_price']").text("Asking price*");
            update_property_price_unit();
          }
    }

    function update_forlease()
    {
    	 if ($('#property_forsale').prop("checked"))
    	   {
    	   	$('#property_lease').prop("checked",false);

          }
          else {
          	$('#property_lease').prop("checked",true);
          	
          }
          update_unique();  
       	  update_price_label();

    }

    function update_forsale()
    {
    	 if ($('#property_lease').prop("checked"))
    	   {
    	   	$('#property_forsale').prop("checked",false);

          }
          else {
          	$('#property_forsale').prop("checked",true);
          }

    }

    function init_checkboxes()
    {
      update_unique();
      update_property_price_unit();
      update_price_label();
      update_forsale();

    }

    function update_unique()
    {
    	  if ($('#property_lease').prop("checked"))
    	   {
    	   	$('#property_unique_space_input').css({"display":"block"});

          }
          else {
          	$('#property_unique_space_input').css({"display":"none"});
            $('#property_unique_space').prop("checked",false);
          }
    }
    
    function update_property_price_unit()
    {
        if ($('#property_unique_space').prop("checked")) {$('#property_price_unit_input').css({"display":"block"});}
          else {$('#property_price_unit_input').css({"display":"none"});}
    	
    }

