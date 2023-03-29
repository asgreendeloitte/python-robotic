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
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/dropDownMenuItems.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***

Public Enquiries Case Layout - Highlights Bar & Case Details Tab
    [Tags]  TTCS20-4200

    Go To Salesforce login
    Login as PPAT Parliamentary Test Agent
    Reset View (if applicable)
	Sleep  3s
    Open cases tab and select list view
	Sleep  3s
    Click Element   ${Parliamentary-queue}
	Sleep  3s
    Click Element   ${first-list-option}

    Page should contain     Case Number
	Page should contain     PQ / PO number
	Page should contain     Date/Time Opened
	Page should contain     Deadline
	Page should contain     Case Owner
	Page should contain     Status
	Page should contain     Case type

	Page should contain          Case Owner
	Page should contain          Priority
	Page should contain          Case Record Type
	Page should contain          PQ or OPB
	Page should contain          Case Number
	Page should contain         PQ / PO number
	Page should contain          Case Origin
	Page should contain         Status
	Page should contain          Account
	Page should contain          Web Email
	Page should contain          Case type
	Page should contain          Category
	Page should contain          SCS / DD Assigned
	#Page should contain          Subcategory
	Page should contain          Directorate
	Page should contain         Parent Case
	Page should contain         Contact Name
	Page should contain         Subject

	Information is present within the section      PQ Information          Contributor
	Information is present within the section      PQ Information          Lead
	Information is present within the section      PQ Information          MP Name
	Information is present within the section      PQ Information          MP Case Reference
	Information is present within the section      PQ Information          Parliamentary Question
	Information is present within the section      PQ Information          Uploaded Response
	Information is present within the section      PQ Information          Description


	Information is present within the section      Management          ExCo Group
	Information is present within the section      Management          Live Issue

    Click Related Tab
    Sleep  2s
    Page should contain     Related Cases
	Page should contain     Files
	Page should contain     Attachments
	Page should contain     Case History

	Page should contain                             Milestones
	Page should contain                             Post
	Page should contain                             Email
	Page should contain                             Comment
	Page should contain                             Knowledge

PPAT Parliamentary Team Member - Users can NOT search and view the list view ‘Home Testing View’
    [Tags]  TTCS20-4688-01

    Go To Salesforce login
    Login as PPAT Parliamentary Test Agent
    Reset View (if applicable)
	Go To Cases Tab
	Sleep  3s
	Select the recently viewed list view
	input text      ${search}   Home Testing View
	page should not contain     No results found.