*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot


# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Omnichannel.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***
RTSLTS user assign Cases to Test Specialist
  [Tags]  TTCS20-1030  TTCS20-1197
        Go To Salesforce login
        Login as RTS/LTS Advisor
        Sleep      3s
        Display Most Recent Cases From RTS/LTS Queue - New
       # Agent Creates Case for RTSLTS Agent
        Click Element   ${first-list-option}
        sleep  3s
        Case Status Text Should Be   New
        Click Edit
        Click Drop Down By Name     Assign Test Case
        Select Dropdown Option      Specialist Test Team
        Click Drop Down By Name     Category
        Select Dropdown Option      Test - General
        Click Drop Down By Name     Subcategory
        Select Dropdown Option      Regional Test Sites and Local Test Sites (RTS/LTS)
        Click Save
        Wait Until Page Has Saved
        Display Field text Should Be    Category        Test - General
        Case Owner Text Should Be       Specialist Enquiries - Test
        Sleep  2s

Omnichannel - Offline status work assigned is not visible
        [Tags]  TTCS20-1199
       Login as Specialist Test Agent
        Agent clicks on OmniChannel

Omnichannel - Accept work from RTS Test Team
        [Tags]  TTCS20-1030
        Login as Specialist Test Agent
        Accept work through Omnichannel

