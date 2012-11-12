$(document).ready(function() {
  $("#trigger").click(function() {

    $("#myModal").modal();
 
  });

  $(".comment_form_button").click(function() {
    if( $("#comments_container").length == 0  ) {
      $(this).submit();
    } else {
      $("#comments_container").remove();
    }
  });

//  $("a.popover-test").popover();
  /*$("span.comment_popover").popover({
    placement: 'top',
    html: true
  }).popover();*/
});
