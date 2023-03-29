*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CloseCaseTab/CloseCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/RITValidations.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***
RIT Validation rule
  [Tags]   TTCS20-1976
        Login as Generalist Test Agent
        #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
        Reset View (if applicable)
        Go To Cases Tab
        Sleep  3s
        Agent Creates Case RIT Validation
        RIT Validations
        Wait Until Page Has Saved
        Case Owner Text Should Be    UKHSA Results Investigation Team
