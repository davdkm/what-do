#wat-do

This is a simple app that tracks events. Sign up for an account and then start tracking your events and other's events that you'd like to attend.

Check it out at http://wat-do-app.herokuapp.com/

##Usage
###Event Creation

Visit the New Events link and enter the details of your event. Click Submit to create your event.

###Add Comments

Comment on any event by entering in a message and clicking the Comment button. Edit or remove your comments with the 'Edit' and 'X' buttons.

##Contributing
###Submitting changes

Please send a [GitHub Pull Request to davdkm] (https://github.com/davdkm/wat-do/compare) with a clear list of what you've done (read more about [pull requests](http://help.github.com/pull-requests/)). When you send a pull request, including RSpec examples would be much appreciated. Please follow our coding conventions (below) and make sure all of your commits are atomic (one feature per commit).

Always write a clear log message for your commits. One-line messages are fine for small changes, but bigger changes should look like this:

$ git commit -m "A brief summary of the commit
>
> A paragraph describing what changed and its impact."
Coding conventions

Start reading our code and you'll get the hang of it. We optimize for readability:

Indent using two spaces (soft tabs)
Try to avoid logic in views, putting HTML generators into helpers
Put spaces after list items and method parameters ([1, 2, 3], not [1,2,3]), around operators (x += 1, not x+=1), and around hash arrows.

##License
This code is free to use under the terms of the MIT license. https://opensource.org/licenses/MIT
