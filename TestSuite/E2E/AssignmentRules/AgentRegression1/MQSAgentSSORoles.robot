*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  DateTime

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
${new}                      //a[@title='New']
${save_btn}                 //button[@name='SaveEdit']
${knw_art}                  (//a[contains(text(),'Test Article')])[1]
*** Test Cases ***
Test Case Capability
        [Tags]  TTCS20-3247
        Login as MQS IA Agent
        MQS Agent Private List View Check
        Display Most Recent Cases From MQS IA Team Queue
        sleep  3s
        ELEMENT SHOULD NOT BE VISIBLE  ${new}
        sleep  3s
        Click Element   ${first-list-option}
        sleep  3s
        Click Edit
        element should be visible    ${save_btn}
        Capture Page Screenshot


Reports Capability
        [Tags]  TTCS20-3247-1
        Login as MQS IA Agent
        Open Reports tab and select list view
        Page Should Contain     EFC MQS
        Sleep  4s
        ELEMENT SHOULD NOT BE VISIBLE  ${new}


IANTO Test Agent Knowledge articles access
  [Tags]  TTCS20-3247-2

     Login as MQS IA Agent
     sleep  3s
     Open knowledge tab and select list view
     Sleep  3s
     ELEMENT SHOULD NOT BE VISIBLE  ${new}
     Sleep  3s
     click element  ${knw_art}
     Page Should Contain     Knowledge
     Page Should Contain     Test Article
     Page Should Contain     Publication Status
     Page Should Contain     Published