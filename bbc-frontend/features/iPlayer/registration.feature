@register
Feature: Register New BBC user
  As a user
  I want to be able to register to the BBC site to obtain a BBC iD
  So I can get the most out of the iPlayer site

# pre-requisites

Background: navigating to register page for a new user
  Given I am in the BBC iPlayer homepage
  When I click on 'Sign In'
  Then I should arrive to the 'Sign in - BBC iD' page
  And when I click on the link on 'Don't have a BBC iD? Please register.'
  Then I should arrive to the 'Register - BBC iD' page

# user story test cases

Scenario: Register successfully with an existing email and a new password (end to end happy path)
  Given I already have set up an email address set up
  When I type that email address into the Email field
  And I type a password which is valid ie more than 6 characters : 'Abcd!1234'
  And retype it in 'Confirm password'
  And press 'Register'
  Then I should be taken to the Your registration is complete page
  And I should recieve an email
  And I should be able to log out


Scenario: Verify that previously registered emails aren't retyped (negative)
  Given I have an already registered BBC iD user with an email address
  When I type that email address into the Email field
  Then a red exclamation mark shows on the field
  And a validation message should appear: 'This email address is already registered'

Scenario: Verify that an email address not registered with BBC before can be typed
  Given I have an email address not registered with BBC before
  When I type that email address into the Email field
  Then a green tick appears on the field
  And no label hint shows

Scenario Outline: Verify that there are validation checks on the format of the email/username (negative)
  When I type in the email field - '<email>', which <test>
  Then an orange exclamation mark shows on the field
  And there's a validation message showing - '<validation message>'

  Examples:
    | email       | test                                            | validation message               |
    | steve@      | does not have an <string>.<string> following it | This isn't quite an email address|
    | steve@gmail | does not have an .<string> following it         | This email address is not valid  |
    |             | is null                                         | Please enter your username       |


Scenario Outline: Verify that there are validation checks on the password entered (negative)
  When I type in the New password field - '<password>', which <test>
  Then an orange exclamation mark shows on the field
  And There's a validation message showing - '<validation message>'

  Examples:
    | password                                            | test                                                         | validation message         |
    | a                                                   | 1 character, below the 6 character minimum for a password    | This is too short          |
    | abdce                                               | 5 characters, below the 6 character minimum for a password   | This is too short          |
    | axczczxczxczxzczxczxczxczxczxczxczczxczxczx!@£$1234 | 51 characters, above the 50 character maximum for a password | This is too long           |
    | axczczxczxczxz!@£$1234xczxczxczxczczxczxczxczxbnb   | 49 characters, below the 6 character minimum for a password  | This is too short          |
    |                                                     | is null                                                      | Please enter your password |

Scenario Outline: Verify that a validation message appears when the first and confirmation passwords entered don't match and user cannot proceed registration
  Given I type email 'test1@test.com' into Email field
  When I type in the New password field - '<new password>'
  And I type in the Confirmation password field - '<confirm password>'
  Then an orange exclamation mark shows on the field
  And There's a validation message showing - '<validation message>'
  And The 'Register' button is disabled

  Examples:
    | new password | confirm password | validation message    |
    | abcdefgh     |                  | These do not match    |
    |              | abcdefgh         | This is too short     |
    | abcd1234     | abcd12345        | These do not match    |
    | ABCD1234     | abcd1234         | These do not match    |

Scenario Outline: verify that password format validation messages take priority over mismatch messages
  Given I type email 'test1@test.com' into Email field
  When I type in the New password field - '<new password>' which is <test>
  And I type in the Confirmation password field - '<confirm password>' which does not match
  But since the password format validation messages are a priority over the mismatch messages
  Then the format validation message should show <validation message> instead

  Examples:
  | new password | confirm password  | test                                                         | validation message         |
  | a            | ab                | 1 character, below the 6 character minimum for a password    | This is too short          |
  | abdce        | abc               | 5 characters, below the 6 character minimum for a password   | This is too short          |


# other test cases

Scenario: User decides to 'Cancel' registering (positive)
  Given I have landed on the 'BBC iD Sign In' page
  When I click on 'Cancel'
  Then I should be taken back to the iPlayer homepage
  And the 'sign in' button remains as 'sign in'

# rollback

Scenario: Rollback - Delete your BBC iD so that user can be re-used if the tests above were re-run
  Given I have removed both Facebook and Google links to my account
  And I am on 'Your Details' page
  When I click on 'Delete your BBC iD'
  And confirm deletion on the next page