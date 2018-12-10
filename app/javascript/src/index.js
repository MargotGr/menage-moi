import $ from 'jquery';

$(document).ready(function() {

  $(window).on('load', function() {
    $(".loader").delay(4000).fadeOut(2000);
  });

});
