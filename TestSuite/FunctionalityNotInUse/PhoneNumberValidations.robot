#*** Settings ***
#Documentation    Tests to verify that emails with special characters and unusual formats
#...              can be submitted on the digital helper and are stored in Salesforce
#
#Library  SeleniumLibrary    implicit_wait=15
#
## Setup & Logins
#Resource    ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
#
## DigitalHelper pages
#Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot
#
## Agent pages
#Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
#
## Teardown
#Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot
#
#Suite Setup     Open Browser, Go To Digital Helper and Accept Cookies
#Suite Teardown  Close Browser
#
#*** Test Cases ***
#Submit form with invalid phone number
#    [Template]   Verify invalid phone number format
#    [Tags]  CS20-1683
#    ABCDEFGHIJ              # Letters
#    +44123456789012345      # To long
#    07123                   # To short
#
#Submit form with valid phone number
#    [Template]   Verify valid phone number format
#    [Tags]  CS20-1683
#    +44723456789        # Mobile
#    07 123 456 789      # Mobile with spaces
#    +441256 123 456     # Landline with spaces
#    01256123456         # Landline
#
#*** Keywords ***
#Verify invalid phone number format
#    [Arguments]  ${invalid-number}
#    Go To Digital Helper
#    Complete International Travel Long Form User Flow   phone=${invalid-number}
#    Page Should Contain         Enter a valid phone number, like +441234567890
#
#Verify valid phone number format
#    [Arguments]  ${valid-number}
#    Go To Digital Helper
#    Complete International Travel Long Form User Flow   phone=${valid-number}
#    Wait Until Page Contains    Thank you for submitting your message