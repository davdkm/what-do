$(document).on('page:change', function() {
  attachListeners();
});

var attachListeners = function() {
  eventDetail();
  loadUsers();
}

$(function () {
  $("form#new_event").on("submit", function(e) {
    e.preventDefault();
    var $form = $(this);
    var action = $form.attr("action");
    var params = $form.serialize();

    $.ajax({
      url: action,
      method: 'POST',
      dataType: 'json',
      data: params}
    })
    .success(function(json) {
      console.log(json);
      // html = '';
      // html += something;
      // $(".event_show").append(html)
    })
    .error(function(response) {
      /* Act on the event */
      console.log('yu broke it?', response);
    });
  })
})

var eventDetail = function() {
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

var loadUsers = function() {
  $(".js-users").on("click", function() {
    var id = $(this).data("id");
    $.get("/events/" + id + ".json", function(event) {
      var dom = '';
      event.users.forEach(function(user) {
        dom += "<a class='button' href='/users/" + user.id + "'>" + user.name + "</a> ";
      });
      $('#users').html(dom);
    })
  })
}
