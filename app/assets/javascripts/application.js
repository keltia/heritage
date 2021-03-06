// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery-ui
//= require jquery.ui.widget
//= require jquery.uploadify-3.1.min.js
//= require jquery.fileupload.js
//= require select2
//= require knockout
//= require_tree .
jQuery(function($) {
  $('.thumbs_image').hover(function() {
    $($(this).parent().find('.thumbs_background')).show();
    $($(this).parent().find('.thumbs_info')).show();
  },
  function() {
    $($(this).parent().find('.thumbs_background')).hide();
    $($(this).parent().find('.thumbs_info')).hide();
  });

		$("#new_email").bind('ajax:before', function() {
      $('#new_email_submit').val('Loading...');
		});

    $(".imgHover").hover(
      function() {
      $(this).children("img").fadeTo(200, 0.25).end().children(".hover").show();
    },
    function() {
      $(this).children("img").fadeTo(200, 1).end().children(".hover").hide();
    });
})
