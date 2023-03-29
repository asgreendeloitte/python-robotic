*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Omnichannel.robot


# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Variables ***
${ErrorMessagecaptured}           xpath://span[@class='genericError uiOutputText']

${ErrorMessageNotified}           Review the errors on this page.


*** Test Cases ***
Specialist user assign Cases to RTSLTS user
  [Tags]  TTCS20-1814
        Login as Specialist Test Agent
        Sleep      3s
        #Display Most Recent Cases From Specialist Complaints & Enquiries- Test Queue
        Reset View (if applicable)
        Go To Cases Tab
		Sleep  3s
        Agent Creates Case for Specialist
        Sleep  6s
        Case Status Text Should Be   New
        Display Field text Should Be    Category         Test - General
        Sleep   3s
        Click Edit
        Click Drop Down By Name     Category
        Select Dropdown Option      Test - General
        Sleep  2s
        Click Drop Down By Name       Subcategory
        Select Dropdown Option      Regional Test Sites and Local Test Sites (RTS/LTS)
        Sleep  2s
        Click Drop Down By Name     Assign Test Case
        Select Dropdown Option      RTS/LTS & MTU Team
        Click Save
        Wait Until Page Has Saved
        Case Owner Text Should Be      RTS/LTS & MTU Advisors
        Sleep  2s


Omnichannel - Offline status work assigned is not visible-RTS
        [Tags]  TTCS20-1241
        Login as RTS/LTS Advisor
        Agent clicks on OmniChannel

Omnichannel - Accept work from Specialist Test Team
        [Tags]  TTCS20-1030
        Login as RTS/LTS Advisor
        Accept work through Omnichannel-RTS


Test Generalist user assign Cases to RTSLTS user
        [Tags]  TTCS20-2658
        Login as Generalist Test Agent
        Sleep      3s
        Reset View (if applicable)
        #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
        Go To Cases Tab
		Sleep  3s
        Agent Creates Case
        Sleep  6s
        Case Status Text Should Be   New
        Display Field text Should Be    Category         Test - General
        Sleep   3s
        Click Edit
        Click Drop Down By Name     Category
        Select Dropdown Option      Book/order a test
        Sleep  2s
        Click Drop Down By Name       Subcategory
        Select Dropdown Option      Book PCR test
        Sleep  2s
        Click Drop Down By Name     Assign Test Case
        Select Dropdown Option      RTS/LTS & MTU Team
        Click Save
        Sleep  3s
        ${ErrorMessageNotified}=  Get Text    ${ErrorMessagecaptured}
        Log to Console    ${ErrorMessageNotified}
        Should Contain Any  ${ErrorMessageNotified}    ${ErrorMessageNotified}
        Sleep  3s
        Click Drop Down By Name     Category
        Select Dropdown Option      Test - General
        Sleep  2s
        Click Drop Down By Name       Subcategory
        Select Dropdown Option      Regional Test Sites and Local Test Sites (RTS/LTS)
        Sleep  2s
        Click Drop Down By Name     Assign Test Case
        Select Dropdown Option      RTS/LTS & MTU Team
        Click Save
        Wait Until Page Has Saved
        Case Owner Text Should Be      RTS/LTS & MTU Advisors
        Sleep  2s
