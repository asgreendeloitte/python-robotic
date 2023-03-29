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

Complaints Agent assign the case to Complaints Team queque with case origin
  [Tags]  TTCS20-5832

      Login as E&C Central Agent
      #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
      Reset View (if applicable)
      Go To Cases Tab
      Sleep  3s
      Central Agent Creates Case with Case Type Complaint
      Sleep  4s
      Click Edit
      Click Drop Down By Name     Assign Test Case
      Select Dropdown Option      Complaints Team - Test & Trace
      Click Drop Down By Name     Case Origin
      Select Dropdown Option      Complaints Mailbox
      Click Save
      Wait Until Page Has Saved
      Case Owner Text Should Be       Complaints Team – Test & Trace




Complaints Agent assign the case to Complaints Team queque with case origin
  [Tags]  TTCS20-5832-1

      Login as E&C Central Agent
      #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
      Reset View (if applicable)
      Go To Cases Tab
      Sleep  3s
      Central Agent Creates Case - Trace
      Sleep  4s
      Click Edit
      Click Drop Down By Name     Case type
      Select Dropdown Option      Complaint
      Click Drop Down By Name     Assign Trace Case
      Select Dropdown Option      Complaints Team - Test & Trace
      Click Drop Down By Name     Case Origin
      Select Dropdown Option      Complaints Mailbox
      Click Save
      Wait Until Page Has Saved
      Case Owner Text Should Be       Complaints Team – Test & Trace