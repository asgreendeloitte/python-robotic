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
Assigns Test Case To Generalist Trace Queue
    [Tags]  TTCS20-1037
        Go To Salesforce login
        Login as E&C Central Agent
        #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
        #Agent Creates Case
        Display Most Recent Cases From inbound tier2 - Test Queue
        Central Agent Creates Case
        Sleep   3s
        Click Edit
        Click Drop Down By Name     Assign Test Case
        Select Dropdown Option      Inbound 119 Tier 2
        Click Save
        Wait Until Page Has Saved
        Case Owner Text Should Be       Inbound 119 Tier 2

