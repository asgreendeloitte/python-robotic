*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

#Logins
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot


Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CaseE2EoutboundsendingEmailonTracecase.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Variables ***

${outbound}     //span[contains(text(),'Outbound call')]
${outbound1}             //a[contains(text(),'Outbound call')]

*** Test Cases ***

Tier2 Agent Outbound Call Action
    [Tags]  TTCS20-4800

        Login as Tier 2 Test & Trace Agent
        Open Most Recent Case From inbound 119 tier2 - Test Queue
        Sleep  4s
        page should contain element    ${outbound}
        Sleep  4s
        Execute JavaScript    document.querySelector("li.uiTabItem a[title='Outbound call']").click();
        Execute javascript  window.scrollTo(0,300)
        Sleep  4s


        #Click Drop Down By Name     Call reason
        Click Drop Down By Name (bug fix)       Call reason

        Populate Fields From Call reason Picklist   Call reason
        Sleep  4s
        Click Drop Down By Name (bug fix)     Call Outcome
        Populate Fields From Call Outcome Picklist      Call Outcome


