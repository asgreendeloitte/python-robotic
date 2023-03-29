*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Variables ***
${message}      The way to get started is to quit talking and begin doing.

*** Test Cases ***
EFC Central Team Assigns Trace Case To Specialist Queue
    [Tags]  TTCS20-1131

        Go To Salesforce login
        Login as E&C Central Agent
        #Display Most Recent Cases From Generalist Enquiries – Trace Queue
        #Agent Creates Case - Trace
        Reset View (if applicable)
        Go To Cases Tab
        Sleep  3s
        Central Agent Creates Case - Trace
        Sleep   3s
        Click Edit
        Click Drop Down By Name     Assign Trace Case
        Select Dropdown Option      Inbound 119 Tier 2
        Click Save
        Wait Until Page Has Saved
        Case Owner Text Should Be       Inbound 119 Tier 2

EFC Central Team Assigns Test Case To Generalist Queue
    [Tags]  TTCS20-1128

        Go To Salesforce login
        Login as E&C Central Agent
        #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
        Display Most Recent Cases From inbound tier2 - Test Queue
        #Agent Creates Case
        Central Agent Creates Case
        Sleep   3s
#       Page Should Contain     ${message-date}
#       Case Owner Text Should Be       EFC Central Test Queue
        Click Edit
        Click Drop Down By Name     Assign Test Case
        Select Dropdown Option      Inbound 119 Tier 2
        Click Save
        Wait Until Page Has Saved
        Case Owner Text Should Be       Inbound 119 Tier 2


