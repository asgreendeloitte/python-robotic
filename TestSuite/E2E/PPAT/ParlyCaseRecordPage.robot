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

PPAT - Parly - Chatter Actions (Email, Post, Comments)

    [Tags]  TTCS20-4205

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT Parliamentary agent creates a case
	Sleep  5s
	Execute javascript  window.scrollTo(0,500)
	Sleep  2s
    Click the email tab
    Sleep  2s
    Page should contain element     ${from-email-content}
  #  Page should contain element     ${to-email-content}
    Sleep  3s
    Click the post tab
    Sleep  2s
    Execute javascript  window.scrollTo(0,1200)
    #Click Element       //div[@data-placeholder="Share an update..."]
    Input Text       //div[@data-placeholder="Share an update..."]    automation testing
    Sleep  3s
    Execute javascript  window.scrollTo(0,1500)
    Sleep  3s
    PRESS KEYS  None   CTRL+ENTER
    Execute javascript  window.scrollTo(0,900)
    Click the Comment tab
    Sleep  3s
    Input text      ${comment-text-box}   Automation testing
    Sleep   3s
    #Save the Comment

PPAT - Parly - Case details update

    [Tags]  TTCS20-4993   TTCS20-5330

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT Parliamentary agent creates a case
	Page should contain element    ${information-section}
	Page should not contain element     ${pq-section}
	Page should contain         Question
	#Page should not contain     Parliamentary Question
	Sleep  5s
    Click Edit
    Sleep   3s
    Input text      ${pq-po-number-parli-form}   123456789
    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Watching brief
    Click Drop Down By Name         Case type
    Select Drop down option         PQ Admin
    Click Drop Down By Name         Case type
    Select Drop down option         Miscellaneous
    Sleep  3s
    Click Save

PPAT - Quick Actions - Case Quick Actions - Parliamentary agent
    [Tags]  TTCS20-4899-01

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT Parliamentary agent creates a case
	Sleep  3s

	Page should contain      Follow
	Page should contain      Edit
	Page should contain      Change Owner

	Sleep   2s
	Click Related Tab
	Sleep   2s
	Page should not contain element     //span[text()="Quick Action"]

#PPAT Parly - Not genuine case validation
#
#    [Tags]  TTCS20-5047
#    Go To Salesforce login
#    Login as PPAT Parliamentary rights team member
#    Reset View (if applicable)
#    Go To Cases Tab
#	Sleep  3s
#	PPAT Parliamentary agent creates a case
#	Sleep  3s
#
#	Click Edit
#	Click Drop Down By Name    Status
#    Select Dropdown Option     Closed
#    Click Drop Down By Name    Not A Genuine Case
#    Select Dropdown Option     Yes
#    Scroll Element Into View    //label[text()='Not a Genuine Case Reason']/following::lightning-base-combobox
##    Click Element    //button[@aria-label='Not a Genuine Case Reason, --None--']
#    Click Element    //label[text()='Not a Genuine Case Reason']/following::lightning-base-combobox
##    Click Drop Down By Name    Not a Genuine Case Reason
#    Select Dropdown Option     Test case
#
#    Click Save
#    Sleep    3s
#    Page Should Not Contain Element    //li[contains(text(),'Ensure all required fields are populated before closing the Case')]
#
