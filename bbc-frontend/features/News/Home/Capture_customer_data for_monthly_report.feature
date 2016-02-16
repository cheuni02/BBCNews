Feature: OSB Emissions Fix - Capture customer data & provide as monthly report (VWOSBEB-7)
  As a VW CRM manager
  I want to capture data of all OSB booking customers
  So that I can identify orphaned customers and add them to the CRM system

Background: pre-req: customer provides the VIN code
  Given the customer has selected a retailer from postcode : AAAA
  And has entered vehicle registration number: BBBB
  And the user's car is on the affected list and he has provided the VIN

Scenario: customer books service WITH Emissions fix
  When I get to the “Select work” step on the OSB
  And select Emissions fix at "Select work"
  And select date and time at "Select date"
  And provide Customer 1's details at "Your details"
  And Confirms Booking at "Review & Confirm"
  Then User should get a booking email
  And his details stored

Scenario: customer books service WITHOUT Emissions fix
  When I get to the “Select work” step on the OSB
  And select other services APART from Emissions fix at "Select work"
  And select date and time at "Select date"
  And provide Customer 1's details at "Your details"
  And Confirms Booking at "Review & Confirm"
  Then User should get a booking email
  And his details stored

Scenario: VW CRM manager should recieve file for customer with a booked service WITH Emissions fix
  Given the customer has booked the service
  When I log in to the CRM system as the VW manager 'Tom Warren'
  Then I should see the customer's booking file
  When the file is opened
  Then these details should show: surname,first name, postal address, telephone number, marketing permissions, booked an emissions fix (YES)

Scenario: VW CRM manager should recieve file for customer with a booked service WITHOUT Emissions fix
  Given the customer has booked the service
  When I log in to the CRM system as the VW manager 'Tom Warren'
  Then I should see the customer's booking file
  When the file is opened
  Then these details should show: surname,first name, postal address, telephone number, marketing permissions, booked an emissions fix (NO)


  # no need for CRM
  # spreadsheet report with columns eg user, address, emisions fix?