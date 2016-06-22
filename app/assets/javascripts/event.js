$(document).ready(function() {
  attachListeners();
  console.log('this is loading');
});

var attachListeners = function() {
  $(".js-more").on("click", function(event) {
    eventDetail(event);
  })
}
