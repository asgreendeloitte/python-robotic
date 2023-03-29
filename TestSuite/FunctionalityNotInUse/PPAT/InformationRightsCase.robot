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

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***

Custom Case ID Number - Information Rights
    [Tags]  TTCS20-4369-03
    Go To Salesforce login
    Login as PPAT Information Rights Test Agent
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
    Sleep   3s
     ${case-number}=     Get Text      (//lightning-formatted-text)[1]
     ${IRcase-number}=     Catenate    SEPARATOR=  IR   ${case-number}
    Page Should Contain      ${IRcase-number}

Information Rights Case Types
    [Tags]  TTCS20-4189     TTCS20-4193

    Go To Salesforce login
    Login as PPAT Information Rights Test Agent
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  3s

	Click Edit
    Click Drop Down By Name    Status
    Select Dropdown Option     Awaiting Information (External)
    Click Drop Down By Name    Status
    Select Dropdown Option     Draft
    Click Drop Down By Name    Status
    Select Dropdown Option     Clearance
    Click Drop Down By Name    Status
    Select Dropdown Option     On Hold
    Click Drop Down By Name    Status
    Select Dropdown Option     Review
    Click Drop Down By Name    Status
    Select Dropdown Option     Closed
    Click Drop Down By Name    Status
    Select Dropdown Option     Awaiting Information (Internal)
    Click Save
    Sleep   5s

    Click Edit
    Click Drop Down By Name    Status
    Select Dropdown Option     New
    Click Save
    Sleep   5s
    Page should contain         Unable to set the case status to new, please select another status from the options provided
    Sleep   2s
    Click Cancel

    Click Edit
    Click Drop Down By Name   Case type
    Select Dropdown Option     Access to Health Records
    Click Drop Down By Name   Case type
    Select Dropdown Option     Coroners Requests
    Click Drop Down By Name   Case type
    Select Dropdown Option     Data Subject Access Requests
    Click Drop Down By Name   Case type
    Select Dropdown Option     Environmental Information Regulations
    Click Drop Down By Name   Case type
    Select Dropdown Option     Freedom of Information
    Click Drop Down By Name   Case type
    Select Dropdown Option     FOI Consultations
    Click Drop Down By Name   Case type
    Select Dropdown Option     Information Commissioners Office
    Click Drop Down By Name   Case type
    Select Dropdown Option     Internal Review
    Click Save
    Sleep   5s

    Click Edit
    Click Drop Down By Name   Case type
    Select Dropdown Option     --None--
    Click Save
    Page should contain      Case Type cannot be changed to None
    Click Cancel

    Click Edit

    Click Drop Down By Name   SubCase Type
    Select Dropdown Option    Access to Health Records
    Click Drop Down By Name   SubCase Type
    Select Dropdown Option     Coroners Requests
    Click Drop Down By Name   SubCase Type
    Select Dropdown Option     Data Subject Access Requests
    Click Drop Down By Name   SubCase Type
    Select Dropdown Option     Environmental Information Regulations
    Click Drop Down By Name   SubCase Type
    Select Dropdown Option     Freedom of Information
    Click Drop Down By Name   SubCase Type
    Select Dropdown Option     FOI Consultations
    Click Drop Down By Name   SubCase Type
    Select Dropdown Option     Information Commissioners Office
    Click Drop Down By Name   SubCase Type
    Select Dropdown Option     Internal Review

	Page should contain     No risk
	Page should contain     Comms
	Page should contain     Legal
	Page should contain     CEO
	Page should contain     Other

    Click Save

    Information is present within the section      Case Information          Risk Factor


PPAT Public Information reviewer Member - Users can NOT search and view the list view ‘Home Testing View’
    [Tags]  TTCS20-4688-04

    Go To Salesforce login
    Login as PPAT Information Rights Test Agent
    Reset View (if applicable)
	Go To Cases Tab
	Select the recently viewed list view
	Sleep  3s
    page should not contain       Home Testing View

PPAT - Public Queue Amendments - Information Rights List View
    [Tags]  TTCS20-4676-01

    Go To Salesforce login
    Login as PPAT Information Rights Test Agent
    Reset View (if applicable)
    Open cases tab and select list view
	Sleep  3s
    Select information rights reviewer from the list view
	Sleep  3s
    Page should contain     Filtered by Information Rights Reviewer - Status, Case Record Type
    Page should contain     Case Number
    Page should contain     Public Case ID
    Page should contain     Account Name
    Page should contain     Case type
    Page should contain     Status
    Page should contain     Owner Name
    Page should contain     Date/Time Opened
    Page should contain     Entitlement End Date