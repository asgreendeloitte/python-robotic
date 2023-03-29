*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Variables ***
${message}      The way to get started is to quit talking and begin doing.

*** Test Cases ***
MP Trace case without mandatory fields
    [Tags]  TTCS20-1250  TTCS20-1251

    Go To Salesforce login
    Login as E&C Central Agent
    Display Most Recent Cases From MP Trace Queue
    Agent Creates Case - MP Complaints without mandatory fields

MP Trace case generation
    [Tags]  TTCS20-1203  TTCS20-1209  TTCS20-1249  TTCS20-1192

    Go To Salesforce login
    Login as E&C Central Agent
    Display Most Recent Cases From MP Trace Queue
    Agent Creates Case - MP Complaints without mandatory fields
    Click Edit
    Click Drop Down By Name     Assign Trace Case
    Select Dropdown Option      Complaints Team - Test & Trace
    Click Save
    Wait Until Page Has Saved
    Sleep  3s