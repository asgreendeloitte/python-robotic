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
Test Agent assign the case to Complaints Team Test if Case Type is complaint
  [Tags]  TTCS20-1247

      Login as Generalist Test Agent
      #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
      Reset View (if applicable)
      Go To Cases Tab
      Sleep  3s
      Agent Creates Case with Case Type Complaint
      Sleep  4s
      Click Edit
      Click Drop Down By Name     Assign Test Case
      Select Dropdown Option      Complaints Team - Test & Trace
      Click Save
      Wait Until Page Has Saved
      Case Owner Text Should Be       Complaints Team – Test & Trace


Test Agent Can't assign the case to Complaints Team Test if Case Type is notcomplaint
  [Tags]  TTCS20-1247

      Login as Generalist Test Agent
      #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
      Reset View (if applicable)
      Go To Cases Tab
      Sleep  3s
      Agent Creates Case
      Sleep  4s
      Click Edit
      Click Drop Down By Name     Assign Test Case
      Select Dropdown Option      Complaints Team - Test & Trace
      Click Save
      Sleep  2s
      Check Error Message Content
      Sleep  2s
      Click Cancel


#In Progress
Complaints Team Test Accept the work from the Case list
  [Tags]  TTCS20-1204

      Login as E&C Central Agent
      Display Most Recent Cases From Complaints Team – Test Queue
      Sleep  5s
      First Record Checkbox validation
      Accept the Case in Case list view

Test Taken field visible in Details screen
  [Tags]  CS20-1202

      Login as E&C Central Agent
      Display Most Recent Cases From Complaints Team – Test Queue
      #Agent Creates Case with Case Type Complaint
      Central Agent Creates Case with Case Type Complaint
      Sleep  2s
      Page Should Contain   Test Taken?




