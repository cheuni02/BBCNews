Feature: OSB Emissions Fix - Manage VIN import data (VWOSBEB-1)
  As a Tribal Admin
  I want to Manage VIN lists of affected and fixed vehicles
  So that I can have a clear view on customers who are eligible for emission fix work


#Scenario: Particular vehicle (affected) has been added to list via batch 1 should not experience changes when booking OSB
#  Given the the vehicle IS affected, and the user had a letter issued, has it's VIN stored in batch 1
#  When batch 1 consolidated into the database
#  Then I am in'Choose Retailer', to choose any retailer (NON RTC) from postcode: AAAA
#  And provide reg number at the section 'Your vehicle'(which should find the VIN from lookup)
#  Then he is on the 'select work' section
#  And has selected 'emissions fix' option
#  And when he selects a date and time
#  And provides his personal details with his email address
#  Then There are changes and user should be able to book FOC
#
#
#Scenario: Same vehicle (now fixed) has been added to list via batch 2 should not experience changes when booking OSB
#  Given the the vehicle is NOW FIXED has it's VIN stored in batch 2
#  When batch 2 consolidated into the database
#  Then I am in'Choose Retailer', to choose the same retailer: AAAA
#  And provide reg number at the section 'Your vehicle'(which should find the VIN from lookup)
#  Then he is on the 'select work' section
#  And has selected another service option
#  But has the 'emissions fix' option not showing anymore
#  And when he selects a date and time
#  And provides his personal details with his email address
#  Then The user should now be charged after entering VIN in OSB process


Scenario: Letter sent batch 1 (check vehicle service FOC if VIN is part of batch)
  Given VINs (with letters sent to their owners) imported to Tribal databsee
  When booking a service with Emissions Fix for a vehicle reg which corresponds to any of those VINs
  Then The user should be able to book FOC

Scenario: Letter sent batch 1 (check vehicle service FOC if VIN is NOT part of batch)
  Given VINs (with letters sent to their owners) imported to Tribal databsee
  When booking a service with Emissions Fix for a vehicle reg which DOES NOT corresponds to any of those VINs
  Then The user should be able to book but NOT FOC

Scenario: Letter sent batch 2 (check vehicle service still FOC if VIN from batch 1)
  Given VINs (with letters from batch 1 and batch 2 sent to their owners) imported to Tribal database
  When booking a service with Emissions Fix for a vehicle reg which corresponds to any of those VINs with letters from batch 1
  Then The user should STILL be able to book FOC

Scenario: Letter sent batch 2 (check vehicle service FOC if VIN is NOT part of batch 1 and 2 letters)
  Given VINs (with letters from batch 1 and batch 2 sent to their owners) imported to Tribal database
  When booking a service with Emissions Fix for a vehicle reg which DOES NOT corresponds to any of those VINs from letters (batch 1 and 2)
  Then The user should be able to book but NOT FOC

Scenario: Fixed batch 1 (check vehicle service NOT FOC if VIN from 'letters sent batch 1' is now in 'Fixed batch 1')
  Given VINs (with letters batch 1 and batch 2) imported to Tribal database
  And VINs (from the Fixed batch 1) now imported to Tribal database
  When booking a service (any work) for a vehicle reg which corresponds to any of those VINs from 'letters batch 1' as well as 'fixed batch 1'
  Then The user should be able to book but NOT FOC

Scenario: Fixed batch 1 (check vehicle service STILL FOC if VIN from 'letters sent batch 1' is NOT in 'Fixed batch 1')
  Given VINs (with letters batch 1 and batch 2) imported to Tribal database
  And VINs (from the Fixed batch 1) now imported to Tribal database
  When booking a service (any work) for a vehicle reg which corresponds to any of those VINs from 'letters batch 1' BUT NOT in 'fixed batch 1'
  Then The user should STILL be able to book FOC

Scenario: Fixed batch 2 (check vehicle service STILL FOC if VIN from 'letters sent batch 1 or batch 2' is now in 'Fixed batch 2')
  Given VINs (with letters batch 1 and batch 2) imported to Tribal database
  And VINs (from the Fixed batch 2) now imported to Tribal database
  When booking a service (any work) for a vehicle reg which corresponds to any of those VINs from 'letters batch 1 or 2' as well as 'fixed batch 2'
  Then The user should be able to book but NOT FOC