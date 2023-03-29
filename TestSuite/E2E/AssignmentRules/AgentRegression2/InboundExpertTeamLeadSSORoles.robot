*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  DateTime

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Variables ***
${new}                      //a[@title='New']
${new-Report}               //a[@title='New Report']
${new-folder}               //*[@title='New Folder']

*** Test Cases ***
Test Case Capability
        [Tags]  TTCS20-3143
        Login as Inbound Expert Team Lead
        Go To Cases Tab
        Reset View (if applicable)
        #Agent Creates Case
        Central Agent Creates Case1
        Click Edit
        Live Issue Search Text Inbound Expert Agent
        Click Save
        Wait Until Page Has Saved
        Click Element   ${global-search-button}
        Sleep   2s
        Input Text      ${global-search-cases}      NHS UKHSA (IANTO)
        Page Should Contain     No results found.
        Capture Page Screenshot

Trace Case Capability
        [Tags]  TTCS20-3143
        Login as Inbound Expert Team Lead
        Go To Cases Tab
        Inbound Expert Private List View Check
        #Agent Creates Case - Trace
        Central Agent Creates Case - Trace

Reports Capability
        [Tags]  TTCS20-3143
        Login as Inbound Expert Team Lead
        Go To Cases Tab
        Display Reports From IANTO - Team Queue
        element should be visible  ${new-Report}
        element should be visible  ${new-folder}
        Display Knowledge From IANTO - Team Queue
        Sleep  4s
        element should be visible  ${new}
