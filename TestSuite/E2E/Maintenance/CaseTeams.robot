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

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Test Cases ***

PPAT - Case Teams - Add Case Team Members
    [Tags]  TTCS20-4563-01

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT Parliamentary agent creates a case
	Sleep   2s
	Click Related Tab
	Sleep  2s
	Page should contain     Related Cases
	Click Case Team section
	Select the add member
	Input text      ${search-box}       Persona Tier 1 Test
	Press Keys       ${search-box}      ENTER
	Press Keys       ${search-box}      ENTER
	Sleep  2s
    Click Element       //div[@role='dialog']//a[@data-refid="recordId"]
    Sleep  3s
    Click Element       //select//option[@label="Case Detail View"]
    Sleep   2s
    Click Element       //select//option[@label="Case Detail Edit"]
    Sleep   2s
    Click Element       //button[@name="save"]

PPAT - Case Teams - Case Team Member Read Access
    [Tags]  TTCS20-4563-02

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT Parliamentary agent creates a case
	Sleep   2s
	Click Related Tab
	Sleep  2s
	Page should contain     Related Cases
	Click Case Team section
	Select the add member
	Input text      ${search-box}       Persona Tier 1 Test
	Press Keys       ${search-box}      ENTER
	Press Keys       ${search-box}      ENTER
	Sleep  2s
    Click Element       //div[@role='dialog']//a[@data-refid="recordId"]
    Sleep  3s
    Click Element       //select//option[@label="Case Detail View"]
    Sleep   2s
    Click Element       //button[@name="save"]
    Sleep  3s
    Page should contain element   (//span[text()="Read Only"])[2]

PPAT - Case Teams - Case Team Member Edit Access
    [Tags]  TTCS20-4563-03

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT Parliamentary agent creates a case
	Sleep   2s
	Click Related Tab
	Sleep  2s
	Page should contain     Related Cases
	Click Case Team section
	Select the add member
	Input text      ${search-box}       Persona Tier 1 Test
	Press Keys       ${search-box}      ENTER
	Press Keys       ${search-box}      ENTER
	Sleep  2s
    Click Element       //div[@role='dialog']//a[@data-refid="recordId"]
    Sleep  3s
    Click Element       //select//option[@label="Case Detail Edit"]
    Sleep   2s
    Click Element       //button[@name="save"]
    Sleep  3s
    Page should contain element   (//span[text()="Read/Write"])[2]

PPAT - Case Teams - Case Team Member Removal
    [Tags]  TTCS20-4563-04

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT Parliamentary agent creates a case
	Sleep   2s
	Click Related Tab
	Sleep  2s
	Page should contain     Related Cases
	Click Case Team section
	Select the add member
	Input text      ${search-box}       Persona Tier 1 Test
	Press Keys       ${search-box}      ENTER
	Press Keys       ${search-box}      ENTER
	Sleep  2s
    Click Element       //div[@role='dialog']//a[@data-refid="recordId"]
    Sleep  3s
    Click Element       //select//option[@label="Case Detail Edit"]
    Sleep   2s
    Click Element       //button[@name="save"]
    Sleep  10s
    Select menu action next to the named team member
    Sleep  10s
    Select delete action next to the named team member
    Sleep   10s
    Click Element       //button[@title="Delete"]