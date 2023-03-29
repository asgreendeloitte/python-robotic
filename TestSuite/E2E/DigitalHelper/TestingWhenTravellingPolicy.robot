*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/Confirmation.robot

Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot


# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser, Go To Digital Helper and Accept Cookies
Test Teardown   Close Browser
*** Variables ***
${GoBackLink}       //a[@class='nhsuk-back-link__link']
*** Test Cases ***
Testing when Travelling Screen
    [Tags]  TTCS20-3367
    Go To Digital Helper
    Check Testing when Travelling Policy
    Check 'After Arriving in England' Policy

Check International 'Testing When Travelling' Screen
    [Tags]  TTCS20-3367
    Go To Digital Helper
    Check International Travel Testing when Travelling Policy
    Check 'After Arriving in England' Policy
   # Click GoBack Link
   click element  ${GoBackLink}
    Select Radio Button By Value    Quarantine and stay at home guidance
    Click Continue
    Page Should Contain Link    Find a travel test provider (opens in new window).
