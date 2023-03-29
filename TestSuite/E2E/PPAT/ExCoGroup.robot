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

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***

PPAT Parliamentary Case - ExCo Group Field Functionality

    [Tags]  TTCS20-5070

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT Parliamentary agent creates a case
	Sleep  3s

	Click Edit
    Click Drop Down By Name    ExCo Group
    Select Dropdown Option     Clinical and Public Health (CPH)
    Click Drop Down By Name    ExCo Group
    Select Dropdown Option     Strategy, Policy & Programmes
    Click Drop Down By Name    ExCo Group
    Select Dropdown Option     Data, Analytics & Surveillance
    Click Drop Down By Name    ExCo Group
    Select Dropdown Option     Finance, Commercial & Corporate Services
    Click Drop Down By Name    ExCo Group
    Select Dropdown Option     People
    Click Drop Down By Name    ExCo Group
    Select Dropdown Option     Science
    Click Drop Down By Name    ExCo Group
    Select Dropdown Option     Testing
    Click Drop Down By Name    ExCo Group
    Select Dropdown Option     Health Protection Operations
    Click Drop Down By Name    ExCo Group
    Select Dropdown Option     OGD or Non UKHSA issue
    Click Drop Down By Name    ExCo Group
    Select Dropdown Option     Technology
    Sleep  3s
    Click Save

    Sleep       3s
    Click Edit
    Click Drop Down By Name         Status
    Select Drop down option         Closed
    Sleep  3s
    Click Save
