*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  DateTime

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
${name}      Moaning Myrtle
${email}     myrtle@test.com
${message}   this is a desc

*** Test Cases ***
Review the correct guidance and links for International Travel path
    [Tags]     TTCS20-3453
    Go To Digital Helper
    Click Get Started
    Page should contain     Do you want to make an enquiry, give feedback or make a complaint?
    Select Case Type Radio Button     Enquiry
    Click Continue
    Page should contain     What is your enquiry about?
    Select Topic Radio Button   International travel
    Click Continue
    Page should contain    What is your enquiry about international travel?


    Select Topic Radio Button     Testing when travelling
    Click Continue
    Page should contain    Before leaving England
    Page should contain    Read the latest travel guidance before travelling abroad (opens in new window).
    Page should contain    Find out more about foreign travel advice, including the latest information on entry requirements and travel warnings (opens in new window).

    Page should contain    Before travelling to England
    Page should contain   Read about testing before travelling to England (opens in new window).

    Page should contain   After arriving in England
    Page should contain   Find a travel test provider (opens in new window).
    Page should contain   Check the guidance for travel to England from abroad (opens in new window).

    Page should contain    Need More Help?
    Page should contain    If you need more help you can submit a form. We will respond to your message within 3 working days. If your enquiry needs an immediate response, you can call 119.

    Verify Start again button
    Verify Submit a form button
    Click go back
    Sleep   3s

    Select Topic Radio Button          Quarantine and stay at home guidance
    Click Continue

    Page should contain   Quarantine and stay at home guidance
    Page should contain   Find out if you should quarantine when you arrive in England (opens in new window).
    Page should contain  Find out how to book a quarantine hotel and a test when you arrive in England (opens in new window).

    Page should contain   Find out more about the testing required before you travel to England (opens in new window).
    Page should contain   Find a travel test provider (opens in new window).

    Page should contain    Need More Help?
    Page should contain    If you need more help you can submit a form. We will respond to your message within 3 working days. If your enquiry needs an immediate response, you can call 119.

    Verify Start again button
    Verify Submit a form button