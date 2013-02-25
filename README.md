devopsdays-sponsor-logo
========
A command line app for generating logos for devopsdays sponsors


Installing
-------------------


    git clone git://github.com/agoddard/devopsdays-sponsor-logo.git
    cd devopsdays-sponsor-logo
    bundle install

Usage
---------------

Pass a local image with -f or a uri with -u to render.rb, optionally specify the output filename with -o
    
    ./render.rb -f /path/to/file.png -o output.png
    ./render.rb -u http://example.com/image.png -o output.png


TODO
-----

  * convert to sRGB if logo has embedded ICC profile
  * web version & host it somewhere free?
  * Get more sleep
