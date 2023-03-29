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

Public Enquiries Case Layout - Related Tab
    [Tags]  TTCS20-4163

    Go To Salesforce login
    Login as PPAT Public Enquiries Test Agent
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT Enquiries agent creates a case
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

Public Enquiries Case Layout - Highlights Bar & Case Details Tab
    [Tags]  TTCS20-4161

    Go To Salesforce login
    Login as PPAT Public Enquiries Test Agent
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT Enquiries agent creates a case
	Sleep  3s
	Page should contain     Case type
	Page should contain     Enquiry
	Page should contain     Status
	Page should contain     New
	page should contain     Entitlement Process End Time
	Sleep       2s
	Page should contain     Case Information
	Page should contain     Contact Information
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
	Information is present within the section      Case Information          Date/Time Opened
	Information is present within the section      Case Information          Case Origin
	Information is present within the section      Case Information          Priority
	Information is present within the section      Contact Information       Contact Name
	Information is present within the section      Contact Information       Web Email
	Information is present within the section      Contact Information       Description
	Information is present within the section      Live Issues               Live Issue
	Page should contain                             Milestones
	Page should contain                             Post
	Page should contain                             Email
	Page should contain                             Comment
	Page should contain                             Knowledge

Custom Case ID Number - Public Enquiries
    [Tags]  TTCS20-4369-02
    Go To Salesforce login
    Login as PPAT Public Enquiries Test Agent
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT Enquiries agent creates a case
    Sleep   3s
     ${case-number}=     Get Text      (//lightning-formatted-text)[1]
     ${ENQcase-number}=     Catenate    SEPARATOR=  ENQ   ${case-number}
    Page Should Contain      ${ENQcase-number}


PPAT Public Enquiries Team Member - Users can NOT search and view the list view ‘Home Testing View’
    [Tags]  TTCS20-4688-02

    Go To Salesforce login
    Login as PPAT Public Enquiries Test Agent
    Reset View (if applicable)
	Go To Cases Tab
	Select the recently viewed list view
	Sleep  3s
    page should not contain       Home Testing View

PPAT - Public Queue Amendments - PPAT Public Enquiries List View
    [Tags]  TTCS20-4676-02
    Go To Salesforce login
    Login as PPAT Public Enquiries Test Agent
    Reset View (if applicable)
    Open cases tab and select list view
	Sleep  3s
    Select public enquiries from the list view
	Sleep  3s
    Page should contain     Filtered by Public Enquiries - Status, Case Record Type
    Page should contain     Case Number
    Page should contain     Public Case ID
    Page should contain     Account Name
    Page should contain     Case type
    Page should contain     Status
    Page should contain     Owner Name
    Page should contain     Date/Time Opened
    Page should contain     Entitlement End Date