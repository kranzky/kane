KANE
====

Share your best link each day.

Design
------

* User
  + name
  + profile
  + settings
  +
  + shares
  + stats
  + curators

* Profile
  + image
  + name

* Settings
  + subscribed
  + credits
  + timezone

* Share
  + position
  + user
  + content

* Content
  + title
  + description
  + body
  + publish date
  + url
  + creator
  + tags
  + thumbnail
  + type (banned, external, naive, premium)
  + language
  +
  + shares
  + stats

* Creator
  + name
  + favicon
  + url
  + contents

* Stat
  + user
  + content
  + reaction
  + saved / deleted / whatever
  + seen count
  + view count
  + total time
  + percentage viewed

* Reaction
  + emoji
  + stats

TODO
----

* Create data model
  + Handle errors when extracting
  + Ensure published at works
  + Add source and authors
  + Process images through cloudinary
  + Move extraction to a worker
* Write tests
* Seed data from Slack
* Create basic layout that displays the feed
  + Download content and image dimensions so viewing is instantaneous
  + Stream images on view
* Twitter authentication
* Ability to post
* Job to extract and to schedule posts
* Deploy to Heroku

Copyright
---------

Copyright (c) 2016 Jason Hutchens. See UNLICENSE for further details.
