class BrowserContainer
  def initialize(browser)
    @browser = browser
  end

  def visit(path)
    #path = ENV['BBC_PATH'].to_s
    @browser.goto("#{ENV['BBC_HOST']}/" << path)
  end
end