class Account < BBCBase
  def visit_page
    visit('id/signin')
  end

  def username
    @browser.text_field(id: "bbcid_unique")
  end

  def password
    @browser.text_field(id: "bbcid_password")
  end

  def signin
    @browser.button(id: "bbcid_submit_button")
  end

  def register_link
    @browser.link(href: /https\:\/\/ssl.bbc.co.uk\/id\/register\?/)
  end

end