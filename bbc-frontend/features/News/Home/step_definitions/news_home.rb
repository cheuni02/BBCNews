Given(/^I am on the BBC News homepage$/) do
  @page = NewsHome.new(@browser,true)
  site.news_home.visit('news')
end

Then(/^I should see the BBC News title$/) do
  expect(@page.expected_title).to eq("Home - BBC News")
end