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
Live Issue field - Test User
    [Tags]  TTCS20-1986

    Go To Salesforce login
    Login as Generalist Test Agent
    #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
    Reset View (if applicable)
    Go To Cases Tab
    Sleep  3s
    Agent Creates Case
    Sleep  2s
    Click Edit
    Live Issue Search Text test
     Click Save
      Wait Until Page Has Saved

Live Issue field - Trace User
    [Tags]  TTCS20-3046
    Go To Salesforce login
    Login as Generalist Trace Agent
    #Display Most Recent Cases From Complaints Team - Trace Queue
    Reset View (if applicable)
    Go To Cases Tab
    Sleep  3s
    Agent Creates Case - Trace1
    Sleep  2s
    Click Edit
    Live Issue Search Text
     Click Save
      Wait Until Page Has Saved


