class Account < BBCBase
  def visit_page
    visit('id/signin')
  end

  def username(id)
    @browser.text_field(id: id)
  end

  def password(id)
    @browser.text_field(id: id)
  end

  def submit_button(value)
    @browser.button(id: "bbcid_submit_button", value: value)
  end

  def signin
    submit_button("Sign in")
  end

  def register
    submit_button("Register")
  end

  def text_shown
    @browser.div(class: "bbcid-content").text
  end

  def register_link
    @browser.link(href: "https://ssl.bbc.co.uk/id/register?ptrt=http%3A%2F%2Fwww.bbc.co.uk%2Fiplayer")
    #@browser.link(text: "register")
  end

  def your_account
    @browser.link(id: "idcta-link")
  end

  def sign_out
    @browser.link(class: "id4-cta-signout")
  end

  def already_exists_message
    @browser.div(class: "bbcid_error")#.span(class: "bbc_validation_service_emailexists")
  end
end