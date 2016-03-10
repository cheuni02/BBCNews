Feature: Signing in as BBC user
  As a registered BBC user with a BBC iD
  I should be able to log in to the BBC site
  And View my account

# pre-requisites

Background: Navigating to the iPlayer homepage with account already set up about to log in
  Given I have already registered with username: 'test@gmail.com' and password: 'abcdefghijk'
  But not logged in yet
  When I am in the BBC iPlayer homepage
  Then there's a 'Sign in' button at the top next to BBC icon

# user story test cases

Scenario: Verify user can Navigate to 'BBC iD Sign In' page from iPlayer homepage
  When I click on 'Sign in' button
  Then I have landed on the 'BBC iD Sign In' page

Scenario: Logging in with an existing account (happy path)
  Given I have already registered and have navigated to sign in page from homepage
  When I type in the username field - 'test@gmail.com'
  And  I type in the password field - 'abcdefghijk'
  And I press the 'Sign in' button
  Then I should be redirected back to iPlayer homepage
  But the 'sign in' button is now replaced by 'Your account'

Scenario Outline: Attempting to log in with an username which is correct format but does not exist  (negative)
  Given I have already registered and have navigated to sign in page from homepage
  When I type in I type in the username field - '<username>' which does not exist
  And  I type in any string for the password field - 'abdef12345'
  And I press the 'Sign in' button
  Then There is no response
  But There's a validation message showing - 'This combination isn't right'

  Examples:
    | username |
    | TestUsername |
    | test@testy.com |



Scenario Outline: Verify that there are validation checks on the format of the email/username
  Given I have already registered and have navigated to log in page from homepage
  When I type in the username field - '<username>', which <test>
  Then There's a validation message showing - '<validation message>'

  Examples:
    | username    | test                                            | validation message               |
    | steve@      | does not have an <string>.<string> following it | This isn't quite an email address|
    | steve@gmail | does not have an .<string> following it         | This email address is not valid  |
    |             | is null                                         | Please enter your username       |



Scenario Outline: Verify that there are validation checks on the password entered (negative)
  Given I have already registered and have navigated to log in page from homepage
  When I type in the password field - '<password>', which <test>
  Then There's a validation message showing - '<validation message>'

  Examples:
    | password                                            | test                                                         | validation message         |
    | a                                                   | 1 character, below the 6 character minimum for a password    | This is too short          |
    | abdce                                               | 5 characters, below the 6 character minimum for a password   | This is too short          |
    | axczczxczxczxzczxczxczxczxczxczxczczxczxczx!@£$1234 | 51 characters, above the 50 character maximum for a password | This is too long           |
    | axczczxczxczxz!@£$1234xczxczxczxczczxczxczxczxbnb   | 49 characters, below the 6 character minimum for a password  | This is too short          |
    |                                                     | is null                                                      | Please enter your password |



  # some other test cases to consider


Scenario: logging in with Facebook - existing BBCiD not yet linked with Facebook account (positive)
  Given I have already set up a Facebook account with username : 'fbUsername', and password: 'fbPassword'
  And I have already registered with username: 'test@gmail.com' and password: 'abcdefghijk'
  But have not yet linked my BBC iD with my Facebook account
  And I am on the log in page
  When I click on the Facebook button under 'Other ways to sign in'
  And provide the Facebook username and password to the Facebook login page
  And Log In
  And accepted the message for allowing BBC website to access my basic info
  And press 'Sign in to link' on the 'Nearly there...Already have a BBC iD?' page
  And I sign in with existing BBC account - email: 'test@gmail.com', and password: 'abcdefghijk'
  Then I should be on 'All done' page with a message 'You can now sign in using either your BBC iD or your Facebook account.'

Scenario: logging in with Facebook- existing BBCiD already linked with Facebook account
  Given my BBC iD already linked with my Facebook account
  And I am on the log in page
  When I click on the Facebook button under 'Other ways to sign in'
  And log in with the Facebook username and password to the Facebook login page
  Then I should be taken back to the iPlayer homepage
  And the 'sign in' button is now replaced by 'Your account'

Scenario: logging in with Google+ - existing BBCiD not yet linked with Google account (positive)
  Given I have already set up a Google+ account with username : 'gUsername', and password: 'gPassword'
  And I have already registered with username: 'test@gmail.com' and password: 'abcdefghijk'
  But have not yet linked my BBC iD with my Facebook account
  When I attempt to log in with my Google+ credentials
  And I sign in with existing BBC account - email: 'test@gmail.com', and password: 'abcdefghijk'
  Then I should be on 'All done' page with a message 'You can now sign in using either your BBC iD or your Google account.'

Scenario: logging in with Google+ - existing BBCiD already linked with Google account
  Given my BBC iD already linked with my Google account
  And I am on the log in page
  When I click on the Google+ button under 'Other ways to sign in'
  And log in with the Google+ username and password to the Google login page
  Then I should be taken back to the iPlayer homepage
  And the 'sign in' button is now replaced by 'Your account'

Scenario: Reset Password (positive)
  Given I have already registered and have navigated to log in page from homepage
  But I have forgotten my password
  When I press the 'Forgot your password?' button
  And provide the email address 'test@gmail.com'
  And press 'Send Email'
  Then I should get a notification 'Please check your inbox'
  And I should also recieve an email from 'noreply@bbc.co.uk' with a link to reset password


Scenario: 'Remember me' checkbox (positive)
  Given I have landed on the 'BBC iD Sign In' page
  And I click on 'Remember me' checkbox
  When I sign in with BBC iD credentials
  And accept browser alert for saving password
  And then log out
  And return to the log in page
  Then my username and password credentials will remain


Scenario: User decides to 'Cancel' signing in (positive)
  Given I have landed on the 'BBC iD Sign In' page
  When I click on 'Cancel'
  Then I should be taken back to the iPlayer homepage
  And the 'sign in' button remains as 'sign in'

# rollback

Scenario: Rollback - remove BBC iD link to FaceBook and Google accounts so that user can be re-used if the tests above were re-run
  Given I have logged on as registered BBC user with 'Remember me' checked
  And I am in the BBC iPlayer homepage
  When I click on 'Your account'
  And I click on 'Visit settings'
  And I reconfirm email and password for security purposes
  And click on 'Edit' under 'Your Details > Linked Accounts'
  And Unlink both Google and Facebook accounts

Scenario: Rollback - Delete your BBC iD
  Given I have removed both Facebook and Google links to my account
  And I am on 'Your Details' page
  When I click on 'Delete your BBC iD'
  And confirm deletion on the next page


