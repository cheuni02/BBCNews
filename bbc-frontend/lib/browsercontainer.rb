class BrowserContainer

  #include PageObject
  include WatirPageHelper
  include Minitest::Assertions



  # attr_accessor:direct_url
  # attr_accessor:expected_title
  BBC_URL = "www.bbc.co.uk/"

  direct_url BBC_URL
  expected_title "Home - BBC News"

  #text_field(:username, :id => 'username')
  # text_field(:password, :id => 'password')
  # button(:login, :id => 'login')
  #button(:find_local, :class => 'find-local-wide__link')


  def initialize(browser, visit = true)
    @browser = browser
    goto if visit

    response = RestClient.get BBC_URL
    assert_equal 200,response.code
    #expect(response.code).to eq(200)

    has_expected_title? if respond_to? :has_expected_title

  end

  def visit(path)
    #path = ENV['BBC_PATH'].to_s
    @browser.goto("#{ENV['BBC_HOST']}/" << path)
  end
end