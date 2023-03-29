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



Case - E2E Sending Outbound Template Email on Test Case
        [Tags]  TTCS20-1042

        Login as E&C Central Agent
        #Open Most Recent Case From General Complaints & Enquiries- Test Queue
        Open Most Recent Case From inbound 119 tier2 - Test Queue
        Log to console the Case Type Value of case
        EFC Agent drafts email for test case
        EFC Agent selects the Email template
##


