$(document).ready(function() {
  attachListeners();
  console.log('this is loading');
});

var attachListeners = function() {
  $(".js-more").on("click", function(event) {
    eventDetail(event);
  })
}


var eventDetail = function() {
  $(".js-more").on("click", function() {
    var id = $(this).data("id");
    $.get("/events/" + id + ".json", function(event) {
      var startTime = "<p><strong>Begins:</strong> " + event.readable_start_time + "</p>";
      var endTime = "<p><strong>Ends: </strong> " + event.readable_end_time + "</p>";
      var description = "<p><strong>Description:</strong> " + event.description + "</p>";
      $("#event-" + id + "-detail").append(startTime + startTime + endTime + description);
    });
  });
}
