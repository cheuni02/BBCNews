Given(/^I am on the BBC News homepage$/) do
  site
  sleep(5)
  #site.news_home.visit('news')
end

Then(/^I should see the BBC News title$/) do
  #expect(site.news_home.expected_title).to eq("Home - BBC News")
end