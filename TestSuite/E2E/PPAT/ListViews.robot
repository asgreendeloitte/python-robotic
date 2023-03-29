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

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Test Cases ***

PPAT Users - New Triage Case Lists - PPAT Public Enquiries Super User
    [Tags]  TTCS20-5005    TTCS20-5746-01-02

    Go To Salesforce login
    Login as PPAT Enquiries Super User
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element       ${public-enq-review-list-view}
    Sleep   5s
    click Element       ${fliter-icon}
    Sleep   3s

    Page should contain     Filters
    Page should contain     Locked Filters
    Page should contain     Filter by Owner   Public Enquiries
    Page should contain     Case Record Type   equals
    Page should contain     equals  PPAT Public Enquiries
    Page should contain     Status   not equal
    Page should contain     to  New

    Open cases tab and select list view
    Click Element       ${public-enq-triage-list-view}
    Sleep   5s
    click Element       ${fliter-icon}
    Sleep   3s
        Page should contain     Locked Filters
    Page should contain     Filter by Owner   Public Enquiries
    Page should contain     Case Record Type   equals
    Page should contain     equals  PPAT Public Enquiries
    Page should contain     Status
    Page should contain     equals        New, Transferred


PPAT Users - Remove visibility of custom status field - PPAT Informations Rights User
    [Tags]  TTCS20-5005   TTCS20-5830

    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element       ${public-info-list-view}
    Sleep   5s
    click Element       ${fliter-icon}
    Sleep   3s

    Page should contain     Filters
    Page should contain     Locked Filters
    Page should contain     Filter by Owner
    Page should contain     All cases
    Page should contain     Case Record Type
    Page should contain     equals
    Page should contain     PPAT Information Rights
    Page should contain     Status
    Page should contain     not equal to
    Page should contain     New, Closed
    Page should contain     Case Owner   not equal to
    Page should contain     Information_Rights_Reviewer


PPAT Users - Remove visibility of custom status field - PPAT Public Complaints User
    [Tags]  TTCS20-5005    TTCS20-5830

    Go To Salesforce login
    Login as PPAT Public Complaints team member
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element       ${public-complaints-list-view}
    Sleep   5s
    click Element       ${fliter-icon}
    Sleep   3s

    Page should contain     Filters
    Page should contain     Locked Filters
    Page should contain     Filter by Owner
    Page should contain     All cases
    Page should contain     Case Record Type
    Page should contain     equals
    Page should contain     PPAT Public Complaints
    Page should contain     Status
    Page should contain     not equal to
    Page should contain     New, Closed
    Page should contain     Case Owner   not equal to
    Page should contain     Public_Complaints_Reviewer

PPAT Users - Remove visibility of custom status field - PPAT Public Enquiries User
    [Tags]   TTCS20-5830

    Go To Salesforce login
    Login as PPAT Public Enquiries team member
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element       ${public-enq-list-view}
    Sleep   5s
    click Element       ${fliter-icon}
    Sleep   3s

    Page should contain     Filters
    Page should contain     Locked Filters
    Page should contain     Filter by Owner
    Page should contain     Public Enquiries
    Page should contain     Case Record Type
    Page should contain     equals
    Page should contain     PPAT Public Enquiries
    Page should contain     Status
    Page should contain     not equal to
    Page should contain     New, Closed

PPAT Users - Remove visibility of custom status field - PPAT Parliamentary Review User
    [Tags]  TTCS20-5005

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element       ${PPAT-Parly-reviewer}
    Sleep   5s
    click Element       ${fliter-icon}
    Sleep   3s

    Page should contain     Filters
    Page should contain     Locked Filters
    Page should contain     Filter by Owner
    Page should contain     Case Record Type
    Page should contain     equals
    Page should contain     PPAT Parliamentary Review
    Page should contain     Status
    Page should contain     not equal to
    Page should contain     Closed

PPAT Superusers - Create edit share listivews
    [Tags]  TTCS20-5240

   Go To Salesforce login
    Login as PPAT Enquiries Super User
    Reset View (if applicable)
    Open cases tab and select list view
    Superuser creates new list view
    Superuser renames list view
    Page should contain     Edit list view name

