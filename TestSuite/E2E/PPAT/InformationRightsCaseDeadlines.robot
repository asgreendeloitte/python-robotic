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
Resource    ../../../Resources/EnquiriesConsole/GlobalButtons.robot


Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1
*** Variables ***
${date-time-opened-field}            (//*[@class="test-id__field-value slds-form-element__static slds-grow word-break-ie11 is-read-only"])[3]
${violation_milestone}               (//*[@class=" unchecked"])[1]
${extended_violation_milestone}      (//*[@class=" unchecked"])[2]
${targetdate-milestone}              (//*[@class="uiOutputDateTime"])[1]
${case-origination-date}             (//*[@name="Case_Origination_Date_Time__c"])[1]
${violation_milestone_check}         (//*[@class=" checked"])[1]
${target-time}                       (//*[@class="uiOutputText"])
${ext-edit}                          (//*[@data-key="edit"])[2]
${ext-deadline-date}                 (//*[@class=" input"])[1]
${ext-time-rem}                      (//*[@class="test-id__field-value slds-form-element__static slds-grow  is-read-only"])[1]
#(//*[@class="test-id__field-value slds-form-element__static slds-grow  is-read-only"])[1]
#(//*[@class="uiOutputNumber"])[2]

*** Test Cases ***

Information Rights Deadlines
    [Tags]  TTCS20-5800

    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  5s
	Click Edit
    Click Drop Down By Name              Case type
    Select Dropdown Option               Freedom of Information
    Click Save
    Sleep  3s
	page should contain     Target Date
    page should contain     Time Remaining
    page should contain     Violation
    page should contain element   ${date-time-opened-field}
    page should contain element   ${violation_milestone}
    Sleep  3s
    page should contain     Extended Deadline Date
    page should contain     Extended Deadline Reason
    page should contain     Time remaining to Extended Deadline
    page should contain     Extended Deadline Violation
    page should contain element   ${extended_violation_milestone}
    page should contain element   ${date-time-opened-field}
    page should contain element   ${violation_milestone}
    Sleep  3s
    ${target-date}=     Get Text  ${targetdate-milestone}
    ${exp-target-date}=    Get Date & Time on Banner2   20
    Should Contain Any  ${target-date}    ${exp-target-date}
    Sleep  3s
    #validating by updating case deadline date
    Click Edit
    Click Drop Down By Name              Case type
    Select Dropdown Option               Data Subject Access Requests
    Click Save
    Sleep  3s
    Sleep  3s
    ${target-date}=     Get Text  ${targetdate-milestone}
    ${dsar-exp-target-date}=    Get Date & Time on Banner2   20
    Should Contain Any  ${target-date}    ${dsar-exp-target-date}
    Click Edit
    Click Drop Down By Name              Case type
    Select Dropdown Option               FOI Consultations
    Click Save
    Sleep  3s
    ${target-date}=     Get Text  ${targetdate-milestone}
    Should Contain Any  ${target-date}    ${exp-target-date}
    Click Edit
    Click Drop Down By Name              Case type
    Select Dropdown Option               Environmental Information Regulations
    Click Save
    Sleep  5s
    ${target-date}=     Get Text  ${targetdate-milestone}
    ${eir-exp-target-date}=    Get Date & Time on Banner2   19
    Should Contain Any  ${target-date}    ${eir-exp-target-date}
    Click Edit
    Click Drop Down By Name              Case type
    Select Dropdown Option               Access to Health Records
    Click Save
    Sleep  5s
    ${target-date}=     Get Text  ${targetdate-milestone}
    ${athr-exp-target-date}=    Get Date & Time on Banner2   13
    Should Contain Any  ${target-date}    ${athr-exp-target-date}
    Click Edit
    Click Drop Down By Name              Case type
    Select Dropdown Option               Coroners Requests
    Click Save
    Sleep  5s
    ${target-date}=     Get Text  ${targetdate-milestone}
    ${coroners-exp-target-date}=    Get Date & Time on Banner2   48
    Should Contain Any  ${target-date}    ${coroners-exp-target-date}
    Click Edit
    Click Drop Down By Name              Case type
    Select Dropdown Option               Internal Review
    Click Save
    Sleep  5s
    ${target-date}=     Get Text  ${targetdate-milestone}
    ${exp-target-date}=    Get Date & Time on Banner2   20
    Should Contain Any  ${target-date}    ${exp-target-date}
    Click Edit
    Click Drop Down By Name              Case type
    Select Dropdown Option               Information Commissioners Office
    Click Save
    Sleep  5s
    ${target-date}=     Get Text  ${targetdate-milestone}
    ${ico-exp-target-date}=    Get Date & Time on Banner2   19
    Should Contain Any  ${target-date}    ${ico-exp-target-date}
    Click Element    ${ext-edit}
    Input Text   ${ext-deadline-date}       17/06/2023
    Sleep  3s
    Execute javascript  window.scrollTo(0,2000)
    Scroll Element Into View     (//*[contains(text(),'Time remaining to Extended Deadline')])[2]
    Sleep  3s
    Press Keys      (//*[@class=" label bBody"])[4]   Tab
    Sleep  3s
    Check Error Message Content for ExtendedDeadline
    Sleep  3s
    Press Keys      //*[@icon-name="utility:close"]   Tab
    Sleep  3s
    Click Drop Down By Name (bug fix)   Extended Deadline Reason
    Select Drop down option1     DSAR Complexity
    Scroll Element Into View     (//*[contains(text(),'Extended Deadline Violation')])[2]
    Sleep  3s
    Press Keys      (//*[@class=" label bBody"])[4]   Tab
    Sleep   5s
    page should not contain     Target Date
    page should not contain     Time Remaining
    page should not contain     Violation:
    page should not contain element   ${target-time}
    #validating violation true when the target date is past
    Click Element    ${ext-edit}
    Input Text   ${ext-deadline-date}       10/01/2023
    Sleep  3s
    Press Keys      (//*[@class=" label bBody"])[4]   Tab
    Sleep  3s
    page should contain element   ${violation_milestone_check}
    #validating time remaining when the status is set to close
    Click Edit
    Execute javascript  window.scrollTo(0,800)
    Sleep  3s
    Scroll Element Into View    //input[@placeholder='Search Live Issues...']
    Sleep  3s
    Click Drop Down By Name         Status
    Select Drop down option         Closed
    Click Drop Down By Name         Outcome
    Select Drop down option         Not applicable
    Click Drop Down By Name         Disclosure Position
    Select Drop down option         Information Released
    Click Element                   //button[@aria-label='Information Published, --None--']
    Click Element                   //lightning-base-combobox-item[@data-value='No']
    Click Drop Down By Name         ExCo Group
    Select Drop down option         People
    Click Drop Down By Name         Category
    Click Element                   //lightning-base-combobox-item[@data-value= 'Commercial']
    Click Drop Down By Name         Subcategory
    Click Element                   //lightning-base-combobox-item[@data-value= 'Contracts']
    Input Text   //input[@name='SuppliedEmail']       test@gmail.com
    Sleep  3s
    Click Save
    Sleep  3s
    page should contain element         (//*[contains(text(),'0.00')])[2]
    Sleep  3s
    Click Related Tab
    Click Case History section
    page should contain   Extended Deadline Date
    page should contain   Closed