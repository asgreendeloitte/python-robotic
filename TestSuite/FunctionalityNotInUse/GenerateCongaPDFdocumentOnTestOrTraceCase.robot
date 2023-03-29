#Note:Need to allow popup through framework - working on that
*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CongaPDF.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test

*** Test Cases ***
CongaPdf-Test
    [Tags]  CS20-171   CS20-522
    Login as Generalist Test Agent
    Display Most Recent Cases From General Complaints & Enquiries- Test Queue
    Agent Creates Case
    Case Status Text Should Be   New
    Click Edit
    Conga Template selection


    Sleep  2s
CongaPdf-Trace
    [Tags]  CS20-384   CS20-523
    Login as Generalist Trace Agent
     Display Most Recent Cases From Generalist Enquiries – Trace Queue
        Agent Creates Case - Trace
    Case Status Text Should Be   New
    Click Edit
    Conga Template selection


    Sleep  2s
## this is an update
