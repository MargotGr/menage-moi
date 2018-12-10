import $ from 'jquery';

$(document).ready(function() {

  $(window).on('load', function() {
    $(".loader").delay(2000).fadeOut(200);
  });

});
