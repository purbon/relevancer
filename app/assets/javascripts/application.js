// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function(){
    $(".alert-success").delay(2000).slideUp(500, function(){
          $(".alert-success").alert('close');
      });

    $(".alert-danger").delay(2000).slideUp(500, function(){
          $(".alert-danger").alert('close');
      });
});

function judgement_validation_function() {
  var valid = true
  for (i = 0; (i < 10)&&(valid); i++) { 
    var relevancy = $('#relevancy_for_'+i).find(":selected").val()
    valid = (relevancy != "-1")
    if (!valid) {
        $( '#relevancy_for_'+i ).focus();
    }
  }
  return valid;
}

for (i = 0; i < 10; i++) { 
  $("#relevancy_for_"+i).change(function(event)  {
    $("#report .submit_button").prop("disabled", false);
  })
}

$( "#report" ).submit(function( event ) {
  if( judgement_validation_function() )
    return;
  else {
    alert("Your judgement can not be submited, need to evaluate all results!")
    event.preventDefault();
  }
});

 $(document).ready(function(){
    $("form#search").on('ajax:success', function(event, data, status, xhr) {
      console.log("Great!");
      $("#results").html(data)
      // use data to access to your json data structure
    });

    $("form#search").on('ajax:error', function(event, xhr, status, error) {
      console.log("sorry mate!");
      console.log(error)
    });

    $("select#index").change(function(){
      console.log("Great select!");
      var indexVal = $('select[name=index]').val()
      if (indexVal != '') {

        $.ajax({
          type: "GET",
          url: "/admin/schema/mapping/"+indexVal+"",
          success: function(data) {
            console.log(data)
            $("#results").html(data)
          }
        })
      }

    });

 })

