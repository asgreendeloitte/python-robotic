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


*** Test Cases ***
Check Digital Helper Start Page Text
    [Tags]  TTCS20-3025
    Go To Digital Helper
    Check Digital Helper Start Page

Check 'I have not received my test result' Page
    [Tags]  TTCS20-3040
    Check I have not recieved my test result page

