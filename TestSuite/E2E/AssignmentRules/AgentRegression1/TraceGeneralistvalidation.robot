*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CloseCaseTab/CloseCase.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***
Trace Agent - Case type of self-isolation disputes - Outcome field mandatory validation
  [Tags]  TTCS20-3312

      Login as Generalist Trace Agent
      #Display Most Recent Cases From Generalist Enquiries – Trace Queue
      Reset View (if applicable)
      	Go To Cases Tab
		Sleep  3s
      Agent Creates Case - Trace - Complaint1
      Sleep  4s
      Click Edit
      Click Drop Down By Name         Case type
      Select Drop down option         Self-Isolation Dispute
      Click Save
      Wait Until Page Has Saved
      sleep  3s
      Click Edit
      Click Drop Down By Name         Status
      Select Drop down option         Closed
      Click Save
      Sleep  2s
      Check Error Message Content for IANTOCase close without sub-category
      Sleep  3s
      Click Drop Down By Name     Outcome
      Sleep  3s
      Populate Fields From Outcome Picklist in Trace Case   Outcome
      Click Save
      Wait Until Page Has Saved
      sleep  2s
      Case Status Text Should Be  Closed






