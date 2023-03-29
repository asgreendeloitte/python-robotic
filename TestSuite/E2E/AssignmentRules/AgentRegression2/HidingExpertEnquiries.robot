*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  DateTime

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***
Hiding Expert Enquiries

        [Tags]  TTCS20-2957

        Login as Tier 1 Test & Trace Agent
        Reset View (if applicable)
        #Click Element   ${global-search-button}
        #Sleep   2s
        #Input Text      ${global-search}      Expert Enquiries - Test
        #sleep  3s
        #Page Should Contain     No results found.
        #Capture Page Screenshot
        Open cases tab and select list view
        #Input Text      ${queue-search}      Expert Enquiries - Test
        #Page Should Contain     No results found.
        page should not contain   Expert Enquiries - Test
        Capture Page Screenshot
