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
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/PPATAgentCreateCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/CaseDetailsTab.robot


Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Variable ***
${Information-Rights-queue}      //span[contains(text(), 'Information Rights Reviewer')]/../../a
${first-list-option}        (//a[@data-refid='recordId'])[1]
${action-tab1}                              (//a[contains(text(),'Actions')])

*** Test Cases ***

Chatter Component Tab - Information Rights
    [Tags]  TTCS20-4521
    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Open cases tab and select list view
	Sleep  2s
    Wait until keyword succeeds   10s      1s    Click Element   ${Information-Rights-queue}
	Sleep  3s
    Wait until keyword succeeds   10s      1s    Click Element   ${first-list-option}
    Sleep  4s
    Page should contain     Details
    Page should contain     Related
    Page should contain     Actions
    Sleep       3s
    click element   ${action-tab1}
    Sleep       3s
    #Wait until keyword succeeds    10s      1s       Go to Actions tab
    #Go to Actions tab
    Page should contain     Post
    Page should contain     Email
    Page should contain     Comment
    Page should contain     Most Recent Activity
