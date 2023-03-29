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
Resource    ../../../Resources/EnquiriesConsole/GlobalButtons.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***

Information Rights Case Reopen
    [Tags]  TTCS20-4196-01     TTCS20-5719-01
    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  3s
    Page Should Not Contain    Contribution Case
	Click Edit
    Click Drop Down By Name    Status
    Select Dropdown Option     Closed
    Click Drop Down By Name         Case type
    Select Drop down option         Coroners Requests
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
    Select Drop down option         Not applicable
    Click Drop Down By Name         Disclosure Position
    Select Drop down option         Information Released
    Click Element                   //button[@aria-label= 'Information Published, --None--']
    Select Drop down option         Yes
    Click Save
    Sleep    10s
    Click Edit
    Click Drop Down By Name    Status
    Select Dropdown Option     Draft
    Sleep  3s
    Click Save
    Sleep  2s
    Page should contain  Unable to reopen a closed case

#Information Rights Case Reopen - Status Reassignment
#    [Tags]  TTCS20-4196-04
#    Go To Salesforce login
#    Login as PPAT Information rights team member
#    Reset View (if applicable)
#    Go To Cases Tab
#	Sleep  3s
#	PPAT QA agent creates a case Information Rights type
#	Sleep  3s
#
#    Click Element              //button[@name='Edit']
#    Click Drop Down By Name    Status
#    Select Dropdown Option     Draft
#    Sleep  3s
#    Click Save
#    Sleep  2s
#
##    Click Edit
#    Click Element              //button[@name='Edit']
#	Click Drop Down By Name         Status
#    Select Drop down option         Review
#	Click Save
#	Sleep  3s
#	Page should contain     Unable to assign review status


