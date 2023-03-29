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
Trace Agent Creates Case without Case Type
  [Tags]  CS20-297  CS20-1246  CS20-1230
     Login as Generalist Trace Agent
     #Display Most Recent Cases From Generalist Enquiries – Trace Queue
     Reset View (if applicable)
     Go To Cases Tab
	 Sleep  3s
     Agent Creates Case without Case Type

