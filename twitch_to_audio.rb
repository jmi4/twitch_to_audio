#!/usr/bin/env ruby
require 'optparse'

options = {twitch_url: nil, name: nil, dont_delete: nil}

parser = OptionParser.new do |opts|
  opts.banner = 'Usage: twitch_to_audio.rb [options]'

  opts.on('-t', '--twitch-url input', 'URL to the twitch video') do |twitch_url|
    options[:twitch_url] = twitch_url
  end

  opts.on('-n', '--file-name name', 'Name you want the file to be with no file extention') do |name|
    options[:name] = name
  end

  opts.on('-d', '--dont_delete', 'Dont delete video file') do |dont_delete|
    options[:dont_delete] = dont_delete
  end

  opts.on('-h', '--help', 'Displays Help') do
    puts opts
    exit
  end
end

parser.parse!

# List of needed dependencies
needed_deps = %w(streamlink ffmpeg)

# Checking if needed dependencies exist
needed_deps.each do |dep|
  raise "Please install: #{dep}" unless system("which #{dep} > /dev/null 2>&1")
end

puts 'Going to start downloading the stream from Twitch now'
system("streamlink -o ./#{options[:name]}.mp4 --hls-segment-threads 4 #{options[:twitch_url]} best")

puts 'Going to start ripping audio from video'
system("ffmpeg -i #{options[:name]}.mp4 -vn -acodec copy #{options[:name]}_audio.m4a")

puts 'Deleting video file' unless options[:dont_delete]
system("rm -rf #{options[:name]}.mp4") unless options[:dont_delete]
