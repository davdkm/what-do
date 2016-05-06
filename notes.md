1. Models:
  -Event has a location
  -Event has many users
  -Event has many comments through users

  -User has many events
  -User has many comments
  -User has many locations through events or comments

  -Location belongs to an event
  -location has many comments
  -location has many users through comments

  -Comments belong to a user
  -comment belongs to a event
  -comment belongs to a location

2. Views:
  -user home page shows events last three comments
    -shows users' events
    -shows events user is attending
  -event page shows attendees and organizer
    -shows event location, time, and details
    -shows comments about events
  -location page shows details and events held at the location
    -shows comments about the location

3. Features:
  -Users can create an event
  -User can create a location through event
  -user can comment on an existing event or location
  -user can edit or destroy their own events/comments
  -only admins can edit and destroy events/comments/locations of other users
  -users can join events as attendees
