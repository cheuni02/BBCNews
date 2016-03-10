When(/^I click on 'Sign In'$/) do
  site.iplayer_home.click_signin
end

Then(/^I should arrive to the 'Sign in \- BBC iD' page$/) do
  expect(site.page_url).to match(/https\:\/\/ssl.bbc.co.uk\/id\/signin/)
end

And(/^when I click on the link on 'Don't have a BBC iD\? Please register\.'$/) do
  site.signin_page.register_link.click
end

Then(/^I should arrive to the 'Register \- BBC iD' page$/) do
  expect(site.page_url).to match(/https\:\/\/ssl.bbc.co.uk\/id\/register/)
end

Given(/^I already have set up an email address set up$/) do
  ENV['EMAIL'] = "#{Time.now.to_i}-test@example.com"
end

When(/^I type that email address into the Email field$/) do
  @page = site.signin_page
  @page.username("bbcid_email").set(ENV['EMAIL'])
end

And(/^I type a password which is valid ie more than 6 characters : '(.*)'$/) do |password|
  ENV['PW']= password
  @page.password("bbcid_createpassword").set(ENV['PW'])
end

And(/^retype it in 'Confirm password'$/) do
  @page.password("bbcid_confirmpassword").set(ENV['PW'])
end

And(/^press 'Register'$/) do
  @page.register.click
end

Then(/^I should be taken to the (.*) page$/) do |word|
  expect(@page.text_shown).to include(word)
  expect(@page.text_shown).to include('You’re registered as:')
  expect(@page.text_shown).to include(ENV['EMAIL'])
end

And(/^I should recieve an email$/) do
  ENV['REG_STATUS'] ||= "registered"
end

And(/^I should be able to log out$/) do
  @page.your_account.click
  @page.sign_out.click
end

Given(/^I have an already registered BBC iD user with an email address$/) do

  if ENV['REG_STATUS'] != "registered"
    steps %(
      Given I already have set up an email address set up
      When I type that email address into the Email field
      And I type a password which is valid ie more than 6 characters : '1234567'
      And retype it in 'Confirm password'
      And press 'Register'
      Then I should be taken to the Your registration is complete page
      And I should recieve an email
    )
  end
end

Then(/^a red exclamation mark shows on the field$/) do
end

And(/^a validation message should appear: 'This email address is already registered'$/) do
  binding.pry
  expect(@page.already_exists_message.present?).to be true

end

Given(/^I have an email address not registered with BBC before$/) do
  step %(Given I already have set up an email address set up)

end

Then(/^a green tick appears on the field$/) do

end

When(/^I type in the email field \- '(.*)', which (.*)$/) do |email, test|

end

Then(/^an orange exclamation mark shows on the field$/) do

end

And(/^there's a validation message showing \- '(.*)'$/) do |validation_message|

end

When(/^I type in the New password field \- '(.*)', which (.*)$/) do |password, test|

end

And(/^There's a validation message showing \- '(.*)'$/) do |validation_message|

end

Given(/^I type email 'test1@test\.com' into Email field$/) do

end

When(/^I type in the New password field \- '(.*)'$/) do |new_password|

end

And(/^I type in the Confirmation password field \- '(.*)'$/) do |confirm_password|

end

And(/^The 'Register' button is disabled$/) do

end

When(/^I type in the New password field \- '(.*)' which is (.*)$/) do |new_password, test|

end

And(/^I type in the Confirmation password field \- '(.*)' which does not match$/) do |confirm_password|

end

But(/^since the password format validation messages are a priority over the mismatch messages$/) do

end

Then(/^the format validation message should show (.*) instead$/) do |validation_message|

end

Given(/^I have landed on the 'BBC iD Sign In' page$/) do

end

When(/^I click on 'Cancel'$/) do

end

Then(/^I should be taken back to the iPlayer homepage$/) do

end

And(/^the 'sign in' button remains as 'sign in'$/) do

end

Given(/^I have removed both Facebook and Google links to my account$/) do

end

And(/^I am on 'Your Details' page$/) do

end

When(/^I click on 'Delete your BBC iD'$/) do

end

And(/^confirm deletion on the next page$/) do

end


