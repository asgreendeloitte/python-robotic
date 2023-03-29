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
Test Barcode Check - Generalist Test Agent - ECD generic
  [Tags]    TTCS20-3048
        Login as Generalist Test Agent
        #Open Most Recent Cases From General Complaints & Enquiries- Test Queue
        Open Most Recent Case From My open cases Queue
        Page Should Contain    Test Barcode Check

Test Barcode Check - Expert Test Agent - ECD Teleperformance
        Login as Expert Test Agent
        Go To Cases Tab
        Click Element   ${first-list-option}
        Page Should Contain    Test Barcode Check

Test Barcode Check - Tier 1 Test & Trace Agent - EFC Inbound 119 Agent
        Login as Tier 1 Test & Trace Agent
        #Open Most Recent Cases From General Complaints & Enquiries- Test Queue
        Open Most Recent Case From My open cases Queue
        Page Should Contain    Test Barcode Check

#Test Barcode Check - Quality Assurance Agent - EFC 119 QA team
#        Login as Quality Assurance Agent
#        #Open Most Recent Cases From IANTO - Team Queue
#        Open Most Recent Case From My open cases Queue
#        Page Should Contain    Test Barcode Check