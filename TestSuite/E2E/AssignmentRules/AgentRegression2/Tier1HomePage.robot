*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot
Resource    ../../../../Resources/EnquiriesConsole/GlobalButtons.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Variables ***
${next-button}      //button[contains(text(), 'Next')]
${category-dropdown}      //select[@name= 'Category']

*** Test Cases ***
Tier 1 - Home Page & List View
    [Tags]  TTCS20-5886      TTCS20-5885-01
        Go To Salesforce login
        Login as Tier 1 Test & Trace Agent
        Reset View (if applicable)
        Go To Home Tab
		Sleep  3s
        Page Should Contain    Good morning/afternoon, thank you for calling NHS Test and Trace Enquiries, you’re speaking to Hasen-tier1 test&trace, are you calling regarding WHISPER
        Page Should Contain    Agent Prompt - Please ask caller for their name
        Page Should Contain    Whisper heard
        Page Should Contain    Whisper accurate
        Page Should Contain    Category
        Page Should Contain Element    //button[contains(text(), 'Next')]
        Page Should Contain Element    //a[contains(text(), 'My Cases')]
        Page Should Contain Element    (//span[@title= 'Case Number'])[1]
        Page Should Contain Element    (//span[@title= 'Outcome'])[1]
        Page Should Contain Element    (//span[@title= 'Category'])[1]
        Page Should Contain Element    (//span[@title= 'Subcategory'])[1]
        Page Should Contain Element    (//span[@title= 'Caller Type'])[1]
        Page Should Contain Element    (//span[@title= 'Test Type'])[1]
        Page Should Contain Element    (//span[@title= 'Country'])[1]

        Page Should Contain Element    //a[contains(text(), 'All Cases')]
        Page Should Contain Element    (//span[@title= 'Case Number'])[2]
        Page Should Contain Element    (//span[@title= 'Outcome'])[2]
        Page Should Contain Element    (//span[@title= 'Category'])[2]
        Page Should Contain Element    (//span[@title= 'Subcategory'])[2]
        Page Should Contain Element    (//span[@title= 'Caller Type'])[2]
        Page Should Contain Element    (//span[@title= 'Test Type'])[2]
        Page Should Contain Element    (//span[@title= 'Country'])[2]

Tier 1 - Home Page & List View
    [Tags]  TTCS20-5885-02
        Go To Salesforce login
        Login as Tier 1 Test & Trace Agent
        Reset View (if applicable)
        Go To Home Tab
		Sleep  3s
        Page Should Contain    Good morning/afternoon, thank you for calling NHS Test and Trace Enquiries, you’re speaking to Hasen-tier1 test&trace, are you calling regarding WHISPER
        Page Should Contain    Agent Prompt - Please ask caller for their name
        Page Should Contain    Whisper heard
        Page Should Contain    Whisper accurate
        Page Should Contain    Category
        Page Should Contain Element    //button[contains(text(), 'Next')]
        Click Element    ${next-button}
        Page Should Contain    Please select a choice
        Populate Category picklist from Home Page
        Click Element    ${next-button}
        Page Should Contain    Please select a choice
        Populate Whisper heard picklist from Home Page
        Click Element    ${next-button}
        Page Should Contain    Please select a choice
        Populate Whisper accurate picklist from Home Page
        Click Element    ${next-button}
        Page Should Contain Element    //button[contains(text(), 'Finish')]

