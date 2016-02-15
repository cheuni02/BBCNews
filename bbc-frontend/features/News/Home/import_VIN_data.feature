Feature: OSB Emissions Fix - Manage VIN import data (VWOSBEB-2)
  Purpose of test is the prove that when VW customers when are
  Given that I am a VW customer affected by the emissions and received a letter by VW for a fix
  Then When I Book a service, as long as I provide my vehicle's VIN number
  Then I will get services for free


@test_not_affected
Scenario: vehicle (not affected) has been added to list via batch 1 should not experience changes when booking OSB
  Given User's VIN number (vehicle) not affected and in batch 1
  When batch 1 consolidated into the database
  Then I go through the OSB steps at section 'Choose Retailer', to choose any retailer from postcode: AAAA
  And provide details at the section 'Your vehicle' including giving the VIN number
  Then he is on the 'select work' section
  And has other additional services' options
  But has 'no has booked emissions fix' option
  And when he selects a date and time
  And provides his personal details with his email address
  Then There are no changes and user should still be charged after entering VIN in OSB process


@test_not_affected
Scenario: same vehicle (not affected) after batch 2 added should not experience changes
  Given User's VIN number (vehicle) not affected and in batch 1
  When batch 2 consolidated into the database
  Then I go through the OSB steps at section 'Choose Retailer', to choose any retailer from postcode: AAAA
  And provide details at the section 'Your vehicle' including giving the VIN number
  Then he is on the 'select work' section
  And has other additional services' options
  But has 'no has booked emissions fix' option
  And when he selects a date and time
  And provides his personal details with his email address
  Then There are no changes and user should still be charged after entering VIN in OSB process


@test_affected
Scenario: vehicle (affected) has been added to list via batch 1 should experience changes when booking OSB
  Given User's VIN number (vehicle) affected and in batch 1
  When batch 1 consolidated into the database
  Then I go through the OSB steps at section 'Choose Retailer', to choose any retailer from postcode: AAAA
  And provide details at the section 'Your vehicle' including giving the VIN number
  Then he is on the 'select work' section
  And has other additional services' options
  But has 'no has booked emissions fix' option
  And when he selects a date and time
  And provides his personal details with his email address
  Then There are now changes and user should not be charged after entering VIN in OSB process


  @test_affected
Scenario: same vehicle (affected) after batch 2 added should experience changes when booking OSB
  Given User's VIN number (vehicle) affected and in batch 1
  When batch 2 consolidated into the database
  Then I go through the OSB steps at section 'Choose Retailer', to choose any retailer from postcode: AAAA
  And provide details at the section 'Your vehicle' including giving the VIN number
  Then he is on the 'select work' section
  And has other additional services' options
  But has 'no has booked emissions fix' option
  And when he selects a date and time
  And provides his personal details with his email address
  Then The user should not be charged after entering VIN in OSB process