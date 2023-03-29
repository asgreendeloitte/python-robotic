*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

#Logins
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot


Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/CaseView/webView.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/CaseView/RelatedTab.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CaseE2EoutboundsendingEmailonTracecase.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   Close Browser

*** Variables ***

${outcome_edit}     (//span[@class='test-id__field-value slds-form-element__static slds-grow '])[1]

*** Test Cases ***

Web Chat - Access to WebChat queue and Agent status
    [Tags]  TTCS20-4850-ac01-ac02

        Login as WebChat Case Management User
        Sleep       2s
        Click Omni Channel Offline tab
        Sleep       3s
        Click Omni Channel status view
        Sleep       5s
        Page should contain element     //li[@title='Online Status']
        Page should contain element     (//li[@title='Busy Status'])[1]
        Page should contain element     (//li[@title='Busy Status'])[2]
        Page should contain element     //li[@title='Offline Status']

Web Chat - List View
    [Tags]  TTCS20-4850-ac03

        Login as WebChat Case Management User
        Sleep   3s
        Navigate to the Chat Transcript object
        Sleep   2s
        Select the List View titled EFC WebChat
        Sleep       3s
        Page should contain     Chat Transcript Name
        Page should contain     Status
        Page should contain     Owner
        Page should contain     Outcome
        Page should contain     Request Time
        Page should contain     Start Time
        Page should contain     End Time
        Sleep   2s

Web Chat - Outcome (new field) and Sharing visibility of transcripts (Case Management/TL/QA)

    [Tags]  TTCS20-4850-ac04        TTCS20-4856-01

        Login as WebChat Case Management User
        Sleep   3s
        Navigate to the Chat Transcript object
        Sleep   2s
        Page should contain         Chat Transcript Name
        Page should contain         Chat Visitor
        Page should contain         Start Time
        Page should contain         End Time
        Page should contain         Status

        Sleep       5s
        Click Element       ${first-list-option}
        Sleep   5s
        Wait until keyword succeeds   12s      2s       Click Element   ${details-tab}
        Sleep   3s
        Click Outcome button
        Sleep   5s
        Page should contain         Successful
        Page should contain         Enquiry out of scope for 119
        Page should contain         Escalated to UKHSA Expert Team
        Page should contain         Escalated to UKHSA Complaints Team
        Page should contain         Escalated to UKHSA RIT Team
        Page should contain         Citizen disconnect
        Page should contain         Citizen timeout
        Page should contain         Agent disconnect
        Page should contain         Other

Web Chat - Updates to Case fields and values
    [Tags]  TTCS20-4855-01

        Login as WebChat Case Management User
        Sleep   3s
        Reset View (if applicable)
        Navigate to the Chat Transcript object
        Select the List View titled EFC WebChat
        Sleep   3s
        Click Element       ${request-time-column}
        Navigate to details tab in the case
        Page should contain element     ${case-origin-webchat}
        Page should contain         WebChat

Web Chat - Updates to Case fields and values
    [Tags]  TTCS20-4855-02     TTCS20-5385

        Login as WebChat Case Management User
        Sleep   3s
        Reset View (if applicable)
        Go To Cases Tab
	    Sleep  3s
        Create a Digital Helper case
        Sleep  3s
        Page should contain element     ${case-origin-digital-helper}
        Page should contain     Digital Helper
        Page Should Not Contain Button    Clone

Web Chat - Omni Supervisor
    [Tags]  TTCS20-4851

        Login as WebChat Case Management User
        Sleep   3s
        Navigate to the Omni Supervisor object
        Sleep   3s
        Page should contain             Agent Summary
        Page should contain             All Agents
        Select agents by queue
        Select queues by backlog
        Select assigned work

Web Chat - Sharing visibility of transcripts - Quality Assurance User

    [Tags]  TTCS20-4856-01

        Login as WebChat Quality Assurance User
        Sleep   3s
        Navigate to the Chat Transcript object
        Sleep   2s
        Page should contain         Chat Transcript Name
        Page should contain         Chat Visitor
        Page should contain         Start Time
        Page should contain         End Time
        Page should contain         Status

Web Chat - Sharing visibility of transcripts - Expert Team Agent Assurance User

    [Tags]  TTCS20-4856-01

        Login as WebChat expert team User
        Sleep   3s
        Navigate to the Chat Transcript object
        Sleep   2s
        Page should contain         Chat Transcript Name
        Page should contain         Chat Visitor
        Page should contain         Start Time
        Page should contain         End Time
        Page should contain         Status


Web Chat - Sharing visibility of transcripts - Complaints & MP Trace agent

    [Tags]  TTCS20-4856-01

        Login as WebChat MP Complaints test and trace User
        Reset View (if applicable)
        Sleep   3s
        Navigate to the Chat Transcript object
        Sleep   2s
        Page should contain         Chat Transcript Name
        Page should contain         Chat Visitor
        Page should contain         Start Time
        Page should contain         End Time
        Page should contain         Status

Web Chat - Sharing visibility of transcripts - RIT agent

    [Tags]  TTCS20-4856-02

        Login as WebChat RIT agent User
        Reset View (if applicable)
        Sleep   3s
        Navigate to the Chat Transcript object
        Sleep   2s
        Page should contain         Chat Transcript Name
        Page should contain         Chat Visitor
        Page should contain         Start Time
        Page should contain         End Time
        Page should contain         Status

Web Chat - Update to Chat Transcript record layout, fields and values

    [Tags]  TTCS20-4852

        Login as WebChat Case Management User
        Reset View (if applicable)
        Sleep   3s
        Navigate to the Chat Transcript object
        Sleep   2s
        Select the List View titled EFC WebChat
        Sleep       5s
        Click Element       ${first-list-option}
        Sleep   5s
        Wait until keyword succeeds   12s      2s       Click Element   ${details-tab}

        Page should not contain     Visitor Details
        Page should not contain     Chat Visitor
        Page should not contain     Visitor IP Address
        Page should not contain     Referring Site
        Page should not contain     Browser Language
        Page should not contain     Screen Resolution
        Page should not contain     User Agent

        Page should contain element         ${chat-transcript-component}
        Page should contain         Chat Transcript Name
        Page should contain         Status
        Page should contain         Owner
        Page should contain         Outcome
        Page should contain         Request Time
        Page should contain         End Time


Web Chat - Add Chat Transcript related list to Case related tab

    [Tags]  TTCS20-4984

        Go To Salesforce login
        Login as WebChat Case Management User
        Sleep   3s
        Reset View (if applicable)
        Navigate to the Chat Transcript object
        Select the List View titled EFC WebChat
        Navigate to details tab in the case
        User opens Case record from Chat Transcript Record
        Sleep  3s
	    Click Related Tab
	    Execute javascript       window.scrollTo(0,1000)
	    Page should contain      Chat Transcripts
	    Sleep    2s
	    Click element                //span[@title="Chat Transcripts"]
	    Sleep    2s
	    Page should contain          Chat Transcript Name
	    Page should contain          Status
	    Page should contain          Outcome
	    Page should contain          Chat Duration


Web Chat-outcome field mandatory
    [Tags]  TTCS20-5390

    Login as WebChat Case Management User
    Sleep   3s
    Reset View (if applicable)
    Navigate to the Chat Transcript object
    Sleep   2s
    Select the List View titled EFC WebChat
    Sleep       5s
    Click Element       ${first-list-option}
    Sleep   5s
    Wait until keyword succeeds   12s      2s       Click Element   ${details-tab}
    Sleep  5s
    double click element  ${outcome_edit}
    Click Save
    page should contain   Review the following fields
    page should contain    Outcome
    Click Cancel


Web Chat - Non-Webchat agents should not be able to select pencil or edit buttons
        [Tags]  TTCS20-5352

        Login as WebChat Quality Assurance User
        Sleep   3s
        Reset View (if applicable)
        Navigate to the Chat Transcript object
        Select the List View titled EFC WebChat
        Sleep   5s
        Click Element       ${request-time-column}
        Navigate to details tab in the case
        Page Should Not Contain Element    //button[@name='Edit']
        Page Should Not Contain Element    (//button[@title='Edit Outcome'])[1]
        Page Should Not Contain Element    (//button[@title='Edit Ended By'])[1]