*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

#Logins
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot


Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CaseE2EoutboundsendingEmailonTracecase.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***

Expert Trace Agent Email Template
    [Tags]  TTCS20-3774

        Login as Tier 2 Test & Trace Agent
        Open Most Recent Case From inbound 119 tier2 - Test Queue
        Sleep  4s
        Click Edit
        Click Drop Down By Name     RIT Resend Result
        Sleep  2s
        Populate Fields From RIT Resend Picklist    RIT Resend Result
        Sleep  4s