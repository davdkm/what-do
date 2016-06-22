$(document).ready(function() {
  console.log('this is loading');
  attachListeners();
});


var attachListeners = function() {
  eventDetail();
}

var eventDetail = function() {
  console.log('eventDetail hit');
  $(".js-more").on("click", function() {
    var id = $(this).data("id");
    $.get("/events/" + id + ".json", function(event) {
      var dom = '';
      dom += "<p><strong>Begins:</strong> " + event.readable_start_time + "</p>";
      dom += "<p><strong>Ends: </strong> " + event.readable_end_time + "</p>";
      dom += "<p><strong>Description:</strong> " + event.description + "</p>";
      $("#event-" + id + "-detail").html(dom);
    });
    $(this).remove();
  });
}
