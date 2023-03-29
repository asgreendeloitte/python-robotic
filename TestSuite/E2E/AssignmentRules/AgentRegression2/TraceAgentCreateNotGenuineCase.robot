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
Trace Agent Creates Not a Genuine Case
  [Tags]  TTCS20-1123
      Login as E&C Central Agent
      Sleep      3s
      #Display Most Recent Cases From Generalist Enquiries – Trace Queue
      Reset View (if applicable)
      Go To Cases Tab
	  Sleep  3s
      Agent Creates Not a Genunine Case - Trace
      Sleep  2s
      Display Field text Should Be   Not A Genuine Case      Yes

Test Agent Creates Not a Genuine Case
  [Tags]  TTCS20-1123
      Login as E&C Central Agent
      Sleep      3s
      #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
      #Agent Creates Not a Genunine Case - Test
      Reset View (if applicable)
      Go To Cases Tab
	  Sleep  3s
      Central Agent Creates Not a Genunine Case - Test
      Sleep  2s
      Display Field text Should Be   Not A Genuine Case      Yes
