*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/RITValidations.robot


# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***
IA Surge Team -Country Travelling From field
  [Tags]  TTCS20-1144    TTCS20-2011
        Go To Salesforce login
        Login as MQS IA Agent
        Display Most Recent Cases From MQS IA Team Queue
        sleep  3s
        Click Element   ${first-list-option}
        sleep  3s
        Click Edit
        Click Drop Down By Name     Country Travelling From
        Select Dropdown Option      India
        Click Drop Down By Name     Country Travelling To
        Select Dropdown Option      China  index=2
        Click Save
        Wait Until Page Has Saved
        Display Field text Should Be    Category     International arrivals
        Page Should Contain  India