#!/usr/bin/env ruby
require './lib/sponsor.rb'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: render.rb -f file -u uri -o output"

  opts.on('-f', '--input FILE', 'path to local image') { |v| options[:local_image] = v }
  opts.on('-u', '--uri URI', 'URI of remote image') { |v| options[:remote_image] = v }
  opts.on('-o', '--output FILE', 'name of output file, defaults to sponsor.png') { |v| options[:output_file] = v }

end.parse!

#We need an image from somewhere
raise OptionParser::MissingArgument if options[:local_image].nil? && options[:remote_image].nil?


output_filename = options[:output_file] ||= "sponsor.png"


#get the image
if options[:local_image]
  logo = fetch_local_logo(options[:local_image])
elsif options[:remote_image]
  logo = fetch_remote_logo(options[:remote_image])
end

File.open(output_filename, 'w') {|f| f.write(render_logo(logo).to_blob) }