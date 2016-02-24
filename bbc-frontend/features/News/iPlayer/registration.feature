Feature: Register New BBC user
  As a user
  I want to be able to register to the BBC site to obtain a BBC iD
  So I can get the most out of the iPlayer site

Background: navigating to register page for a new user
  Given I am on the BBC iPlayer page 'http://www.bbc.co.uk/iplayer'
  When I click on 'Sign In'
  Then I should arrive to the 'Sign in - BBC iD' page
  And when I click on the link on 'Don't have a BBC iD? Please register.'
  Then I should arrive to the 'Register - BBC iD' page


Scenario: Register successfully with an existing email and a new password (happy path)
  Given I already have set up an email address: 'test1@test.com'
  When I type that email address into the Email field
  And I type a password which is valid ie more than 6 characters : '1234567'
  And retype it in 'Confirm password'
  And press 'Register'
  Then I should be taken to the registration successful confirmation page
  And I should recieve an email in: 'test1@test.com'

Scenario: Attempting to register a new user with an email which is already registered (negative)
  Given I have an already registered user with email: 'inhcheung@gmail.com'
  When I type that email address into the Email field
  Then a validation message should appear: 'This email address is already registered'

Scenario Outline: Attempting to register a new user with an email which is in the wrong format (negative)
  When I type an email address <email> which <test>
  Then a validation message should appear: <validation message>

  Examples:
    | email       | test | validation message |
    | steve       | does not have an @<string>.<string> following it | This email address is not valid |
    | steve@      | does not have an <string>.<string> following it | This email address is not valid |
    | steve@gmail | does not have an <string>.<string> following it | This email address is not valid |

Scenario Outline: Attempting to register but providing a new password which is invalid (negative)
  Given I already have set up an email address: 'test1@test.com'
  When I type that email address into the Email field
  And I type a password which is <test> - <password>
  And retype it in 'Confirm password'
  And press 'Register'
  Then message will appear <message>

  Examples:
   | test | password | message |
   | less than 6 characters | abcd                                                 ||
   | more than 50 characters | axczczxczxczxzczxczxczxczxczxczxczczxczxczxczxfghjt ||


Scenario: Registering with personalised updates sent to email (happy path)



Scenario: Pressing 'Cancel' (positive)
