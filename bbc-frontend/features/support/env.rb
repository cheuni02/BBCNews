require 'watir-webdriver'
require 'webdriver-user-agent'
require 'cucumber'
require 'require_all'
require 'rake'
require 'rest-client'
require 'wait-until'
require 'json'
require 'rspec/expectations'
require 'pry'

require_all 'lib'

#ENV['BBC_PATH']

#base_url = 'http://www.bbc.co.uk/'

profile = Selenium::WebDriver::Firefox::Profile.new

# Firefox performance settings
profile['network.http.pipelining'] = true
profile['network.http.pipelining.maxrequests'] = 8
profile['network.http.pipelining.aggressive'] = true
profile['nglayout.initialpaint.delay'] = 0
profile['browser.cache.use_new_backend'] = 1
profile['network.prefetch-next'] = true
profile['browser.tabs.animate'] = false
profile['browser.display.show_image_placeholders'] = false
profile['network.dns.disableIPv6'] = true
profile['content.notify.backoffcount'] = 5
profile['gfx.direct2d.disabled'] = true
profile['layers.acceleration.disabled'] = true

browser = Watir::Browser.new :firefox, :profile => profile
browser.cookies.clear
browser.window.resize_to 1240, 1024


class CustomWorld
  class << self; attr_accessor :browser end
  def site
    @site ||= (EssoBase.new(CustomWorld::browser))
  end
end
CustomWorld.browser = browser

World do
  CustomWorld.new
end

at_exit do
  browser.close
end
