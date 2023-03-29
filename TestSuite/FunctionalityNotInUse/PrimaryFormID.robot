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
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/RelatedTab.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***

Information Rights Case Layout - Highlights Bar & Case Details Tab
    [Tags]  TTCS20-4190
    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  3s
	Page should contain     Public Case ID
	Page should contain     Case type
	Page should contain     Status
	Page should contain     New
	Sleep       2s
	Page should contain     Case Information
	Page should contain     Contact Information
	Page should contain     Consent
	Page should contain     Approvals
	Page should contain     Outcome
	Page should contain     Live Issues
	Information is present within the section      Case Information          Case Owner
	Information is present within the section      Case Information          Account Name
	Information is present within the section      Case Information          Status
	Information is present within the section      Case Information          Public Case ID
	Information is present within the section      Case Information          Case type
	Information is present within the section      Case Information          SubCase Type
	Information is present within the section      Case Information          Category
	Information is present within the section      Case Information          Subcategory
	Information is present within the section      Case Information          Subcategory
	Information is present within the section      Case Information          Restricted
	Information is present within the section      Case Information          Risk Factor
	Information is present within the section      Case Information          Case Origination Date/Time
	Information is present within the section      Case Information          Case Origin
	Information is present within the section      Case Information          Priority

	Information is present within the section      Contact Information       Contact Name
	Information is present within the section      Contact Information       Web Email
	Information is present within the section      Contact Information       Description
	Information is present within the section      Contact Information       Deny List
	Information is present within the section      Contact Information       Subject

	Information is present within the section      Consent       Date ID Requested
	Information is present within the section      Consent       Date ID Received
	Information is present within the section      Consent       ID Valid?
	Information is present within the section      Consent       ID Receipt Target
	Information is present within the section      Consent      Primary Form of ID
	Information is present within the section      Consent      Secondary Form of ID
	Information is present within the section      Consent      Proof Required?
	Information is present within the section      Consent      Proof Received Date
	Information is present within the section      Consent      Third Party Contacting?
	Information is present within the section      Consent      Name of affected person
	Information is present within the section      Consent      All Consent Obtained
	Information is present within the section      Consent      Relationship to person contacting

	Information is present within the section      Approvals          Name of Approver
	Information is present within the section      Approvals          Grade of Approver
	Information is present within the section      Approvals          Date of Approval
	Information is present within the section      Approvals          Comments / Notes


	Information is present within the section      Outcome          Outcome
	Information is present within the section      Outcome          Exemptions
	Information is present within the section      Outcome          Are Protected Characteristics Involved?
	Information is present within the section      Outcome          Protected Characteristics in Request
	Information is present within the section      Outcome          Information Published
	Information is present within the section      Outcome          Not A Genuine Case

	Information is present within the section      Live Issues               Live Issue

	Page should contain                             Milestones
	Page should contain                             Post
	Page should contain                             Email
	Page should contain                             Comment
	Page should contain                             Knowledge

Information Rights - Consent Requirements
    [Tags]  TTCS20-4412

    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  3s

	Information is present within the section      Consent       Date ID Requested
	Information is present within the section      Consent       ID Receipt Target
	Information is present within the section      Consent       Date ID Received

    Click Edit
    Sleep  2s

    Click Drop Down By Name    ID Valid?
    Select Dropdown Option     Yes
    Click Drop Down By Name    ID Valid?
    Select Dropdown Option     No

    Sleep       3s

    Click Element              ${birth-certificate-form-id}
    Click Element              ${move-chosen-right}
    click element              ${driving-licence-form-id}
    Click Element              ${move-chosen-right}
    Click Element              ${driving-licence-form-id}
    Click Element              ${move-chosen-right}
    Click Element              ${eea-identity-identity-card}
    Click Element              ${move-chosen-right}
    Click Element              ${national-identity-card}
    Click Element              ${move-chosen-right}
    Click Element              ${passport}
    Click Element              ${move-chosen-right}
    Click Element              ${residence-permit}
    Click Element              ${move-chosen-right}
    Click Element              ${residence-permit}
    Click Element              ${move-chosen-right}

    Sleep   3s
    Click Drop Down By Name    Third Party Contacting?
    Select Drop down option     Yes     2

    Click Drop Down By Name    All Consent Obtained
    Select Drop down option     Yes     3

    Click Drop Down By Name    All Consent Obtained
    Select Drop down option     No     3

    Sleep   3s
    Click Drop Down By Name    Secondary Form of ID
    Select Dropdown Option     Bank Statement
    Click Drop Down By Name    Secondary Form of ID
    Select Dropdown Option     Local Authority Council Tax Bill
    Click Drop Down By Name    Secondary Form of ID
    Select Dropdown Option     Mortgage Statement
    Click Drop Down By Name    Secondary Form of ID
    Select Dropdown Option     Solicitors Letter
    Click Drop Down By Name    Secondary Form of ID
    Select Dropdown Option     Tenancy Agreement
    Click Drop Down By Name    Secondary Form of ID
    Select Dropdown Option     Utility Bill

    Sleep   3s
    Click Drop Down By Name    Relationship to person contacting
    Select Dropdown Option     Clinical Professional
    Click Drop Down By Name    Relationship to person contacting
    Select Dropdown Option     Executor
    Click Drop Down By Name    Relationship to person contacting
    Select Dropdown Option     Immediate Family
    Click Drop Down By Name    Relationship to person contacting
    Select Dropdown Option     Police
    Click Drop Down By Name    Relationship to person contacting
    Select Dropdown Option     Other

    Sleep   3s
    Click Drop Down By Name    Proof Required?
    Select Dropdown Option     Copy of Will
    Click Drop Down By Name    Proof Required?
    Select Dropdown Option     Grant of Probate
    Click Drop Down By Name    Proof Required?
    Select Dropdown Option     Letter of Administration


    Click Drop Down By Name    Case type
    Select Dropdown Option     Freedom of Information


    Sleep   3s
    Click Save

Information Rights - Approvals
    [Tags]  TTCS20-4900-1

    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  3s
	page should contain  Primary Form of ID
	page should contain  ID Valid?
    Click Edit
    Sleep  3s
    Click Drop Down By Name     Case type
    Select Drop down option     Coroners Requests
    Click Drop Down By Name     ID Valid?
    Sleep  3s
    Populate Fields From ID valid Picklist   ID Valid?
    Click Drop Down By Name     Outcome
    Sleep  3s
    Populate Fields From Outcome Picklist    Outcome
    Sleep  3s
