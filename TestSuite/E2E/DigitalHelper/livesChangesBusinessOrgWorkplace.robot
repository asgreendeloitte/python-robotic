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
Review the correct guidance and links for Business Org or Workplace path
    [Tags]     TTCS20-3453
    Go To Digital Helper
    Click Get Started
    Page should contain     Do you want to make an enquiry, give feedback or make a complaint?
    Select Case Type Radio Button     Enquiry
    Click Continue
    Page should contain     What is your enquiry about?
    Select Topic Radio Button   My business / organisation
    Click Continue
    Page should contain    What is your enquiry about for your business, organisation, workplace, care home or school?


    Select Topic Radio Button     I run an organisation that needs to access testing or has a question
    Click Continue
    Page should contain    Get coronavirus tests for a care home (opens in new window).
    Page should contain    Read the guidance for staff, patients and residents in health and social care settings (opens in new window).
    Page should contain    Get advice about testing in schools (opens in new window).

    Page should contain    Need more help?
    Page should contain    If you need more help you can submit a form. We will respond to your message within 3 working days. If your enquiry needs an immediate response, you can call 119.

    Verify Start again button
    Verify Submit a form button
    Click go back
    Sleep   3s

    Select Topic Radio Button          I need advice on COVID safety requirements for my business or organisation
    Click Continue

    Page should contain   I need advice about the coronavirus (COVID-19) safety requirements for my business, organisation, workplace, care home or school
    Page should contain   Find out about working safely during COVID-19 (opens in new window).
     Page should contain    Need more help?
    Page should contain    If you need more help you can submit a form. We will respond to your message within 3 working days. If your enquiry needs an immediate response, you can call 119.

    Verify Start again button
    Verify Submit a form button
