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


*** Test Cases ***

PPAT Users - New Triage Case Lists - Public Complaints
    [Tags]  TTCS20-5005    TTCS20-5746-03-05

    Go To Salesforce login
    Login as PPAT Public Complaints team member
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element       ${public-comp-triage-list-view}
    Sleep   5s
    click Element       ${fliter-icon}
    Sleep   3s

    Page should contain     Filters
    Page should contain     Locked Filters
    Page should contain     Filter by Owner    Public Complaints Reviewer
    Page should contain     Case Record Type   equals
    Page should contain     equals  PPAT Public Complaints
    Page should contain     Status    equals
    Page should contain     equals        New, Transferred

    Open cases tab and select list view
    Click Element       ${public-complaints-list-view}
    Sleep   5s
    click Element       ${fliter-icon}
    Sleep   3s
        Page should contain     Locked Filters
    Page should contain     Filter by Owner      All cases
    Page should contain     Case Record Type     equals
    Page should contain     equals               PPAT Public Complaints
    Page should contain     Status               not equal to
    Page should contain     not equal to         New

PPAT Users - New Triage Case Lists - Info Rights
    [Tags]  TTCS20-5005    TTCS20-5746-04-06

    Go To Salesforce login
    Login as PPAT Information rights super user
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element       ${info-rights-triage-list-view}
    Sleep   5s
    click Element       ${fliter-icon}
    Sleep   3s

    Page should contain     Filters
    Page should contain     Locked Filters
    Page should contain     Filter by Owner    Information Rights Reviewer
    Page should contain     Case Record Type   equals
    Page should contain     equals             PPAT Information Rights
    Page should contain     Status    equals
    Page should contain     equals        New, Transferred

    Open cases tab and select list view
    Click Element       ${public-info-list-view}
    Sleep   25s
    click Element       ${fliter-icon}
    Sleep   3s
        Page should contain     Locked Filters
    Page should contain     Filter by Owner      All cases
    Page should contain     Case Record Type     equals
    Page should contain     equals               PPAT Information Rights
    Page should contain     Status               not equal to
    Page should contain     not equal to         New
    Page should contain     Case Owner           not equal to
    Page should contain     not equal to         Information_Rights_Reviewer


