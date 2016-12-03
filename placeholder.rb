# Automate placehold.it/wxh
# @author Rakib

# gems
require 'watir-webdriver'
require 'open-uri'
require 'fastimage'
require 'phantomjs'

# native
require 'openssl'
require 'pp'
require 'fileutils'

class String
  def string_between_markers(marker1, marker2)
    self[/#{Regexp.escape(marker1)}(.*?)#{Regexp.escape(marker2)}/, 1]
  end
  def string_contains(regex)
    /#{regex}/ =~ self
  end
end

# secure avoidance
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

Selenium::WebDriver::PhantomJS.path = 'phantomjs.exe'

# Look for adjacent files of all ext.
files = File.join(Dir.pwd, "**","*.*")

# If nothing found, do nothing
exit if files.nil?

image_size = Array.new
Dir.glob(files).each do |images|
  if images.string_contains(/jpg/) || images.string_contains(/png/) # || add more ext.
    image_size = FastImage.size(images)
    browser = Watir::Browser.new :phantomjs
    url = 'https://placeholdit.imgix.net/~text?txtsize=33&txt='<<image_size[0].to_s<<'%C3%97'<<image_size[1].to_s<<'&w='<<image_size[0].to_s<<'&h='<<image_size[1].to_s
    browser.goto url
    image_src = browser.body.image.src
    File.open(images, 'wb') do |file_write|
      open(image_src, 'rb') do |file_read|
        file_write.write(file_read.read)
      end
    end
    browser.close
  end
end
