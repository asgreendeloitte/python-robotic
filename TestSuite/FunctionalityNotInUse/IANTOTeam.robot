*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Variables ***
${first-list-option}        (//a[@data-refid='recordId'])[1]

*** Test Cases ***

Test Generalist To IANTO Team
    [Tags]  TTCS20-2647

        Login as Generalist Test Agent
        #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
        Reset View (if applicable)
        Go To Cases Tab
        Sleep  3s
        Agent Creates Case
        Sleep  4s
        Case Status Text Should Be   New
        Sleep  4s
        Display Field text Should Be    Category        Test - General
        Click Edit
        Click Drop Down By Name     Category
        Select Dropdown Option      Test - General
        Click Drop Down By Name     Subcategory
        Select Dropdown Option      Test - General - Other
        Click Drop Down By Name     Assign Test Case
        Select Dropdown Option      IANTO Team
        Click Save
        Wait Until Page Has Saved
        Case Owner Text Should Be       IANTO Team


Team Lead Agent navigating and viewing IANTO case
    [Tags]  TTCS20-2875

      Login as Team Leader Agent
      Display Most Recent Cases From IANTO - Team Queue
      Click Element   ${first-list-option}
      sleep  4s
      Click Edit
      #Click Drop Down By Name     Subcategory
      #Select Dropdown Option      Order test - general
      Click Save
      Check Error Message Content for IANTOCase edit from non-ianto agent

Team Lead Agent creating IANTO case error message
    [Tags]  TTCS20-2875-1

      Login as Team Leader Agent
      Display Most Recent Cases From IANTO - Team Queue
      #Non-Ianto Agent Creates Case - IANTO
      MPTrace Non-Ianto Agent Creates Case - IANTO
      Check Error Message Content for IANTOCase creation from non-ianto agent

Contact Centre Manager Agent navigating and viewing IANTO case
    [Tags]  TTCS20-2875-2

      Login as Contact Centre Manager Agent
      Display Most Recent Cases From IANTO - Team Queue
      Click Element   ${first-list-option}
      sleep  4s
      Click Edit
      sleep  4s
      Click Save
      Check Error Message Content for IANTOCase edit from non-ianto agent

Contact Centre Manager Agent creating IANTO case error message
    [Tags]  TTCS20-2875-3

      Login as Contact Centre Manager Agent
      Display Most Recent Cases From IANTO - Team Queue
      #Non-Ianto Agent Creates Case - IANTO
      MPTrace Non-Ianto Agent Creates Case - IANTO
      Check Error Message Content for IANTOCase creation from non-ianto agent



Quality Assurance Agent navigating and viewing IANTO case
    [Tags]  TTCS20-2875-4

      Login as Quality Assurance Agent
      Display Most Recent Cases From IANTO - Team Queue
      Click Element   ${first-list-option}
      sleep  4s


Team Lead Agent IANTO Test Report viewing
  [Tags]  TTCS20-2875-5

      Login as Team Leader Agent
      Display IANTO Reports
      Sleep  5s
      page should contain  NHS UKHSA (IANTO)

Contact Centre Manager IANTO Test Report viewing
  [Tags]  TTCS20-2875-6

      Login as Contact Centre Manager Agent
      Display IANTO Reports
      Sleep  5s
      page should contain  NHS UKHSA (IANTO)

Quality Assurance Agent IANTO Test Report viewing
  [Tags]  TTCS20-2875-7

      Login as Quality Assurance Agent
      Display IANTO Reports
      Sleep  5s
      page should contain  NHS UKHSA (IANTO)
