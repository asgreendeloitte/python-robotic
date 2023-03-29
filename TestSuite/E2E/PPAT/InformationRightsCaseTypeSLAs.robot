*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library    DateTime

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
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/RelatedTab.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/Milestones.robot


Test Setup      Open Browser and Go To Salesforce Login
#Test Teardown   End Test1
*** Variables ***
${date-time-opened-field}            (//*[@class="test-id__field-value slds-form-element__static slds-grow word-break-ie11 is-read-only"])[3]
${violation_milestone}               (//*[@class=" unchecked"])[1]
${targetdate-milestone}              (//*[@class="uiOutputDateTime"])[1]
${case-origination-date}             (//*[@name="Case_Origination_Date_Time__c"])[1]
${violation_milestone_check}         (//*[@class=" checked"])[1]
${target-time}                       (//*[@class="uiOutputText"])

*** Test Cases ***

Information Rights SLA
    [Tags]  TTCS20-5795

    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
    Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  3s
	Click Edit
    Click Drop Down By Name         Case type
    Select Drop down option         Environmental Information Regulations
    Click Save
    Sleep  5s
    page should contain     Target Date
    page should contain     Time Remaining
    page should contain     Violation
    page should contain element   ${date-time-opened-field}
    page should contain element   ${violation_milestone}
    Sleep  3s
    ${target-date}=     Get Text  ${targetdate-milestone}
    ${exp-target-date}=    Get Date & Time on Banner2   19
    Should Contain Any  ${target-date}    ${exp-target-date}
    Sleep  3s
    Click Edit
    Click Drop Down By Name         Case type
    Select Drop down option         Access to Health Records
    Click Save
    Sleep  3s
     ${target-date}=     Get Text  ${targetdate-milestone}
    ${exp-target-date}=    Get Date & Time on Banner calendardays  22
    Should Contain Any  ${target-date}    ${exp-target-date}
    Click Edit
    Click Drop Down By Name         Case type
    Select Drop down option         Freedom of Information
    Click Save
    Sleep  3s
     ${target-date}=     Get Text  ${targetdate-milestone}
    ${exp-target-date}=    Get Date & Time on Banner2   20
    Should Contain Any  ${target-date}    ${exp-target-date}
    Sleep  3s
    Click Edit
    Click Drop Down By Name         Case type
    Select Drop down option         FOI Consultations
    Click Save
    Sleep  3s
     ${target-date}=     Get Text  ${targetdate-milestone}
    ${exp-target-date}=    Get Date & Time on Banner2   20
    Should Contain Any  ${target-date}    ${exp-target-date}
    Sleep  3s
     Click Edit
    Click Drop Down By Name         Case type
    Select Drop down option         Data Subject Access Requests
    Click Save
    Sleep  3s
     ${target-date}=     Get Text  ${targetdate-milestone}
    ${exp-target-date}=    Get Date & Time on Banner calendardays  29
    Should Contain Any  ${target-date}    ${exp-target-date}
    Sleep  3s
     Click Edit
    Click Drop Down By Name         Case type
    Select Drop down option         Information Commissioners Office
    Click Save
    Sleep  3s
     ${target-date}=     Get Text  ${targetdate-milestone}
    ${exp-target-date}=    Get Date & Time on Banner2   17
    Should Contain Any  ${target-date}    ${exp-target-date}
    Sleep  3s
    Click Edit
    Click Drop Down By Name         Case type
    Select Drop down option         Coroners Requests
    #Input Text   ${case-origination-date}       01/01/2023
    Click Save
    Sleep  3s
     ${target-date}=     Get Text  ${targetdate-milestone}
    ${exp-target-date}=    Get Date & Time on Banner calendardays  57  #to update to 56 when day-light savings are turned on
    Should Contain Any  ${target-date}    ${exp-target-date}
    Sleep  3s
    Click Edit
    Click Drop Down By Name         Case type
    Select Drop down option         Internal Review
    Click Save
    Sleep  5s
     ${target-date}=     Get Text  ${targetdate-milestone}
    ${exp-target-date}=    Get Date & Time on Banner2   20
    Should Contain Any  ${target-date}    ${exp-target-date}
    Sleep  3s
    Click Edit
    Execute javascript  window.scrollTo(0,800)
    Sleep  3s
    Scroll Element Into View    //input[@placeholder='Search Live Issues...']
    Sleep  3s
    #validating by updating case origin date
    Input Text   ${case-origination-date}       13/02/2023
    Click Save
    Sleep  3s
    ${new-target-date}=    Get Text  ${targetdate-milestone}
    Should Contain Any   ${new-target-date}      13/03/2023
    ${trgt-time}=      Get Text   ${target-time}
    Should Not Contain Any    ${trgt-time}     00:00
    #validating violation true when the target date is past
    Sleep  3s
    Click Edit
    Execute javascript  window.scrollTo(0,800)
    Sleep  3s
    Scroll Element Into View    //input[@placeholder='Search Live Issues...']
    Sleep  3s
    #validating by updating case origin date
    Input Text   ${case-origination-date}       13/01/2023
    Click Save
    Sleep  3s
    ${new-target-date}=    Get Text  ${targetdate-milestone}
    Should Contain Any   ${new-target-date}      10/02/2023
    page should contain element   ${violation_milestone_check}
    #validating time remaining when the status is set to close
    Click Edit
    Execute javascript  window.scrollTo(0,800)
    Sleep  3s
    Scroll Element Into View    //input[@placeholder='Search Live Issues...']
    Sleep  3s
    Click Drop Down By Name         Status
    Select Drop down option         Closed
    Sleep  3s
    Click Save
    Sleep  3s
    ${target-time1}=    Get Text   ${target-time}
    Should Contain Any    ${target-time1}      00:00



