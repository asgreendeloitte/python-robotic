*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  DateTime

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CaseE2EoutboundsendingEmailonTracecase.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1
*** Variables ***

${casecomment}        //textarea[@class=' textarea']

#//*[@class='uiInput uiInputTextArea uiInput--default uiInput--textarea']/textarea

*** Test Cases ***
New 'Case Comments' Chatter action for case updates by agents
    [Tags]  TTCS20-2952
    Login as Generalist Test Agent
    Go To Cases Tab
    #Open Most Recent Cases From General Complaints & Enquiries- Test Queue
    Open Most Recent Case From My open cases Queue
    Sleep   5s
    EFC Agent adds comment for test case
    Sleep  4s
    Wait Until Page Contains   Case Comment created
    Sleep   5s
    Page Should Contain     The quick brown fox jumps over the lazy dog
