class BBCBase < BrowserContainer
  def news_home
    NewsHome.new(@browser)
  end
end