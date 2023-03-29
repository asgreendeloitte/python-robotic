*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/RelatedTab.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/CaseDetailsTab.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/PPATAgentCreateCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/CaseDetailsTab.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/RelatedTab.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/ListViews.robot
Resource    ../../../Resources/EnquiriesConsole/GlobalButtons.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Variables ***

${to-filed}      (//*[@class='default input uiInput uiInputTextForAutocomplete uiInput--default uiInput--input uiInput uiAutocomplete uiPillContainerAutoComplete uiInput--default uiInput--lookup'])[1]

*** Test Cases ***

Email To Field auto populate in Case
    [Tags]  TTCS20-5781
    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    #Open Most Recent Case From info-rights-triage-list Queue
    Open Most Recent Case From info-rights-triage-list Queue
    Sleep  4s
    click element   (//a[contains(text(),'Actions')])
    Page should contain     Email
     Sleep   4s
     Execute JavaScript    document.querySelector("li.uiTabItem a[title='Email']").click();   #####Emails Tab
     Sleep  4s
     ${to-field}=     Get Text      ${to-filed}
    Log to Console  ${to-field}
    Length Should Be            ${to-field}     0
    Capture Page Screenshot


