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
E&C user assign Cases to Test Specialist
  [Tags]  CS20-206 CS20-207
        Login as E&C Central Agent
        Sleep      3s
        #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
        Reset View (if applicable)
        Go To Cases Tab
        Sleep  3s
        #Agent Creates Case
        Central Agent Creates Case
        Sleep  3s
        Case Status Text Should Be   New
#        Display Field text Should Be    Category        Test - General
        Sleep  4s
        RIT Validations