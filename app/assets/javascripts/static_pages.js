$(document).ready(function() {
  $("#trigger").click(function() {
    $("#myModal").modal();
  });
 	 
  setup_masonry(4);

});

function register_click(form) {
  if( $("#comments_container").length == 0  ) {
    $(form).submit();
  } else {
    $("#comments_container").remove();
  }
}
