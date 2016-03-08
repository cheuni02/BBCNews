class BBCBase < BrowserContainer
  # include Cookies
  #
  # def bbc_cookies
  #   Cookies::Cookies_banner.new(@browser)
  # end

  include BBCHeader


  def my_bbc
    BBCHeader::MyBBC.new(@browser)
  end

  def news_home
    NewsHome.new(@browser,true)
  end

  def iplayer_home
    IPlayer.new(@browser,true)
  end

  def page_title
    @browser.title
  end


end