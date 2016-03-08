@add_remove_programme
Feature: Adding, Removing and watching programmes to/ from your favourites
  As a registered BBC user with a BBC iD
  I should be able to add or remove programmes to my 'Favourites'
  And be able to watch any of them

# pre-requisites

Scenario: Navigate to the BBC iPlayer homepage and sign in
  Given I am in the BBC iPlayer homepage
  When I sign in with existing BBC account - email: 'test@gmail.com', and password: 'abcdefghijk'


# user story test cases

Scenario Outline: Add 3 programmes from TV guide
  Given I have signed in as a test user with no videos added to My Programmes > Favourites
  When I click on TV Guide on iPlayer menu
  And I click on a channel <channel> from the TV Guide
  And I select programme <programme> which is not broadcasted live by clicking its name
  And I click on 'Add to favourites' button in the video player page
  Then The button is now changed to 'Added to Favourites'

  Examples:
  | channel | programme |
  | BBC1    | The Great Sport Relief Bake Off |
  | BBC2    | The £100k House: Tricks of the Trade |
  | BBC4    | Could We Survive a Mega-Tsunami?     |

Scenario: Verify that the 3 videos just added are stored in My Programmes > Favourites
  Given I have added the 3 videos
  When I navigate to My Programmes > Favourites
  Then I should now see the 3 of them listed


Scenario: Remove one programme from My Programmes > Favourites
  Given I have added the 3 videos
  When I navigate to My Programmes > Favourites
  And clicked 'Remove' on one of the videos - 'The £100k House: Tricks of the Trade'
  And confirm this removal
  Then I should now see 2 of them listed

Scenario: Watch 1 of the remaining 2 programmes from My Programmes > Favourites
  Given I have removed 1 out of 3 videos
  When I click on the first remaining video - 'The Great Sport Relief Bake Off'
  And click play on the video player page
  And I pause the video
  And Navigate to My Programmes > Watching
  Then I should see this video showing there - 'The Great Sport Relief Bake Off'

Scenario: Watch 2 of the remaining 2 programmes from My Programmes > Favourites
  Given I have 2 videos remaining and am watching one of them - 'The Great Sport Relief Bake Off'
  When I pause and return to My Programmes > Favourites
  And play the second video - 'Could We Survive a Mega-Tsunami?'
  Then Now I should see both of these videos in My Programmes > Watching - 'The Great Sport Relief Bake Off', 'Could We Survive a Mega-Tsunami?'


# edge cases

Scenario Outline: Attempt to access 'My Programmes' before signing in (negative)
  Given I have not yet signed in
  When I click on 'My Programmes'
  And I am on the '<section>' section
  Then I should see a message '<message>'
  And a sign in button

  Examples:
    | section | message |
    | Watching | The easy way to pick up where you left off |
    | Favourites | Keep track of your favourite programmes  |


Scenario Outline: Accessing the 'My Programmes' page after signing in where user has favourites and is watching a programme (edge case)
  Given I have signed in with existing email: 'test@gmail.com', and password: 'abcdefghijk'
  And User has added 3 programmes, deleted one and watching another
  When I click on 'My Programmes'
  And I am on the '<section>' section
  Then I should see <state>
  And a sign in button

  Examples:
  | section | state |
  | Watching | One programme shown as being watched |
  | Favourites | One programme shown added  |


Scenario: Attempt to add a programme not yet broadcast (negative)
  Given I have signed in with existing email: 'test@gmail.com', and password: 'abcdefghijk'
  When I navigate to the TV Guide page
  And I select a channel - BBC2
  And I select a programme which hasn't been broadcast yet
  Then on the programme player page, there is no 'add to favourites' button

Scenario: Attempt to add a programme being broadcast live
  Given I have signed in with existing email: 'test@gmail.com', and password: 'abcdefghijk'
  When I navigate to the TV Guide page
  And I select a channel - BBCNEWS
  And I select a programme which is being broadcast live
  Then on the programme player page, there is no 'add to favourites' button


# rollback - remove all programmes from Favourites so that user can be re-used if the test was re-run

Scenario: Rollback - remove all programmes from My Programmes > Favourites so that user can be re-used if the tests above were re-run
  Given I have signed in with existing email: 'test@gmail.com', and password: 'abcdefghijk'
  When I navigate to My Programmes > Favourites
  And I remove all programmes listed
  And I navigate to My Programmes > Watching
  And I remove all programmes listed by 'clear history'
