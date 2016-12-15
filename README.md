KANE
====

Share your best link each day.

TODO
----

* Pivot: Implement Rosebud
  + This will be a separate library for content extraction
* Process all the content
  + One-by-one, extract all images and don't modify content directly
    - Also extract images that are linked to
    - Improve extract performance for first 20 sites
  + Display images with empty preview
  + Display external posts with style
  + Display reactions in preview card
  + Display total views in content sidebar
* First version of interface
  + Load ten posts (with content) at random
  + Format as JSON with everything we need
  + Display unseen as a modal card
  + Display seen as a feed, click on entire thing to read
  + When reading, make sidebar sticky and appear only when read
  + Always open links in new window
  + Easily close content when reading (big sticky close button)
  + Make title bar appear/hide when scroll
* Deploy to Heroku and share with the guys
  + Add skylight and rollbar and papertrail
---
* Finish writing specs
* Twitter authentication
* Ability to post
  + run job to extract content
  + post immediately initially
* Job to schedule posts
  + post queue and timezone stuff
* Gather and update statistics
* Implement reactions
* Implement profile pages for all users
* Implement search
* Implement history

Copyright
---------

Copyright (c) 2016 Jason Hutchens. See UNLICENSE for further details.
