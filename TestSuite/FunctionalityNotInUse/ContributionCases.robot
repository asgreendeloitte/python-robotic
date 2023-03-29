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

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Variable ***
${Public-enquires-contribution-queue}       //span[contains(text(), 'Public Enquiries Contribution Cases')]/../../a
${parliamentary-contribution-queue}        //span[contains(text(), 'Parliamentary Contribution Cases')]/../../a
${information-rights-contribution-queue}   //span[contains(text(), 'Information Rights Contribution Cases')]/../../a
${complaints-contribution-queue}       //span[contains(text(), 'Public Complaints Contribution Case')]/../../a
${list-views-menue}             //button[@title='Select a List View']

*** Test Cases ***

Public Enquiries Contribution Cases listview
    [Tags]  TTCS20-4212-1
    Go To Salesforce login
    Login as PPAT Public Enquiries team member
    Open cases tab and select list view
	Sleep  3s
	Wait until keyword succeeds   12s      2s    Click Element   ${Public-enquires-contribution-queue}
	Sleep  3s
    Page should contain         Case Number
    Page should contain         Public Case ID
    Page should contain         Case Owner
    Page should contain         Status
    Page should contain         Contact
    Page should contain         ExCo Group
    Page should contain         Team
    Page should contain         Date/Time Opened
    Page should contain         Internal Deadline
    Click element           //button[@title='Show filters']
    Sleep   3s
    Page should contain       equals  PPAT Contribution
    Page should contain       equals  Public Enquiries Mailbox
    Page should contain      not equal to  Closed


PPAT - Contribution Case identifier - Parliamentary rights team member
    [Tags]  TTCS20-5009

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
    PPAT Agent creates a contribution case
    Sleep   3s
    Page should contain     CONTRIBUTION CASE

PPAT - Contribution Case identifier - Public Enquiries team member
    [Tags]  TTCS20-5009

    Go To Salesforce login
    Login as PPAT Public Enquiries team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT Agent creates a contribution case
	Sleep   3s

    Page should contain     CONTRIBUTION CASE

PPAT - Contribution Case identifier - Public Complaints team member
    [Tags]  TTCS20-5009

    Go To Salesforce login
    Login as PPAT Public Complaints team member
    Reset View (if applicable)
    Go To Cases Tab
    Sleep  3s
	PPAT Agent creates a contribution case
	Sleep   3s

    Page should contain     CONTRIBUTION CASE

PPAT - Contribution Case identifier - Information rights team member
    [Tags]  TTCS20-5009

    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT Agent creates a contribution case
	Sleep   3s

    Page should contain     CONTRIBUTION CASE