Custom Case ID Number - Information Rights
    [Tags]  TTCS20-4369-03
    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
    Sleep   3s
     ${case-number}=     Get Text      (//lightning-formatted-text)[1]
     ${IRcase-number}=     Catenate    SEPARATOR=  IR   ${case-number}
#     Page Should Contain      ${IRcase-number}
     Page Should Contain      ${case-number}


#Information Rights - Approvals
#    [Tags]  TTCS20-4411
#
#    Go To Salesforce login
#    Login as PPAT Information rights team member
#    Reset View (if applicable)
#    Go To Cases Tab
#	Sleep  3s
#	PPAT QA agent creates a case Information Rights type
#	Sleep  3s
#    Click Element              //button[@name='Edit']
#    Sleep  3s
#    Page should contain         Name of Approver
#    Input Text      ${search-approver}    test
#    Sleep  2s
#    Click element       (//ul[@role='group']//li[@class='slds-listbox__item'])[1]
#    Page should contain  Grade of Approver
#    Sleep  2s
#    Click Drop Down By Name    Grade of Approver
#    Select Dropdown Option     G6
#    Click Drop Down By Name    Grade of Approver
#    Select Dropdown Option     G7
#    Click Drop Down By Name    Grade of Approver
#    Select Dropdown Option     Deputy Director
#    Click Drop Down By Name    Grade of Approver
#    Select Dropdown Option     Director
#    Click Drop Down By Name    Grade of Approver
#    Select Dropdown Option     Director General
#    Click Drop Down By Name    Grade of Approver
#    Select Dropdown Option     Chief Exec
#    Sleep   3s
#    Page should contain     Date of Approval
#    Input Text              ${approval-date-field}      12/01/2023
##    Click element           ${approval-date-field}
##    Click Element           ${approval-date-picker}
#
#    Page should contain     Comments / Notes
##    Input text      ${comments-text-box}    Automation testing
#
#    Sleep   3s
#    Click Save
#    Page should contain     was saved

Sharing Rules for information Rights Cases -Visibility
    [Tags]  TTCS20-4404 -1-2
    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  3s
    ${case-number}=     Get Text      (//lightning-formatted-text)[1]
    Logout of Salesforce
    Sleep   3s

    Go To Salesforce login
    Login as PPAT Public Complaints team member
    Sleep   3s
    Click Element   ${global-search}
    sleep   4s
    Execute Javascript  document.evaluate("//div/button[@aria-label='Search']", document.body, null, 9 , null).singleNodeValue.click();
    sleep   3s
    Wait Until Element Is Visible    (//lightning-input//input[@type='search'])[last()]
    Input Text      (//lightning-input//input[@type='search'])[last()]   ${case-number}
    sleep   3s
    PRESS KEYS  None   ENTER
    sleep  5s
    Page should contain     Don't give up yet!
    Page should contain     We searched the objects you use most and didn't find any matches for
    Page should contain     ${case-number}


Sharing Rules for information Rights Cases - DSAR
    [Tags]  TTCS20-4404-3
    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  3s
	${case-number}=     Get Text      (//lightning-formatted-text)[1]
	Click Related Tab
	Sleep  2s
	Click Case Team section
    Select the add member

  	 Input text      ${search-box}      SameeraPurini PPATPublicComplaintsUAT
	Press Keys       ${search-box}      ENTER
	Click Element       //div[@role='dialog']//a[@data-refid="recordId"]
	Sleep   3s

	Click Element       //button[@name="save"]
    Sleep  3s
    Page should contain element   (//span[text()="Read Only"])[2]
    Click element       (//a[contains(@href,'/lightning/r/Case/')])[2]
    Sleep   3s
	Click Edit
    Click Drop Down By Name              Case type
    Select Dropdown Option      Data Subject Access Requests
    Click Save
    Sleep   3s
    Logout of Salesforce
    Sleep   3s

    Go To Salesforce login
    Login as PPAT Public Enquiries team member
    Sleep   3s
    Wait until keyword succeeds   12s      2s       Click Element   ${global-search}
    sleep   3s
    Execute Javascript  document.evaluate("//div/button[@aria-label='Search']", document.body, null, 9 , null).singleNodeValue.click();
    sleep   3s
    Wait Until Element Is Visible    (//lightning-input//input[@type='search'])[last()]
    Input Text      (//lightning-input//input[@type='search'])[last()]   ${case-number}
    sleep   3s
    PRESS KEYS  None   ENTER
    sleep  6s
    Page Should Contain    Don't give up yet!
    Page Should Contain    We searched the objects you use most and didn't find any matches fo
    Capture Page Screenshot

Sharing Rules for information Rights Cases - PPAT teams
    [Tags]  TTCS20-4404-4
    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
    Sleep  3s
    PPAT QA agent creates a case Information Rights type
    Sleep  3s
    ${case-number}=     Get Text      //span[@class='title slds-truncate']
#    ${case-number}=     Get Text      (//lightning-formatted-text)[1]
    Click Edit
    Click Element       //button[@aria-label='Case type, --None--']
    Select Dropdown Option      Access to Health Records
    Click Save
    Sleep   6s

    Logout of Salesforce

    Sleep   30s
    Go To Salesforce login
    Login as PPAT Public Enquiries team member
    Sleep   4s
    Wait Until Element Is Visible    ${global-search}
    Click Element   ${global-search}
    sleep   3s
    Execute Javascript  document.evaluate("//div/button[@aria-label='Search']", document.body, null, 9 , null).singleNodeValue.click();
    sleep   3s
    Wait Until Element Is Visible    (//lightning-input//input[@type='search'])[last()]
    Input Text      (//lightning-input//input[@type='search'])[last()]   ${case-number}
    sleep   3s
    Wait Until Element Is Visible    //span[@title='${case-number}']
    PRESS KEYS  None   ENTER
    sleep  5s
    Click Element   //a[text()='${case-number}']
    sleep  5s
    Click Element       (//button[@name='Edit'])[last()]
    Click Drop Down By Name              Case type
	Select Dropdown Option               GDPR
    Click Save
    Page should contain     Review the errors on this page.
    Page Should Contain     Oops...you don't have the necessary privileges to edit this record. See your administrator for help.


Sharing Rules for information Rights Cases - Pubic Group
    [Tags]  TTCS20-4404-5
    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	${case-number}=     Get Text      (//lightning-formatted-text)[1]
    Click Edit
    Click Drop Down By Name              Case type
    Select Dropdown Option      Access to Health Records
    Click Save
    Sleep  5s
    Open cases tab and select list view
    Click Element   ${Information-Rights-Reviewer-queue}
    Page Should Contain     Information Rights Reviewer


Sharing Rules for information Rights Cases - Reporting Team Case Acess
    [Tags]  TTCS20-4404-6
    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  4s
	${case-number}=     Get Text      //span[@class='title slds-truncate']
#	${case-number}=     Get Text      (//lightning-formatted-text)[1]
    Logout of Salesforce

    Sleep    5s
    Go To Salesforce login
    Login as PPAT Reporting Team Agent
    Reset View (if applicable)
    Sleep   3s
    Click Element   ${global-search}
    sleep   3s
    Execute Javascript  document.evaluate("//div/button[@aria-label='Search']", document.body, null, 9 , null).singleNodeValue.click();
    sleep   5s
    Wait Until Element Is Visible    (//lightning-input//input[@type='search'])[last()]
    Input Text      (//lightning-input//input[@type='search'])[last()]   ${case-number}
    sleep   5s
    PRESS KEYS  None   ENTER
    sleep  5s
    Click Element   //a[text()='${case-number}']
    sleep  5s
    Page Should Not Contain Button      (//button[@name='Edit'])[1]

PPAT - Quick Actions - Case Quick Actions - Information Right Agent
    [Tags]  TTCS20-4899-01

    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  3s

	Page should contain      Follow
	Page should contain      Edit
	Page should contain      Change Owner

	Sleep   2s
	Click Related Tab
	Sleep   2s
	Page should not contain element     //span[text()="Quick Action"]

PPAT - Case Type and Disclosure Position - Information Right Agent
    [Tags]  TTCS20-5942

    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  5s
	 Click Edit
    Click Drop Down By Name              Case type
    Select Dropdown Option               GDPR
    Click Drop Down By Name              Disclosure Position
    Select Dropdown Option               Not applicable
    Sleep  3s
    Click Save
    Sleep  5s



PPAT - IR case sharing for DSARS
    [Tags]  TTCS20-5728

    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates an Information Rights case with DSAR case type
	Sleep  5s

#    ${case-number}=     Get Text      (//lightning-formatted-text)[1]
    ${case-number}=     Get Text      //span[@class='title slds-truncate']
    Logout of Salesforce

    Sleep    5s
    Go To Salesforce login
    Login as PPAT Information rights super user
    Sleep   2s
    Reset View (if applicable)
    Click Element   ${global-search}
    sleep   3s
    Execute Javascript  document.evaluate("//div/button[@aria-label='Search']", document.body, null, 9 , null).singleNodeValue.click();
    sleep   5s
    Wait Until Element Is Visible    (//lightning-input//input[@type='search'])[last()]
    Input Text      (//lightning-input//input[@type='search'])[last()]   ${case-number}
    sleep   5s
    PRESS KEYS  None   ENTER
    sleep  5s
    Click Element   //a[text()='${case-number}']
    sleep  5s
    Click Edit
    Click Drop Down By Name              Case type
	Select Dropdown Option               GDPR
    Click Save

    Page Should Contain    Oops...you don't have the necessary privileges to edit this record. See your administrator for help.