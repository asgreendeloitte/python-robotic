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

*** Variables ***
${first-list-option}        (//a[@data-refid='recordId'])[1]
${accept-btn}               //button[text()='Accept']

*** Test Cases ***

Complaints Test Team - Updating IANTO cases in the complaints Test Team Queue
  [Tags]  TTCS20-2756

     Login as E&C Central Agent
     #Display Most Recent Cases From Complaints Team – Test Queue
     Display Most Recent Cases From inbound tier2 - Test Queue
     Click Element   ${first-list-option}
     sleep  4s
     Click Edit
     sleep  3s

     Click Drop Down By Name   Category
     Select Dropdown Option    NHS UKHSA (IANTO)
     Click Drop Down By Name   Subcategory
     Select Dropdown Option    Order test - general
     Click Drop Down By Name    Case type
     Select Drop down option    Complaint
     Click Drop Down By Name   Assign Test Case
     Select Dropdown Option    Complaints Team - Test & Trace
     Click Save
     sleep  3s
     #Accept the Case in Case list view
     click element  ${accept-btn}
     sleep  5s
     Click Edit
     Click Drop Down By Name   Status
     Select Dropdown Option    Closed
     Click Drop Down By Name   Test Taken?
     Select Dropdown Option    Yes
     Click Drop Down By Name    Test Type
     Select Dropdown Option    PCR test
     Click Drop Down By Name    Testing Channel
     Select Dropdown Option    Tested at Home
     Click Drop Down By Name    Test Provider Type
     Select Dropdown Option    NHS UKHSA (IANTO)
     Input Date Field By Name  Date of Test   19/01/2022
     sleep  3s
     Click Drop Down By Name    Reason for feedback
     Select Dropdown Option     Results
     Click Drop Down By Name    Customer journey friction point
     Select Dropdown Option     Taking test
     Click Drop Down By Name    Outcome
     Select Dropdown Option     Upheld
     sleep  3s
     Click Save
     sleep  3s



Complaints Test Team Agent not able to save IANTO cases
  [Tags]  TTCS20-2756-1  TTCS20-3105-2

     Login as E&C Central Agent
     Display Most Recent Cases From IANTO - Team Queue
      #Non-Ianto Agent Creates Case - IANTO
      Central Non-Ianto Agent Creates Case - IANTO
      Check Error Message Content for IANTOCase creation from non-ianto agent

Complaints Test Team Lead Agent not able to save IANTO cases
  [Tags]   TTCS20-3079-2

     Login as MP Trace Lead Agent
     Display Most Recent Cases From IANTO - Team Queue
      #Non-Ianto Agent Creates Case - IANTO
      MPTrace Non-Ianto Agent Creates Case - IANTO
      Check Error Message Content for IANTOCase creation from non-ianto agent


Complaints Test Team Agent not able to edit IANTO cases
  [Tags]  TTCS20-2756-2  TTCS20-3105-3

     Login as E&C Central Agent
     Display Most Recent Cases From IANTO - Team Queue
     Click Element   ${first-list-option}
     sleep  4s
     Click Edit
     sleep  4s
     Click Save
     Check Error Message Content for IANTOCase edit from non-ianto agent




