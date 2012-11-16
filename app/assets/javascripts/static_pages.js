$(document).ready(function() {
  $("#trigger").click(function() {
    $("#myModal").modal();
  });
 	 
  setup_masonry();

});

function register_click(form) {
  if( $("#comments_container").length == 0  ) {
    $(form).submit();
  } else {
    $("#comments_container").remove();
  }
}

function find_parent(element,class_match) {
  element.parents().each(function(e) {
    alert($(e).attr('id'));
    if($(e).hasClass(class_match)){
      alert("TRUE");
    }
  });

}

function setup_masonry() {
  var $picpostContainer = $("#picpost_container");
  $picpostContainer.imagesLoaded( function() {
    $picpostContainer.masonry({
      itemSelector: '.pic',
      columnWidth: function(containerWidth) {
        return containerWidth / 4;
      }
    });
  });
  $("div.pic").css({
    'margin-bottom': '20px',
    'width': '210px'
  });


}
