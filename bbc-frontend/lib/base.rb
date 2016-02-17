class BBCBase < BrowserContainer
  include Cookies

  def bbc_cookies
    Cookies::Cookies_banner.new(@browser)
  end

  def news_home
    NewsHome.new(@browser,true)
  end
end