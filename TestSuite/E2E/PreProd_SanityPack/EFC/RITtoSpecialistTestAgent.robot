*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CloseCaseTab/CloseCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/RITValidations.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1
*** Variables ***
# Input details

${text}
${new}                      //a[@title='New']


*** Test Cases ***
#RIT user assign Cases to Test Specialist with missing fields
#  [Tags]  CS20-211
#       Login as RIT Advisor
#        Sleep      3s
#        Open Most Recent Case From RIT Queue
#        Click Edit
#        Click Drop Down By Name     Category
#        Select Dropdown Option      Contact Tracing
#        Sleep  2s
#        Click Drop Down By Name       Subcategory
#        Select Dropdown Option      Contact Tracing - Other
#        Sleep  2s
#         Click Drop Down By Name     Assign Test Case
#         Select Dropdown Option     Specialist Test Team
#         Click Save
#        Check Error Message Content
#        sleep   2s
#        Click Cancel
RIT user assign Cases to Test Specialist
  [Tags]  CS20-211  CS20-208 CS20-209
       Login as RIT Advisor
        Sleep      3s
        Display Most Recent Cases From RIT Queue
        Sleep  4s
        ELEMENT SHOULD NOT BE VISIBLE  ${new}
        Sleep  2s
        Click Element   ${first-list-option}
        sleep  3s
        #Agent Creates Case -RIT
        RIT Validations - Assign to Specialist
