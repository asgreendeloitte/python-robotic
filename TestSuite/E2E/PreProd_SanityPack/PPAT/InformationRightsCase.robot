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
#
#
#Custom Case ID Number - Information Rights
#    [Tags]  TTCS20-4369-03
#    Go To Salesforce login
#    Login as PPAT Information rights team member
#    Reset View (if applicable)
#    Go To Cases Tab
#	Sleep  3s
#	PPAT QA agent creates a case Information Rights type
#    Sleep   3s
#     ${case-number}=     Get Text      (//lightning-formatted-text)[1]
#     ${IRcase-number}=     Catenate    SEPARATOR=  IR   ${case-number}
##     Page Should Contain      ${IRcase-number}
#     Page Should Contain      ${case-number}


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