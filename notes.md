Main objectives:
1. DONE - ruby framework
2. DONE - Your models must include a has_many, a belongs_to, and a has_many :through relationship - DONE
3. DONE - The join model must also store an additional attribute describing the relationship -DONE(Comment model)
4. DONE - Your models should include reasonable validations for the simple attributes. - DONE
5. WIP - You must include at least one class level ActiveRecord scope methods. - TODO (Upcoming events?)
6. DONE - You must include a nested form that writes to an associated model through a custom attribute writer. - DONE(Tags)
7. DONE - Your application must provide a standard user authentication, including signup, login, logout, and passwords. - DONE (Devise)
8. WIP - Your authentication system should allow login from some other service. Facebook, twitter, foursquare, github, etc...- WIP(github)
9. DONE - You must make use of a nested resource with the appropriate RESTful URLs. - DONE(Comments)
10. DONE - Your forms should correctly display validation errors - WIP
11. WIP - Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app. - WIP

1. Models:
  -Event has many tags
  -Event has many users
  -Event has many comments through users

  -User has many events
  -User has many comments

  -Tag has many tags

  -Comments belong to a user
  -comment belongs to a event

2. Views:
  -user home page shows events last three comments
    -shows users' events
    -shows events user is attending
  -event page shows attendees and organizer
    -shows event tags, time, and details
    -shows comments about events
  -tag page shows events
    -shows comments about the tag

3. Features:
  -Users can create an event
  -Users can assign a tag to an event
  -User can create a tag through event
  -user can comment on an existing event
  -user can edit or destroy their own events/comments
  -only admins can edit and destroy events/comments/tags of other users
  -users can join events as attendees



4. Add roles for users and admins
  -users can edit their names
  -users can create events and comments
  -users can delete their own events and comments
  -users cannot delete or edit other users comments, events, and names

  -moderators can do everything a user can do
  -moderators can also edit and delete comments on events given permission

  -admin can do everything
