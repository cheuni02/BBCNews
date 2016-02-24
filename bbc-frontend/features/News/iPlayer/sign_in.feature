Feature: Signing in as BBC user
  As a registered BBC user with a BBC iD
  I should be able to log in to the BBC site
  And View my account

Background: Navigating to the Log in page with account already set up (pre-requisites)
  Given user has already registered with username: 'aFirstname' and password: 'aSurname'
  And has landed on the 'BBC iD Sign In' page

Scenario: Logging in with an existing account (happy path)



Scenario Outline: Logging in with a correct username but incorrect password (negative)



  Examples:
    | password | message |

Scenario Outline: Logging in with a correct username but incorrect password (negative)

  Examples:
    | username | verification message |
    | a

Scenario Outline: Testing verification messages when entering username

  Examples:
    | username                                            | test          | verification message |
    | a                                                   | too short     | This is too short    |
    | axczczxczxczxzczxczxczxczxczxczxczczxczxczxczxzxczx | 51 characters | This is too long     |
    | axczczxczxczxzczxczxczxczxczxczxczczxczxczxczxbnb   | 49 characters |                      |

Scenario: Reset Password (positive)

Scenario: 'Remember me' checkbox (positive)

Scenario: Pressing 'Cancel' (positive)

Scenario: logging in with Facebook (positive)
  Given I have already set up a Facebook account with username : 'fbUsername', and password: 'fbPassword'
  When I click on the Facebook button under 'Other ways to sign in'
  And provide those details
  And submit
  Then I should be able to log in

Scenario: logging in with Google+ (positive)
  Given I have already set up a Google+ account with username : 'gUsername', and password: 'gPassword'
  When I click on the Facebook button under 'Other ways to sign in'
  And provide those details
  And submit
  Then I should be able to log in
