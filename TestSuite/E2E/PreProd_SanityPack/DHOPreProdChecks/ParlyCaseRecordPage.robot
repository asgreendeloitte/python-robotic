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

PPAT Parliamentary Case - Parly Case Record Page Updates

    [Tags]  TTCS20-4642    TTCS20-4747      TTCS20-5224

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT Parliamentary agent creates a case
	Sleep  3s

	Click Edit
    Click Drop Down By Name    Not A Genuine Case
    Select Dropdown Option     No
    Click Drop Down By Name    Not A Genuine Case
    Select Dropdown Option     Yes

    Click Drop Down By Name    Directorate
    Select Dropdown Option     Other
    Click Drop Down By Name    Directorate
    Select Dropdown Option     Other government department (OGD)
    Click Drop Down By Name    Team
    Select Dropdown Option     Adult Social Care

    Page should contain       ExCo Group

    Click Drop Down By Name    Compliant/Non-Compliant
    Select Dropdown Option     Compliant
    Click Drop Down By Name    Compliant/Non-Compliant
    Select Dropdown Option     Non-Compliant

    Click Drop Down By Name    Reason for late return
    Select Dropdown Option     Info not available
    Click Drop Down By Name    Reason for late return
    Select Dropdown Option     SCS availability

    Page should contain       Contact Name
    Sleep  3s
    Click Save
