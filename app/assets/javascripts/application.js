// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require jquery.purr
//= require best_in_place
//= require_tree .

$(function() {
   
  $(".new_link").click(function(event){
    $("#new_form").toggle();
    event.preventDefault();
    $("#item_name").focus();
  });  
    
})
  // $("#item_acquired_on").datepicker({
  //  changeMonth: true, 
  //  end_year:2011,
  //  changeYear: true
  //  });
	


// $(document).ready(function() {
//     $('.new_item_form').editable('#new_form');
// });