PPAT - Grant Parly access to MP Trace
    [Tags]  TTCS20-5337-01    TTCS20-5351-04

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element       ${mp-trace-list-view}
    Sleep   3s
    click Element       ${fliter-icon}
    Sleep   3s
    Page should contain     Filters
    Page should contain     Locked Filters
    Page should contain     Filter by Owner    MP Trace
    Page should contain     Case Origin        equals MP Trace Mailbox
    click Element       ${close-list-filter}
    Click Element       ${first-list-option}
    Sleep   3s
    Page should contain     Case Owner    MP Trace
    Page should contain     Case Record Type      Complaints and Enquiries(Trace)
    Page should contain     Account Name
    Page should contain     Case Number
    Page should contain     Parent Case
    Page should contain     Priority
    Page should contain     Origin Demographics
    Page should contain     CTAS number
    Page should contain     Vaccination Status
    Page should contain     Not A Genuine Case
    Page should contain     Case Theme
    Page should contain     Status
    Page should contain     Case Origin
    Page should contain     Call Logger ID
    Page should contain     Case type
    Page should contain     Priority Reasons
    Page should contain     Category
    Page should contain     Subcategory
    Page should contain     Assign Trace Case
    Page should contain     Auto-Acknowledgement Date
    Page should contain     Case Topic
    Page should contain     Country status
    Page should contain     Date Of Arrival Not Applicable
    Page should contain     Country Travelling To
    Page should contain     Quarantine Hotel Name
    Page should contain     Travel Date to UK
    Page should contain     Country Travelling From
    Page should contain     Quarantine Hotel Location
    Page should contain     Outcome
    Page should contain     Customer journey friction point
    Page should contain     Improvement to be actioned
    Page should contain     Reason for feedback
    Page should contain     Improvement action
    Page should contain     Third Party Contacting?
    Page should contain     Web Name of affected person
    Page should contain     Web Phone of affected person
    Page should contain     Relationship to person contacting
    Page should contain     Name of affected person
    Page should contain     Web Date of Birth
    Page should contain     All Consent Obtained
    Page should contain     Relationship description
    Page should contain     MP Case Reference
    Page should contain     Second Subcategory
    Page should contain     MP Case Status
    Page should contain     Third Subcategory
    Page should contain     Subject
    Page should contain     Description
    Page should contain     Content Filtered
    Page should contain     Potential Spam
    Page should contain     Live Issue
    Page should contain     Web Email
    Page should contain     Web Name
    Page should contain     Web Company
    Page should contain     Web Phone
    Page should contain     Created By
    Page should contain     Date/Time Opened
    Page should contain     Case Origination Date/Time
    Page should contain     Last Modified By
    Page should contain     Date/Time Closed
    Click the email tab
    Page should contain     From     Trace MP Mailbox

PPAT - Grant Parly access to MQS MP
    [Tags]  TTCS20-5351

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element       ${mqs-mp-enquiries-mailbox-list-view}
    Sleep   3s
    click Element       ${fliter-icon}
    Sleep   3s
    Page should contain     Case Owner    MP Trace
    Page should contain     Case Origin       MQS MP Enquiries Mailbox
    click Element       ${close-list-filter}
    Click Element       ${first-list-option}
    Sleep   3s
    Click the email tab
    Sleep   5s
    Parli user selects MQS MP trace mailbox from option

PPAT Users - New Triage Case Lists - Public Complaints
    [Tags]  TTCS20-5005    TTCS20-5746-03-05

    Go To Salesforce login
    Login as PPAT Public Complaints team member
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element       ${public-comp-triage-list-view}
    Sleep   5s
    click Element       ${fliter-icon}
    Sleep   3s

    Page should contain     Filters
    Page should contain     Locked Filters
    Page should contain     Filter by Owner    Public Complaints Reviewer
    Page should contain     Case Record Type   equals
    Page should contain     equals  PPAT Public Complaints
    Page should contain     Status    equals
    Page should contain     equals        New, Transferred

    Open cases tab and select list view
    Click Element       ${public-complaints-list-view}
    Sleep   5s
    click Element       ${fliter-icon}
    Sleep   3s
        Page should contain     Locked Filters
    Page should contain     Filter by Owner      All cases
    Page should contain     Case Record Type     equals
    Page should contain     equals               PPAT Public Complaints
    Page should contain     Status               not equal to
    Page should contain     not equal to         New

PPAT Users - New Triage Case Lists - Info Rights
    [Tags]  TTCS20-5005    TTCS20-5746-04-06

    Go To Salesforce login
    Login as PPAT Information rights super user
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element       ${info-rights-triage-list-view}
    Sleep   5s
    click Element       ${fliter-icon}
    Sleep   3s

    Page should contain     Filters
    Page should contain     Locked Filters
    Page should contain     Filter by Owner    Information Rights Reviewer
    Page should contain     Case Record Type   equals
    Page should contain     equals             PPAT Information Rights
    Page should contain     Status    equals
    Page should contain     equals        New, Transferred

    Open cases tab and select list view
    Click Element       ${public-info-list-view}
    Sleep   5s
    click Element       ${fliter-icon}
    Sleep   3s
        Page should contain     Locked Filters
    Page should contain     Filter by Owner      All cases
    Page should contain     Case Record Type     equals
    Page should contain     equals               PPAT Information Rights
    Page should contain     Status               not equal to
    Page should contain     not equal to         New
    Page should contain     Case Owner           not equal to
    Page should contain     not equal to         Information_Rights_Reviewer