*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

#Resource     ${EXECDIR}/Resources/EnquiriesConsole/AgentLogins/uat_AgentLogins.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CloseCaseTab/CloseCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/RITValidations.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Omnichannel.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***
#RIT user assign Cases to Test Specialist with missing fields
#  [Tags]  TTCS20-1054
#        Login as RIT Advisor
#        Sleep      3s
#        Open Most Recent Case From RIT Queue
#        Click Edit
#        Click Drop Down By Name     Category
#        Select Dropdown Option      Contact Tracing
#        Sleep  2s
#        Click Drop Down By Name       Subcategory
#        Select Dropdown Option      Contact Tracing - Other
#        Sleep  2s
#        Click Drop Down By Name     Assign Test Case
#        Select Dropdown Option     Specialist Test Team
#        Click Save
#        Check Error Message Content
#        sleep   2s
#        Click Cancel


RIT user assign Cases to Test Specialist
  [Tags]  TTCS20-1054
       Login as RIT Advisor
        Sleep      3s
        Display Most Recent Cases From RIT Queue
        Sleep  2s
        #Agent Creates Case -RIT
        Click Element   ${first-list-option}
        sleep  3s
        RIT Validations - Assign to Specialist
        Sleep  5s

Omnichannel - Accept work from Specialist Test Team
        [Tags]  TTCS20-1030   TTCS20-1047
#        Go To Salesforce login
        Login as Specialist Test Agent
        Accept work through Omnichannel

