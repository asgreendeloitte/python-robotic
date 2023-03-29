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
IANTO Test Agent creating the case
  [Tags]  TTCS20-2719

      Login as IANTO Agent
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

IANTO Test Agent creating the non Ianto case
  [Tags]  TTCS20-2735

      Login as IANTO Agent
      #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
      Display Most Recent Cases From IANTO - Team Queue
      Agent Creates Case - NON-IANTO
      Check Error Message Content for NON-IANTOCase
IANTO Test Agent creating the non Ianto Trace case
  [Tags]  TTCS20-2735-1

      Login as IANTO Agent
      #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
      Display Most Recent Cases From IANTO - Team Queue
      Agent Creates Trace Case - NON-IANTO
      Check Error Message Content for NON-IANTOCase

IANTO Test Agent Knowledge articles access
  [Tags]  TTCS20-2735-2

     Login as IANTO Agent
     Display Knowledge From IANTO - Team Queue
     Sleep  4s
     ELEMENT SHOULD NOT BE VISIBLE  ${new}

IANTO Test Agent creating the case and checking sub-category value
  [Tags]  TTCS20-2935

      Login as IANTO Agent
      #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
      Display Most Recent Cases From IANTO - Team Queue
      Agent Creates Case - IANTO
      Sleep  4s
      Click Edit
      Click Drop Down By Name     Status
      Select Dropdown Option      Closed
      Click Save
      Check Error Message Content for IANTOCase close without sub-category
      Sleep  4s
      Click Cancel
      Sleep  4s
      Click Edit
      Click Drop Down By Name     Subcategory
      Sleep  3s
      Populate Fields From subcategory Picklist in IANTO  Subcategory
      Sleep  4s
      Click Save
      Wait Until Page Has Saved