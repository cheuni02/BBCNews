Feature: OSB Emissions Fix - Book service for non RTC retailers (VWOSBEB-1)
  Given that I am a VW customer affected by the emissions and received a letter by VW for a fix
  Then When I Book a service, as long as I provide my vehicle's VIN number
  Then I will get services for free
  Note In the OSB, the user will enter his Reg number - we will need to get the corresponding VIN in order to match it to the VINs list

Background: pre-requisites
  Given the user is on the OSB first page
  And has selected a retailer from postcode : AAAA
  And has entered vehicle registration number: BBBB

Scenario:  my car is on the affected VINs list - the emissions fix work should be available in the list FOC
  Given my car is on the affected cars list and i have provided the VIN on the first step
  When I get to the “Select work” step on the OSB
  Then the emissions fix work should be available on top of work list
  And it should be free of charge
  And it should be selected by default
  But I should be able to deselect it
  And I should be able to select any other additional work for my car


Scenario: I have selected the emissions fix work : the Convenience options should be FOC
  Given I have just entered the VIN
  And selected the emissions fix work
  When I get to the Convenience options
  Then they should be free of charge



Scenario Outline: the 'Real time' (to be taken out of diary) depends on my engine size
  Given I am on the "Your Vehicle" page
  And I have provided my car engine: <size>
  When I select the emissions fix work
  Then the work code should be <job>
  And <time> should be taken out of the diary

Examples:
|size|job                |time|
|1.2 |Emission Engine Fix|0.6 |
|1.6 |Emission Engine Fix|0.85|
|2.0 |Emission Engine Fix|0.6 |
