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

Test Agent Creates Case without Case Type
  [Tags]  TTCS20-1129  TTCS20-1353
     Login as Generalist Test Agent
     #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
     Go To Cases Tab
	 Sleep  3s
     Agent Creates Case without Case Type