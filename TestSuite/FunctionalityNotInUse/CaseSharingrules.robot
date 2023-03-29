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
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/ListViews.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/PPATAgentCreateCase.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Variables ***
${global-search}    //button[@aria-label="Search"]
${case-number}      03382269
${case-number1}      03371612



*** Test Cases ***

PPAT Contribution sharing rule
    [Tags]  TTCS20-5072-1

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
    Display Most Recent Cases From PPAT Contribution Queue
    Click Element   ${global-search}
    sleep   3s
    Click Element   (//input[@type='search'])[last()]
    Input Text      (//input[@type='search'])[last()]   ${case-number}
    sleep   3s
    PRESS KEYS  None   ENTER
    sleep  5s
    Click Element   //a[text()='${case-number}']
    Click Edit
    Sleep  3s
    Click Save
    Page should contain    We hit a snag.
    Page Should contain    you don't have the necessary privileges


PPAT Contribution sharing rule parliamentary team member mailbox
    [Tags]  TTCS20-5072-2

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
    Display Most Recent Cases From PPAT Contribution Queue
    Click Element   ${global-search}
    sleep   3s
    Click Element   (//input[@type='search'])[last()]
    Input Text      (//input[@type='search'])[last()]   ${case-number1}
    sleep   3s
    PRESS KEYS  None   ENTER
    sleep  5s
    Click Element   (//a[text()='${case-number1}'])[2]
    Click Edit
    Sleep  3s
    Click Save
    Page should contain    was saved.

PPAT Contribution sharing rule Information rights team member
    [Tags]  TTCS20-5072-3

    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
    #Display Most Recent Cases From PPAT Contribution Queue
    Click Element   ${global-search}
    sleep   3s
    Click Element   (//input[@type='search'])[last()]
    Input Text      (//input[@type='search'])[last()]   ${case-number}
    sleep   3s
    PRESS KEYS  None   ENTER
    sleep  5s
    Click Element   (//a[text()='${case-number}'])[2]
    Click Edit
    Sleep  3s
    Click Save
    Page should contain    was saved.


PPAT Contribution sharing rule public enquiries team member
    [Tags]  TTCS20-5072-4

    Go To Salesforce login
    Login as PPAT Public Enquiries team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
    #Display Most Recent Cases From PPAT Contribution Queue
    Click Element   ${global-search}
    sleep   3s
    Click Element   (//input[@type='search'])[last()]
    Input Text      (//input[@type='search'])[last()]   03371608
    sleep   3s
    PRESS KEYS  None   ENTER
    sleep  5s
    Click Element   (//a[text()='03371608'])[2]
    Click Edit
    Sleep  3s
    Click Save
    Page should contain    was saved.


PPAT Contribution sharing rule compliants team member
    [Tags]  TTCS20-5072-5

    Go To Salesforce login
    Login as PPAT Public Complaints team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
    #Display Most Recent Cases From PPAT Contribution Queue
    Click Element   ${global-search}
    sleep   3s
    Click Element   (//input[@type='search'])[last()]
    Input Text      (//input[@type='search'])[last()]   03367083
    sleep   3s
    PRESS KEYS  None   ENTER
    sleep  5s
    Click Element   (//a[text()='03367083'])[2]
    Click Edit
    Sleep  3s
    Click Save
    Page should contain    was saved.