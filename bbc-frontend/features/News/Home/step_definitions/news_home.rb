Given(/^I am on the BBC News home page$/) do
  site.news_home.visit('news')
end

Then(/^I should see the BBC News title$/) do
  expect(site.news_home.page_title).to eq("Home - BBC News")
end

And(/^The main BBC header$/) do
 ##pending
  #expect(site.news_home.bbc_news_cookie).to be_present

end

And(/^The headline$/) do
  #pending
end

And(/^The subsections$/) do
  #pending
end

And(/^The Watch n Listen section$/) do
  #pending
end

And(/^The BBC News Services section$/) do
  #pending
end

And(/^The BBC Taster Footer$/) do
  #pending
end

Then(/^A cookie message should appear$/) do
  expect(site.bbc_cookies.object).to be_present
  expect(site.bbc_cookies.continue_button).to be_present
end