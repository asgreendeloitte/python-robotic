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
${SearchKnowledgeArticles}     Set Variable      //input[@title='Search Knowledge...']
${SelectArticle}              //span[@title='What is the NHS Test and Trace Support Payment Scheme?']
${new}                      //a[@title='New']


*** Test Cases ***
IANTO Team Lead Agent creating the case
  [Tags]  TTCS20-2720

      Login as IANTO Team Lead
      #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
      Display Most Recent Cases From IANTO - Team Queue
      Agent Creates Case - IANTO
      Sleep  4s
      Click Edit
      Click Drop Down By Name     Subcategory
      Select Dropdown Option      Order test - general
      Click Save
      Wait Until Page Has Saved
     # Case Owner Text Should Be       Complaints Team – Test

IANTO Team Lead Agent closing the Ianto case
  [Tags]  TTCS20-2720-1

      Login as IANTO Team Lead
      #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
      Display Most Recent Cases From IANTO - Team Queue
      Agent Creates Case - IANTO
      Sleep  4s
      Click Edit
      Click Drop Down By Name     Subcategory
      Select Dropdown Option      Order test - general
      Click Save
      Wait Until Page Has Saved
      Click Edit
      Click Drop Down By Name       Status
      Select Dropdown Option        Closed

IANTO Test Agent Knowledge articles access
  [Tags]  TTCS20-2720-2

     Login as IANTO Team Lead
     Display Knowledge From IANTO - Team Queue
     Sleep  4s
     ELEMENT SHOULD NOT BE VISIBLE  ${new}

IANTO Test Agent creating the non Ianto case
  [Tags]  TTCS20-2747

      Login as IANTO Team Lead
      #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
      Display Most Recent Cases From IANTO - Team Queue
      Agent Creates Case - NON-IANTO
      Check Error Message Content for NON-IANTOCase

IANTO Test Agent creating the non Ianto Trace case
  [Tags]  TTCS20-2747-1

      Login as IANTO Team Lead
      #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
      Display Most Recent Cases From IANTO - Team Queue
      Agent Creates Trace Case - NON-IANTO
      Check Error Message Content for NON-IANTOCase

IANTO Test lead not viewing non-ianto test-report
  [Tags]  TTCS20-2747-2

      Login as IANTO Team Lead
      Display Reports From IANTO - Team Queue
      Sleep  5s
      page should not contain  Non-IANTO



NON-IANTO Agent creating the IANTO case
    [Tags]  TTCS20-2752

      Login as Generalist Test Agent
      #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
      Reset View (if applicable)
      Go To Cases Tab
      Sleep  3s
      Non-Ianto Agent Creates Case - IANTO
      Check Error Message Content for IANTOCase creation from non-ianto agent