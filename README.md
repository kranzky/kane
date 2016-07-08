KANE
====

Share your best link each day.

TODO
----

transformation = [
  {
    gravity: "auto",
    aspect_ratio: "3:1",
    crop: "fill"
  },
  {
    width: "auto",
    quality: "auto",
    fetch_format: "auto",
    dpr: "auto"
  },
  {
    width: 1200,
    crop: "limit"
  }
]
cl_image_tag(name, client_hints: true, transformation: transformation)



* Extract all the articles
  + Use random thumbnail if missing or too small: http://loremflickr.com/1200/1200/keyword
  + Use cloudinary migrator to store all images
    - favicon\_url
    - images
      - if in content, replace URL in content
      - if not in content, choose one with largest width, where height > 100
  + Use cloudinary URL arguments to crop and resize on retrieval
    cl_image_tag("white_cat.jpg", :client_hints=>true, :transformation=>[{:gravity=>"auto", :aspect_ratio=>"3:1", :crop=>"fill"}, {:width=>"auto", :quality=>"auto", :fetch_format=>:auto, :dpr=>"auto"}, {:width=>1200, :crop=>"limit"}])
  + Load ten at random
  + Display one at a time as cards
  + Display compact card as a feed once they're all seen
  + Make sidebar sticky, and make it appear only when read
* Deploy to Heroku and share with the guys
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

Copyright
---------

Copyright (c) 2016 Jason Hutchens. See UNLICENSE for further details.
