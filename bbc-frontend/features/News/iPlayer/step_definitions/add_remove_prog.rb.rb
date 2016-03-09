

When(/^I sign in with existing BBC account \- email: '(.*)', and password: '(.*)'$/) do |email, password|
  site.iplayer_home.click_signin
  page = site.signin_page
  page.username.set(email)
  page.password.set(password)
  page.signin.click
end

Given(/^I have signed in as a test user with no videos added to My Programmes > Favourites$/) do
  #pending
end

When(/^I click on TV Guide on iPlayer menu$/) do
  #pending
end

And(/^I click on a channel (.*) from the TV Guide$/) do |channel|
  #pending
end

And(/^I select programme (.*) which is not broadcasted live by clicking its name$/) do |programme|
  #pending
end

And(/^I click on 'Add to favourites' button in the video player page$/) do
  #pending
end

Then(/^The button is now changed to 'Added to Favourites'$/) do
  #pending
end

Given(/^I have added the (\d+) videos$/) do |arg|
  #pending
end

When(/^I navigate to My Programmes > Favourites$/) do
  #pending
end

Then(/^I should now see the (\d+) of them listed$/) do |arg|
  #pending
end

And(/^clicked 'Remove' on one of the videos \- 'The £100k House: Tricks of the Trade'$/) do
  #pending
end

And(/^confirm this removal$/) do
  #pending
end

Then(/^I should now see (\d+) of them listed$/) do |arg|
  #pending
end

Given(/^I have removed (\d+) out of (\d+) videos$/) do |arg1, arg2|
  #pending
end

When(/^I click on the first remaining video \- 'The Great Sport Relief Bake Off'$/) do
  #pending
end

And(/^click play on the video player page$/) do
  #pending
end

And(/^I pause the video$/) do
  #pending
end

And(/^Navigate to My Programmes > Watching$/) do
  #pending
end

Then(/^I should see this video showing there \- 'The Great Sport Relief Bake Off'$/) do
  #pending
end

Given(/^I have (\d+) videos remaining and am watching one of them \- 'The Great Sport Relief Bake Off'$/) do |arg|
  #pending
end

When(/^I pause and return to My Programmes > Favourites$/) do
  #pending
end

And(/^play the second video \- 'Could We Survive a Mega\-Tsunami\?'$/) do
  #pending
end

Then(/^Now I should see both of these videos in My Programmes > Watching \- 'The Great Sport Relief Bake Off', 'Could We Survive a Mega\-Tsunami\?'$/) do
  #pending
end

Given(/^I have not yet signed in$/) do
  #pending
end

When(/^I click on 'My Programmes'$/) do
  #pending
end

And(/^I am on the '(.*)' section$/) do |section|
  #pending
end

Then(/^I should see a message '(.*)'$/) do |message|
  #pending
end

And(/^a sign in button$/) do
  #pending
end

Given(/^I have signed in with existing email: 'test@gmail\.com', and password: 'abcdefghijk'$/) do
  #pending
end

And(/^User has added (\d+) programmes, deleted one and watching another$/) do |arg|
  #pending
end

Then(/^I should see (.*)$/) do |state|
  #pending
end

When(/^I navigate to the TV Guide page$/) do
  #pending
end

And(/^I select a channel \- BBC2$/) do
  #pending
end

And(/^I select a programme which hasn't been broadcast yet$/) do
  #pending
end

Then(/^on the programme player page, there is no 'add to favourites' button$/) do
  #pending
end

And(/^I select a channel \- BBCNEWS$/) do
  #pending
end

And(/^I select a programme which is being broadcast live$/) do
  #pending
end

And(/^I remove all programmes listed$/) do
  #pending
end

And(/^I navigate to My Programmes > Watching$/) do
  #pending
end

And(/^I remove all programmes listed by 'clear history'$/) do
  #pending
end