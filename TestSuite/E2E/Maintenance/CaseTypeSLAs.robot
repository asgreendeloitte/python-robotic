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
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/RelatedTab.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/Milestones.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Test Cases ***

Information Rights Case Type SLA - Entitlement Pause
    [Tags]   TTCS20-4197-01-03-11

    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  3s
    Click Edit
    Sleep  3s

    Click Drop Down By Name         Status
    Select Drop down option         ID Requested
    Sleep  3s
    Click Save
    Wait Until Page Has Saved
    Sleep  4s
    page should contain     No milestones to show.


Information Rights Case Type SLA - Entitlement by Case Type
    [Tags]   TTCS20-4197-02-06

    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  3s
    Click Edit
    Sleep  3s

    Click Drop Down By Name         Case type
    Select Drop down option         Access to Health Records
    Sleep  3s
    Click Save
    Wait Until Page Has Saved
    Sleep  4s
    page should contain     21 days

    Sleep  3s
    Click Edit
    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Coroners Requests
    Sleep  3s
    Click Save
    Wait Until Page Has Saved
    Sleep  4s
    page should contain     1 month

    Sleep  3s
    Click Edit
    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Data Subject Access Requests
    Sleep  3s
    Click Save
    Wait Until Page Has Saved
    Sleep  4s
    page should contain     28 days

    Sleep  3s
    Click Edit
    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Environmental Information Regulations
    Sleep  3s
    Click Save
    Wait Until Page Has Saved
    Sleep  4s
    page should contain     20 days

    Sleep  3s
    Click Edit
    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Freedom of Information
    Sleep  3s
    Click Save
    Wait Until Page Has Saved
    Sleep  4s
    page should contain     20 days

    Sleep  3s
    Click Edit
    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         FOI Consultations
    Sleep  3s
    Click Save
    Wait Until Page Has Saved
    Sleep  4s
    page should contain     20 days

    Sleep  3s
    Click Edit
    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Information Commissioners Office
    Sleep  3s
    Click Save
    Wait Until Page Has Saved
    Sleep  4s
    page should contain     No milestones to show.

Information Rights Case Type SLA - Entitlement Pause
    [Tags]   TTCS20-4197-04

    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  3s
    Click Edit
    Sleep  3s

    Click Drop Down By Name         Status
    Select Drop down option         Awaiting Information (Internal)
    Sleep  3s
    Click Save
    Wait Until Page Has Saved
    Sleep  4s
    page should contain     No milestones to show.

Information Rights Case Type SLA - Entitlement Pause
    [Tags]   TTCS20-4197-10

    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  3s
    Click Edit
    Sleep  3s

    Click Drop Down By Name         Case type
    Select Drop down option         Access to Health Records
    Sleep  3s
    Click Save
    Wait Until Page Has Saved
    Sleep  4s
    page should contain     21 days

    Click Edit
    Sleep  3s
    input text      ${case-origin-date-field}  12/12/2022
    Sleep  3s
    Click Save
    Wait Until Page Has Saved
    Sleep  4s
    page should contain     21 days

Public Enquiries SLA
    [Tags]  TTCS20-4159

    Go To Salesforce login
    Login as PPAT Public Enquiries team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT Enquiries agent creates a case
	Sleep   3s

    page should contain     20 days  23hr

    Click Edit
	Click Drop Down By Name    Status
    Select Dropdown Option     Closed
    Click Drop Down By Name    Not A Genuine Case
    Select Dropdown Option     Yes
    Click Drop Down By Name    Not a Genuine Case Reason
    Select Dropdown Option     Test case

    Click Save

    page should contain     You completed all the milestones.

Public Complaints SLA
    [Tags]  TTCS20-4380
    Go To Salesforce login
    Login as PPAT Public Complaints team member
    Reset View (if applicable)
    Go To Cases Tab
    Sleep  3s
	PPAT QA agent creates a case Public Complaints type
	Sleep  3s

    page should contain     20 days  23hr

    Click Edit
	Click Drop Down By Name         Origin Demographic
    Select Drop down option         Citizen
	Click Save
	Sleep  3s

	page should contain     20 days  23hr

	Click Edit
	Click Drop Down By Name         Origin Demographic
    Select Drop down option         Chief Executive Office
	Click Save
	Sleep  3s

	page should contain     5 days  23hr

	Click Edit
	Click Drop Down By Name         Origin Demographic
    Select Drop down option         MP
	Click Save
	Sleep  3s

	page should contain     20 days  23hr

	Click Edit
	Click Drop Down By Name         Origin Demographic
    Select Drop down option         DHSC
	Click Save
	Sleep  3s

	page should contain     20 days  23hr

    Click Edit
	Click Drop Down By Name    Status
    Select Dropdown Option     Closed
    Click Drop Down By Name    Not A Genuine Case
    Select Dropdown Option     Yes
    Click Drop Down By Name    Not a Genuine Case Reason
    Select Dropdown Option     Test case

    Click Save
    Sleep  3s

    page should contain     You completed all the milestones.