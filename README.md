devopsdays-sponsor-logo
========
A sinatra app for generating logos for devopsdays sponsors


Installing
-------------------

#### Gem install

install dependencies

    bundle install

Usage
---------------

start local webserver
    ruby sponsor.rb

hit a URL to make a logo, using a link to the company's logo in the URL, eg:

    curl http://localhost:4567/render/
    

ToDo
-----

  * Allow local image to be uploaded
  * CLI version?
  * convert to sRGB if logo has embedded ICC profile
  * Host it somewhere free?
