*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1



*** Test Cases ***
Priority Reasons Validation
  [Tags]  TTCS20-1217
        Login as E&C Central Agent
        #Display Most Recent Cases From Specialist Complaints & Enquiries- Test Queue
        #Agent Creates Case -Priority Reason validation
        Reset View (if applicable)
        Go To Cases Tab
		Sleep  3s
        Central Agent Creates Case -Priority Reason validation


