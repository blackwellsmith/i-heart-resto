#nested index route 

restaurants/1/reviews <<< will take us to reviews index page for restaurant 1>>>

Nested Routes in learn curiculum

<%= r.label :user_id, "Select User" %>
    <%= r.collection_select :user_id, User.all, :id, :username %>