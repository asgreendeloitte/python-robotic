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
${app_launcher}          //*[@class='slds-icon-waffle']
${app_launcher_search}   //*[@class='slds-input' and @placeholder='Search apps and items...']
${data_pop}              //*[@class='al-menu-dropdown-list' and @aria-label='Items']/p
${text}
${text_data}             No results
${new}                      //a[@title='New']
${newreport}                //a[@title='New Report']

*** Test Cases ***
#RIT user assign Cases to Test Specialist with missing fields
#  [Tags]  CS20-211
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
  [Tags]  TTCS20-1054  TTCS20-1324 TTCS20-1034  TTCS20-3141
       Login as RIT Advisor
        Sleep      3s
        Display Most Recent Cases From RIT Queue
        Sleep  2s
        ELEMENT SHOULD NOT BE VISIBLE  ${new}
        Sleep  2s
        Click Element   ${first-list-option}
        sleep  3s
        RIT Validations - Assign to Specialist

RIT user accessing reports and email template
  [Tags]  TTCS20-3141-2
       Login as RIT Advisor
        Sleep      3s
        Display Most Recent Cases From RIT Queue private view
        Sleep  2s
        Display Most Recent Cases From RIT Queue
        Sleep  2s
        app launcher check  Reports
        Sleep  3s
        click element  ${app_launcher}
        app launcher check  Email Templates

RIT Team Lead validations
    [Tags]  TTCS20-3144
        Login as RIT Team lead
        Display Most Recent Cases From RIT Queue private view
        Sleep  2s
        Display Most Recent Cases From RIT Queue
        ELEMENT SHOULD NOT BE VISIBLE  ${new}
        Sleep  2s
        app launcher check  Email Templates
        #click element  ${app_launcher}
        Sleep  2s
        Display Reports From IANTO - Team Queue
        ELEMENT SHOULD BE VISIBLE  ${newreport}

