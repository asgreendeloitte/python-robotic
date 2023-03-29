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

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Variable ***
${Public-enquires-contribution-queue}       //span[contains(text(), 'Public Enquiries Contribution Cases')]/../../a
${parliamentary-contribution-queue}        //span[contains(text(), 'Parliamentary Contribution Cases')]/../../a
${information-rights-contribution-queue}   //span[contains(text(), 'Information Rights Contribution Cases')]/../../a
${complaints-contribution-queue}       //span[contains(text(), 'Public Complaints Contribution Case')]/../../a
${list-views-menue}             //button[@title='Select a List View']
${app_launcher}          //*[@class='slds-icon-waffle']
${app_launcher_search}   //*[@class='slds-input' and @placeholder='Search apps and items...']

*** Test Cases ***

Public Enquiries Contribution Activity
    [Tags]  TTCS20-5801-01
    Go To Salesforce login
    Login as PPAT Public Enquiries team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT Enquiries agent creates a case
	Sleep  5s
    Page should contain         Case Number
    Page Should Contain Element    //span[@title='Activities']
    Agent creates a Contribution Activity
    Page Should Contain       Subject
    Page Should Contain       Contact Name
    Page Should Contain       Due Date
    Page Should Contain       Contribution Received
    Page Should Contain       Filters: All time
    Page Should Contain       All activities
    Page Should Contain       All types
    Page Should Contain       Upcoming & Overdue
    Page Should Contain Element    (//span[@class='view-all-label'])[2]
    Click Element                  (//span[@class='view-all-label'])[2]
    Sleep  3s
    Page Should Contain       Subject
    Page Should Contain       Contact Name
    Page Should Contain       Due Date
    Page Should Contain       Contribution Received
    Page Should Contain       Contribution Requested
    Page Should Contain       Contribution Violation


Information Rights Contribution Activity
    [Tags]  TTCS20-5801-02
    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates an Information Rights case with DSAR case type
#	PPAT QA agent creates a case Information Rights type
	Sleep  3s
    Page should contain         Case Number
    Page Should Contain Element    //span[@title='Activities']
    Agent creates a Contribution Activity
    Page Should Contain       Subject
    Page Should Contain       Contact Name
    Page Should Contain       Due Date
    Page Should Contain       Contribution Received
    Page Should Contain       Filters: All time
    Page Should Contain       All activities
    Page Should Contain       All types
    Page Should Contain       Upcoming & Overdue
    Page Should Contain Element    (//span[@class='view-all-label'])[2]
    Click Element                  (//span[@class='view-all-label'])[2]
    Sleep  3s
    Page Should Contain       Subject
    Page Should Contain       Contact Name
    Page Should Contain       Due Date
    Page Should Contain       Contribution Received
    Page Should Contain       Contribution Requested
    Page Should Contain       Contribution Violation


Public Enquiries Contribution Layout
    [Tags]  TTCS20-5801-05
    Go To Salesforce login
    Login as PPAT Public Enquiries team member
    Reset View (if applicable)
    Click Element   ${app_launcher}
        Sleep  4S
        Click Element   ${app_launcher_search}
        Sleep  2s
        input text   ${app_launcher_search}   Tasks
        Sleep  2s
        Click Element   //b[text()='Tasks']
        Sleep  3s
        Click Element   (//a[@title='Call'])[1]
        Sleep  3s
        Page Should Contain       Detail
        Page Should Contain       Contact Name
        Page Should Contain       Subject
        Page Should Contain       Contribution Requested
        Page Should Contain       Due Date
        Page Should Contain       Contribution Received
        Page Should Contain       Contribution Violation
        Page Should Contain       Comments
        Page Should Contain       Not applicable
        Page Should Contain       Priority
        Page Should Contain       Status
        Page Should Contain       Assigned to
        Page Should Contain       Related To
        Page Should Contain       Name

Information Rights Contribution Layout
    [Tags]  TTCS20-5801-06
    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Click Element   ${app_launcher}
        Sleep  4S
        Click Element   ${app_launcher_search}
        Sleep  2s
        input text   ${app_launcher_search}   Tasks
        Sleep  2s
        Click Element   //b[text()='Tasks']
        Sleep  3s
        Click Element   (//a[@title='Call'])[1]
        Sleep  3s
        Page Should Contain       Detail
        Page Should Contain       Contact Name
        Page Should Contain       Subject
        Page Should Contain       Contribution Requested
        Page Should Contain       Due Date
        Page Should Contain       Contribution Received
        Page Should Contain       Contribution Violation
        Page Should Contain       Comments
        Page Should Contain       Not applicable
        Page Should Contain       Priority
        Page Should Contain       Status
        Page Should Contain       Assigned to
        Page Should Contain       Related To
        Page Should Contain       Name
