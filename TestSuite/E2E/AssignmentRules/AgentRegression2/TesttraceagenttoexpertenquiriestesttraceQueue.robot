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
Assigns Test Case To Expert Team - Test & Trace Queue
    [Tags]  TTCS20-3063
        Go To Salesforce login
        Login as Tier 2 Test & Trace Agent
        #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
        Reset View (if applicable)
        Go To Cases Tab
		Sleep  3s
        Central Agent Creates Case
        Sleep   6s
        Click Edit
        Click Drop Down By Name     Assign Test Case
        Sleep  3s
        Populate Fields From Assign Test Case Picklist      Assign Test Case
        Sleep  3s
        Click Drop Down By Name     Assign Test Case
        Select Dropdown Option      UKHSA Expert 119 Team
        Click Save
        Wait Until Page Has Saved
        Case Owner Text Should Be       UKHSA Expert 119 Team

Assigns Trace Case To Expert Team - Test & Trace Queue
    [Tags]  TTCS20-3063-1
        Go To Salesforce login
        Login as Tier 2 Test & Trace Agent
        #Display Most Recent Cases From Generalist Enquiries – Trace Queue
        Reset View (if applicable)
        Go To Cases Tab
		Sleep  3s
        Central Agent Creates Case - Trace
        Sleep   6s
        Click Edit
        Click Drop Down By Name     Assign Trace Case
        Sleep  2s
        Populate Fields From Assign Trace Case Picklist      Assign Trace Case
        Sleep  3s
        Click Drop Down By Name     Assign Trace Case
        Select Dropdown Option      UKHSA Expert 119 Team
        Click Save
        Wait Until Page Has Saved
        Case Owner Text Should Be       UKHSA Expert 119 Team


