$(document).ready(function() {
  setup_masonry(3);
//  style_sidebar($("li#user_picposts"));
});


function style_sidebar(element) {
  $("ul.sidebar").find("li").each(function() {
    $(this).removeClass("bar_selected");
  });
  element.addClass("bar_selected");
}

