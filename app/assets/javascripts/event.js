$(document).ready(function() {
  $(function(){
    Event.templateSource = $("#event-template").html();
    Event.template = Handlebars.compile(Event.templateSource);
  })
});

$(document).on('page:change', function() {
  attachListeners();
});

var attachListeners = function() {
  // eventDetail();
  loadUsers();
  newEventListener();
  editEventListener();
}

function Event(attributes) {
  this.id = attributes.id;
  this.name = attributes.name;
  this.description = attributes.description;
  this.location = attributes.location;
  this.organizer = attributes.organizer;
  this.users = attributes.users;
  this.comments = attributes.comments;
  this.time_zone = attributes.time_zone;
  this.readable_start_time = attributes.readable_start_time;
  this.readable_end_time = attributes.readable_end_time;
  this.tag_ids = attributes.tag_ids;
}

Event.prototype.renderDiv = function () {
  return Event.template(this)
};

var newEventListener = function () {
  $("form#new_event").on("submit", function(e) {
    e.preventDefault();
    var $form = $(this);
    var action = $form.attr("action");
    var params = $form.serialize();
    $.ajax({
      url: action,
      method: 'POST',
      dataType: 'json',
      data: params
    })
    .success(function(json) {
      eventSuccess(json);
    })
    .error(function(response) {
      /* Act on the event */
      console.log('yu broke it?', response);
    });
  })
}

var eventSuccess = function(json) {
  var event = new Event(json);
  // var eventDiv = event.renderDiv();
  window.location.replace("/events/" + event.id);
  // $(".card card-event").removeClass('form');
  // $(".card card-event").html(eventDiv);
}

var editEventListener = function () {
  $("form.edit_event").on("submit", function(e) {
    e.preventDefault();
    var $form = $(this);
    var action = $form.attr("action");
    var params = $form.serialize();
    $.ajax({
      url: action,
      method: 'PATCH',
      dataType: 'json',
      data: params
    })
    .success(function(json) {
      eventSuccess(json);
    })
    .error(function(response) {
      /* Act on the event */
      console.log('you broke it', response);
    });
  })
}

// var eventDetail = function() {
//   $(".js-more").on("click", function() {
//     var id = $(this).data("id");
//     $.get("/events/" + id + ".json", function(event) {
//       var dom = '';
//       dom += "<p><strong>Begins:</strong> " + event.readable_start_time + "</p>";
//       dom += "<p><strong>Ends: </strong> " + event.readable_end_time + "</p>";
//       dom += "<p><strong>Description:</strong> " + event.description + "</p>";
//       $("#event-" + id + "-detail").html(dom);
//     });
//     $(this).remove();
//   });
// }

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
