class BBCBase < BrowserContainer

  def news_home
    NewsHome.new(@browser,true)
  end
end