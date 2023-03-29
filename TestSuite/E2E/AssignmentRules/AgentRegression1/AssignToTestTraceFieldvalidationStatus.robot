*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/RITValidations.robot


# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***
Assign Test Case validation with status validation
    [Tags]  TTCS20-1254

        Login as E&C Central Agent
        Sleep      3s
        Display Most Recent Cases From Complaints Team – Test Queue
        #Agent Creates Case
        Go To Cases Tab
        Sleep  3s
        Central Agent Creates Case
        Sleep  3s
        Case Status Text Should Be   New
        Sleep  2s
        Click Edit
        Sleep  3s
        Click Drop Down By Name     Status
        Select Dropdown Option      Awaiting Information (Citizen)
        Click Drop Down By Name     Assign Test Case
        Select Dropdown Option      Inbound 119 Tier 2
        Click Save
        Wait Until Page Has Saved
        Case Owner Text Should Be       Inbound 119 Tier 2


Assign Trace Case validation with status validation
   [Tags]  TTCS20-1254

        Login as E&C Central Agent
        Sleep      3s
        Display Most Recent Cases From Complaints Team - Trace Queue
        #Agent Creates Case - Trace
        Central Agent Creates Case - Trace
        Sleep  3s
        Case Status Text Should Be   New
        Sleep  2s
        Click Edit
        #Click Drop Down By Name (bug fix)      Status
        Click Drop Down By Name    Status
        Select Dropdown Option      Review
        Click Drop Down By Name     Assign Trace Case
        Select Dropdown Option      Inbound 119 Tier 2
        Click Save
        Wait Until Page Has Saved
        Case Owner Text Should Be       Inbound 119 Tier 2