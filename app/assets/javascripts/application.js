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
//= require bootstrap
//= require jquery_masonry_min

function setup_masonry(num_cols) {
  var $picpostContainer = $("#picpost_container");
  $picpostContainer.imagesLoaded( function() {
    $picpostContainer.masonry({
      itemSelector: '.pic',
      columnWidth: function(containerWidth) {
        return containerWidth / num_cols;
      }
    });
  });
  $("div.pic").css({
    'margin-bottom': '20px',
    'width': '210px'
  });
}

function register_click(form) {
  if( $("#comments_container").length == 0  ) {
    $(form).submit();
  } else {
    $("#comments_container").remove();
  }
}




/* HOME JS */
$(document).ready(function() {

/*  $("body").click(function(e) {
    alert("X: " + e.pageX + " Y: " + e.pageY);
  });*/
 $("div.pic").hover(
    function () {
      $(this).find("div.favorite_div").show();
    }, 
    function () {
      $(this).find("div.favorite_div").hide();
    }
  );
 

});


