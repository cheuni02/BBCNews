Feature: OSB Emissions Fix - Outbound email variants for Customers (VWOSBEB-4)
  Given that I am a VW customer affected by the emissions and received a letter by VW for a fix
  Then When I Book a service, as long as I provide my vehicle's VIN number
  Then I will get services for free

Background: pre-requisites
  Given the user has selected a retailer from postcode : AAAA
  And has entered vehicle registration number: BBBB

Scenario: car owner has only booked emissions fix services (new)
  Given he has booked emissions fix and not booked other additional service
  And when he selects a date and time
  And provides his personal details with his email address
  Then an email containing template emissions fix only should be sent to his email address

Scenario: car owner has booked emissions fix service and additional services (new)
  Given he has booked emissions fix and another additional service
  And when he selects a date and time
  And provides his personal details with his email address
  Then an email containing email template emissions fix and other services should be sent to his email

Scenario: car owner has booked some services, but not the emissions fix (existing)
  Given a car owner has booked some services
  But he has not booked the emissions fix
  And when he selects a date and time
  And provides his personal details with his email address
  Then an email containing the regular email template should be sent to his email address

