require 'RMagick'
require 'sinatra'
require 'open-uri'
include Magick

set :protection, :except => :path_traversal

# http://localhost:4567/?logo=https://dl.dropbox.com/u/327815/pd_PD.png
get '/' do
  erb :index, :locals => { :logo => params['logo'] }
end


get '/render/*' do  
  content_type 'image/PNG'
  logo = params[:splat].first

  remote = Magick::ImageList.new
  remote.from_blob(open(logo).read)
  remote.resize_to_fit!(300, 300)
  
  image = Magick::ImageList.new
  image.new_image(310, 310) {self.background_color = "white"}  
  image = image.composite(ImageList.new("square.png"), Magick::NorthWestGravity, 0, 0, Magick::AtopCompositeOp)
  image = image.composite(remote, Magick::CenterGravity, 0, 0, Magick::OverCompositeOp)

  image.format = "png"
  return image.to_blob

end