require 'RMagick'
require 'open-uri'
include Magick


def fetch_remote_logo(url)
  logo = Magick::ImageList.new
  logo.from_blob(open(url).read)
  logo.resize_to_fit!(300, 300)
end

def fetch_local_logo(file)
  logo = Magick::ImageList.new(file)
  logo.resize_to_fit!(300, 300)
end

def render_logo(logo)
  image = Magick::ImageList.new
  image.new_image(310, 310) {self.background_color = "white"}  
  image = image.composite(ImageList.new("square.png"), Magick::NorthWestGravity, 0, 0, Magick::AtopCompositeOp)
  image = image.composite(logo, Magick::CenterGravity, 0, 0, Magick::OverCompositeOp)
  image.format = "png"
  return image  
end


render_logo(fetch_remote_logo('https://dl.dropbox.com/u/327815/pd_PD.png'))