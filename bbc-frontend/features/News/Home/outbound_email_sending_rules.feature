Feature: OSB Emissions Fix - Outbound email sending rules for Retailer recipients (VWOSBEB-5)
  Given that I am a VW customer affected by the emissions and received a letter by VW for a fix
  Then When I Book a service, as long as I provide my vehicle's VIN number
  Then I will get services for free
  Note In the OSB, the user will enter his Reg number - we will need to get the corresponding VIN in order to match it to the VINs list

Background: pre-requisites
  Given the user is on the OSB first page
  And has selected a retailer from postcode : AAAA
  And has entered vehicle registration number: BBBB

Scenario: a customer books the emissions fix - service booking email is sent to service manager
  Given a customer has booked an emission fix service with retailer <retailer 1>
  Then the service manager of <retailer 1> should receive a notification email

email is sent currently, will need to clarify if the email for the case when an emissions fix is booked should look different
Scenario: the service manager has received the notification email but has not opened it within X hours
  Given the notification email (concerning an emission fix booking) has been sent to the service manager
  When X hours pass from sending the email service manager notification email
  But the email has not been open
  Then a follow up email should be sent to the same contact

Scenario: the two emails sent to the service manager have not been opened within X hours
  Given the follow up email has been sent to the service manager of <retailer 1>
  When X hours pass from sending the follow up email
  But the the inital email has not been open
  Or the the follow email has not been open
  Then a second follow up email should be sent to the brand manager of <retailer 1>
