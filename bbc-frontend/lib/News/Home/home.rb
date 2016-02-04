class NewsHome < BBCBase
  include WatirPageHelper

  attr_accessor:direct_url
  attr_accessor:expected_title

  def initialize(browser, visit = false)
    @browser = browser
    @direct_url  = "www.bbc.co.uk/news"
    @expected_title = "Home - BBC News"
    goto if visit

    expected_title if respond_to?(:expected_title)
  end

end