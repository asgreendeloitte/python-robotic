*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup
Resource    ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot

# DigitalHelper Flows
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/GlobalButtons.robot

Suite Setup     Open Browser, Go To Digital Helper and Accept Cookies
Suite Teardown  Close Browser

*** Variables ***
${title}           //h1[contains(text(),'Give feedback about the NHS Test and Trace Digital Service website')]

*** Test Cases ***
Verify Beta Header in DH
     [Tags]      CS20-1005  cs20-1656
     Sleep  4s
     Page Should Contain   This is a new service — your feedback will help us improve it.
     Click Feedback in Beta header
     Sleep  2s
     Switch Window    NHS Test and Trace - Get help with coronavirus (COVID-19) enquiries and complaints
     Sleep  2s
     Switch Window     GiveFeedback
     Page Should Contain  Give feedback about the NHS Test and Trace Digital Service website
     Close Window






