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

*** Test Cases ***

Public Complaints Case Layout - Highlights Bar & Case Details Tab
    [Tags]  TTCS20-4374
    Go To Salesforce login
    Login as PPAT Public Complaints Test Agent
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Public Complaints type
	Sleep  3s
	Page should contain     Case type
	Page should contain     Public Complaint
	Page should contain     Status
	Page should contain     New
	page should contain     Entitlement Process End Time
	Sleep       2s
	Page should contain     Case Information
	Page should contain     Contact Information
	Page should contain     Outcome
	Page should contain     Live Issues
	Information is present within the section      Case Information          Account Name
	Information is present within the section      Case Information          Status
	Information is present within the section      Case Information          Public Case ID
	Information is present within the section      Case Information          Case type
	Information is present within the section      Case Information          ExCo Group
	Information is present within the section      Case Information          Subject
	Information is present within the section      Case Information          Category
	Information is present within the section      Case Information          Subcategory
	Information is present within the section      Case Information          Restricted
	Information is present within the section      Case Information          Case Owner
	Information is present within the section      Case Information          Origin Demographics
	Information is present within the section      Case Information          Case Origin
	Information is present within the section      Case Information          Date/Time Opened
	Information is present within the section      Case Information          Auto-Acknowledgement Date
	Information is present within the section      Case Information          Priority

	Information is present within the section      Contact Information       Contact Name
	Information is present within the section      Contact Information       Web Email
	Information is present within the section      Contact Information       Description
	Information is present within the section      Contact Information       Accessibility Marker
	Information is present within the section      Contact Information       Accessibility Note

    Information is present within the section      Outcome          Not A Genuine Case
	Information is present within the section      Outcome          Outcome
	Information is present within the section      Outcome          Protected Characteristics Involved?
	Information is present within the section      Outcome          Protected Characteristics
	Information is present within the section      Outcome          Passed To

	Information is present within the section      Live Issues               Live Issue

	Page should contain                             Milestones
	Page should contain                             Post
	Page should contain                             Email
	Page should contain                             Comment
	Page should contain                             Knowledge

Custom Case ID Number - Public Complaints
    [Tags]  TTCS20-4660
    Go To Salesforce login
    Login as PPAT Public Complaints Test Agent
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Public Complaints type
	Click Edit
	Click Drop Down By Name     Priority
	Select Dropdown Option      High
	Click Drop Down By Name     Priority
	Select Dropdown Option      Medium
	Sleep   2s
	Click Drop Down By Name (bug fix)     Case type
    Select Dropdown Option (bug fix)      --None--    index=2
    Sleep   2s
    Click Save
    Sleep   2s
    Page should contain     Case Type cannot be changed to None
    Sleep   2s
	Click Drop Down By Name     Case type
	Select Dropdown Option      Public Complaint
    Click Drop Down By Name     Case type
    Select Dropdown Option      Appeal
    Click Drop Down By Name     Case type
    Select Dropdown Option      Ombudsman Referral

Public Enquiries Case Layout - Related Tab
    [Tags]  TTCS20-4381

    Go To Salesforce login
    Login as PPAT Public Complaints Test Agent
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Public Complaints type
	Sleep   2s
	Click Related Tab
	Sleep  2s
	Page should contain     Related Cases
	Page should contain     Case Team
	Page should contain     Case History
	Page should contain     Files
	Sleep       2s
	Click Case Team section
	Page should contain     Team Member
	Page should contain     Member Role
	Page should contain     Case Access
	Page should contain     Visible In Customer Portal
	Sleep   2s
	Close sub tab section
	Sleep   2s
	Click Case History section
	Page should contain     Date
	Page should contain     Field
	Page should contain     User
	Page should contain     Original Value

PPAT Public Complaints Team Member - Users can NOT search and view the list view ‘Home Testing View’
    [Tags]  TTCS20-4688-03

    Go To Salesforce login
    Login as PPAT Public Complaints Test Agent
    Reset View (if applicable)
	Go To Cases Tab
	Select the recently viewed list view
	Sleep  3s
    page should not contain       Home Testing View

PPAT Public Complaints Rights Case Creation

    [Tags]  TTCS20-4372
    Go To Salesforce login
    Login as PPAT Public Complaints Test Agent
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Public Complaints type
	Sleep  3s
	Click Edit
	Sleep  3s
	Click Drop Down By Name         ExCo Group
    Select Drop down option         Clinical and Public Health (CPH)
    Click Save
	Sleep   3s
	Page should contain     Status
	Page should contain     New
	Page should contain     Case type
	Page should contain     Public Complaint
	Page should contain     Public Case ID
	Page should contain     Date/Time Opened
	Sleep       2s
	Page should contain     Case Origin
	Page should contain     Case Owner
	Page should contain     Public Complaints
	Page should contain     Web Email
    Page should contain     sameera.purini@test-and-trace.nhs.uk
    Page should contain     Subject
    Page should contain     Description
    Page should contain     Automation testing

    Go To Cases Tab
    Select the recently viewed list view
    Select the public complaints reviewer from the list view
    Page should contain     Public Complaints Reviewer

PPAT - Public Queue Amendments - PPAT Public Complaints List View
    [Tags]  TTCS20-4676-03
    Go To Salesforce login
    Login as PPAT Public Complaints Test Agent
    Reset View (if applicable)
    Open cases tab and select list view
	Sleep  3s
    Select public complaints reviewer from the list view
	Sleep  3s
    Page should contain     Filtered by Public Complaints Reviewer - Status, Case Record Type
    Page should contain     Case Number
    Page should contain     Public Case ID
    Page should contain     Account Name
    Page should contain     Case type
    Page should contain     Status
    Page should contain     Owner Name
    Page should contain     Date/Time Opened
    Page should contain     Entitlement End Date
