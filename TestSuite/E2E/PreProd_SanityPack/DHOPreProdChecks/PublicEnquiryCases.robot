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

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Variables ***

${app_launcher}         //*[@class='slds-icon-waffle']

*** Test Cases ***

#Public Enquiries Case Information
#    [Tags]  TTCS20-4165
#
#    Go To Salesforce login
#    Login as PPAT Public Enquiries team member
#    Reset View (if applicable)
#    Go To Cases Tab
#	Sleep  3s
#	PPAT Enquiries agent creates a case
#	Sleep   3s
#
#	Click Edit
#	Click Drop Down By Name         Case type
#    Select Drop down option         Standard
#    Click Drop Down By Name         Case type
#    Select Drop down option         Urgent
#    Click Drop Down By Name         Case type
#    Select Drop down option         Chief Exec
#    Sleep   2s

    Click Drop Down By Name         Status
    Select Drop down option         Awaiting Information (Internal)
    Click Drop Down By Name         Status
    Select Drop down option         Awaiting Information (External)
    Click Drop Down By Name         Status
    Select Drop down option         Draft
    Click Drop Down By Name         Status
    Select Drop down option         Clearance
    Click Drop Down By Name         Status
    Select Drop down option         On Hold
    Click Save
    Sleep   3s

    Click Edit
    Click Drop Down By Name         Status
    Select Drop down option         Closed
    Click Save
    Sleep   3s

    Click Edit
    Click Drop Down By Name         Status
    Select Drop down option         Review
    Click Save
    Sleep   3s

PPAT - Quick Actions - Case Quick Actions - Enquiry Agent
    [Tags]  TTCS20-4899-01

    Go To Salesforce login
    Login as PPAT Public Enquiries team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT Enquiries agent creates a case
	Sleep   3s

	Page should contain      Follow
	Page should contain      Edit
	Page should contain      Change Owner

	Sleep   2s
	Click Related Tab
	Sleep   2s
	Page should not contain element     //span[text()="Quick Action"]