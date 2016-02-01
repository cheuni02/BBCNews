class BrowserContainer
  def initialize(browser)
    @browser = browser
  end

  def visit
    @browser.goto('http://www.bbc.co.uk/' << ENV['BBC_PATH'])
  end
end