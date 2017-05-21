// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .


////this is where we apply opacity to the arrow
$(window).scroll( function(){
  //get scroll position
  var topWindow = $(window).scrollTop();
  //multipl by 1.5 so the arrow will become transparent half-way up the page
  var topWindow = topWindow * 2;
  //get height of window
  var windowHeight = $(window).height();
  //set position as percentage of how far the user has scrolled
  var position = topWindow / windowHeight;
  //invert the percentage
  position = 1 - position;
  //define arrow opacity as based on how far up the page the user has scrolled
  //no scrolling = 1, half-way up the page = 0
  $('.chevron').css('opacity', position);
});

$('document').ready(function() {
	$('.chevron').click(function() {
		$('html, body').animate(
		{scrollTop: $('.articles-section').offset().top},
		 1000);
		 return false;
	}); // end click
  $('.chevron').hover(function() {
    $(this).css('color', 'white')
  }, function() {
    $(this).css('color', '')
  }); // end hover
  // Bootstrap tooltip js
  $('[data-toggle="tooltip"]').tooltip();
}); // end click
// }); //end ready
