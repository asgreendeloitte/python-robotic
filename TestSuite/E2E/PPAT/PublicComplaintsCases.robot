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

${contact}                                          (//*[contains(text(),'test')])[3]
${status}           (//a[@class= 'select'])[1]
${newpicklistvalue}                                 //lightning-base-combobox-item[@data-value='New']

*** Test Cases ***

Custom Case ID Number - Public Complaints
    [Tags]  TTCS20-4369-01
    Go To Salesforce login
    Login as PPAT Public Complaints team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Public Complaints type
    Sleep   3s
    ${case-number}=     Get Text      (//lightning-formatted-text)[1]
    Page Should Contain      ${case-number}

Public Complaints - Case Reopen
    [Tags]  TTCS20-4378-01    TTCS20-5719-01

    Go To Salesforce login
    Login as PPAT Public Complaints team member
    Reset View (if applicable)
    Go To Cases Tab
    Sleep  3s
	PPAT QA agent creates a case Public Complaints type
	Sleep  3s
    Page Should Not Contain    Contribution Case
	Click Edit
	Click Drop Down By Name         Case type
    Select Drop down option         Appeal
    Click Drop Down By Name         ExCo Group
    Select Drop down option         People
    Click Drop Down By Name         Category
    Click Element                   //lightning-base-combobox-item[@data-value= 'Commercial']
    Click Drop Down By Name         Subcategory
    Click Element                   //lightning-base-combobox-item[@data-value= 'Contracts']
    Click Drop Down By Name         Status
    Select Drop down option         Closed
    Input Text                      //input[@name= 'SuppliedEmail']    test@gmail.com
    Click Drop Down By Name         Outcome
    Select Drop down option         Upheld
    Click Save
	Sleep  3s

    Click Edit
    Click Drop Down By Name         Status
    Select Drop down option         Review
	Sleep  3s
	Click Save
	Page should contain     Unable to reopen a closed case

#Public Complaints - Case Reopen
#    [Tags]  TTCS20-4378-02
#
#    Go To Salesforce login
#    Login as PPAT Public Complaints team member
#    Reset View (if applicable)
#    Go To Cases Tab
#    Sleep  3s
#	PPAT QA agent creates a case Public Complaints type
#	Sleep  3s
#
#	Click Edit
#	Click Drop Down By Name         Status
#    Select Drop down option         Review
#	Click Save
#	Sleep  3s
#	Page should contain     Unable to assign review status


Public Complaints - Case Status
    [Tags]  TTCS20-4376-01

    Go To Salesforce login
    Login as PPAT Public Complaints team member
    Reset View (if applicable)
    Go To Cases Tab
    Sleep  3s
	PPAT QA agent creates a case Public Complaints type
	Sleep  3s

	Click Edit
	Click Drop Down By Name         Status
    Select Drop down option         Awaiting Information (Internal)
    Click Drop Down By Name         Status
    Select Drop down option         Awaiting Information (External)
    Click Drop Down By Name         Status
    Select Drop down option         Clearance
    Click Drop Down By Name         Status
    Select Drop down option         On Hold
    Click Drop Down By Name         Status
    Select Drop down option         Draft
    Click Save
    Sleep   3s

    Click Edit
    Click Drop Down By Name         Status
    click element   ${newpicklistvalue}
    Sleep   1s
    Click Save
    Page should contain             Unable to set the case status to new, please select another status from the options provided

#Public Complaints - Origin Demographic
#    [Tags]  TTCS20-4376-02
#
#    Go To Salesforce login
#    Login as PPAT Public Complaints team member
#    Reset View (if applicable)
#    Go To Cases Tab
#    Sleep  3s
#	PPAT QA agent creates a case Public Complaints type
#	Sleep  3s
#
#    Click Edit
#    Click Drop Down By Name         Origin Demographics
#    Select Drop down option         Citizen
#    Click Drop Down By Name         Origin Demographics
#    Select Drop down option         DHSC
#    Click Drop Down By Name         Origin Demographics
#    Select Drop down option         Local Authority
#    Click Drop Down By Name         Origin Demographics
#    Select Drop down option         MP
#    Click Drop Down By Name         Origin Demographics
#    Select Drop down option         Chief Executive Office
#    Click Save

Public Complaints - Accessibility Markers
    [Tags]  TTCS20-4376-03

    Go To Salesforce login
    Login as PPAT Public Complaints team member
    Reset View (if applicable)
    Go To Cases Tab
    Sleep  3s
	PPAT QA agent creates a case Public Complaints type
	Sleep  3s

	Click Edit
    Click Drop Down By Name         Accessibility Marker
    Select Drop down option         Cognitive impairment
    Click Drop Down By Name        Accessibility Marker
    Select Drop down option         Hearing impairment
    Click Drop Down By Name         Accessibility Marker
    Select Drop down option         Motor impairment
    Click Drop Down By Name         Accessibility Marker
    Select Drop down option         Visual impairment
    Sleep   3s
    Page should contain element         ${accessibility-note}
#    Input text      ${accessibility-note}   automation testing
    Sleep   2s
    Click Save
    Wait Until Page Contains   was saved

PPAT - Public Teams Restricted Cases
    [Tags]  TTCS20-4375

    Go To Salesforce login
    Login as PPAT Public Complaints team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Public Complaints type
    Sleep   2s

    Check the restricted Case edit button
    Sleep   2s
    Execute javascript  window.scrollTo(0,300)
    Check the restricted Case check box

    Sleep   3s
    Save the edited account


#Public Complaints - outcome
#    [Tags]  TTCS20-4900
#
#    Go To Salesforce login
#    Login as PPAT Public Complaints team member
#    Reset View (if applicable)
#    Go To Cases Tab
#    Sleep  3s
#	#PPAT QA agent creates a case Public Complaints type without account
#	PPAT QA agent creates a case Public Complaints type without account
#	page should contain  Passed To
#	Sleep  3s
#	Click Edit
#	click element   ${status}
#	Sleep  3s
#	Execute javascript  window.scrollTo(0,1200)
#    Sleep  5s
#    Click Drop Down By Name     Passed To
#    Sleep  2s
#	Populate Fields From Passedto Picklist  Passed To
#
#	Click Element                   ${account-name-lookup}
#
#    Click Element                   ${account-name-lookup-first-option}
#
#	Sleep  3s
#	Click Save
#	Sleep  4s
#	page should contain element     ${contact}

PPAT - Quick Actions - Case Quick Actions - Complaints Agent
    [Tags]  TTCS20-4899-01

    Go To Salesforce login
    Login as PPAT Public Complaints team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Public Complaints type
    Sleep   2s

	Page should contain      Follow
	Page should contain      Edit
	Page should contain      Change Owner

	Sleep   2s
	Click Related Tab
	Sleep   2s
	Page should not contain element     //span[text()="Quick Action"]

#PPAT - Case Related List
#    [Tags]  TTCS20-5176-01
#
#    Go To Salesforce login
#    Login as PPAT Public Complaints team member
#    Reset View (if applicable)
#    Go To Cases Tab
#	Sleep  3s
#	PPAT QA agent creates a case Public Complaints type
#    Sleep   15s
#
#	Page should contain      Follow
#	Page should contain      Edit
#	Page should contain      Change Owner
#	PPAT Agent creates a contribution case from a Case Record
#	Click Related Tab
#	Sleep  2s
#
#	Page should contain      Case Number
#	Page should contain      Account
#	Page should contain      Contact
#	Page should contain      Subject
#	Page should contain      Status
#	Page should contain      Category
#	Page should contain      Subcategory
#	Page should contain      Date Opened
#	Page should contain      Internal Deadline
#	Page should contain      Owner